package com.lin.dao;

import com.lin.domain.Account;
import com.lin.domain.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface IaccountDao {

    @Select("select * from user")
    public List<User> findall();

//     @Insert("INSERT INTO account(name,money) VALUES(#{name},#{money})")
//     public void saveAccout(Account account);测试用的

     @Select("select * from user where name=#{name} and password=#{password}")
     public User login(@Param("name") String name,@Param("password") String password);

     //添加用户
     @Insert("insert into user (name,password,age,address,email,telephone,n)values(#{name},#{password},#{age},#{address},#{email},#{telephone},#{n})")
     public  void saveUser(User user);
    //向lin1表传uid的值   insert  into lin1 values(null,27,20,null,uid)
    @Insert("insert  into lin1 values(null,27,50,null,#{uid})")
     public void insertLIn1(@Param("uid")Integer n);

     //删除用户
    @Delete("delete from user where id=#{id}")
    public void delUser(String id);

    //根据用户ID查询用户信息
    @Select("select * from user where id=#{id}")
    public User findById(String id);

    //根据用户的id修改用户信息
    @Update("update user set name=#{name},password=#{password},age=#{age},address=#{address},email=#{email},telephone=#{telephone},n=#{n} where id=#{id}")
    public void updateUser(User user);
    //删除lin1中uid相同的最后一个数据
    @Delete("delete from lin1 where id=(select i from(select max(id) i from lin1 where uid=#{uid})as a);")
    public void deleteLin1(@Param("uid")Integer n);
    //查询lin1中相同uid的终端数量
    @Select("select count(id) from lin1 where uid=#{uid};")
    public int findLin1ByUid(@Param("uid") Integer n);



    //查询用户名是否存在
    @Select("select * from user where name=#{username}")
    public User userNameIsFind(String username);
}
