package com.yq.dao;

import java.util.Map;

public interface AdminDao {
	
	public int isExist(Map<String, Object> map);
	
	public int update(Map<String, Object> map);
	
	public String listById(Map<String, Object> map);
}
