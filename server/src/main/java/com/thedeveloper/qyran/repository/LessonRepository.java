package com.thedeveloper.qyran.repository;

import com.thedeveloper.qyran.entity.LessonEntity;
import com.thedeveloper.qyran.enums.LessonType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LessonRepository extends JpaRepository<LessonEntity, String> {
    LessonEntity findLessonEntityById(String id);
    List<LessonEntity> findLessonEntitiesByType(LessonType type);
}
