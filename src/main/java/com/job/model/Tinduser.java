package com.job.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Tinduser {
    private Integer personid;

    private Integer userid;

    private String personname;

    private Date birthtime;

    private String personsex;

    private String schoolname;

    private String major;

    private String personcity;

    private String persontel;

    private String personemail;

    private String workyear;

    private String expectjob;

    private String worktype;

    private String expectcity;

    private String expectsalary;

    private String otherinf;

    private String wechatid;

    public Integer getPersonid() {
        return personid;
    }

    public void setPersonid(Integer personid) {
        this.personid = personid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getPersonname() {
        return personname;
    }

    public void setPersonname(String personname) {
        this.personname = personname == null ? null : personname.trim();
    }

    public Date getBirthtime() {
        return birthtime;
    }

    public void setBirthtime(Date birthtime) {
        this.birthtime = birthtime;
    }

    public String getPersonsex() {
        return personsex;
    }

    public void setPersonsex(String personsex) {
        this.personsex = personsex == null ? null : personsex.trim();
    }

    public String getSchoolname() {
        return schoolname;
    }

    public void setSchoolname(String schoolname) {
        this.schoolname = schoolname == null ? null : schoolname.trim();
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major == null ? null : major.trim();
    }

    public String getPersoncity() {
        return personcity;
    }

    public void setPersoncity(String personcity) {
        this.personcity = personcity == null ? null : personcity.trim();
    }

    public String getPersontel() {
        return persontel;
    }

    public void setPersontel(String persontel) {
        this.persontel = persontel == null ? null : persontel.trim();
    }

    public String getPersonemail() {
        return personemail;
    }

    public void setPersonemail(String personemail) {
        this.personemail = personemail == null ? null : personemail.trim();
    }

    public String getWorkyear() {
        return workyear;
    }

    public void setWorkyear(String workyear) {
        this.workyear = workyear == null ? null : workyear.trim();
    }

    public String getExpectjob() {
        return expectjob;
    }

    public void setExpectjob(String expectjob) {
        this.expectjob = expectjob == null ? null : expectjob.trim();
    }

    public String getWorktype() {
        return worktype;
    }

    public void setWorktype(String worktype) {
        this.worktype = worktype == null ? null : worktype.trim();
    }

    public String getExpectcity() {
        return expectcity;
    }

    public void setExpectcity(String expectcity) {
        this.expectcity = expectcity == null ? null : expectcity.trim();
    }

    public String getExpectsalary() {
        return expectsalary;
    }

    public void setExpectsalary(String expectsalary) {
        this.expectsalary = expectsalary == null ? null : expectsalary.trim();
    }

    public String getOtherinf() {
        return otherinf;
    }

    public void setOtherinf(String otherinf) {
        this.otherinf = otherinf == null ? null : otherinf.trim();
    }

    public String getWechatid() {
        return wechatid;
    }

    public void setWechatid(String wechatid) {
        this.wechatid = wechatid == null ? null : wechatid.trim();
    }

    public void setBirthtimeStr(String birthtimeStr)throws Exception{
        System.out.println("setBirthtimeStr");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        this.birthtime = dateFormat.parse(birthtimeStr);
    }
    public String getBirthtimeStr() {
        SimpleDateFormat dateformat2=new SimpleDateFormat("yyyy-MM-dd");
        String birthTimeStr=dateformat2.format(birthtime);
        return birthTimeStr;
    }




}