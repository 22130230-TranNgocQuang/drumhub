package com.drumhub.web.drumhub.config;


public class GoogleAuthConfig {
    public static final String CLIENT_ID = "1072082311498-klq03duhkre1d22ptisv6t557i4lf29n.apps.googleusercontent.com";
    public static final String CLIENT_SECRET = "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";
    public static final String REDIRECT_URI = "http://localhost:8080/login/oauth2/code/google";
    public static final String AUTH_ENDPOINT = "https://accounts.google.com/o/oauth2/v2/auth";
    public static final String TOKEN_ENDPOINT = "https://oauth2.googleapis.com/token";
    public static final String USERINFO_ENDPOINT = "https://www.googleapis.com/oauth2/v3/userinfo";
    public static final String SCOPE = "email profile";
}
