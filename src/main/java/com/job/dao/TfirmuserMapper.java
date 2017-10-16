package com.job.dao;

import com.job.model.Tfirmuser;

import java.util.List;

public interface TfirmuserMapper {
    int deleteByPrimaryKey(Integer companyid);

    int insert(Tfirmuser record);

    int insertSelective(Tfirmuser record);

    Tfirmuser selectByPrimaryKey(Integer companyid);

    int updateByPrimaryKeySelective(Tfirmuser record);

    int updateByPrimaryKey(Tfirmuser record);

    Tfirmuser getFirmUserByUserid(int userid);

    int getCompanyid(int userid);

    List<Tfirmuser> selectByCompanyName(String companyname);

    Tfirmuser selectBycompanyId(Integer companyid);
}