package com.job.service;

import com.job.service.impl.WeixinUtilServiceImpl;
import net.sf.json.JSONObject;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Service;

import java.io.IOException;

/**
 * Created by LC on 2017/8/20.
 */
@Service
public class PositionService {
    private static final String URL = "http://api.map.baidu.com/geocoder/v2/?output=json&ak=AK&location=LA,LO";
    private static final String AK = "vwiW7g0R9rv1Xg43n8avde8is4uqDRZn";
    private static final String addressURL = "http://api.map.baidu.com/geocoder/v2/?output=json&ak=AK&address=ADDRESS";

    public JSONObject getPositionDetail(String la, String lo) throws IOException {
        String url = URL.replace("AK", AK).replace("LA", la).replace("LO", lo);
        System.out.println(url);
        return WeixinUtilServiceImpl.doGetStr(url);
    }

    public static JSONObject getLALODetail(String address) throws IOException {
        String url = addressURL.replace("AK", AK).replace("ADDRESS", address);
        System.out.println(url);
        return WeixinUtilServiceImpl.doGetStr(url);
    }








}
