package com.runnersoftware.decoration.service.Impl;

import com.runnersoftware.decoration.model.VerificationCode;
import com.runnersoftware.decoration.service.VerificationCodeService;
import org.springframework.stereotype.Service;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.Date;
import java.util.Random;

@Service
public class VerificationCodeServiceImpl implements VerificationCodeService {

    private final Random random = new Random();

    @Override
    public VerificationCode generator() {
        int width = 150;
        int height = 50;
        BufferedImage image = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
        Graphics2D graphics2D = (Graphics2D) image.getGraphics();
        graphics2D.setBackground(Color.gray);
        graphics2D.fillRect(0,0,width,height);
        graphics2D.setColor(Color.blue);
        graphics2D.drawRect(2,2,width-4,height-4);
        StringBuilder code = new StringBuilder();
        for (int i = 0; i < 5; i++) {
            graphics2D.setColor(Color.RED);
            graphics2D.drawLine(randomNum(0, width), randomNum(0, height), randomNum(0, width), randomNum(0, height));
        }
        for (int i = 0; i < 4; i++) {
            graphics2D.setColor(new Color(randomNum(0, 255), randomNum(0, 255), randomNum(0, 255)));
            graphics2D.setFont(new Font("黑体", Font.BOLD, 30));
            //-45,45
            int r = randomNum(-20,20);
            graphics2D.rotate(1.0*Math.PI*r/180,30 * i, 22);
            int rdNum = random.nextInt(10);
            code.append(rdNum);
            graphics2D.drawString(rdNum+" ", 40 * i, 40);
            graphics2D.rotate(-1.0*Math.PI*r/180,30 * i, 22);
        }
        return new VerificationCode(code.toString(), new Date(), image);
    }

    private int randomNum(int start, int end) {
        return random.nextInt(end - start) + start;
    }

}
