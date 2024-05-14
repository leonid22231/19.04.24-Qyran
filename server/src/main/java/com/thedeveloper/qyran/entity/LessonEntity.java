package com.thedeveloper.qyran.entity;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "lessons")
public class LessonEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    String id;
    String title;
    String description;
    @OneToMany(mappedBy = "name")
    List<TestEntity> tests = new ArrayList<>();
}
