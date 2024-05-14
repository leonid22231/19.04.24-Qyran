package com.thedeveloper.qyran.entity;

import jakarta.persistence.*;

import java.util.Date;

@Entity
@Table(name = "tests")
public class TestEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;
    String name;
    String description;
    String location;
    Date create_date;
}
