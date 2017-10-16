package com.yq.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.job.dao.TrecruitMapper;
import com.job.dao.TtrafficMapper;
import com.job.model.*;
import com.job.service.PlaceService;
import com.job.service.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yq.service.CouponsService;
import com.yq.util.StringUtil;
import com.yq.util.PageUtil;
import com.yq.entity.Coupons;

@Controller
@RequestMapping
public class CouponsCtrl extends StringUtil {
	@Autowired
	private CouponsService couponsService;
	@Autowired
	private SupplierService supplierService;
	@Autowired
	private TrecruitMapper trecruitMapper;
	@Autowired
	private TtrafficMapper ttrafficMapper;

	@Autowired
	private PlaceService placeService;
	private Coupons coupons = new Coupons();
	Map<String, Object> map = new HashMap<String, Object>();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");

	@RequestMapping(value = "/main/cpsAddjsp.html")
	public ModelAndView addjsp() {
		ModelAndView ml = new ModelAndView();
		List<Tsuptype> tsuptype =supplierService.selectAllType();
		ml.addObject("tsuptype", tsuptype);
		ml.setViewName("main/coupons/add");
		return ml;
	}

	@RequestMapping("/main/addSupplier.html")
	public String addSupplier(Tsupplier tsupplier,HttpServletRequest request, HttpServletResponse response)  {
		int res=supplierService.insertSelective(tsupplier);

		/*Trecruit trecruit=trecruitService.selectByRecruitId(recruitid);
		request.setAttribute("trecruit", trecruit);*/
		request.setAttribute("res", res);
		return "main/coupons/add";
	}


	@ResponseBody
	@RequestMapping(value = "/main/cpsInsert.html")
	public String insert(String cps_name, String cps_code, Float cps_price,
			String cps_time, Integer cps_level, String oppen_id) {
		String ranStr = (int) (Math.random() * 90000) + 1000 + "";
		map.put("cps_name", cps_name);
		map.put("cps_code", ranStr);
		map.put("cps_price", cps_price);
		map.put("cps_time", cps_time);
		map.put("cps_level", 0);
		map.put("oppen_id", 0);
		map.put("status", 1);
		String rs = couponsService.insert(map) + "" ;
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>" + rs);
		return rs;
	}

	@ResponseBody
	@RequestMapping(value = "/page/cpsInsert.html")
	public String pageInsert(String cps_name, Integer cps_id, Float cps_price,
			Integer cps_level, String oppen_id,
			HttpSession session) {
//		setOppen_id("111", session);// 测试代码，模仿登录
		String add_time =sf.format(new Date());
		oppen_id = getOppen_id(session);
	//	coupons.setCps_code(cps_code);
		coupons.setCps_id(cps_id);
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>cps_id=" + cps_id);
		coupons.setCps_time(add_time);
		coupons.setCps_level(0);
		coupons.setOppen_id("0");
		
		List<Coupons> cps = couponsService.listByCode(coupons); // 系统优惠券
		
		if (cps.size() > 0) {
			coupons.setCps_level(cps_id);
			coupons.setOppen_id(oppen_id);
			List<Coupons> cpsUser = couponsService.listByCode(coupons); // 用户优惠券
			System.err.println(cpsUser.size());
			if (cpsUser.size() > 0) {
				System.err.println("cpsUser");
				return "-1";
			} else {
				System.err.println(1);
				map.put("cps_name", cps.get(0).getCps_name());
				map.put("cps_code", cps.get(0).getCps_code());
				map.put("cps_price", cps.get(0).getCps_price());
				map.put("cps_time", cps.get(0).getCps_time());
				map.put("cps_level", cps.get(0).getCps_id());
				map.put("oppen_id", oppen_id);
				map.put("status", 1);
				return couponsService.insert(map) + "";
			}
		} else {
			return "-5"; // 优惠券不存在
		}

	}


	@RequestMapping(value = "/main/supUpdate.html")
	public void supUpdate(Tsupplier tsupplier) {
		supplierService.updateByPrimaryKeySelective(tsupplier);
		return ;
	}

	@RequestMapping(value = "/main/suptypeUpdate.html")
	public void suptypeUpdate(Tsuptype tsuptype) {
		supplierService.updateByPrimaryKeySelective(tsuptype);
		return;
	}
	@ResponseBody
	@RequestMapping(value = "/main/supDelete.html")
	public Integer delete(Integer sup_id) {
		return supplierService.deleteByPrimaryKey(sup_id);
	}


