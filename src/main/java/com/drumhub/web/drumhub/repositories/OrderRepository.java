package com.drumhub.web.drumhub.repositories;

import com.drumhub.web.drumhub.models.Order;
import com.drumhub.web.drumhub.models.OrderItem;
import com.drumhub.web.drumhub.utils.DBConnection;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.mapper.reflect.BeanMapper;

import java.util.LinkedHashMap;
import java.util.List;

public class OrderRepository {
    private final Jdbi jdbi;

    public OrderRepository() {
        this.jdbi = DBConnection.getJdbi();
    }

    public Order find(int id) {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM orders WHERE id = :id")
                        .bind("id", id)
                        .mapToBean(Order.class)
                        .findFirst()
                        .orElse(null)
        );
    }
    public List<Order> all() {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM orders")
                        .mapToBean(Order.class)
                        .list()
        );
    }
    public Order findWithDetails(int id) {
        String sql = """
                SELECT
                    o.id AS o_id, o.userId AS o_userId, o.userAddressId AS o_userAddressId,
                    o.totalAmount AS o_totalAmount, o.orderDate AS o_orderDate, o.status AS o_status,
                    o.createdAt AS o_createdAt, o.updatedAt AS o_updatedAt, o.deletedAt AS o_deletedAt,
                    oi.id AS oi_id, oi.orderId AS oi_orderId, oi.productId AS oi_productId,
                    oi.quantity AS oi_quantity, oi.price AS oi_price, oi.createdAt AS oi_createdAt,
                    oi.updatedAt AS oi_updatedAt
                FROM orders o
                         LEFT JOIN order_items oi ON o.id = oi.orderId
                WHERE o.id = :id
                """;

        return jdbi.withHandle(handle -> handle.createQuery(sql)
                .bind("id", id)
                .registerRowMapper(BeanMapper.factory(Order.class, "o"))
                .registerRowMapper(BeanMapper.factory(OrderItem.class, "oi"))
                .reduceRows(new LinkedHashMap<Integer, Order>(), (map, row) -> {
                    // Tạo hoặc lấy Order từ map
                    Order order = map.computeIfAbsent(
                            row.getColumn("o_id", Integer.class),
                            _ -> row.getRow(Order.class)
                    );

                    // Nếu có OrderItem, thêm vào danh sách
                    if (row.getColumn("oi_id", Integer.class) != null) {
                        order.getItems().add(row.getRow(OrderItem.class));
                    }

                    return map;
                })
                .values()
                .stream()
                .findFirst()
                .orElse(null)
        );
    }public boolean deleteOrder(int orderId) {
        try {
            // Sử dụng jdbi để thực thi câu lệnh xóa đơn hàng
            jdbi.useHandle(handle ->
                    handle.createUpdate("DELETE FROM orders WHERE id = :orderId")
                            .bind("orderId", orderId)
                            .execute()
            );
            return true; // Trả về true nếu xóa thành công
        } catch (Exception e) {
            // Xử lý lỗi nếu có
            e.printStackTrace();
            return false; // Trả về false nếu có lỗi xảy ra
        }
    }

}
