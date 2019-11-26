package com.lin.UI.adminServlet;

import com.lin.domain.User;
import com.lin.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/updateuser")
public class UpdateUser {

    @Autowired
    public UserService userService;
//根据id查出用户信息 再把用户信息回显在updateuser.jsp
    @RequestMapping("showUser")
    public ModelAndView showUser(HttpServletRequest request){
        String id=request.getParameter("id");
       User user=userService.findById(id);
        System.out.println("修改前的用户数据"+user);


        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("user",user);
        modelAndView.setViewName("/updateuser");
        return modelAndView;

    }
    //用户信息修改好提交
    @RequestMapping("update")
    public ModelAndView update(User user1){

        System.out.println("修改后的用户数据"+user1);
        userService.updateUser(user1);

        int user_n=user1.n;//获取要修改的终端数量
        //获取数据库lin1表中终端数量x；
        int lin1_x=userService.findLIn1ByUid(user1.id);
        System.out.printf("user_n"+user_n+" lin_x"+lin1_x);
        //判断修改后的n和数据库的lin1表中的数量对比
        // 如果n>lin1的终端数量x，则执行n-x次插入语句
        // 1  向lin1表传uid的值   insert  into lin1 values(null,27,20,uid)
               if(user_n>lin1_x){
                   int i=user_n-lin1_x;
                   for(int j=0;j<i;j++){
                       userService.insertLin1(user1.id);
                       System.out.println("插入执行了");
                   }
               }


        //    @Insert("insert  into lin1 values(null,27,20,null,#{uid})")
        // 如果n<lin1的终端数量x，且x需要>0才则执行n-x次删除语句 每次删除的是uid的最后一条数据
        if (lin1_x>0) {
            if (user_n < lin1_x) {
                int i = lin1_x -user_n ;

                for (int j = 0; j < i; j++) {

                    userService.deleteLin1(user1.id);
                    System.out.println("删除执行了");
                }
            }
        }

        //重新对用户进行查找，并跳转到administrator页面 更新用户信息
        List<User> users1=userService.findall();

//        //在控制台显示所有用户信息
//        for(User user1 :users){
//            System.out.println(user1+"dfjdhfjkdh");
//        }
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("users",users1);
        modelAndView.setViewName("/administrator");
        return modelAndView;
    }

}
