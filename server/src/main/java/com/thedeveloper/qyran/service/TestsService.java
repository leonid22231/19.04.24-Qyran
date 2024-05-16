package com.thedeveloper.qyran.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.thedeveloper.qyran.config.TestProperties;
import com.thedeveloper.qyran.entity.TestEntity;
import com.thedeveloper.qyran.models.TestModel;
import com.thedeveloper.qyran.models.TrueTestModel;
import com.thedeveloper.qyran.util.FilesException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Service
@Slf4j
public class TestsService {
    private final Path rootLocation;

    public TestsService(TestProperties properties) {
        this.rootLocation = Paths.get(properties.getLocation());
    }

    public void init() {
        log.info("Tests init folder: {}",rootLocation.toAbsolutePath());
        try {
            Files.createDirectories(rootLocation);
        }
        catch (IOException e) {
            throw new FilesException("Could not initialize storage", e);
        }
    }
    public TestModel loadTest(TestEntity test) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        return mapper.readValue(new File(rootLocation+"/test_"+test.getId()+"/test.json"), TestModel.class);
    }
    public TrueTestModel loadResponse(TestEntity test) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        return mapper.readValue(new File(rootLocation+"/test_"+test.getId()+"/true.json"), TrueTestModel.class);
    }
    public void createTest(TestModel test, TestEntity testEntity) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        File file = new File(rootLocation+"/test_"+testEntity.getId());
        file.mkdirs();
        file = new File(rootLocation+"/test_"+testEntity.getId()+"/test.json");
        file.createNewFile();
        mapper.writeValue(new File(rootLocation+"/test_"+testEntity.getId()+"/test.json"), test);
    }
    public void createResponse(TestEntity testEntity, TrueTestModel responses) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        File file = new File(rootLocation+"/test_"+testEntity.getId());
        file.mkdirs();
        file = new File(rootLocation+"/test_"+testEntity.getId()+"/true.json");
        file.createNewFile();
        mapper.writeValue(new File(rootLocation+"/test_"+testEntity.getId()+"/true.json"), responses);
    }

}
