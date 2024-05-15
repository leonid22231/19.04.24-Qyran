package com.thedeveloper.qyran.service;

import com.thedeveloper.qyran.entity.TestEntity;
import com.thedeveloper.qyran.entity.TestResultEntity;
import com.thedeveloper.qyran.entity.UserEntity;
import com.thedeveloper.qyran.repository.TestResultRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class TestResultService {
    TestResultRepository testResultRepository;
    public void delete(TestResultEntity testResultEntity){
        testResultRepository.delete(testResultEntity);
    }
    public void save(TestResultEntity testResultEntity){
        testResultRepository.save(testResultEntity);
    }
    public List<TestResultEntity> findByUser(UserEntity user){
        return testResultRepository.findTestResultEntitiesByUser(user);
    }
    public TestResultEntity findByUserAndTest(UserEntity user, TestEntity test){
        return testResultRepository.findByUserAndTest(user, test);
    }
    public boolean isTestResult(UserEntity user, TestEntity test){
        return testResultRepository.existsTestResultEntityByUserAndTest(user, test);
    }
}
