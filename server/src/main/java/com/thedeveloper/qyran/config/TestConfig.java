package com.thedeveloper.qyran.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@ConfigurationProperties("test")
@Data
public class TestConfig {
    private String location;
}
