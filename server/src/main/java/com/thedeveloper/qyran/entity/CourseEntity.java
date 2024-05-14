package com.thedeveloper.qyran.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "courses")
@Data
public class CourseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    String id;
    String name;
    @JsonIgnore
    @OneToMany(mappedBy = "title")
    List<LessonEntity> lessons = new ArrayList<LessonEntity>();
}
