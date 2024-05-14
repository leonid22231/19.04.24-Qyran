package com.thedeveloper.qyran.controller;

import com.thedeveloper.qyran.entity.*;
import com.thedeveloper.qyran.service.*;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.concurrent.CompletableFuture;

import static com.thedeveloper.qyran.util.Globals.response;

@RestController
@RequestMapping("api/v1")
@AllArgsConstructor
@EnableAsync
public class MainController {
    TestService testService;
    CourseService courseService;
    LessonService lessonService;
    UserService userService;
    TestsService testsService;
    @GetMapping("/courses")
    @Async
    public CompletableFuture<ResponseEntity<?>> findAll(){
        return response(courseService.findAll(), HttpStatus.OK);
    }
    @GetMapping("/courses/{id}")
    @Async
    public CompletableFuture<ResponseEntity<?>> findLessons(@PathVariable String id){
        CourseEntity course = courseService.findById(id);
        return response(course.getLessons(), HttpStatus.OK);
    }
    @GetMapping("/lessons/{id}")
    @Async
    public CompletableFuture<ResponseEntity<?>> findThemes(@PathVariable String id, @RequestParam(required = false) String phone){
        LessonEntity lesson = lessonService.findById(id);
        if(phone!=null){
            for(ThemeEntity theme : lesson.getThemes()){
                for(VideoEntity video : theme.getVideoList()){
                    video.setView(userService.isVideoView(phone, video));
                }
                for(TestEntity test : theme.getTestList()){
                    test.setView(userService.isTestView(phone, test));
                }
            }
        }
        return response(lesson.getThemes(), HttpStatus.OK);
    }
    @GetMapping("/tests/{id}")
    @Async
    public CompletableFuture<ResponseEntity<?>> findTest(@PathVariable Long id) throws IOException {
        TestEntity test = testService.findById(id);
        return response(testsService.loadTest(test), HttpStatus.OK);
    }
}
