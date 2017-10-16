package com.job.dao;

import com.job.model.Tinduser;

import java.util.List;

public interface TinduserMapper {
    int deleteByPrimaryKey(Integer personid);

    int insert(Tinduser record);

    int insertSelective(Tinduser record);

    Tinduser selectByPrimaryKey(Integer personid);

    int updateByPrimaryKeySelective(Tinduser record);

    int updateByPrimaryKey(Tinduser record);

    Tinduser selectByUserid(Integer userid);

    int getPersonidByUserid(Integer userid);

    /*简历STEP1:查询基本信息*/
    Tinduser BaseInfoByPersonid(Integer personid);


    int updateBaseInfo(Tinduser tinduser);

    List<Tinduser> selectResumeList();
}