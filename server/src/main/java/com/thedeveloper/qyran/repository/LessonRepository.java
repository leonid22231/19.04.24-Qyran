package com.thedeveloper.qyran.repository;

import com.thedeveloper.qyran.entity.LessonEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LessonRepository extends JpaRepository<LessonEntity, String> {
    LessonEntity findLessonEntityById(String id);
}
