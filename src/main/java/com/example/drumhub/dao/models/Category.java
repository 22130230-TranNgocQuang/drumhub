package com.example.drumhub.dao.models;

import java.sql.Timestamp;

public class Category {
    private int id;
    private String name;
    private String image;
    private String description;
    private Timestamp createdAt;

    public Category() { }

    public Category(int id, String name, String image, String description, Timestamp createdAt) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.description = description;
        this.createdAt = createdAt;
    }

    // getters và setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
}
