package com.thedeveloper.qyran.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.thedeveloper.qyran.enums.LessonType;
import jakarta.persistence.*;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "lessons")
@Data
public class LessonEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    String id;
    String title;
    @Column(columnDefinition = "TEXT")
    String description;
    String image;
    @Enumerated(EnumType.STRING)
    @JsonIgnore
    LessonType type =  LessonType.classic;
    @ManyToOne
    @JoinColumn(name = "course", nullable = true, referencedColumnName = "id")
    CourseEntity course;
    @ManyToOne
    @JoinColumn(name = "teacher", nullable = false, referencedColumnName = "phone")
    UserEntity teacher;
    @JsonIgnore
    @OneToMany(mappedBy = "lesson", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    List<ThemeEntity> themes = new ArrayList<>();
}
