package com.thedeveloper.qyran.repository;

import com.thedeveloper.qyran.entity.LessonEntity;
import com.thedeveloper.qyran.entity.ThemeEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ThemeRepository extends JpaRepository<ThemeEntity, Long> {
    ThemeEntity findFirstByLessonAndName(LessonEntity lesson, String name);
}
