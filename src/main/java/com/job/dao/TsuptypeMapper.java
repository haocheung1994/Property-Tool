package com.job.dao;

import com.job.model.Tsuptype;

import java.util.List;

public interface TsuptypeMapper {
    int deleteBysupType(Integer suptype);

    int insert(Tsuptype record);

    int insertSelective(Tsuptype tsuptype);

    Tsuptype selectSuptype(Integer suptype);

    int updateByPrimaryKeySelective(Tsuptype record);

    int updateByPrimaryKey(Tsuptype record);

    List<Tsuptype> selectAllType();
}