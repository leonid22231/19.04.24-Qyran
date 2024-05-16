package com.thedeveloper.qyran.util;

public class StorageFileNotFoundException extends FilesException{
    public StorageFileNotFoundException(String message) {
        super(message);
    }

    public StorageFileNotFoundException(String message, Throwable cause) {
        super(message, cause);
    }
}
