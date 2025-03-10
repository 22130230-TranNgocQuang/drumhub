package com.drumhub.web.drumhub.repositories;

import com.drumhub.web.drumhub.models.Brand;
import com.drumhub.web.drumhub.utils.DBConnection;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class BrandRepository extends BaseRepository<Brand> {
    private final Jdbi jdbi = DBConnection.getJdbi();

    public List<Brand> all() {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM brands")
                        .mapToBean(Brand.class)
                        .list()
        );
    }

    public void update(Brand brand) {
        jdbi.useHandle(handle -> handle.createUpdate("""
                UPDATE brands SET name = :name, image = :image, description = :description
                WHERE id = :id
                """
        ).bindBean(brand).execute());
    }

    public Brand show(int id) {
        return jdbi.withHandle(handle -> handle.createQuery("SELECT * FROM brands WHERE id = :id")
                .bind("id", id)
                .mapToBean(Brand.class)
                .findFirst()
                .orElse(null));
    }

    public void delete(int id) {
        jdbi.useHandle(handle -> handle.createUpdate("DELETE FROM brands WHERE id = :id")
                .bind("id", id).execute());
    }

    public int save(Brand brand) {
        return jdbi.withHandle(handle ->
                handle.createUpdate("""
                INSERT INTO brands (name, image, description, createdAt)
                VALUES(:name, :image, :description, CURRENT_TIMESTAMP)
                """
                ).bindBean(brand).execute());
    }

    public Brand findById(int id) {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM brands WHERE id = :id")
                        .bind("id", id)
                        .mapToBean(Brand.class)
                        .findFirst()
                        .orElse(null)
        );
    }
}
