package com.thedeveloper.qyran.entity;

import jakarta.persistence.*;

import java.util.Date;

@Entity
@Table(name = "news")
public class NewEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;
    String title;
    String description;
    String image;
    Date created_date;
}
