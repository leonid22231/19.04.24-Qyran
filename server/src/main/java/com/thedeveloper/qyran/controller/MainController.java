package com.thedeveloper.qyran.controller;

import com.thedeveloper.qyran.service.CourseService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.concurrent.CompletableFuture;

import static com.thedeveloper.qyran.util.Globals.response;

@RestController
@RequestMapping("api/v1")
@AllArgsConstructor
@EnableAsync
public class MainController {
    CourseService courseService;
    @GetMapping("/courses")
    public CompletableFuture<ResponseEntity<?>> findAll(){
        return response(courseService.findAll(), HttpStatus.OK);
    }

}
