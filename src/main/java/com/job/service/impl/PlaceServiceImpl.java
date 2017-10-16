package com.job.service.impl;

import com.job.dao.PlaceInfoMapper;
import com.job.dao.TcitycodeMapper;
import com.job.model.PlaceInfo;
import com.job.model.Tcitycode;
import com.job.service.PlaceService;
import com.job.service.PositionService;
import com.job.utils.LocationUtils;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * Created by Zhangchu on 2016/7/15.
 */

@Service
@Transactional(rollbackFor = Exception.class)
public class PlaceServiceImpl implements PlaceService {
    
   @Resource
   PlaceInfoMapper placeinfomapper;

	@Resource
	TcitycodeMapper tcitycodeMapper;

	@Resource
	PositionService positionService;
   
	@Override
	public int getInsert(PlaceInfo placeinfo) throws IOException {
		String address = placeinfo.getLocationwz().trim();
		JSONObject jsonObject = positionService.getLALODetail(address);
		if (jsonObject.get("result") != null) {
			JSONObject result = jsonObject.getJSONObject("result");
			if (result.get("location") != null) {
				JSONObject location = result.getJSONObject("location");
				placeinfo.setLng(location.getString("lng"));
				placeinfo.setLat(location.getString("lat"));
			}
		}
		return placeinfomapper.insert(placeinfo);
	}

	@Override
	public List selectmplace(String load) {
		return placeinfomapper.selectmplace(load);
	}

	@Override
	public List selectsplace(String load) {
		return placeinfomapper.selectsplace(load);
	}

	@Override
	public PlaceInfo getplaceByid(String id) {
		return placeinfomapper.getplaceByid(id);
	}

	@Override
	public List selectplaces() {
		return placeinfomapper.selectplaces();
	}

	@Override
	public List selectAll() {
	List<PlaceInfo> placeInfos =	placeinfomapper.selectAll();

		return placeInfos;
	}

	@Override
	public List selectAllStep(Integer start,Integer end){
		return  placeinfomapper.selectAllStep(start,end);
	}

	public int deleteplacebyid(int id){
		return placeinfomapper.deleteplacebyid(id);
	}

	@Override
	public List selectByPP(String place, String ptext, HttpSession session) {
		List<PlaceInfo> placeInfos =	placeinfomapper.selectByPP(place, ptext);
		if (session.getAttribute("lng") != null && session.getAttribute("lat") != null) {
			String lat = (String) session.getAttribute("lat");
			String lng = (String) session.getAttribute("lng");
			double lat0 = Double.parseDouble(lat);
			double lng0 = Double.parseDouble(lng);
			Collections.sort(placeInfos, new Comparator<PlaceInfo>() {
				@Override
				public int compare(PlaceInfo o1, PlaceInfo o2) {
					double lat1 = Double.parseDouble(o1.getLat());
					double lng1 = Double.parseDouble(o1.getLng());
					double lat2 = Double.parseDouble(o2.getLat());
					double lng2 = Double.parseDouble(o2.getLng());
					Double d1 = LocationUtils.getDistance(lat0,lng0,lat1,lng1);
					Double d2 = LocationUtils.getDistance(lat0,lng0,lat2,lng2);
					return d1.compareTo(d2);
				}
			});
		}
		return placeInfos;
	}

	@Override
	public int deleteplace(int day) {
		return placeinfomapper.deleteplace(day);
	}

	@Override
	public List selectAllByfen(Integer start, Integer pagesize) {
		return placeinfomapper.selectAllByfen(start, pagesize);
	}

	@Override
	public Integer selectcount() {
		return placeinfomapper.selectcount();
	}

	@Override
	public List<Tcitycode> selectByPrimaryKey(){
		return tcitycodeMapper.selectByPrimaryKey();
	}

	@Override
	public Tcitycode selectByid(Integer id){
		return tcitycodeMapper.selectByid(id);
	}


}
