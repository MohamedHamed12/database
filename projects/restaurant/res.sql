CREATE TABLE `CustomUser` (
  `id` integer,
  `name` str,
  `email` email PRIMARY KEY,
  `password` password,
  `email_confirmed` bool,
  `profile_completed` bool,
  `created_at` timestamp
);

CREATE TABLE `Userprofile` (
  `user_id` integer PRIMARY KEY,
  `bio` text,
  `img` image,
  `phone_number` str,
  `created_at` timestamp
);

CREATE TABLE `Customer` (
  `userprofile_id` integer PRIMARY KEY,
  `total_order` integer,
  `total_spent` integer
);

CREATE TABLE `employee` (
  `userprofile_id` integer PRIMARY KEY,
  `salary` integer
);

CREATE TABLE `Restaurant` (
  `id` integer PRIMARY KEY,
  `name` str,
  `location` str,
  `house` integer,
  `road` str,
  `city` str,
  `delivery_time` str,
  `min_order` integer,
  `rate` integer,
  `img` image,
  `created_at` timestamp
);

CREATE TABLE `category` (
  `id` integer PRIMARY KEY,
  `name` str
);

CREATE TABLE `product` (
  `id` integer PRIMARY KEY,
  `price` integer,
  `description` text,
  `available_quantity` integer,
  `category_id` integer,
  `discount_id` integer,
  `restaurant_id` integer,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `product_images` (
  `img` image,
  `product_id` integer PRIMARY KEY
);

CREATE TABLE `Campaign` (
  `restaurant_id` integer,
  `name` str,
  `img` image,
  `created_at` timestamp
);

CREATE TABLE `order_item` (
  `order_id` integer,
  `product_id` integer,
  `quantity` integer
);

CREATE TABLE `order` (
  `id` integer,
  `user_id` integer,
  `user_location` str,
  `delivery_option` Choices,
  `restaurant_id` integer,
  `created_at` timestamp
);

ALTER TABLE `Userprofile` ADD FOREIGN KEY (`user_id`) REFERENCES `Customer` (`userprofile_id`);

ALTER TABLE `CustomUser` ADD FOREIGN KEY (`id`) REFERENCES `Userprofile` (`user_id`);

ALTER TABLE `Userprofile` ADD FOREIGN KEY (`user_id`) REFERENCES `employee` (`userprofile_id`);

CREATE TABLE `Restaurant_Campaign` (
  `Restaurant_id` integer,
  `Campaign_restaurant_id` integer,
  PRIMARY KEY (`Restaurant_id`, `Campaign_restaurant_id`)
);

ALTER TABLE `Restaurant_Campaign` ADD FOREIGN KEY (`Restaurant_id`) REFERENCES `Restaurant` (`id`);

ALTER TABLE `Restaurant_Campaign` ADD FOREIGN KEY (`Campaign_restaurant_id`) REFERENCES `Campaign` (`restaurant_id`);


ALTER TABLE `product_images` ADD FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

ALTER TABLE `product` ADD FOREIGN KEY (`restaurant_id`) REFERENCES `Restaurant` (`id`);

ALTER TABLE `product` ADD FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

ALTER TABLE `order_item` ADD FOREIGN KEY (`order_id`) REFERENCES `order` (`id`);

ALTER TABLE `order` ADD FOREIGN KEY (`restaurant_id`) REFERENCES `Restaurant` (`id`);

ALTER TABLE `order` ADD FOREIGN KEY (`user_id`) REFERENCES `CustomUser` (`id`);