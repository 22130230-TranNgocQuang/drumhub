    package com.example.drumhub.dao;

    import com.example.drumhub.dao.db.DBConnect;
    import com.example.drumhub.dao.models.User;

    import java.sql.ResultSet;
    import java.sql.SQLException;
    import java.sql.Statement;
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
    }
