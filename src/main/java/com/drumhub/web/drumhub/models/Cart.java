package com.drumhub.web.drumhub.models;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private List<CartItem> items;

    @Override
    public String toString() {
        return "Cart{" +
                "items=" + items +
                '}';
    }

    public void setItems(List<CartItem> items) {
        this.items = items;
    }

    public Cart() {
        this.items = new ArrayList<>();
    }

    public void addItem(CartItem item) {
        // Kiểm tra xem sản phẩm đã tồn tại trong giỏ hàng chưa
        for (CartItem existingItem : items) {
            if (existingItem.getProduct().getId() == item.getProduct().getId() 
                && existingItem.getColor().equals(item.getColor())) {
                existingItem.setQuantity(existingItem.getQuantity() + item.getQuantity());
                return;
            }
        }
        items.add(item);
    }

    public void removeItem(int productId, String color) {
        items.removeIf(item -> item.getProduct().getId() == productId 
                             && item.getColor().equals(color));
    }

    public void updateQuantity(int productId, String color, int quantity) {
        for (CartItem item : items) {
            if (item.getProduct().getId() == productId 
                && item.getColor().equals(color)) {
                item.setQuantity(quantity);
                return;
            }
        }
    }

    public List<CartItem> getItems() {
        return items;
    }

    public double getTotal() {
        return items.stream()
                   .mapToDouble(CartItem::getTotal)
                   .sum();
    }

    public int getItemCount() {
        return items.stream()
                   .mapToInt(CartItem::getQuantity)
                   .sum();
    }

    public void updateColor(int productId, String oldColor, String newColor) {
        for (CartItem item : items) {
            if (item.getProduct().getId() == productId && item.getColor().equals(oldColor)) {
                item.setColor(newColor);
                break;
            }
        }
    }
}