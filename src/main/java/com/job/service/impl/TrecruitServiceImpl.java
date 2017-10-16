package com.job.service.impl;

import com.job.dao.*;
import com.job.model.*;
import com.job.service.PositionService;
import com.job.service.TrecruitService;
import com.job.utils.LocationUtils;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * Created by Zhangxq on 2016/7/15.
 */

@Service
@Transactional(rollbackFor = Exception.class)
public class TrecruitServiceImpl implements TrecruitService {

    @Resource
    TrecruitMapper trecruitMapper;
    @Resource
    TinduserMapper tinduserMapper;
    @Resource
    TfirmuserMapper tfirmuserMapper;
    @Resource
    TapplyMapper tapplyMapper;
    @Resource
    TeduexpMapper teduexpMapper;
    @Resource
    TworkexpMapper tworkexpMapper;

    @Resource
    TuserMapper tuserMapper;
    @Autowired
    PositionService positionService;
    public  int deleteByPrimary(Integer recruitid){
        return trecruitMapper.deleteByPrimary(recruitid);
    }

    public List<Trecruit> selectAllRecruit(Integer num,HttpSession session) {
        List<Trecruit> trecruitList = trecruitMapper.selectAllRecruit(num);
        if (session.getAttribute("lng") != null && session.getAttribute("lat") != null) {
            String lat = (String) session.getAttribute("lat");
            String lng = (String) session.getAttribute("lng");
            double lat0 = Double.parseDouble(lat);
            double lng0 = Double.parseDouble(lng);
            Collections.sort(trecruitList, new Comparator<Trecruit>() {
                @Override
                public int compare(Trecruit o1, Trecruit o2) {
                    double lat1 = Double.parseDouble(o1.getLat());
                    double lng1 = Double.parseDouble(o1.getLng());
                    double lat2 = Double.parseDouble(o2.getLat());
                    double lng2 = Double.parseDouble(o2.getLng());
                    Double d1 = LocationUtils.getDistance(lat0, lng0, lat1, lng1);
                    Double d2 = LocationUtils.getDistance(lat0, lng0, lat2, lng2);
                    return d1.compareTo(d2);
                }
            });
        }
        return trecruitList;
    }

    public List<Trecruit> selectRecruitBySite(String site) {

        return trecruitMapper.selectRecruitBySite(site);
    }

    //加入坐标
    public int addrecruit(Trecruit trecruit) throws IOException {
        String address = trecruit.getWorkaddr().trim();
        JSONObject jsonObject = positionService.getLALODetail(address);
        if (jsonObject.get("result") != null) {
            JSONObject result = jsonObject.getJSONObject("result");
            if (result.get("location") != null) {
                JSONObject location = result.getJSONObject("location");
                trecruit.setLng(location.getString("lng"));
                trecruit.setLat(location.getString("lat"));
            }
        }
        return trecruitMapper.addrecruit(trecruit);

    }

    /*进入系统时根据已填写字段判断是否要进入完善信息界面返回的查询值*/

    public Tinduser selectByUserid(Integer userid) {

        return tinduserMapper.selectByUserid(userid);
    }

    public Tfirmuser getFirmUserByUserid(int userid) {

        return tfirmuserMapper.getFirmUserByUserid(userid);
    }

    public Trecruit selectByRecruitId(Integer recruitid) {

        return trecruitMapper.selectByRecruitId(recruitid);
    }

    /*添加职位申请*/
    public int addApply(Tapply tapply) {

        return tapplyMapper.addApply(tapply);
    }


    public int getPersonidByUserid(Integer userid) {

        return tinduserMapper.getPersonidByUserid(userid);
    }


    public int getCompanyid(int userid) {

        return tfirmuserMapper.getCompanyid(userid);
    }

    public List<Trecruit> selectByCompanyId(Integer companyid) {

        return trecruitMapper.selectByCompanyId(companyid);
    }

    public List<Tapply> selectApplyByRecruitId(Integer recruitid) {

        return tapplyMapper.selectApplyByRecruitId(recruitid);
    }

    public List<Trecruit> queryJobByUser(String jobName, String workAddr) {
        return trecruitMapper.queryJobByUser(jobName, workAddr);
    }

    /*简历STEP1:查询基本信息*/
    public Tinduser BaseInfoByPersonid(Integer personid) {

        return tinduserMapper.BaseInfoByPersonid(personid);
    }


    /*简历STEP2:查询教育信息*/
    public List<Teduexp> eduExpBypersonId(Integer personid) {

        return teduexpMapper.eduExpBypersonId(personid);
    }

    /*简历STEP3:查询工作经历*/
    public List<Tworkexp> workExpBypersonId(Integer personid) {

        return tworkexpMapper.workExpBypersonId(personid);
    }

    public int updateBaseInfo(Tinduser tinduser) {

        return tinduserMapper.updateBaseInfo(tinduser);
    }

    //htt-已修改
    public int updateEduInfo(Teduexp teduexp) {
        return teduexpMapper.updateByPrimaryKeySelective(teduexp);
    }

    public int updateWorkInfo(Tworkexp tworkexp) {
        return tworkexpMapper.updateByPrimaryKeySelective(tworkexp);
    }

    public int delEduExp(Integer eduexpid) {
        return teduexpMapper.deleteByPrimaryKey(eduexpid);
    }

    public int delWorkExp(Integer workexpid) {
        return tworkexpMapper.deleteByPrimaryKey(workexpid);
    }


    public int updateByRecruitid(Trecruit trecruit) {
        return trecruitMapper.updateByRecruitid(trecruit);
    }

    public int deleteByRecruitId(Integer recruitid) {
        return trecruitMapper.deleteByRecruitId(recruitid);
    }

    public Tuser getUserIdByOpenid(String openid) {
        return tuserMapper.getUserIdByOpenid(openid);
    }

    public int InsertOpenid(Tuser tuser) {
        return tuserMapper.insertSelective(tuser);
    }

    public List<Tapply> selectApplyByPersonId(Integer personid) {
        return tapplyMapper.selectApplyByPersonId(personid);

    }


    public int deleteByPrimaryKey(Integer applyid) {
        return tapplyMapper.deleteByPrimaryKey(applyid);
    }

    public List<Tapply> selectApplyByCompanyId(Integer companyid) {
        return tapplyMapper.selectApplyByCompanyId(companyid);
    }

    public String getOpenidByUserId(Integer userid) {
        return tuserMapper.getOpenidByUserId(userid);
    }


    public void updateClickByPrimaryKey(Integer personid) {
        tapplyMapper.updateClickByPrimaryKey(personid);
    }

    public List<Tfirmuser> selectByCompanyName(String companyname){
        return tfirmuserMapper.selectByCompanyName(companyname);
    }

}
