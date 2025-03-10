package com.drumhub.web.drumhub.repositories;

import com.drumhub.web.drumhub.models.Category;
import com.drumhub.web.drumhub.models.Product;
import com.drumhub.web.drumhub.utils.DBConnection;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class CategoryRepository extends BaseRepository<Category> {
    private final Jdbi jdbi = DBConnection.getJdbi();

    public void update(Category category) {
        jdbi.useHandle(handle -> handle.createUpdate("""
                UPDATE categories SET name = :name, image = :image, description = :description
                WHERE id = :id
                """
        ).bindBean(category).execute());
    }

    public Category show(int id) {
        return jdbi.withHandle(handle -> handle.createQuery("SELECT * FROM categories WHERE id = :id")
                .bind("id", id).mapToBean(Category.class).findFirst().orElse(null));
    }

    public void delete(int id) {
        jdbi.useHandle(handle -> handle.createUpdate("DELETE FROM categories WHERE id = :id").bind("id", id).execute());
    }

    public int save(Category category) {
        return jdbi.withHandle(handle ->
                handle.createUpdate("""
                INSERT INTO categories (name, image, description, createdAt)
                VALUES(:name, :image, :description, CURRENT_TIMESTAMP)
                """
                ).bindBean(category).execute());
    }

    public Category findById(int id) {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM categories WHERE id = :id")
                        .bind("id", id)
                        .mapToBean(Category.class)
                        .findFirst()
                        .orElse(null)
        );
    }

    public List<Category> getCategories(int limit) {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM categories LIMIT :limit")
                        .bind("limit", limit)
                        .mapToBean(Category.class)
                        .list()
        );
    }
}
