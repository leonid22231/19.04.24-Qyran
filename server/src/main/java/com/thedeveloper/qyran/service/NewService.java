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
    public void save(NewEntity newEntity){
        newRepository.save(newEntity);
    }
    public NewEntity findById(Long id){
        return newRepository.findNewEntityById(id);
    }
    public List<NewEntity> findAll(){
        return newRepository.findAllByOrderByDateDesc();
    }
}
