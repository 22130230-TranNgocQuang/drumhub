package com.drumhub.web.drumhub.repositories;

import com.drumhub.web.drumhub.models.Province;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class ProvinceRepository {
    private Jdbi jdbi;

    public ProvinceRepository(Jdbi jdbi) {
        this.jdbi = jdbi;
    }

    public List<Province> getAllProvinces() {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT id, name FROM provinces")
                        .mapToBean(Province.class)
                        .list()
        );
    }
}