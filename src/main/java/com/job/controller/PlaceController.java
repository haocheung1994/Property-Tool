package com.job.controller;

import com.job.service.PlaceService;
import com.job.model.PlaceInfo;
import com.job.service.PlaceService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("Place")
public class PlaceController {
	
	private Logger log = Logger.getLogger(PlaceController.class);
	
	@Resource
	private PlaceService palceservice;
	
	/**
	 * api用于后台pc端土地模块，点击进行获取数据，前台暂无显示效果，效果需要调用查询api
	 * @param request
	 * @param response
	 * @param ptext （1，民用，2，商用）
	 */
	@RequestMapping("/place")
	public void show(HttpServletRequest request,HttpServletResponse response,String ptext,String pl,String cookie){
		
		System.out.println("抓取中。。。。。");
		  try {
			  if(cookie==null){
				  cookie="global_cookie=c0eu62br4qj2hfg8uw189k6el2vj32ry9ba; bdshare_firstime=1495617472565; searchLabelN=3_1495689250_15452%5B%3A%7C%40%7C%3A%5D8c58b5ba354221be93311edccb08d63d; searchConN=3_1495689250_15467%5B%3A%7C%40%7C%3A%5Dd6e36694bd6d656e2d711fa67ba414a4; uservisitfinitem=320360%257c%25c9%25cf%25ba%25a3%25bb%25c6%25c6%25d6%25c7%25f88644%25c6%25bd%25b1%25f6%25c1%25fa%25c9%25cc%25ce%25f1%25be%25c6%25b5%25ea5%25d2%25da%25d5%25fb%25cc%25e5%25d7%25aa%25c8%25c3%257c50000%257c2017%252f5%252f26%2b15%253a29%253a22; userguid=F+dk7Is3mzhwLBNTNg4bZWzlTnflwDX5ELAlOnTJAhDrTMRYK+P4dw==; city=www1; s=bdpz-bl; showAdquanguo=1; indexAdvLunbo=lb_ad1%2C0; ASP.NET_SessionId=cmf42145tjwib145ut2jz1ap; uservisitMarketitem=%2c599ce5a7-dfc6-42c2-8343-c63958eda4eb%7c%7c2017%2f5%2f24+17%3a47%3a29%2c3583606d-15e3-4a5a-b3ca-536f1939b37d%7c%7c2017%2f5%2f24+17%3a49%3a33%2c2f8e11a9-86bb-40f8-9949-a729b7124738%7c%7c2017%2f5%2f24+17%3a49%3a50%2cf82f430b-fded-4bf0-8812-34915ee76902%7c%7c2017%2f5%2f24+17%3a50%3a07%2c0cd0bb94-c244-454a-b89a-edb70bae8240%7c%7c2017%2f5%2f24+18%3a29%3a15%2ce1955fc4-f7b3-4502-9ccc-e41fb779a847%7c%7c2017%2f5%2f24+18%3a39%3a23%2cd087b76b-847c-4c6b-9938-f51b64a0007f%7c%7c2017%2f5%2f25+9%3a51%3a35%2c667efb39-9d0e-468f-9510-553e98540c44%7c%7c2017%2f5%2f25+9%3a53%3a20%2c2de92502-0623-4964-926c-02422314b922%7c%7c2017%2f5%2f25+9%3a55%3a14%2c88cc4a3f-1394-4f35-9452-2828315847f3%7c%7c2017%2f5%2f25+9%3a55%3a28%2c9545f5f0-a78f-49d5-addb-ef427b4f7eb9%7c%7c2017%2f5%2f25+9%3a55%3a31%2cfb2388ec-5ac9-487c-aff5-da29f917fa0e%7c%7c2017%2f5%2f25+9%3a55%3a35%2c6308431e-bd61-4ec4-a921-b175bf2f5b46%7c%7c2017%2f5%2f25+13%3a15%3a22%2cce19bd06-bab0-4fed-9b6c-94dac305777a%7c%7c2017%2f5%2f25+13%3a15%3a32%2c99c2d32d-5fce-4c86-81a5-fbebb82a20c3%7c%7c2017%2f5%2f25+13%3a15%3a38%2c7b7d431e-76c4-4559-a61a-780bfa3e16f1%7c%7c2017%2f5%2f25+13%3a15%3a43%2c64337eab-2829-45f8-957c-5931146c6844%7c%7c2017%2f5%2f25+13%3a15%3a56%2cccd4f355-23fb-42be-8152-3a8e53f630f5%7c%7c2017%2f5%2f25+13%3a16%3a36%2c5685a260-cf71-4b75-b4c1-d20e22237966%7c%7c2017%2f5%2f25+13%3a16%3a44%2ca0575922-95ba-47fc-b13d-3754fbf2ca56%7c%7c2017%2f5%2f25+13%3a16%3a54%2c4cbcf05c-93b6-4f07-8552-b3bde56a77b0%7c%7c2017%2f5%2f25+13%3a17%3a08%2c8ff984f4-a175-4ed0-906a-f83bb3a89d06%7c%7c2017%2f5%2f25+13%3a17%3a15%2c3c9237b6-e817-4f70-ae92-915b1ef5fa57%7c%7c2017%2f5%2f25+13%3a17%3a20%2c0ac1b679-d46c-4b90-b2cf-c9bbbcdf8ae8%7c%7c2017%2f5%2f25+13%3a17%3a24%2c95e18a7b-7b31-4748-9fca-df25210025b1%7c%7c2017%2f5%2f25+13%3a17%3a27%2c52c3cbe5-1938-46eb-8b55-4407c9edf172%7c%7c2017%2f5%2f25+13%3a52%3a10%2c57a159e9-555d-442c-9df1-ae2a5cdec8f0%7c%7c2017%2f5%2f25+15%3a56%3a41%2cdc9495c5-2009-4334-a7b6-c0f57efd1cf9%7c%7c2017%2f5%2f25+15%3a56%3a45%2c43653ed2-bdd9-44fb-8c95-0c9cc1589d77%7c%7c2017%2f5%2f26+14%3a18%3a56%2c2d47d488-c89f-4c3e-9c21-a97bf90e7b90%7c%7c2017%2f5%2f26+17%3a58%3a56%2cd0c65dd9-516c-4ef6-909e-ad8f6b1ae7bc%7c%7c2017%2f6%2f1+9%3a43%3a02%2c022ca998-5bab-4594-9322-6a029b47ea37%7c%7c2017%2f6%2f1+11%3a05%3a22%2c2c50dcee-f746-4d92-bfa7-06c34ac01cf7%7c%7c2017%2f6%2f2+11%3a08%3a29; token=4a96259f8f97415bacc88042d5134e39; sfut=D528C3CC7ADF791BA2C412970FE459CD2ADB3FC07F9DE55AA1691495E8F4419C6E93ABBF1E2E600CB11BA97066D4E3FC5C84CF96E22FC2EC342F2EB77D27D882DE5794EFC75E735F06905D9733BA362F6F26E992EA4123187AD84B92F1322437; __utmt_t0=1; __utmt_t1=1; __utma=147393320.174350791.1495617345.1496285585.1496372946.20; __utmb=147393320.59.10.1496372946; __utmc=147393320; __utmz=147393320.1496372946.20.8.utmcsr=baidu|utmccn=(organic)|utmcmd=organic|utmctr=%E6%88%BF%E5%A4%A9%E4%B8%8B; Hm_lvt_9e45c915a52098cc2e351c0e70fe1900=1496282460,1496285625,1496286216,1496372957; Hm_lpvt_9e45c915a52098cc2e351c0e70fe1900=1496373607; unique_cookie=U_hfvfjlfo2m4ykuqkwviz7vn1v1kj3f9tei2*27";
			  }else{
				  cookie=cookie;
			  }
//			  	pl="320300";//徐州编号
			  	ptext=ptext;
	        	int leg=3;
	    		String url = ""; 
	    		String mhao="0";
	    		//第一个1为住宅用地，2为商业用地
	    		for (int pa = 1; pa <=leg; pa++) {
	    			url="http://land.fang.com/market/"+pl+"__"+ptext+"_2_____3_0_"+pa+".html";
	    			Map<String, String> cookies = null;  
	    			cookies = new HashMap<String, String>();  
	    			cookies.put("__ads_session", cookie);
	            Document doc = Jsoup.connect(url).cookies(cookies).get();

	            Elements container = doc.getElementsByClass("llist01");

	            Document containerDoc = Jsoup.parse(container.toString());

	            Elements module = containerDoc.getElementsByClass("fl");


	            for (Element clearfixli : module){
	                Document clearfixliDoc = Jsoup.parse(clearfixli.toString());
//	                Elements kind = clearfixliDoc.select(".board-tag");  //选择器的形式
	                  Elements author = clearfixliDoc.select("h3 a");

//	                System.out.println("详情链接"+author.attr("href"));  //标题下的链接
	                String urls="http://land.fang.com"+author.attr("href");
	                
	                Document docs = Jsoup.connect(urls).cookies(cookies).get();
	                Elements containers = docs.getElementsByClass("border07");
	                Document containerDocs = Jsoup.parse(containers.toString());
	                Elements bhao=containerDocs.getElementsByClass("mt20");
	                Elements p105 = containerDocs.getElementsByClass("p1015");
	               
	                
	                if(p105.toString().contains("*")){
	                	continue;
	                }else{
	                	Document docbh=Jsoup.parse(bhao.toString());
	 	                Elements b2=docbh.getElementsByClass("gray2");
	 	                  String  bianhao= b2.text().substring(b2.text().indexOf("：")+1);
	                	//获取基本和交易信息的父亲及
	                	  Elements modules = containerDocs.getElementsByClass("mt10");
	                	  
	                	  //基本信息
	                	  String region="";
	                	  String place="";
	                	  String totalarea="";
	                	  String consplace="";
	                	  String propalce="";
	                	  String authpalce="";
	                	  String plotratiolv="";
	                	  String afforestlv="";
	                	  String businesslv="";
	                	  String buildmd="";
	                	  String astrictgd="";
	                	  String tosellxs="";
	                	  String tosellnx="";
	                	  String locationwz="";
	                	  String placess="";
	                	  String planyt="";
	                	  
	                	  //交易字段
	                	  String dealstate="";
	                	  String viejdf="";
	                	  String qsritime="";
	                	  String jzrqtime="";
	                	  String cjrqtime="";
	                	  String jydiplace="";
	                	  String qsjmoney="";
	                	  String cjjmoney="";
	                	  String lmdjmoney="";
	                	  String yjlv="";
	                	  String tdgg="";
	                	  String zxdhphone="";
	                	  String bzjmoney="";
	                	  String zxjjfdmoney="";
	                	
	                		  
	                	
	                	//基本信息
	                    for (Element clearfixlis : modules.get(0).select("tbody")){
	                    	
	                  	Elements mos=clearfixlis.select("td");
	                  	region=mos.get(0).text().substring(mos.get(0).text().indexOf("：")+1);
	                  	place=mos.get(1).text().substring(mos.get(1).text().indexOf("：")+1);
	                  	totalarea=mos.get(2).text().substring(mos.get(2).text().indexOf("：")+1);
	                  	consplace=mos.get(3).text().substring(mos.get(3).text().indexOf("：")+1);
	                  	propalce=mos.get(4).text().substring(mos.get(4).text().indexOf("：")+1);
	                  	authpalce=mos.get(5).text().substring(mos.get(5).text().indexOf("：")+1);
	                  	plotratiolv=mos.get(6).text().substring(mos.get(6).text().indexOf("：")+1);
	                  	afforestlv=mos.get(7).text().substring(mos.get(7).text().indexOf("：")+1);
	                  	businesslv=mos.get(8).text().substring(mos.get(8).text().indexOf("：")+1);
	                  	buildmd=mos.get(9).text().substring(mos.get(9).text().indexOf("：")+1);
	                  	astrictgd=mos.get(10).text().substring(mos.get(10).text().indexOf("：")+1);
	                  	tosellxs=mos.get(11).text().substring(mos.get(11).text().indexOf("：")+1);
	                  	tosellnx=mos.get(12).text().substring(mos.get(12).text().indexOf("：")+1);
	                  	locationwz=mos.get(13).text().substring(mos.get(13).text().indexOf("：")+1);
	                  	placess=mos.get(14).text().substring(mos.get(14).text().indexOf("：")+1);
	                  	planyt=mos.get(15).text().substring(mos.get(15).text().indexOf("：")+1);
	              	
							
	                    }//for的
	                    //交易信息
	                    for (Element elmodu : modules.get(1).select("tbody")) {
	                    	Elements mos=elmodu.select("td");
	               
	                    	dealstate=mos.get(0).text().substring(mos.get(0).text().indexOf("：")+1);
	                    	viejdf=mos.get(1).text().substring(mos.get(1).text().indexOf("：")+1);
	                    	qsritime=mos.get(2).text().substring(mos.get(2).text().indexOf("：")+1);
	                    	jzrqtime=mos.get(3).text().substring(mos.get(3).text().indexOf("：")+1);
	                    	cjrqtime=mos.get(4).text().substring(mos.get(4).text().indexOf("：")+1);
	                    	jydiplace=mos.get(5).text().substring(mos.get(5).text().indexOf("：")+1);
	                    	qsjmoney=mos.get(6).text().substring(mos.get(6).text().indexOf("：")+1);
	                    	cjjmoney=mos.get(7).text().substring(mos.get(7).text().indexOf("：")+1);
	                    	lmdjmoney=mos.get(8).text().substring(mos.get(8).text().indexOf("：")+1);
	                    	yjlv=mos.get(9).text().substring(mos.get(9).text().indexOf("：")+1);
	                    	tdgg=mos.get(10).text().substring(mos.get(10).text().indexOf("：")+1);
	                    	zxdhphone=mos.get(11).text().substring(mos.get(11).text().indexOf("：")+1);
	                    	bzjmoney=mos.get(12).text().substring(mos.get(12).text().indexOf("：")+1);
	                    	zxjjfdmoney=mos.get(13).text().substring(mos.get(13).text().indexOf("：")+1);
					
						}
	                   
	                    //插入数据库
//	                    System.out.println("最小溢出"+zxjjfdmoney);
	                    PlaceInfo placeinfo=new PlaceInfo();
	                    placeinfo.setRegion(region);
	                    placeinfo.setPlace(place);
	                    placeinfo.setTotalarea(totalarea);
	                    placeinfo.setConsplace(consplace);
	                    placeinfo.setPropalce(propalce);
	                    placeinfo.setAuthpalce(authpalce);
	                    placeinfo.setPlotratiolv(plotratiolv);
	                    placeinfo.setAfforestlv(afforestlv);
	                    placeinfo.setBusinesslv(businesslv);
	                    placeinfo.setBuildmd(buildmd);
	                    placeinfo.setAstrictgd(astrictgd);
	                    placeinfo.setTosellxs(tosellxs);
	                    placeinfo.setTosellnx(tosellnx);
	                    placeinfo.setLocationwz(locationwz.trim());
	                    placeinfo.setPlacess(placess);
	                    placeinfo.setPlanyt(planyt);
	                    placeinfo.setDealstate(dealstate);
	                    placeinfo.setViejdf(viejdf);
	                    placeinfo.setQsritime(qsritime);
	                    placeinfo.setJzrqtime(jzrqtime);
	                    placeinfo.setCjrqtime(cjrqtime);
	                    placeinfo.setJydiplace(jydiplace);
	                    placeinfo.setQsjmoney(qsjmoney);
	                    placeinfo.setCjjmoney(cjjmoney);
	                    placeinfo.setLmdjmoney(lmdjmoney);
	                    placeinfo.setYjlv(yjlv);
	                    placeinfo.setTdgg(tdgg);
	                    placeinfo.setZxdhphone(zxdhphone);
	                    placeinfo.setBzjmoney(bzjmoney);
	                    placeinfo.setZxjjfdmoney(zxjjfdmoney);
	                    placeinfo.setPtext(ptext);
	                    placeinfo.setBianhao(bianhao);
	                    
	                    int count=palceservice.getInsert(placeinfo);
	                    if(count>0){
	                    	 System.out.println("--------------成功插入------------");
	                    }else{
	                    	System.out.println("网站进行修改。。。。。。");
	                    }
	                   
	                }//else的
	              
	            	}
	    		}

	        } catch (IOException e) {
	        	System.out.println("服务器太累，请过会再进行抓取。。。。");
	        }
	}
	
