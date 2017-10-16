package com.job.controller;

import com.job.dao.TfirmuserMapper;
import com.job.dao.TtrafficMapper;
import com.job.dao.TuserMapper;
import com.job.entity.oauth.OauthToken;
import com.job.entity.oauth.UserInfo;
import com.job.model.*;
import com.job.service.JobUserService;
import com.job.service.PositionService;
import com.job.service.TrecruitService;

import com.job.service.WeixinUtilService;
import com.job.utils.GetLocalTimes;

import com.weixin.service.TemplateMessageService;
import com.weixin.service.WxSettingService;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Zhangxq on 2016/7/15.
 */

@Controller
/*@RequestMapping("/RecruitModule")*/
public class TrecruitController {

    private Logger log = Logger.getLogger(TrecruitController.class);
    @Resource
    private TrecruitService trecruitService;
    @Resource
    private TuserMapper tuserMapper;
    @Resource
    private TtrafficMapper ttrafficMapper;

    @Resource
    private JobUserService jobuserService;

    @Resource
    private WeixinUtilService weixinUtilService;

    @Resource
    private TemplateMessageService templateMessageService;

    @Resource
    WxSettingService wxSettingService;

    @Resource
    TfirmuserMapper tfirmuserMapper;

    @Resource
    PositionService positionService;

    /*发布新招聘信息*/
    @RequestMapping("/addrecruit")
    public String addrecruit(String jobname, String salary, String welfare, String jobdescribe,
                             String workaddr, String workreq, String edureq, String worktype,
                             Integer userid) throws Exception {
        String nowTime=GetLocalTimes.getNowTime();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date d = dateFormat.parse(nowTime);
        Integer companyid=trecruitService.getCompanyid(userid);//获得companyid
        Trecruit trecruit=new Trecruit();
        trecruit.setCompanyid(companyid);
        trecruit.setJobname(jobname);
        trecruit.setSalary(salary);
        trecruit.setWelfare(welfare);
        trecruit.setJobdescribe(jobdescribe);
        trecruit.setWorkaddr(workaddr.trim());
        trecruit.setWorkreq(workreq);
        trecruit.setEdureq(edureq);
        trecruit.setWorktype(worktype);
        trecruit.setPubtime(d);
        if(trecruitService.addrecruit(trecruit)>0){
            return "/RecruitModule/complete";}
        else return "/RecruitModule/post_position";
    }

    @RequestMapping("/recruitinfo")
    public String recruitinfo(Integer recruitid,HttpServletRequest request, HttpServletResponse response)  {

        Trecruit trecruit=trecruitService.selectByRecruitId(recruitid);
        request.setAttribute("trecruit", trecruit);
        return "recruitinfo";
    }

