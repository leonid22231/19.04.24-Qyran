package com.thedeveloper.qyran.models;

import lombok.Data;

import java.util.List;

@Data
public class TestModel {
    int item;
    int count;
    List<QuestionModel> questions;
}
