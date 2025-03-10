package com.drumhub.web.drumhub.services;

import com.drumhub.web.drumhub.models.ProductImage;
import com.drumhub.web.drumhub.repositories.ProductImageRepository;

import java.util.List;

public class ProductImageService {
    private final ProductImageRepository productImageRepository = new ProductImageRepository();

    public List<ProductImage> all() {
        return productImageRepository.all();
    }

    public boolean create(ProductImage productImage) {
        return productImageRepository.create(productImage);
    }

    public ProductImage find(int id) {
        return productImageRepository.find(id);
    }

    public int update(ProductImage productImage) {
        return productImageRepository.update(productImage);
    }

    public int delete(int id) {
        return productImageRepository.delete(id);
    }

}
