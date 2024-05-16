package com.thedeveloper.qyran.repository;

import com.thedeveloper.qyran.entity.TestEntity;
import com.thedeveloper.qyran.entity.UserEntity;
import com.thedeveloper.qyran.entity.VideoEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<UserEntity, String> {
    UserEntity findUserEntityByPhone(String phone);
    UserEntity findUserEntityById(String id);
    boolean existsUserEntityByPhoneAndVideoListViewContaining(String phone, VideoEntity video);
    boolean existsUserEntityByPhoneAndTestListViewContaining(String phone, TestEntity video);
}
