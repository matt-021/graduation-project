package com.lin.UI.servlet;


import com.lin.domain.Lin;
import com.lin.domain.User;

import com.lin.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/login")
public class Login {

    @Autowired
    public UserService userService;

//    由首页跳转到登入页面
    @RequestMapping("/tiaozhuan")
    public String tiaozhuan(){

        return "redirect:/page/login.jsp";
    }

    /*点击登入按钮时
    通过用户名和密码进行用户验证
    1 管理员（管理员只有一位 ，即id等于1）则跳转到管理员页面
    2 普通用户 则跳转到用户页面
    */
    @RequestMapping("/loginSuccess")
    public ModelAndView loginSuccess(String name, String password, ModelMap modelMap, Model model,RedirectAttributes redirectAttributes) throws Exception {

        //根据用户的姓名和密码查找数据库
        User user = userService.login(name, password);

        if (user != null) {
             if (user.id==1){//id=1 即
                 //取出数据库的用户表的所有信息
                 List<User> users=userService.findall();

//                //在控制台显示所有用户信息
//                 for(User user1 :users){
//                     System.out.println(user1);
//                 }
                 //把集合中的用户信息传到jsp中  转发的方式
                 ModelAndView modelAndView=new ModelAndView();
                 modelAndView.addObject("users",users);
                 modelAndView.setViewName("/administrator");
                 return modelAndView;

             }else {
                 //普通用户登入，并把该用户的信息放回jsp页面


                 //根据uid查询终端的所有信息 如果查到的终端数量为0，则jsp页面上如果调用get（）获取数据会报长度为0的索引0越界
                 //目前想到的解决的办法是  判断如何数据为0  则加一个空的javabeen Lin类；
                 List<Lin> date=userService.findAllByUid(user.id);
//                 System.out.println("返回的终端集合长度"+date.size());
                 if(date.size()==0){
                     date.add(new Lin());
                 }

//                 for(Lin date1 :date){
//                     System.out.println(date1);
//                 }
                 //创建一个集合  装载该用户信息和该用户的所有终端信息  并返回给jsp页面
                 //*
                 ArrayList userAndDate=new ArrayList();
                 userAndDate.add(user);
                 userAndDate.add(date);
                 ModelAndView modelAndView=new ModelAndView();
                 modelAndView.addObject("userAndDate",userAndDate);
                 modelAndView.setViewName("/success");

                 return modelAndView;
             }

        } else {

         //这里用它的addAttribute方法，这个实际上重定向过去以后你看url，是它自动给你拼了你的url
            redirectAttributes.addAttribute("fail", "账户或者密码错误");
            return new ModelAndView("redirect:/page/login.jsp");
        }


    }


}
