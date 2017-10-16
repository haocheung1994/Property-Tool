package cn.codingxiaxw.dao;


import com.job.dao.PlaceInfoMapper;
import com.job.dao.TrecruitMapper;
import com.job.dao.TsupplierMapper;
import com.job.model.PlaceInfo;
import com.job.model.Trecruit;
import com.job.model.Tsupplier;
import com.job.service.PositionService;
import com.job.service.SupplierService;
import com.job.utils.LocationUtils;
import net.sf.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import javax.jws.soap.SOAPBinding;

import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by codingBoy on 16/11/27.
 * 配置spring和junit整合，这样junit在启动时就会加载spring容器
 */
@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit spring的配置文件
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class SeckillDaoTest {

    //注入Dao实现类依赖

    @Resource
    TsupplierMapper tsupplierMapper;


    @Autowired
    TrecruitMapper trecruitMapper;
    @Autowired
    PlaceInfoMapper placeInfoMapper;

    @Test
    public void queryById() throws Exception {
        List<Trecruit> trecruitList = trecruitMapper.selectAll();
        for (Trecruit trecruit : trecruitList) {
            String address = trecruit.getWorkaddr().replaceAll(" ","").replaceAll(" ","");
            JSONObject jsonObject = PositionService.getLALODetail(address);
            if (jsonObject.get("result") != null) {
                JSONObject result = jsonObject.getJSONObject("result");
                if (result.get("location") !=null) {
                    JSONObject location =result.getJSONObject("location");
                    trecruit.setLng(location.getString("lng"));
                    trecruit.setLat(location.getString("lat"));
                    trecruitMapper.updateByRecruitid(trecruit);
                }
            }
           // System.out.println(jsonObject.get("result"));
        }
        System.out.println(trecruitList);

    }

    @Test
    public void queryAll() throws Exception {
        List<Trecruit> trecruitList = trecruitMapper.selectAllRecruit(500000);
        for (Trecruit trecruit:trecruitList){
            System.out.println(trecruit.getLat());
        }
            double lat0 =31.24916 ;
            double lng0 = 121.4879;
            Collections.sort(trecruitList, new Comparator<Trecruit>() {
                @Override
                public int compare(Trecruit o1, Trecruit o2) {
                    double lat1 = Double.parseDouble(o1.getLat());
                    double lng1 = Double.parseDouble(o1.getLng());
                    double lat2 = Double.parseDouble(o2.getLat());
                    double lng2 = Double.parseDouble(o2.getLng());
                    Double d1 = LocationUtils.getDistance(lat0,lng0,lat1,lng1);
                    Double d2 = LocationUtils.getDistance(lat0,lng0,lat2,lng2);
                    return d1.compareTo(d2);
                }
            });
            for (Trecruit trecruit :trecruitList){
                System.out.println(trecruit.getCompanyname8());
            }
        //System.out.println(trecruitList);
    }

    @Test
    public void reduceNumber() throws Exception {
        List<PlaceInfo> placeInfos = placeInfoMapper.selectAll();
        for (PlaceInfo trecruit:placeInfos){
            String address = trecruit.getLocationwz().replaceAll("","");
            System.out.println(address);
            JSONObject jsonObject = PositionService.getLALODetail(address);
            if (jsonObject.get("result") != null) {
                JSONObject result = jsonObject.getJSONObject("result");
                if (result.get("location") !=null) {
                    JSONObject location =result.getJSONObject("location");
                    trecruit.setLng(location.getString("lng"));
                    trecruit.setLat(location.getString("lat"));
                    placeInfoMapper.updatePlace(trecruit);
                }
            }
            // System.out.println(jsonObject.get("result"));
        }
        //System.out.println(trecruitList);
    }

    @Test
    public void testtttt() throws Exception {
        List<PlaceInfo> a = placeInfoMapper.selectAll();
        System.out.println(a.size());
    }
}