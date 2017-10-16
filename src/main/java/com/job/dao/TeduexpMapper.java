package com.job.dao;

import com.job.model.Teduexp;

import java.util.List;

public interface TeduexpMapper {
    int deleteByPrimaryKey(Integer eduexpid);

    int insert(Teduexp record);

    int insertSelective(Teduexp record);

    Teduexp selectByPrimaryKey(Integer eduexpid);

    int updateByPrimaryKeySelective(Teduexp record);

    int updateByPrimaryKey(Teduexp record);

    /*简历STEP2:查询教育信息*/
   List<Teduexp> eduExpBypersonId(Integer personid);





}