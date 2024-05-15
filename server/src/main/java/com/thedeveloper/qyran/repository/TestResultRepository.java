package com.thedeveloper.qyran.repository;

import com.thedeveloper.qyran.entity.TestEntity;
import com.thedeveloper.qyran.entity.TestResultEntity;
import com.thedeveloper.qyran.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TestResultRepository extends JpaRepository<TestResultEntity, Long> {
    List<TestResultEntity> findTestResultEntitiesByUser(UserEntity user);
    TestResultEntity findByUserAndTest(UserEntity user, TestEntity test);
    boolean existsTestResultEntityByUserAndTest(UserEntity user, TestEntity test);
}
