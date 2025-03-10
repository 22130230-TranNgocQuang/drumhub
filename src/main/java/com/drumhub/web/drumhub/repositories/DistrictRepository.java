package com.drumhub.web.drumhub.repositories;

import com.drumhub.web.drumhub.models.District;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class DistrictRepository {
    private Jdbi jdbi;

    public DistrictRepository(Jdbi jdbi) {
        this.jdbi = jdbi;
    }

    public List<District> getDistrictsByProvinceId(int provinceId) {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM districts WHERE provinceId = :provinceId")
                        .bind("provinceId", provinceId)
                        .mapToBean(District.class)
                        .list()
        );
    }
}
