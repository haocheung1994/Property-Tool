package com.job.dao;

import com.job.model.Tuser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TuserMapper {
    int deleteByPrimaryKey(Integer userid);

    int insert(Tuser record);

    int insertSelective(Tuser record);

    Tuser selectByPrimaryKey(Integer userid);

    int updateByPrimaryKeySelective(Tuser record);

    int updateByPrimaryKey(Tuser record);

    int userRegiter(Tuser tuser);

    Tuser selectLoginUser(@Param("usertel") String usertel, @Param("userpwd") String userpwd);

    List<Tuser> selectSpecifiedUser(@Param("usertel") String usertel, @Param("userpwd") String userpwd);


    int updateByUserId(@Param("usertype") String usertype, @Param("userid") Integer userid);

    Tuser getUserIdByOpenid(String openid);

    String getOpenidByUserId(Integer userid);
}