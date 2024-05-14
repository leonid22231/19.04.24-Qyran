package com.thedeveloper.qyran.repository;

import com.thedeveloper.qyran.entity.TestEntity;
import com.thedeveloper.qyran.entity.ThemeEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TestRepository extends JpaRepository<TestEntity, Long> {
    TestEntity findTestEntityById(Long id);
    TestEntity findTestEntityByThemeAndItem(ThemeEntity theme, int item);
}
