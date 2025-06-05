package com.example.drumhub.services;

import com.example.drumhub.dao.LogDAO;
import com.example.drumhub.dao.models.Log;

import java.time.LocalDateTime;

public class LogService {
    private LogDAO logDAO;

    public LogService(LogDAO logDAO) {
        this.logDAO = logDAO;
    }

    public void logInfo(String location, String resource, String actor, String oldData, String newData) {
        Log log = new Log(LocalDateTime.now(), "INFO", location, resource, actor, oldData, newData);
        logDAO.insertLog(log);
    }

    public void logError(String location, String resource, String actor, String oldData, String newData) {
        Log log = new Log(LocalDateTime.now(), "ERROR", location, resource, actor, oldData, newData);
        logDAO.insertLog(log);
    }
}
