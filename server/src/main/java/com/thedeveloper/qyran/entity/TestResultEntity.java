package com.thedeveloper.qyran.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "test_results")
@Data
public class TestResult {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;
    String goodIds;
    String badIds;
    int result;
    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "test", nullable = false, referencedColumnName = "id")
    TestEntity test;
    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "user", nullable = false, referencedColumnName = "phone")
    UserEntity user;
}
