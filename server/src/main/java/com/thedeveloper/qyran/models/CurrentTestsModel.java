package com.thedeveloper.qyran.models;

import com.thedeveloper.qyran.entity.CourseEntity;
import com.thedeveloper.qyran.entity.TestEntity;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class CurrentTestsModel {
    CourseEntity course;
    List<TestEntity> tests = new ArrayList<>();
}
