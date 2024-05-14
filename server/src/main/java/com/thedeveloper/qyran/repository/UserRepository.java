package com.thedeveloper.qyran.repository;

import com.thedeveloper.qyran.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<UserEntity, String> {
    UserEntity findUserEntityByPhone(String phone);
}
