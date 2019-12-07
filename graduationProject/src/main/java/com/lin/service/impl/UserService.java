package com.lin.service.impl;

import com.lin.dao.IaccountDao;
import com.lin.dao.IlinDao;
import com.lin.domain.Lin;
import com.lin.domain.Product;
import com.lin.domain.User;
import com.lin.service.IuserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;


@Service("userservice")
public class UserService implements IuserService {

    @Autowired
    public IaccountDao iaccountDao;
    @Autowired
    public IlinDao ilinDao;
    public List<User> findall() {


        return iaccountDao.findall();
    }

    @Override
    public User findById(String id) {
        return iaccountDao.findById(id);
    }

    @Override
    public void saveAccout() {
        System.out.printf("ggggg ");

    }

    @Override
    public User login(String name, String password) {

        return iaccountDao.login(name, password);
    }


    //管理员添加用户信息
    @Override
    public void saveUser(User user) {
        iaccountDao.saveUser(user);

    }
    //向lin1表传uid的值   insert  into lin1 values(null,27,20,uid)
    @Override
    public void insertLin1(Integer n) {
        iaccountDao.insertLIn1(n);
    }





    @Override
    public void delUser(String id) {
        iaccountDao.delUser(id);
    }

    @Override//修改用户信息
    public void updateUser(User user) {
             iaccountDao.updateUser(user);
    }

    @Override//删除lin1中uid相同的最后一个数据
    public void deleteLin1(Integer n) {
            iaccountDao.deleteLin1(n);
    }

    //查询lin1中相同UID的终端数量
    @Override
    public int findLIn1ByUid(Integer n) {
        return iaccountDao.findLin1ByUid(n);
    }


    //查询lin用户的终端信息
    @Override
    public List<Lin> findDate() {

        return ilinDao.findall();
    }
    //根据uid查询lin1的所有信息
    @Override
    public List<Lin> findAllByUid(int n) {
        return ilinDao.findAllByUid(n);
    }
    //查询用户名是否存在
    @Override
    public User userNameIsFind(String username) {


        return iaccountDao.userNameIsFind(username);
    }


    //模拟硬件数据写到数据库
    @Override
    public void writeData() {
        //循环内创建对象  很消耗内存 一般不建议
        //每次循环体执行完后，循环体内定义的代码块局部变量、对象如果没有被继续引用，
        // 就立即被销毁了；即obj变量、new出来的对象都被销毁了。
        //System.out.println("模拟写数据了————————");
//          for (int i=0;i<30;i++){
//              Random random=new Random();
//              int c=random.nextInt(10);
//
//              int c1=random.nextInt(20);
//              Product product=new Product();
//              product.setPid(30);
//              product.setTemperature(27.2+c);
//              product.setHumidity(45.3+c1);
//
//              Date dNow = new Date( );
//              SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
//
//              //System.out.println("当前时间为: " + ft.format(dNow));
//
//              product.setHistorytime(ft.format(dNow));
//              ilinDao.insertProduct(product);
//          }


          }


    //调用终端的历史记录
    @Override
    public List<Product> findHistoryData(String tableName) {
        return ilinDao.findHistoryData(tableName);
    }


    //创建终端的数据表
    @Override
    public void createProductTable(String tableName) {
        ilinDao.createProductTable(tableName);
    }


    //删除终端数据表
    @Override
    public void dropProductTable(String tableName) {
        ilinDao.dropProductTable(tableName);
    }

}



