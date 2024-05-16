package com.thedeveloper.qyran.models;

import com.thedeveloper.qyran.entity.LessonEntity;
import lombok.Data;

@Data
public class CurrentLessonModel {
    LessonEntity lesson;
    double percent;
}
