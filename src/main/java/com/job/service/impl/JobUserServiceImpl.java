package com.job.service.impl;

import com.job.dao.*;
import com.job.model.*;
import com.job.service.JobUserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Zhangxq on 2016/7/15.
 */

@Service
@Transactional(rollbackFor = Exception.class)
public class JobUserServiceImpl implements JobUserService {
    
   @Resource
   TuserMapper tuserMapper;
   @Resource
   TinduserMapper tinduserMapper;
   @Resource
   TfirmuserMapper tfirmuserMapper;
   @Resource
    TworkexpMapper tworkexpMapper;
   @Resource
    TeduexpMapper teduexpMapper;
    @Resource
    TbannerMapper tbannerMapper;
   public int userRegiter(Tuser tuser){
      return tuserMapper.userRegiter(tuser);

   }

 /*  登录用户是否存在*/
   public List<Tuser> loginValidate(String usertel,String userpwd){

      return tuserMapper.selectSpecifiedUser(usertel, userpwd);
   }

    public Tfirmuser selectBycompanyId(Integer companyid){
        return tfirmuserMapper.selectBycompanyId(companyid);
    }

   /*登录用户信息查询*/
   public Tuser selectLoginUser(String usertel,String userpwd){

      return tuserMapper.selectLoginUser(usertel, userpwd);
   }






    public int updateByUserId(String usertype,Integer userid){

        return tuserMapper.updateByUserId(usertype, userid);
    }
    public int insertSelectiveByinduser (Tinduser tinduser){

        return  tinduserMapper.insertSelective(tinduser);
    }

    public int insertSelectiveByfirmuser(Tfirmuser record){

        return tfirmuserMapper.insertSelective(record);
    }

    public int queryPersonId(Integer userid){

        return tinduserMapper.selectByUserid(userid).getPersonid();
    }

    public int insertWorkExp(Tworkexp tworkexp){

        return tworkexpMapper.insertSelective(tworkexp);
    }

    public int insertEduExp(Teduexp teduexp){

        return teduexpMapper.insertSelective(teduexp);
    }

    public List<Tinduser> selectResumeList(){
        return tinduserMapper.selectResumeList();
    }


    public List<Tbanner> selectIndexban(){
        return tbannerMapper.selectIndexban();
    }

    public  Tbanner selectByPrimaryKey(Integer banId){
        return tbannerMapper.selectByPrimaryKey(banId);
    }

    public int updateByPrimaryKeySelective(Tbanner record){
        return tbannerMapper.updateByPrimaryKeySelective(record);
    }

}
