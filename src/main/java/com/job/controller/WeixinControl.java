package com.job.controller;

import com.job.entity.oauth.OauthToken;
import com.job.entity.oauth.UserInfo;
import com.job.service.CheckUtilService;
import com.job.service.WeixinUtilService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by LC on 2017/5/26.
 */
@Controller
public class WeixinControl {
    @Autowired
    private CheckUtilService checkUtilService;
    @Autowired
    private WeixinUtilService weixinUtilService;
    @RequestMapping("/WeixinServlet")
    public void winxinServlet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        /**
         * get验证
         */
        String signature = request.getParameter("signature");
        String timestamp = request.getParameter("timestamp");
        String nonce = request.getParameter("nonce");
        String echostr = request.getParameter("echostr");
        System.out.println("123");
        System.out.println(signature);
        PrintWriter out = response.getWriter();
        if (checkUtilService.checkSignature(signature, timestamp, nonce)) {
            out.print(echostr);
        }
        /**
         * post接收消息
         */
    }

    /**
     * 回调url
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping("/wx")
    public String callBack(HttpServletRequest request) throws IOException {
        String state=request.getParameter("state");
        if (state.equals("123")){
            String code=request.getParameter("code");
            System.out.println("code:" + code + " state:" + state);
            if (code!=null&&!code.equals("")) {
                OauthToken oauthToken=weixinUtilService.getOAuthAccessToken(code);
                if (oauthToken.getAccess_token()!=null&&oauthToken.getOpenid()!=null){
                    UserInfo userInfo=weixinUtilService.getUserInfo(oauthToken.getAccess_token(),oauthToken.getOpenid());
                    System.out.println(userInfo);
                    request.setAttribute("nickname", userInfo.getNickname());
                    request.setAttribute("city",userInfo.getCity());
                    request.setAttribute("province",userInfo.getProvince());
                    request.setAttribute("country",userInfo.getCountry());
                    request.setAttribute("headimgurl",userInfo.getHeadimgurl());
                    request.setAttribute("sex",userInfo.getSex());
                    request.setAttribute("openid",userInfo.getOpenid());
                }
            }
        }
        return "userinfo";
    }
}
