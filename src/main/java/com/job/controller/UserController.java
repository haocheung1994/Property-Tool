package com.job.controller;

import com.job.model.PlaceInfo;
import com.job.model.Tbanner;
import com.job.model.Tcitycode;
import com.job.model.Tuser;

import com.job.service.JobUserService;
import com.job.service.PlaceService;
import com.job.service.TrecruitService;
import com.job.utils.MD5;
import com.yq.entity.Order;
import com.yq.entity.Student;
import com.yq.service.OrderService;
import com.yq.util.ExcelUtil;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.filechooser.FileSystemView;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.*;

/**
 * Created by Zhangxq on 2016/7/15.
 */

@Controller
public class UserController {

    private Logger log = Logger.getLogger(UserController.class);
    @Resource
    private JobUserService jobuserService;
    @Resource
    private PlaceService placeService;
    @Resource
    private OrderService orderService;

    @Resource
    private TrecruitService trecruitService;
    /*注册功能*/
    @RequestMapping("/register")
    public String Register(HttpServletRequest request, HttpServletResponse response,
                           String usertel, String userpwd) throws Exception {
        System.out.println(usertel);
        Tuser tuser = new Tuser();
        tuser.setUsertel(usertel);
        tuser.setUserpwd(MD5.MD5Trans(userpwd));
        System.out.println("/Register");
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        jobuserService.userRegiter(tuser);   //插入数据库
        System.out.println(("注册成功"));

        return "/jsp/register";
    }

    /*登录功能*/
    @RequestMapping("/login")
    public String login(HttpServletRequest request, HttpServletResponse response,
                        String usertel, String userpwd)throws Exception{
        List<Tuser> data =jobuserService.loginValidate(usertel,MD5.MD5Trans(userpwd));

        if (data.size() > 0){
            Tuser tuser=jobuserService.selectLoginUser(usertel, MD5.MD5Trans(userpwd));

           /* Integer userid=jobuserService.getUseridByTel(usertel);*/ //getuseridbytel根据电话号码获取userID
            Integer userid=tuser.getUserid();

            request.getSession().setAttribute("userTel", tuser.getUsertel());
            request.getSession().setAttribute("userId",userid);
            request.getSession().setAttribute("loginUser",tuser);

        }else {
            System.out.println("Failed");
        }
        return "/jsp/login";
    }

    /*跳转注册*/
    @RequestMapping("/goregister")
    public String goRegister()
    {
        return "/jsp/register";
    }

    /*跳转登录*/
    @RequestMapping("/gologin")
    public String goLogin()
    {
        return "/jsp/login";
    }

    /*跳转主页*/
    @RequestMapping("/index")
    public String index()  {return "/jsp/index";}


    /*跳转搜索页*/
    @RequestMapping("/search")
    public String search()  {return "/RecruitModule/search";}


    @RequestMapping("/userexit")
    public String userExit(HttpServletRequest request)
    {
        request.getSession().invalidate();
        return "/jsp/login";
    }

    @RequestMapping("/newrecruit")
    public String newrecruit(){
        return "/RecruitModule/post_position";
    }



    /*跳转个人简历页*/
    @RequestMapping("/resume")
    public String resume(){
        return "/jsp/resume";
    }

    /*增加个人信息界面*/
    @RequestMapping("/editinfo")
    public String editinfo(){
        return "/RecruitModule/jiben_info";
    }


    /*跳转到教育经历添加页面*/
    @RequestMapping("/homepage")
    public String homepage(){
        System.out.println("/homepage");
        return "/RecruitModule/homepage";
    }

    /*跳转到个人中心页面*/
    @RequestMapping("/weixininfo")
    public String weixininfo(){

        return "/RecruitModule/weixin_info";
    }

    /*跳转发布新职位页面*/
    @RequestMapping("/addRecruit")
    public String addRecruit(){
        return "/RecruitModule/post_position";
    }

    //htt
    /*跳转工作经历页*/
    @RequestMapping("/addworkexp")
    public String addWorkExp(){
        return "/RecruitModule/work_exp";
    }

    /*跳转到教育经历添加页面*/
    @RequestMapping("/addEduExp")
    public String addEduExp(){
        return "/RecruitModule/add_edu";
    }


    @RequestMapping("/manageresume")
    public String manageresume(){
        return "/index/manage_resume";
    }

