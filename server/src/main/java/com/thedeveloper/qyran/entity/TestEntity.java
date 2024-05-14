package com.thedeveloper.qyran.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;

@Entity
@Table(name = "tests")
@Data
public class TestEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;
    String name;
    String description;
    Date create_date;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "theme", nullable = false, referencedColumnName = "id")
    ThemeEntity theme;
    int item;
    @Transient
    boolean view = false;
}
