package com.lin.service;

import com.lin.domain.Lin;
import com.lin.domain.User;

import java.util.List;

public interface IuserService {
    //查找用户信息 并返回用户集合
    public List<User> findall();


    //根据用户id查找用户信息
    public User findById(String id);

    public void saveAccout();

    //登入
    public User login(String name, String password);



    //管理员添加用户信息
    public void saveUser(User user);
    //向lin1表传uid的值   insert  into lin1 values(null,27,20,null,uid)
    public void insertLin1(Integer n);




    //管理员根据id来删除用户
    public void delUser(String id);

    //管理员修改用户

    public void updateUser(User user);
    //修改用户终端lin1表的数据  插入或者删除
    //插入语句调用上面的insertLin1（n）方法
    //删除lin1中uid相同的最后一个数据
    public void deleteLin1(Integer n);
    //查询lin1中相同UID的终端数量
    public int findLIn1ByUid(Integer n);


    //查询lin用户的终端信息
    public List<Lin> findDate();


    //根据uid查询lin1的所有信息
    public List<Lin> findAllByUid(int n);


    //查询用户名是否存在
    public User userNameIsFind(String username);

}
