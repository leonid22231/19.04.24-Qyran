package com.thedeveloper.qyran.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties("test")
@Data
public class TestProperties {
    private String location;
}
