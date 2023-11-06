-- DROP DATABASE `assignment_06`;
CREATE DATABASE `assignment_06`;

USE `assignment_06`;

CREATE TABLE `customers` (
  `customer_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `location` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
);

CREATE TABLE `orders` (
  `order_id` int UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `customer_id` int UNSIGNED NOT NULL,
  `order_date` date DEFAULT NULL,
  `total_amount` float NOT NULL,
  FOREIGN KEY (`customer_id`) REFERENCES `customers`(`customer_id`) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE `categories` (
  `category_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`category_id`)
);

CREATE TABLE `products` (
  `product_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL,  
  `category_id` int UNSIGNED NOT NULL,
   FOREIGN KEY (`category_id`) REFERENCES `categories`(`category_id`) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE `order_items` (
  `item_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `order_id` int UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` varchar(10) NOT NULL,
  `unit_price` float NOT NULL,
   FOREIGN KEY (`order_id`) REFERENCES `orders`(`order_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
   FOREIGN KEY (`product_id`) REFERENCES `products`(`product_id`) ON DELETE RESTRICT ON UPDATE CASCADE
);


