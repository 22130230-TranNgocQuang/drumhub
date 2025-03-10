package com.drumhub.web.drumhub.repositories;


import com.drumhub.web.drumhub.utils.DBConnection;
import com.drumhub.web.drumhub.utils.NamingStrategy;
import org.jdbi.v3.core.Jdbi;

import java.lang.reflect.ParameterizedType;
import java.util.List;

public abstract class BaseRepository<T> {
    protected final Jdbi jdbi = DBConnection.getJdbi();
    private final Class<T> type;
    private final String tableName;

    @SuppressWarnings("unchecked")
    protected BaseRepository() {
        this.type = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
        this.tableName = NamingStrategy.getTableName(type.getSimpleName());
    }

    public List<T> all() {
        String query = "SELECT * FROM " + tableName;
        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .mapToBean(type)
                        .list()
        );
    }

    public T find(Object id) {
        String query = "SELECT * FROM " + tableName + " WHERE id = :id";
        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind("id", id)
                        .mapToBean(type)
                        .findFirst()
                        .orElse(null)
        );
    }

    public int save(String insertQuery, T entity) {
        return jdbi.withHandle(handle ->
                handle.createUpdate(insertQuery)
                        .bindBean(entity)
                        .execute()
        );
    }

    public int update(String updateQuery, T entity) {
        return jdbi.withHandle(handle ->
                handle.createUpdate(updateQuery)
                        .bindBean(entity)
                        .execute()
        );
    }

    public int delete(Object id) {
        String query = "DELETE FROM " + tableName + " WHERE id = :id";
        return jdbi.withHandle(handle ->
                handle.createUpdate(query)
                        .bind("id", id)
                        .execute()
        );
    }
}

