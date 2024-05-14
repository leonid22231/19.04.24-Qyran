package com.thedeveloper.qyran.service;

import com.thedeveloper.qyran.entity.TestEntity;
import com.thedeveloper.qyran.entity.ThemeEntity;
import com.thedeveloper.qyran.repository.TestRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class TestService {
    TestRepository testRepository;
    public TestEntity findById(Long id){
        return testRepository.findTestEntityById(id);
    }
    public TestEntity findByThemeAndItem(ThemeEntity theme, int item){
        return testRepository.findTestEntityByThemeAndItem(theme, item);
    }
}
