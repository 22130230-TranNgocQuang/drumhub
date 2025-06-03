    package com.example.drumhub.dao;

    import com.example.drumhub.dao.db.DBConnect;
    import com.example.drumhub.dao.models.User;

    import java.sql.*;
    import java.util.ArrayList;
    import java.util.List;

    public class UsersDashboardDAO {
        public List<User>   getAll() {
            String sql = "SELECT id, username, password, email, fullName, role, status, createdAt FROM users";
            List<User> users = new ArrayList<>();

            try (Statement st = DBConnect.getStatement();
                 ResultSet rs = st.executeQuery(sql)) {

                while (rs.next()) {
                    users.add(new User(
                            rs.getInt("id"),
                            rs.getString("username"),
                            rs.getString("password"),
                            rs.getString("email"),
                            rs.getString("fullName"),
                            rs.getInt("role"),
                            rs.getInt("status"),
                            rs.getTimestamp("createdAt")
                    ));
                }

            } catch (SQLException e) {
                throw new RuntimeException("Lỗi khi truy vấn danh sách người dùng", e);
            }

            return users;
        }



        public int count() {
            try (Statement st = DBConnect.getStatement()) {
                ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM users");
                if (rs.next()) return rs.getInt(1);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            return 0;
        }
        public User getById(int id) {
            String sql = "SELECT id, username, password, email, fullName, role, status, createdAt FROM users WHERE id = ?";
            try (PreparedStatement ps = DBConnect.getConnection().prepareStatement(sql)) {
                ps.setInt(1, id);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        return new User(
                                rs.getInt("id"),
                                rs.getString("username"),
                                rs.getString("password"),
                                rs.getString("email"),
                                rs.getString("fullName"),
                                rs.getInt("role"),
                                rs.getInt("status"),
                                rs.getTimestamp("createdAt")
                        );
                    }
                }
            } catch (SQLException e) {
                throw new RuntimeException("Lỗi khi truy vấn user theo id", e);
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
            return null;
        }

        public void updateUser(User user) {
            String sql = "UPDATE users SET username = ?, email = ?, fullName = ?, role = ?, status = ? WHERE id = ?";
            try (PreparedStatement ps = DBConnect.getConnection().prepareStatement(sql)) {
                ps.setString(1, user.getUsername());
                ps.setString(2, user.getEmail());
                ps.setString(3, user.getFullName());
                ps.setInt(4, user.getRole());
                ps.setInt(5, user.getStatus());
                ps.setInt(6, user.getId());
                ps.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException("Lỗi khi cập nhật user", e);
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
        public void softDelete(int id) {
            String sql = "UPDATE users SET status = -1 WHERE id = " + id;
            try (Statement st = DBConnect.getStatement()) {
                st.executeUpdate(sql);
            } catch (SQLException e) {
                throw new RuntimeException("Lỗi khi cập nhật trạng thái người dùng", e);
            }
        }
        public void insert(User user) {
            String sql = "INSERT INTO users (username, email, fullName, password, role, status, createdAt) VALUES (?, ?, ?, ?, ?, ?, ?)";

            try (Connection conn = DBConnect.getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql)) {

                ps.setString(1, user.getUsername());
                ps.setString(2, user.getEmail());
                ps.setString(3, user.getFullName());
                ps.setString(4, user.getPassword());  // Trong thực tế nên hash
                ps.setInt(5, user.getRole());
                ps.setInt(6, user.getStatus());
                ps.setTimestamp(7, user.getCreatedAt());

                ps.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
                throw new RuntimeException("Lỗi khi thêm người dùng", e);
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }

    }
