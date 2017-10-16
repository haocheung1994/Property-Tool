package com.job.model;

public class Tbanner {
    private Integer banId;

    private String banImg;

    private String url;

    public Integer getBanId() {
        return banId;
    }

    public void setBanId(Integer banId) {
        this.banId = banId;
    }

    public String getBanImg() {
        return banImg;
    }

    public void setBanImg(String banImg) {
        this.banImg = banImg == null ? null : banImg.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }
}