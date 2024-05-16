package com.thedeveloper.qyran.controller;

import com.thedeveloper.qyran.entity.*;
import com.thedeveloper.qyran.enums.UserRole;
import com.thedeveloper.qyran.models.CurrentLessonModel;
import com.thedeveloper.qyran.models.CurrentTestsModel;
import com.thedeveloper.qyran.service.TestResultService;
import com.thedeveloper.qyran.service.TestService;
import com.thedeveloper.qyran.service.UserService;
import com.thedeveloper.qyran.service.VideoService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.context.Theme;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CompletableFuture;

import static com.thedeveloper.qyran.util.Globals.response;

@RestController
@RequestMapping("api/v1/user")
@EnableAsync
@AllArgsConstructor
@Slf4j
public class UserController {
    UserService userService;
    TestService testService;
    VideoService videoService;
    TestResultService testResultService;
    PasswordEncoder passwordEncoder;
    @PostMapping("/login")
    @Async
    public CompletableFuture<ResponseEntity<?>> login(@RequestParam String phone, @RequestParam String password){
        UserEntity user = userService.findUserByPhone(phone);
        if(user==null)return CompletableFuture.completedFuture(new ResponseEntity<>("Пользователь не найден", HttpStatus.BAD_REQUEST));
        if(passwordEncoder.matches(password, user.getPassword())){
            return CompletableFuture.completedFuture(new ResponseEntity<>("1111",HttpStatus.OK));
        }else{
            return CompletableFuture.completedFuture(new ResponseEntity<>("Неверный пароль",HttpStatus.BAD_REQUEST));
        }
    }
    @PostMapping("/register")
    @Async
    public CompletableFuture<ResponseEntity<?>> register(@RequestParam String phone,@RequestParam String name, @RequestParam String surname, @RequestParam String email, @RequestParam String password, @RequestParam(required = false) String social_1, @RequestParam(required = false) String social_2) {
        UserEntity user = new UserEntity();
        user.setPhone(phone);
        user.setName(name);
        user.setSurname(surname);
        user.setEmail(email);
        user.setPassword(passwordEncoder.encode(password));
        user.setRole(UserRole.user);
        if(social_1!=null)user.setSocial_1(social_1);
        if(social_2!=null)user.setSocial_2(social_2);
        userService.save(user);
        return CompletableFuture.completedFuture(new ResponseEntity<>("1111", HttpStatus.OK));
    }
    @GetMapping("/checkUser")
    @Async
    public CompletableFuture<ResponseEntity<?>> checkUser(@RequestParam String phone) {
        UserEntity user = userService.findUserByPhone(phone);
        if(user==null) return CompletableFuture.completedFuture(ResponseEntity.ok().build());
        else return CompletableFuture.completedFuture(new ResponseEntity<>("Пользователь существует", HttpStatus.BAD_REQUEST));
    }
    @GetMapping("/profile")
    @Async
    public CompletableFuture<ResponseEntity<?>> getProfile(@RequestParam String phone) {
        UserEntity user = userService.findUserByPhone(phone);
        return CompletableFuture.completedFuture(ResponseEntity.ok().body(user));
    }

