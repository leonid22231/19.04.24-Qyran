package com.thedeveloper.qyran.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "videos")
@Data
public class VideoEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;
    String name;
    String url;
    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "theme", nullable = false, referencedColumnName = "id")
    ThemeEntity theme;
    int item;
    @Transient
    boolean view = false;
}
