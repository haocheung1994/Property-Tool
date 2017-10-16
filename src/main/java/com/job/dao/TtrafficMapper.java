package com.job.dao;

import com.job.model.Ttraffic;

public interface TtrafficMapper {
    int deleteByPrimaryKey(Integer signid);

    int insert(Ttraffic record);

    int insertSelective(Ttraffic record);

    Ttraffic selectByPrimaryKey(Integer signid);

    int updateByPrimaryKeySelective(Ttraffic record);

    int updateByPrimaryKey(Ttraffic record);
}