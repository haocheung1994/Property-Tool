package com.job.service.impl;

import com.job.dao.TrecruitMapper;
import com.job.dao.TsupplierMapper;
import com.job.dao.TsuptypeMapper;
import com.job.model.Trecruit;
import com.job.model.Tsupplier;
import com.job.model.Tsuptype;
import com.job.service.SupplierService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Zhangxq on 2016/7/15.
 */

@Service
@Transactional(rollbackFor = Exception.class)
public class SupplierServiceImpl implements SupplierService {

   @Resource
   TsupplierMapper tsupplierMapper;

    @Resource
    TsuptypeMapper tsuptypeMapper;
    @Resource
    TrecruitMapper trecruitMapper;
    public List<Tsupplier> selectBySuptype (Integer suptype){
        return tsupplierMapper.selectBySuptype(suptype);
    }


    public Tsupplier selectBySupplierId(Integer supplierid){
        return tsupplierMapper.selectBySupplierId(supplierid);
    }

    public int updateClickNum(Tsupplier tsupplier){
        return tsupplierMapper.updateClickNum(tsupplier);
    }

    public List<Tsupplier> SearchByElement(String search){

        return tsupplierMapper.SearchByElement(search);
    }

    public List<Tsupplier> selectAllApply(){
        return tsupplierMapper.selectAllApply();
    }

    public int deleteByPrimaryKey(Integer supplierid){
        return tsupplierMapper.deleteByPrimaryKey(supplierid);
    }

    public Tsupplier selectByPrimaryKey(Integer supplierid){
        return tsupplierMapper.selectByPrimaryKey(supplierid);
    }

    public int updateByPrimaryKeySelective(Tsupplier record)
    {
        return tsupplierMapper.updateByPrimaryKeySelective(record);
    }

    public List<Tsuptype> selectAllType(){
      return  tsuptypeMapper.selectAllType();
    };

    public int insertSelective(Tsupplier tsupplier){
        return tsupplierMapper.insertSelective(tsupplier);
    }

    public int insertSelective(Tsuptype tsuptype){
        return tsuptypeMapper.insertSelective(tsuptype);
    }

    public int deleteBysupType(Integer suptype){
        return tsuptypeMapper.deleteBysupType(suptype);
    }

    public  Tsuptype selectSuptype(Integer suptype){
        return tsuptypeMapper.selectSuptype(suptype);
    }

    public int updateByPrimaryKeySelective(Tsuptype record){
        return  tsuptypeMapper.updateByPrimaryKeySelective(record);
    }
}
