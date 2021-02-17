package com.runnersoftware.decoration.model;

import lombok.Getter;

import java.awt.image.BufferedImage;
import java.util.Date;

@Getter
public class VerificationCode {
    
    private String code;
    private Date time;
    private BufferedImage bufferedImage;
    private static final Long EXPIRE_TIME = 1000*60*30L;

    public VerificationCode(String code, Date time, BufferedImage bufferedImage) {
        this.code = code;
        this.time = new Date(time.getTime() + EXPIRE_TIME);
        this.bufferedImage = bufferedImage;
    }

    public boolean isExpired(){
        return new Date().after(time);
    }

}
