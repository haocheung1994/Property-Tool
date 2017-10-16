package com.job.dao;

import com.job.model.PlaceInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PlaceInfoMapper {


	// 添加土地信息
    int insert(PlaceInfo placeinfo);
    
    //查询民用
    List selectmplace(String load);
    
    //查询商用
    List selectsplace(String load);
    
    //根据编号id查询
    PlaceInfo  getplaceByid(String id);
    
    //查询前十条数据
    List selectplaces();
    
    //查询全部
    List selectAll();

    List selectAllStep(@Param("start") Integer start, @Param("end") Integer end);
    
    List selectByPP(@Param("place") String place, @Param("ptext") String ptext);

    int deleteplace(int day);

    int deleteplacebyid(int id);
    
    List selectAllByfen(Integer start, Integer pagesize);
    
    Integer selectcount();

    int updatePlace(PlaceInfo placeInfo);

}