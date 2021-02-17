package com.runnersoftware.decoration.controller;

import com.runnersoftware.decoration.model.VerificationCode;
import com.runnersoftware.decoration.service.VerificationCodeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Api(tags = "验证码控制器")
@Controller
public class VerificationCodeController {

    private VerificationCodeService verificationCodeService;

    @Autowired
    public void setVerificationCodeService(VerificationCodeService verificationCodeService) {
        this.verificationCodeService = verificationCodeService;
    }

    @ApiOperation("生成验证码")
    @GetMapping("/code")
    public void generator(HttpSession session, HttpServletResponse response) throws IOException {
        VerificationCode verificationCode = verificationCodeService.generator();
        response.setHeader("Pragma","No-cache");
        response.setHeader("Cache-Control","no-cache");
        response.setContentType("image/jpeg");
        response.setDateHeader("Expires", 0);
        ImageIO.write(verificationCode.getBufferedImage(),"jpeg", response.getOutputStream());
        session.removeAttribute("code");
        session.setAttribute("code", verificationCode);
    }

}
