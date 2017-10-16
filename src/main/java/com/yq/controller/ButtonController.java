package com.yq.controller;//package com.yq.controller;
//
//import java.util.HashMap;
//import java.util.Map;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.google.gson.Gson;
//import com.yq.weixin.MenuManager;
//import com.yq.weixin.pojo.Token;
//import com.yq.weixin.util.CommonUtil;
//import com.yq.weixin.util.MenuUtil;
//import com.yq.weixin.util.StringUtil;
//
//@Controller
//@RequestMapping
//public class ButtonController extends StringUtil {
//	CommonUtil commonUtil=new CommonUtil();
//	Gson js = new Gson();
//	@ResponseBody
//	@RequestMapping("/main/creatView.html")
//	public String creatView(){
//		Map<String, Object> map = new HashMap<String, Object>();
//		Token token = commonUtil.getToken(appid, appsecret);
//		
//		if (null != token) {
//			// 创建菜单
//			boolean result = MenuUtil.createMenu(MenuManager.getMenu(), token.getAccessToken());
//			// 判断菜单创建结果
//			if (result){
//				map.put("result", "ok");
//				map.put("message", "view is OK!");
//				
//			}else{
//				map.put("result", "error");
//				map.put("message", "token is ok,but something is wrong,about wechat");
//			}
//		}else{
//			map.put("result", "error");
//			map.put("message", "token is null,check AccessToken on mysql");
//		}
//		return js.toJson(map);
//	}
//}
