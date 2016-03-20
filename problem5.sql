-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 20, 2016 at 12:59 AM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `problem5`
--

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `cust_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Customer`
--

INSERT INTO `Customer` (`cust_id`, `name`, `email`) VALUES
(1, 'Nick', 'nick@gmail.com'),
(2, 'Mathew', 'matt@gmail.com'),
(3, 'Kristie', 'kriss@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `date` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `date`) VALUES
(1, '03/04/2016'),
(2, '03/05/2016'),
(3, '03/05/2016'),
(4, '03/06/2016'),
(5, '03/15/2016'),
(6, '03/19/2016');

-- --------------------------------------------------------

--
-- Table structure for table `Order_Customer`
--

CREATE TABLE `Order_Customer` (
  `cust_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Order_Customer`
--

INSERT INTO `Order_Customer` (`cust_id`, `order_id`) VALUES
(1, 1),
(1, 2),
(1, 4),
(2, 3),
(3, 5),
(3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `Order_Product`
--

CREATE TABLE `Order_Product` (
  `order_id` int(11) NOT NULL,
  `SKU` bigint(20) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Order_Product`
--

INSERT INTO `Order_Product` (`order_id`, `SKU`, `qty`) VALUES
(1, 1, 2),
(2, 1, 3),
(5, 1, 2),
(1, 2, 3),
(3, 2, 1),
(2, 4, 1),
(4, 4, 1),
(6, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Product`
--

CREATE TABLE `Product` (
  `SKU` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` double(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Product`
--

INSERT INTO `Product` (`SKU`, `name`, `price`) VALUES
(1, 'Flash Drive', 20.00),
(2, 'HDD', 80.00),
(3, 'Mouse', 10.00),
(4, 'Laptop', 500.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`cust_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `Order_Customer`
--
ALTER TABLE `Order_Customer`
  ADD UNIQUE KEY `Order_Customer_ak_1` (`cust_id`,`order_id`),
  ADD KEY `Order_Customer_Order` (`order_id`);

--
-- Indexes for table `Order_Product`
--
ALTER TABLE `Order_Product`
  ADD UNIQUE KEY `Order_Product_ak_1` (`SKU`,`order_id`),
  ADD KEY `Order_Product_Order` (`order_id`);

--
-- Indexes for table `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`SKU`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Customer`
--
ALTER TABLE `Customer`
  MODIFY `cust_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `Product`
--
ALTER TABLE `Product`
  MODIFY `SKU` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Order_Customer`
--
ALTER TABLE `Order_Customer`
  ADD CONSTRAINT `Order_Customer_Customer` FOREIGN KEY (`cust_id`) REFERENCES `Customer` (`cust_id`),
  ADD CONSTRAINT `Order_Customer_Order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `Order_Product`
--
ALTER TABLE `Order_Product`
  ADD CONSTRAINT `Order_Product_Order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `Order_Product_Product` FOREIGN KEY (`SKU`) REFERENCES `Product` (`SKU`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
