package com.thedeveloper.qyran.util;

import com.thedeveloper.qyran.service.ImageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import java.io.File;
import java.nio.file.Path;
import java.util.Objects;
import java.util.UUID;
import java.util.concurrent.CompletableFuture;

@Slf4j
public class Globals {
    public static CompletableFuture<ResponseEntity<?>> response(Object body, HttpStatus status){
        return CompletableFuture.completedFuture(new ResponseEntity<>(body, status));
    }
    public static CompletableFuture<ResponseEntity<?>> response(HttpStatus status){
        return CompletableFuture.completedFuture(new ResponseEntity<>(status));
    }
    public static String renameImage(String originalFilename, ImageService imageService){
        Path path = imageService.load(originalFilename);
        File file = new File(String.valueOf(path.toAbsolutePath()));
        if(file.exists()){
            String name = UUID.randomUUID().toString().replace("-", "");
            String name_ = "img_"+name+"."+originalFilename.split("\\.")[1]+"_";
            File file_copy = new File(file.getParentFile().getAbsolutePath(), name_);
            log.info("File {} copy to {}",file.getAbsolutePath(),file_copy.getAbsolutePath());
            file.renameTo(file_copy);
            log.info("File {} rename to {}",originalFilename,name_);
            return name_;
        }else{
            return null;
        }
    }
}
