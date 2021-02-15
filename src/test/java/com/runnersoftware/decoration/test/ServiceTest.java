package com.runnersoftware.decoration.test;


import com.runnersoftware.decoration.service.MaterialService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-config.xml")
public class ServiceTest {

    @Autowired
    private MaterialService materialService;

    @Test
    public void testFindMaterial(){
        Map<String, Object> params = new HashMap<String, Object>(2);
        params.put("pageNum", 1);
        params.put("pageSize", 10);
        materialService.findAllByPage(params);
    }


}
