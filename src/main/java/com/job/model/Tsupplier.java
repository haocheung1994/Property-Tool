package com.job.model;

public class Tsupplier {
    private Integer supplierid;

    private String suppliername;

    private Integer suptype;

    private String suptel;

    private String supcity;

    private String supaddress;

    private Integer clicknum;

    public Tsuptype getSupTypeInAcc() {
        return supTypeInAcc;
    }

    public void setSupTypeInAcc(Tsuptype supTypeInAcc) {
        this.supTypeInAcc = supTypeInAcc;
    }

    private String policyinfo;

    private Tsuptype supTypeInAcc;

    public Integer getSupplierid() {
        return supplierid;
    }

    public void setSupplierid(Integer supplierid) {
        this.supplierid = supplierid;
    }

    public String getSuppliername() {
        return suppliername;
    }

    public void setSuppliername(String suppliername) {
        this.suppliername = suppliername == null ? null : suppliername.trim();
    }

    public Integer getSuptype() {
        return suptype;
    }

    public void setSuptype(Integer suptype) {
        this.suptype = suptype;
    }

    public String getSuptel() {
        return suptel;
    }

    public void setSuptel(String suptel) {
        this.suptel = suptel == null ? null : suptel.trim();
    }

    public String getSupcity() {
        return supcity;
    }

    public void setSupcity(String supcity) {
        this.supcity = supcity == null ? null : supcity.trim();
    }

    public String getSupaddress() {
        return supaddress;
    }

    public void setSupaddress(String supaddress) {
        this.supaddress = supaddress == null ? null : supaddress.trim();
    }

    public Integer getClicknum() {
        return clicknum;
    }

    public void setClicknum(Integer clicknum) {
        this.clicknum = clicknum;
    }

    public String getPolicyinfo() {
        return policyinfo;
    }

    public void setPolicyinfo(String policyinfo) {
        this.policyinfo = policyinfo == null ? null : policyinfo.trim();
    }

    @Override
    public String toString() {
        return "Tsupplier{" +
                "supplierid=" + supplierid +
                ", suppliername='" + suppliername + '\'' +
                ", suptype=" + suptype +
                ", suptel='" + suptel + '\'' +
                ", supcity='" + supcity + '\'' +
                ", supaddress='" + supaddress + '\'' +
                ", clicknum=" + clicknum +
                ", policyinfo='" + policyinfo + '\'' +
                '}';
    }
}