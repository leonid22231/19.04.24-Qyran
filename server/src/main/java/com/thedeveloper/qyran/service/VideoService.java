package com.thedeveloper.qyran.service;

import com.thedeveloper.qyran.entity.VideoEntity;
import com.thedeveloper.qyran.repository.VideoRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class VideoService {
    VideoRepository videoRepository;
    public VideoEntity findById(Long id){
        return videoRepository.findVideoEntityById(id);
    }
}
