package com.lin.UI.adminServlet;

import com.lin.domain.Lin;
import com.lin.domain.User;
import com.lin.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/deluser")
public class DelUser {
    @Autowired
    public UserService userService;

    @RequestMapping("/deleteUser")
    public ModelAndView deleteUser(HttpServletRequest request){


        String id=request.getParameter("id");
        //System.out.println("id=="+id);
        //管理员的id==1， 不允许删除
        if (!id.equals("1")){
             //先删除终端历史记录表  再删除用户表
            //删除终端的历史记录表
            //1获取终端的表的终端信息
            int uid=Integer.valueOf(id);
            List<Lin> linList=userService.findAllByUid(uid);
            //System.out.println("删除的终端信息"+linList);
            //2 删除对应的终端历史数据库
            for (Lin lin:linList
                 ) {
                int id1=lin.id;//获取终端信息的id
                int uid1=lin.uid;//获取终端信息的uid
                //终端历史数据表名的格式是product_uid_id
               userService.dropProductTable("product_"+uid1+"_"+id1);
                //System.out.println("删除历史记录表了---"+"product"+uid1+id1);
            }
            //用户表和lin1表（终端表 加了级联更新和级联删除  固删除用户表的数据 ，终端表的数据也相应的删除 ）
            userService.delUser(id);


        }

        //重新对用户进行查找，并跳转到administrator页面 更新用户信息
        List<User> users=userService.findall();
         ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("users",users);
        modelAndView.setViewName("/administrator");
        return modelAndView;
    }
}
