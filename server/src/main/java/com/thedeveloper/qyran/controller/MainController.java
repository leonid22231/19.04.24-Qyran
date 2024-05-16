package com.thedeveloper.qyran.controller;

import com.thedeveloper.qyran.entity.*;
import com.thedeveloper.qyran.models.TestAnswerModel;
import com.thedeveloper.qyran.models.TestResultModel;
import com.thedeveloper.qyran.models.TrueResponseModel;
import com.thedeveloper.qyran.models.TrueTestModel;
import com.thedeveloper.qyran.service.*;
import lombok.AllArgsConstructor;
import org.apache.catalina.User;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;
import java.util.Objects;
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
    TestResultService testResultService;
    NewService newService;
    @GetMapping("/courses")
    @Async
    public CompletableFuture<ResponseEntity<?>> findAll(@RequestParam(required = false) String phone){
        List<CourseEntity> list = courseService.findAll();
        if(phone==null) return response(list, HttpStatus.OK);
        UserEntity user = userService.findUserByPhone(phone);
        for(CourseEntity course : list){
            boolean check = false;
            for(CourseEntity user_course : user.getCourseList()){
                if(Objects.equals(course.getId(), user_course.getId())){
                    check = true;
                    break;
                }
            }
            course.setSub(check);
        }
        return  response(list, HttpStatus.OK);
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
                    test.setResult(testResultService.isTestResult(userService.findUserByPhone(phone), test));
                }
            }
        }
        return response(lesson.getThemes(), HttpStatus.OK);
    }
    @GetMapping("/lesson/byTest")
    @Async
    public CompletableFuture<ResponseEntity<?>> findLessonByTest(@RequestParam String phone, @RequestParam Long id){
        TestEntity _test = testService.findById(id);
        LessonEntity lesson = _test.getTheme().getLesson();
            for(ThemeEntity theme : lesson.getThemes()){
                for(VideoEntity video : theme.getVideoList()){
                    video.setView(userService.isVideoView(phone, video));
                }
                for(TestEntity test : theme.getTestList()){
                    test.setView(userService.isTestView(phone, test));
                    test.setResult(testResultService.isTestResult(userService.findUserByPhone(phone), test));
                }
            }

        return response(lesson, HttpStatus.OK);
    }
    @GetMapping("/tests/{id}/result")
    @Async
    public CompletableFuture<ResponseEntity<?>> findTestResults(@PathVariable Long id, @RequestParam String phone){
        UserEntity user = userService.findUserByPhone(phone);
        TestEntity test = testService.findById(id);
        return response(testResultService.findByUserAndTest(user, test), HttpStatus.OK);
    }
    @PostMapping("/tests/{id}/result")
    @Async
    public CompletableFuture<ResponseEntity<?>> loadTestResult(@PathVariable Long id, @RequestParam String phone, @RequestBody TestResultModel result) throws IOException {
        UserEntity user = userService.findUserByPhone(phone);
        TestEntity test = testService.findById(id);
        if(testResultService.isTestResult(user, test)){
            testResultService.delete(testResultService.findByUserAndTest(user, test));
        }
        TrueTestModel trueTestModel = testsService.loadResponse(test);
        TestResultEntity testResultEntity = new TestResultEntity();
        testResultEntity.setTest(test);
        testResultEntity.setUser(user);
        StringBuilder goodIds = new StringBuilder();
        StringBuilder badIds = new StringBuilder();
        int res = 0;
        if(trueTestModel.getCount()!=result.getResults().size()) return response(HttpStatus.BAD_REQUEST);
        for(TrueResponseModel trues : trueTestModel.getResponses()){
            boolean success = true;
            TestAnswerModel answerModel = findById(result.getResults(),trues.getId());
            for(int _trues : trues.getTrues()){
                success = findNumberInArray( answerModel.getAnswers(), _trues);
                if(!success) break;
            }
            if(success)
            {
                goodIds.append(trues.getId()).append(",");
                res++;
            }
            else
                badIds.append(trues.getId()).append(",");
        }
        testResultEntity.setGoodIds(goodIds.toString());
        testResultEntity.setBadIds(badIds.toString());
        testResultEntity.setResult(res);
        testResultService.save(testResultEntity);
        return response(testResultEntity, HttpStatus.OK);
    }
    private TestAnswerModel findById(List<TestAnswerModel> answers,int id){
        for(TestAnswerModel answerModel : answers){
            if(answerModel.getId() == id){
                return  answerModel;
            }
        }
        return null;
    }
    private boolean findNumberInArray(List<Integer> array, int number) {
        for (Integer integer : array) {
            if (integer == number) {
                return true;
            }
        }
        return false;
    }
    @GetMapping("/tests/{id}")
    @Async
    public CompletableFuture<ResponseEntity<?>> findTest(@PathVariable Long id) throws IOException {
        TestEntity test = testService.findById(id);
        return response(testsService.loadTest(test), HttpStatus.OK);
    }
    @GetMapping("/news")
    @Async
    public CompletableFuture<ResponseEntity<?>> findNews(){
        return response(newService.findAll(), HttpStatus.OK);
    }
}
