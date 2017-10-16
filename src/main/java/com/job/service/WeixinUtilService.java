package com.job.service;

import com.job.entity.menu.Menu;
import com.job.entity.oauth.OauthToken;
import com.job.entity.oauth.UserInfo;

import java.io.IOException;

/**
 * Created by LC on 2017/5/26.
 */
public interface WeixinUtilService {
     //static net.sf.json.JSONObject doGetStr(String url) throws IOException;
     net.sf.json.JSONObject doPostStr(String url, String outStr) throws IOException;
     Menu initMenu()throws IOException;
     int createMenu(String token, String menu) throws IOException;
     String getAccessTokenUrl() throws IOException;
     OauthToken getOAuthAccessToken(String code) throws IOException;
     UserInfo getUserInfo(String access_token, String openid) throws IOException;
}
