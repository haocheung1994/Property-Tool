package com.job.dao;

import com.job.model.Tbanner;

import java.util.List;

public interface TbannerMapper {
    int deleteByPrimaryKey(Integer banId);

    int insert(Tbanner record);

    int insertSelective(Tbanner record);

    Tbanner selectByPrimaryKey(Integer banId);

    int updateByPrimaryKeySelective(Tbanner record);

    int updateByPrimaryKey(Tbanner record);

    List<Tbanner> selectIndexban();
}