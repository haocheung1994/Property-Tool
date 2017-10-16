package com.job.controller;

import com.job.model.Tsupplier;
import com.job.service.SupplierService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by Zhangxq on 2016/7/15.
 */

@Controller
public class SupplierController {

    private Logger log = Logger.getLogger(SupplierController.class);
    @Resource
    private SupplierService supplierService;

    @RequestMapping("/supplierModule")
    public String supplierModule(){
        return "/SupplierModule/supplier_index";
    }


    /*查找同类型供应商*/
    @RequestMapping("/showsupplier")
    public String Register(HttpServletRequest request, HttpServletResponse response,
                           Integer stype) throws Exception {

        List<Tsupplier> supplierlist=supplierService.selectBySuptype(stype);
        request.setAttribute("supplierlist", supplierlist);
        return "/SupplierModule/supplier_list";
    }

    /*展示具体供应商信息*/
    @RequestMapping("/supplier")
    public String supplier(HttpServletRequest request, HttpServletResponse response,
                           Integer supplierid,Integer suptype) throws Exception {
        Tsupplier tsupplier=supplierService.selectBySupplierId(supplierid);
        tsupplier.setClicknum(tsupplier.getClicknum()+1);

        supplierService.updateClickNum(tsupplier);//更新浏览点击数

        List<Tsupplier> similiarlist=supplierService.selectBySuptype(suptype);//寻找相同类型的其他供应商
        for(Tsupplier temp : similiarlist) {

            if(temp.getSupplierid().equals(supplierid)){
                similiarlist.remove(temp);//去除自身的信息
                break;
            }
        }

        request.setAttribute("similiarlist",similiarlist);
        request.setAttribute("supplier",tsupplier);

        return "/SupplierModule/supplier_info";
    }



    /*搜索供应商*/
    @RequestMapping("/supSearch")
    public String supSearch(HttpServletRequest request,String search) throws Exception{
        try {
            List<Tsupplier> supplierResult = supplierService.SearchByElement(search);
            request.setAttribute("supplierResult", supplierResult);

        }catch (Exception e){
            System.out.println("error");
            return "/SupplierModule/supplier_index";
        }
        return "/SupplierModule/search_list";
    }

}
