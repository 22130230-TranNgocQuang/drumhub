package com.example.drumhub.dao.models;

import java.time.LocalDateTime;

public class Log {
    private int id;
    private LocalDateTime logTime;
    private String level;
    private String location;
    private String resource;
    private String actor;
    private String oldData;
    private String newData;

    public Log(LocalDateTime logTime, String level, String location, String resource,
               String actor, String oldData, String newData) {
        this.logTime = logTime;
        this.level = level;
        this.location = location;
        this.resource = resource;
        this.actor = actor;
        this.oldData = oldData;
        this.newData = newData;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LocalDateTime getLogTime() {
        return logTime;
    }

    public void setLogTime(LocalDateTime logTime) {
        this.logTime = logTime;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getResource() {
        return resource;
    }

    public void setResource(String resource) {
        this.resource = resource;
    }

    public String getActor() {
        return actor;
    }

    public void setActor(String actor) {
        this.actor = actor;
    }

    public String getOldData() {
        return oldData;
    }

    public void setOldData(String oldData) {
        this.oldData = oldData;
    }

    public String getNewData() {
        return newData;
    }

    public void setNewData(String newData) {
        this.newData = newData;
    }
}
