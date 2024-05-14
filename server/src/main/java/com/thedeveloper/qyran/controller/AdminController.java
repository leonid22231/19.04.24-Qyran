package com.thedeveloper.qyran.controller;

import com.thedeveloper.qyran.entity.CourseEntity;
import com.thedeveloper.qyran.service.CourseService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.concurrent.CompletableFuture;

import static com.thedeveloper.qyran.util.Globals.response;

@RestController
@RequestMapping("api/v1/admin")
@EnableAsync
@AllArgsConstructor
public class AdminController {
    CourseService courseService;
    @PostMapping("/addCourse")
    public CompletableFuture<ResponseEntity<?>> addCourse(@RequestParam String name){
        CourseEntity courseEntity = new CourseEntity();
        courseEntity.setName(name);
        courseService.save(courseEntity);
        return response(HttpStatus.OK);
    }
}

