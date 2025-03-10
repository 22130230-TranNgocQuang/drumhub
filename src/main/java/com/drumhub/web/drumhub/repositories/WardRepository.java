package com.drumhub.web.drumhub.repositories;

import com.drumhub.web.drumhub.models.Ward;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class WardRepository {
    private Jdbi jdbi;

    public WardRepository(Jdbi jdbi) {
        this.jdbi = jdbi;
    }

    public List<Ward> getWardsByDistrictId(int districtId) {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM wards WHERE districtId = :districtId")
                        .bind("districtId", districtId)
                        .mapToBean(Ward.class)
                        .list()
        );
    }
}
