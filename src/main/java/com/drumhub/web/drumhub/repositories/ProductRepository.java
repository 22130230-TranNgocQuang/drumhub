package com.drumhub.web.drumhub.repositories;

import com.drumhub.web.drumhub.models.*;
import com.drumhub.web.drumhub.utils.DBConnection;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.mapper.reflect.BeanMapper;
import org.jdbi.v3.core.mapper.reflect.ConstructorMapper;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

public class ProductRepository extends BaseRepository<Product> {
    private final Jdbi jdbi;

    public ProductRepository() {
        this.jdbi = DBConnection.getJdbi();
    }

    public List<Product> all() {
        String sql = """
                    SELECT
                        p.id AS p_id, p.name AS p_name, p.price AS p_price, p.description as p_description,
                        p.stock as p_stock, p.createdAt as p_createdAt,
                        c.id AS c_id, c.name AS c_name,
                        b.id AS b_id, b.name AS b_name,
                        i.id AS i_id, i.image AS i_image, i.isMain AS i_isMain
                    FROM products p
                             LEFT JOIN categories c ON p.categoryId = c.id
                             LEFT JOIN brands b ON p.brandId = b.id
                             LEFT JOIN product_images i ON p.id = i.productId AND i.isMain = 1
                """;

        return jdbi.withHandle(handle -> handle.createQuery(sql).registerRowMapper(BeanMapper.factory(Product.class, "p")).registerRowMapper(BeanMapper.factory(Category.class, "c")).registerRowMapper(BeanMapper.factory(ProductImage.class, "i")).registerRowMapper(BeanMapper.factory(Brand.class, "b")).reduceRows(new LinkedHashMap<Integer, Product>(), (map, row) -> {
            Product product = map.computeIfAbsent(row.getColumn("p_id", Integer.class), _ -> row.getRow(Product.class));
            if (row.getColumn("c_id", Integer.class) != null) {
                product.setCategory(row.getRow(Category.class));
            }
            if (row.getColumn("i_id", Integer.class) != null) {
                product.setImages(List.of(row.getRow(ProductImage.class)));
            }
            if (row.getColumn("b_id", Integer.class) != null) {
                product.setBrand(row.getRow(Brand.class));
            }
            return map;
        }).values().stream().toList());
    }

    public Product findById(int id) {
        return jdbi.withHandle(handle -> handle.createQuery("SELECT * FROM products WHERE id = :id")
                .bind("id", id).mapToBean(Product.class).findFirst().orElse(null));
    }

    public void save(Product product) {
        jdbi.useHandle(handle -> handle.createUpdate("""
                INSERT INTO products (name, description, price, stock, total_views, is_feature, status,
                average_rating, category_id, brand_id, created_at) VALUES (:name, :description,
                :price, :stock, :total_views, :is_feature, :status, :average_rating, :categoryId,
                :brandId, CURRENT_TIMESTAMP)
                """
        ).bindBean(product).execute());
    }

    public void update(Product product) {
        jdbi.useHandle(handle -> handle.createUpdate("""
                UPDATE products SET name = :name, description = :description, price = :price, stock = :stock,
                isFeatured = :isFeatured, status = :status WHERE id = :id
                """
        ).bindBean(product).execute());
    }

    public void delete(int id) {
        jdbi.useHandle(handle -> handle.createUpdate("DELETE FROM products WHERE id = :id").bind("id", id).execute());
    }

    public Product find(int id) {
        return jdbi.withHandle(handle -> handle.createQuery("SELECT * FROM products WHERE id = :id").bind("id", id)
                .mapToBean(Product.class).findFirst().orElse(null));
    }

    public Product show(int id) {
        return jdbi.withHandle(handle -> handle.createQuery("SELECT * FROM products WHERE id = :id")
                .bind("id", id).mapToBean(Product.class).findFirst().orElse(null));
    }

