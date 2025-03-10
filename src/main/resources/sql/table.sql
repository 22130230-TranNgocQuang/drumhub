drop database drum_store;
create database drum_store;
CREATE TABLE categories
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    image       VARCHAR(255),
    description TEXT,
    createdAt   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE brands
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    image       VARCHAR(255),
    description TEXT,
    createdAt   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE sales
(
    id                 INT AUTO_INCREMENT PRIMARY KEY,
    name               VARCHAR(100)  NOT NULL,
    discountPercentage DECIMAL(5, 2) NOT NULL,
    startDate          DATE          NOT NULL,
    endDate            DATE          NOT NULL
);
CREATE TABLE password_resets
(
    id        INT AUTO_INCREMENT PRIMARY KEY,
    email     VARCHAR(100),
    token     VARCHAR(100),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    expiresAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products
(
    id            INT AUTO_INCREMENT PRIMARY KEY,
    name          VARCHAR(100),
    description   TEXT,
    price         DECIMAL(10, 2),
    stock         INT,
    totalViews    INT            DEFAULT 0,
    isFeatured    TINYINT        DEFAULT 0,
    status        TINYINT        DEFAULT 1,
    averageRating DECIMAL(10, 2) DEFAULT NULL,
    categoryId    INT,
    brandId       INT,
    createdAt     TIMESTAMP      DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE users
(
    id        INT PRIMARY KEY AUTO_INCREMENT,
    email     VARCHAR(100) UNIQUE,
    password  VARCHAR(255),
    fullname  VARCHAR(100),
    role      TINYINT DEFAULT 0,
    phone     VARCHAR(25),
    status    TINYINT DEFAULT 1,
    avatar    VARCHAR(255),
    createdAt TIMESTAMP
);
CREATE TABLE product_images
(
    id        INT AUTO_INCREMENT PRIMARY KEY,
    image     VARCHAR(255) DEFAULT NULL,
    isMain    TINYINT(1)   DEFAULT 0,
    productId INT
);
CREATE TABLE product_colors
(
    id        INT AUTO_INCREMENT PRIMARY KEY,
    colorCode VARCHAR(7)   DEFAULT NULL,
    colorName VARCHAR(100) DEFAULT NULL,
    productId INT
);
CREATE TABLE user_addresses
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    userId     INT,
    address    TEXT,
    phone      VARCHAR(25),
    provinceId INT,
    districtId INT,
    wardId     INT,
    isDefault  TINYINT
);
CREATE TABLE wishlist
(
    id        INT AUTO_INCREMENT PRIMARY KEY,
    userId    INT,
    productId INT,
    createdAt TIMESTAMP
);
CREATE TABLE user_vouchers
(
    id        INT AUTO_INCREMENT PRIMARY KEY,
    userId    INT,
    voucherId INT,
    used      TINYINT,
    usedAt    TIMESTAMP NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE orders
(
    id            INT AUTO_INCREMENT PRIMARY KEY,
    userId        INT,
    userAddressId INT,
    totalAmount   DECIMAL(10, 2) NOT NULL,
    orderDate     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status        TINYINT,
    createdAt     TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE order_items
(
    id        INT AUTO_INCREMENT PRIMARY KEY,
    orderId   INT,
    productId INT,
    quantity  INT NOT NULL,
    price     DECIMAL(10, 2),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE product_reviews
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    productId  INT,
    userId     INT,
    rating     TINYINT,
    reviewText TEXT,
    createdAt  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE posts
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    title      VARCHAR(255),
    content    TEXT,
    userId     INT,
    image      VARCHAR(255),
    viewsCount INT,
    status     TINYINT DEFAULT 1,
    createdAt  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Bảng vouchers
CREATE TABLE vouchers
(
    id               INT AUTO_INCREMENT PRIMARY KEY,
    code             VARCHAR(50),
    description      TEXT,
    discountType     TINYINT,
    discountValue    DECIMAL(10, 2),
    minOrderValue    DECIMAL(10, 2),
    maxDiscountValue DECIMAL(10, 2),
    startDate        TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    endDate          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usageLimit       INT,
    perUserLimit     INT,
    status           TINYINT,
    createdAt        TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Bảng order_items


-- Bảng provinces
CREATE TABLE provinces
(
    id   INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Bảng districts
CREATE TABLE districts
(
    id         INT PRIMARY KEY,
    name       VARCHAR(100) NOT NULL,
    provinceId INT
);

-- Bảng wards
CREATE TABLE wards
(
    id         INT PRIMARY KEY,
    name       VARCHAR(100) NOT NULL,
    districtId INT
);


CREATE TABLE product_sales
(
    id        INT AUTO_INCREMENT PRIMARY KEY,
    productId INT,
    saleId    INT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE payments
(
    id            INT PRIMARY KEY,
    orderId       INT,
    paymentMethod TINYINT,
    status        TINYINT,
    transactionId VARCHAR(100),
    amount        DECIMAL(10, 2) NOT NULL,
    paymentDate   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    createdAt     TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