    @PostMapping("/setView")
    @Async
    public CompletableFuture<ResponseEntity<?>> setView(@RequestParam String phone, @RequestParam(required = false) Long videoId, @RequestParam(required = false) Long testId) {
        boolean change = false;
        UserEntity user = userService.findUserByPhone(phone);
        if(videoId!=null){
            user.getVideoListView().add(videoService.findById(videoId));
            change = true;
        }
        if(testId!=null){
            try{
                user.getTestListView().add(testService.findById(testId));
                change = true;
            }catch (Exception e){
                List<TestEntity> testListView = new ArrayList<>();
                user.setTestListView(testListView);
                userService.save(user);
                user.getTestListView().add(testService.findById(testId));
                change = true;
            }

        }
        if(change) userService.save(user);
        return response(HttpStatus.OK);
    }
    @PostMapping("/profile/social/update")
    @Async
    public CompletableFuture<ResponseEntity<?>> saveProfileSocial(@RequestParam String phone, @RequestParam(required = false) String social_1, @RequestParam(required = false) String social_2){
        UserEntity user = userService.findUserByPhone(phone);
        if(social_1!=null){
            if(social_1.split("")[0].equals("@")){
                user.setSocial_1(social_1.substring(1));
            }else{
                user.setSocial_1(social_1);
            }
        }
        if(social_2!=null){
            if(social_2.split("")[0].equals("@")){
                user.setSocial_2(social_2.substring(1));
            }else{
                user.setSocial_2(social_2);
            }
        };
        userService.save(user);
        return response(HttpStatus.OK);
    }
    @GetMapping("/lessons/active")
    @Async
    public CompletableFuture<ResponseEntity<?>> findActiveLessons(@RequestParam String phone){
        UserEntity user = userService.findUserByPhone(phone);
        List<VideoEntity> videoList = user.getVideoListView();
        List<TestEntity> testList = user.getTestListView();
        List<ThemeEntity> themes = new ArrayList<>();
        for(VideoEntity video : videoList){
            ThemeEntity theme = video.getTheme();
            if(!existTheme(themes, theme)){
                themes.add(theme);
            }
        }
        for(TestEntity test : testList){
            ThemeEntity theme = test.getTheme();
            if(!existTheme(themes, theme)){
                themes.add(theme);
            }
        }
        List<LessonEntity> lessons = new ArrayList<>();
        for(ThemeEntity theme : themes){
            if(!existLesson(lessons, theme.getLesson())){
                lessons.add(theme.getLesson());
            }
        }
        List<CurrentLessonModel> currentLessons = new ArrayList<>();
        for(LessonEntity lesson : lessons){
            int allCount = 0;
            int count = 0;
            for(ThemeEntity theme : lesson.getThemes()){
                for(VideoEntity video : theme.getVideoList()){
                    allCount++;
                    if(userService.isVideoView(phone,video)){
                        count++;
                    }
                }
                for(TestEntity test : theme.getTestList()){
                    allCount++;
                    if(userService.isTestView(phone, test)){
                        count++;
                    }
                }
            }
            CurrentLessonModel currentLesson = new CurrentLessonModel();
            currentLesson.setLesson(lesson);
            currentLesson.setPercent(((double) 100 /allCount)*count);
            currentLessons.add(currentLesson);
        }
        return response(currentLessons,HttpStatus.OK);
    }
    boolean existLesson(List<LessonEntity> list, LessonEntity lesson){
        for(LessonEntity lesson1 : list){
            if(lesson1.getId().equals(lesson.getId())){
                return true;
            }
        }
        return false;
    }
    @GetMapping("/tests/current")
    @Async
    public CompletableFuture<ResponseEntity<?>> findTestsCurrent(@RequestParam String phone){
        UserEntity user = userService.findUserByPhone(phone);
        List<VideoEntity> videoList = user.getVideoListView();
        List<TestEntity> testList = user.getTestListView();
        List<ThemeEntity> themes = new ArrayList<>();
        for(VideoEntity video : videoList){
            ThemeEntity theme = video.getTheme();
            if(!existTheme(themes, theme)){
                themes.add(theme);
            }
        }
        for(TestEntity test : testList){
            ThemeEntity theme = test.getTheme();
            if(!existTheme(themes, theme)){
                themes.add(theme);
            }
        }
        List<CurrentTestsModel> currentTestsModels = new ArrayList<>();

        for(ThemeEntity theme : themes){
            int count = theme.getTestList().size() + theme.getVideoList().size();
            List<Object> objects = new ArrayList<>();
            for(int i = 0; i< count; i++){
                objects.add(0);
            }
            for(TestEntity test : theme.getTestList()){
                objects.set(test.getItem()-1, test);
            }
            for(VideoEntity video : theme.getVideoList()){
                objects.set(video.getItem()-1, video);
            }
            for(int i = 0; i < objects.size(); i++){
                if(objects.get(i).getClass().equals(TestEntity.class)){
                    TestEntity testEntity = (TestEntity)objects.get(i);
                    if(!testResultService.isTestResult(user, testEntity)){
                        if(i==0){
                            if(currentTestsModels.isEmpty()){
                                CurrentTestsModel currentTestsModel = new CurrentTestsModel();
                                currentTestsModel.setCourse(testEntity.getTheme().getLesson().getCourse());
                                currentTestsModel.getTests().add(testEntity);
                                currentTestsModels.add(currentTestsModel);
                            }
                        }else{
                            if(objects.get(i-1).getClass().equals(VideoEntity.class)){
                                VideoEntity videoEntity = (VideoEntity)objects.get(i-1);
                                if(userService.isVideoView(phone,videoEntity)){
                                    CurrentTestsModel currentTestsModel = findCourse(currentTestsModels, testEntity.getTheme().getLesson().getCourse());
                                    if(currentTestsModel==null){
                                        currentTestsModel = new CurrentTestsModel();
                                        currentTestsModel.setCourse(testEntity.getTheme().getLesson().getCourse());
                                        currentTestsModels.add(currentTestsModel);
                                    }
                                    currentTestsModel.getTests().add(testEntity);
                                }
                            }else{
                                TestEntity testEntity1 = (TestEntity) objects.get(i-1);
                                if(userService.isTestView(phone,testEntity1)){
                                    CurrentTestsModel currentTestsModel = findCourse(currentTestsModels, testEntity.getTheme().getLesson().getCourse());
                                    if(currentTestsModel==null){
                                        currentTestsModel = new CurrentTestsModel();
                                        currentTestsModel.setCourse(testEntity.getTheme().getLesson().getCourse());
                                        currentTestsModels.add(currentTestsModel);
                                    }
                                    currentTestsModel.getTests().add(testEntity);
                                }
                            }
                        }
                    }
                }
            }
        }
        return response(currentTestsModels, HttpStatus.OK);
    }
    CurrentTestsModel findCourse(List<CurrentTestsModel> currentTestsModel, CourseEntity course){
        for(CurrentTestsModel model : currentTestsModel){
            if(model.getCourse().getId().equals(course.getId())){
                return  model;
            }
        }
        return null;
    }
    boolean existTheme(List<ThemeEntity> themes, ThemeEntity theme){
        for(ThemeEntity theme1 : themes){
            if(theme1.getId().equals(theme.getId())){
               return  true;
            }
        }
        return  false;
    }
    @GetMapping("/tests/results")
    @Async
    public CompletableFuture<ResponseEntity<?>> findTestsResult(@RequestParam String phone){
        UserEntity user = userService.findUserByPhone(phone);
        return response(testResultService.findByUser(user), HttpStatus.OK);
    }
}
