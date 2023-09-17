-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 17, 2023 at 11:22 AM
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
-- Database: `whatsapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(25) NOT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(35) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `fullname`, `username`, `email`, `phone`, `password`) VALUES
(1, 'Dedy Aprianda', 'etadigitals', 'dediafrianda11@gmail.com', '082288777821', 'MTMzM2MxOGJjZjM5NTk4OWJiOTg4YTBjZWVmZGM3NmE=');

-- --------------------------------------------------------

--
-- Table structure for table `backup`
--

CREATE TABLE `backup` (
  `id` int(25) NOT NULL,
  `dbname` varchar(150) DEFAULT NULL,
  `ukuran` varchar(100) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `connections`
--

CREATE TABLE `connections` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `apikey` varchar(100) DEFAULT NULL,
  `website` varchar(150) DEFAULT NULL,
  `users` varchar(25) DEFAULT NULL,
  `trans` int(250) DEFAULT NULL,
  `clients` int(100) DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `id` int(50) NOT NULL,
  `uniq` varchar(25) DEFAULT NULL,
  `server` varchar(25) DEFAULT NULL,
  `dname` varchar(50) DEFAULT NULL,
  `users` varchar(25) DEFAULT NULL,
  `sumber` varchar(20) DEFAULT NULL,
  `status` varchar(15) NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ended` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `duitku`
--

