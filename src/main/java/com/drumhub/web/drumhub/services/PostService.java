package com.drumhub.web.drumhub.services;

import com.drumhub.web.drumhub.models.Post;
import com.drumhub.web.drumhub.repositories.PostRepository;

import java.util.List;

public class PostService {
    private final PostRepository postRepository;

    public PostService() {
        this.postRepository = new PostRepository();
    }

    public List<Post> getLatestPosts(int limit) {
        return postRepository.getLatestPosts(limit);
    }
}