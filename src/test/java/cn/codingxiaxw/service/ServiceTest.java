package cn.codingxiaxw.service;





import com.job.model.Tsupplier;
import com.job.service.CnmService;
import com.job.service.SupplierService;
import com.job.service.TestIn;
import com.weixin.service.WxSettingService;
import com.yq.entity.User;
import com.yq.service.AddressService;
import com.yq.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

/**
 * Created by LC on 2017/6/21.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml","classpath:spring/spring-service.xml"})
public class ServiceTest {
    @Resource
    UserService userService;
    @Resource
    CnmService cnmService;
    @Resource
    TestIn testIn;
    @Resource
    SupplierService supplierService;
    @Resource
    WxSettingService wxSettingService;
//    @Resource
//    WxSettingService wxSettingService;
//    @Resource
//    SupplierService supplierService;
//
//    @Resource
//    TestIn testIn;
    @Test
    public void test1(){
     testIn.tessstt();
    }
    @Test
    public void tttt(){
   User a= userService.aa();
        System.out.println(a);
    }
    @Test
    public void cnm(){
     Tsupplier a= supplierService.selectBySupplierId(1);
        System.out.println(a);
    }
    @Test
    public void aaa(){
        wxSettingService.selectByPrimaryKey(1);
    }

}
