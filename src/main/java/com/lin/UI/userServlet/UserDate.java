package com.lin.UI.userServlet;

import com.lin.domain.Lin;
import com.lin.domain.User;
import com.lin.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/userdate")
public class UserDate {
    @Autowired
    public UserService userService;

//    根据用户查找终端的数据
    @ResponseBody
    @RequestMapping("finddate")
    public List<Lin> userdate(int id){
        List<Lin> date=userService.findAllByUid(id);
        System.out.println("返回的终端集合长度======="+date.size());
        if(date.size()==0){
            date.add(new Lin());
        }

        for(Lin date1 :date){
            System.out.println(date1);
        }
        return date;
    }
}
