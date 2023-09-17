-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 17, 2023 at 12:06 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seller`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(35) NOT NULL,
  `usercode` varchar(25) DEFAULT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `ipregistered` varchar(25) DEFAULT NULL,
  `verify` varchar(250) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `role` varchar(25) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `id` int(35) NOT NULL,
  `deviceid` varchar(35) DEFAULT NULL,
  `devicecode` varchar(100) DEFAULT NULL,
  `devicename` varchar(100) DEFAULT NULL,
  `deviceserver` varchar(150) DEFAULT NULL,
  `devicetoken` varchar(100) DEFAULT NULL,
  `devicestart` timestamp NULL DEFAULT NULL,
  `devicedurasi` int(25) DEFAULT NULL,
  `deviceended` timestamp NULL DEFAULT NULL,
  `deviceowner` varchar(35) DEFAULT NULL,
  `devicemake` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(25) NOT NULL,
  `recipient` varchar(35) DEFAULT NULL,
  `message` text,
  `datainfo` varchar(150) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(25) NOT NULL,
  `paymentname` varchar(100) DEFAULT NULL,
  `merchantcode` varchar(100) DEFAULT NULL,
  `merchantkey` varchar(100) DEFAULT NULL,
  `instruksi` text,
  `status` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `paymentname`, `merchantcode`, `merchantkey`, `instruksi`, `status`) VALUES
(1, 'Manual Confirmations', '-', '-', 'Payment to\r\nRek : \r\nName : \r\nContact Admin After Payment', 1),
(2, 'Automatic Confirmations', '-', '-', 'Payment to\r\n{paymentlink}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(35) NOT NULL,
  `nomer` varchar(35) DEFAULT NULL,
  `users` varchar(25) DEFAULT NULL,
  `item` varchar(250) DEFAULT NULL,
  `price` bigint(100) DEFAULT NULL,
  `amount` bigint(250) DEFAULT NULL,
  `total` bigint(250) DEFAULT NULL,
  `discount` bigint(250) DEFAULT NULL,
  `method` varchar(15) DEFAULT NULL,
  `status` varchar(35) DEFAULT NULL,
  `product` varchar(35) DEFAULT NULL,
  `pid` varchar(35) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `paid` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `unbanned`
--

CREATE TABLE `unbanned` (
  `id` int(30) NOT NULL,
  `reqid` varchar(25) DEFAULT NULL,
  `nomer` varchar(50) DEFAULT NULL,
  `jenis` varchar(150) DEFAULT NULL,
  `users` int(15) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `reason` text,
  `proses` varchar(35) DEFAULT NULL,
  `paystat` varchar(25) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `website`
--

CREATE TABLE `website` (
  `id` int(25) NOT NULL,
  `unix` varchar(15) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `url` varchar(150) DEFAULT NULL,
  `whatsapp` bigint(50) DEFAULT NULL,
  `unbanned` bigint(50) DEFAULT NULL,
  `host` varchar(50) DEFAULT NULL,
  `apikey` varchar(50) DEFAULT NULL,
  `notif` bigint(100) NOT NULL DEFAULT '0',
  `owner` varchar(35) DEFAULT NULL,
  `status` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `website`
--

INSERT INTO `website` (`id`, `unix`, `icon`, `logo`, `name`, `url`, `whatsapp`, `unbanned`, `host`, `apikey`, `notif`, `owner`, `status`) VALUES
(1, NULL, 'default.png', 'default.png', 'Seller System', NULL, 45000, 100000, NULL, NULL, 0, NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unbanned`
--
ALTER TABLE `unbanned`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `website`
--
ALTER TABLE `website`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(35) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
  MODIFY `id` int(35) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(35) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `unbanned`
--
ALTER TABLE `unbanned`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `website`
--
ALTER TABLE `website`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
