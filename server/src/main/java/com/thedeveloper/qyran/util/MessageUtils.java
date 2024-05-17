package com.thedeveloper.qyran.util;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

public class MessageUtils {
    private final static String API_LOGIN = "Qyran.app";
    private final static String API_PSW = "Qyran0001";
    public static void sendMessageRegisterCode(String number, String code) throws IOException, URISyntaxException, InterruptedException, IOException {

        HttpClient client = HttpClient.newHttpClient();

        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create("https://smsc.kz/sys/send.php?login="+API_LOGIN+"&psw="+API_PSW+"&phones="+number))
                .POST(HttpRequest.BodyPublishers.ofString("mes=Qyran.app Подтверждение: "+code))
                .setHeader("cache-control", "no-cache")
                .setHeader("content-type", "application/x-www-form-urlencoded")
                .build();

        client.send(request, HttpResponse.BodyHandlers.ofString());
    }
}