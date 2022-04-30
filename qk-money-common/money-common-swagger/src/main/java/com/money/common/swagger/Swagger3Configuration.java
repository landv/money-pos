package com.money.common.swagger;

import io.swagger.v3.oas.models.ExternalDocumentation;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.License;
import lombok.extern.slf4j.Slf4j;
import org.springdoc.core.GroupedOpenApi;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


/**
 * @author : money
 * @version : 1.0.0
 * @description : swagger3配置类
 * @createTime : 2021-09-04 14:18:06
 */
@Slf4j
@Configuration(proxyBeanMethods = false)
@EnableConfigurationProperties(SwaggerProperties.class)
public class Swagger3Configuration {

    @Bean
    public GroupedOpenApi createRestApi(SwaggerProperties swaggerProperties) {
        log.info("开启Swagger3：{}", "http://{host}/{context-path}/swagger-ui.html");
        return GroupedOpenApi.builder()
                .group(swaggerProperties.getProjectName())
                // 扫描的包
                .packagesToScan(swaggerProperties.getScanPackage())
                .build();
    }


    @Bean
    public OpenAPI springShopOpenAPI(SwaggerProperties swaggerProperties) {
        return new OpenAPI()
                .info(new Info()
                        .title(swaggerProperties.getTitle())
                        .description(swaggerProperties.getDescription())
                        .version(swaggerProperties.getVersion())
                        .contact(new Contact()
                                .name(swaggerProperties.getContact().getName())
                                .url(swaggerProperties.getContact().getUrl())
                                .email(swaggerProperties.getContact().getEmail()))
                        .license(new License()
                                .name(swaggerProperties.getLicense().getName())
                                .url(swaggerProperties.getLicense().getUrl())
                        )
                )
                .externalDocs(new ExternalDocumentation()
                        .url(swaggerProperties.getExternalDocumentation().getUrl())
                        .description(swaggerProperties.getExternalDocumentation().getDescription()));
    }
}