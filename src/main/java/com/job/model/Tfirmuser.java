package com.job.model;

public class Tfirmuser {
    private Integer companyid;

    private Integer userid;

    private String companyname;

    private String companyaddr;

    private String companytel;

    private String companyemail;

    private String companyinf;

    private String wechatid;

    public Integer getCompanyid() {
        return companyid;
    }

    public void setCompanyid(Integer companyid) {
        this.companyid = companyid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getCompanyname() {
        return companyname;
    }

    public void setCompanyname(String companyname) {
        this.companyname = companyname == null ? null : companyname.trim();
    }

    public String getCompanyaddr() {
        return companyaddr;
    }

    public void setCompanyaddr(String companyaddr) {
        this.companyaddr = companyaddr == null ? null : companyaddr.trim();
    }

    public String getCompanytel() {
        return companytel;
    }

    public void setCompanytel(String companytel) {
        this.companytel = companytel == null ? null : companytel.trim();
    }

    public String getCompanyemail() {
        return companyemail;
    }

    public void setCompanyemail(String companyemail) {
        this.companyemail = companyemail == null ? null : companyemail.trim();
    }

    public String getCompanyinf() {
        return companyinf;
    }

    public void setCompanyinf(String companyinf) {
        this.companyinf = companyinf == null ? null : companyinf.trim();
    }

    public String getWechatid() {
        return wechatid;
    }

    public void setWechatid(String wechatid) {
        this.wechatid = wechatid == null ? null : wechatid.trim();
    }
}