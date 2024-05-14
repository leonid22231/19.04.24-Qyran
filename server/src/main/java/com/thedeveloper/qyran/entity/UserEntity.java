package com.thedeveloper.qyran.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.thedeveloper.qyran.enums.UserRole;
import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "users")
@Data
public class UserEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    String id;
    String phone;
    @JsonIgnore
    String password;
    String name;
    String surname;
    String email;
    String social_1;
    String social_2;
    @Enumerated(EnumType.STRING)
    UserRole role;
}
