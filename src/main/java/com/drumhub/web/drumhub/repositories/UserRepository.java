package com.drumhub.web.drumhub.repositories;

import com.drumhub.web.drumhub.models.User;
import com.drumhub.web.drumhub.models.UserAddress;
import com.drumhub.web.drumhub.utils.DBConnection;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.mapper.reflect.BeanMapper;
import org.mindrot.jbcrypt.BCrypt;

import java.util.LinkedHashMap;
import java.util.List;

public class UserRepository extends BaseRepository<User> {
    private final Jdbi jdbi = DBConnection.getJdbi();

    public int save(User user) {
        String query = """
                INSERT INTO users (email, password, fullname, role, status, avatar, createdAt)
                VALUES (:email, :password, :fullname, :role, :status, :avatar, CURRENT_TIMESTAMP)
                """;
        return super.save(query, user);
    }

    public int update(User user) {
        String query = """
                UPDATE users SET email = :email, fullname = :fullname WHERE id = :id
                """;
        return super.update(query, user);
    }


    public User show(int id) {
        User user = find(id);
        if (user != null) {
            List<UserAddress> addresses = jdbi.withHandle(handle ->
                    handle.createQuery("SELECT * FROM user_addresses WHERE userId = :userId")
                            .bind("userId", user.getId())
                            .mapToBean(UserAddress.class)
                            .list()
            );
            user.setUserAddresses(addresses);
        }

        return user;
    }

    public User detail(int id) {
        String sql = """
                SELECT
                    u.id AS u_id, u.email AS u_email, u.fullname AS u_fullname,
                    u.role AS u_role, u.status AS u_status, u.avatar AS u_avatar,
                    u.createdAt AS u_createdAt,
                    a.id AS a_id, a.userId AS a_userId, a.address AS a_address,
                    a.phone AS a_phone, a.provinceId AS a_provinceId,
                    a.districtId AS a_districtId, a.wardId AS a_wardId, a.isDefault AS a_isDefault
                FROM users u
                         LEFT JOIN user_addresses a ON u.id = a.userId
                WHERE u.id = :id
                """;
        return jdbi.withHandle(handle -> handle.createQuery(sql)
                .bind("id", id)
                .registerRowMapper(BeanMapper.factory(User.class, "u"))
                .registerRowMapper(BeanMapper.factory(UserAddress.class, "a"))
                .reduceRows(new LinkedHashMap<Integer, User>(), (map, row) -> {
                    User user = map.computeIfAbsent(row.getColumn("u_id", Integer.class), _ -> row.getRow(User.class));
                    if (row.getColumn("a_id", Integer.class) != null) {
                        user.addAddress(row.getRow(UserAddress.class));
                    }
                    return map;
                })
                .values()
                .stream()
                .findFirst()
                .orElse(null)
        );
    }

    public boolean register(User user) {
        String query = """
                INSERT INTO users (email, password, fullname, phone, role, status, createdAt)
                VALUES (:email, :password, :fullname, :phone, :role, 1, CURRENT_TIMESTAMP)
                """;
        return super.save(query, user) > 0;
    }

    public boolean isPhoneExists(String phone) {
        String query = "SELECT COUNT(*) FROM users WHERE phone = ?";
        return jdbi.withHandle(handle -> handle.createQuery(query).bind(0, phone).mapTo(Integer.class).one()) > 0;
    }

    public boolean isEmailExists(String email) {
        String query = "SELECT COUNT(*) FROM users WHERE email = ?";
        return jdbi.withHandle(handle -> handle.createQuery(query).bind(0, email).mapTo(Integer.class).one()) > 0;
    }

    public User login(String username, String password) {
        String query = """
                SELECT * FROM users WHERE (phone = :username OR email = :username) AND status = 1
                """;
        User user = jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind("username", username)
                        .mapToBean(User.class)
                        .findOne()
                        .orElse(null)
        );

        // Kiểm tra mật khẩu
        if (user != null && BCrypt.checkpw(password, user.getPassword())) {
            return user; // Đăng nhập thành công
        }
        return null; // Đăng nhập thất bại
    }

    public int createWithAddresses(User user, List<UserAddress> addresses) {
        return jdbi.withHandle(handle -> {
            // Bắt đầu transaction
            return handle.inTransaction(h -> {
                // Thêm user
                String userSql = """
                    INSERT INTO users (email, password, fullname, role, status, avatar, createdAt)
                    VALUES (:email, :password, :fullname, :role, :status, :avatar, CURRENT_TIMESTAMP)
                    """;
                
                int userId = h.createUpdate(userSql)
                        .bindBean(user)
                        .executeAndReturnGeneratedKeys("id")
                        .mapTo(Integer.class)
                        .one();

                // Thêm địa chỉ
                if (addresses != null && !addresses.isEmpty()) {
                    String addressSql = """
                        INSERT INTO user_addresses (userId, address, phone, provinceId, districtId, wardId, isDefault)
                        VALUES (:userId, :address, :phone, :provinceId, :districtId, :wardId, :isDefault)
                        """;
                    
                    for (UserAddress address : addresses) {
                        address.setUserId(userId);
                        h.createUpdate(addressSql)
                                .bindBean(address)
                                .execute();
                    }
                }

                return userId;
            });
        });
    }

    public User findByEmail(String email) {
        String query = "SELECT * FROM users WHERE email = ? AND status = 1";
        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind(0, email)
                        .mapToBean(User.class)
                        .findFirst()
                        .orElse(null)
        );
    }
}