package com.job.service.impl;

import com.job.dao.TsupplierMapper;
import com.job.model.Tsupplier;
import com.job.service.TestIn;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by LC on 2017/6/21.
 */
@Service
public class TestInImpl implements TestIn{

    @Override
    public void tessstt() {
        System.out.println("OK");
    }

}
