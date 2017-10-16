package com.job.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Tworkexp {
    private Integer workexpid;

    private Integer personid;

    private String companyname;

    private String jobname;

    private Date starttime;

    private Date endtime;

    private String workduty;

    public Integer getWorkexpid() {
        return workexpid;
    }

    public void setWorkexpid(Integer workexpid) {
        this.workexpid = workexpid;
    }

    public Integer getPersonid() {
        return personid;
    }

    public void setPersonid(Integer personid) {
        this.personid = personid;
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

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public String getWorkduty() {
        return workduty;
    }

    public void setWorkduty(String workduty) {
        this.workduty = workduty == null ? null : workduty.trim();
    }

    public String getStarttimeStr() {
        SimpleDateFormat dateformat2=new SimpleDateFormat("yyyy-MM-dd");
        String startTimeStr=dateformat2.format(starttime);
        return startTimeStr;
    }

    public String getEndtimeStr() {
        SimpleDateFormat dateformat2=new SimpleDateFormat("yyyy-MM-dd");
        String endTimeStr=dateformat2.format(endtime);
        return endTimeStr;
    }
}