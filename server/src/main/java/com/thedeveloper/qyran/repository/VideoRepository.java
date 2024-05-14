package com.thedeveloper.qyran.repository;

import com.thedeveloper.qyran.entity.VideoEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface VideoRepository extends JpaRepository<VideoEntity, Long> {
    VideoEntity findVideoEntityById(Long id);
}
