USE drum_hub;

CREATE TABLE categories
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(255) NOT NULL UNIQUE,
    image       VARCHAR(255),
    description TEXT,
    createdAt   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    name       VARCHAR(255)   NOT NULL UNIQUE,
    image      VARCHAR(255),
    price      DECIMAL(10, 2) NOT NULL CHECK (price >= 0),
    status     BOOLEAN DEFAULT TRUE,
    categoryId INT            NOT NULL,
    FOREIGN KEY (categoryId) REFERENCES categories (id) ON DELETE CASCADE
);

CREATE TABLE productImages
(
    id        INT AUTO_INCREMENT PRIMARY KEY,
    image     VARCHAR(255) NOT NULL,
    productId INT          NOT NULL,
    FOREIGN KEY (productId) REFERENCES products (id) ON DELETE CASCADE
);

CREATE TABLE carts
(
    id        INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    userId    INT NOT NULL,
    quantity  INT NOT NULL CHECK (quantity > 0),
    price     DECIMAL(10, 2) NOT NULL CHECK (price >= 0),
    orderId   INT DEFAULT NULL,
    FOREIGN KEY (productId) REFERENCES products(id) ON DELETE CASCADE,
    FOREIGN KEY (orderId) REFERENCES orders(id) ON DELETE SET NULL
);