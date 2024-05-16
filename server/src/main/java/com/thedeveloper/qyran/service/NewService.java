package com.thedeveloper.qyran.service;

import com.thedeveloper.qyran.entity.NewEntity;
import com.thedeveloper.qyran.repository.NewRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class NewService {
    NewRepository newRepository;
    public List<NewEntity> findAll(){
        return newRepository.findAllByOrderByDateDesc();
    }
}
