package com.thedeveloper.qyran.models;

import lombok.Data;

import java.util.List;

@Data
public class TrueResponseModel {
    int id;
    List<Integer> trues;
}