    @RequestMapping("/applyjob")
    public String applyJob(Integer userId,Integer recruitId,Integer companyid,String jobname,String companyname8,String companyname,String salary,String addr,Integer firmuserid,HttpServletResponse response,HttpServletRequest request) throws ParseException, IOException {
        int personid = trecruitService.getPersonidByUserid(userId);
        List<Tapply> applyList1=trecruitService.selectApplyByPersonId(personid);

        for(Tapply Temp : applyList1) {

            if(Temp.getRecruitid().equals(recruitId)) {
                return "/RecruitModule/failed";
            }
        }

        if (userId == null) {
            return "login";
        } else {
            String wechatcompanyname=new String();
            String wechattel=new String();
            String nowTime = GetLocalTimes.getNowTime();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date = dateFormat.parse(nowTime);
            System.out.println(personid);
            Tapply tapply = new Tapply();
            tapply.setCompanyid(companyid);
            tapply.setApplytime(date);
            tapply.setPersonid(personid);//personId
            tapply.setRecruitid(recruitId);
            System.out.println("recruitId" + recruitId+companyid);
            tapply.setCompanyname(companyname);
            tapply.setJobname(jobname);
            tapply.setSalary(salary);


            int var = trecruitService.addApply(tapply);//完成增加职位申请信息
            if (var > 0) {
                Tfirmuser tfirmuser=tfirmuserMapper.selectByPrimaryKey(companyid);
                //组合推送给找工作的人的map数据
                final String finalWechatcompanyname = wechatcompanyname;
                if(companyid==8){
                    wechatcompanyname=companyname8;
                    wechattel="未知";
                }else {
                    wechatcompanyname = companyname;
                    wechattel= tfirmuser.getCompanytel();
                }

                final String finalWechatcompanyname1 = wechatcompanyname;
                final String finalWechattel = wechattel;
                Map<String,Map> jobfinders=new HashMap<String,Map>(){
                    {
                        put("first", new HashMap<String, String>() {
                            {
                                put("value", "您刚完成申请一个职位\n");
                            }
                        });
                        put("keyword1", new HashMap<String, String>() {
                            {
                                put("value", jobname+"\n");
                            }
                        });
                        put("keyword2", new HashMap<String, String>() {
                            {
                                put("value", finalWechatcompanyname1 +"\n");
                            }
                        });
                        put("keyword3", new HashMap<String, String>() {
                            {
                                put("value", new SimpleDateFormat("yyyy年MM月dd日").format(new Date())+"\n");
                            }
                        });
                        put("keyword4", new HashMap<String, String>() {
                            {
                                put("value", "投递成功\n");
                            }
                        });
                        put("keyword5", new HashMap<String, String>() {
                            {
                                put("value", finalWechattel +"\n");
                            }
                        });
                        put("remark", new HashMap<String, String>() {
                            {
                                put("value", "物业宝(平台)");
                            }
                        });
                    }

                };
                //推送给找工作的人的一些参数
                String openid=(String)request.getSession().getAttribute("oppen_id");
                String jobTemplate_id="efQnh9DBi1iWH-42uKs4BSXofhkHfV3_2v3Ck4Ln6Qo";
                String url=wxSettingService.selectByPrimaryKey(1).getLink()+"/applyInfo?recruitid="+recruitId;
                String firmOpenid=trecruitService.getOpenidByUserId(firmuserid);
                System.out.println("firmOpenid:"+firmOpenid+firmuserid);
                String firmTemplate_id="sANpJ3CK4Szqh5MLEwxkBA1nVn_rLov7fZUf99FBhnw";
                String resumeurl=wxSettingService.selectByPrimaryKey(1).getLink()+"/thisResume?personid="+personid;//

                Tinduser tinduser=trecruitService.selectByUserid(userId);


                //推送给公司


                Map<String,Map> firms=new HashMap<String,Map>(){
                    {
                        put("first", new HashMap<String, String>() {
                            {
                                put("value", "你发布的职位收到了一条职位申请\n");
                            }
                        });
                        put("keyword1", new HashMap<String, String>() {
                            {
                                put("value", tinduser.getPersonname()+"\n");
                            }
                        });
                        put("keyword2", new HashMap<String, String>() {
                            {
                                put("value", tinduser.getPersontel()+"\n");
                            }
                        });
                        put("keyword3", new HashMap<String, String>() {
                            {
                                put("value", jobname+"\n");
                            }
                        });
                        put("keyword4", new HashMap<String, String>() {
                            {
                                put("value", companyname+"\n");
                            }
                        });
                        put("remark", new HashMap<String, String>() {
                            {
                                put("value", "物业宝(平台)");
                            }
                        });
                    }
                };
                templateMessageService.toJobFinder(openid,jobTemplate_id,url,jobfinders);
                templateMessageService.toJobFinder(firmOpenid,firmTemplate_id,resumeurl,firms);
                return "/RecruitModule/complete";
            } else {
                return "/RecruitModule/failed";
            }
        }
    }





    /*登录公司所有发布的招聘信息*/
    @RequestMapping("/showapply")
    public String showapply(HttpServletRequest request, HttpServletResponse response,Integer userid){
        int companyid=trecruitService.getCompanyid(userid);/*公司登录时获取companyId的值*/
        List<Trecruit> recruitList= trecruitService.selectByCompanyId(companyid);

        request.getSession().setAttribute("recruitList", recruitList);//返回所有该公司发布的招聘职位
        return "/RecruitModule/my_recruit";
    }


    /*显示该招聘工作下的所有申请*/
    @RequestMapping("/applylist")
    public String  applyList(HttpServletRequest request,Integer recruitid){
        List<Tapply> itemapplylist=trecruitService.selectApplyByRecruitId(recruitid);
        request.setAttribute("itemapplylist", itemapplylist);

        return "applylist";
    }


    //htt

