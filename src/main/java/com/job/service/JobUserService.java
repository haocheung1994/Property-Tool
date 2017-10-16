package com.job.service;

import com.job.model.*;

import java.util.List;

/**
 * Created by Zhangxq on 2016/7/15.
 */
public interface JobUserService {

    int userRegiter(Tuser tuser);

    List<Tuser> loginValidate(String usertel, String userpwd);

    Tuser selectLoginUser(String usertel, String userpwd);

    Tfirmuser selectBycompanyId(Integer companyid);

    List<Tinduser> selectResumeList();

    int updateByUserId(String usertype, Integer userid);

    int insertSelectiveByinduser(Tinduser record);

    int insertSelectiveByfirmuser(Tfirmuser record);

    int queryPersonId(Integer userid);

    int insertWorkExp(Tworkexp tworkexp);

    int insertEduExp(Teduexp teduexp);

    List<Tbanner> selectIndexban();

    Tbanner selectByPrimaryKey(Integer banId);

    int updateByPrimaryKeySelective(Tbanner record);

}
