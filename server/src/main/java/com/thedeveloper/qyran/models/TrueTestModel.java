package com.thedeveloper.qyran.models;

import lombok.Data;

import java.util.List;

@Data
public class TrueTestModel {
    int item;
    int count;
    List<TrueResponseModel> responses;
}