    @RequestMapping("/basicInfoSub")
    public String basicInfoSub(HttpServletRequest request,Tinduser tinduser,String openid, HttpSession session) {
        System.out.println("BASICINFO");
        System.out.println(tinduser.getPersonname());
        System.out.println("/basicInfoSub-->" + "Userid::" + tinduser.getUserid());
        System.out.println("openid:" + openid);
        String usertype="个人";

        if (!openid.equals("")&&openid!=null){
            try{
            Tuser tuser=new Tuser();
            tuser.setOpenid(openid);
            tuser.setUsertype(usertype);
            trecruitService.InsertOpenid(tuser);
            Integer userid=trecruitService.getUserIdByOpenid(openid).getUserid();
            System.out.println("userid:" + userid);
            tinduser.setUserid(userid);
            //插入个人信息表
            jobuserService.insertSelectiveByinduser(tinduser);

            request.getSession().setAttribute("userId", userid);
            request.getSession().setAttribute("loginUser", tuser);
            List<Trecruit> trecruitList=trecruitService.selectAllRecruit(950,session);
            request.setAttribute("trecruitList", trecruitList);
            return "/RecruitModule/recruit_index";
            }catch (Exception e){
                return "/index/error";
            }

        }
        else //使用登录注册方式--备用
        {
            Integer userid = tinduser.getUserid();
            //修改userType
            jobuserService.updateByUserId(usertype, userid);

            //插入个人信息表
            jobuserService.insertSelectiveByinduser(tinduser);

            return "";
        }



    }
    @RequestMapping("/test123")
    public String test123(){
        System.out.println("trsd122");
        return "jsp/search";
    }

    @RequestMapping("/firmInfoSub")
    public String firmInfoSub(HttpServletRequest request, HttpServletResponse response,Tfirmuser tfirmuser,String openid, HttpSession session) {
        System.out.println("/firmInfoSub-->" + "userId::" + tfirmuser.getUserid());
        String usertype="企业";
        if (!openid.equals("")&&openid!=null){
            Tuser tuser=new Tuser();
            tuser.setOpenid(openid);
            tuser.setUsertype(usertype);
            trecruitService.InsertOpenid(tuser);
            Integer userid=trecruitService.getUserIdByOpenid(openid).getUserid();
            System.out.println("userid:" + userid);
            tfirmuser.setUserid(userid);
            //插入企业信息表
            jobuserService.insertSelectiveByfirmuser(tfirmuser);

            request.getSession().setAttribute("userId", userid);
            request.getSession().setAttribute("loginUser", tuser);
            List<Trecruit> trecruitList=trecruitService.selectAllRecruit(950,session);
            request.setAttribute("trecruitList", trecruitList);
            return "/RecruitModule/recruit_index";
        }
        else
        {//使用登录注册方式--备用
            Integer userid = tfirmuser.getUserid();
            //修改userType
            jobuserService.updateByUserId(usertype, userid);

            //插入企业信息表
            jobuserService.insertSelectiveByfirmuser(tfirmuser);
            return "";
        }


    }


    /*选择身份*/
    //记得判断userType为空，再进入选择角色页面
    @RequestMapping("/chooserole")
    public String chooserole(Integer userid )  {

        Tuser tuser=tuserMapper.selectByPrimaryKey(userid);
        String userType = tuser.getUsertype();
        System.out.println("userType:" + userType);
        if (userType==null || userType == "" || userType.isEmpty())//使用运算符短路原则，前面条件成立，则不执行后续条件
            return "/jsp/chooserole";
        else
            return "/jsp/search";

    }

    @RequestMapping("/searchJob")
    public String searchJob(HttpServletRequest request,String jobName,String workAddr){
        if(workAddr==null||workAddr==""){
            request.getSession().setAttribute("site","工作地点(选择家附近的职位)");
        }
        else{
        request.getSession().setAttribute("site",workAddr);
        }
        List<Trecruit> myrecruitList=trecruitService.queryJobByUser(jobName, workAddr);//查询潜在招聘信息
        List<Tfirmuser> tfirmusers=trecruitService.selectByCompanyName(jobName);
        if(tfirmusers!=null){
            request.setAttribute("tfirmusers", tfirmusers);
        }
        if(myrecruitList!=null) {
            request.setAttribute("myrecruitList", myrecruitList);
        }
        return "/RecruitModule/search_result";
    }

