package com.weixin.service;

import com.weixin.entity.Template;
import com.weixin.entity.Token;
import com.weixin.util.CommonUtil;
import com.weixin.util.StringUtil;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by LC on 2017/7/9.
 */
@Service
public class TemplateMessageService {
    public static String templateUrl="https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=ACCESS_TOKEN";
    public void toJobFinder(String openid, String template_id, String url,Map maps) {
        Template template = new Template();
        template.setTemplate_id(template_id);
        template.setTouser(openid);
        template.setUrl(url);
        CommonUtil commonUtil=new CommonUtil();
        StringUtil stringUtil=new StringUtil();
        Token token=commonUtil.getToken(stringUtil.getSetting().getAppid(),stringUtil.getSetting().getAppsecret());
        String requestUrl=templateUrl.replace("ACCESS_TOKEN", token.getAccessToken());

        template.setData(maps);
        String  jsonObject=JSONObject.fromObject(template).toString();
        System.out.println(jsonObject);
        CommonUtil.httpsRequest(requestUrl, "POST", jsonObject);

    }
}