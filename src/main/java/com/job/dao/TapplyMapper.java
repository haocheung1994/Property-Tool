package com.job.dao;

import com.job.model.Tapply;

import java.util.List;

public interface TapplyMapper {
    int deleteByPrimaryKey(Integer applyid);

    int insert(Tapply record);

    int insertSelective(Tapply record);

    Tapply selectByPrimaryKey(Integer jobapplyid);

    int updateByPrimaryKeySelective(Tapply record);

    int updateByPrimaryKey(Tapply record);

    int addApply(Tapply tapply);

    List<Tapply> selectApplyByRecruitId (Integer recruitid);

    List<Tapply> selectApplyByPersonId(Integer personid);

    List<Tapply> selectApplyByCompanyId(Integer companyid);

    void updateClickByPrimaryKey(Integer personid);
}