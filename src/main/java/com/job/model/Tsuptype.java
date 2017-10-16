package com.job.model;

public class Tsuptype {
    private Integer suptype;

    private String suptypename;


    public Integer getSuptype() {
        return suptype;
    }

    public void setSuptype(Integer suptype) {
        this.suptype = suptype;
    }

    public String getSuptypename() {
        return suptypename;
    }

    public void setSuptypename(String suptypename) {
        this.suptypename = suptypename == null ? null : suptypename.trim();
    }
}