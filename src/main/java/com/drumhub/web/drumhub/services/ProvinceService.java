package com.drumhub.web.drumhub.services;

import com.drumhub.web.drumhub.models.Province;
import com.drumhub.web.drumhub.repositories.ProvinceRepository;

import java.util.List;

public class ProvinceService {
    private final ProvinceRepository provinceRepository;

    public ProvinceService(ProvinceRepository provinceRepository) {
        this.provinceRepository = provinceRepository;
    }

    public List<Province> getProvinces() {
        return provinceRepository.getAllProvinces();
    }
}