    /* 查询全部简历信息*/
    @RequestMapping("/myResume")
    public String myResume(HttpServletRequest request,Integer userid){
        Integer personid=trecruitService.getPersonidByUserid(userid);
        /*STEP1:查询基本信息*/
        Tinduser tinduser=trecruitService.BaseInfoByPersonid(personid);
        /*STEP2:查询教育经历*/
        List<Teduexp> teduexplist=trecruitService.eduExpBypersonId(personid);
        /*STEP3:查询工作经历*/
        List<Tworkexp> tworkexplist=trecruitService.workExpBypersonId(personid);
        request.getSession().setAttribute("BasicInfo", tinduser);
        request.getSession().setAttribute("eduExpList", teduexplist);
        request.getSession().setAttribute("workExpList", tworkexplist);
        return "/RecruitModule/resume";
    }

    /* 查询个人简历信息*/
    @RequestMapping("/viewResume")
    public String viewResume(HttpServletRequest request,Integer userid,Integer applyid){


        Integer personid=trecruitService.getPersonidByUserid(userid);
        trecruitService.updateClickByPrimaryKey(applyid);  /*将click值置为1*/
        /*STEP1:查询基本信息*/
        Tinduser tinduser=trecruitService.BaseInfoByPersonid(personid);
        /*STEP2:查询教育经历*/
        List<Teduexp> teduexplist=trecruitService.eduExpBypersonId(personid);
        /*STEP3:查询工作经历*/
        List<Tworkexp> tworkexplist=trecruitService.workExpBypersonId(personid);
        request.setAttribute("BasicInfo", tinduser);
        request.setAttribute("eduExpList", teduexplist);
        request.setAttribute("workExpList", tworkexplist);
        return "/RecruitModule/resume_view";
    }

/*   跳转全部简历中的某个详细简历*/


    @RequestMapping("/thisResume")
    public String thisResume(HttpServletRequest request,Integer personid){
       /*STEP1:查询基本信息*/
        Tinduser tinduser=trecruitService.BaseInfoByPersonid(personid);
        /*STEP2:查询教育经历*/
        List<Teduexp> teduexplist=trecruitService.eduExpBypersonId(personid);
        /*STEP3:查询工作经历*/
        List<Tworkexp> tworkexplist=trecruitService.workExpBypersonId(personid);
        if(teduexplist.size()==0){request.setAttribute("edulog",0);}
            else{request.setAttribute("edulog",1);}
        if(tworkexplist.size()==0){request.setAttribute("worklog",0);}
            else{request.setAttribute("worklog",1);}
        request.setAttribute("BasicInfo", tinduser);
        request.setAttribute("eduExpList", teduexplist);
        request.setAttribute("workExpList", tworkexplist);
        return "/RecruitModule/resume_view";
    }

    /*跳转全部简历*/
    @RequestMapping("/jumpallresume")
    public String jumpallresume(HttpServletRequest request){

        List<Tinduser> tindusers=jobuserService.selectResumeList();
        request.setAttribute("tinduserList",tindusers);
        return "/RecruitModule/resume_list";
    }





    /*跳转教育信息中转页*/
    @RequestMapping("/eduinfo")
    public String eduInfo(HttpServletRequest request,Integer userid){
        Integer personid=trecruitService.getPersonidByUserid(userid);
         /*STEP2:查询教育经历*/
        List<Teduexp> teduexplist=trecruitService.eduExpBypersonId(personid);
        request.setAttribute("eduExpList", teduexplist);
        return "/RecruitModule/edu_exp";

    }


    /*跳转添加教育经历*/
    @RequestMapping("/neweduexp")
    public String neweduexp(){
        return "/RecruitModule/add_edu";
    }

    /*跳转到求职招聘模块主页面*/
    @RequestMapping("/recruitModule")
    public String recruitModule(HttpServletRequest request, HttpSession session)throws Exception{
        List<Trecruit> trecruitList=trecruitService.selectAllRecruit(950,session);
        request.setAttribute("trecruitList", trecruitList);
        return "/RecruitModule/recruit_index";

    }

    /*显示所有招聘信息*/
    @RequestMapping("/recruit")
    public String Register(HttpServletRequest request, HttpServletResponse response, HttpSession session
    ) throws Exception {
        List<Trecruit> trecruitList=trecruitService.selectAllRecruit(0,session);
        request.setAttribute("trecruitList", trecruitList);
        return "RecruitModule/position";

    }