CREATE TABLE `duitku` (
  `id` int(2) NOT NULL,
  `endpoint` varchar(100) DEFAULT NULL,
  `merchantcode` varchar(150) DEFAULT NULL,
  `merchantkey` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `duitku`
--

INSERT INTO `duitku` (`id`, `endpoint`, `merchantcode`, `merchantkey`) VALUES
(1, 'https://api-sandbox.duitku.com', 'D9170', 'c3c515982e7efe0f24db8caf03a8c11b');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(25) NOT NULL,
  `s_id` varchar(25) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `content` text,
  `status` varchar(5) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `method`
--

CREATE TABLE `method` (
  `id` int(25) NOT NULL,
  `method` varchar(35) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `method`
--

INSERT INTO `method` (`id`, `method`, `name`, `image`) VALUES
(1, 'BK', 'BCA KlikPay', 'https://images.duitku.com/hotlink-ok/BK.PNG'),
(2, 'CK', 'CIMB CLICK', 'https://images.duitku.com/hotlink-ok/CK.PNG'),
(3, 'VA', 'MAYBANK VA', 'https://images.duitku.com/hotlink-ok/VA.PNG'),
(4, 'FT', 'RETAIL', 'https://images.duitku.com/hotlink-ok/retail.PNG'),
(5, 'VC', 'CREDIT CARD', 'https://images.duitku.com/hotlink-ok/VC.PNG'),
(6, 'BT', 'PERMATA VA', 'https://images.duitku.com/hotlink-ok/PERMATA.PNG'),
(7, 'B1', 'CIMB NIAGA VA', 'https://images.duitku.com/hotlink-ok/B1.PNG'),
(8, 'A1', 'ATM BERSAMA VA', 'https://images.duitku.com/hotlink-ok/A1.PNG'),
(9, 'I1', 'BNI VA', 'https://images.duitku.com/hotlink-ok/I1.PNG'),
(10, 'OV', 'OVO', 'https://images.duitku.com/hotlink-ok/OV.PNG'),
(11, 'M1', 'MANDIRI VA', 'https://images.duitku.com/hotlink-ok/MV.PNG'),
(12, 'AG', 'ARTHA GRAHA VA', 'https://images.duitku.com/hotlink-ok/AG.JPG'),
(13, 'S1', 'SAMPOERNA VA', 'https://images.duitku.com/hotlink-ok/S1.JPG'),
(14, 'SP', 'SHOPEEPAY QRIS', 'https://images.duitku.com/hotlink-ok/SHOPEEPAY.PNG'),
(15, 'DN', 'INDODANA PAYLATER', 'https://images.duitku.com/hotlink-ok/DN.PNG'),
(16, 'LA', 'LINKAJA APP PCT', 'https://images.duitku.com/hotlink-ok/LINKAJA.PNG'),
(17, 'SA', 'SHOPEEPAY APP', 'https://images.duitku.com/hotlink-ok/SHOPEEPAY.PNG'),
(18, 'LQ', 'LINKAJA QRIS', 'https://images.duitku.com/hotlink-ok/LINKAJA.PNG'),
(19, 'DA', 'DANA', 'https://images.duitku.com/hotlink-ok/DA.PNG'),
(20, 'BC', 'BCA VA', 'https://images.duitku.com/hotlink-ok/BCA.SVG'),
(21, 'IR', 'INDOMARET', 'https://images.duitku.com/hotlink-ok/IR.PNG'),
(22, 'SL', 'SHOPEEPAY LINK', 'https://images.duitku.com/hotlink-ok/SHOPEEPAY.PNG'),
(23, 'BR', 'BRI VA', 'https://images.duitku.com/hotlink-ok/BR.PNG'),
(24, 'NC', 'BNC VA', 'https://images.duitku.com/hotlink-ok/NC.PNG'),
(25, 'NQ', 'NOBU QRIS', 'https://images.duitku.com/hotlink-ok/NQ.PNG'),
(26, 'OL', 'OVO LINK', 'https://images.duitku.com/hotlink-ok/OV.PNG'),
(27, 'JP', 'JENIUS PAY', 'https://images.duitku.com/hotlink-ok/JP.PNG'),
(28, 'M2', 'MANDIRI VA H2H', 'https://images.duitku.com/hotlink-ok/MV.PNG'),
(29, 'BK', 'BCA KlikPay', 'https://images.duitku.com/hotlink-ok/BK.PNG'),
(30, 'CK', 'CIMB CLICK', 'https://images.duitku.com/hotlink-ok/CK.PNG'),
(31, 'VA', 'MAYBANK VA', 'https://images.duitku.com/hotlink-ok/VA.PNG'),
(32, 'FT', 'RETAIL', 'https://images.duitku.com/hotlink-ok/retail.PNG'),
(33, 'VC', 'CREDIT CARD', 'https://images.duitku.com/hotlink-ok/VC.PNG'),
(34, 'BT', 'PERMATA VA', 'https://images.duitku.com/hotlink-ok/PERMATA.PNG'),
(35, 'B1', 'CIMB NIAGA VA', 'https://images.duitku.com/hotlink-ok/B1.PNG'),
(36, 'A1', 'ATM BERSAMA VA', 'https://images.duitku.com/hotlink-ok/A1.PNG'),
(37, 'I1', 'BNI VA', 'https://images.duitku.com/hotlink-ok/I1.PNG'),
(38, 'OV', 'OVO', 'https://images.duitku.com/hotlink-ok/OV.PNG'),
(39, 'M1', 'MANDIRI VA', 'https://images.duitku.com/hotlink-ok/MV.PNG'),
(40, 'AG', 'ARTHA GRAHA VA', 'https://images.duitku.com/hotlink-ok/AG.JPG'),
(41, 'S1', 'SAMPOERNA VA', 'https://images.duitku.com/hotlink-ok/S1.JPG'),
(42, 'SP', 'SHOPEEPAY QRIS', 'https://images.duitku.com/hotlink-ok/SHOPEEPAY.PNG'),
(43, 'DN', 'INDODANA PAYLATER', 'https://images.duitku.com/hotlink-ok/DN.PNG'),
(44, 'LA', 'LINKAJA APP PCT', 'https://images.duitku.com/hotlink-ok/LINKAJA.PNG'),
(45, 'SA', 'SHOPEEPAY APP', 'https://images.duitku.com/hotlink-ok/SHOPEEPAY.PNG'),
(46, 'LQ', 'LINKAJA QRIS', 'https://images.duitku.com/hotlink-ok/LINKAJA.PNG'),
(47, 'DA', 'DANA', 'https://images.duitku.com/hotlink-ok/DA.PNG'),
(48, 'BC', 'BCA VA', 'https://images.duitku.com/hotlink-ok/BCA.SVG'),
(49, 'IR', 'INDOMARET', 'https://images.duitku.com/hotlink-ok/IR.PNG'),
(50, 'SL', 'SHOPEEPAY LINK', 'https://images.duitku.com/hotlink-ok/SHOPEEPAY.PNG'),
(51, 'BR', 'BRI VA', 'https://images.duitku.com/hotlink-ok/BR.PNG'),
(52, 'NC', 'BNC VA', 'https://images.duitku.com/hotlink-ok/NC.PNG'),
(53, 'NQ', 'NOBU QRIS', 'https://images.duitku.com/hotlink-ok/NQ.PNG'),
(54, 'OL', 'OVO LINK', 'https://images.duitku.com/hotlink-ok/OV.PNG'),
(55, 'JP', 'JENIUS PAY', 'https://images.duitku.com/hotlink-ok/JP.PNG'),
(56, 'M2', 'MANDIRI VA H2H', 'https://images.duitku.com/hotlink-ok/MV.PNG'),
(57, NULL, NULL, NULL),
(58, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notif_history`
--

CREATE TABLE `notif_history` (
  `id` int(25) NOT NULL,
  `recipient` varchar(35) DEFAULT NULL,
  `subject` varchar(150) DEFAULT NULL,
  `message` text,
  `datainfo` varchar(150) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `partner`
--

CREATE TABLE `partner` (
  `id` int(25) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `images` varchar(100) DEFAULT NULL,
  `url` varchar(150) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `payid` int(11) DEFAULT NULL,
  `reference` varchar(35) DEFAULT NULL,
  `jumlah` bigint(20) DEFAULT NULL,
  `users` varchar(25) DEFAULT NULL,
  `paymethod` varchar(25) DEFAULT NULL,
  `payname` varchar(100) DEFAULT NULL,
  `paypublish` varchar(100) DEFAULT NULL,
  `paylink` varchar(150) DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL,
  `note` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `paytime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `id` int(25) NOT NULL,
  `code` varchar(25) DEFAULT NULL,
  `logo` varchar(150) DEFAULT NULL,
  `user` varchar(15) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `site` varchar(150) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `server`
--

CREATE TABLE `server` (
  `id` int(25) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `ipaddress` varchar(35) DEFAULT NULL,
  `hostname` varchar(150) DEFAULT NULL,
  `devices` varchar(25) DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `server`
--

INSERT INTO `server` (`id`, `name`, `ipaddress`, `hostname`, `devices`, `status`, `created`) VALUES
(2, 'Arcadia', '18.139.115.83', 'arca.dlw.my.id', '0', '1', '2023-09-10 11:28:06');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `site`
--

CREATE TABLE `site` (
  `id` int(20) NOT NULL,
  `logo` varchar(150) DEFAULT NULL,
  `icon` varchar(150) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `homepage` varchar(100) DEFAULT NULL,
  `address` text,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `youtube` varchar(200) DEFAULT NULL,
  `tiktok` varchar(200) DEFAULT NULL,
  `instagram` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `site`
--

INSERT INTO `site` (`id`, `logo`, `icon`, `name`, `homepage`, `address`, `email`, `phone`, `youtube`, `tiktok`, `instagram`) VALUES
(1, 'http://whatsapp/uploads/2ec996592607a12e059f6b0c3b61db89.png', 'http://whatsapp/uploads/ac2d2bcf6894635b9a767384631051ff.png', 'Eta Whatsapp 2', 'http://whatsapp', 'tes', 'whatsapp@eta.co.id', '+6282288777821', 'https://www.youtube.com/@etadigitals', 'https://eta.co.id', 'https://eta.co.id');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(100) NOT NULL,
  `nomer` varchar(100) DEFAULT NULL,
  `descrip` text,
  `amount` bigint(250) DEFAULT NULL,
  `discont` bigint(250) DEFAULT NULL,
  `total` bigint(250) DEFAULT NULL,
  `users` varchar(20) DEFAULT NULL,
  `site` varchar(10) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `unbanned`
--

CREATE TABLE `unbanned` (
  `id` int(25) NOT NULL,
  `reqid` varchar(15) DEFAULT NULL,
  `watype` varchar(25) DEFAULT NULL,
  `contact` varchar(35) DEFAULT NULL,
  `users` varchar(20) DEFAULT NULL,
  `web` varchar(15) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `reason` text,
  `price` bigint(250) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(25) NOT NULL,
  `code` varchar(35) DEFAULT NULL,
  `fullname` varchar(150) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `reff` varchar(25) DEFAULT NULL,
  `verify` varchar(250) DEFAULT NULL,
  `ipaddress` varchar(30) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `price` int(25) DEFAULT NULL,
  `trans` bigint(250) DEFAULT '0',
  `paid` bigint(250) NOT NULL DEFAULT '0',
  `unpaid` bigint(250) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `whatsapp`
--

CREATE TABLE `whatsapp` (
  `id` int(25) NOT NULL,
  `host` varchar(150) DEFAULT NULL,
  `waid` varchar(25) DEFAULT NULL,
  `contact` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `whatsapp`
--

INSERT INTO `whatsapp` (`id`, `host`, `waid`, `contact`) VALUES
(1, 'arca.dlw.my.id', 'a2fd1', '085172051605');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `backup`
--
ALTER TABLE `backup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `connections`
--
ALTER TABLE `connections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `duitku`
--
ALTER TABLE `duitku`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `method`
--
ALTER TABLE `method`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notif_history`
--
ALTER TABLE `notif_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partner`
--
ALTER TABLE `partner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `server`
--
ALTER TABLE `server`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD KEY `sessions_timestamp` (`timestamp`);

--
-- Indexes for table `site`
--
ALTER TABLE `site`
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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `whatsapp`
--
ALTER TABLE `whatsapp`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `backup`
--
ALTER TABLE `backup`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `connections`
--
ALTER TABLE `connections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `duitku`
--
ALTER TABLE `duitku`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `method`
--
ALTER TABLE `method`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `notif_history`
--
ALTER TABLE `notif_history`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partner`
--
ALTER TABLE `partner`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `server`
--
ALTER TABLE `server`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `site`
--
ALTER TABLE `site`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `unbanned`
--
ALTER TABLE `unbanned`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `whatsapp`
--
ALTER TABLE `whatsapp`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
