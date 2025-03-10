package com.drumhub.web.drumhub.utils;


public class NamingStrategy {

    /**
     * Lấy tên bảng từ tên class, thêm hậu tố 's' hoặc 'es' nếu cần.
     *
     * @param className Tên class (ví dụ: UserRepository)
     * @return Tên bảng (ví dụ: users)
     */
    public static String getTableName(String className) {
        // Loại bỏ phần "Repository" khỏi tên class
        String baseName = className.replaceAll("Repository$", "");

        // Chuyển đổi từ PascalCase sang snake_case
        StringBuilder snakeCaseName = new StringBuilder();
        for (int i = 0; i < baseName.length(); i++) {
            char c = baseName.charAt(i);
            if (Character.isUpperCase(c)) {
                if (i > 0) {
                    snakeCaseName.append('_');
                }
                snakeCaseName.append(Character.toLowerCase(c));
            } else {
                snakeCaseName.append(c);
            }
        }

        // Thêm hậu tố 'es' hoặc 's' nếu cần
        if (snakeCaseName.toString().endsWith("y")) {
            return snakeCaseName.substring(0, snakeCaseName.length() - 1) + "ies";
        } else if (snakeCaseName.toString().endsWith("s")) {
            return snakeCaseName + "es";
        } else {
            return snakeCaseName + "s";
        }
    }

    /**
     * Lấy tên class từ tên bảng, chuyển về PascalCase.
     *
     * @param tableName Tên bảng (ví dụ: users)
     * @return Tên class (ví dụ: User)
     */
    public static String getClassName(String tableName) {
        String[] parts = tableName.split("_");
        StringBuilder className = new StringBuilder();
        for (String part : parts) {
            className.append(Character.toUpperCase(part.charAt(0))).append(part.substring(1));
        }
        return className.toString().replaceAll("(ies)$", "y").replaceAll("(s|es)$", "");
    }
}
