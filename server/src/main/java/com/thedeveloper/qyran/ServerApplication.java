package com.thedeveloper.qyran;

import com.thedeveloper.qyran.config.TestConfig;
import com.thedeveloper.qyran.service.TestService;
import com.thedeveloper.qyran.service.TestsService;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
@EnableConfigurationProperties({TestConfig.class})
public class ServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(ServerApplication.class, args);
    }
    @Bean
    CommandLineRunner init(@Qualifier("testsService") TestsService testService) {
        return (args) -> {
            testService.init();
        };}
}
