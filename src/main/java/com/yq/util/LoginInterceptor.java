package com.yq.util;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.job.model.Tuser;
import com.job.service.TrecruitService;
import org.apache.log4j.Logger;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.google.gson.Gson;
import com.weixin.entity.WxSetting;
import com.weixin.service.WxSettingService;
import com.yq.controller.UserCtrl;
import com.yq.entity.User;

/**
 * 登陆拦截器.
 *
 */

public class LoginInterceptor extends HandlerInterceptorAdapter {
	@Resource
	WxSettingService wxSettingService;
	@Resource
	TrecruitService trecruitService;
	private Logger log = Logger.getLogger(getClass());
	private static final String[] IGNORE_URI = { "/login.jsp", "/Login/", "/reply.html", "/main/", "/admin/", "/userInsert.html",
			"/oauth2/", "/noticeOrder.html" };
	Gson gson=new Gson();
	Map<String, Object> map = new HashMap<String, Object>();
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		boolean flag = false;






		flag = session.getAttribute("oppen_id") != null ? true : false;
		String url = (request.getRequestURL() + "?" + request.getQueryString()).toString();
		System.out.println(">>>: " + url);
		for (String s : IGNORE_URI) {
			if (url.contains(s)) {
				flag = true;
				break;
			}
		}
		log.info("url>>>: " + url);


		if (!flag) {
			System.out.println("flag:" + flag);
//			AbstractApplicationContext ctx   = new ClassPathXmlApplicationContext(new String []{"classpath:spring/spring-service.xml"});
//			WxSettingService wxSettingService =(WxSettingService)ctx.getBean("wxSettingService") ;
			WxSetting wxSetting  =  wxSettingService.selectByPrimaryKey(1);

			String ss="https://open.weixin.qq.com/connect/oauth2/authorize?appid="+wxSetting.getAppid()+"&redirect_uri="+wxSetting.getLink()+"/page/userInsert.html?url="
					+ url
					+ "&response_type=code&scope=snsapi_userinfo&state=STATE&connect_redirect=1#wechat_redirect";
			System.out.println(ss);

			if (request.getHeader("x-requested-with") != null
					&& request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")) { // 如果是ajax请求响应头会有x-requested-with
//				System.out.println("ajax -- wxSetting.getAppid()=="+wxSetting.getAppid());
				map.put("rs_code",1005);
				response.getWriter().write(gson.toJson(map));
			}

				else {
//				System.out.println("wxSetting.getAppid()=="+wxSetting.getAppid());
				response.sendRedirect(
						"https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + wxSetting.getAppid() + "&redirect_uri=" + wxSetting.getLink() + "/page/userInsert.html?url="
								+ url
								+ "&response_type=code&scope=snsapi_userinfo&state=STATE&connect_redirect=1#wechat_redirect");
			}
		}


//		flag=true ;
		return flag;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);



	}
}