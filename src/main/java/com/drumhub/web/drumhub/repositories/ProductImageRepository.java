package com.drumhub.web.drumhub.repositories;

import com.drumhub.web.drumhub.models.ProductImage;
import com.drumhub.web.drumhub.models.UserAddress;
import com.drumhub.web.drumhub.utils.DBConnection;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class ProductImageRepository extends BaseRepository<ProductImage> {
    private final Jdbi jdbi = DBConnection.getJdbi();

    public boolean create(ProductImage productImage) {
        if (productImage.isIsMain() && hasMain()) {
            System.out.println("Product image already has main image");
            productImage.setIsMain(false);
        }

        return jdbi.withHandle(handle ->
                handle.createUpdate("INSERT INTO product_images (id, image, isMain, productId) " +
                                "VALUES (:id, :image, :isMain, :productId")
                        .bindBean(productImage)
                        .execute()
        ) > 0;
    }

    public int update(ProductImage productImage) {
        if (productImage.isIsMain() && hasMain()) {
            System.out.println("Product image already has main image");
            jdbi.withHandle(handle ->
                    handle.createUpdate("UPDATE product_images SET isMain = false")
                            .execute()
            );
        }
        String updateQuery = "UPDATE product_images SET image = :image, isMain = :isMain " +
                "WHERE id = :id";
        return super.update(updateQuery, productImage);
    }

    public int save(ProductImage productImage) {
        if (productImage.isIsMain() && hasMain()) {
            System.out.println("Product image already has main image");
            productImage.setIsMain(false);
        }
        String insertQuery = "INSERT INTO product_images (id, image, isMain, productId) " +
                "VALUES (:id, :image, :isMain, :productId";
        return super.save(insertQuery, productImage);
    }

    public boolean hasMain() {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT COUNT(*) FROM product_images WHERE isMain = true")
                        .mapTo(Integer.class)
                        .one() > 0
        );
    }
}
