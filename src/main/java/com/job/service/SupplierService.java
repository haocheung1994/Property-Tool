package com.job.service;

import com.job.model.Trecruit;
import com.job.model.Tsupplier;
import com.job.model.Tsuptype;

import java.util.List;

/**
 * Created by Zhangxq on 2016/7/15.
 */
public interface SupplierService {

    List<Tsupplier> selectBySuptype(Integer suptype);

    Tsupplier selectBySupplierId(Integer supplierid);

    int updateClickNum(Tsupplier tsupplier);

    List<Tsupplier> SearchByElement(String search);

    List<Tsupplier> selectAllApply();//查询所有供应商

    int deleteByPrimaryKey(Integer supplierid);

    Tsupplier selectByPrimaryKey(Integer supplierid);

    int updateByPrimaryKeySelective(Tsupplier record);

    List<Tsuptype> selectAllType();

    int insertSelective(Tsupplier tsupplier);

    int insertSelective(Tsuptype tsuptype);

    int deleteBysupType(Integer suptype);

    Tsuptype selectSuptype(Integer suptype);

    int updateByPrimaryKeySelective(Tsuptype record);

}
