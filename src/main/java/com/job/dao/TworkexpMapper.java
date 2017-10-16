package com.job.dao;

import com.job.model.Tworkexp;

import java.util.List;

public interface TworkexpMapper {
    int deleteByPrimaryKey(Integer workexpid);

    int insert(Tworkexp record);

    int insertSelective(Tworkexp record);

    Tworkexp selectByPrimaryKey(Integer workexpid);

    int updateByPrimaryKeySelective(Tworkexp record);

    int updateByPrimaryKey(Tworkexp record);

    /*简历STEP3:查询工作经历*/
    List<Tworkexp> workExpBypersonId(Integer personid);
}