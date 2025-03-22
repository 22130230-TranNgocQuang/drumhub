package com.drumhub.web.drumhub.services;

import com.drumhub.web.drumhub.models.Product;
import com.drumhub.web.drumhub.utils.DBConnection;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.statement.UnableToExecuteStatementException;
import java.util.List;
import java.util.Optional;


public class ProductDAO {
    private final Jdbi jdbi;

    public ProductDAO() {
        this.jdbi = DBConnection.getJdbi();
    }

    // ✅ Lấy danh sách tất cả sản phẩm
    public List<Product> getAllProducts() {
        try {
            return jdbi.withHandle(handle ->
                    handle.createQuery("SELECT * FROM products")
                            .mapToBean(Product.class)
                            .list()
            );
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Failed to get products", e);
        }
    }

    // ✅ Thêm sản phẩm mới
    public void addProduct(Product product) {
        try {
            jdbi.useHandle(handle ->
                    handle.createUpdate("INSERT INTO product (name, description, status) VALUES (:name, :description, :status)")
                            .bindBean(product)
                            .execute()
            );
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Failed to add product", e);
        }
    }

    // ✅ Tìm sản phẩm theo ID
    public Optional<Product> getProductById(int id) {
        try {
            return jdbi.withHandle(handle ->
                    handle.createQuery("SELECT * FROM products WHERE id = :id")
                            .bind("id", id)
                            .mapToBean(Product.class)
                            .findOne()
            );
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Failed to fetch product by ID", e);
        }
    }

    // ✅ Cập nhật sản phẩm
    public void updateProduct(Product product) {
        try {
            jdbi.useHandle(handle ->
                    handle.createUpdate("UPDATE products SET name = :name, description = :description, status = :status WHERE id = :id")
                            .bindBean(product)
                            .execute()
            );
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Failed to update product", e);
        }
    }

    // ✅ Xóa sản phẩm
    public void deleteProduct(int id) {
        try {
            jdbi.useHandle(handle ->
                    handle.createUpdate("DELETE FROM products WHERE id = :id")
                            .bind("id", id)
                            .execute()
            );
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Failed to delete product", e);
        }
    }

    // ✅ Tìm kiếm sản phẩm theo tên
    public List<Product> searchProducts(String keyword) {
        try {
            return jdbi.withHandle(handle ->
                    handle.createQuery("SELECT * FROM products WHERE name LIKE :keyword")
                            .bind("keyword", "%" + keyword + "%")
                            .mapToBean(Product.class)
                            .list()
            );
        } catch (UnableToExecuteStatementException e) {
            throw new RuntimeException("Failed to search products", e);
        }
    }
}