	/**
	 * 用于前台进行查询显示
	 * @param request
	 * @param response
	 * @param load    区域
	 * @param mstext  土地类型
	 */
	@RequestMapping("/msshow")
	public void show2(HttpServletRequest request,HttpServletResponse response,String load,String mstext){
			try {
//				mstext="2";
//				load="江苏";
				JSONObject jsonObject=new JSONObject();
				if(load==null&&mstext==null){
					List<PlaceInfo> place=palceservice.selectplaces();
					JSONArray jsonarray=JSONArray.fromObject(place);
					response.setContentType("application/json");
					jsonObject.put("data", jsonarray);
					response.getWriter().print(jsonObject.toString());
				}else{
					if(mstext.equals("1")){
						List<PlaceInfo> place=palceservice.selectmplace(load);
						JSONArray jsonarray=JSONArray.fromObject(place);
						response.setContentType("application/json");
						jsonObject.put("data", jsonarray);
						response.getWriter().print(jsonObject.toString());
						System.out.println(jsonarray);
					}else if(mstext.equals("2")){
						List<PlaceInfo> place=palceservice.selectsplace(load);
						JSONArray jsonarray=JSONArray.fromObject(place);
						response.setContentType("application/json");
						jsonObject.put("data", jsonarray);
						response.getWriter().print(jsonObject.toString());
						System.out.println(jsonarray);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
	
	/**
	 * 根据编号id进行查询
	 * @param request
	 * @param response
	 * @param id   编号
	 */
	@RequestMapping("/xqshow")
	public void toxqshow(HttpServletRequest request,HttpServletResponse response,String id){
		try {
			JSONObject jsonObject=new JSONObject();
			PlaceInfo plainfo=palceservice.getplaceByid(id);
			jsonObject.put("data", plainfo);
			response.setContentType("application/json");
			response.getWriter().print(jsonObject.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}



}
