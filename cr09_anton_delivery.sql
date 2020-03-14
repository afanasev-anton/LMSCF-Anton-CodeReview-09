-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2020 at 11:11 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_anton_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_anton_delivery` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr09_anton_delivery`;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `dep_num` int(11) NOT NULL,
  `type` enum('storage','parcelshop') DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `city` varchar(10) DEFAULT NULL,
  `zip` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`dep_num`, `type`, `name`, `address`, `city`, `zip`) VALUES
(43001001, 'storage', 'Vienna Cen', 'Gurtel 34/1', 'Vienna', 1080),
(43001002, 'parcelshop', 'Mitte', 'Landstrasse 3/3', 'Vienna', 1030),
(43001003, 'parcelshop', 'North', 'Oberstrasse 23/12', 'Vienna', 1220),
(43002001, 'parcelshop', 'Shopingcen', 'Raubergasse 14', 'Graz', 8010),
(43002002, 'storage', 'Main offic', 'Keplerstraße 22-24', 'Graz', 8020);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `emp_num` int(11) NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `position` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`emp_num`, `first_name`, `last_name`, `hire_date`, `position`) VALUES
(1001, 'Pablo', 'Escobar', '1995-03-03', 'manager'),
(1002, 'Cedric', 'Lamar', '1998-07-07', 'operator'),
(1003, 'Kasius', 'Klei', '2015-02-23', 'operator'),
(1004, 'Vlad', 'Tepes', '2010-01-30', 'operator'),
(1005, 'Marketa', 'Stroblova', '2008-10-26', 'manager');

-- --------------------------------------------------------

--
-- Table structure for table `empl_depart`
--

CREATE TABLE `empl_depart` (
  `dep_num` int(11) NOT NULL,
  `emp_num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `empl_depart`
--

INSERT INTO `empl_depart` (`dep_num`, `emp_num`) VALUES
(43001001, 1003),
(43001002, 1002),
(43001003, 1004),
(43002001, 1001),
(43002002, 1005);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `pack_id` int(11) NOT NULL,
  `from_cust` varchar(20) DEFAULT NULL,
  `to_cust` varchar(20) DEFAULT NULL,
  `delivered` tinyint(1) DEFAULT NULL,
  `deliv_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`pack_id`, `from_cust`, `to_cust`, `delivered`, `deliv_date`) VALUES
(9009, 'Molly', 'Dolly', 1, '1995-04-01 10:13:17'),
(9011, 'Dolly', 'Molly', 1, '1998-05-15 08:48:10'),
(9018, 'James', 'Sara', 0, '0000-00-00 00:00:00'),
(9019, 'Sara', 'James', 0, '0000-00-00 00:00:00'),
(9021, 'Alex', 'James', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `process`
--

CREATE TABLE `process` (
  `pack_id` int(11) NOT NULL,
  `emp_num` int(11) NOT NULL,
  `receive_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `process`
--

INSERT INTO `process` (`pack_id`, `emp_num`, `receive_date`) VALUES
(9009, 1001, '1995-03-24'),
(9011, 1002, '1998-04-10'),
(9018, 1004, '2020-01-16'),
(9019, 1004, '2020-01-17'),
(9021, 1005, '2020-02-07');

-- --------------------------------------------------------

--
-- Table structure for table `tracks`
--

CREATE TABLE `tracks` (
  `pack_id` int(11) NOT NULL,
  `dep_num` int(11) NOT NULL,
  `depo_date` date DEFAULT NULL,
  `send_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tracks`
--

INSERT INTO `tracks` (`pack_id`, `dep_num`, `depo_date`, `send_date`) VALUES
(9009, 43002001, '1995-03-24', '1995-03-25'),
(9009, 43002002, '1995-03-25', '1995-04-01'),
(9011, 43001001, '1998-04-11', '1998-04-19'),
(9011, 43001002, '1998-04-10', '1998-04-11'),
(9011, 43001003, '1998-04-19', '1998-05-15'),
(9018, 43001001, '2020-01-17', '0000-00-00'),
(9018, 43001003, '2020-01-16', '2020-01-17'),
(9019, 43001003, '2020-01-17', '0000-00-00'),
(9021, 43001001, '2020-02-10', '0000-00-00'),
(9021, 43002002, '2020-02-07', '2020-02-09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`dep_num`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`emp_num`);

--
-- Indexes for table `empl_depart`
--
ALTER TABLE `empl_depart`
  ADD PRIMARY KEY (`dep_num`,`emp_num`),
  ADD KEY `emp_num` (`emp_num`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`pack_id`);

--
-- Indexes for table `process`
--
ALTER TABLE `process`
  ADD PRIMARY KEY (`pack_id`,`emp_num`),
  ADD KEY `emp_num` (`emp_num`);

--
-- Indexes for table `tracks`
--
ALTER TABLE `tracks`
  ADD PRIMARY KEY (`pack_id`,`dep_num`),
  ADD KEY `dep_num` (`dep_num`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `empl_depart`
--
ALTER TABLE `empl_depart`
  ADD CONSTRAINT `empl_depart_ibfk_1` FOREIGN KEY (`dep_num`) REFERENCES `departments` (`dep_num`),
  ADD CONSTRAINT `empl_depart_ibfk_2` FOREIGN KEY (`emp_num`) REFERENCES `employees` (`emp_num`);

--
-- Constraints for table `process`
--
ALTER TABLE `process`
  ADD CONSTRAINT `process_ibfk_1` FOREIGN KEY (`pack_id`) REFERENCES `packages` (`pack_id`),
  ADD CONSTRAINT `process_ibfk_2` FOREIGN KEY (`emp_num`) REFERENCES `employees` (`emp_num`);

--
-- Constraints for table `tracks`
--
ALTER TABLE `tracks`
  ADD CONSTRAINT `tracks_ibfk_1` FOREIGN KEY (`pack_id`) REFERENCES `packages` (`pack_id`),
  ADD CONSTRAINT `tracks_ibfk_2` FOREIGN KEY (`dep_num`) REFERENCES `departments` (`dep_num`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
