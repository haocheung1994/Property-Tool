package com.yq.service;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yq.dao.AdminDao;
import com.yq.service.AdminService;

@Service
public class AdminService  {
	private Logger log= Logger.getLogger("");
	@Autowired
	private AdminDao adminDao;

	public String isExist(Map<String, Object> map) {
		try {
			return adminDao.isExist(map)+"";
		} catch (Exception e) {
			log.info("adminServiceImpl>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+e.getMessage());
			return "-1";
		}

	}

	public String update(Map<String, Object> map) {

		try {
			return adminDao.update(map)+"";
		} catch (Exception e) {
			log.info("update>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+e.getMessage());
			return "-1";
		}

	}
	public String listById(Map<String, Object> map){
		return adminDao.listById(map);
	}

}
