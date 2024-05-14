package com.thedeveloper.qyran.repository;

import com.thedeveloper.qyran.entity.CourseEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CourseRepository extends JpaRepository<CourseEntity, String> {
    CourseEntity findCourseEntityById(String id);
}