    @RequestMapping("/indexpage")
    public String indexpage(HttpServletRequest request,HttpSession session){
        String openid=(String)session.getAttribute("oppen_id");
		Tuser tuserByOpenid =new Tuser();
		tuserByOpenid=trecruitService.getUserIdByOpenid(openid);
        List<Tbanner> tbannerList=jobuserService.selectIndexban();
        request.getSession().setAttribute("indexBan",tbannerList);
        System.out.println("TIP:"+tbannerList+tbannerList.get(0).getBanImg());
        if(tuserByOpenid!=null){
		request.getSession().setAttribute("userId",tuserByOpenid.getUserid());
            request.getSession().setAttribute("loginUser", tuserByOpenid);
        }

        return "/index/homepage";
    }

    @RequestMapping("/pcenter")
    public String pcenter(){
        return "/index/person_center";
    }
    @RequestMapping("/unserve")
    public String unserve(){
        return "/index/unserve";
    }
    @RequestMapping("/error")
    public String error(){

        return "/index/error";
    }

    @RequestMapping("/placeModule")
    public String placeModule(HttpServletRequest request,HttpServletResponse response,String place,String ptext, HttpSession session){
        System.out.println("PLACE:" + place);
        if(place!=null) {
            int a = Integer.parseInt(place);
            Tcitycode tcitycode =placeService.selectByid(a);
            List<PlaceInfo> placelist=placeService.selectByPP(tcitycode.getCname(), ptext ,session);
            List<Tcitycode> citycode = placeService.selectByPrimaryKey();

            if(citycode!=null){
                request.setAttribute("citycode", citycode);
            }

            if(placelist!=null){
                request.setAttribute("placelist", placelist);
            }
            return "/PlaceModule/place_index";

        }
        else {
            List<PlaceInfo> placelist = placeService.selectByPP(place, ptext, session);
            List<Tcitycode> citycode = placeService.selectByPrimaryKey();

            if(citycode!=null){
                request.setAttribute("citycode", citycode);
            }

            if(placelist!=null){
                request.setAttribute("placelist", placelist);
            }
            return "/PlaceModule/place_index";
        }


    }

    /**
     * 进入土地详情
     * @param request
     * @param response
     * @param id
     * @return
     */
    @RequestMapping("/placeDetais")
    public String placeXqshow(HttpServletRequest request,HttpServletResponse response,String id){
        PlaceInfo placeinfo=placeService.getplaceByid(id);
        if(placeinfo!=null){
            request.setAttribute("placeinfo", placeinfo);
        }
        return "PlaceModule/place_detais";
    }


    @RequestMapping(value = "/page/download.html")
    public void download(HttpServletResponse response)throws IOException {
        List<Order> orderList=orderService.selectall();
        int size=orderList.size();
        int count = size+5;//条数
        JSONArray ja = new JSONArray();
        for(int i=0;i<size;i++){
            Order od=new Order();
            od.setOrder_id(orderList.get(i).getOrder_id());

            od.setAddr_name(orderList.get(i).getAddr_name());
            od.setGoods_total(orderList.get(i).getGoods_total());
            od.setGoods_name(orderList.get(i).getGoods_name());

            od.setStatus(orderList.get(i).getStatus());
            od.setAdd_time(orderList.get(i).getAdd_time());

            ja.add(od);

           /*
            Student s = new Student();
            s.setName("POI"+i);
            s.setAge(i);
            s.setBirthday(new Date());
            s.setHeight(i);
            s.setWeight(i);
            s.setSex(i/2==0?false:true);
            ja.add(s);*/
        }
        Map<String,String> headMap = new LinkedHashMap<String,String>();
        headMap.put("order_id","订单号");
        headMap.put("goods_name","商品名");
        headMap.put("goods_total","支付金额（元）");
        headMap.put("addr_name","收货地址");

        headMap.put("status","订单状态(0-待支付；1-待发货；2-已发货)");
        headMap.put("add_time","添加时间");

        String title = "物业稻草人订单表";
        /*
        OutputStream outXls = new FileOutputStream("E://a.xls");
        System.out.println("正在导出xls....");
        Date d = new Date();
        ExcelUtil.exportExcel(title,headMap,ja,null,outXls);
        System.out.println("共"+count+"条数据,执行"+(new Date().getTime()-d.getTime())+"ms");
        outXls.close();*/
        //
        FileSystemView fsv = FileSystemView.getFileSystemView();
        File com=fsv.getHomeDirectory();
        System.out.println(com.getPath());

        ExcelUtil.downloadExcelFile(title, headMap, ja,response);


    }




}
