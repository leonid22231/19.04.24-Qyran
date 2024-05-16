import 'dart:io';

import 'package:dio/dio.dart';
import 'package:qyran/admin/ThemeParamModel.dart';
import 'package:qyran/api/entity/CourseEntity.dart';
import 'package:qyran/api/entity/CurrentTestsModel.dart';
import 'package:qyran/api/entity/LessonCurrentModel.dart';
import 'package:qyran/api/entity/LessonEntity.dart';
import 'package:qyran/api/entity/NewEntity.dart';
import 'package:qyran/api/entity/TestResultEntity.dart';
import 'package:qyran/api/entity/ThemeEntity.dart';
import 'package:qyran/api/entity/UserEntity.dart';
import 'package:qyran/api/entity/enums/UserRole.dart';
import 'package:qyran/test/TempTestResponse.dart';
import 'package:qyran/test/TestModel.dart';
import 'package:qyran/test/TestResultModel.dart';
import 'package:qyran/test/TrueTestModel.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'RestClient.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  //USER_API
  @GET("/user/checkUser")
  Future<void> checkUser(@Query("phone") String phone);
  @POST("/user/register")
  Future<String> register(
    @Query("phone") String phone,
    @Query("name") String name,
    @Query("surname") String surname,
    @Query("email") String email,
    @Query("password") String password,
    @Query("social_1") String? social_1,
    @Query("social_2") String? social_2,
  );
  @POST("/user/login")
  Future<String> login(
      @Query("phone") String phone, @Query("password") String password);
  @GET("/user/profile")
  Future<UserEntity> findProfile(@Query("phone") String phone);
  @POST("/user/profile/social/update")
  Future<void> saveSocial(@Query("phone") String phone,
      @Query("social_1") String? social_1, @Query("social_2") String? social_2);
  @POST("/user/setView")
  Future<void> setView(@Query("phone") String phone,
      @Query("videoId") int? videoId, @Query("testId") int? testId);
  @GET("/user/tests/results")
  Future<List<TestResultEntity>> findResults(@Query("phone") String phone);
  @GET("/user/tests/current")
  Future<List<CurrentTestsModel>> findCurrentTests(
      @Query("phone") String phone);
  @GET("/user/lessons/active")
  Future<List<LessonCurrentModel>> findActiveLessons(
      @Query("phone") String phone);
  @GET("/courses")
  Future<List<CourseEntity>> findAllCourses(@Query("phone") String? phone);
  @GET("/courses/{id}")
  Future<List<LessonEntity>> findLessons(@Path("id") String id);
  @GET("/combo")
  Future<List<LessonEntity>> findCombos();
  @GET("/lessons/{id}")
  Future<List<ThemeEntity>> findThemes(
      @Path("id") String id, @Query("phone") String? phone);
  @GET("/lesson/byTest")
  Future<LessonEntity> findLessonByTest(
      @Query("phone") String phone, @Query("id") int id);
  @GET("/tests/{id}")
  Future<TestModel> findTest(@Path("id") int id);
  @GET("/tests/{id}/result")
  Future<TestResultEntity> findTestResult(
      @Path("id") int id, @Query("phone") String phone);
  @POST("/tests/{id}/result")
  Future<TestResultEntity> loadTestResult(@Path("id") int id,
      @Query("phone") String phone, @Body() TestResultModel result);
  @GET("/news")
  Future<List<NewEntity>> findNews();
  @GET("/role")
  Future<String> findRole(@Query("phone") String phone);
  //ADMIN_API
  @POST("/admin/addCourse")
  Future<void> addCourse(@Query("name") String name);
  @POST("/admin/addLessonToCourse")
  @MultiPart()
  Future<void> addLessonToCourse(
      @Query("phone") String phone,
      @Query("course_id") String course_id,
      @Query("title") String title,
      @Query("description") String description,
      @Part(name: "file") File file);
  @GET("/admin/addCombo")
  @MultiPart()
  Future<void> addCombo(
      @Query("phone") String phone,
      @Query("title") String title,
      @Query("description") String description,
      @Part(name: "file") File file);
  @POST("/admin/addThemeToLesson")
  Future<List<TempTestResponse>> addThemeToLesson(@Query("id") String id,
      @Query("name") String name, @Body() ThemeParamModel model);
  @POST("/admin/createTest")
  Future<void> createTest(@Query("id") int id, @Body() TestModel model);
  @POST("/admin/createResponse")
  Future<void> createResponse(@Query("id") int id, @Body() TrueTestModel model);
}
