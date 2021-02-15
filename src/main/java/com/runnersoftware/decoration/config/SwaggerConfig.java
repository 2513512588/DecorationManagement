package com.runnersoftware.decoration.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;


/**
 * "@EnableSwagger2 启用swagger
 */
@EnableSwagger2
@EnableWebMvc
@Configuration
public class SwaggerConfig {


    @Bean
    public Docket webApi(){
        return new Docket(DocumentationType.SWAGGER_2).apiInfo(new ApiInfoBuilder().build());
    }

}
