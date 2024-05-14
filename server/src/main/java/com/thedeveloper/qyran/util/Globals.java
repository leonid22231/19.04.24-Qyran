package com.thedeveloper.qyran.util;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import java.util.Objects;
import java.util.concurrent.CompletableFuture;

public class Globals {
    public static CompletableFuture<ResponseEntity<?>> response(Object body, HttpStatus status){
        return CompletableFuture.completedFuture(new ResponseEntity<>(body, status));
    }
    public static CompletableFuture<ResponseEntity<?>> response(HttpStatus status){
        return CompletableFuture.completedFuture(new ResponseEntity<>(status));
    }
}
