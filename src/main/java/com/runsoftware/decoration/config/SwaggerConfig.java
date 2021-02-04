package com.runsoftware.decoration.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * @author HHY
 */
@EnableSwagger2
@Configuration
public class SwaggerConfig {

    @Bean
    public Docket webApi(){
        return new Docket(DocumentationType.SWAGGER_2);
    }

}
