package com.job.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Tapply {
    private Integer jobapplyid;

    private Integer personid;

    private Date applytime;

    private Integer recruitid;

    private String companyname;

    private String jobname;

    private String salary;

    private Integer click;

    private Integer companyid;

    private Tinduser tinduserInAcc;

    public Integer getJobapplyid() {
        return jobapplyid;
    }

    public void setJobapplyid(Integer jobapplyid) {
        this.jobapplyid = jobapplyid;
    }

    public Integer getPersonid() {
        return personid;
    }

    public void setPersonid(Integer personid) {
        this.personid = personid;
    }

    public Date getApplytime() {
        return applytime;
    }

    public void setApplytime(Date applytime) {
        this.applytime = applytime;
    }

    public Integer getRecruitid() {
        return recruitid;
    }

    public void setRecruitid(Integer recruitid) {
        this.recruitid = recruitid;
    }

    public String getCompanyname() {
        return companyname;
    }

    public void setCompanyname(String companyname) {
        this.companyname = companyname == null ? null : companyname.trim();
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

    public Integer getClick() {
        return click;
    }

    public void setClick(Integer click) {
        this.click = click;
    }

    public Integer getCompanyid() {
        return companyid;
    }

    public void setCompanyid(Integer companyid) {
        this.companyid = companyid;
    }

    public Tinduser getTinduserInAcc() {
        return tinduserInAcc;
    }

    public void setTinduserInAcc(Tinduser tinduserInAcc) {
        this.tinduserInAcc = tinduserInAcc;
    }

    public String getApplytimeStr() {
        SimpleDateFormat dateformat2=new SimpleDateFormat("yyyy-MM-dd");
        String startTimeStr=dateformat2.format(applytime);
        return startTimeStr;
    }

    @Override
    public String toString() {
        return "Tapply{" +
                "jobapplyid=" + jobapplyid +
                ", personid=" + personid +
                ", applytime=" + applytime +
                ", recruitid=" + recruitid +
                ", companyname='" + companyname + '\'' +
                ", jobname='" + jobname + '\'' +
                ", salary='" + salary + '\'' +
                ", click=" + click +
                ", companyid=" + companyid +
                ", tinduserInAcc=" + tinduserInAcc +
                '}';
    }
}