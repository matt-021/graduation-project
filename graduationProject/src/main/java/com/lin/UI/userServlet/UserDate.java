package com.lin.UI.userServlet;

import com.lin.domain.Lin;
import com.lin.domain.Product;
import com.lin.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/userdate")
public class UserDate {
    @Autowired
    public UserService userService;

//    根据用户查找终端的数据
    @ResponseBody
    @RequestMapping("finddate")
    public List<Lin> userdate(int uid){
        List<Lin> date=userService.findAllByUid(uid);
        //System.out.println("返回的终端集合长度======="+date.size());
        if(date.size()==0){
            date.add(new Lin());
        }

//        for(Lin date1 :date){
//            System.out.println(date1);
//        }
        return date;
    }

    //点击终端圆圈div块 查找历史记录页面
    @RequestMapping("findhistory")
    public String findhistory(int id,int uid){
       //System.out.println(id+""+uid);
        //System.out.println("接口请求完毕");
        return "history";
    }


    //查找终端的历史记录
    @ResponseBody
    @RequestMapping("findHistoryData")
    public List<Product> findHistoryData(String id,String uid){
       // System.out.println(id+"  ===="+uid);
        List<Product> productLists=userService.findHistoryData("product_"+uid+"_"+id);

//        List<Double> temprature =new ArrayList();
//        for (Product p:productLists
//             ) {
//            temprature.add(p.temperature);
//        }
//        System.out.println("温度为"+temprature);
        return productLists;
    }

}
