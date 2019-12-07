package com.lin.dao;

import com.lin.domain.Lin;

import com.lin.domain.Product;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IlinDao {

    //用户lin的数据
    @Select("select * from lin1")
    public List<Lin> findall();


    //根据uid查询lin1表的所有信息
    @Select("select * from lin1 where uid=#{uid}")
    public List<Lin> findAllByUid(@Param("uid") Integer n);

    //模拟写硬件数据传到数据库
    @Insert("insert into product1 values(#{pid},#{temperature},#{humidity},#{historyTime})")
    public void insertProduct(Product product);

    //查找终端的历史记录
    @Select("select * from ${tableName}")
    public List<Product> findHistoryData(@Param("tableName") String tableName);


    //动态创建终端数据表
    @Update("create table ${tableName}( pid int default 30," +
            " temperature double," +
            " humidity double," +
            " historytime varchar(20))" +
            " ENGINE=InnoDB DEFAULT CHARSET=utf8")
    public void createProductTable(@Param("tableName") String tableName);


    //动态删除终端数据表
    @Update("drop table if exists ${tableName}")
    public void dropProductTable(@Param("tableName") String tableName);


}
