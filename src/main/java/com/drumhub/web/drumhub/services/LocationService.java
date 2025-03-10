package com.drumhub.web.drumhub.services;

import com.drumhub.web.drumhub.models.District;
import com.drumhub.web.drumhub.models.Province;
import com.drumhub.web.drumhub.models.Ward;
import com.drumhub.web.drumhub.repositories.DistrictRepository;
import com.drumhub.web.drumhub.repositories.ProvinceRepository;
import com.drumhub.web.drumhub.repositories.WardRepository;

import java.util.List;

public class LocationService {
    private ProvinceRepository provinceRepository;
    private DistrictRepository districtRepository;
    private WardRepository wardRepository;

    public LocationService(ProvinceRepository provinceRepository, DistrictRepository districtRepository, WardRepository wardRepository) {
        this.provinceRepository = provinceRepository;
        this.districtRepository = districtRepository;
        this.wardRepository = wardRepository;
    }

    public List<Province> getAllProvinces() {
        return provinceRepository.getAllProvinces();
    }

    public List<District> getDistrictsByProvinceId(int provinceId) {
        return districtRepository.getDistrictsByProvinceId(provinceId);
    }

    public List<Ward> getWardsByDistrictId(int districtId) {
        return wardRepository.getWardsByDistrictId(districtId);
    }
}