	@RequestMapping("/main/suppliertype")
	public String  suppliertype(HttpServletRequest request){
	 List<Tsuptype> tsuptypes=supplierService.selectAllType();
	request.setAttribute("typesize", tsuptypes.size());
	request.setAttribute("tsuptypes",tsuptypes);
	return "main/coupons/typelist";
	}

	@RequestMapping("/main/typeAdd")
	public String typeAdd(HttpServletRequest request) {
	return"main/coupons/typeadd";

	}

	@RequestMapping("/main/deletesuptype.html")
	public String deletesuptype(HttpServletRequest request,Integer suptype) {
		//删除操作
		 System.out.println(suptype);
		int res= supplierService.deleteBysupType(suptype);

		//展示操作
		List<Tsuptype> tsuptypes=supplierService.selectAllType();
		request.setAttribute("typesize", tsuptypes.size());
		request.setAttribute("tsuptypes",tsuptypes);
		return "main/coupons/typelist";
	}


	@RequestMapping("/main/addsuptype.html")
	public String addSupType(HttpServletRequest request,Tsuptype tsuptype) {
		int res=supplierService.insertSelective(tsuptype);
		System.out.println("TIPS" + tsuptype.getSuptypename());

		return "main/coupons/typeadd";

	}
	@RequestMapping("/main/deleterecruit.html")
	public void deleterecruit(Integer recruitid) {
		trecruitMapper.deleteByPrimary(recruitid);
	}
	@RequestMapping("/main/deletepalce.html")
	public void deleteplacet(Integer id) {
		placeService.deleteplacebyid(id);
	}
	/*土地中标信息*/
	@RequestMapping("/main/placeInfo.html")
	public String placeInfo(HttpServletRequest request,Integer statu,Integer jumppage) {
		List<PlaceInfo> placeInfos=placeService.selectAll();
		Integer length=placeInfos.size();
		Integer end=20;
		Integer MaxPage=length/20;//总页数
		request.setAttribute("size",length);//总条数

		if(statu==1) {//首页
			Integer start=0;
			Integer currentPage=1;
			System.out.println("START" + start + "END" + end);
			request.getSession().setAttribute("currentPage", currentPage);
			request.getSession().setAttribute("start", start);
			List<PlaceInfo> placeInfo=placeService.selectAllStep(start, end);
			request.setAttribute("placeInfo",placeInfo);
			request.setAttribute("result",currentPage-MaxPage);//总条数
		}
		if(statu==2){//下一页
			Integer start=Integer.parseInt(String.valueOf(request.getSession().getAttribute("start")))+20;
			Integer currentPage=Integer.parseInt(String.valueOf(request.getSession().getAttribute("currentPage")))+1;


			request.getSession().setAttribute("currentPage", currentPage);
			request.getSession().setAttribute("start", start);
			System.out.println("START" + start + "END" + end);
			List<PlaceInfo> placeInfo=placeService.selectAllStep(start, end);
			request.setAttribute("placeInfo",placeInfo);

			request.setAttribute("result",currentPage-MaxPage);//总条数

		}
		if(statu==3){//上一页
			Integer start=Integer.parseInt(String.valueOf(request.getSession().getAttribute("start")))-20;
			Integer currentPage=Integer.parseInt(String.valueOf(request.getSession().getAttribute("currentPage")))-1;
			System.out.println("START" + start + "END" + end);

			request.getSession().setAttribute("currentPage", currentPage);
			request.getSession().setAttribute("start", start);
			List<PlaceInfo> placeInfo=placeService.selectAllStep(start, end);
			request.setAttribute("placeInfo",placeInfo);
			request.setAttribute("result",currentPage-MaxPage);//总条数
		}
		if(statu==4) {//末页
			Integer start=length-20;
			System.out.println("START" + start + "END" + end);
			Integer currentPage=length/20;

			request.getSession().setAttribute("currentPage", currentPage);
			request.getSession().setAttribute("start", start);
			List<PlaceInfo> placeInfo=placeService.selectAllStep(start, end);
			request.setAttribute("placeInfo",placeInfo);
			request.setAttribute("result",currentPage-MaxPage);//总条数
		}
		if(statu==0){
			Integer start = 20 * (jumppage -1);
			System.out.println("START" + start + "END" + end);
			request.getSession().setAttribute("start", start);
			request.getSession().setAttribute("currentPage", jumppage);

			List<PlaceInfo> placeInfo=placeService.selectAllStep(start, end);
			request.setAttribute("placeInfo",placeInfo);
			request.setAttribute("result",jumppage-MaxPage);//总条数

		}

		return "main/user/placelist";
	}