    /*显示所有招聘信息*/
    @RequestMapping("/basicInfoEdit")
    public void basicInfoEdit(String personname,String birthtime,String personsex,String otherinf,HttpServletRequest request,
                                String personcity,String workyear,String persontel,String personemail,Integer userid ) throws Exception {
        System.out.println(userid);
        System.out.println(birthtime);

        String usertype="个人";
        //修改userType
        jobuserService.updateByUserId(usertype, userid);

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date birthT=null;
        try{
            System.out.println(personname+"@"+birthT+"@"+personsex+"@"+otherinf+"@"+workyear+"@"+persontel+"@"+personemail+"@"+userid);
            birthT = dateFormat.parse(birthtime);
            Tinduser tinduser=new Tinduser();
            tinduser.setPersonname(personname);
            tinduser.setBirthtime(birthT);
            tinduser.setPersonsex(personsex);
            tinduser.setOtherinf(otherinf);
            tinduser.setWorkyear(workyear);
            tinduser.setPersontel(persontel);
            tinduser.setPersonemail(personemail);
            tinduser.setUserid(userid);
            tinduser.setPersoncity(personcity);
            trecruitService.updateBaseInfo(tinduser);

            List<Tinduser> basicInfolist=(List<Tinduser>)request.getSession().getAttribute("BasicInfo");
            for(Tinduser basicInfoTemp : basicInfolist) {

                if(basicInfoTemp.getUserid().equals(userid)) {

                    basicInfolist.remove(basicInfoTemp);
                    basicInfolist.add(tinduser);
                    break;
                }
            }
            request.getSession().setAttribute("BasicInfo",basicInfolist);


        }catch (Exception e){
            System.out.println("异常");
            System.out.println(e.getCause());
        }

    }

    //htt
    //htt-已修改
    @RequestMapping("/workExpSub")
    public String workExpSub(HttpServletRequest request,Integer userid,String companyname,String jobname,String starttime,
                             String endtime,String workduty ){
        System.out.println("/workExpSub-->");
        System.out.println("userid:"+userid);
        System.out.println("starttime:"+starttime);

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date start=null,end=null;
        try{
            start = dateFormat.parse(starttime);
            end   = dateFormat.parse(endtime);
        }catch (Exception e){
            System.out.println(e.getCause());
        }
        Tworkexp tworkexp=new Tworkexp();
        tworkexp.setCompanyname(companyname);
        tworkexp.setJobname(jobname);
        tworkexp.setStarttime(start);
        tworkexp.setEndtime(end);
        tworkexp.setWorkduty(workduty);

        //查询userId对应的personId
        Integer personId =jobuserService.queryPersonId(userid);
        //插入工作经历
        tworkexp.setPersonid(personId);


        int res= jobuserService.insertWorkExp(tworkexp);

        //避免做事务处理,select max
        /*STEP3:查询工作经历*/
        List<Tworkexp> tworkexplist=trecruitService.workExpBypersonId(personId);


        //向workExpList新的工作经历
       /* List<Tworkexp> tworkexplist=(List<Tworkexp>)request.getSession().getAttribute("workExpList");
        tworkexplist.add(tworkexp);*/
        request.getSession().setAttribute("workExpList", tworkexplist);
        return "/RecruitModule/resume";
    }
    //htt-已修改
    @RequestMapping("/eduExpSub")
    public String eduExpSub(HttpServletRequest request,Integer userid,String eduschoolname,String edumajor,String graduationtime,
                            String degree){
        System.out.println("/eduExpSub-->");
        System.out.println("userid:"+userid);
        System.out.println("graduationtime:"+graduationtime);

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date graduationT=null,end=null;
        try{
            graduationT = dateFormat.parse(graduationtime);
            System.out.println("graduationT"+graduationT);
        }catch (Exception e){
            System.out.println(e.getCause());
        }
        Teduexp teduexp=new Teduexp();
        teduexp.setEduschoolname(eduschoolname);
        teduexp.setEdumajor(edumajor);
        teduexp.setGraduationtime(graduationT);
        teduexp.setDegree(degree);

        //查询userId对应的personId
        Integer personId =jobuserService.queryPersonId(userid);
        //插入工作经历
        teduexp.setPersonid(personId);
        int res= jobuserService.insertEduExp(teduexp);

        /*STEP2:查询教育经历*/
        List<Teduexp> teduexplist=trecruitService.eduExpBypersonId(personId);
        //向eduExpList新的教育经历
        /*List<Teduexp> teduexplist=(List<Teduexp>)request.getSession().getAttribute("eduExpList");
        teduexplist.add(teduexp);*/
        request.getSession().setAttribute("eduExpList", teduexplist);

        return "/RecruitModule/resume";

    }

