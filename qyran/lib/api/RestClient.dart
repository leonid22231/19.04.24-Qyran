import 'package:dio/dio.dart';
import 'package:qyran/api/entity/CourseEntity.dart';
import 'package:qyran/api/entity/UserEntity.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'RestClient.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
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
  Future<String> login(@Query("phone") String phone, @Query("password") String password);
  @GET("/user/profile")
  Future<UserEntity> findProfile(@Query("phone") String phone);
  @GET("/courses")
  Future<List<CourseEntity>> findAllCourses();
}
