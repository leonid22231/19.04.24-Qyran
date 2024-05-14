package com.thedeveloper.qyran.controller;

import com.thedeveloper.qyran.entity.*;
import com.thedeveloper.qyran.models.TempTestModel;
import com.thedeveloper.qyran.models.TestModel;
import com.thedeveloper.qyran.models.ThemeParamModel;
import com.thedeveloper.qyran.models.TrueTestModel;
import com.thedeveloper.qyran.service.*;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.CompletableFuture;

import static com.thedeveloper.qyran.util.Globals.response;

@RestController
@RequestMapping("api/v1/admin")
@EnableAsync
@AllArgsConstructor
public class AdminController {
    TestService testService;
    TestsService testsService;
    LessonService lessonService;
    CourseService courseService;
    UserService userService;
    ThemeService themeService;
    @PostMapping("/addCourse")
    @Async
    public CompletableFuture<ResponseEntity<?>> addCourse(@RequestParam String name){
        CourseEntity courseEntity = new CourseEntity();
        courseEntity.setName(name);
        courseService.save(courseEntity);
        return response(HttpStatus.OK);
    }
    @PostMapping("/addLessonToCourse")
    @Async
    public CompletableFuture<ResponseEntity<?>> addLesson(@RequestParam String phone,@RequestParam String course_id,@RequestParam String title,@RequestParam String description){
        UserEntity userEntity = userService.findUserByPhone(phone);
        LessonEntity lessonEntity = new LessonEntity();
        lessonEntity.setTitle(title);
        lessonEntity.setImage("image.jpg");
        lessonEntity.setTeacher(userEntity);
        lessonEntity.setDescription(description);
        lessonEntity.setTeacher(userEntity);
        CourseEntity courseEntity = courseService.findById(course_id);
        lessonEntity.setCourse(courseEntity);
        courseEntity.getLessons().add(lessonEntity);
        courseService.save(courseEntity);
        return  response(HttpStatus.OK);
    }
    @PostMapping("/addThemeToLesson")
    @Async
    public CompletableFuture<ResponseEntity<?>> addTheme(@RequestParam String id,@RequestParam String name, @RequestBody ThemeParamModel params){
        LessonEntity lesson = lessonService.findById(id);
        ThemeEntity themeEntity = new ThemeEntity();
        List<TempTestModel> temp_test = new ArrayList<>();
        themeEntity.setName(name);
        for(VideoEntity video : params.getVideoList()){
            video.setTheme(themeEntity);
        }
        for(TestEntity test : params.getTestList()){
            test.setCreate_date(new Date());
            test.setTheme(themeEntity);
            TempTestModel tempTestModel = new TempTestModel();
            tempTestModel.setItem(test.getItem());
            temp_test.add(tempTestModel);
        }
        themeEntity.setVideoList(params.getVideoList());
        themeEntity.setTestList(params.getTestList());
        themeEntity.setLesson(lesson);
        lesson.getThemes().add(themeEntity);
        lessonService.save(lesson);
        for(TempTestModel tempTestModel : temp_test){
            tempTestModel.setId(testService.findByThemeAndItem(themeService.findByLessonAndName(lesson, name), tempTestModel.getItem()).getId());
        }
        return  response(temp_test,HttpStatus.OK);
    }
    @PostMapping("/createTest")
    @Async
    public CompletableFuture<ResponseEntity<?>> loadTest(@RequestParam Long id, @RequestBody TestModel testModel) throws IOException {
        TestEntity test = testService.findById(id);
        testsService.createTest(testModel, test);
        return response(HttpStatus.OK);
    }
    @PostMapping("/createResponse")
    @Async
    public CompletableFuture<ResponseEntity<?>> loadResponse(@RequestParam Long id, @RequestBody TrueTestModel testModel) throws IOException {
        TestEntity test = testService.findById(id);
        testsService.createResponse(test, testModel);
        return response(HttpStatus.OK);
    }
}

