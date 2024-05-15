package com.thedeveloper.qyran.models;

import lombok.Data;

import java.util.List;

@Data
public class TestResultModel {
    int id;
    List<TestAnswerModel> results;
}
