-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 14 Feb 2021 pada 19.35
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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2017_04_09_013901_create_products_table', 1),
(3, '2017_04_27_121204_create_transactions_table', 1),
(4, '2017_05_02_211915_create_product_units_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `unit_id` int(10) UNSIGNED NOT NULL,
  `cash_price` int(10) UNSIGNED NOT NULL,
  `credit_price` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `name`, `unit_id`, `cash_price`, `credit_price`, `created_at`, `updated_at`) VALUES
(2, 'Absolute 150ml', 1, 21200, 23100, '2021-02-13 16:01:34', '2021-02-13 16:01:34'),
(3, 'Absolute 60ml', 1, 10500, 12000, '2021-02-13 16:02:43', '2021-02-13 16:02:56'),
(4, 'Adem Sari', 4, 38500, 40000, '2021-02-13 16:03:44', '2021-02-13 16:03:44'),
(6, 'Absolute 150ml', 1, 21200, 23100, '2021-02-14 19:33:10', '2021-02-14 19:33:10');

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
(1, 'Botol', '2021-02-13 09:16:48', '2021-02-13 15:59:43'),
(2, 'Tube', '2021-02-13 09:16:55', '2021-02-13 15:59:51'),
(4, 'Renteng', '2021-02-13 16:00:31', '2021-02-13 16:00:31'),
(5, 'Box', '2021-02-14 19:31:14', '2021-02-14 19:31:14'),
(6, 'Kaleng', '2021-02-14 19:31:18', '2021-02-14 19:31:18'),
(7, 'Keping', '2021-02-14 19:31:23', '2021-02-14 19:31:23'),
(8, 'Pak', '2021-02-14 19:31:37', '2021-02-14 19:31:37'),
(9, 'Pcs', '2021-02-14 19:31:42', '2021-02-14 19:31:42');

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
(1, '21020001', '[{\"id\":1,\"name\":\"Karyn Church\",\"unit\":\"Paracetamol\",\"price\":200000,\"qty\":\"1\",\"item_discount\":0,\"item_discount_subtotal\":0,\"subtotal\":200000}]', '{\"name\":\"Prakoso\",\"phone\":\"080808089898\"}', 200000, 200000, NULL, 1, '2021-02-13 09:22:02', '2021-02-13 09:22:02'),
(2, '21020002', '[{\"id\":5,\"name\":\"Paracetamol\",\"unit\":\"Renteng\",\"price\":10000,\"qty\":\"1\",\"item_discount\":0,\"item_discount_subtotal\":0,\"subtotal\":10000}]', '{\"name\":\"Iavong\",\"phone\":null}', 10000, 10000, NULL, 1, '2021-02-14 13:03:44', '2021-02-14 13:03:44'),
(3, '21020003', '[{\"id\":4,\"name\":\"Adem Sari\",\"unit\":\"Renteng\",\"price\":38500,\"qty\":\"1\",\"item_discount\":0,\"item_discount_subtotal\":0,\"subtotal\":38500}]', '{\"name\":\"Prakoso\",\"phone\":null}', 50000, 38500, NULL, 1, '2021-02-14 13:05:43', '2021-02-14 13:05:43'),
(4, '21020004', '[{\"id\":4,\"name\":\"Adem Sari\",\"unit\":\"Renteng\",\"price\":40000,\"qty\":\"3\",\"item_discount\":0,\"item_discount_subtotal\":0,\"subtotal\":120000}]', '{\"name\":\"Ronal\",\"phone\":null}', 120000, 120000, NULL, 1, '2021-02-14 16:11:52', '2021-02-14 16:11:52');

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
(1, 'Administrator', 'admin', '$2y$10$PLLTkvqEL.9L6maQJWp/J.Y6uxqZCHpmLA/UC9cyseEksAnWFeJTK', '1NsjbqYdb1il5OSTTeqfJr5QxwkGB0u1Rm0sa7tsgmkue3EfXzRQlbj2NA3n', '2021-02-13 09:13:58', '2021-02-13 09:24:28'),
(2, 'Kasir', 'kasir', '$2y$10$mObfhK.wx5CkZqNGrHy5aOo/TlXLOy9wAsUzD4cvqgKatExOEYGD2', NULL, '2021-02-13 09:24:49', '2021-02-13 09:24:49');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `product_units`
--
ALTER TABLE `product_units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
