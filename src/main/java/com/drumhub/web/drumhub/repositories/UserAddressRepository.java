package com.drumhub.web.drumhub.repositories;

import com.drumhub.web.drumhub.models.UserAddress;
import com.drumhub.web.drumhub.utils.DBConnection;
import org.jdbi.v3.core.Jdbi;

public class UserAddressRepository extends BaseRepository<UserAddress> {
    private final Jdbi jdbi = DBConnection.getJdbi();


    public boolean create(UserAddress address) {
        if (address.isIsDefault()) {
            boolean hasDefault = jdbi.withHandle(handle ->
                    handle.createQuery("SELECT COUNT(*) FROM user_addresses WHERE user_id = :userId AND is_default = true")
                            .bind("userId", address.getUserId())
                            .mapTo(Integer.class)
                            .one() > 0
            );

            if (hasDefault) {
                jdbi.useHandle(handle ->
                        handle.createUpdate("UPDATE user_addresses SET is_default = false WHERE user_id = :userId")
                                .bind("userId", address.getUserId())
                                .execute()
                );
            }
        }

        int result = jdbi.withHandle(handle ->
                handle.createUpdate("INSERT INTO user_addresses (user_id, address, phone, province_id, district_id, ward_id, is_default) " +
                                "VALUES (:userId, :address, :phone, :provinceId, :districtId, :wardId, :isDefault)")
                        .bindBean(address)
                        .execute()
        );
        return result > 0;
    }

    public int update(UserAddress entity) {
        if (entity.isIsDefault()) {
            jdbi.useHandle(handle ->
                    handle.createUpdate("UPDATE user_addresses SET isDefault = false WHERE userId = :userId")
                            .bind("userId", entity.getUserId())
                            .execute()
            );
        }
        String updateQuery = "UPDATE user_addresses SET address = :address, phone = :phone, " +
                "provinceId = :provinceId, districtId = :districtId, wardId = :wardId, isDefault = :isDefault " +
                "WHERE id = :id";
        return super.update(updateQuery, entity);
    }

    public int save(UserAddress entity) {
        if (entity.isIsDefault()) {
            jdbi.useHandle(handle ->
                    handle.createUpdate("UPDATE user_addresses SET isDefault = false WHERE userId = :userId")
                            .bind("userId", entity.getUserId())
                            .execute()
            );
        }
        String insertQuery = "INSERT INTO user_addresses (userId, address, phone, provinceId, districtId, wardId, isDefault) " +
                "VALUES (:userId, :address, :phone, :provinceId, :districtId, :wardId, :isDefault)";
        return super.save(insertQuery, entity);
    }
}
