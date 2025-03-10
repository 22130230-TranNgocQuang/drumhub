package com.drumhub.web.drumhub.repositories;

import com.drumhub.web.drumhub.models.ProductColor;
import com.drumhub.web.drumhub.models.ProductImage;
import com.drumhub.web.drumhub.utils.DBConnection;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class ProductColorRepository extends BaseRepository<ProductColor> {
    private final Jdbi jdbi = DBConnection.getJdbi();

    public boolean create(ProductColor productColor) {
        return jdbi.withHandle(handle ->
                handle.createUpdate("INSERT INTO product_images (id, colorCode, colorName, productId) " +
                                "VALUES (:id, :colorCode, :colorName, :productId")
                        .bindBean(productColor)
                        .execute()
        ) > 0;
    }

    public int update(ProductColor productColor) {
        String updateQuery = "UPDATE product_colors SET colorCode = :colorCode, colorName = :colorName " +
                "WHERE id = :id";
        return super.update(updateQuery, productColor);
    }

    public int save(ProductColor productColor) {
        String insertQuery = "INSERT INTO product_images (id, colorCode, colorName, productId) " +
                "VALUES (:id, :colorCode, :colorName, :productId";
        return super.save(insertQuery, productColor);
    }
}
