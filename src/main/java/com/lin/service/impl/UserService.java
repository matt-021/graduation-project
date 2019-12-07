package com.lin.service.impl;

import com.lin.dao.IaccountDao;
import com.lin.dao.IlinDao;
import com.lin.domain.Lin;
import com.lin.domain.User;
import com.lin.service.IuserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


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


}
