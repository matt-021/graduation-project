package com.lin.UI.adminServlet;

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
        //管理员的id==1， 不允许删除
        if (!id.equals("1")){

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
