package com.lin.UI.adminServlet;

import com.lin.domain.Lin;
import com.lin.domain.User;
import com.lin.service.impl.UserService;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Supplier;
import java.util.logging.Logger;

@Controller
@RequestMapping("/adduser")
public class AddUser {


    @Autowired
    public UserService userService;
    //点击添加用户按钮触发
    @RequestMapping("/addButton")
    public ModelAndView addButton()
    {
        //重定向的方式
        return new ModelAndView("redirect:/page/add.jsp");


        //转发的方式
       // return new ModelAndView("add");

    }
    //添加用户页面点击提交触发
    @RequestMapping("/add")
    public ModelAndView add(User user){
        //System.out.println(user);
        //User{id=null, name='小林', password='123', age='男', address='美国', email='61265', telephone='156', n=3}
        //保存用户表

        userService.saveUser(user);
        //获取用户的id  需要进行数据库的查询  根据已有的方法 只能掉用以下的方法进行查询
        User userNow=userService.login(user.name,user.password);
        //System.out.println(userNow.id);
        //并在lin1表中插入n条语句（即终端有几个，就插入几次）
        for(int i=0;i<user.n;i++) {
            //logger.info("哈哈");
            userService.insertLin1(userNow.id);

        }
        //获取刚才的在lin1表（终端表）插入的数据
        List<Lin> linList=userService.findAllByUid(userNow.id);
        for (Lin lin:linList
             ) {
            int id=lin.id;
            int uid=lin.uid;
            //创建终端的历史数据表 有几个就创建几个数据表 终端历史数据表名的格式是product_uid_id
            userService.createProductTable("product_"+uid+"_"+id);
            //System.out.println("创建终端历史数据表了");
            //System.out.println("product"+uid+id);
        }

        //重新对用户进行查找，并跳转到administrator页面 更新用户信息
        List<User> users=userService.findall();
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("users",users);
        modelAndView.setViewName("/administrator");
        return modelAndView;

    }
    //异步验证用户名是否存在  方式1
//      @ResponseBody这个注解通常使用在控制层（controller）的方法上，其作用是将方法的返回值以特定的格式写入到response的body区域，
//     进而将数据返回给客户端。当方法上面没有写ResponseBody,底层会将方法的返回值封装为ModelAndView对象。

//     假如是字符串则直接将字符串写到客户端,假如是一个对象，此时会将对象转化为json串然后写到客户端。这里需要注意的是，
//     如果返回对象,按utf-8编码。如果返回String，默认按iso8859-1编码，页面可能出现乱码。因此在注解中我们可以手动修改编码格式，
//     例如@RequestMapping(value="/cat/query",produces="text/html;charset=utf-8")，前面是请求的路径，后面是编码格式。

//      那么，控制层方法的返回值是如何转化为json格式的字符串的呢？其实是通过HttpMessageConverter中的方法实现的，
//       因为它是一个接口，因此由其实现类完成转换。如果是bean对象，会调用对象的getXXX（）方法获取属性值并且以键值对的形式进行封装，
//        进而转化为json串。如果是map集合，采用get(key)方式获取value值，然后进行封装。
//


//使用@ResponseBody  需要在pom.xml导入
// <dependency>
//      <groupId>com.fasterxml.jackson.core</groupId>
//      <artifactId>jackson-databind</artifactId>
//      <version>2.9.4</version>
//    </dependency>
    @RequestMapping("/checkUserName")
    @ResponseBody
    public Map<String,Object> checkUserName(String username){
//        System.out.println(username);


        //.调用service层判断用户名是否存在 返回的是user
        User user=userService.userNameIsFind(username);
        //System.out.println(user);
        Map<String,Object> map = new HashMap<String,Object>();
        //响应回的数据格式：{"userExsit":true,"msg":"此用户名已存在,请更换一个"}
        //                 或者{"userExsit":false,"msg":"用户名可用"}
        if(user!=null){
            //存在
            //System.out.println("存在");
            map.put("userExsit",true);
            map.put("msg","此用户名已存在,请更换一个");
        }else{
            //不存在
            //System.out.println("不存在");
            map.put("userExsit",false);
            map.put("msg","用户名可用");
        }

        return map;


    }




}