	/*招聘信息*/
	@RequestMapping("/main/recruitInfo.html")
	public String recruitInfo(HttpServletRequest request,Integer statu,Integer jumppage) {
		List<Trecruit> recruit=trecruitMapper.selectAllRecruit(0);
		Integer length=recruit.size();
		System.out.println("length:"+length);
		Integer end=20;
		Integer MaxPage=length/20;//总页数
		request.setAttribute("size",length);//总条数


		if(statu==1) {//首页
			Integer start=0;
			Integer currentPage=1;
			System.out.println("START" + start + "END" + end);
			request.getSession().setAttribute("currentPage", currentPage);
			request.getSession().setAttribute("start", start);
			List<Trecruit> trecruit=trecruitMapper.selectStepRecruit(start,end);
			request.setAttribute("trecruitList",trecruit);
			request.setAttribute("result",currentPage-MaxPage);//总条数
		}
		if(statu==2){//下一页
			Integer start=Integer.parseInt(String.valueOf(request.getSession().getAttribute("start")))+20;
			Integer currentPage=Integer.parseInt(String.valueOf(request.getSession().getAttribute("currentPage")))+1;


			request.getSession().setAttribute("currentPage", currentPage);
			request.getSession().setAttribute("start", start);
			System.out.println("START" + start + "END" + end);
			List<Trecruit> trecruit=trecruitMapper.selectStepRecruit(start,end);
			request.setAttribute("trecruitList", trecruit);

			request.setAttribute("result",currentPage-MaxPage);//总条数

		}
		if(statu==3){//上一页
			Integer start=Integer.parseInt(String.valueOf(request.getSession().getAttribute("start")))-20;
			Integer currentPage=Integer.parseInt(String.valueOf(request.getSession().getAttribute("currentPage")))-1;
			System.out.println("START" + start + "END" + end);

			request.getSession().setAttribute("currentPage", currentPage);
			request.getSession().setAttribute("start", start);
			List<Trecruit> trecruit=trecruitMapper.selectStepRecruit(start,end);
			request.setAttribute("trecruitList",trecruit);
			request.setAttribute("result",currentPage-MaxPage);//总条数
		}
		if(statu==4) {//末页
			Integer start=length-20;
			System.out.println("START" + start + "END" + end);
			Integer currentPage=length/20;

			request.getSession().setAttribute("currentPage", currentPage);
			request.getSession().setAttribute("start", start);
			List<Trecruit> trecruit=trecruitMapper.selectStepRecruit(start,end);
			request.setAttribute("trecruitList",trecruit);
			request.setAttribute("result",currentPage-MaxPage);//总条数
		}
		if(statu==0){
			Integer start = 20 * (jumppage -1);
			System.out.println("START" + start + "END" + end);
			request.getSession().setAttribute("start", start);
			request.getSession().setAttribute("currentPage", jumppage);

			List<Trecruit> trecruit=trecruitMapper.selectStepRecruit(start, end);
			request.setAttribute("trecruitList",trecruit);
			request.setAttribute("result",jumppage-MaxPage);//总条数

		}

		return "main/user/recruitlist";
	}


	@RequestMapping(value = "/main/cpsList.html")
	public ModelAndView list(
			@RequestParam(defaultValue = "1") Integer currentPage,
			HttpServletRequest request) {
		/*String add_time =sf.format(new Date());
		coupons.setCps_time(add_time);
		coupons.setOppen_id("");
		coupons.setCps_level(0);
		*/

		
		/*List<Coupons> list = couponsService.list(coupons);*/
		List<Tsupplier> list = supplierService.selectAllApply();


		int total = list.size();
		request.setAttribute("total", total);
		/*PageUtil.pager(currentPage, pagesize_1, total, request);
		coupons.setPageSize(pagesize_1);
		coupons.setCurrentNum(PageUtil.currentNum(currentPage, pagesize_1));*/

		ModelAndView ml = new ModelAndView();
		ml.addObject("suplist", list);
		ml.setViewName("main/coupons/list");
		return ml;
	}
	
