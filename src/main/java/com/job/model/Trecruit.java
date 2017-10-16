package com.job.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Trecruit {
    private Integer recruitid;

    private Integer companyid;

    private String jobname;

    private String companyname8;

    private String salary;

    private String welfare;

    private String jobdescribe;

    private String workaddr;

    private String workreq;

    private String edureq;

    private String worktype;

    private Date pubtime;

    private Tfirmuser tfirmuserInAcc;

    private String lng;

    private String lat;

    public String getCompanyname8() {
        return companyname8;
    }

    public void setCompanyname8(String companyname8) {
        this.companyname8 = companyname8;
    }

    public Integer getRecruitid() {
        return recruitid;
    }

    public void setRecruitid(Integer recruitid) {
        this.recruitid = recruitid;
    }

    public Integer getCompanyid() {
        return companyid;
    }

    public void setCompanyid(Integer companyid) {
        this.companyid = companyid;
    }

    public String getJobname() {
        return jobname;
    }

    public void setJobname(String jobname) {
        this.jobname = jobname == null ? null : jobname.trim();
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary == null ? null : salary.trim();
    }

    public String getWelfare() {
        return welfare;
    }

    public void setWelfare(String welfare) {
        this.welfare = welfare == null ? null : welfare.trim();
    }

    public String getJobdescribe() {
        return jobdescribe;
    }

    public void setJobdescribe(String jobdescribe) {
        this.jobdescribe = jobdescribe == null ? null : jobdescribe.trim();
    }

    public String getWorkaddr() {
        return workaddr;
    }

    public void setWorkaddr(String workaddr) {
        this.workaddr = workaddr == null ? null : workaddr.trim();
    }

    public String getWorkreq() {
        return workreq;
    }

    public void setWorkreq(String workreq) {
        this.workreq = workreq == null ? null : workreq.trim();
    }

    public String getEdureq() {
        return edureq;
    }

    public void setEdureq(String edureq) {
        this.edureq = edureq == null ? null : edureq.trim();
    }

    public String getWorktype() {
        return worktype;
    }

    public void setWorktype(String worktype) {
        this.worktype = worktype == null ? null : worktype.trim();
    }

    public Date getPubtime() {
        return pubtime;
    }

    public void setPubtime(Date pubtime) {
        this.pubtime = pubtime;
    }

    public Tfirmuser getTfirmuserInAcc() {
        return tfirmuserInAcc;
    }

    public void setTfirmuserInAcc(Tfirmuser tfirmuserInAcc) {
        this.tfirmuserInAcc = tfirmuserInAcc;
    }

    public String getLng() {
        return lng;
    }

    public void setLng(String lng) {
        this.lng = lng;
    }

    public String getLat() {
        return lat;
    }

    public void setLat(String lat) {
        this.lat = lat;
    }

    public String getPubtimeStr() {
        SimpleDateFormat dateformat2=new SimpleDateFormat("yyyy-MM-dd");
        String startTimeStr=dateformat2.format(pubtime);
        return startTimeStr;
    }

    @Override
    public String toString() {
        return "Trecruit{" +
                "recruitid=" + recruitid +
                ", companyid=" + companyid +
                ", jobname='" + jobname + '\'' +
                ", salary='" + salary + '\'' +
                ", welfare='" + welfare + '\'' +
                ", jobdescribe='" + jobdescribe + '\'' +
                ", workaddr='" + workaddr + '\'' +
                ", workreq='" + workreq + '\'' +
                ", edureq='" + edureq + '\'' +
                ", worktype='" + worktype + '\'' +
                ", pubtime=" + pubtime +
                ", tfirmuserInAcc=" + tfirmuserInAcc +
                '}';
    }
}