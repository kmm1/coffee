DROP DATABASE coffee;

CREATE DATABASE coffee;
USE coffee;

CREATE TABLE user (
  id                BIGINT AUTO_INCREMENT,
  name              VARCHAR(20),
  email             VARCHAR(60),
  password          VARCHAR(60),
  role              VARCHAR(10),
  registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE orders (
  id            BIGINT    AUTO_INCREMENT,
  user_id       BIGINT,
  order_date    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  total         DOUBLE,
  address       VARCHAR(255),
  reciever_name VARCHAR(255),
  free_delivery BIT,
  status VARCHAR(10),
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES user (id)
);

CREATE TABLE coffee (
  id        BIGINT AUTO_INCREMENT,
  name      VARCHAR(255),
  price     DOUBLE,
  available BIT,
  image     VARCHAR(255),
  PRIMARY KEY (id)
);

CREATE TABLE coffee_order (
  id        BIGINT AUTO_INCREMENT, #нужно чтоб вставлять дублирующие данные
  coffee_id BIGINT,
  order_id  BIGINT,
  PRIMARY KEY (id),
  FOREIGN KEY (coffee_id) REFERENCES coffee (id),
  FOREIGN KEY (order_id) REFERENCES orders (id)
);

CREATE TABLE configuration (
  id                      BIGINT AUTO_INCREMENT,
  shipping_rate          DOUBLE,
  tatal_for_free_shipping DOUBLE,
  free_cup                INT,
  PRIMARY KEY (id)
);

INSERT INTO configuration (shipping_rate, tatal_for_free_shipping, free_cup) VALUES (2.00, 10.00, 5);

INSERT INTO user (name, email, password, role)
VALUES ('admin', 'admin@gmail.com', '$2a$10$sMMfUeSvANxuplZ8ddJfZev5zj0.yj.QRg46/ExV3mNUJil83cXUi', 'ADMIN');
INSERT INTO user (name, email, password, role)
VALUES ('user1', 'user1@gmail.com', '$2a$10$jOxK94aIi8XIejhZWzGzSORlW7/FvQ2HiCU3w.mMtUJ/T3VBDBAdq', 'USER');
INSERT INTO user (name, email, password, role)
VALUES ('user2', 'user2@gmail.com', '$2a$10$jOxK94aIi8XIejhZWzGzSORlW7/FvQ2HiCU3w.mMtUJ/T3VBDBAdq', 'USER');

INSERT INTO coffee (name, price, available, image) VALUES ('CAPPUCINO', 2.00, 1, '1img.JPG');
INSERT INTO coffee (name, price, available, image) VALUES ('AMERICANO', 1.50, 1, '2img.JPG');
INSERT INTO coffee (name, price, available, image) VALUES ('ESPRESSO', 1.00, 1, '3img.JPG');

INSERT INTO orders (user_id, total, address, reciever_name, free_delivery, status)
VALUES (2, 4.00, 'Minsk, Gurteva str., 8', 'Kate', 0, 'NEW');
INSERT INTO orders (user_id, total, address, reciever_name, free_delivery, status)
VALUES (3, 6.00, 'Minsk, Kotovskogo str., 27', 'Lena', 1,'NEW');

INSERT INTO coffee_order (coffee_id, order_id) VALUES (1, 1);
INSERT INTO coffee_order (coffee_id, order_id) VALUES (1, 1);

INSERT INTO coffee_order (coffee_id, order_id) VALUES (1, 2);
INSERT INTO coffee_order (coffee_id, order_id) VALUES (1, 2);
INSERT INTO coffee_order (coffee_id, order_id) VALUES (1, 2);
