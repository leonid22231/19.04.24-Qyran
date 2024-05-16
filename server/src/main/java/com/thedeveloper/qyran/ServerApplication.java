package com.thedeveloper.qyran;

import com.thedeveloper.qyran.config.ImageProperties;
import com.thedeveloper.qyran.config.TestProperties;
import com.thedeveloper.qyran.service.TestsService;
import com.thedeveloper.qyran.util.StorageService;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
@EnableConfigurationProperties({TestProperties.class, ImageProperties.class})
public class ServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(ServerApplication.class, args);
    }
    @Bean
    CommandLineRunner init(@Qualifier("testsService") TestsService testService) {
        return (args) -> {
            testService.init();
        };}

    @Bean
    CommandLineRunner init_image(@Qualifier("imageService") StorageService storageService) {
        return (args) -> {
            storageService.init();
        };}
}
