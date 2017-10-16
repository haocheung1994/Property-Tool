package com.job.service.impl;

import com.job.entity.menu.Button;
import com.job.entity.menu.Menu;
import com.job.entity.menu.ViewButton;
import com.job.entity.oauth.OauthToken;
import com.job.entity.oauth.UserInfo;
import com.job.service.WeixinUtilService;
import net.sf.json.JSONObject;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.ParseException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.net.URLEncoder;

/**
 * Created by LC on 2017/5/26.
 */
@Service
public class WeixinUtilServiceImpl implements WeixinUtilService {
    private static final String APPID = "wx6a5022fecc3e8e81";
    private static final String APPSECRET = "086fca14e2a8af8fa76106bc8ff6b5c5";
    private static final String ACCESS_TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";
    private static final String CREATE_MENU_URL = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=ACCESS_TOKEN";
    private static final String GET_ACCESS_TOKEN_URL = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
    private static final String GET_USER_INFO = "https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN";

    /**
     * get请求
     *
     * @param url
     * @return
     * @throws ParseException
     * @throws IOException
     */
    public static JSONObject doGetStr(String url) throws ParseException, IOException {
        DefaultHttpClient client = new DefaultHttpClient();
        HttpGet httpGet = new HttpGet(url);
        JSONObject jsonObject = null;
        HttpResponse httpResponse = client.execute(httpGet);
        HttpEntity entity = httpResponse.getEntity();
        if (entity != null) {
            String result = EntityUtils.toString(entity, "UTF-8");
            jsonObject = JSONObject.fromObject(result);
        }
        return jsonObject;
    }

    /**
     * post请求
     *
     * @param url
     * @param outStr
     * @return
     * @throws ParseException
     * @throws IOException
     */
    public JSONObject doPostStr(String url, String outStr) throws ParseException, IOException {
        DefaultHttpClient client = new DefaultHttpClient();
        HttpPost httpost = new HttpPost(url);
        JSONObject jsonObject = null;
        httpost.setEntity(new StringEntity(outStr, "UTF-8"));
        HttpResponse response = client.execute(httpost);
        String result = EntityUtils.toString(response.getEntity(), "UTF-8");
        jsonObject = JSONObject.fromObject(result);
        return jsonObject;
    }

    /**
     * 初始化菜单
     *
     * @return
     */
    public Menu initMenu() throws IOException{
        String recruit_redirect_url= URLEncoder.encode("http://csh.tunnel.qydev.com/jobHomepage", "utf-8");
        String recruit_url="https://open.weixin.qq.com/connect/oauth2/authorize?appid="+APPID+"&redirect_uri="+recruit_redirect_url+"&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect";
        String Supplier_url="http://csh.tunnel.qydev.com/supplierModule";


        Menu menu = new Menu();
        System.out.println("url" + recruit_url);
        ViewButton button11 = new ViewButton();
        button11.setName("求职招聘");
        button11.setType("view");
        button11.setUrl(recruit_url);

        ViewButton button12 = new ViewButton();
        button12.setName("土地中标");
        button12.setType("view");
        button12.setUrl(recruit_url);

        ViewButton button13 = new ViewButton();
        button13.setName("下游供应商");
        button13.setType("view");
        button13.setUrl(Supplier_url);

        ViewButton button14 = new ViewButton();
        button14.setName("物资商城");
        button14.setType("view");
        button14.setUrl(recruit_url);

        ViewButton button15 = new ViewButton();
        button15.setName("论坛");
        button15.setType("view");
        button15.setUrl(recruit_url);

        Button button1 = new Button();
        button1.setName("物业宝");
        button1.setSub_button(new Button[]{button11, button12, button13, button14, button15});

        ViewButton button2 = new ViewButton();
        button2.setName("首页");
        button2.setType("view");
        button2.setUrl(recruit_url);

        ViewButton button3 = new ViewButton();
        button3.setName("更多");
        button3.setType("view");
        button3.setUrl(recruit_url);

        menu.setButton(new Button[]{button1, button2, button3});

        return menu;
    }

    /**
     * 创建菜单
     *
     * @param token
     * @param menu
     * @return
     * @throws ParseException
     * @throws IOException
     */
    public int createMenu(String token, String menu) throws ParseException, IOException {
        int result = 0;
        String url = CREATE_MENU_URL.replace("ACCESS_TOKEN", token);
        JSONObject jsonObject = doPostStr(url, menu);
        if (jsonObject != null) {
            result = jsonObject.getInt("errcode");
        }
        return result;
    }

    /**
     * 获取access_token(注意区别于网络授权的access_token)
     *
     * @return
     * @throws IOException
     */
    public String getAccessTokenUrl() throws IOException {
        String token = null;
        String url = ACCESS_TOKEN_URL.replace("APPID", APPID).replace("APPSECRET", APPSECRET);
        JSONObject jsonObject = doGetStr(url);
        if (jsonObject != null) {
            token = jsonObject.getString("access_token");
        }
        return token;
    }

    /**
     * 通过code获取网页授权access_token
     *
     * @param code
     * @throws Exception
     */
    public OauthToken getOAuthAccessToken(String code) throws IOException {
        System.out.println("getoau");
        OauthToken oauthToken = new OauthToken();
        String url = GET_ACCESS_TOKEN_URL.replace("APPID", APPID).replace("SECRET", APPSECRET).replace("CODE", code);
        JSONObject jsonObject = doGetStr(url);
        if (jsonObject != null && jsonObject.containsKey("access_token")) {
            oauthToken.setAccess_token(jsonObject.getString("access_token"));
            oauthToken.setExpires_in(jsonObject.getInt("expires_in"));
            oauthToken.setOpenid(jsonObject.getString("openid"));
            oauthToken.setRefresh_token(jsonObject.getString("refresh_token"));
            oauthToken.setScope(jsonObject.getString("scope"));
        }
        return oauthToken;
    }

    public UserInfo getUserInfo(String access_token, String openid) throws IOException {
        UserInfo user = new UserInfo();
        String url = GET_USER_INFO.replace("ACCESS_TOKEN", access_token).replace("OPENID", openid);
        JSONObject jsonObject = doGetStr(url);
        if (jsonObject != null && jsonObject.containsKey("openid")) {
            user.setOpenid(jsonObject.getString("openid"));
            user.setNickname(jsonObject.getString("nickname"));
            user.setSex(jsonObject.getInt("sex"));
            user.setCity(jsonObject.getString("city"));
            user.setCountry(jsonObject.getString("country"));
            user.setHeadimgurl(jsonObject.getString("headimgurl"));
            user.setProvince(jsonObject.getString("province"));
        }
        return user;

    }
}
