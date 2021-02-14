package com.runnersoftware.decoration.utils;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


import java.io.Serializable;

/**
 * xml中配置bean一定要有这个默认空的构造器
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AliOssProperties implements Serializable {

    private String endPoint;
    private String bucketName;
    private String keyId;
    private String keySecret;



}
