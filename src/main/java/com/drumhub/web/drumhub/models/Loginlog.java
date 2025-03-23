package com.drumhub.web.drumhub.models;

import com.mysql.cj.xdevapi.TableImpl;

public class Loginlog {
    public int id;
    public int user_id;
    public TableImpl logintime;
    public String ip_address;
    public String user_agent;
}
