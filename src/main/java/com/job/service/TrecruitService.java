package com.job.service;

import com.job.model.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Created by Zhangxq on 2016/7/15.
 */
public interface TrecruitService {//接口里面变量默认是公共、静态、最终，方法默认是public、abstract

    int deleteByPrimary(Integer recruitid);

    List<Trecruit> selectAllRecruit(Integer num,HttpSession session);

    List<Trecruit> selectRecruitBySite(String site);

    int addrecruit(Trecruit trecruit) throws IOException;

    Tfirmuser getFirmUserByUserid(int userid);

    Tinduser selectByUserid(Integer userid);

    Trecruit selectByRecruitId(Integer recruitid);

    int addApply(Tapply tapply);

    int getPersonidByUserid(Integer userid);

    int getCompanyid(int userid);

    List<Trecruit> selectByCompanyId(Integer companyid);

    List<Tapply> selectApplyByRecruitId(Integer recruitid);

    List<Trecruit> queryJobByUser(String jobName,String  workAddr);

    /*简历STEP1:查询基本信息*/
    Tinduser BaseInfoByPersonid(Integer personid);

    /*简历STEP2:查询教育信息*/
    List<Teduexp> eduExpBypersonId(Integer personid);

    /*简历STEP3:查询工作经历*/
    List<Tworkexp> workExpBypersonId(Integer personid);

    int updateBaseInfo(Tinduser tinduser);

    int updateEduInfo(Teduexp teduexp);
    int updateWorkInfo(Tworkexp tworkexp);

    int delEduExp(Integer eduexpid);

    int delWorkExp(Integer workexpid);


    int updateByRecruitid(Trecruit trecruit);

    int deleteByRecruitId(Integer recruitid);

    Tuser getUserIdByOpenid(String openid);
    int InsertOpenid(Tuser tuser);

    List<Tapply> selectApplyByPersonId(Integer personid);

    int deleteByPrimaryKey(Integer applyid);

    List<Tapply> selectApplyByCompanyId(Integer companyid);

    String getOpenidByUserId(Integer userid);

    void updateClickByPrimaryKey(Integer personid);


    List<Tfirmuser> selectByCompanyName(String companyname);
}
