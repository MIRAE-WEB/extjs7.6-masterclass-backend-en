package com.miraeweb.boot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(
        scanBasePackages = {
                "config.miraeweb.*",
                "com.miraeweb.*"
        }
)
public class SpringMiraewebBoot {

    public static void main(String[] args){

        SpringApplication.run(SpringMiraewebBoot.class);
    }
}