    //编辑教育经历,跳转到教育经历页
    @RequestMapping("/editEduExp")
    public String editEduInfo(HttpServletRequest request,Teduexp teduexp) throws Exception {

        System.out.println("/editEduExp");
        System.out.println("eduexpid:" + teduexp.getEduexpid());
        request.setAttribute("eduExpOld", teduexp);
        return "RecruitModule/edi_edu";
    }

    @RequestMapping("/editEduExpSub")
    public String  editEduExpSub(HttpServletRequest request,String eduschoolname,String edumajor,String graduationtime,
                                 String degree,Integer eduexpid) throws Exception {

        System.out.println("/editEduExpSub");

        Teduexp teduexp=new Teduexp();
        teduexp.setEduexpid(eduexpid);
        teduexp.setEduschoolname(eduschoolname);
        teduexp.setEdumajor(edumajor);
        teduexp.setDegree(degree);

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date graduationT=null;
        try{
            graduationT = dateFormat.parse(graduationtime);
        }catch (Exception e){
            System.out.println(e.getCause());
        }
        teduexp.setGraduationtime(graduationT);
        int res=trecruitService.updateEduInfo(teduexp);
        System.out.println("res" + res);

        List<Teduexp> teduexplist=(List<Teduexp>)request.getSession().getAttribute("eduExpList");
        for(Teduexp eduexpTemp : teduexplist) {

            if(eduexpTemp.getEduexpid().equals(eduexpid)){
                System.out.println(eduexpTemp.getEduexpid());
                teduexplist.remove(eduexpTemp);
                teduexplist.add(teduexp);
                break;
            }
        }
        request.getSession().setAttribute("eduExpList", teduexplist);

        return "RecruitModule/resume";
    }

    @RequestMapping("/deleteEduExp")
    public String  deleteEduExp(HttpServletRequest request,Integer eduexpid) throws Exception {
        System.out.println("/deleteEduExp");
        int res=trecruitService.delEduExp(eduexpid);

        List<Teduexp> teduexplist=(List<Teduexp>)request.getSession().getAttribute("eduExpList");
        for(Teduexp eduexpTemp : teduexplist) {

            if(eduexpTemp.getEduexpid().equals(eduexpid)){
                System.out.println(eduexpTemp.getEduexpid());
                teduexplist.remove(eduexpTemp);
                break;
            }
        }
        request.getSession().setAttribute("eduExpList", teduexplist);
        return "RecruitModule/resume";
    }

    @RequestMapping("/editWorkExp")
    public String editWorkExp(HttpServletRequest request,Tworkexp tworkexp) throws Exception {

        System.out.println("/editWorkExp");
        System.out.println("workexpid:"+tworkexp.getWorkexpid());
        request.setAttribute("workExpOld", tworkexp);
        return "RecruitModule/work_exp_edit";
    }


    @RequestMapping("/editWorkExpSub")
    public String  editWorkExpSub(HttpServletRequest request,Integer workexpid,String companyname,String jobname,String starttime,
                                  String endtime,String workduty) throws Exception {

        System.out.println("/editWorkExpSub");

        Tworkexp tworkexp=new Tworkexp();
        tworkexp.setCompanyname(companyname);
        tworkexp.setJobname(jobname);
        tworkexp.setWorkduty(workduty);

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date startT=null,endT=null;
        try{
            startT = dateFormat.parse(starttime);
            endT = dateFormat.parse(endtime);
        }catch (Exception e){
            System.out.println(e.getCause());
        }
        tworkexp.setStarttime(startT);
        tworkexp.setEndtime(endT);
        tworkexp.setWorkexpid(workexpid);

        int res=trecruitService.updateWorkInfo(tworkexp);
        System.out.println("res" + res);

        List<Tworkexp> tworkexplist=(List<Tworkexp>)request.getSession().getAttribute("workExpList");
        for(Tworkexp workexpTemp : tworkexplist) {

            if(workexpTemp.getWorkexpid().equals(workexpid)){
                System.out.println(workexpTemp.getWorkexpid());
                tworkexplist.remove(workexpTemp);
                tworkexplist.add(tworkexp);
                break;
            }
        }
        request.getSession().setAttribute("workExpList", tworkexplist);
        return "RecruitModule/resume";
    }

