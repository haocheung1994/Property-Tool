package com.job.dao;

import com.job.model.Tsupplier;

import java.util.List;

public interface TsupplierMapper {
    int deleteByPrimaryKey(Integer supplierid);

    int insert(Tsupplier record);

    int insertSelective(Tsupplier tsupplier);

    Tsupplier selectByPrimaryKey(Integer supplierid);

    int updateByPrimaryKeySelective(Tsupplier record);

    int updateByPrimaryKey(Tsupplier record);

    /*hao*/
    List<Tsupplier> selectBySuptype(Integer suptype);

    Tsupplier selectBySupplierId(Integer supplierid);

    int updateClickNum(Tsupplier tsupplier);

    List<Tsupplier> SearchByElement(String search);

    List<Tsupplier> selectAllApply();//查询所有供应商

}