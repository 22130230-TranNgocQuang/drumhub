package com.drumhub.web.drumhub.repositories;

import com.drumhub.web.drumhub.models.Sale;
import com.drumhub.web.drumhub.utils.DBConnection;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class SaleRepository extends BaseRepository<Sale> {
    private final Jdbi jdbi = DBConnection.getJdbi();

    public List<Sale> all() {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM sales")
                        .mapToBean(Sale.class)
                        .list()
        );
    }

    public void update(Sale sale) {
        jdbi.useHandle(handle -> handle.createUpdate("""
                UPDATE sale SET name = :name, description = :description, discountPercentage = :discountPercentage,
                startDate = :startDate, endDate  = :endDate
                WHERE id = :id
                """
        ).bindBean(sale).execute());
    }

    public Sale show(int id) {
        return jdbi.withHandle(handle -> handle.createQuery("SELECT * FROM sales WHERE id = :id")
                .bind("id", id)
                .mapToBean(Sale.class)
                .findFirst()
                .orElse(null));
    }

    public void delete(int id) {
        jdbi.useHandle(handle -> handle.createUpdate("DELETE FROM sales WHERE id = :id")
                .bind("id", id).execute());
    }

    public int save(Sale sale) {
        return jdbi.withHandle(handle ->
                handle.createUpdate("""
                INSERT INTO sales (name, description, discountPercentage, startDate, endDate, createdAt)
                VALUES(:name, :description, :discountPercentage, :startDate, :endDate, CURRENT_TIMESTAMP)
                """
                ).bindBean(sale).execute());
    }

    public Sale findById(int id) {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM sales WHERE id = :id")
                        .bind("id", id)
                        .mapToBean(Sale.class)
                        .findFirst()
                        .orElse(null)
        );
    }
}
