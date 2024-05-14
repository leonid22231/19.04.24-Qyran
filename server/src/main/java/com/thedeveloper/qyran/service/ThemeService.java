package com.thedeveloper.qyran.service;

import com.thedeveloper.qyran.entity.LessonEntity;
import com.thedeveloper.qyran.entity.ThemeEntity;
import com.thedeveloper.qyran.repository.ThemeRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class ThemeService {
    ThemeRepository themeRepository;
    public ThemeEntity findByLessonAndName(LessonEntity lesson, String name){
        return themeRepository.findFirstByLessonAndName(lesson, name);
    }
}
