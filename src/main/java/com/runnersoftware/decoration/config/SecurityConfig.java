package com.runnersoftware.decoration.config;

import com.runnersoftware.decoration.handler.AccessDeniedHandlerImpl;
import com.runnersoftware.decoration.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.header.HeaderWriter;
import org.springframework.security.web.header.HeaderWriterFilter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;


@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Bean
    PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }

    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    private UserService userService;
    private PasswordEncoder passwordEncoder;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Autowired
    public void setPasswordEncoder(PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
       http.csrf().disable().cors().disable().authorizeRequests().anyRequest().permitAll()
       .and().exceptionHandling().accessDeniedHandler(new AccessDeniedHandlerImpl())
       .and().formLogin().loginPage("/login").loginProcessingUrl("/user/login")
       .and().logout().logoutUrl("/user/logout").logoutSuccessUrl("/login");

        HeaderWriter headerWriter = new HeaderWriter() {
            @Override
            public void writeHeaders(HttpServletRequest request, HttpServletResponse response) {
                response.setHeader("X-Frame-Options","SAMEORIGIN");
            }
        };
        List<HeaderWriter> headerWriters = new ArrayList<>();
        headerWriters.add(headerWriter);
        HeaderWriterFilter headerWriterFilter = new HeaderWriterFilter(headerWriters);
        http.addFilter(headerWriterFilter);

    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userService).passwordEncoder(passwordEncoder);
    }

}
