package com.thedeveloper.qyran.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "themes")
@Data
public class ThemeEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;
    String name;
    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "lesson", nullable = false, referencedColumnName = "id")
    LessonEntity lesson;
    @OneToMany(mappedBy = "theme", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    List<VideoEntity> videoList = new ArrayList<>();
    @OneToMany(mappedBy = "theme", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    List<TestEntity> testList = new ArrayList<>();
}