    @RequestMapping("/deleteWorkExp")
    public String  deleteWorkExp(HttpServletRequest request,Integer workexpid) throws Exception {
        System.out.println("/deleteWorkExp");
        int res=trecruitService.delWorkExp(workexpid);
        System.out.println("res"+res);

        List<Tworkexp> tworkexplist=(List<Tworkexp>)request.getSession().getAttribute("workExpList");
        for(Tworkexp workexpTemp : tworkexplist) {

            if(workexpTemp.getWorkexpid().equals(workexpid)){
                System.out.println(workexpTemp.getWorkexpid());
                tworkexplist.remove(workexpTemp);
                break;
            }
        }
        request.getSession().setAttribute("workExpList", tworkexplist);
        return "RecruitModule/resume";
    }

    @RequestMapping("/chooserole2")
    public String chooserole2(HttpServletRequest request, HttpSession session)throws IOException {
        return  "/RecruitModule/chooserole2";

    }

    @RequestMapping("/morestatic")
    public String morestatic(HttpServletRequest request, HttpSession session,Integer num)throws IOException {
        System.out.println(num);
        List<Trecruit> trecruitList=trecruitService.selectAllRecruit(num,session);
        request.setAttribute("trecruitList", trecruitList);
        return "/RecruitModule/recruit_index";

    }

    @RequestMapping("/jobHomepage")
    public String jobHomepage(HttpServletRequest request, HttpSession session)throws IOException {
        System.out.println("/jobHomepage");
        String openid=(String)session.getAttribute("oppen_id");
        Tuser tuserByOpenid =new Tuser();
        tuserByOpenid=trecruitService.getUserIdByOpenid(openid);
        //流量统计mark1
        Ttraffic ttraffic=ttrafficMapper.selectByPrimaryKey(1);
        Ttraffic ttraffic1=new Ttraffic();
        ttraffic1.setMark1(ttraffic.getMark1() + 1);
        ttraffic1.setSignid(1);
        ttrafficMapper.updateByPrimaryKeySelective(ttraffic1);

        if(null== tuserByOpenid)
        {
            List<Trecruit> trecruitList=trecruitService.selectAllRecruit(950,session);
            request.setAttribute("trecruitList", trecruitList);
            return "/RecruitModule/recruit_index";
            /*return  "/RecruitModule/chooserole2";*/
        }
        else
        //property_user表中有openid
        {

            request.getSession().setAttribute("userId",tuserByOpenid.getUserid());
            request.getSession().setAttribute("loginUser", tuserByOpenid);
            List<Trecruit> trecruitList=trecruitService.selectAllRecruit(950,session);
            request.setAttribute("trecruitList", trecruitList);
            return "/RecruitModule/recruit_index";
        }
    }

    @RequestMapping("/newHomePage")
    public String newHomePage(HttpServletRequest request,String site) throws UnsupportedEncodingException {

        String Sitename=java.net.URLDecoder.decode(site,"UTF-8");//java : 字符解码
        System.out.println("site=" + site);
        System.out.println("Sitename=" + Sitename);
        request.getSession().setAttribute("site", Sitename);
        List<Trecruit> trecruitList=trecruitService.selectRecruitBySite(Sitename);
        request.setAttribute("trecruitList", trecruitList);
        return "/RecruitModule/recruit_index2";
    }



    /*跳转招聘信息编辑页*/
    @RequestMapping("/editRecruit")
    public String editRecruit(HttpServletRequest request,Integer recruitid){
        Trecruit trecruit=trecruitService.selectByRecruitId(recruitid);

        request.setAttribute("myrecruit", trecruit);
        return "/RecruitModule/recruit_edit";
    }


    @RequestMapping("/applyInfo")
    public String applyInfo(HttpServletRequest request,Integer recruitid){
        Trecruit trecruit=trecruitService.selectByRecruitId(recruitid);
        System.out.println("公司名字"+trecruit.getTfirmuserInAcc().getCompanyname());
        System.out.println("公司id"+trecruit.getRecruitid());
        request.setAttribute("myrecruit", trecruit);
        return "/RecruitModule/position_info";
    }

    @RequestMapping("/companyinfo")
    public String companyinfo(HttpServletRequest request,Integer companyid){
        Tfirmuser tfirmuser=jobuserService.selectBycompanyId(companyid);

        request.setAttribute("tfirmuser", tfirmuser);
        return "/RecruitModule/company_info";
    }