	@RequestMapping(value = "/page/cpsList.html")
	public ModelAndView listByOppen_id(String oppen_id,
			HttpServletRequest request,HttpSession session) {
		String add_time =sf.format(new Date());
		oppen_id = getOppen_id(session);
		coupons.setOppen_id(oppen_id);
		coupons.setCps_level(-1);
		coupons.setCps_time(add_time);
		List<Coupons> list = couponsService.list(coupons);
		ModelAndView ml = new ModelAndView();
		ml.addObject("list", list);
		ml.setViewName("page/coupons-list");
		return ml;
	}
	
	@RequestMapping(value = "/page/cpsAll.html")
	public ModelAndView listAll(String oppen_id) {
		String add_time =sf.format(new Date());
		coupons.setCps_time(add_time);
		coupons.setCps_level(0);
		
		List<Coupons> list = couponsService.listAll(coupons);
		ModelAndView ml = new ModelAndView();
		ml.addObject("list", list);
		ml.setViewName("page/cpsAll-list");
		return ml;
	}
	
	@RequestMapping(value = "/page/cartCoupons.html")
	public ModelAndView cartCoupons(String oppen_id,Integer addr_id ,
			@RequestParam(defaultValue = "1") Integer currentPage,
			HttpServletRequest request,HttpSession session) {
		String add_time =sf.format(new Date());
		
		coupons.setCps_time(add_time);
		oppen_id = getOppen_id(session);
		coupons.setOppen_id(oppen_id);
		coupons.setCps_level(-1);
		List<Coupons> list = couponsService.list(coupons);
		ModelAndView ml = new ModelAndView();
		ml.addObject("list", list);
		ml.addObject("addr_id", addr_id);
		ml.setViewName("page/cart-coupons");
		return ml;
	}
	@RequestMapping(value = "/page/goodsCoupons.html")
	public ModelAndView goodsCoupons(Integer goods_id,Integer goods_num,String oppen_id,Integer addr_id ,
			@RequestParam(defaultValue = "1") Integer currentPage,
			HttpServletRequest request,HttpSession session) {
		String add_time =sf.format(new Date());
		oppen_id = getOppen_id(session);
		coupons.setOppen_id(oppen_id);
		coupons.setCps_time(add_time);
		List<Coupons> list = couponsService.list(coupons);
		ModelAndView ml = new ModelAndView();
		ml.addObject("list", list);
		ml.addObject("addr_id", addr_id);
		ml.addObject("goods_id", goods_id);
		ml.addObject("goods_num", goods_num);
		ml.setViewName("page/goods-coupons");
		return ml;
	}
	
	@RequestMapping(value = "/main/cpsListById.html")
	public ModelAndView listById(Integer cps_id) {
		Tsupplier tsupplier=supplierService.selectByPrimaryKey(cps_id);

		ModelAndView ml = new ModelAndView();
		ml.addObject("list", tsupplier);
		ml.setViewName("main/coupons/info");
		return ml;
	}
	@RequestMapping(value = "/main/suptypeedit.html")
	 public ModelAndView suptypeedit(Integer suptype) {

		Tsuptype tsuptype=supplierService.selectSuptype(suptype);
		ModelAndView ml = new ModelAndView();
		ml.addObject("list", tsuptype);
		ml.setViewName("main/coupons/typeinfo");
		return ml;
	}
	@RequestMapping(value = "/main/traffic.html")
	public ModelAndView traffic() {
		Ttraffic ttraffic=ttrafficMapper.selectByPrimaryKey(1);
		ModelAndView ml = new ModelAndView();
		ml.addObject("traffic", ttraffic);
		ml.setViewName("main/sign/list");
		return ml;
	}
	@RequestMapping(value = "/main/cleartraffic.html")
	 public ModelAndView cleartraffic(Integer signid) {
		System.out.println(signid);
		Ttraffic ttraffic=new Ttraffic();
		ttraffic.setSignid(1);
		ttraffic.setMark1(0);
		ttraffic.setMark2(0);
		ttraffic.setMark3(0);
		ttraffic.setMark4(0);
		ttraffic.setMark5(0);
		ttrafficMapper.updateByPrimaryKey(ttraffic);
		ModelAndView ml = new ModelAndView();
		ml.addObject("traffic", ttraffic);
		ml.setViewName("main/sign/list");
		return ml;
	}
//	@RequestMapping(value = "/main/cartCpsById.html")
//	public ModelAndView cartCpsById(Integer cps_id) {
//		coupons.setCps_id(cps_id);
//		List<Coupons> list = couponsService.listById(coupons);
//		ModelAndView ml = new ModelAndView();
//		ml.addObject("list", list);
//		ml.setViewName("main/coupons/info");
//		return ml;
//	}
}
