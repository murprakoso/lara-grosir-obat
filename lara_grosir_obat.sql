-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 09 Apr 2021 pada 20.48
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lara_grosir_obat`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(9, '2014_10_12_000000_create_users_table', 1),
(10, '2017_04_09_013901_create_products_table', 1),
(11, '2017_04_27_121204_create_transactions_table', 1),
(12, '2017_05_02_211915_create_product_units_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `unit_id` int(10) UNSIGNED NOT NULL,
  `cash_price` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `name`, `unit_id`, `cash_price`, `created_at`, `updated_at`) VALUES
(72, 'Adem Sari Ching Ku Sachet 7 Gr', 8, 3000, '2021-04-09 19:39:09', '2021-04-09 19:39:09'),
(74, 'Liquid Oatdrips Banana', 3, 3000, '2021-04-09 19:39:23', '2021-04-09 19:39:23'),
(75, 'Adem Sari', 3, 5000, '2021-04-09 19:39:23', '2021-04-09 19:39:23'),
(76, 'Shampo metal', 3, 2500, '2021-04-09 19:39:23', '2021-04-09 19:39:23'),
(77, 'Liquid Oatdrips Banana', 3, 3000, '2021-04-09 19:39:23', '2021-04-09 19:39:23'),
(78, 'Adem Sari', 3, 5000, '2021-04-09 19:39:23', '2021-04-09 19:39:23'),
(79, 'Shampo metal', 3, 2500, '2021-04-09 19:39:23', '2021-04-09 19:39:23'),
(80, 'Liquid Oatdrips Banana', 3, 3000, '2021-04-09 19:39:23', '2021-04-09 19:39:23'),
(81, 'Adem Sari', 3, 5000, '2021-04-09 19:39:23', '2021-04-09 19:39:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_units`
--

CREATE TABLE `product_units` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `product_units`
--

INSERT INTO `product_units` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Botol', '2021-04-09 04:14:25', '2021-04-09 04:14:25'),
(2, 'Tube', '2021-04-09 04:14:25', '2021-04-09 04:14:25'),
(3, 'Renteng', '2021-04-09 04:14:25', '2021-04-09 04:14:25'),
(4, 'Box', '2021-04-09 04:14:25', '2021-04-09 04:14:25'),
(5, 'Kaleng', '2021-04-09 04:14:25', '2021-04-09 04:14:25'),
(6, 'Keping', '2021-04-09 04:14:25', '2021-04-09 04:14:25'),
(7, 'Pak', '2021-04-09 04:14:25', '2021-04-09 04:14:25'),
(8, 'Pcs', '2021-04-09 04:14:25', '2021-04-09 04:14:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_no` char(8) COLLATE utf8_unicode_ci NOT NULL,
  `items` text COLLATE utf8_unicode_ci NOT NULL,
  `customer` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment` int(10) UNSIGNED NOT NULL,
  `total` int(10) UNSIGNED NOT NULL,
  `notes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `transactions`
--

INSERT INTO `transactions` (`id`, `invoice_no`, `items`, `customer`, `payment`, `total`, `notes`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '21040001', '[{\"id\":4,\"name\":\"Herrod Randolph\",\"unit\":\"Tube\",\"price\":605,\"qty\":\"3\",\"item_discount\":0,\"item_discount_subtotal\":0,\"subtotal\":1815}]', '{\"name\":\"-\",\"phone\":\"+1 (286) 172-5132\"}', 20000, 1815, 'Nihil sit asperiore', 1, '2021-04-09 04:25:22', '2021-04-09 04:25:22'),
(2, '21040002', '[{\"id\":64,\"name\":\"Liquid Oatdrips Banana\",\"unit\":\"Pcs\",\"price\":3000,\"qty\":\"2\",\"item_discount\":1000,\"item_discount_subtotal\":2000,\"subtotal\":6000}]', '{\"name\":\"-\",\"phone\":\"+1 (286) 172-5132\"}', 10000, 4000, NULL, 1, '2021-04-09 12:01:03', '2021-04-09 12:01:03'),
(3, '21040003', '[{\"id\":76,\"name\":\"Shampo metal\",\"unit\":\"Renteng\",\"price\":2500,\"qty\":\"2\",\"item_discount\":0,\"item_discount_subtotal\":0,\"subtotal\":5000},{\"id\":72,\"name\":\"Adem Sari Ching Ku Sachet 7 Gr\",\"unit\":\"Pcs\",\"price\":3000,\"qty\":\"1\",\"item_discount\":0,\"item_discount_subtotal\":0,\"subtotal\":3000}]', '{\"name\":\"Iavong\",\"phone\":\"+1 (286) 172-5132\"}', 20000, 8000, '-', 1, '2021-04-09 19:43:34', '2021-04-09 19:43:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin', '$2y$10$uMAh78OOYpv8jluQBniyUOeE8.cqA/THUEZsn3EmjqW5CsKA8nIPO', '43ihVh6PQp6ZNol5zj9QbdnUbRE18I06zZEyNBPC6bXWGhM0nYtiwQuaTjgy', '2021-04-09 04:14:25', '2021-04-09 04:14:25'),
(2, 'Rashad Rhodes', 'kasir', '$2y$10$dbpJXaM5zsT/Z0H390VyZOOwntI.FjLuW3DaA2IcOYJdFlCla3HVK', NULL, '2021-04-09 12:04:17', '2021-04-09 12:04:17');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `product_units`
--
ALTER TABLE `product_units`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transactions_invoice_no_unique` (`invoice_no`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT untuk tabel `product_units`
--
ALTER TABLE `product_units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
