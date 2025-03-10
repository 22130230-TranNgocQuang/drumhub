package com.drumhub.web.drumhub.controllers.dashboard;

public enum NestedResourceType {
    POSTS("posts"),
    ADDRESSES("addresses"),
    ORDERS("orders"),
    WISHLISTS("wishlists"),
    PRODUCT_IMAGE("productImages"),
    PRODUCT_COLORS("productColors");

    private final String path;

    NestedResourceType(String path) {
        this.path = path;
    }

    public String getPath() {
        return path;
    }

    public static NestedResourceType fromPath(String path) {
        for (NestedResourceType type : values()) {
            if (type.getPath().equals(path)) {
                return type;
            }
        }
        throw new IllegalArgumentException("Invalid nested resource path: " + path);
    }
}
