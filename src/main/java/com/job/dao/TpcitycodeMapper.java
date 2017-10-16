package com.job.dao;

import com.job.model.Tpcitycode;

public interface TpcitycodeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Tpcitycode record);

    int insertSelective(Tpcitycode record);

    Tpcitycode selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Tpcitycode record);

    int updateByPrimaryKey(Tpcitycode record);
}