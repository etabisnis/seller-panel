-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 10 Jan 2024 pada 16.22
-- Versi server: 5.7.24
-- Versi PHP: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `whatsapp`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `contact`
--

CREATE TABLE `contact` (
  `id` int(25) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `phone` varchar(35) DEFAULT NULL,
  `company` varchar(150) DEFAULT NULL,
  `users` varchar(25) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `deposit`
--

CREATE TABLE `deposit` (
  `id` int(35) NOT NULL,
  `trxid` varchar(35) DEFAULT NULL,
  `trxamount` bigint(250) DEFAULT NULL,
  `trxusers` varchar(25) DEFAULT NULL,
  `trxstatus` varchar(25) DEFAULT NULL,
  `trxdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `devices`
--

CREATE TABLE `devices` (
  `id` int(35) NOT NULL,
  `uniq` varchar(35) DEFAULT NULL,
  `did` varchar(35) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `users` varchar(35) DEFAULT NULL,
  `msg` bigint(250) NOT NULL DEFAULT '0',
  `expired` timestamp NULL DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `trx`
--

CREATE TABLE `trx` (
  `id` int(30) NOT NULL,
  `nomer` varchar(35) DEFAULT NULL,
  `item` varchar(150) DEFAULT NULL,
  `users` varchar(10) DEFAULT NULL,
  `amount` bigint(100) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(35) NOT NULL,
  `code` varchar(25) DEFAULT NULL,
  `apikey` varchar(250) DEFAULT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `phone` varchar(35) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL,
  `balance` bigint(50) DEFAULT NULL,
  `token` varchar(250) DEFAULT NULL,
  `role` varchar(25) DEFAULT NULL,
  `ipaddress` varchar(30) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `website`
--

CREATE TABLE `website` (
  `id` int(35) NOT NULL,
  `webname` varchar(100) DEFAULT NULL,
  `prefix` varchar(10) DEFAULT NULL,
  `deskripsi` text,
  `contact` varchar(35) DEFAULT NULL,
  `icon` varchar(150) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `token` varchar(50) DEFAULT NULL,
  `serverkey` varchar(250) DEFAULT NULL,
  `price` bigint(35) DEFAULT '0',
  `wanotif` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `website`
--

INSERT INTO `website` (`id`, `webname`, `prefix`, `deskripsi`, `contact`, `icon`, `logo`, `token`, `serverkey`, `price`, `wanotif`) VALUES
(1, 'Default', 'DA', 'Cheap Price Whatsapp Gateway', NULL, NULL, NULL, NULL, NULL, 60000, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `deposit`
--
ALTER TABLE `deposit`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indeks untuk tabel `trx`
--
ALTER TABLE `trx`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `website`
--
ALTER TABLE `website`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `deposit`
--
ALTER TABLE `deposit`
  MODIFY `id` int(35) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `devices`
--
ALTER TABLE `devices`
  MODIFY `id` int(35) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `trx`
--
ALTER TABLE `trx`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(35) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `website`
--
ALTER TABLE `website`
  MODIFY `id` int(35) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