    /*更新招聘信息（编辑）*/
    @RequestMapping("/updaterecruit")
    public String updateRecruit(HttpServletRequest request,Trecruit trecruit){
        int res=trecruitService.updateByRecruitid(trecruit);

        List<Trecruit> recruitList=(List<Trecruit>)request.getSession().getAttribute("recruitList");
        System.out.println(recruitList.size());
        for(Trecruit trecruitTemp : recruitList) {

            if(trecruitTemp.getRecruitid().equals(trecruit.getRecruitid())){
                System.out.println(trecruitTemp.getRecruitid());
                recruitList.remove(trecruitTemp);
                recruitList.add(trecruit);
                break;
            }
        }
        request.getSession().setAttribute("recruitList", recruitList);//返回所有该公司发布的招聘职位

        return "/RecruitModule/complete";
    }

    /*删除招聘信息（编辑）*/
    @RequestMapping("/deleterecruit")
    public String deleteRecruit(HttpServletRequest request,Integer recruitid){

        trecruitService.deleteByRecruitId(recruitid);

        List<Trecruit> recruitList=(List<Trecruit>)request.getSession().getAttribute("recruitList");
        for(Trecruit trecruitTemp : recruitList) {

            if(trecruitTemp.getRecruitid().equals(recruitid)){
                System.out.println(trecruitTemp.getRecruitid());
                recruitList.remove(trecruitTemp);
                break;
            }
        }
        request.getSession().setAttribute("recruitList", recruitList);//返回所有该公司发布的招聘职位



        return "/RecruitModule/complete";
    }
    @RequestMapping("/positionManage")
    public String positionManage(){

        return "/index/manage_position";
    }



    @RequestMapping("/myApplyList")
    public String myApplyList(HttpServletRequest request,Integer userid){
        Integer personid=trecruitService.getPersonidByUserid(userid);
        List<Tapply> myApplyList=trecruitService.selectApplyByPersonId(personid);
        request.setAttribute("myApplyList", myApplyList);
        return "/index/myApplyPage";
    }

    @RequestMapping("/deleteApply")
    public String deleteApply(HttpServletRequest request,Integer userid,Integer applyid){
        int res=trecruitService.deleteByPrimaryKey(applyid);/*删除申请*/

        Integer personid=trecruitService.getPersonidByUserid(userid);
        List<Tapply> myApplyList=trecruitService.selectApplyByPersonId(personid);
        request.setAttribute("myApplyList", myApplyList);
        return "/index/myApplyPage";
    }


    @RequestMapping("/allCompanyApply")
    public String allCompanyApply(HttpServletRequest request,Integer userid){
        Integer companyid=trecruitService.getCompanyid(userid);
        if(companyid!=null) {
            List<Tapply> ComApplyList = trecruitService.selectApplyByCompanyId(companyid);
            System.out.println(ComApplyList);
            request.setAttribute("ComApplyList", ComApplyList);
        }
        return "/index/company_apply";
    }


    // 企业身份登录（招聘人）
    @RequestMapping("/recruiter")
    public String recruiter(HttpServletRequest request, HttpServletResponse response)
    {
        //流量统计mark2
        Ttraffic ttraffic=ttrafficMapper.selectByPrimaryKey(1);
        Ttraffic ttraffic1=new Ttraffic();
        ttraffic1.setMark2(ttraffic.getMark2()+1);
        ttraffic1.setSignid(1);
        ttrafficMapper.updateByPrimaryKeySelective(ttraffic1);

        return "/RecruitModule/firminfo";

    }

    //个人身份（找工作）
    @RequestMapping("/jobfind")
    public String jobfind(HttpServletRequest request, HttpServletResponse response) {

        //流量统计mark3
        Ttraffic ttraffic=ttrafficMapper.selectByPrimaryKey(1);
        Ttraffic ttraffic1=new Ttraffic();
        ttraffic1.setMark3(ttraffic.getMark3() + 1);
        ttraffic1.setSignid(1);
        ttrafficMapper.updateByPrimaryKeySelective(ttraffic1);

        return "/RecruitModule/basicinfo";

    }

    @RequestMapping("/getPosition")
    @ResponseBody
    public JSONObject getPosition(@RequestParam("lo") String lo, @RequestParam("la") String la, HttpSession session) throws IOException {
        System.out.println("经度" + lo + "    " + "维度" + la);
        session.setAttribute("lat",la);
        session.setAttribute("lng",lo);
        JSONObject positon = positionService.getPositionDetail(la, lo);
        System.out.println(positon);
        return positon;
    }




}
