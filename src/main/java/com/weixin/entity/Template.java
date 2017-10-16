package com.weixin.entity;

import java.util.Map;

/**
 * Created by LC on 2017/7/9.
 */
public class Template {
    private String touser;
    private String template_id;
    private String url;
    private Map<String,Map> data;

    public String getTouser() {
        return touser;
    }

    public void setTouser(String touser) {
        this.touser = touser;
    }

    public String getTemplate_id() {
        return template_id;
    }

    public void setTemplate_id(String template_id) {
        this.template_id = template_id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Map<String, Map> getData() {
        return data;
    }

    public void setData(Map<String, Map> data) {
        this.data = data;
    }
}
