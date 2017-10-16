package com.job.service;

import com.job.model.PlaceInfo;
import com.job.model.Tcitycode;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Created by Zhangxq on 2016/7/15.
 */
public interface PlaceService {


    List<Tcitycode> selectByPrimaryKey();//所有省市

    Tcitycode selectByid(Integer id);


	/**
	 * 添加土地信息
	 * @param placeinfo
	 * @return
	 * @author zc
	 */



    int getInsert(PlaceInfo placeinfo) throws IOException;
    
    
    /**
     * 查询民用土地交易
     * @return
     */
    List selectmplace(String load);
    
    /**
     * 查询民用土地交易
     * @return
     */
    List selectsplace(String load);
    
    /**
     * 根据编号查询，可用于查看详情时调用
     * @param id
     * @return
     */
    PlaceInfo getplaceByid(String id);
    
    /**
     * 查询前十条数据
     * @return
     */
    List selectplaces();
    
    /**
     * 查询全部
     * @return
     */
    List selectAll();

    List selectAllStep(Integer start,Integer end);
    
    List selectByPP(String place, String ptext, HttpSession session);
    
    int deleteplace(int day);
    
    List selectAllByfen(Integer start, Integer pagesize);
    
    Integer selectcount();

    int deleteplacebyid(int id);

}