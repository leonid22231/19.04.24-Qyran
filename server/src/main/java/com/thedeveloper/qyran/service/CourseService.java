package com.thedeveloper.qyran.service;

import com.thedeveloper.qyran.entity.CourseEntity;
import com.thedeveloper.qyran.repository.CourseRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class CourseService {
    CourseRepository courseRepository;
    public void save(CourseEntity courseEntity){
        courseRepository.save(courseEntity);
    }
    public List<CourseEntity> findAll(){
        return courseRepository.findAll();
    }
    public CourseEntity findById(String id){
     return courseRepository.findCourseEntityById(id);
    }
}
