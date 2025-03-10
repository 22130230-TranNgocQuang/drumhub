package com.drumhub.web.drumhub.repositories;

import com.drumhub.web.drumhub.models.Post;
import com.drumhub.web.drumhub.utils.DBConnection;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class PostRepository {
    private Jdbi jdbi;

    public PostRepository() {
        this.jdbi = DBConnection.getJdbi();
    }

    public List<Post> getLatestPosts(int limit) {
        return jdbi.withHandle(handle -> handle.createQuery("SELECT * FROM posts ORDER BY createdAt DESC LIMIT :limit")
                .bind("limit", limit)
                .mapToBean(Post.class)
                .list());
    }
}
