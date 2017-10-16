package com.yq.controller.admin;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yq.service.AdminService;
import com.yq.util.MD5Util;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	private Logger log= Logger.getLogger("");
	@Autowired
	private AdminService adminService;
	Map<String, Object> map = new HashMap<String, Object>();

	@ResponseBody
	@RequestMapping(value = "isExist.html")
	public String isExist(String username, String password,HttpSession session) {
		map.put("username", username);
		map.put("password",MD5Util.MD5Encode(password,""));
		session.setAttribute("username", username);
		session.setAttribute("password", password);
		return adminService.isExist(map);
	}
	
	@ResponseBody
	@RequestMapping(value = "update.html")
	public String update(String password,String password2,HttpSession session) {
		map.put("admin_id", 1);
		String pwd = adminService.listById(map);
		String rs ="0";
		if(MD5Util.MD5Encode(password,"").equals(pwd)){
			
			map.put("password", MD5Util.MD5Encode(password2,""));
			rs= adminService.update(map);
		}
		
		return rs ;
	}
//	@ResponseBody
//	@RequestMapping(value = "update.html")
//	public String listById(){
//		map.put("admin_id", 1);
//		return adminService.listById(map);
//	}
}
