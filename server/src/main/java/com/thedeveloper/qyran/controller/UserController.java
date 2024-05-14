package com.thedeveloper.qyran.controller;

import com.thedeveloper.qyran.entity.UserEntity;
import com.thedeveloper.qyran.enums.UserRole;
import com.thedeveloper.qyran.service.UserService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.concurrent.CompletableFuture;

@RestController
@RequestMapping("api/v1/user")
@EnableAsync
@AllArgsConstructor
public class UserController {
    UserService userService;
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
}
