package com.runnersoftware.decoration.service.Impl;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.runnersoftware.decoration.service.OssService;
import com.runnersoftware.decoration.utils.AliOssProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.io.InputStream;
import java.util.UUID;

@Service
public class OssServiceImpl implements OssService {

    private AliOssProperties aliOssProperties;

    @Qualifier("aliOssProperties")
    @Autowired
    public void setAliOssProperties(AliOssProperties aliOssProperties) {
        this.aliOssProperties = aliOssProperties;
    }

    public String upload(InputStream in) {
        OSS oss = new OSSClientBuilder().build(aliOssProperties.getEndPoint(), aliOssProperties.getKeyId(), aliOssProperties.getKeySecret());
        String fileName = UUID.randomUUID().toString().replace("-","");
        oss.putObject(aliOssProperties.getBucketName(),fileName, in);
        oss.shutdown();
        return "https://".concat(aliOssProperties.getBucketName()).concat(".").concat(aliOssProperties.getEndPoint()).concat("/").concat(fileName);
    }
}
