package com.xworkz.medisales.configuration;


import com.xworkz.medisales.constant.Constants;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.spring5.templateresolver.SpringResourceTemplateResolver;
import org.thymeleaf.templatemode.TemplateMode;

import javax.sql.DataSource;
import java.util.Properties;

@Slf4j
@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "com.xworkz.medisales")
public class SpringConfiguration implements WebMvcConfigurer {
    public SpringConfiguration() {

    }

    @Bean
    public LocalContainerEntityManagerFactoryBean managerFactoryBean() {
        LocalContainerEntityManagerFactoryBean bean = new LocalContainerEntityManagerFactoryBean();
        bean.setPackagesToScan("com.xworkz.medisales.entity");
        bean.setDataSource(getDataSource());
        bean.setJpaVendorAdapter(new HibernateJpaVendorAdapter());
        bean.setJpaProperties(getProperties());
        return bean;
    }

    @Bean
    public DataSource getDataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
        dataSource.setPassword("Xworkzodc@123");
        dataSource.setUrl("jdbc:mysql://localhost:3306/medi_sales");
        dataSource.setUsername("root");
        return dataSource;
    }

    @Bean
    public Properties getProperties() {
        Properties properties = new Properties();
        properties.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL8Dialect");
        //  properties.setProperty("hibernate.show_sql","true");
        return properties;
    }

    @Bean
    public ViewResolver viewResolver() {

        return new InternalResourceViewResolver("/", ".jsp");
    }
    @Bean
    public MultipartResolver multipartResolver() {
        return new StandardServletMultipartResolver();
    }

    @Bean
    public JavaMailSender getJavaMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.gmail.com");
        mailSender.setPort(587);

        mailSender.setUsername(Constants.FROM_EMAIL.getPath());
        mailSender.setPassword(Constants.PASSWORD.getPath());

        Properties properties = mailSender.getJavaMailProperties();
        properties.put("mail.transport.protocol", "smtp");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.debug", "true");

        return mailSender;
    }

    @Bean
    public PasswordEncoder passwordEncoder(){

        return new BCryptPasswordEncoder();
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry){
        registry.addResourceHandler("/**").addResourceLocations("/");
    }

    @Bean
    public SpringResourceTemplateResolver springResourceTemplateResolver()
    {
        SpringResourceTemplateResolver springResourceTemplateResolver = new SpringResourceTemplateResolver();
        springResourceTemplateResolver.setPrefix("template/");
        springResourceTemplateResolver.setSuffix(".html");
        springResourceTemplateResolver.setTemplateMode(TemplateMode.HTML);
        springResourceTemplateResolver.setCharacterEncoding("UTF-8");
        return springResourceTemplateResolver;
    }


    @Bean
    public TemplateEngine templateEngine()
    {
        TemplateEngine templateEngine = new TemplateEngine();
        templateEngine.setTemplateResolver(springResourceTemplateResolver());
        return templateEngine;
    }
}