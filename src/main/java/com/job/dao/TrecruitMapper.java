package com.job.dao;

import com.job.model.Trecruit;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TrecruitMapper {
    int deleteByPrimary(Integer recruitid);

    int insert(Trecruit record);

    int insertSelective(Trecruit record);

    Trecruit selectByPrimaryKey(Integer recruitid);

    int updateByPrimaryKeySelective(Trecruit record);

    int updateByPrimaryKey(Trecruit record);

    List<Trecruit> selectAllRecruit(Integer num);

    List<Trecruit> selectRecruitBySite(String site);

    int addrecruit(Trecruit trecruit);

    Trecruit selectByRecruitId(Integer recruitid);

    List<Trecruit> selectByCompanyId(Integer companyid);

    List<Trecruit> queryJobByUser(@Param("jobName") String jobName, @Param("workAddr") String workAddr);

    List<Trecruit>selectStepRecruit(@Param("start")Integer start,@Param("end")Integer end);

    int deleteByRecruitId(Integer recruitid);

    int updateByRecruitid(Trecruit trecruit);

    List<Trecruit> selectAll();

}