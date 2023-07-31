-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 31, 2023 at 04:12 AM
-- Server version: 8.0.33-0ubuntu0.22.04.4
-- PHP Version: 8.1.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `task`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_07_28_054046_create_tasks_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'tms', 'b8efba3fe86d3b18e5586b61b816809240fd241ca7b78852f860e5360fb19634', '[\"*\"]', '2023-07-30 20:59:43', NULL, '2023-07-30 20:59:43', '2023-07-30 20:59:43'),
(4, 'App\\Models\\User', 1, 'tms', 'cf59f5bf949ea9d75c22bf729fdf720db60c60b0baff5b5b00586152b9d1ba3f', '[\"*\"]', '2023-07-30 21:24:51', NULL, '2023-07-30 21:24:51', '2023-07-30 21:24:51'),
(5, 'App\\Models\\User', 1, 'tms', '30e82a4c0fbc661816d678f671d8e77cf92a910489f3ec71c59c7517801baabc', '[\"*\"]', '2023-07-30 21:27:46', NULL, '2023-07-30 21:27:46', '2023-07-30 21:27:46'),
(6, 'App\\Models\\User', 1, 'tms', '340de8298e919918ae9189b7f8c2161b6aba2d25da8d156a550835b091188259', '[\"*\"]', '2023-07-30 21:28:43', NULL, '2023-07-30 21:28:43', '2023-07-30 21:28:43'),
(7, 'App\\Models\\User', 1, 'tms', '220374a845b6fc7fa54b26b53fb6f97d12f20cc6d7ca2c8c7c0a4a4b887cb2b8', '[\"*\"]', '2023-07-30 21:28:55', NULL, '2023-07-30 21:28:55', '2023-07-30 21:28:55'),
(8, 'App\\Models\\User', 1, 'tms', '6918ed2c66b3eb67d5ae103334bf185776ca75ed93449d01817dcdef34172ada', '[\"*\"]', '2023-07-30 21:29:05', NULL, '2023-07-30 21:29:05', '2023-07-30 21:29:05'),
(9, 'App\\Models\\User', 1, 'tms', '5bb6e0e53be598ab5b92abfe680e7417dcabd4ec3b517d015039ec2b55ae2157', '[\"*\"]', '2023-07-30 21:30:02', NULL, '2023-07-30 21:30:02', '2023-07-30 21:30:02'),
(10, 'App\\Models\\User', 1, 'tms', '9f712872e2ef3f91b2939a513b250fabb84653c56fdefcdaf31c6588adc92688', '[\"*\"]', '2023-07-30 21:32:12', NULL, '2023-07-30 21:32:12', '2023-07-30 21:32:12'),
(11, 'App\\Models\\User', 1, 'tms', '1c922ce355a6e6668b25ebae9f583a8d2a4bbd5351eae923e6487744a0dad61a', '[\"*\"]', '2023-07-30 21:44:32', NULL, '2023-07-30 21:44:30', '2023-07-30 21:44:32'),
(13, 'App\\Models\\User', 1, 'tms', 'dbadcf066f076a56af3fae8b470299b2d50d26402d31d2dfcd342eb7fcf8033b', '[\"*\"]', '2023-07-30 21:50:27', NULL, '2023-07-30 21:49:52', '2023-07-30 21:50:27'),
(18, 'App\\Models\\User', 1, 'tms', '60c4f6d947b438e73af6c1c1c899b92447ab39f6f395e706a485017a43f19bb5', '[\"*\"]', '2023-07-30 22:11:08', NULL, '2023-07-30 22:10:54', '2023-07-30 22:11:08');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `deadline` date DEFAULT NULL,
  `assigned_user_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `deadline`, `assigned_user_id`, `created_at`, `updated_at`) VALUES
(1, 'Task 1', 'This is Desc', '2023-07-28', 4, '2023-07-28 00:03:49', '2023-07-30 21:59:21'),
(2, 'Task 2', 'This is a task 2', '2023-08-03', 4, '2023-07-28 00:07:22', '2023-07-30 22:00:14'),
(3, 'Task 3', 'This is task 3', '2023-09-01', 5, '2023-07-28 00:34:52', '2023-07-30 22:10:03'),
(4, 'Task 4', 'This is task 4', '2023-08-05', NULL, '2023-07-28 00:35:24', '2023-07-28 00:35:24'),
(5, 'Anim minima debitis', 'Quasi tempore maxim', '2014-03-17', NULL, '2023-07-28 01:57:04', '2023-07-28 01:57:04'),
(6, 'Velit pariatur Ali', 'Rerum quia molestiae', '1976-05-24', NULL, '2023-07-28 01:57:11', '2023-07-28 01:57:11'),
(7, 'Aliqua Qui est a e', 'Minus nisi numquam i', '1998-05-18', NULL, '2023-07-28 01:57:22', '2023-07-28 01:57:22'),
(8, 'Quidem saepe ullamco', 'Accusantium laborios', '2013-08-24', NULL, '2023-07-28 07:09:58', '2023-07-28 07:09:58'),
(9, 'Alias commodo et par', 'Est voluptate simili', '1972-03-26', NULL, '2023-07-28 07:10:05', '2023-07-28 07:10:05'),
(10, 'Et iusto et dolor qu', 'Eum necessitatibus s', '2000-10-13', NULL, '2023-07-28 07:10:11', '2023-07-28 07:10:11'),
(11, 'Earum maiores ipsa', 'Ut eveniet quis com', '1976-10-07', NULL, '2023-07-28 07:10:16', '2023-07-28 07:10:16'),
(12, 'Voluptatem accusamus', 'Architecto illum ul', '1998-09-20', NULL, '2023-07-28 07:10:24', '2023-07-28 07:10:24'),
(13, 'Sed temporibus irure', 'Eos quia provident', '2003-08-28', NULL, '2023-07-28 07:10:28', '2023-07-28 07:10:28'),
(14, 'Distinctio Illum q', 'Porro commodi suscip', '2019-02-05', NULL, '2023-07-28 07:10:33', '2023-07-28 07:10:33'),
(15, 'Dolore fugiat illum', 'Enim ut sit inventor', '1971-07-28', NULL, '2023-07-28 07:10:36', '2023-07-28 07:10:36'),
(16, 'Qui nostrum magnam e', 'Ex saepe laboriosam', '1970-11-14', NULL, '2023-07-28 07:10:49', '2023-07-28 07:10:49'),
(17, 'Dolorum et distincti', 'Laudantium magnam l', '1994-08-04', NULL, '2023-07-28 07:10:57', '2023-07-28 07:10:57'),
(18, 'Illum deleniti occa', 'In consectetur sunt', '1970-07-11', NULL, '2023-07-28 07:11:00', '2023-07-28 07:11:00'),
(19, 'Voluptates dolore ea', 'Ut adipisci tempora', '2002-01-07', NULL, '2023-07-28 07:11:04', '2023-07-28 07:11:04'),
(20, 'Officia ex harum rer', 'Asperiores sit sed m', '1984-01-05', NULL, '2023-07-28 07:11:08', '2023-07-28 07:11:08'),
(21, 'Modi aute animi ill', 'Est sint non error t', '2056-11-03', NULL, '2023-07-28 07:11:11', '2023-07-28 08:39:12'),
(22, 'Voluptate velit et d', 'Sunt minus omnis et', '1984-11-11', NULL, '2023-07-28 08:42:54', '2023-07-28 08:42:54'),
(23, 'Saepe voluptatem na', 'Quia aliquid asperna', '1996-12-02', NULL, '2023-07-30 21:00:13', '2023-07-30 21:00:13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Developer', 'platform.singularity@gmail.com', NULL, '$2y$10$tYi7eTgmhAzrPrsu1G6VUuD3Uy.Ysu6wcTPIxiL9vTWEr/B6E07r6', NULL, '2023-07-19 17:40:03', '2023-07-19 17:40:03'),
(4, 'Rafid Al Ridwan', 'ridwan@gmail.com', NULL, '$2y$10$lMUBh3n5eKe72Sj6/2Gly.gaQfLUkmSqtT3KNFz3znXpw4ywyfX8C', NULL, '2023-07-27 23:36:17', '2023-07-27 23:36:17'),
(5, 'In aliquam elit eiu', 'kukymyruv@mailinator.com', NULL, '$2y$10$PYc.vExhjRVBRj3rZ7InmeSmrdH3cCnBeQ9vZ7VE/euSqJTDpJzPa', NULL, '2023-07-28 08:43:09', '2023-07-28 08:43:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
