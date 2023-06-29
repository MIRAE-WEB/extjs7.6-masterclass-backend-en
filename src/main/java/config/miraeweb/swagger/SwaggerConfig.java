package config.miraeweb.swagger;
import com.fasterxml.classmate.GenericType;
import com.fasterxml.classmate.TypeResolver;
import com.google.common.base.Predicates;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.ResponseEntity;
import org.springframework.web.context.request.async.DeferredResult;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.schema.AlternateTypeRules;
import springfox.documentation.schema.WildcardType;
import springfox.documentation.service.*;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;


@Configuration
@EnableSwagger2
@EnableAutoConfiguration
public class SwaggerConfig {

    Contact contact= new Contact("Miraeweb",
            "https://miraeweb.com",
            "dev@miraeWeb.kr");

    List<VendorExtension> vendorExtensions = new ArrayList<>();


    ApiInfo apiInfo = new ApiInfo(
            "MiraeWeb API Document",
            "This pages documents Photo app RESTful Web Service endpoints", "1.0",
            "http://www.appsdeveloperblof.com/service.html", contact,
            "Apache 2.0", "http://www.apache.org/licenses/LICENSE-2.0",vendorExtensions);

    List<SecurityScheme> securitySchemes(){
        List<SecurityScheme> result = new ArrayList<>();
        result.add(new ApiKey("Bearer", "Authorization", "header"));
        return result;
    }

    @Autowired
    private TypeResolver typeResolver;

    @Bean
    public Docket api() {

        return new Docket(DocumentationType.SWAGGER_2)
                .alternateTypeRules(
                        AlternateTypeRules.newRule(
                                typeResolver.resolve(
                                        DeferredResult.class,
                                        typeResolver.resolve(GenericType.class, WildcardType.class)
                                ),
                                typeResolver.resolve(WildcardType.class)
                        )
                ).enableUrlTemplating(false)
                .groupName("Web API Server")
                .select()
                .apis(RequestHandlerSelectors.any())
                .paths(Predicates.not(PathSelectors.regex("/error.*")))
                .paths(Predicates.not(PathSelectors.regex("/ping")))
                .build()
                .apiInfo(apiInfo)
                .pathMapping("/")
                .directModelSubstitute(LocalDate.class, String.class)
                .genericModelSubstitutes(ResponseEntity.class)
                .useDefaultResponseMessages(false)
                .securitySchemes(securitySchemes());
    }
}
