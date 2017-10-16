package com.job.dao;

import com.job.model.Tcitycode;

import java.util.List;

public interface TcitycodeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Tcitycode record);

    int insertSelective(Tcitycode record);

    List<Tcitycode> selectByPrimaryKey();//所有省市

    Tcitycode selectByid(Integer id);

    int updateByPrimaryKeySelective(Tcitycode record);

    int updateByPrimaryKey(Tcitycode record);
}