    public Product findWithDetails(int id) {
        String sql = """
                    SELECT
                        p.id AS p_id, p.name AS p_name, p.description AS p_description,
                        p.price AS p_price, p.stock AS p_stock, p.totalViews AS p_totalViews,
                        p.isFeatured AS p_isFeatured, p.status AS p_status, p.averageRating AS p_averageRating,
                        p.createdAt AS p_createdAt,
                        pi.id AS pi_id, pi.image AS pi_image, pi.isMain AS pi_isMain,
                        pc.id AS pc_id, pc.colorCode AS pc_colorCode, pc.colorName AS pc_colorName,
                        c.id AS c_id, c.name AS c_name, c.image AS c_image, c.description AS c_description,
                        c.createdAt AS c_createdAt,
                        b.id AS b_id, b.name AS b_name, b.image AS b_image, b.description AS b_description,
                        b.createdAt AS b_createdAt
                    FROM products p
                        LEFT JOIN product_images pi ON p.id = pi.productId
                        LEFT JOIN product_colors pc ON p.id = pc.productId
                        LEFT JOIN categories c ON p.categoryId = c.id
                        LEFT JOIN brands b ON p.brandId = b.id
                    WHERE p.id = :id;
                """;

        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind("id", id)
                        .registerRowMapper(BeanMapper.factory(Product.class, "p"))
                        .registerRowMapper(BeanMapper.factory(ProductImage.class, "pi"))
                        .registerRowMapper(BeanMapper.factory(ProductColor.class, "pc"))
                        .registerRowMapper(BeanMapper.factory(Category.class, "c"))
                        .registerRowMapper(BeanMapper.factory(Brand.class, "b"))
                        .reduceRows(new LinkedHashMap<Integer, Product>(), (map, row) -> {
                            Product product = map.computeIfAbsent(row.getColumn("p_id", Integer.class), _ -> row.getRow(Product.class));

                            // Map ProductImage
                            if (row.getColumn("pi_id", Integer.class) != null) {
                                ProductImage image = row.getRow(ProductImage.class);
                                if (product.getImages().stream().noneMatch(img -> img.getId() == image.getId())) {
                                    product.addImage(row.getRow(ProductImage.class));
                                }
                            }

                            // Map ProductColor
                            if (row.getColumn("pc_id", Integer.class) != null) {
                                ProductColor color = row.getRow(ProductColor.class);
                                if (product.getColors().stream().noneMatch(cl -> cl.getId() == color.getId())) {
                                    product.addColor(row.getRow(ProductColor.class));
                                }
                            }

                            // Map Category
                            if (row.getColumn("c_id", Integer.class) != null && product.getCategory() == null) {
                                product.setCategory(row.getRow(Category.class));
                            }

                            // Map Brand
                            if (row.getColumn("b_id", Integer.class) != null && product.getBrand() == null) {
                                product.setBrand(row.getRow(Brand.class));
                            }

                            return map;
                        }).values().stream().findFirst().orElse(null)
        );

    }

    public List<Product> getFeaturedProducts(int limit) {
        return jdbi.withHandle(handle -> handle.createQuery("""
            SELECT 
                p.id,
                p.name,
                p.description,
                p.price,
                MAX(pi.image) AS mainImage,
                MAX(s.discountPercentage) AS discountPercentage
            FROM 
                products p
            LEFT JOIN 
                product_images pi ON p.id = pi.productId AND pi.isMain = 1
            LEFT JOIN 
                product_sales ps ON p.id = ps.productId
            LEFT JOIN 
                sales s ON ps.saleId = s.id
            WHERE 
                p.isFeatured = 1 AND p.status = 1
            GROUP BY 
                p.id, p.name, p.description, p.price
            LIMIT :limit
            """)
                .bind("limit", limit)
                .registerRowMapper(ConstructorMapper.factory(Product.class))
                .map((rs, ctx) -> {
                    Product product = new Product();
                    product.setId(rs.getInt("id"));
                    product.setName(rs.getString("name"));
                    product.setDescription(rs.getString("description"));
                    product.setPrice(rs.getDouble("price"));
                    product.setImageMain(rs.getString("mainImage"));

                    double discount = rs.getDouble("discountPercentage");
                    if (!rs.wasNull()) {
                        ProductSale productSale = new ProductSale();
                        Sale sale = new Sale();
                        sale.setDiscountPercentage(discount);
                        productSale.setSale(sale);
                        product.setProductSale(productSale);
                    }
                    return product;
                })
                .list());
    }



    public List<Product> getLatestProducts(int limit) {
        return jdbi.withHandle(handle -> handle.createQuery("SELECT * FROM products ORDER BY createdAt DESC LIMIT :limit").bind("limit", limit).mapToBean(Product.class).list());
    }

    public List<Product> allWithDetails() {
        String sql = """
                SELECT
                    p.id AS p_id, p.name AS p_name, p.description AS p_description,
                    p.price AS p_price, p.stock AS p_stock, p.totalViews AS p_totalViews,
                    p.isFeatured AS p_isFeatured, p.status AS p_status,
                    p.averageRating AS p_averageRating,
                    p.categoryId AS p_categoryId, p.brandId AS p_brandId,
                    p.createdAt AS p_createdAt,
                
                    c.id AS c_id, c.name AS c_name, c.image AS c_image, c.description AS c_description,
                    c.createdAt AS c_createdAt,
                
                    b.id AS b_id, b.name AS b_name, b.image AS b_image, b.description AS b_description,
                    b.createdAt AS b_createdAt,
                
                    pi.id AS pi_id, pi.productId AS pi_productId, pi.image AS pi_image, pi.isMain AS pi_isMain,
                
                    pc.id AS pc_id, pc.colorCode AS pc_colorCode, pc.colorName AS pc_colorName
                FROM products p
                         LEFT JOIN categories c ON p.categoryId = c.id
                         LEFT JOIN brands b ON p.brandId = b.id
                         LEFT JOIN product_images pi ON p.id = pi.productId
                         LEFT JOIN product_colors pc ON p.id = pc.productId
                
                """;

        return jdbi.withHandle(handle -> handle.createQuery(sql).registerRowMapper(BeanMapper.factory(Product.class, "p")).registerRowMapper(BeanMapper.factory(Category.class, "c")).registerRowMapper(BeanMapper.factory(Brand.class, "b")).registerRowMapper(BeanMapper.factory(ProductImage.class, "pi")).registerRowMapper(BeanMapper.factory(ProductColor.class, "pc")).reduceRows(new LinkedHashMap<Integer, Product>(), (map, row) -> {
            Product product = map.computeIfAbsent(row.getColumn("p_id", Integer.class), _ -> row.getRow(Product.class));

            if (row.getColumn("c_id", Integer.class) != null) {
                product.setCategory(row.getRow(Category.class));
            }

            if (row.getColumn("b_id", Integer.class) != null) {
                product.setBrand(row.getRow(Brand.class));
            }

            if (row.getColumn("pi_id", Integer.class) != null) {
                ProductImage image = row.getRow(ProductImage.class);
                if (product.getImages().stream().noneMatch(img -> img.getId() == image.getId())) {
                    product.addImage(image); // Chỉ thêm nếu chưa tồn tại
                }
            }

            if (row.getColumn("pc_id", Integer.class) != null) {
                ProductColor color = row.getRow(ProductColor.class);
                if (product.getColors().stream().noneMatch(col -> col.getId() == color.getId())) {
                    product.addColor(color); // Chỉ thêm nếu chưa tồn tại
                }
            }

            return map;
        }).values().stream().toList());
    }

    public List<Product> getFilteredProducts(int offset, int limit, String search, String category, String brand, String priceRange, String sortBy) {
        StringBuilder sql = new StringBuilder("""
                WITH FilteredProducts AS (
                    SELECT
                        p.id AS fp_id,
                        p.name AS fp_name,
                        p.description AS fp_description,
                        p.price AS fp_price,
                        p.stock AS fp_stock,
                        p.totalViews AS fp_totalViews,
                        p.isFeatured AS fp_isFeatured,
                        p.status AS fp_status,
                        p.averageRating AS fp_averageRating,
                        p.createdAt AS fp_createdAt,
                        p.categoryId AS fp_categoryId,
                        p.brandId AS fp_brandId
                    FROM products p
                    WHERE 1=1
                """);

        List<Object> params = new ArrayList<>();

        // Thêm các điều kiện tìm kiếm vào FilteredProducts
        if (search != null && !search.isEmpty()) {
            sql.append(" AND (p.name LIKE ? OR p.description LIKE ?)");
            params.add("%" + search + "%");
            params.add("%" + search + "%");
        }

        if (category != null && !category.isEmpty()) {
            sql.append(" AND p.categoryId = ?");
            params.add(Integer.parseInt(category));
        }

        if (brand != null && !brand.isEmpty()) {
            sql.append(" AND p.brandId = ?");
            params.add(Integer.parseInt(brand));
        }

        if (priceRange != null && !priceRange.isEmpty()) {
            String[] prices = priceRange.split("-");
            if (prices.length == 2) {
                sql.append(" AND p.price BETWEEN ? AND ?");
                params.add(Double.parseDouble(prices[0]));
                params.add(Double.parseDouble(prices[1]));
            }
        }

        // Thêm ORDER BY và LIMIT vào FilteredProducts
        if (sortBy != null && !sortBy.isEmpty()) {
            switch (sortBy) {
                case "name_asc" -> sql.append(" ORDER BY p.name ASC");
                case "name_desc" -> sql.append(" ORDER BY p.name DESC");
                case "price_asc" -> sql.append(" ORDER BY p.price ASC");
                case "price_desc" -> sql.append(" ORDER BY p.price DESC");
                default -> sql.append(" ORDER BY p.createdAt DESC");
            }
        } else {
            sql.append(" ORDER BY p.createdAt DESC");
        }

        sql.append(" LIMIT ? OFFSET ?");
        params.add(limit);
        params.add(offset);

        // Sau khi đã lọc và phân trang, JOIN với các bảng khác
        sql.append("""
                    )
                    SELECT
                        fp.fp_id,
                        fp.fp_name AS fp_name,
                        fp.fp_description AS fp_description,
                        fp.fp_price AS fp_price,
                        fp.fp_stock AS fp_stock,
                        fp.fp_totalViews AS fp_totalViews,
                        fp.fp_isFeatured AS fp_isFeatured,
                        fp.fp_status AS fp_status,
                        fp.fp_averageRating AS fp_averageRating,
                        fp.fp_createdAt AS fp_createdAt,
                        fp.fp_categoryId AS fp_categoryId,
                        fp.fp_brandId AS fp_brandId,
                        pi.id AS pi_id,
                        pi.image AS pi_image, 
                        pi.isMain AS pi_isMain,
                        c.id AS c_id, 
                        c.name AS c_name,
                        b.id AS b_id, 
                        b.name AS b_name,
                        s.id AS s_id,
                        s.name AS s_name,
                        s.discountPercentage AS s_discountPercentage,
                        s.startDate AS s_startDate,
                        s.endDate AS s_endDate
                    FROM FilteredProducts fp
                    LEFT JOIN product_images pi ON fp.fp_id = pi.productId
                    LEFT JOIN categories c ON fp.fp_categoryId = c.id
                    LEFT JOIN brands b ON fp.fp_brandId = b.id
                    LEFT JOIN product_sales ps ON fp.fp_id = ps.productId
                    LEFT JOIN sales s ON ps.saleId = s.id AND NOW() BETWEEN s.startDate AND s.endDate
                """);

        return jdbi.withHandle(handle -> {
            var query = handle.createQuery(sql.toString())
                    .registerRowMapper(BeanMapper.factory(Product.class, "fp"))
                    .registerRowMapper(BeanMapper.factory(ProductImage.class, "pi"))
                    .registerRowMapper(BeanMapper.factory(Category.class, "c"))
                    .registerRowMapper(BeanMapper.factory(Brand.class, "b"))
                    .registerRowMapper(BeanMapper.factory(Sale.class, "s"));

            for (int i = 0; i < params.size(); i++) {
                query.bind(i, params.get(i));
            }

            return query.reduceRows(new LinkedHashMap<Integer, Product>(), (map, row) -> {
                Product product = map.computeIfAbsent(
                        row.getColumn("fp_id", Integer.class),
                        id -> row.getRow(Product.class)
                );

                if (row.getColumn("pi_id", Integer.class) != null) {
                    product.addImage(row.getRow(ProductImage.class));
                }

                if (row.getColumn("c_id", Integer.class) != null) {
                    product.setCategory(row.getRow(Category.class));
                }

                if (row.getColumn("b_id", Integer.class) != null) {
                    product.setBrand(row.getRow(Brand.class));
                }

                if (row.getColumn("s_id", Integer.class) != null) {
                    Sale sale = row.getRow(Sale.class);
                    ProductSale productSale = new ProductSale();
                    productSale.setSale(sale);
                    product.setProductSale(productSale);
                }

                return map;
            }).values().stream().toList();
        });
    }

    public int countFilteredProducts(String search, String category, String brand, String priceRange) {
        StringBuilder sql = new StringBuilder("""
                    SELECT COUNT(*) FROM products p
                    WHERE 1=1
                """);
        List<Object> params = new ArrayList<>();

        // Thêm điều kiện tìm kiếm
        if (search != null && !search.isEmpty()) {
            sql.append(" AND (p.name LIKE ? OR p.description LIKE ?)");
            params.add("%" + search + "%");
            params.add("%" + search + "%");
        }

        // Thêm điều kiện category
        if (category != null && !category.isEmpty()) {
            sql.append(" AND p.categoryId = ?");
            params.add(Integer.parseInt(category));
        }

        // Thêm điều kiện brand
        if (brand != null && !brand.isEmpty()) {
            sql.append(" AND p.brandId = ?");
            params.add(Integer.parseInt(brand));
        }

        // Thêm điều kiện khoảng giá
        if (priceRange != null && !priceRange.isEmpty()) {
            String[] prices = priceRange.split("-");
            if (prices.length == 2) {
                sql.append(" AND p.price BETWEEN ? AND ?");
                params.add(Double.parseDouble(prices[0]));
                params.add(Double.parseDouble(prices[1]));
            }
        }

        return jdbi.withHandle(handle -> {
            var query = handle.createQuery(sql.toString());
            for (int i = 0; i < params.size(); i++) {
                query.bind(i, params.get(i));
            }
            return query.mapTo(Integer.class).one();
        });
    }

    public List<Product> getRelatedProducts(int productId, int categoryId, int limit) {
        String sql = """
            SELECT
                p.*,
                pi.id AS pi_id,
                pi.image AS pi_image, 
                pi.isMain AS pi_isMain,
                c.id AS c_id, 
                c.name AS c_name,
                b.id AS b_id, 
                b.name AS b_name,
                s.id AS s_id,
                s.name AS s_name,
                s.discountPercentage AS s_discountPercentage,
                s.startDate AS s_startDate,
                s.endDate AS s_endDate
            FROM products p
            LEFT JOIN product_images pi ON p.id = pi.productId
            LEFT JOIN categories c ON p.categoryId = c.id
            LEFT JOIN brands b ON p.brandId = b.id
            LEFT JOIN product_sales ps ON p.id = ps.productId
            LEFT JOIN sales s ON ps.saleId = s.id AND NOW() BETWEEN s.startDate AND s.endDate
            WHERE p.categoryId = ? AND p.id != ?
            ORDER BY RAND()
            LIMIT ?
        """;

        return jdbi.withHandle(handle -> handle.createQuery(sql)
            .bind(0, categoryId)
            .bind(1, productId)
            .bind(2, limit)
            .registerRowMapper(BeanMapper.factory(Product.class))
            .registerRowMapper(BeanMapper.factory(ProductImage.class, "pi"))
            .registerRowMapper(BeanMapper.factory(Category.class, "c"))
            .registerRowMapper(BeanMapper.factory(Brand.class, "b"))
            .registerRowMapper(BeanMapper.factory(Sale.class, "s"))
            .reduceRows(new LinkedHashMap<Integer, Product>(), (map, row) -> {
                Product product = map.computeIfAbsent(
                    row.getColumn("id", Integer.class),
                    id -> row.getRow(Product.class)
                );

                if (row.getColumn("pi_id", Integer.class) != null) {
                    product.addImage(row.getRow(ProductImage.class));
                }

                if (row.getColumn("c_id", Integer.class) != null) {
                    product.setCategory(row.getRow(Category.class));
                }

                if (row.getColumn("b_id", Integer.class) != null) {
                    product.setBrand(row.getRow(Brand.class));
                }

                if (row.getColumn("s_id", Integer.class) != null) {
                    Sale sale = row.getRow(Sale.class);
                    ProductSale productSale = new ProductSale();
                    productSale.setSale(sale);
                    product.setProductSale(productSale);
                }

                return map;
            })
            .values()
            .stream()
            .toList());
    }

    public ProductSale getCurrentSale(int productId) {
        String sql = """
            SELECT 
                ps.id AS ps_id,
                ps.productId AS ps_productId,
                ps.saleId AS ps_saleId,
                s.id AS s_id,
                s.name AS s_name,
                s.discountPercentage AS s_discountPercentage,
                s.startDate AS s_startDate,
                s.endDate AS s_endDate
            FROM product_sales ps
            JOIN sales s ON ps.saleId = s.id
            WHERE ps.productId = ? 
            AND NOW() BETWEEN s.startDate AND s.endDate
            AND s.discountPercentage = (
                SELECT MAX(s2.discountPercentage)
                FROM product_sales ps2
                JOIN sales s2 ON ps2.saleId = s2.id
                WHERE ps2.productId = ps.productId
                AND NOW() BETWEEN s2.startDate AND s2.endDate
            )
        """;

        return jdbi.withHandle(handle ->
            handle.createQuery(sql)
                .bind(0, productId)
                .registerRowMapper(BeanMapper.factory(ProductSale.class, "ps"))
                .registerRowMapper(BeanMapper.factory(Sale.class, "s"))
                .reduceRows(new LinkedHashMap<Integer, ProductSale>(), (map, row) -> {
                    ProductSale productSale = map.computeIfAbsent(
                        row.getColumn("ps_id", Integer.class),
                        id -> row.getRow(ProductSale.class)
                    );

                    if (row.getColumn("s_id", Integer.class) != null) {
                        Sale sale = row.getRow(Sale.class);
                        productSale.setSale(sale);
                    }

                    return map;
                })
                .values()
                .stream()
                .findFirst()
                .orElse(null)
        );
    }

    public Product findProductWithSale(int productId) {
        String sql = """
            SELECT 
                p.id, p.name, p.description, p.price, p.stock, 
                p.totalViews, p.isFeatured, p.status, p.averageRating, 
                p.createdAt, p.categoryId, p.brandId,
                pi.id AS pi_id, pi.image AS pi_image, pi.isMain AS pi_isMain,
                c.id AS c_id, c.name AS c_name, c.image AS c_image, 
                c.description AS c_description, c.createdAt AS c_createdAt,
                b.id AS b_id, b.name AS b_name, b.image AS b_image, 
                b.description AS b_description, b.createdAt AS b_createdAt,
                pc.id AS pc_id, pc.colorCode AS pc_colorCode, pc.colorName AS pc_colorName,
                s.id AS s_id, s.name AS s_name, s.discountPercentage AS s_discountPercentage,
                s.startDate AS s_startDate, s.endDate AS s_endDate,
                ps.id AS ps_id
            FROM products p
            LEFT JOIN product_images pi ON p.id = pi.productId
            LEFT JOIN categories c ON p.categoryId = c.id
            LEFT JOIN brands b ON p.brandId = b.id
            LEFT JOIN product_colors pc ON p.id = pc.productId
            LEFT JOIN product_sales ps ON p.id = ps.productId
            LEFT JOIN sales s ON ps.saleId = s.id 
                AND NOW() BETWEEN s.startDate AND s.endDate
                AND s.discountPercentage = (
                    SELECT MAX(s2.discountPercentage)
                    FROM product_sales ps2
                    JOIN sales s2 ON ps2.saleId = s2.id
                    WHERE ps2.productId = p.id
                    AND NOW() BETWEEN s2.startDate AND s2.endDate
                )
            WHERE p.id = ?
        """;

        return jdbi.withHandle(handle -> handle.createQuery(sql)
            .bind(0, productId)
            .registerRowMapper(BeanMapper.factory(Product.class))
            .registerRowMapper(BeanMapper.factory(ProductImage.class, "pi"))
            .registerRowMapper(BeanMapper.factory(Category.class, "c"))
            .registerRowMapper(BeanMapper.factory(Brand.class, "b"))
            .registerRowMapper(BeanMapper.factory(ProductColor.class, "pc"))
            .registerRowMapper(BeanMapper.factory(Sale.class, "s"))
            .registerRowMapper(BeanMapper.factory(ProductSale.class, "ps"))
            .reduceRows(new LinkedHashMap<Integer, Product>(), (map, row) -> {
                Product product = map.computeIfAbsent(
                    row.getColumn("id", Integer.class),
                    id -> row.getRow(Product.class)
                );

                if (row.getColumn("pi_id", Integer.class) != null) {
                    ProductImage image = row.getRow(ProductImage.class);
                    if (product.getImages().stream().noneMatch(img -> img.getId() == image.getId())) {
                        product.addImage(image);
                    }
                }

                if (row.getColumn("pc_id", Integer.class) != null) {
                    ProductColor color = row.getRow(ProductColor.class);
                    if (product.getColors().stream().noneMatch(cl -> cl.getId() == color.getId())) {
                        product.addColor(color);
                    }
                }

                if (row.getColumn("c_id", Integer.class) != null && product.getCategory() == null) {
                    product.setCategory(row.getRow(Category.class));
                }

                if (row.getColumn("b_id", Integer.class) != null && product.getBrand() == null) {
                    product.setBrand(row.getRow(Brand.class));
                }

                if (row.getColumn("s_id", Integer.class) != null) {
                    Sale sale = row.getRow(Sale.class);
                    ProductSale productSale = row.getRow(ProductSale.class);
                    productSale.setSale(sale);
                    product.setProductSale(productSale);
                }

                return map;
            })
            .values()
            .stream()
            .findFirst()
            .orElse(null)
        );
    }

}
