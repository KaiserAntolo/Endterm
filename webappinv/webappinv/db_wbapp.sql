-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2023 at 07:27 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_wbapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `prod_id` int(8) UNSIGNED NOT NULL,
  `prod_name` varchar(180) NOT NULL DEFAULT '',
  `prod_description` varchar(180) NOT NULL DEFAULT '',
  `prod_image` varchar(180) NOT NULL DEFAULT '',
  `prod_date_added` date NOT NULL,
  `prod_time_added` time NOT NULL,
  `prod_date_updated` date NOT NULL,
  `prod_time_updated` time NOT NULL,
  `prod_status` int(1) NOT NULL DEFAULT 0,
  `type_id` int(3) NOT NULL DEFAULT 0,
  `prod_price` decimal(10,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`prod_id`, `prod_name`, `prod_description`, `prod_image`, `prod_date_added`, `prod_time_added`, `prod_date_updated`, `prod_time_updated`, `prod_status`, `type_id`, `prod_price`) VALUES
(10000001, 'Dickies', 'Overruns', 'default.png', '2023-06-05', '01:13:02', '2023-06-05', '01:17:02', 1, 0, '200.00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_inv`
--

CREATE TABLE `tbl_product_inv` (
  `rec_id` int(8) NOT NULL DEFAULT 0,
  `prod_id` int(8) NOT NULL DEFAULT 0,
  `prod_qty` int(8) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_pricing`
--

CREATE TABLE `tbl_product_pricing` (
  `prod_id` int(8) NOT NULL DEFAULT 0,
  `prod_retail_price` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_qty`
--

CREATE TABLE `tbl_product_qty` (
  `prodqty_id` int(8) UNSIGNED NOT NULL,
  `prodqty_date_added` date NOT NULL,
  `prodqty_time_added` time NOT NULL,
  `prodqty_date_updated` date NOT NULL,
  `prodqty_time_updated` time NOT NULL,
  `prodqty_quantity` int(10) NOT NULL DEFAULT 0,
  `prod_id` int(8) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_receive`
--

CREATE TABLE `tbl_receive` (
  `rec_id` int(8) UNSIGNED NOT NULL,
  `rec_supplier` varchar(180) NOT NULL DEFAULT '',
  `rec_description` varchar(180) NOT NULL DEFAULT '',
  `rec_amount` int(10) NOT NULL DEFAULT 0,
  `rec_date_added` date NOT NULL,
  `rec_time_added` time NOT NULL,
  `rec_saved` int(1) NOT NULL DEFAULT 0,
  `rec_status` int(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_receive`
--

INSERT INTO `tbl_receive` (`rec_id`, `rec_supplier`, `rec_description`, `rec_amount`, `rec_date_added`, `rec_time_added`, `rec_saved`, `rec_status`) VALUES
(10000001, 'AC Clothing', 'Nike Tees', 1, '2023-06-05', '00:34:51', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_receive_items`
--

CREATE TABLE `tbl_receive_items` (
  `rec_id` int(8) NOT NULL DEFAULT 0,
  `prod_id` int(8) NOT NULL DEFAULT 0,
  `rec_qty` int(8) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_release`
--

CREATE TABLE `tbl_release` (
  `rel_id` int(8) UNSIGNED NOT NULL,
  `rel_customer` varchar(180) NOT NULL DEFAULT '',
  `rel_description` varchar(180) NOT NULL DEFAULT '',
  `rel_amount` int(10) NOT NULL DEFAULT 0,
  `rel_date_added` date NOT NULL,
  `rel_time_added` time NOT NULL,
  `rel_saved` int(1) NOT NULL DEFAULT 0,
  `rel_status` int(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_release`
--

INSERT INTO `tbl_release` (`rel_id`, `rel_customer`, `rel_description`, `rel_amount`, `rel_date_added`, `rel_time_added`, `rel_saved`, `rel_status`) VALUES
(10000001, 'AC Clothing', 'Nike Tees', 1, '2023-06-05', '00:51:19', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_release_inv`
--

CREATE TABLE `tbl_release_inv` (
  `rel_id` int(8) NOT NULL DEFAULT 0,
  `prod_id` int(8) NOT NULL DEFAULT 0,
  `prod_qty` int(8) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_release_items`
--

CREATE TABLE `tbl_release_items` (
  `rel_id` int(8) NOT NULL DEFAULT 0,
  `prod_id` int(8) NOT NULL DEFAULT 0,
  `rel_qty` int(8) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_type`
--

CREATE TABLE `tbl_type` (
  `type_id` int(3) UNSIGNED NOT NULL,
  `type_name` varchar(180) NOT NULL DEFAULT '',
  `type_date_added` date NOT NULL,
  `type_time_added` time NOT NULL,
  `type_date_updated` date NOT NULL,
  `type_time_updated` time NOT NULL,
  `type_status` int(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `user_id` int(8) UNSIGNED NOT NULL,
  `user_lastname` varchar(180) NOT NULL DEFAULT '',
  `user_firstname` varchar(180) NOT NULL DEFAULT '',
  `user_email` varchar(180) NOT NULL DEFAULT '',
  `user_password` varchar(180) NOT NULL DEFAULT '',
  `user_date_added` date NOT NULL,
  `user_time_added` time NOT NULL,
  `user_date_updated` date NOT NULL,
  `user_time_updated` time NOT NULL,
  `user_status` int(1) NOT NULL DEFAULT 0,
  `user_token` varchar(255) NOT NULL DEFAULT '',
  `user_access` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`user_id`, `user_lastname`, `user_firstname`, `user_email`, `user_password`, `user_date_added`, `user_time_added`, `user_date_updated`, `user_time_updated`, `user_status`, `user_token`, `user_access`) VALUES
(10000001, 'Casim', 'Inigo', 'inigo@mail.com', '123', '2023-06-04', '23:04:56', '2023-06-04', '23:05:00', 1, '', 'Supervisor'),
(10000002, 'Casim', 'Ivan', 'ic@mail.com', '123', '2023-06-04', '23:54:08', '0000-00-00', '00:00:00', 1, '', 'Staff'),
(10000003, 'Casim', 'Lemuel', 'lc@mail.com', '202cb962ac59075b964b07152d234b70', '2023-06-05', '00:08:36', '0000-00-00', '00:00:00', 1, '', 'Supervisor');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`prod_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `tbl_product_inv`
--
ALTER TABLE `tbl_product_inv`
  ADD KEY `prod_id` (`prod_id`),
  ADD KEY `rec_id` (`rec_id`);

--
-- Indexes for table `tbl_product_pricing`
--
ALTER TABLE `tbl_product_pricing`
  ADD KEY `prod_id` (`prod_id`);

--
-- Indexes for table `tbl_product_qty`
--
ALTER TABLE `tbl_product_qty`
  ADD PRIMARY KEY (`prodqty_id`),
  ADD KEY `prod_id` (`prod_id`);

--
-- Indexes for table `tbl_receive`
--
ALTER TABLE `tbl_receive`
  ADD PRIMARY KEY (`rec_id`);

--
-- Indexes for table `tbl_receive_items`
--
ALTER TABLE `tbl_receive_items`
  ADD KEY `rec_id` (`rec_id`),
  ADD KEY `prod_id` (`prod_id`);

--
-- Indexes for table `tbl_release`
--
ALTER TABLE `tbl_release`
  ADD PRIMARY KEY (`rel_id`);

--
-- Indexes for table `tbl_release_inv`
--
ALTER TABLE `tbl_release_inv`
  ADD KEY `prod_id` (`prod_id`),
  ADD KEY `rel_id` (`rel_id`);

--
-- Indexes for table `tbl_release_items`
--
ALTER TABLE `tbl_release_items`
  ADD KEY `rel_id` (`rel_id`),
  ADD KEY `prod_id` (`prod_id`);

--
-- Indexes for table `tbl_type`
--
ALTER TABLE `tbl_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `prod_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10000002;

--
-- AUTO_INCREMENT for table `tbl_product_qty`
--
ALTER TABLE `tbl_product_qty`
  MODIFY `prodqty_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10000001;

--
-- AUTO_INCREMENT for table `tbl_receive`
--
ALTER TABLE `tbl_receive`
  MODIFY `rec_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10000002;

--
-- AUTO_INCREMENT for table `tbl_release`
--
ALTER TABLE `tbl_release`
  MODIFY `rel_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10000002;

--
-- AUTO_INCREMENT for table `tbl_type`
--
ALTER TABLE `tbl_type`
  MODIFY `type_id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=301;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `user_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10000004;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
