package com.thedeveloper.qyran.controller;

import com.thedeveloper.qyran.entity.*;
import com.thedeveloper.qyran.enums.LessonType;
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
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.CompletableFuture;

import static com.thedeveloper.qyran.util.Globals.renameImage;
import static com.thedeveloper.qyran.util.Globals.response;

@RestController
@RequestMapping("api/v1/admin")
@EnableAsync
@AllArgsConstructor
public class AdminController {
    ImageService imageService;
    NewService newService;
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
    public CompletableFuture<ResponseEntity<?>> addLesson(@RequestParam String phone,@RequestParam String course_id,@RequestParam String title,@RequestParam String description, @RequestBody(required = true) MultipartFile file){
        UserEntity userEntity = userService.findUserByPhone(phone);
        LessonEntity lessonEntity = new LessonEntity();
        if(file!=null){
            imageService.store(file);
            lessonEntity.setImage(renameImage(file.getOriginalFilename(), imageService));
        }
        lessonEntity.setTitle(title);
        lessonEntity.setTeacher(userEntity);
        lessonEntity.setDescription(description);
        lessonEntity.setTeacher(userEntity);
        CourseEntity courseEntity = courseService.findById(course_id);
        lessonEntity.setCourse(courseEntity);
        courseEntity.getLessons().add(lessonEntity);
        courseService.save(courseEntity);
        return  response(HttpStatus.OK);
    }
    @PostMapping("/addCombo")
    @Async
    public CompletableFuture<ResponseEntity<?>> addCombo(@RequestParam String phone, @RequestParam String title, @RequestParam String description, @RequestBody(required = true)MultipartFile file){
        UserEntity userEntity = userService.findUserByPhone(phone);
        LessonEntity lessonEntity = new LessonEntity();
        lessonEntity.setTitle(title);
        if(file!=null){
            imageService.store(file);
            lessonEntity.setImage(renameImage(file.getOriginalFilename(), imageService));
        }
        lessonEntity.setTeacher(userEntity);
        lessonEntity.setDescription(description);
        lessonEntity.setTeacher(userEntity);
        lessonEntity.setType(LessonType.combo);
        lessonService.save(lessonEntity);
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
    @PostMapping("/addSubscription")
    @Async
    public  CompletableFuture<ResponseEntity<?>> addSubscription(@RequestParam String phone, @RequestParam String id){
        UserEntity userEntity = userService.findUserByPhone(phone);
        userEntity.getCourseList().add(courseService.findById(id));
        userService.save(userEntity);
        return response(HttpStatus.OK);
    }
    @PostMapping("/deleteSubscription")
    @Async
    public  CompletableFuture<ResponseEntity<?>> deleteSubscription(@RequestParam String phone, @RequestParam String id){
        UserEntity userEntity = userService.findUserByPhone(phone);
        for(int i = 0; i < userEntity.getCourseList().size(); i++){
            if(userEntity.getCourseList().get(i).getId().equals(id)){
                userEntity.getCourseList().remove(i);
                break;
            }
        }
        userService.save(userEntity);
        return response(HttpStatus.OK);
    }
    @PostMapping("/createNew")
    @Async
    public CompletableFuture<ResponseEntity<?>> createNew(@RequestParam String title, @RequestParam String description,@RequestBody(required = true) MultipartFile file){
        NewEntity newEntity = new NewEntity();
        newEntity.setTitle(title);
        newEntity.setDescription(description);
        newEntity.setDate(new Date());
        if(file!=null){
            imageService.store(file);
            newEntity.setImage(renameImage(file.getOriginalFilename(), imageService));
        }
        newService.save(newEntity);
        return response(HttpStatus.OK);
    }
}

