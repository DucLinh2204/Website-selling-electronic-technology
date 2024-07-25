-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2024 at 06:59 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tech_chain`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Điện thoại', '2024-05-27 02:57:32', '2024-05-27 02:57:32'),
(2, 'Máy tính', '2024-05-27 02:57:32', '2024-05-27 02:57:32'),
(3, 'Máy tính bảng', '2024-05-27 02:57:32', '2024-05-27 02:57:32'),
(4, 'Đồng hồ thông minh', '2024-05-27 02:57:32', '2024-05-27 02:57:32');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `rating` int(11) NOT NULL DEFAULT 5,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `content`, `rating`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 'Gia qua dep', 5, 1, 1, '2024-05-29 05:41:32', NULL),
(2, 'Gia qua da', 4, 1, 1, '2024-05-29 05:41:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_05_25_153549_create_categories_table', 1),
(6, '2024_05_27_074443_create_products_table', 2),
(7, '2024_05_28_204024_create_product_images_table', 3),
(8, '2024_05_29_100520_tao_comments_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `rating` float NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL,
  `sale_price` int(11) DEFAULT NULL,
  `instock` int(11) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `image`, `description`, `rating`, `price`, `sale_price`, `instock`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Samsung Galaxy S23 FE 5G 128GB', 'samsung-galaxy-s23-fe-5g-128gb', '638471599704474139_samsung-galaxy-s23--fe-den-dd-AI.webp', NULL, 4.5, 14890000, NULL, 19, 1, '2024-05-28 12:45:31', '2024-05-28 12:45:31'),
(2, 'OPPO Reno11 F 5G 8GB-256GB', 'oppo-reno11-f-5g-8gb-256gb', '638493832157161657_oppo-reno11-f-green-1.webp', NULL, 4.2, 8990000, 8490000, 43, 1, '2024-05-28 12:45:31', '2024-05-28 12:45:31'),
(3, 'Xiaomi Poco M6 Pro 8GB-256GB', 'xiaomi-poco-m6-pro-8gb-256gb', '638417729562660990_xiaomi-poco-m6-pro-dd-docquyen-bh.webp', NULL, 4, 6490000, 5990000, 23, 1, '2024-05-28 12:45:31', '2024-05-28 12:45:31'),
(4, 'Samsung Galaxy S23 5G 256GB', 'samsung-galaxy-s23-5g-256gb', '638518175414796345_samsung-galaxy-s23-5g-thumb-doc-quyen.webp', NULL, 5, 24990000, 15490000, 40, 1, '2024-05-28 12:45:31', '2024-05-28 12:45:31'),
(5, 'Honor X7b 8GB-256GB', 'honor-x7b-8gb-256gb', '638454261816142342_honor-x7b-xanh-6.webp', NULL, 0, 5290000, 4990000, 38, 1, '2024-05-28 12:45:31', '2024-05-28 12:45:31'),
(6, 'OPPO A18 4GB-128GB', 'oppo-a18-4gb-128gb', '638509283036082649_OPPO-A18-thumb.webp', NULL, 0, 3990000, 3690000, 11, 1, '2024-05-28 12:45:31', '2024-05-28 12:45:31'),
(7, 'iPhone 15 Pro Max 256GB', 'iphone-15-pro-max-256gb', '638342502751589917_ip-15-pro-max-dd-bh-2-nam.webp', NULL, 0, 34990000, 29290000, 16, 1, '2024-05-28 12:45:31', '2024-05-28 12:45:31'),
(8, 'Samsung Galaxy S24 Ultra 5G 256GB', 'samsung-galaxy-s24-ultra-5g-256gb', '638477639726536939_samsung-galaxy-s24-ultra-dd-AI.webp', NULL, 0, 33990000, 31990000, 14, 1, '2024-05-28 12:45:31', '2024-05-28 12:45:31'),
(9, 'Honor X9B 5G 12GB-256GB', 'honor-x9b-5g-12gb-256gb', '638405567889290705_honor-x9b-dd-dq-1.webp', NULL, 0, 8990000, 8390000, 11, 1, '2024-05-28 12:45:31', '2024-05-28 12:45:31'),
(10, 'Samsung Galaxy A35 5G 128GB', 'samsung-galaxy-a35-5g-128gb', '638496340616522014_samsung-galaxy-a35-dd-doimoi.webp', NULL, 0, 8290000, 7990000, 26, 1, '2024-05-28 12:45:31', '2024-05-28 12:45:31'),
(11, 'OPPO A58 6GB-128GB', 'oppo-a58-6gb-128gb', '638265802441511578_oppo-a58-dd.webp', NULL, 0, 4990000, 4690000, 23, 1, '2024-05-28 12:45:31', '2024-05-28 12:45:31'),
(12, 'Samsung Galaxy Z Flip4 5G 128GB', 'samsung-galaxy-z-flip4-5g-128gb', '638131739579610504_samsung-galaxy-z-flip4-tim-dd-tragop.webp', NULL, 0, 23990000, 11990000, 40, 1, '2024-05-28 12:45:31', '2024-05-28 12:45:31'),
(13, 'Tecno Spark Go 2024 4GB-64GB', 'tecno-spark-go-2024-4gb-64gb', '638518773813324397_tecno-spark-go-2024-thumb-thu-cu-2g-100k.webp', NULL, 0, 2190000, 1990000, 30, 1, '2024-05-28 12:45:31', '2024-05-28 12:45:31'),
(14, 'OPPO A78 8GB-256GB', 'oppo-a78-8gb-256gb', '638241536485031136_oppo-a78-den-dd.webp', NULL, 0, 6990000, 6490000, 19, 1, '2024-05-28 12:45:31', '2024-05-28 12:45:31'),
(15, 'Xiaomi Redmi Note 13 6GB-128GB', 'xiaomi-redmi-note-13-6gb-128gb', '638421256103594350_xiaomi-redmi-note-13-dd-bh.webp', NULL, 0, 4890000, 4690000, 39, 1, '2024-05-28 12:45:31', '2024-05-28 12:45:31'),
(16, 'Samsung Galaxy A05s 128GB', 'samsung-galaxy-a05s-128gb', '638352249930121103_samsung-galaxy-a05s-dd-doimay.webp', NULL, 0, 3990000, 3590000, 16, 1, '2024-05-28 12:45:31', '2024-05-28 12:45:31'),
(17, 'Honor X5 Plus 4GB-64GB', 'honor-x5-plus-4gb-64gb', '638376267641979247_honor-x5-plus-dd-doimoi.webp', NULL, 0, 2790000, 2490000, 20, 1, '2024-05-28 12:45:31', '2024-05-28 12:45:31'),
(18, 'Samsung Galaxy A23 5G', 'samsung-galaxy-a23-5g', '638451444037915753_samsung-galaxy-a23-5g-dd.webp', NULL, 0, 5990000, 4190000, 22, 1, '2024-05-28 12:45:31', '2024-05-28 12:45:31'),
(19, 'OPPO A17k 3GB-64GB', 'oppo-a17k-3gb-64gb', '638071502453762468_oppo-a17k-dd.webp', NULL, 0, 3290000, 2790000, 47, 1, '2024-05-28 12:45:31', '2024-05-28 12:45:31'),
(20, 'Xiaomi Redmi A2 2GB-32GB', 'xiaomi-redmi-a2-2gb-32gb', '638475676879245067_xiaomi-redmi-a2-den-dd-bh-thucu.webp', NULL, 0, 2190000, 1690000, 18, 1, '2024-05-28 12:45:31', '2024-05-28 12:45:31'),
(21, 'Samsung Galaxy Z Fold5 5G 256GB', 'samsung-galaxy-z-fold5-5g-256gb', '638472349027667377_samsung-galaxy-zfold-5-dd-ai.webp', NULL, 0, 40990000, 34990000, 18, 1, '2024-05-28 12:45:31', '2024-05-28 12:45:31');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`) VALUES
(1, 1, '638463753210935577_samsung-galaxy-s23-fe-den-2.webp'),
(2, 1, '638463753210779352_samsung-galaxy-s23-fe-den-5.webp'),
(3, 1, '638463753211404407_samsung-galaxy-s23-fe-den-3.webp'),
(4, 1, '638463753210310750_samsung-galaxy-s23-fe-den-4.webp');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('xJZoEyaZoC9C7GRq1V9ElciCMMicyz9pEAX5tznZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', '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', 1717154726);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'linh', 'linh@gmail.com', NULL, '$2y$12$rwjfFxIiFDp.8E9Qj/xNHef0lbB3wc8BpuWXWKDg0r1k8CCG906ie', NULL, '2024-05-29 03:04:28', '2024-05-29 03:04:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_product_id_foreign` (`product_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
