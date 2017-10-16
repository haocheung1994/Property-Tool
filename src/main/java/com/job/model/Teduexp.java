package com.job.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Teduexp {
    private Integer eduexpid;

    private Integer personid;

    private String eduschoolname;

    private String edumajor;

    private String degree;

    private Date graduationtime;

    public Integer getEduexpid() {
        return eduexpid;
    }

    public void setEduexpid(Integer eduexpid) {
        this.eduexpid = eduexpid;
    }

    public Integer getPersonid() {
        return personid;
    }

    public void setPersonid(Integer personid) {
        this.personid = personid;
    }

    public String getEduschoolname() {
        return eduschoolname;
    }

    public void setEduschoolname(String eduschoolname) {
        this.eduschoolname = eduschoolname == null ? null : eduschoolname.trim();
    }

    public String getEdumajor() {
        return edumajor;
    }

    public void setEdumajor(String edumajor) {
        this.edumajor = edumajor == null ? null : edumajor.trim();
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree == null ? null : degree.trim();
    }

    public Date getGraduationtime() {
        return graduationtime;
    }

    public void setGraduationtime(Date graduationtime) {
        this.graduationtime = graduationtime;
    }

    public String getGraduationtimeStr() {
        SimpleDateFormat dateformat2=new SimpleDateFormat("yyyy-MM-dd");
        String graduationTimeStr=dateformat2.format(graduationtime);
        return graduationTimeStr;
    }
}