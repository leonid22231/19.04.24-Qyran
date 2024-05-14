package com.thedeveloper.qyran.models;

import com.thedeveloper.qyran.entity.TestEntity;
import com.thedeveloper.qyran.entity.VideoEntity;
import lombok.Data;

import java.util.List;

@Data
public class ThemeParamModel {
    List<VideoEntity> videoList;
    List<TestEntity> testList;
}
