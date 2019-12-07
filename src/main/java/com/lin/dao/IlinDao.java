package com.lin.dao;

import com.lin.domain.Lin;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
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


}
