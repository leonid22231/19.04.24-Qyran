package com.thedeveloper.qyran.models;

import lombok.Data;

import java.util.List;

@Data
public class QuestionModel {
    Long id;
    String text;
    String image;
    boolean multi;
    List<ResponseModel> responses;
}
