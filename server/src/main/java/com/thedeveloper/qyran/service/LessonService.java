package com.thedeveloper.qyran.service;

import com.thedeveloper.qyran.entity.LessonEntity;
import com.thedeveloper.qyran.repository.LessonRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class LessonService {
    LessonRepository lessonRepository;
    public LessonEntity findById(String id){
        return lessonRepository.findLessonEntityById(id);
    }
    public void save(LessonEntity lesson){
        lessonRepository.save(lesson);
    }
}
