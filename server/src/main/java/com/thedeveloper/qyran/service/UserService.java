package com.thedeveloper.qyran.service;

import com.thedeveloper.qyran.entity.TestEntity;
import com.thedeveloper.qyran.entity.UserEntity;
import com.thedeveloper.qyran.entity.VideoEntity;
import com.thedeveloper.qyran.repository.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class UserService {
    UserRepository userRepository;
    public boolean isVideoView(String phone, VideoEntity video){
        return userRepository.existsUserEntityByPhoneAndVideoListViewContaining(phone, video);
    }
    public boolean isTestView(String phone, TestEntity test){
        return userRepository.existsUserEntityByPhoneAndTestListViewContaining(phone, test);
    }
    public UserEntity findUserByPhone(String phone){
        return userRepository.findUserEntityByPhone(phone);
    }
    public void save(UserEntity user){
        userRepository.save(user);
    }
}
