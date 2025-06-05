USE drum_hub;

CREATE TABLE categories (
                            id          INT AUTO_INCREMENT PRIMARY KEY,
                            name        VARCHAR(255) NOT NULL UNIQUE,
                            image       VARCHAR(255),
                            description TEXT,
                            createdAt   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
                          id         INT AUTO_INCREMENT PRIMARY KEY,
                          name       VARCHAR(255)   NOT NULL UNIQUE,
                          image      VARCHAR(255),
                          price      DECIMAL(10, 2) NOT NULL CHECK (price >= 0),
                          status     BOOLEAN DEFAULT TRUE,
                          categoryId INT            NOT NULL,
                          FOREIGN KEY (categoryId) REFERENCES categories (id) ON DELETE CASCADE
);

CREATE TABLE productImages (
                               id        INT AUTO_INCREMENT PRIMARY KEY,
                               image     VARCHAR(255) NOT NULL,
                               productId INT          NOT NULL,
                               FOREIGN KEY (productId) REFERENCES products (id) ON DELETE CASCADE
);

CREATE TABLE users (
                       id        INT AUTO_INCREMENT PRIMARY KEY,
                       username  VARCHAR(100) NOT NULL UNIQUE,
                       password  VARCHAR(255) NOT NULL,
                       email     VARCHAR(255) UNIQUE,
                       fullName  VARCHAR(255),
                       role      tinyint DEFAULT 1,
                       status    TINYINT DEFAULT 0,
                       createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
                        id         INT AUTO_INCREMENT PRIMARY KEY,
                        userId     INT            NOT NULL,
                        orderDate  TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
                        totalPrice DECIMAL(10, 2) NOT NULL CHECK (totalPrice >= 0),
                        status     VARCHAR(50) DEFAULT 'pending',
                        FOREIGN KEY (userId) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE carts (
                       id        INT AUTO_INCREMENT PRIMARY KEY,
                       productId INT NOT NULL,
                       userId    INT NOT NULL,
                       quantity  INT NOT NULL CHECK (quantity > 0),
                       price     DECIMAL(10, 2) NOT NULL CHECK (price >= 0),
                       orderId   INT DEFAULT NULL,
                       FOREIGN KEY (productId) REFERENCES products(id) ON DELETE CASCADE,
                       FOREIGN KEY (orderId) REFERENCES orders(id) ON DELETE SET NULL,
                       FOREIGN KEY (userId) REFERENCES users(id) ON DELETE CASCADE
);
CREATE TABLE logs (
                           id INT AUTO_INCREMENT PRIMARY KEY,
                           log_time DATETIME NOT NULL,      -- Khi nào
                           level VARCHAR(10) NOT NULL,      -- Mức độ: INFO, ERROR, ...
                           location VARCHAR(255),           -- Ở đâu (URL, method, action)
                           resource VARCHAR(100),           -- Tài nguyên bị tác động (ví dụ: 'Account', 'Order')
                           actor VARCHAR(100),              -- Ai làm (username hoặc id)
                           old_data TEXT,                   -- Dữ liệu trước
                           new_data TEXT                    -- Dữ liệu sau
);

