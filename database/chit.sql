-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 10, 2024 at 06:03 AM
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
-- Database: `chit`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_collect_entry`
--

CREATE TABLE `accounts_collect_entry` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `coll_mode` int(11) NOT NULL,
  `bank_id` varchar(50) DEFAULT NULL,
  `no_of_customers` int(11) NOT NULL,
  `collection_amnt` varchar(150) NOT NULL,
  `insert_login_id` int(11) NOT NULL,
  `created_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_collect_entry`
--

INSERT INTO `accounts_collect_entry` (`id`, `user_id`, `branch`, `coll_mode`, `bank_id`, `no_of_customers`, `collection_amnt`, `insert_login_id`, `created_on`) VALUES
(1, 1, 'Villianur', 1, '', 1, '31833', 1, '2024-08-27 14:30:46'),
(2, 1, 'chetpet', 2, '1', 1, '31600', 1, '2024-08-27 14:31:28'),
(3, 1, 'chetpet', 1, '', 2, '85280', 1, '2024-08-27 15:14:07'),
(12, 1, 'chetpet, Villianur', 2, '2', 1, '1000', 1, '2024-08-28 16:29:01'),
(13, 1, 'chetpet, Villianur', 2, '1', 1, '1000', 1, '2024-09-02 17:20:10'),
(14, 1, 'chetpet, Villianur', 1, '', 1, '4700', 1, '2024-09-18 12:17:46');

-- --------------------------------------------------------

--
-- Table structure for table `auction_details`
--

CREATE TABLE `auction_details` (
  `id` int(11) NOT NULL,
  `group_id` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `auction_month` int(11) NOT NULL,
  `low_value` varchar(100) NOT NULL,
  `high_value` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `cus_name` varchar(100) DEFAULT NULL,
  `auction_value` varchar(100) DEFAULT NULL,
  `chit_amount` varchar(100) DEFAULT NULL,
  `insert_login_id` int(11) DEFAULT NULL,
  `update_login_id` int(11) DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `updated_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auction_details`
--

INSERT INTO `auction_details` (`id`, `group_id`, `date`, `auction_month`, `low_value`, `high_value`, `status`, `cus_name`, `auction_value`, `chit_amount`, `insert_login_id`, `update_login_id`, `created_on`, `updated_on`) VALUES
(1, 'G-101', '2024-08-22', 1, '1000', '100000', '3', '1', '12000', '22080', 1, 1, '2024-08-23', '2024-09-06'),
(2, 'G-101', '2024-09-22', 2, '1000', '100000', '2', '1', '22000', '1200', 1, NULL, '2024-08-23', NULL),
(3, 'G-101', '2024-10-22', 3, '1000', '100000', '1', '', '', '', 1, NULL, '2024-08-23', NULL),
(4, 'G-101', '2024-11-22', 4, '1000', '100000', '1', '', '', '', 1, NULL, '2024-08-23', NULL),
(5, 'G-101', '2024-12-22', 5, '1000', '100000', '1', '', '', '', 1, NULL, '2024-08-23', NULL),
(6, 'G-101', '2025-01-22', 6, '1000', '100000', '1', '', '', '', 1, NULL, '2024-08-23', NULL),
(7, 'G-101', '2025-02-22', 7, '1000', '100000', '1', '', '', '', 1, NULL, '2024-08-23', NULL),
(8, 'G-101', '2025-03-22', 8, '1000', '100000', '1', '', '', '', 1, NULL, '2024-08-23', NULL),
(9, 'G-101', '2025-04-22', 9, '1000', '100000', '1', '', '', '', 1, NULL, '2024-08-23', NULL),
(10, 'G-101', '2025-05-22', 10, '1000', '100000', '1', '', '', '', 1, NULL, '2024-08-23', NULL),
(11, 'G-102', '2024-08-19', 1, '1000', '150000', '3', '4', '15000', '31833', 1, 1, '2024-08-23', '2024-09-06'),
(12, 'G-102', '2024-09-22', 2, '1000', '150000', '2', '1', '14000', '32000', 1, 1, '2024-08-23', '2024-09-20'),
(13, 'G-102', '2024-10-19', 3, '3000', '150000', '1', '', '', '', 1, 1, '2024-08-23', '2024-10-08'),
(14, 'G-102', '2024-11-19', 4, '1000', '150000', '1', '', '', '', 1, NULL, '2024-08-23', NULL),
(15, 'G-102', '2024-12-19', 5, '1000', '150000', '1', '', '', '', 1, NULL, '2024-08-23', NULL),
(125, 'G-103', '2024-08-26', 1, '234', '543534', '3', '1', '50000', '31600', 1, 1, '2024-08-23', '2024-08-26'),
(126, 'G-103', '2024-09-19', 2, '324', '534', '3', '5', '500', '41500', 1, 1, '2024-08-23', '2024-09-02'),
(127, 'G-103', '2024-10-09', 3, '234', '45645', '1', '2', '14000', '38800', 1, 1, '2024-08-23', '2024-10-09'),
(128, 'G-103', '2024-11-19', 4, '2345', '32400', '1', '', '', '', 1, NULL, '2024-08-23', NULL),
(129, 'G-103', '2024-12-19', 5, '2342', '34500', '1', '', '', '', 1, NULL, '2024-08-23', NULL),
(174, 'G-105', '2024-09-05', 1, '1000', '12000', '1', '', '', '', 1, NULL, '2024-08-26', NULL),
(175, 'G-105', '2024-10-05', 2, '2000', '67867', '1', '', '', '', 1, NULL, '2024-08-26', NULL),
(176, 'G-105', '2024-11-05', 3, '244', '8978', '1', '', '', '', 1, NULL, '2024-08-26', NULL),
(177, 'G-104', '2024-08-04', 1, '23', '2000', '1', '', '', '', 1, NULL, '2024-08-26', NULL),
(178, 'G-104', '2024-09-04', 2, '3400', '50000', '1', '', '', '', 1, NULL, '2024-08-26', NULL),
(180, 'G-106', '2024-09-05', 1, '40000', '55000', '3', '8', '55000', '4700', 1, 1, '2024-09-02', '2024-09-21'),
(181, 'G-106', '2024-10-05', 2, '38000', '52000', '3', '8', '65000', '5000', 1, NULL, '2024-09-02', NULL),
(182, 'G-106', '2024-11-05', 3, '36000', '50000', '3', '8', '55000', '5000', 1, NULL, '2024-09-02', NULL),
(183, 'G-106', '2024-12-05', 4, '32000', '42000', '1', '9', '5500', '5000', 1, NULL, '2024-09-02', NULL),
(184, 'G-106', '2025-01-05', 5, '25000', '35000', '1', '', '', '', 1, NULL, '2024-09-02', NULL),
(185, 'G-106', '2025-02-05', 6, '24000', '33000', '1', '', '', '', 1, NULL, '2024-09-02', NULL),
(186, 'G-106', '2025-03-05', 7, '23000', '30000', '1', '', '', '', 1, NULL, '2024-09-02', NULL),
(187, 'G-106', '2025-04-05', 8, '18000', '29000', '1', '', '', '', 1, NULL, '2024-09-02', NULL),
(188, 'G-106', '2025-05-05', 9, '15000', '20000', '1', '', '', '', 1, NULL, '2024-09-02', NULL),
(189, 'G-106', '2025-06-05', 10, '12000', '15000', '1', '', '', '', 1, NULL, '2024-09-02', NULL),
(194, 'G-107', '2024-09-30', 1, '2000', '45000', '2', '12', '2500', '9700', 1, 1, '2024-09-21', '2024-09-21'),
(195, 'G-107', '2024-10-03', 2, '2000', '45000', '2', '12', '6200', '8960', 1, 1, '2024-09-21', '2024-10-07'),
(196, 'G-107', '2024-11-22', 3, '2000', '45000', '1', '', '', '', 1, 1, '2024-09-21', '2024-09-21'),
(197, 'G-107', '2024-12-22', 4, '2000', '45000', '1', NULL, NULL, NULL, 1, NULL, '2024-09-21', NULL),
(198, 'G-107', '2025-01-22', 5, '2000', '45000', '1', NULL, NULL, NULL, 1, NULL, '2024-09-21', NULL),
(199, 'G-107', '2025-02-22', 6, '2000', '45000', '1', NULL, NULL, NULL, 1, NULL, '2024-09-21', NULL),
(200, 'G-107', '2025-03-22', 7, '2000', '45000', '1', NULL, NULL, NULL, 1, NULL, '2024-09-21', NULL),
(201, 'G-107', '2025-04-22', 8, '2000', '45000', '1', NULL, NULL, NULL, 1, NULL, '2024-09-21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auction_modal`
--

CREATE TABLE `auction_modal` (
  `id` int(11) NOT NULL,
  `auction_id` int(11) NOT NULL,
  `group_id` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `cus_name` varchar(100) NOT NULL,
  `value` int(11) NOT NULL,
  `inserted_login_id` int(11) DEFAULT NULL,
  `created_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auction_modal`
--

INSERT INTO `auction_modal` (`id`, `auction_id`, `group_id`, `date`, `cus_name`, `value`, `inserted_login_id`, `created_on`) VALUES
(1, 1, 'G-101', '2024-08-22', '1', 2000, 1, '2024-08-23'),
(2, 1, 'G-101', '2024-08-22', '4', 2500, 1, '2024-08-23'),
(3, 1, 'G-101', '2024-08-22', '4', 7000, 1, '2024-08-23'),
(4, 1, 'G-101', '2024-08-22', '1', 12000, 1, '2024-08-23'),
(5, 11, 'G-102', '2024-08-19', '3', 9050, 1, '2024-08-23'),
(6, 11, 'G-102', '2024-08-19', '1', 10000, 1, '2024-08-23'),
(7, 11, 'G-102', '2024-08-19', '4', 15000, 1, '2024-08-23'),
(8, 101, 'G-103', '2024-08-19', '1', 7676, 1, '2024-08-23'),
(9, 101, 'G-103', '2024-08-19', '3', 5676, 1, '2024-08-23'),
(10, 101, 'G-103', '2024-08-19', '2', 45640, 1, '2024-08-23'),
(11, 125, 'G-103', '2024-08-26', '4', 1000, 1, '2024-08-26'),
(12, 125, 'G-103', '2024-08-26', '1', 5000, 1, '2024-08-26'),
(13, 125, 'G-103', '2024-08-26', '1', 50000, 1, '2024-08-26'),
(14, 126, 'G-103', '2024-09-19', '4', 400, 1, '2024-09-02'),
(15, 126, 'G-103', '2024-09-19', '5', 450, 1, '2024-09-02'),
(16, 126, 'G-103', '2024-09-19', '1', 480, 1, '2024-09-02'),
(17, 126, 'G-103', '2024-09-19', '1', 490, 1, '2024-09-02'),
(18, 126, 'G-103', '2024-09-19', '5', 500, 1, '2024-09-02'),
(19, 180, 'G-106', '2024-09-05', '11', 41000, 1, '2024-09-05'),
(20, 180, 'G-106', '2024-09-05', '10', 42000, 1, '2024-09-05'),
(21, 180, 'G-106', '2024-09-05', '7', 45000, 1, '2024-09-05'),
(22, 180, 'G-106', '2024-09-05', '9', 45000, 1, '2024-09-05'),
(23, 180, 'G-106', '2024-09-05', '8', 47000, 1, '2024-09-05'),
(24, 180, 'G-106', '2024-09-05', '8', 55000, 1, '2024-09-05'),
(38, 12, 'G-102', '2024-09-22', '1', 1000, 1, '2024-09-20'),
(39, 12, 'G-102', '2024-09-22', '2', 1200, 1, '2024-09-20'),
(40, 12, 'G-102', '2024-09-22', '4', 4000, 1, '2024-09-20'),
(41, 12, 'G-102', '2024-09-22', '3', 4100, 1, '2024-09-20'),
(42, 12, 'G-102', '2024-09-22', '3', 4300, 1, '2024-09-20'),
(43, 12, 'G-102', '2024-09-22', '3', 7000, 1, '2024-09-20'),
(44, 12, 'G-102', '2024-09-22', '4', 8000, 1, '2024-09-20'),
(45, 12, 'G-102', '2024-09-22', '1', 14000, 1, '2024-09-20'),
(95, 195, 'G-107', '2024-10-03', '12', 2000, 1, '2024-10-07'),
(96, 195, 'G-107', '2024-10-03', '12', 5500, 1, '2024-10-07'),
(97, 195, 'G-107', '2024-10-03', '12', 6200, 1, '2024-10-07'),
(98, 195, 'G-107', '2024-10-03', '9', 3000, 1, '2024-10-07'),
(99, 195, 'G-107', '2024-10-03', '9', 4500, 1, '2024-10-07'),
(100, 195, 'G-107', '2024-10-03', '8', 3500, 1, '2024-10-07'),
(101, 195, 'G-107', '2024-10-03', '8', 5000, 1, '2024-10-07'),
(102, 195, 'G-107', '2024-10-03', '8', 6000, 1, '2024-10-07'),
(104, 127, 'G-103', '2024-10-09', '3', 7000, 1, '2024-10-09'),
(105, 127, 'G-103', '2024-10-09', '3', 8000, 1, '2024-10-09'),
(106, 127, 'G-103', '2024-10-09', '4', 12000, 1, '2024-10-09'),
(107, 127, 'G-103', '2024-10-09', '2', 14000, 1, '2024-10-09');

-- --------------------------------------------------------

--
-- Table structure for table `bank_creation`
--

CREATE TABLE `bank_creation` (
  `id` int(11) NOT NULL,
  `bank_name` varchar(100) NOT NULL,
  `bank_short_name` varchar(100) NOT NULL,
  `account_number` varchar(100) NOT NULL,
  `ifsc_code` varchar(100) NOT NULL,
  `branch_name` varchar(100) NOT NULL,
  `qr_code` varchar(100) NOT NULL,
  `gpay` varchar(100) NOT NULL,
  `under_branch` varchar(255) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT '1',
  `insert_login_id` varchar(100) DEFAULT NULL,
  `update_login_id` varchar(100) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bank_creation`
--

INSERT INTO `bank_creation` (`id`, `bank_name`, `bank_short_name`, `account_number`, `ifsc_code`, `branch_name`, `qr_code`, `gpay`, `under_branch`, `status`, `insert_login_id`, `update_login_id`, `created_date`, `updated_date`) VALUES
(1, 'State Bank Of India', 'SBI', '6575675675676560', 'asdf12', 'Villianur', '', '', '2,1', '1', '1', NULL, '2024-08-23 10:57:14', NULL),
(2, 'Union bank', 'UB', '454345345453455', 'hfg234', 'chetpet', '', '', '2,1', '1', '1', NULL, '2024-08-23 10:57:44', NULL),
(3, 'KVB', 'KVB-90001', '190020242343', 'KVB000029', 'PDY', '', '', '1,2', '1', '1', NULL, '2024-09-02 16:22:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `branch_creation`
--

CREATE TABLE `branch_creation` (
  `id` int(11) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `branch_code` varchar(50) NOT NULL,
  `branch_name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `taluk` int(11) NOT NULL,
  `place` varchar(100) NOT NULL,
  `pincode` varchar(100) NOT NULL,
  `email_id` varchar(100) NOT NULL,
  `mobile_number` varchar(100) NOT NULL,
  `whatsapp` varchar(100) NOT NULL,
  `landline_code` varchar(50) DEFAULT NULL,
  `landline` varchar(100) NOT NULL,
  `insert_login_id` int(11) DEFAULT NULL,
  `update_login_id` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branch_creation`
--

INSERT INTO `branch_creation` (`id`, `company_name`, `branch_code`, `branch_name`, `address`, `state`, `district`, `taluk`, `place`, `pincode`, `email_id`, `mobile_number`, `whatsapp`, `landline_code`, `landline`, `insert_login_id`, `update_login_id`, `created_date`, `updated_date`) VALUES
(1, 'Feather Technology', 'F-101', 'chetpet', 'Bussy Street', 2, 39, 313, 'Villianur', '609122', '', '', '', '', '', 1, 0, '2024-08-20 10:11:27', NULL),
(2, 'Feather Technology', 'F-102', 'Villianur', 'kalki Nagar', 1, 2, 8, 'Ariyur', '609122', '', '7856856758', '', '', '', 1, 1, '2024-08-20 10:36:26', '2024-09-02');

-- --------------------------------------------------------

--
-- Table structure for table `collection`
--

CREATE TABLE `collection` (
  `id` int(11) NOT NULL,
  `cus_mapping_id` varchar(100) NOT NULL,
  `auction_id` int(11) NOT NULL,
  `group_id` varchar(100) NOT NULL,
  `cus_id` varchar(11) NOT NULL,
  `auction_month` varchar(100) NOT NULL,
  `chit_value` varchar(100) NOT NULL,
  `chit_amount` varchar(100) NOT NULL,
  `pending` varchar(100) NOT NULL,
  `payable` bigint(100) NOT NULL,
  `coll_status` varchar(100) NOT NULL,
  `collection_date` datetime DEFAULT current_timestamp(),
  `coll_mode` int(11) NOT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `bank_id` varchar(100) DEFAULT NULL,
  `collection_amount` bigint(100) NOT NULL,
  `insert_login_id` int(11) DEFAULT NULL,
  `update_login_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `collection`
--

INSERT INTO `collection` (`id`, `cus_mapping_id`, `auction_id`, `group_id`, `cus_id`, `auction_month`, `chit_value`, `chit_amount`, `pending`, `payable`, `coll_status`, `collection_date`, `coll_mode`, `transaction_id`, `bank_id`, `collection_amount`, `insert_login_id`, `update_login_id`, `created_on`, `updated_on`) VALUES
(1, '3', 1, 'G-101', 'C-105', '1', '120000', '22080', '0', 22080, 'Payable', '2024-08-26 00:00:00', 0, '0', '0', 22000, 1, NULL, '2024-08-26 18:21:45', NULL),
(2, '3', 1, 'G-101', 'C-105', '1', '120000', '22080', '0', 80, 'Paid', '2024-08-26 00:00:00', 0, '0', '0', 80, 1, NULL, '2024-08-26 18:21:53', NULL),
(3, '14', 125, 'G-103', 'C-105', '1', '200000', '31600', '0', 31600, 'Paid', '2024-08-26 00:00:00', 0, '0', '0', 31600, 1, NULL, '2024-08-26 18:22:03', NULL),
(4, '6', 11, 'G-102', 'C-103', '1', '200000', '31833', '0', 31833, 'Paid', '2024-08-26 00:00:00', 0, '0', '0', 31833, 1, NULL, '2024-08-26 18:22:41', NULL),
(5, '8', 11, 'G-102', 'C-101', '1', '200000', '31833', '0', 31833, 'Paid', '2024-08-27 00:00:00', 0, '0', '0', 31833, 1, NULL, '2024-08-27 15:05:38', NULL),
(6, '13', 125, 'G-103', 'C-102', '1', '200000', '31600', '0', 31600, 'Paid', '2024-08-27 00:00:00', 0, '0', '0', 31600, 1, NULL, '2024-08-27 15:05:59', NULL),
(7, '1', 1, 'G-101', 'C-102', '1', '120000', '22080', '0', 22080, 'Payable', '2024-08-28 12:10:11', 1, '0', '0', 20000, 1, NULL, '2024-08-28 09:45:08', NULL),
(8, '1', 1, 'G-101', 'C-102', '1', '120000', '22080', '0', 2080, 'Paid', '2024-08-28 12:12:22', 1, '0', '0', 2080, 1, NULL, '2024-08-28 09:49:14', NULL),
(9, '2', 1, 'G-101', 'C-101', '1', '120000', '22080', '0', 22080, 'Payable', '2024-08-28 13:12:22', 1, '0', '0', 2200, 1, NULL, '2024-08-28 09:51:30', NULL),
(10, '7', 11, 'G-102', 'C-103', '1', '200000', '31833', '0', 31833, 'Payable', '2024-08-28 13:12:28', 1, '0', '0', 3183, 1, NULL, '2024-08-28 09:55:54', NULL),
(11, '2', 1, 'G-101', 'C-101', '1', '120000', '22080', '0', 19880, 'Payable', '2024-08-28 13:14:35', 2, '675685787678', '1', 2000, 1, NULL, '2024-08-28 10:28:47', NULL),
(12, '2', 1, 'G-101', 'C-101', '1', '120000', '22080', '0', 17880, 'Payable', '2024-08-28 13:15:23', 1, '', '0', 1000, 1, NULL, '2024-08-28 10:29:45', NULL),
(13, '2', 1, 'G-101', 'C-101', '1', '120000', '22080', '0', 16880, 'Paid', '2024-08-28 13:18:34', 2, '65756756756', '1', 16880, 1, NULL, '2024-08-28 10:30:14', NULL),
(14, '5', 1, 'G-101', 'C-104', '1', '120000', '22080', '0', 22080, 'Paid', '2024-08-28 14:22:22', 2, '220806786', '1', 22080, 1, NULL, '2024-08-28 11:33:30', NULL),
(15, '10', 11, 'G-102', 'C-104', '1', '200000', '31833', '0', 31833, 'Payable', '2024-08-28 14:23:22', 1, '', '0', 1000, 1, NULL, '2024-08-28 11:34:20', NULL),
(16, '10', 11, 'G-102', 'C-104', '1', '200000', '31833', '0', 30833, 'Payable', '2024-08-28 14:30:01', 2, '67568578767876', '2', 1000, 1, NULL, '2024-08-28 11:42:15', NULL),
(17, '7', 11, 'G-102', 'C-103', '1', '200000', '31833', '0', 28650, 'Payable', '2024-08-28 14:40:10', 1, '', '0', 3000, 1, NULL, '2024-08-28 15:42:29', NULL),
(18, '7', 11, 'G-102', 'C-103', '1', '200000', '31833', '0', 25650, 'Payable', '2024-08-28 15:01:10', 2, '456456456', '1', 2000, 1, NULL, '2024-08-28 15:42:50', NULL),
(19, '7', 11, 'G-102', 'C-103', '1', '200000', '31833', '0', 23650, 'Payable', '2024-08-28 16:12:22', 1, '', '0', 1000, 1, NULL, '2024-08-28 16:12:22', NULL),
(20, '9', 11, 'G-102', 'C-102', '1', '200000', '31833', '0', 31833, 'Payable', '2024-08-28 16:45:23', 1, '', '0', 833, 1, NULL, '2024-08-28 16:45:23', NULL),
(21, '9', 11, 'G-102', 'C-102', '1', '200000', '31833', '0', 31000, 'Payable', '2024-08-28 16:46:11', 2, '567567567', '1', 2000, 1, NULL, '2024-08-28 16:46:11', NULL),
(22, '7', 11, 'G-102', 'C-103', '1', '2,00,000', '31833', '0', 22650, 'Payable', '2024-08-28 17:41:23', 1, '', '0', 1000, 1, NULL, '2024-08-28 17:41:23', NULL),
(23, '30', 125, 'G-103', 'C-104', '1', '2,00,000', '31600', '0', 31600, 'Payable', '2024-08-28 17:43:01', 1, '', '0', 3000, 1, NULL, '2024-08-28 17:43:01', NULL),
(24, '4', 1, 'G-101', 'C-101', '1', '1,20,000', '22080', '0', 22080, 'Paid', '2024-08-29 13:31:04', 1, '', '0', 22080, 1, NULL, '2024-08-29 13:31:04', NULL),
(26, '12', 125, 'G-103', 'C-101', '1', '2,00,000', '31600', '0', 31600, 'Paid', '2024-08-29 17:43:07', 1, '', '0', 31600, 1, NULL, '2024-08-29 17:43:07', NULL),
(27, '30', 125, 'G-103', 'C-104', '1', '2,00,000', '31600', '0', 28600, 'Paid', '2024-08-29 17:43:37', 1, '', '0', 28600, 1, NULL, '2024-08-29 17:43:37', NULL),
(28, '10', 11, 'G-102', 'C-104', '1', '2,00,000', '31833', '0', 29833, 'Payable', '2024-08-29 17:43:53', 1, '', '0', 1000, 1, NULL, '2024-08-29 17:43:53', NULL),
(29, '9', 11, 'G-102', 'C-102', '1', '2,00,000', '31833', '0', 29000, 'Payable', '2024-08-29 18:19:27', 1, '', '0', 1000, 1, NULL, '2024-08-29 18:19:27', NULL),
(31, '3', 2, 'G-101', 'C-105', '2', '1,20,000', '30000', '0', 30000, 'Payable', '2024-09-02 11:40:06', 1, '', '0', 15000, 1, NULL, '2024-09-02 11:40:06', NULL),
(32, '3', 2, 'G-101', 'C-105', '2', '1,20,000', '30000', '0', 15000, 'Paid', '2024-09-02 11:40:59', 1, '', '0', 15000, 1, NULL, '2024-09-02 11:41:00', NULL),
(39, '14', 126, 'G-103', 'C-105', '2', '2,00,000', '41500', '0', 41500, 'Payable', '2024-09-03 12:44:37', 1, '', '0', 500, 1, NULL, '2024-09-03 12:44:38', NULL),
(42, '2', 2, 'G-101', 'C-101', '2', '1,20,000', '1200', '0', 1200, 'Paid', '2024-09-03 15:15:44', 1, '', '0', 1200, 1, NULL, '2024-09-03 15:15:44', NULL),
(43, '4', 2, 'G-101', 'C-101', '2', '1,20,000', '1200', '0', 1200, 'Paid', '2024-09-03 16:28:08', 1, '', '0', 1200, 1, NULL, '2024-09-03 16:28:09', NULL),
(44, '12', 126, 'G-103', 'C-101', '2', '2,00,000', '41500', '0', 41500, 'Paid', '2024-09-03 16:28:42', 1, '', '0', 41500, 1, NULL, '2024-09-03 16:28:42', NULL),
(45, '14', 126, 'G-103', 'C-105', '2', '2,00,000', '41500', '0', 41000, 'Paid', '2024-09-03 16:30:20', 1, '', '0', 41000, 1, NULL, '2024-09-03 16:30:20', NULL),
(46, '30', 126, 'G-103', 'C-104', '2', '2,00,000', '41500', '0', 41500, 'Payable', '2024-09-04 10:13:32', 1, '', '0', 10000, 1, NULL, '2024-09-04 10:13:31', NULL),
(47, '30', 126, 'G-103', 'C-104', '2', '2,00,000', '41500', '0', 31500, 'Payable', '2024-09-04 10:33:57', 1, '', '0', 2000, 1, NULL, '2024-09-04 10:33:56', NULL),
(48, '30', 126, 'G-103', 'C-104', '2', '2,00,000', '41500', '0', 29500, 'Payable', '2024-09-04 11:21:16', 1, '', '0', 1000, 1, NULL, '2024-09-04 11:21:15', NULL),
(50, '1', 2, 'G-101', 'C-102', '2', '1,20,000', '1200', '0', 1200, 'Payable', '2024-09-04 11:58:02', 1, '', '0', 200, 1, NULL, '2024-09-04 11:58:01', NULL),
(51, '9', 12, 'G-102', 'C-102', '2', '2,00,000', '0', '28000', 28000, 'Payable', '2024-09-04 12:24:13', 1, '', '0', 1000, 1, NULL, '2024-09-04 12:24:12', NULL),
(52, '9', 12, 'G-102', 'C-102', '2', '2,00,000', '0', '27000', 27000, 'Payable', '2024-09-05 11:50:49', 1, '', '0', 1000, 1, NULL, '2024-09-05 11:50:50', NULL),
(58, '7', 12, 'G-102', 'C-103', '2', '2,00,000', '0', '11650', 11650, 'Payable', '2024-09-05 12:51:10', 1, '', '0', 1650, 1, NULL, '2024-09-05 12:51:10', NULL),
(59, '39', 180, 'G-106', 'C-110', '1', '1,00,000', '4700', '0', 4700, 'Payable', '2024-09-05 12:52:11', 1, '', '0', 700, 1, NULL, '2024-09-05 12:52:11', NULL),
(62, '10', 12, 'G-102', 'C-104', '2', '2,00,000', '0', '28833', 28833, 'Payable', '2024-09-05 13:35:34', 1, '', '0', 1000, 1, NULL, '2024-09-05 13:35:35', NULL),
(63, '32', 180, 'G-106', 'C-101', '1', '1,00,000', '4700', '0', 4700, 'Paid', '2024-09-05 14:41:44', 1, '', '0', 4700, 1, NULL, '2024-09-05 14:41:44', NULL),
(65, '13', 126, 'G-103', 'C-102', '2', '2,00,000', '41500', '0', 41500, 'Paid', '2024-09-05 15:20:44', 1, '', '0', 41500, 1, NULL, '2024-09-05 15:20:44', NULL),
(66, '33', 180, 'G-106', 'C-102', '1', '1,00,000', '4700', '0', 4700, 'Paid', '2024-09-05 15:20:58', 1, '', '0', 4700, 1, NULL, '2024-09-05 15:20:58', NULL),
(67, '1', 2, 'G-101', 'C-102', '2', '1,20,000', '1200', '1000', 1000, 'Payable', '2024-09-05 15:21:08', 1, '', '0', 500, 1, NULL, '2024-09-05 15:21:09', NULL),
(68, '39', 180, 'G-106', 'C-110', '1', '1,00,000', '4700', '0', 4000, 'Paid', '2024-09-05 16:49:26', 1, '', '0', 4000, 1, NULL, '2024-09-05 16:49:26', NULL),
(69, '10', 12, 'G-102', 'C-104', '2', '2,00,000', '0', '27833', 27833, 'Payable', '2024-09-05 16:50:54', 1, '', '0', 833, 1, NULL, '2024-09-05 16:50:54', NULL),
(70, '18', 180, 'G-106', 'C-105', '1', '1,00,000', '4700', '0', 4700, 'Paid', '2024-09-05 17:08:09', 1, '', '0', 4700, 1, NULL, '2024-09-05 17:08:09', NULL),
(71, '7', 12, 'G-102', 'C-103', '2', '2,00,000', '0', '10000', 10000, 'Payable', '2024-09-05 17:19:56', 1, '', '0', 5000, 1, NULL, '2024-09-05 17:19:56', NULL),
(72, '17', 180, 'G-106', 'C-103', '1', '1,00,000', '4700', '0', 4700, 'Payable', '2024-09-05 17:20:30', 1, '', '0', 700, 1, NULL, '2024-09-05 17:20:30', NULL),
(73, '15', 126, 'G-103', 'C-103', '2', '2,00,000', '41500', '31600', 73100, 'Payable', '2024-09-05 17:24:52', 2, '5676575675675656', '1', 3100, 1, NULL, '2024-09-05 17:24:52', NULL),
(74, '1', 2, 'G-101', 'C-102', '2', '1,20,000', '1200', '500', 500, 'Payable', '2024-09-09 11:40:51', 1, '', '0', 400, 1, NULL, '2024-09-09 11:40:51', NULL),
(75, '1', 2, 'G-101', 'C-102', '2', '1,20,000', '1200', '100', 100, 'Paid', '2024-09-09 11:41:10', 2, '67867857856765464', '1', 100, 1, NULL, '2024-09-09 11:41:10', NULL),
(77, '36', 180, 'G-106', 'C-107', '1', '1,00,000', '4700', '0', 4700, 'Payable', '2024-09-12 11:01:43', 1, '', '', 4000, 1, NULL, '2024-09-12 11:01:42', NULL),
(78, '36', 180, 'G-106', 'C-107', '1', '1,00,000', '4700', '0', 700, 'Paid', '2024-09-12 11:02:49', 1, '', '', 700, 1, NULL, '2024-09-12 11:02:48', NULL),
(79, '35', 180, 'G-106', 'C-106', '1', '1,00,000', '4700', '0', 4700, 'Paid', '2024-09-18 12:17:25', 1, '', '', 4700, 1, NULL, '2024-09-18 12:17:25', NULL),
(83, '9', 12, 'G-102', 'C-102', '2', '2,00,000', '0', '26000', 26000, 'Payable', '2024-09-19 15:10:37', 1, '', '', 2000, 1, NULL, '2024-09-18 15:10:44', NULL),
(84, '9', 12, 'G-102', 'C-102', '2', '2,00,000', '0', '24000', 24000, 'Payable', '2024-09-19 15:11:50', 2, '67456456456', '1', 10000, 1, NULL, '2024-09-18 15:11:57', NULL),
(85, '9', 12, 'G-102', 'C-102', '2', '2,00,000', '0', '14000', 14000, 'Paid', '2024-09-19 15:15:08', 1, '', '', 14000, 1, NULL, '2024-09-18 15:15:15', NULL),
(86, '37', 180, 'G-106', 'C-108', '1', '1,00,000', '4700', '0', 4700, 'Payable', '2024-09-19 15:17:13', 1, '', '', 700, 1, NULL, '2024-09-18 15:17:20', NULL),
(87, '37', 180, 'G-106', 'C-108', '1', '1,00,000', '4700', '0', 4000, 'Paid', '2024-09-19 15:17:24', 1, '', '', 4000, 1, NULL, '2024-09-18 15:17:31', NULL),
(88, '15', 126, 'G-103', 'C-103', '2', '2,00,000', '41500', '70000', 70000, 'Payable', '2024-09-19 14:50:17', 1, '', '', 10000, 1, NULL, '2024-09-19 14:50:17', NULL),
(89, '15', 126, 'G-103', 'C-103', '2', '2,00,000', '41500', '60000', 60000, 'Payable', '2024-09-20 11:00:03', 1, '', '', 5000, 1, NULL, '2024-09-20 11:00:03', NULL),
(90, '17', 180, 'G-106', 'C-103', '1', '1,00,000', '4700', '0', 4000, 'Payable', '2024-09-20 11:00:24', 2, '7867567456565', '1', 1000, 1, NULL, '2024-09-20 11:00:24', NULL),
(91, '34', 180, 'G-106', 'C-104', '1', '1,00,000', '4700', '0', 4700, 'Payable', '2024-09-20 11:11:36', 1, '', '', 2000, 1, NULL, '2024-09-20 11:11:36', NULL),
(92, '15', 126, 'G-103', 'C-103', '2', '2,00,000', '41500', '55000', 55000, 'Payable', '2024-09-20 11:14:46', 2, '64646546464', '1', 5000, 1, NULL, '2024-09-20 11:14:46', NULL),
(95, '34', 180, 'G-106', 'C-104', '1', '1,00,000', '4700', '0', 2700, 'Paid', '2024-09-20 12:31:10', 1, '', '', 2700, 1, NULL, '2024-09-20 12:31:10', NULL),
(96, '30', 126, 'G-103', 'C-104', '2', '2,00,000', '41500', '28500', 28500, 'Paid', '2024-09-20 12:33:10', 1, '', '', 28500, 1, NULL, '2024-09-20 12:33:10', NULL),
(98, '15', 126, 'G-103', 'C-103', '2', '2,00,000', '41500', '50000', 50000, 'Payable', '2024-09-20 17:13:36', 1, '', '', 7000, 1, NULL, '2024-09-20 17:13:36', NULL),
(100, '7', 12, 'G-102', 'C-103', '2', '2,00,000', '32000', '5000', 47000, 'Payable', '2024-09-23 10:34:49', 1, '', '', 5000, 1, NULL, '2024-09-23 10:34:49', NULL),
(102, '7', 12, 'G-102', 'C-103', '2', '2,00,000', '32000', '42000', 42000, 'Payable', '2024-09-23 16:00:00', 1, '', '', 30000, 1, NULL, '2024-09-23 16:00:00', NULL),
(103, '10', 12, 'G-102', 'C-104', '2', '2,00,000', '32000', '27000', 59000, 'Payable', '2024-09-23 16:04:26', 1, '', '', 28000, 1, NULL, '2024-09-23 16:04:26', NULL),
(104, '17', 181, 'G-106', 'C-103', '2', '100000', '5000', '0', 8000, 'Paid', '2024-10-24 13:21:02', 1, '67657567567567', NULL, 8000, 1, 1, '2024-10-24 13:21:02', NULL),
(105, '17', 182, 'G-106', 'C-103', '3', '100000', '5000', '0', 5000, 'Payable', '2024-11-24 12:52:30', 1, NULL, NULL, 3000, 1, 1, '2024-11-24 12:52:30', NULL),
(106, '17', 183, 'G-106', 'C-103', '4', '100000', '5000', '0', 5000, 'Paid', '2024-12-25 12:52:30', 1, NULL, NULL, 5000, 1, 1, '2024-12-25 12:52:30', NULL),
(107, '38', 181, 'G-106', 'C-109', '2', '1,00,000', '5000', '4700', 9700, 'Paid', '2024-10-08 12:25:27', 1, '', '', 9700, 1, NULL, '2024-10-08 12:25:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `commitment_info`
--

CREATE TABLE `commitment_info` (
  `id` int(11) NOT NULL,
  `cus_mapping_id` int(11) NOT NULL,
  `group_id` varchar(100) NOT NULL,
  `label` varchar(100) NOT NULL,
  `remark` varchar(100) NOT NULL,
  `insert_login_id` int(100) NOT NULL,
  `created_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `commitment_info`
--

INSERT INTO `commitment_info` (`id`, `cus_mapping_id`, `group_id`, `label`, `remark`, `insert_login_id`, `created_on`) VALUES
(1, 2, 'G-101', 'Delay', 'sdf', 1, '2024-08-26'),
(2, 2, 'G-101', 'fgdfg', 'sdfs', 1, '2024-08-26'),
(4, 2, 'G-101', 'fgdfg', 'sdfs', 1, '2024-08-26'),
(7, 4, 'G-101', 'gfddag', 'sdfds', 1, '2024-08-26'),
(8, 4, 'G-101', 'we', 'fwer', 1, '2024-08-26'),
(10, 12, 'G-103', 'Delay', 'Financial issue', 1, '2024-09-30'),
(11, 2, 'G-101', 'Delay', 'fgd', 1, '2024-10-02');

-- --------------------------------------------------------

--
-- Table structure for table `company_creation`
--

CREATE TABLE `company_creation` (
  `id` int(11) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `state` int(100) DEFAULT NULL,
  `district` int(100) DEFAULT NULL,
  `taluk` int(100) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `mailid` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `landline_code` varchar(100) DEFAULT NULL,
  `landline` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `insert_user_id` int(11) DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  `updated_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `company_creation`
--

INSERT INTO `company_creation` (`id`, `company_name`, `address`, `state`, `district`, `taluk`, `place`, `pincode`, `website`, `mailid`, `mobile`, `whatsapp`, `landline_code`, `landline`, `status`, `insert_user_id`, `update_user_id`, `created_date`, `updated_date`) VALUES
(1, 'Feather Technology', 'Bussy Street', 2, 39, 313, 'Puducherry', '600765', 'feather.com', 'feather@gmail.com', '7896786786', '', '', '', 1, 1, 1, '2024-08-20 10:10:56', '2024-09-02');

-- --------------------------------------------------------

--
-- Table structure for table `customer_creation`
--

CREATE TABLE `customer_creation` (
  `id` int(11) NOT NULL,
  `reference_type` varchar(100) NOT NULL,
  `cus_name` varchar(100) NOT NULL,
  `ref_cus_id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `declaration` varchar(100) NOT NULL,
  `cus_id` varchar(100) NOT NULL,
  `aadhar_number` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `dob` date DEFAULT NULL,
  `age` int(100) DEFAULT NULL,
  `place` int(11) NOT NULL,
  `mobile1` varchar(100) NOT NULL,
  `mobile2` varchar(100) NOT NULL,
  `whatsapp` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `native_address` varchar(255) NOT NULL,
  `pic` varchar(100) NOT NULL,
  `tot_income` varchar(100) NOT NULL,
  `chit_limit` varchar(100) NOT NULL,
  `reference` varchar(100) NOT NULL,
  `insert_login_id` int(11) DEFAULT NULL,
  `update_login_id` int(11) DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `updated_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_creation`
--

INSERT INTO `customer_creation` (`id`, `reference_type`, `cus_name`, `ref_cus_id`, `name`, `mobile`, `declaration`, `cus_id`, `aadhar_number`, `first_name`, `last_name`, `dob`, `age`, `place`, `mobile1`, `mobile2`, `whatsapp`, `address`, `native_address`, `pic`, `tot_income`, `chit_limit`, `reference`, `insert_login_id`, `update_login_id`, `created_on`, `updated_on`) VALUES
(1, '1', '', '', '', '', 'asdasd', 'C-101', '534534535434', 'DHEEPIKA', 'A', '2000-10-30', 23, 1, '6786786787', '', '6786786787', 'kk nagar', '', '66c42e144e359.jpg', '20000', '100000', '1', 1, 1, '2024-08-20', '2024-09-30'),
(2, '2', '1', 'C-101', '', '', 'sdfs', 'C-102', '876867867867', 'Juan Francisco', 'García Flores', NULL, NULL, 4, '6575675675', '', '6575675675', 'mn nagar', '', '66c42e863a89b.png', '55000', '20000', '2', 1, 1, '2024-08-20', '2024-08-28'),
(3, '3', '1', 'C-101', 'Vanitha', '7896786786', 'sdfdf', 'C-103', '131231231231', 'Dheepa', 'S.B', NULL, NULL, 4, '6787686786', '', '6787686786', 'vv nagar', '', '66c42f208e982.jpg', '120000', '100000', '1', 1, 1, '2024-08-20', '2024-08-28'),
(4, '2', '1', 'C-101', '', '', '42342342', 'C-104', '546456564634', 'Jon', 'Souza Silva', NULL, NULL, 1, '8978978978', '', '8978978978', 'sdfsdf', '', '66c42f9fd69aa.jpg', '45000', '100000', '1', 1, 1, '2024-08-20', '2024-08-28'),
(5, '2', '4', 'C-104', '', '', 'jhgj', 'C-105', '453534543565', 'Rajalakshmi', 'A', NULL, NULL, 4, '7897897897', '', '7897897897', 'jj', '', '66c431d7d65ab.jpg', '430000', '200000', '1', 1, 1, '2024-08-20', '2024-08-28'),
(7, '2', '3', 'C-103', '', '', 'Good', 'C-106', '234234234234', 'Meera', 'S', NULL, NULL, 3, '8678678678', '8989089899', '8678678678', 'JJ Nagar', '', '66d009d8e9ec2.jpg', '67000', '100000', '1', 1, 1, '2024-08-29', '2024-08-29'),
(8, '1', '', '', '', '', 'known by advertisement ', 'C-107', '897997989878', 'Ram', 'Nishanth', NULL, NULL, 1, '8998897789', '7417447777', '8998897789', 'pondy', 'pondy', '66d58b46ea87f.png', '84000', '200000', '2', 1, NULL, '2024-09-02', NULL),
(9, '1', '', '', '', '', '', 'C-108', '852278845544', 'Raghul', 'Bharathi', NULL, NULL, 1, '9876756675', '', '9876756675', 'villiyanur', '', '66d5968444264.png', '120000', '200000', '2', 1, NULL, '2024-09-02', NULL),
(10, '', '', '', '', '', '', 'C-109', '975324323423', 'Lubi', 'Fresh', NULL, NULL, 4, '7845554545', '', '7845554545', 'pdy', '', '66d597bf57da1.jpg', '89000', '150000', '1', 1, NULL, '2024-09-02', NULL),
(11, '', '', '', '', '', '', 'C-110', '445785415487', 'Arunachalam', 'A', NULL, NULL, 3, '8974545454', '', '', 'pdy', '', '66d5982ea5d70.jpg', '98000', '200000', '1', 1, 1, '2024-09-02', '2024-09-21'),
(12, '1', '', '', '', '', 'xxxxxx', 'C-111', '100010001000', 'Acer', 'A', NULL, NULL, 1, '7897979889', '', '', 'SSSSS', '', '66e431925a939.png', '156542', '150000', '2', 1, NULL, '2024-09-13', NULL),
(13, '1', '', '', '', '', 'gu', 'C-112', '345345352423', 'Priya', 'A', NULL, NULL, 3, '8657675465', '', '8657675465', 'kk nagar', '', '66eeb93da5c4e.jpg', '10000', '150000', '1', 1, 1, '2024-09-21', '2024-09-21'),
(14, '2', '11', 'C-110', '', '', 'fg', 'C-113', '654656787888', 'Madhu', 'M', '1990-09-27', 34, 3, '6786786786', '', '6786786786', 'kk nagar', '', '66c42e144e359.jpg', '270000', '1000000', '1', 1, NULL, '2024-09-27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

CREATE TABLE `designation` (
  `id` int(11) NOT NULL,
  `designation` varchar(150) NOT NULL,
  `insert_login_id` int(11) DEFAULT NULL,
  `update_login_id` int(11) DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `updated_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `designation`
--

INSERT INTO `designation` (`id`, `designation`, `insert_login_id`, `update_login_id`, `created_on`, `updated_on`) VALUES
(1, 'Manager', 1, NULL, '2024-08-20', NULL),
(2, 'Hr', 1, NULL, '2024-08-20', NULL),
(3, 'Tester', 1, NULL, '2024-09-02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `district_name` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `state_id`, `district_name`, `status`) VALUES
(1, 1, 'Ariyalur', 1),
(2, 1, 'Chennai', 1),
(3, 1, 'Chengalpattu', 1),
(4, 1, 'Coimbatore', 1),
(5, 1, 'Cuddalore', 1),
(6, 1, 'Dharmapuri', 1),
(7, 1, 'Dindigul', 1),
(8, 1, 'Erode', 1),
(9, 1, 'Kallakurichi', 1),
(10, 1, 'Kancheepuram', 1),
(11, 1, 'Kanniyakumari', 1),
(12, 1, 'Karur', 1),
(13, 1, 'Krishnagiri', 1),
(14, 1, 'Madurai', 1),
(15, 1, 'Mayiladuthurai', 1),
(16, 1, 'Nagapattinam', 1),
(17, 1, 'Namakkal', 1),
(18, 1, 'Nilgiris', 1),
(19, 1, 'Perambalur', 1),
(20, 1, 'Pudukkottai', 1),
(21, 1, 'Ramanathapuram', 1),
(22, 1, 'Ranipet', 1),
(23, 1, 'Salem', 1),
(24, 1, 'Sivaganga', 1),
(25, 1, 'Tenkasi', 1),
(26, 1, 'Thanjavur', 1),
(27, 1, 'Theni', 1),
(28, 1, 'Thoothukudi', 1),
(29, 1, 'Tiruchirappalli', 1),
(30, 1, 'Tirunelveli', 1),
(31, 1, 'Tiruppur', 1),
(32, 1, 'Tirupathur', 1),
(33, 1, 'Tiruvallur', 1),
(34, 1, 'Tiruvannamalai', 1),
(35, 1, 'Tiruvarur', 1),
(36, 1, 'Vellore', 1),
(37, 1, 'Viluppuram', 1),
(38, 1, 'Virudhunagar', 1),
(39, 2, 'Puducherry', 1);

-- --------------------------------------------------------

--
-- Table structure for table `document_info`
--

CREATE TABLE `document_info` (
  `id` int(11) NOT NULL,
  `cus_id` varchar(100) NOT NULL,
  `auction_id` int(11) NOT NULL,
  `doc_name` varchar(150) NOT NULL,
  `doc_type` int(11) NOT NULL,
  `holder_name` varchar(100) DEFAULT NULL,
  `relationship` varchar(50) NOT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  `upload` varchar(100) NOT NULL,
  `noc_status` int(11) NOT NULL DEFAULT 0,
  `date_of_noc` date DEFAULT NULL,
  `noc_member` varchar(150) DEFAULT NULL,
  `noc_relationship` varchar(150) DEFAULT NULL,
  `insert_login_id` int(11) NOT NULL,
  `update_login_id` int(11) DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `updated_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `document_info`
--

INSERT INTO `document_info` (`id`, `cus_id`, `auction_id`, `doc_name`, `doc_type`, `holder_name`, `relationship`, `remarks`, `upload`, `noc_status`, `date_of_noc`, `noc_member`, `noc_relationship`, `insert_login_id`, `update_login_id`, `created_on`, `updated_on`) VALUES
(8, 'C-101', 1, 'Land', 1, '24', 'Daughter', 'fgfhgh', '66fcf5dd454a4.png', 1, '2024-10-02', '23', 'Mother', 1, 1, '2024-10-02', '2024-10-09'),
(15, 'C-101', 12, 'Aadhar card', 1, 'null', 'Customer', 'kjkjksd', '66fd3de2b3c80.png', 1, '2024-10-02', 'null', 'Customer', 1, 1, '2024-10-02', '2024-10-09'),
(18, 'C-101', 12, 'Own Land', 1, '23', 'Mother', 'cxcv', '66fe427cc0201.png', 1, '2024-10-03', '24', 'Daughter', 1, 1, '2024-10-03', '2024-10-09'),
(25, 'C-111', 194, 'Aadhar card', 1, 'null', 'Customer', 'asdas', '66fe8bd3e52f8.png', 0, NULL, NULL, NULL, 1, NULL, '2024-10-03', NULL),
(31, 'C-111', 195, 'Land', 1, 'null', 'Customer', 'dfgd', '', 0, NULL, NULL, NULL, 1, NULL, '2024-10-09', NULL),
(34, 'C-101', 2, 'Land', 1, '23', 'Mother', 'rfdgjk', '6706294796fa0.png', 0, NULL, NULL, NULL, 1, 1, '2024-10-09', '2024-10-09');

-- --------------------------------------------------------

--
-- Table structure for table `enquiry_creation`
--

CREATE TABLE `enquiry_creation` (
  `id` int(11) NOT NULL,
  `chit_value` int(150) NOT NULL,
  `total_month` int(50) NOT NULL,
  `insert_login_id` int(11) NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enquiry_creation`
--

INSERT INTO `enquiry_creation` (`id`, `chit_value`, `total_month`, `insert_login_id`, `created_on`) VALUES
(8, 200000, 16, 1, '2024-09-04'),
(9, 200000, 13, 1, '2024-09-05');

-- --------------------------------------------------------

--
-- Table structure for table `enquiry_creation_customer`
--

CREATE TABLE `enquiry_creation_customer` (
  `id` int(11) NOT NULL,
  `enquiry_creation_id` int(11) NOT NULL,
  `cus_name` varchar(150) NOT NULL,
  `cus_status` int(11) NOT NULL,
  `mobile_number` varchar(250) NOT NULL,
  `place` varchar(150) NOT NULL,
  `remarks` varchar(250) NOT NULL,
  `insert_login_id` int(11) NOT NULL,
  `creater_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enquiry_creation_customer`
--

INSERT INTO `enquiry_creation_customer` (`id`, `enquiry_creation_id`, `cus_name`, `cus_status`, `mobile_number`, `place`, `remarks`, `insert_login_id`, `creater_on`) VALUES
(2, 1, 'Super Admin', 1, '8678678786', 'Ariyur ', 'jhh', 1, '2024-09-04'),
(3, 2, 'tryrt', 2, '8798978978', 'Pondy ', 'ghjhj', 1, '2024-09-04'),
(4, 3, 'dfd', 2, '7897897897', 'villianur ', '67567', 1, '2024-09-04'),
(6, 5, 'Super Admin', 2, '6575676575', 'villianur ', '787', 1, '2024-09-04'),
(7, 8, 'Vanitha', 1, '8786867867', 'Pondy ', 'good', 1, '2024-09-12');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `coll_mode` int(11) NOT NULL,
  `bank_id` varchar(11) DEFAULT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `branch` int(11) NOT NULL,
  `expenses_category` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `amount` varchar(150) NOT NULL,
  `trans_id` varchar(150) NOT NULL,
  `insert_login_id` int(11) NOT NULL,
  `created_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `family_info`
--

CREATE TABLE `family_info` (
  `id` int(11) NOT NULL,
  `cus_id` varchar(100) NOT NULL,
  `fam_name` varchar(100) NOT NULL,
  `fam_relationship` varchar(100) NOT NULL,
  `fam_age` varchar(100) DEFAULT NULL,
  `fam_live` varchar(100) DEFAULT NULL,
  `fam_occupation` varchar(100) DEFAULT NULL,
  `fam_aadhar` varchar(100) DEFAULT NULL,
  `fam_mobile` varchar(100) NOT NULL,
  `insert_login_id` int(11) DEFAULT NULL,
  `update_login_id` int(11) DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `updated_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `family_info`
--

INSERT INTO `family_info` (`id`, `cus_id`, `fam_name`, `fam_relationship`, `fam_age`, `fam_live`, `fam_occupation`, `fam_aadhar`, `fam_mobile`, `insert_login_id`, `update_login_id`, `created_on`, `updated_on`) VALUES
(1, 'C-101', 'Aakash', 'Father', '45', '1', '', '546456456456', '7564563453', 1, NULL, '2024-08-20', NULL),
(2, 'C-102', 'meera', 'Mother', '45', '1', '', '423423423434', '8678678678', 1, NULL, '2024-08-20', NULL),
(3, 'C-103', 'mithun', 'Son', '21', '1', 'Teacher', '432423432432', '8906756756', 1, NULL, '2024-08-20', NULL),
(4, 'C-104', 'siva', 'Father', '45', '1', 'Doctor', '567567567567', '7567567567', 1, NULL, '2024-08-20', NULL),
(5, 'C-105', 'seran', 'Son', '24', '1', '', '756756756767', '7567547576', 1, NULL, '2024-08-20', NULL),
(6, 'C-106', 'Dhiviya', 'Mother', '45', '1', 'Teacher', '565756756767', '8676786786', 1, 1, '2024-08-28', '2024-08-29'),
(8, 'C-101', 'Aksaas', 'Mother', '21', '2', '', '575675675676', '8986354564', 1, NULL, '2024-08-29', NULL),
(9, 'C-107', 'Bharathi', 'Brother', '25', '1', 'VIP', '798779978978', '7878787878', 1, NULL, '2024-09-02', NULL),
(11, 'C-108', 'Bharathi', 'Father', '55', '1', '', '353434223423', '9787658565', 1, NULL, '2024-09-02', NULL),
(12, 'C-109', 'Lub', 'Father', '60', '1', '', '432321132132', '9121213322', 1, NULL, '2024-09-02', NULL),
(13, 'C-110', 'Arun', 'Father', '60', '1', '', '787845454545', '7448747848', 1, NULL, '2024-09-02', NULL),
(14, 'C-111', 'Madhan', 'Father', '55', '1', 'QWE', '220022002200', '8978987897', 1, 1, '2024-09-13', '2024-10-03'),
(15, 'C-101', 'Thenu', 'Daughter', '', '1', '', '897897897897', '6786878678', 1, NULL, '2024-09-19', NULL),
(17, 'C-102', 'kaanagi', 'Father', '', '1', '', '897907987908', '9678687877', 1, NULL, '2024-09-19', NULL),
(21, 'C-112', 'kaviya', 'Mother', '', '1', '', '764132345435', '9765765675', 1, NULL, '2024-09-21', NULL),
(22, 'C-113', 'Jeeva', 'Father', '', '', '', '', '7867665756', 1, 1, '2024-09-27', '2024-09-27'),
(25, 'C-114', 'Meera', 'Mother', '', '', '', '', '6756567456', 1, NULL, '2024-10-02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `group_creation`
--

CREATE TABLE `group_creation` (
  `id` int(11) NOT NULL,
  `grp_id` varchar(100) NOT NULL,
  `grp_name` varchar(255) NOT NULL,
  `chit_value` bigint(11) NOT NULL,
  `date` int(11) NOT NULL,
  `commission` int(11) NOT NULL,
  `hours` int(11) NOT NULL,
  `minutes` int(11) NOT NULL,
  `ampm` varchar(10) NOT NULL,
  `total_members` int(11) NOT NULL,
  `total_months` int(11) NOT NULL,
  `start_month` varchar(50) NOT NULL,
  `end_month` varchar(50) NOT NULL,
  `branch` int(11) NOT NULL,
  `grace_period` int(11) NOT NULL,
  `status` varchar(100) NOT NULL,
  `insert_login_id` int(11) DEFAULT NULL,
  `update_login_id` int(11) DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `updated_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `group_creation`
--

INSERT INTO `group_creation` (`id`, `grp_id`, `grp_name`, `chit_value`, `date`, `commission`, `hours`, `minutes`, `ampm`, `total_members`, `total_months`, `start_month`, `end_month`, `branch`, `grace_period`, `status`, `insert_login_id`, `update_login_id`, `created_on`, `updated_on`) VALUES
(1, 'G-101', 'ABC', 120000, 22, 2, 12, 23, 'AM', 5, 10, '2024-08', '2025-05', 1, 2, '3', 1, 1, '2024-08-23', '2024-08-23'),
(2, 'G-102', 'Bandham', 200000, 19, 3, 3, 34, 'PM', 6, 5, '2024-08', '2024-12', 2, 4, '4', 1, 1, '2024-08-23', '2024-10-08'),
(3, 'G-103', 'acfa', 200000, 19, 4, 3, 30, 'AM', 5, 5, '2024-08', '2024-12', 1, 3, '3', 1, 1, '2024-08-23', '2024-10-09'),
(4, 'G-104', 'GHi', 300000, 4, 2, 12, 34, 'AM', 6, 3, '2024-08', '2024-10', 2, 4, '1', 1, NULL, '2024-08-23', NULL),
(5, 'G-105', 'gds', 250000, 5, 2, 12, 22, 'AM', 10, 3, '2024-09', '2024-11', 1, 1, '1', 1, 1, '2024-08-26', '2024-08-26'),
(6, 'G-106', 'orupa chit', 100000, 5, 2, 6, 10, 'PM', 10, 10, '2024-09', '2025-06', 1, 5, '3', 1, 1, '2024-09-02', '2024-09-21'),
(7, 'G-107', 'kk', 50000, 22, 2, 1, 50, 'PM', 5, 8, '2024-09', '2025-04', 1, 3, '3', 1, 1, '2024-09-21', '2024-10-07');

-- --------------------------------------------------------

--
-- Table structure for table `group_cus_mapping`
--

CREATE TABLE `group_cus_mapping` (
  `id` int(11) NOT NULL,
  `grp_creation_id` varchar(100) NOT NULL,
  `cus_id` int(11) NOT NULL,
  `joining_month` varchar(100) DEFAULT NULL,
  `insert_login_id` int(11) NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `group_cus_mapping`
--

INSERT INTO `group_cus_mapping` (`id`, `grp_creation_id`, `cus_id`, `joining_month`, `insert_login_id`, `created_on`) VALUES
(1, 'G-101', 2, '1', 1, '2024-08-23'),
(2, 'G-101', 1, '1', 1, '2024-08-23'),
(3, 'G-101', 5, '1', 1, '2024-08-23'),
(4, 'G-101', 1, '1', 1, '2024-08-23'),
(5, 'G-101', 4, '1', 1, '2024-08-23'),
(6, 'G-102', 3, '1', 1, '2024-08-23'),
(7, 'G-102', 3, '1', 1, '2024-08-23'),
(8, 'G-102', 1, '1', 1, '2024-08-23'),
(9, 'G-102', 2, '1', 1, '2024-08-23'),
(10, 'G-102', 4, '1', 1, '2024-08-23'),
(12, 'G-103', 1, '1', 1, '2024-08-23'),
(13, 'G-103', 2, '1', 1, '2024-08-23'),
(14, 'G-103', 5, '1', 1, '2024-08-23'),
(15, 'G-103', 3, '1', 1, '2024-08-23'),
(17, 'G-106', 3, '1', 1, '2024-08-26'),
(18, 'G-106', 5, '1', 1, '2024-08-26'),
(23, 'G-104', 1, '1', 1, '2024-08-26'),
(30, 'G-103', 4, '1', 1, '2024-08-26'),
(32, 'G-106', 1, '1', 1, '2024-09-02'),
(33, 'G-106', 2, '1', 1, '2024-09-02'),
(34, 'G-106', 4, '1', 1, '2024-09-02'),
(35, 'G-106', 7, '1', 1, '2024-09-02'),
(36, 'G-106', 8, '1', 1, '2024-09-02'),
(37, 'G-106', 9, '1', 1, '2024-09-02'),
(38, 'G-106', 10, '1', 1, '2024-09-02'),
(39, 'G-106', 11, '1', 1, '2024-09-02'),
(40, 'G-104', 7, '1', 1, '2024-09-04'),
(66, 'G-107', 9, '2', 1, '2024-09-21'),
(67, 'G-107', 12, '1', 1, '2024-09-21'),
(68, 'G-107', 12, '1', 1, '2024-09-21'),
(69, 'G-107', 8, '2', 1, '2024-09-21'),
(73, 'G-107', 11, '3', 1, '2024-09-23');

-- --------------------------------------------------------

--
-- Table structure for table `guarantor_info`
--

CREATE TABLE `guarantor_info` (
  `id` int(11) NOT NULL,
  `cus_id` varchar(100) NOT NULL,
  `relationship_type` varchar(100) NOT NULL,
  `family_id` varchar(100) NOT NULL,
  `existing_cus_id` varchar(100) NOT NULL,
  `guarantor_name` varchar(100) NOT NULL,
  `guarantor_relationship` varchar(100) NOT NULL,
  `details` varchar(100) NOT NULL,
  `gu_pic` varchar(100) NOT NULL,
  `insert_login_id` int(11) DEFAULT NULL,
  `update_login_id` int(11) DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `updated_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `guarantor_info`
--

INSERT INTO `guarantor_info` (`id`, `cus_id`, `relationship_type`, `family_id`, `existing_cus_id`, `guarantor_name`, `guarantor_relationship`, `details`, `gu_pic`, `insert_login_id`, `update_login_id`, `created_on`, `updated_on`) VALUES
(1, 'C-101', '3', '1', '', 'Aakash', 'Father', '', '', 1, NULL, '2024-08-20', NULL),
(2, 'C-102', '2', '', '', 'Anu', 'Other', 'sister', '', 1, NULL, '2024-08-20', NULL),
(3, 'C-103', '1', '', '1', 'DHEEPIKA', 'Existing Customer', '', '66c42f10f2132.jpg', 1, NULL, '2024-08-20', NULL),
(4, 'C-104', '3', '4', '', 'siva', 'Father', '', '66c42f9b599c4.jpg', 1, NULL, '2024-08-20', NULL),
(5, 'C-105', '3', '5', '', 'seran', 'Son', '', '', 1, NULL, '2024-08-20', NULL),
(7, 'C-106', '1', '', '5', 'Rajalakshmi A', 'Existing Customer', '', '66d00aa7ed52c.jpg', 1, 1, '2024-08-29', '2024-09-30'),
(9, 'C-107', '3', '9', '', 'Bharathi', 'Brother', '', '', 1, NULL, '2024-09-02', NULL),
(10, 'C-108', '3', '11', '', 'Bharathi', 'Father', '', '', 1, NULL, '2024-09-02', NULL),
(11, 'C-109', '3', '12', '', 'Lub', 'Father', '', '', 1, NULL, '2024-09-02', NULL),
(12, 'C-110', '3', '13', '', 'Arun', 'Father', '', '', 1, NULL, '2024-09-02', NULL),
(16, 'C-111', '3', '14', '', 'Madhan', 'Father', '', '', 1, NULL, '2024-09-13', NULL),
(20, 'C-112', '3', '21', '', 'kaviya', 'Mother', '', '', 1, NULL, '2024-09-21', NULL),
(21, 'C-113', '1', '', '11', 'Arunachalam A', 'Existing Customer', '', '', 1, NULL, '2024-09-27', NULL),
(23, 'C-101', '3', '8', '', 'Aksaas', 'Mother', '', '', 1, NULL, '2024-09-30', NULL),
(24, 'C-101', '3', '15', '', 'Thenu', 'Daughter', '', '', 1, NULL, '2024-09-30', NULL),
(26, 'C-102', '1', '', '4', 'Jon Souza Silva', 'Existing Customer', '', '', 1, NULL, '2024-09-30', NULL),
(27, 'C-102', '2', '', '', 'kani', 'Other', 'sdf', '', 1, NULL, '2024-09-30', NULL),
(28, 'C-102', '3', '2', '', 'meera', 'Mother', '', '', 1, NULL, '2024-09-30', NULL),
(29, 'C-106', '3', '6', '', 'Dhiviya', 'Mother', '', '', 1, NULL, '2024-09-30', NULL),
(30, 'C-106', '2', '', '', 'latha', 'Other', 'fh', '', 1, NULL, '2024-09-30', NULL),
(32, 'C-104', '1', '', '10', 'Lubi Fresh', 'Existing Customer', '', '', 1, NULL, '2024-10-01', NULL),
(33, 'C-104', '2', '', '', 'meenu', 'Other', 'sdf', '', 1, NULL, '2024-10-01', NULL),
(34, 'C-114', '3', '25', '', 'Meera', 'Mother', '', '', 1, NULL, '2024-10-02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menu_list`
--

CREATE TABLE `menu_list` (
  `id` int(11) NOT NULL,
  `menu` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  `icon` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='All Main Menu''s will be placed here';

--
-- Dumping data for table `menu_list`
--

INSERT INTO `menu_list` (`id`, `menu`, `link`, `icon`) VALUES
(1, 'Dashboard', 'dashboard', 'developer_board'),
(2, 'Master', 'master', 'camera1'),
(3, 'Administration', 'admin', 'layers'),
(4, 'Auction', 'auction', 'wallet'),
(5, 'Settlement', 'settlement', 'uninstall'),
(6, 'Collection', 'collection', 'credit'),
(7, 'Accounts', 'accounts', 'domain'),
(8, 'Customer Data', 'customer_data', 'folder_shared'),
(9, 'Group Summary', 'group_summary', 'share1'),
(16, 'Enquiry', 'enquiry', 'ring_volume');

-- --------------------------------------------------------

--
-- Table structure for table `noc`
--

CREATE TABLE `noc` (
  `id` int(11) NOT NULL,
  `doc_id` int(11) NOT NULL,
  `cus_id` varchar(100) NOT NULL,
  `document_list` int(11) NOT NULL DEFAULT 0,
  `noc_status` int(11) NOT NULL DEFAULT 0,
  `insert_login_id` int(11) NOT NULL,
  `update_login_id` int(11) DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `updated_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `noc`
--

INSERT INTO `noc` (`id`, `doc_id`, `cus_id`, `document_list`, `noc_status`, `insert_login_id`, `update_login_id`, `created_on`, `updated_on`) VALUES
(1, 8, '0', 2, 2, 1, NULL, '2024-10-02', NULL),
(5, 15, 'C-101', 2, 2, 1, NULL, '2024-10-02', NULL),
(6, 18, 'C-101', 2, 2, 1, NULL, '2024-10-03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `noc_ref`
--

CREATE TABLE `noc_ref` (
  `id` int(11) NOT NULL,
  `noc_id` int(11) NOT NULL,
  `date_of_noc` date NOT NULL,
  `noc_member` varchar(150) NOT NULL,
  `noc_relationship` varchar(150) NOT NULL,
  `created_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `noc_ref`
--

INSERT INTO `noc_ref` (`id`, `noc_id`, `date_of_noc`, `noc_member`, `noc_relationship`, `created_on`) VALUES
(1, 1, '2024-10-02', '23', 'Mother', '2024-10-02'),
(5, 5, '2024-10-02', 'null', 'Customer', '2024-10-02'),
(6, 6, '2024-10-03', '24', 'Daughter', '2024-10-03');

-- --------------------------------------------------------

--
-- Table structure for table `other_transaction`
--

CREATE TABLE `other_transaction` (
  `id` int(11) NOT NULL,
  `coll_mode` int(11) NOT NULL,
  `bank_id` varchar(50) DEFAULT NULL,
  `trans_cat` int(11) NOT NULL,
  `group_id` varchar(100) DEFAULT NULL,
  `name` int(11) NOT NULL,
  `group_mem` varchar(11) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `ref_id` varchar(100) DEFAULT NULL,
  `trans_id` varchar(100) NOT NULL,
  `user_name` int(11) DEFAULT NULL,
  `amount` varchar(150) NOT NULL,
  `auction_month` varchar(11) DEFAULT NULL,
  `remark` varchar(255) NOT NULL,
  `insert_login_id` int(11) NOT NULL,
  `created_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `other_transaction`
--

INSERT INTO `other_transaction` (`id`, `coll_mode`, `bank_id`, `trans_cat`, `group_id`, `name`, `group_mem`, `type`, `ref_id`, `trans_id`, `user_name`, `amount`, `auction_month`, `remark`, `insert_login_id`, `created_on`) VALUES
(1, 1, '', 3, NULL, 4, NULL, 1, 'EL-101', '', NULL, '500000', NULL, 'dfgdf', 1, '2024-09-11 18:04:28'),
(2, 1, '', 4, NULL, 3, NULL, 2, 'EXC-101', '', NULL, '200000', NULL, 'fghfgh', 1, '2024-09-11 18:04:55'),
(3, 1, '', 4, NULL, 3, NULL, 2, 'EXC-102', '', NULL, '10000', NULL, 'fgfg', 1, '2024-09-11 18:05:20'),
(4, 1, '', 4, NULL, 3, NULL, 1, 'EXC-103', '', NULL, '170000', NULL, 'sadas', 1, '2024-09-11 18:05:49'),
(5, 1, '', 9, NULL, 7, NULL, 1, 'UBL-101', '', NULL, '50000', NULL, 'fghg', 1, '2024-09-11 18:06:26'),
(6, 1, '', 4, NULL, 3, NULL, 1, 'EXC-104', '', NULL, '40000', NULL, 'asfd', 1, '2024-09-11 18:07:44'),
(7, 1, '', 4, NULL, 3, NULL, 1, 'EXC-105', '', NULL, '10000', NULL, 'dfgdf', 1, '2024-09-11 18:08:01'),
(8, 2, '1', 6, NULL, 8, NULL, 1, 'BWDL-101', '6765756', NULL, '300000', NULL, 'gdf', 1, '2024-09-11 18:09:51'),
(9, 2, '1', 4, NULL, 3, NULL, 2, 'EXC-106', '5654645', NULL, '10000', NULL, 'dfsgf', 1, '2024-09-11 18:10:22'),
(12, 2, '1', 4, NULL, 3, NULL, 2, 'EXC-109', '678678', NULL, '50000', NULL, 'ghfgh', 1, '2024-09-11 18:27:05'),
(13, 2, '1', 4, NULL, 3, NULL, 2, 'EXC-110', '5000056', NULL, '50000', NULL, 'ghgf', 1, '2024-09-11 18:33:30'),
(14, 1, '', 1, NULL, 2, NULL, 1, 'DEP-101', '', NULL, '10000', NULL, 'ghf', 1, '2024-09-12 10:08:01'),
(18, 1, '', 1, NULL, 2, NULL, 1, 'DEP-102', '', NULL, '2000', NULL, 'jhjg', 1, '2024-09-19 10:30:18'),
(19, 1, '', 1, NULL, 2, NULL, 1, 'DEP-103', '', NULL, '10000', NULL, 'hj', 1, '2024-09-19 14:50:58'),
(20, 2, '1', 1, NULL, 6, NULL, 1, 'DEP-104', '745754676', NULL, '5000', NULL, 'fghf', 1, '2024-09-19 15:21:38'),
(22, 1, '', 8, NULL, 9, NULL, 1, 'INC-101', '', NULL, '1000', NULL, 'df', 1, '2024-09-20 10:58:53'),
(24, 1, '', 7, NULL, 10, NULL, 2, 'ADV-101', '', NULL, '100', NULL, 'jghj', 1, '2024-09-21 16:54:33'),
(25, 1, '', 4, NULL, 3, NULL, 1, 'EXC-111', '', NULL, '5000', NULL, 'yui', 1, '2024-09-23 09:39:03'),
(26, 1, '', 7, NULL, 10, NULL, 2, 'ADV-102', '', NULL, '100', NULL, 'hgyh', 1, '2024-09-23 17:14:26'),
(27, 1, '', 3, NULL, 11, NULL, 1, 'EL-102', '', NULL, '10000', NULL, 'dfs', 1, '2024-09-26 15:16:28'),
(30, 1, '', 3, NULL, 11, NULL, 1, 'EL-103', '', NULL, '5000', NULL, 'jhkjjk', 1, '2024-09-26 17:19:45'),
(31, 1, '', 3, NULL, 11, NULL, 1, 'EL-104', '', NULL, '9000', NULL, 'ioioio', 1, '2024-09-26 17:20:18'),
(32, 1, '', 3, NULL, 12, NULL, 1, 'EL-105', '', NULL, '70000', NULL, 'fghfg', 1, '2024-09-26 17:22:34'),
(66, 1, '', 4, '', 3, '0', 1, 'EXC-112', '', NULL, '95000', '0', 'fgh', 1, '2024-09-30 11:23:14'),
(67, 1, '', 3, '', 4, '0', 1, 'EL-106', '', NULL, '5000', '0', 'gjhg', 1, '2024-09-30 11:23:29'),
(68, 1, '', 7, 'G-101', 0, '2', 2, 'ADV-103', '', NULL, '98000', '2', 'fghjj', 1, '2024-09-30 11:24:00'),
(70, 1, '', 3, '', 15, '0', 1, 'EL-107', '', NULL, '90000', '0', '', 1, '2024-10-01 12:38:58'),
(72, 1, '', 3, '', 15, '0', 1, 'EL-109', '', NULL, '50000', '0', 'jjk', 1, '2024-10-01 12:40:14'),
(73, 1, '', 3, '', 16, '0', 2, 'EL-110', '', NULL, '30000', '0', 'fgfghfg', 1, '2024-10-01 12:41:52'),
(74, 1, '', 3, '', 16, '0', 2, 'EL-111', '', NULL, '5000', '0', 'hj', 1, '2024-10-01 12:42:07'),
(75, 1, '', 3, '', 16, '0', 1, 'EL-112', '', NULL, '35000', '0', 'fghg', 1, '2024-10-01 12:42:51'),
(76, 1, '', 3, '', 16, '0', 1, 'EL-113', '', NULL, '100000', '0', 'gfh', 1, '2024-10-01 12:43:20'),
(81, 1, '', 4, '', 17, '0', 1, 'EXC-114', '', NULL, '50000', NULL, 'dfgdf', 1, '2024-10-03 10:46:47'),
(86, 1, '', 3, '', 16, '0', 2, 'EL-114', '', NULL, '1000', NULL, 'ghjj', 1, '2024-10-03 11:19:04'),
(93, 1, '', 4, '', 17, '0', 1, 'EXC-115', '', NULL, '50000', '0', 'vvd', 1, '2024-10-03 11:33:12'),
(95, 1, '', 7, 'G-106', 0, '10', 2, 'ADV-104', '', NULL, '35000', '2', 'gfjhg', 1, '2024-10-03 11:39:14'),
(96, 1, '', 7, 'G-106', 0, '10', 1, 'ADV-105', '', NULL, '35000', '2', 'gghh', 1, '2024-10-03 11:43:43'),
(99, 1, '', 4, '', 17, '', 2, 'EXC-116', '', NULL, '1000', '', 'cvbc', 1, '2024-10-03 11:49:56'),
(101, 1, '', 7, 'G-106', 0, '7', 1, 'ADV-106', '', NULL, '35000', '2', 'hgj', 1, '2024-10-07 18:29:29'),
(102, 1, '', 4, '', 18, '', 1, 'EXC-117', '', NULL, '200000', '', 'dfgh', 1, '2024-10-08 09:46:20'),
(109, 1, '', 7, 'G-107', 0, '8', 2, 'ADV-107', '', NULL, '43800', '2', 'dfg', 1, '2024-10-09 10:38:58'),
(119, 1, '', 7, 'G-102', 0, '3', 2, 'ADV-108', '', NULL, '200000', '3', 'hjkk', 1, '2024-10-09 17:40:56');

-- --------------------------------------------------------

--
-- Table structure for table `other_trans_name`
--

CREATE TABLE `other_trans_name` (
  `id` int(11) NOT NULL,
  `trans_cat` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `insert_login_id` int(11) NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `other_trans_name`
--

INSERT INTO `other_trans_name` (`id`, `trans_cat`, `name`, `insert_login_id`, `created_on`) VALUES
(1, 2, 'Anu', 1, '2024-08-27'),
(2, 1, 'Anu', 1, '2024-08-27'),
(3, 4, 'devi', 1, '2024-08-27'),
(4, 3, 'Rajie', 1, '2024-08-27'),
(5, 5, 'vijay', 1, '2024-08-28'),
(6, 1, 'Teju', 1, '2024-09-10'),
(7, 9, 'Thiru', 1, '2024-09-11'),
(8, 6, 'yuva', 1, '2024-09-11'),
(9, 8, 'Gayathri', 1, '2024-09-20'),
(10, 7, ' trisha', 1, '2024-09-21'),
(11, 3, 'kani', 1, '2024-09-26'),
(12, 3, 'meera', 1, '2024-09-26'),
(13, 8, 'kumar', 1, '2024-09-27'),
(14, 5, 'karan', 1, '2024-09-27'),
(15, 3, 'lava', 1, '2024-09-27'),
(16, 3, 'meenu', 1, '2024-10-01'),
(17, 4, 'Man', 1, '2024-10-03'),
(18, 4, 'Mani', 1, '2024-10-08');

-- --------------------------------------------------------

--
-- Table structure for table `place`
--

CREATE TABLE `place` (
  `id` int(11) NOT NULL,
  `place` varchar(150) NOT NULL,
  `insert_login_id` int(11) DEFAULT NULL,
  `update_login_id` int(11) DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `updated_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `place`
--

INSERT INTO `place` (`id`, `place`, `insert_login_id`, `update_login_id`, `created_on`, `updated_on`) VALUES
(1, 'villianur', 1, NULL, '2024-08-20', NULL),
(3, 'IG', 1, NULL, '2024-08-29', NULL),
(4, 'Ariyur', 1, NULL, '2024-08-29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role` varchar(150) NOT NULL,
  `insert_login_id` int(11) NOT NULL,
  `update_login_id` int(11) DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `updated_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `role`, `insert_login_id`, `update_login_id`, `created_on`, `updated_on`) VALUES
(1, 'HR', 1, NULL, '2024-08-20', NULL),
(2, 'Testing', 1, NULL, '2024-09-02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settlement_info`
--

CREATE TABLE `settlement_info` (
  `id` int(11) NOT NULL,
  `auction_id` int(11) NOT NULL,
  `settle_date` date NOT NULL,
  `group_id` varchar(100) DEFAULT NULL,
  `cus_name` varchar(100) DEFAULT NULL,
  `auction_month` int(11) DEFAULT NULL,
  `settle_amount` varchar(100) NOT NULL,
  `settle_balance` varchar(100) NOT NULL,
  `payment_type` varchar(100) NOT NULL,
  `settle_type` varchar(100) NOT NULL,
  `bank_id` varchar(100) DEFAULT NULL,
  `settle_cash` varchar(100) DEFAULT NULL,
  `cheque_no` varchar(100) DEFAULT NULL,
  `cheque_val` varchar(100) DEFAULT NULL,
  `cheque_remark` varchar(100) DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `transaction_val` varchar(100) DEFAULT NULL,
  `transaction_remark` varchar(100) DEFAULT NULL,
  `balance_amount` varchar(100) DEFAULT NULL,
  `guarantor_name` int(11) NOT NULL,
  `guarantor_relationship` varchar(100) NOT NULL,
  `insert_login_id` int(11) DEFAULT NULL,
  `update_login_id` int(11) DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `updated_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settlement_info`
--

INSERT INTO `settlement_info` (`id`, `auction_id`, `settle_date`, `group_id`, `cus_name`, `auction_month`, `settle_amount`, `settle_balance`, `payment_type`, `settle_type`, `bank_id`, `settle_cash`, `cheque_no`, `cheque_val`, `cheque_remark`, `transaction_id`, `transaction_val`, `transaction_remark`, `balance_amount`, `guarantor_name`, `guarantor_relationship`, `insert_login_id`, `update_login_id`, `created_on`, `updated_on`) VALUES
(1, 11, '2024-08-26', 'G-102', '4', NULL, '185000', '185000', '1', '', '1', '0', '786896', '10000', '', '', '0', '', '175000', 4, 'Father', 1, NULL, '2024-08-26', NULL),
(2, 125, '2024-08-26', 'G-103', '1', NULL, '150000', '150000', '1', '', '1', '25000', '', '0', '', '567587785', '25000', '', '100000', 1, 'Father', 1, NULL, '2024-08-26', NULL),
(3, 125, '2024-08-26', 'G-103', '1', NULL, '150000', '100000', '1', '', '1', '10000', '675675675', '20000', '', '64645746', '20000', '', '50000', 1, 'Father', 1, NULL, '2024-08-26', NULL),
(4, 125, '2024-08-26', 'G-103', '1', NULL, '150000', '50000', '2', '1', '0', '50000', '', '0', '', '', '0', '', '', -1, 'Customer', 1, NULL, '2024-08-26', NULL),
(5, 11, '2024-08-27', 'G-102', '4', NULL, '185000', '175000', '1', '', '0', '1000', '', '0', '', '', '0', '', '174000', -1, 'Customer', 1, NULL, '2024-08-27', NULL),
(7, 11, '2024-08-27', 'G-102', '4', NULL, '185000', '174000', '1', '', '0', '1000', '', '0', '', '', '0', '', '173000', 4, 'Father', 1, NULL, '2024-08-27', NULL),
(8, 1, '2024-08-28', 'G-101', '1', 1, '108000', '98000', '1', '', '0', '1000', '', '0', '', '', '0', '', '97000', 1, 'Father', 1, NULL, '2024-08-28', NULL),
(9, 11, '2024-08-28', 'G-102', '4', NULL, '185000', '173000', '1', '', '1', '0', '234234', '3000', '', '', '0', '', '170000', 4, 'Father', 1, NULL, '2024-08-28', NULL),
(10, 11, '2024-08-28', 'G-102', '4', NULL, '185000', '170000', '1', '', '1', '0', '3546546', '1000', '', '', '0', '', '169000', -1, 'Customer', 1, NULL, '2024-08-28', NULL),
(11, 1, '2024-08-28', 'G-101', '1', 1, '108000', '97000', '1', '', '0', '1000', '', '0', '', '', '0', '', '96000', 1, 'Father', 1, NULL, '2024-08-28', NULL),
(12, 11, '2024-08-28', 'G-102', '4', NULL, '185000', '169000', '1', '', '2', '0', '', '0', '', '675685787678', '1000', '', '168000', 4, 'Father', 1, NULL, '2024-08-28', NULL),
(13, 11, '2024-08-28', 'G-102', '4', NULL, '185000', '168000', '1', '', '0', '2000', '', '0', '', '', '0', '', '166000', 4, 'Father', 1, NULL, '2024-08-28', NULL),
(14, 126, '2024-09-02', 'G-103', '5', NULL, '199500', '199500', '2', '1', '0', '199500', '', '0', '', '', '0', '', '', -1, 'Customer', 1, NULL, '2024-09-02', NULL),
(15, 2, '2024-09-04', 'G-101', '1', 2, '98000', '98000', '1', '', '0', '10000', '', '0', '', '', '0', '', '88000', 4, 'Father', 1, NULL, '2024-09-04', NULL),
(17, 11, '2024-09-06', 'G-102', '4', NULL, '185000', '166000', '1', '', '0', '100000', '', '0', '', '', '0', '', '66000', 4, 'Father', 1, NULL, '2024-09-06', NULL),
(18, 180, '2024-09-06', 'G-106', '8', NULL, '45000', '45000', '1', '1', '0', '5000', '', '0', '', '', '0', '', '40000', 9, 'Brother', 1, NULL, '2024-09-06', NULL),
(19, 11, '2024-09-06', 'G-102', '4', NULL, '185000', '66000', '1', '1', '0', '60000', '', '0', '', '', '0', '', '6000', 0, 'Customer', 1, NULL, '2024-09-06', NULL),
(21, 11, '2024-09-06', 'G-102', '4', NULL, '185000', '6000', '1', '2', '1', '0', '34563453', '6000', 'jhhg', '', '0', '', '0', 4, 'Father', 1, NULL, '2024-09-06', NULL),
(23, 1, '2024-09-06', 'G-101', '1', 1, '108000', '96000', '2', '1', '0', '96000', '', '0', '', '', '0', '', '', 0, 'Customer', 1, NULL, '2024-09-06', NULL),
(25, 180, '2024-09-06', 'G-106', '8', NULL, '45000', '40000', '1', '2', '1', '0', '123', '1000', '', '', '0', '', '39000', 0, 'Customer', 1, NULL, '2024-09-06', NULL),
(26, 180, '2024-09-06', 'G-106', '8', NULL, '45000', '39000', '1', '1', '0', '4000', '', '0', '', '', '0', '', '35000', 9, 'Brother', 1, NULL, '2024-09-06', NULL),
(27, 180, '2024-09-06', 'G-106', '8', NULL, '45000', '35000', '2', '3', '1', '0', '', '0', '', '123', '35000', '', '', 0, 'Customer', 1, NULL, '2024-09-06', NULL),
(28, 2, '2024-09-10', 'G-101', '1', 2, '98000', '88000', '1', '1', '0', '5000', '', '0', '', '', '0', '', '83000', 0, 'Customer', 1, NULL, '2024-09-10', NULL),
(29, 2, '2024-09-10', 'G-101', '1', 2, '98000', '83000', '1', '1', '', '1000', '', '0', '', '', '0', '', '82000', 0, 'Customer', 1, NULL, '2024-09-10', NULL),
(63, 12, '2024-09-27', 'G-102', '1', NULL, '186000', '186000', '1', '1', '', '1000', '', '0', '', '', '0', '', '185000', 17, 'Daughter', 1, NULL, '2024-09-27', NULL),
(64, 2, '2024-09-30', 'G-101', '2', 2, '98000', '98000', '1', '1', '', '98000', NULL, NULL, NULL, NULL, NULL, NULL, '98000', 0, 'Customer', 1, NULL, '2024-09-30', NULL),
(66, 12, '2024-09-30', 'G-102', '1', NULL, '186000', '185000', '1', '1', '', '2000', '', '0', '', '', '0', '', '183000', 1, 'Father', 1, NULL, '2024-09-30', NULL),
(67, 12, '2024-09-30', 'G-102', '1', NULL, '186000', '183000', '1', '1', '', '2000', '', '0', '', '', '0', '', '181000', 18, 'Father', 1, NULL, '2024-09-30', NULL),
(68, 12, '2024-10-01', 'G-102', '1', NULL, '186000', '181000', '1', '1', '', '1000', '', '0', '', '', '0', '', '180000', 24, 'Daughter', 1, NULL, '2024-10-01', NULL),
(76, 181, '2024-10-03', 'G-106', '10', 2, '35000', '35000', '1', '1', '', '35000', NULL, NULL, NULL, NULL, NULL, NULL, '35000', 0, 'Customer', 1, NULL, '2024-10-03', NULL),
(88, 13, '2024-10-09', 'G-102', '3', 3, '200000', '200000', '1', '1', '', '200000', NULL, NULL, NULL, NULL, NULL, NULL, '200000', 0, 'Customer', 1, NULL, '2024-10-09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `source`
--

CREATE TABLE `source` (
  `id` int(11) NOT NULL,
  `cus_id` varchar(100) NOT NULL,
  `occupation` varchar(100) NOT NULL,
  `occ_detail` varchar(100) NOT NULL,
  `occ_place` varchar(100) DEFAULT NULL,
  `source` varchar(100) NOT NULL,
  `income` varchar(100) NOT NULL,
  `insert_login_id` int(11) NOT NULL,
  `update_login_id` int(11) DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `updated_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `source`
--

INSERT INTO `source` (`id`, `cus_id`, `occupation`, `occ_detail`, `occ_place`, `source`, `income`, `insert_login_id`, `update_login_id`, `created_on`, `updated_on`) VALUES
(2, 'C-102', 'Doctor', 'GH', NULL, '1', '55000', 1, NULL, '2024-08-20', NULL),
(3, 'C-103', 'Teacher, tution', 'ssv school', NULL, '2', '120000', 1, NULL, '2024-08-20', NULL),
(4, 'C-104', 'Teacher', 'ssv school', NULL, '1', '45000', 1, NULL, '2024-08-20', NULL),
(5, 'C-105', 'Teacher', 'jj', NULL, '1', '430000', 1, NULL, '2024-08-20', NULL),
(14, 'C-106', 'Teacher', 'ssv school', NULL, '1', '17000', 1, NULL, '2024-08-28', NULL),
(16, 'C-106', 'Developer', 'IT', NULL, '1', '50000', 1, NULL, '2024-08-29', NULL),
(18, 'C-107', 'Teacher', 'Teacher', NULL, 'teacher', '84000', 1, NULL, '2024-09-02', NULL),
(20, 'C-108', 'engineer', 'Contructor', NULL, 'business', '120000', 1, NULL, '2024-09-02', NULL),
(21, 'C-109', 'Business', 'Super market', NULL, 'business', '89000', 1, NULL, '2024-09-02', NULL),
(23, 'C-110', 'teacher', 'teaching field', NULL, 'job', '98000', 1, NULL, '2024-09-02', NULL),
(24, 'C-111', 'XXXXXX', 'XESDD', NULL, 'XEDED', '78542', 1, NULL, '2024-09-13', NULL),
(25, 'C-111', 'XXXX', 'XVCXA', NULL, 'XSWSX', '78000', 1, NULL, '2024-09-13', NULL),
(26, 'C-112', 'Teacher', 'ssv school', NULL, '1', '10000', 1, NULL, '2024-09-21', NULL),
(28, 'C-101', 'Doctor', 'GH', 'Pondy', '1', '100000', 1, NULL, '2024-09-27', NULL),
(29, 'C-113', 'Doctor', 'GH', 'Pondy', '1', '200000', 1, NULL, '2024-09-27', NULL),
(30, 'C-113', 'Teacher', 'ssv school', 'Pondy', 'gffd', '50000', 1, NULL, '2024-09-27', NULL),
(31, 'C-114', 'Teacher', 'ssv school', 'Pondy', '1', '10000', 1, NULL, '2024-10-02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `state_name` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `state_name`, `status`) VALUES
(1, 'Tamil Nadu', 1),
(2, 'Puducherry', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sub_menu_list`
--

CREATE TABLE `sub_menu_list` (
  `id` int(11) NOT NULL,
  `main_menu` int(11) NOT NULL,
  `sub_menu` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  `icon` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='All Sub menu of the project should be placed here';

--
-- Dumping data for table `sub_menu_list`
--

INSERT INTO `sub_menu_list` (`id`, `main_menu`, `sub_menu`, `link`, `icon`) VALUES
(1, 1, 'Dashboard', 'dashboard', 'view_comfy'),
(2, 2, 'Company Creation', 'company_creation', 'domain'),
(3, 2, 'Branch Creation', 'branch_creation', 'add-to-list'),
(4, 2, 'Customer Creation', 'customer_creation', 'recent_actors'),
(5, 2, 'Group Creation', 'group_creation', 'person_add'),
(6, 3, 'Bank Creation', 'bank_creation', 'store_mall_directory'),
(7, 3, 'User Creation', 'user_creation', 'group_add'),
(8, 4, 'Auction', 'auction', 'local_library'),
(9, 5, 'Settlement', 'settlement', 'circle-with-cross'),
(10, 6, 'Collection', 'collection', 'devices_other'),
(11, 7, 'Accounts', 'accounts', 'rate_review'),
(12, 8, 'Customer Data', 'customer_data', 'person_pin'),
(13, 9, 'Group Summary', 'group_summary', 'event_available'),
(14, 16, 'Enquiry Creation', 'enquiry_creation', 'phone'),
(15, 7, 'Balance Sheet', 'balance_sheet', 'colours');

-- --------------------------------------------------------

--
-- Table structure for table `taluks`
--

CREATE TABLE `taluks` (
  `id` int(11) NOT NULL,
  `state_id` int(50) NOT NULL,
  `district_id` int(11) NOT NULL,
  `taluk_name` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `taluks`
--

INSERT INTO `taluks` (`id`, `state_id`, `district_id`, `taluk_name`, `status`) VALUES
(1, 1, 1, 'Ariyalur', 1),
(2, 1, 1, 'Andimadam', 1),
(3, 1, 1, 'Sendurai', 1),
(4, 1, 1, 'Udaiyarpalayam', 1),
(5, 1, 2, 'Alandur', 1),
(6, 1, 2, 'Ambattur', 1),
(7, 1, 2, 'Aminjikarai', 1),
(8, 1, 2, 'Ayanavaram', 1),
(9, 1, 2, 'Egmore', 1),
(10, 1, 2, 'Guindy', 1),
(11, 1, 2, 'Madhavaram', 1),
(12, 1, 2, 'Madhuravoyal', 1),
(13, 1, 2, 'Mambalam', 1),
(14, 1, 2, 'Mylapore', 1),
(15, 1, 2, 'Perambur', 1),
(16, 1, 2, 'Purasavakkam', 1),
(17, 1, 2, 'Sholinganallur', 1),
(18, 1, 2, 'Thiruvottriyur', 1),
(19, 1, 2, 'Tondiarpet', 1),
(20, 1, 2, 'Velacherry', 1),
(21, 1, 3, 'Chengalpattu', 1),
(22, 1, 3, 'Cheyyur', 1),
(23, 1, 3, 'Maduranthakam', 1),
(24, 1, 3, 'Pallavaram', 1),
(25, 1, 3, 'Tambaram', 1),
(26, 1, 3, 'Thirukalukundram', 1),
(27, 1, 3, 'Tiruporur', 1),
(28, 1, 3, 'Vandalur', 1),
(29, 1, 4, 'Aanaimalai', 1),
(30, 1, 4, 'Annur', 1),
(31, 1, 4, 'Coimbatore(North)', 1),
(32, 1, 4, 'Coimbatore(South)', 1),
(33, 1, 4, 'Kinathukadavu', 1),
(34, 1, 4, 'Madukarai', 1),
(35, 1, 4, 'Mettupalayam', 1),
(36, 1, 4, 'Perur', 1),
(37, 1, 4, 'Pollachi', 1),
(38, 1, 4, 'Sulur', 1),
(39, 1, 4, 'Valparai', 1),
(40, 1, 5, 'Cuddalore', 1),
(41, 1, 5, 'Bhuvanagiri', 1),
(42, 1, 5, 'Chidambaram', 1),
(43, 1, 5, 'Kattumannarkoil', 1),
(44, 1, 5, 'Kurinjipadi', 1),
(45, 1, 5, 'Panruti', 1),
(46, 1, 5, 'Srimushnam', 1),
(47, 1, 5, 'Thittakudi', 1),
(48, 1, 5, 'Veppur', 1),
(49, 1, 5, 'Virudhachalam', 1),
(50, 1, 6, 'Dharmapuri', 1),
(51, 1, 6, 'Harur', 1),
(52, 1, 6, 'Karimangalam', 1),
(53, 1, 6, 'Nallampalli', 1),
(54, 1, 6, 'Palacode', 1),
(55, 1, 6, 'Pappireddipatti', 1),
(56, 1, 6, 'Pennagaram', 1),
(57, 1, 7, 'Atthur', 1),
(58, 1, 7, 'Dindigul(East)', 1),
(59, 1, 7, 'Dindigul(West)', 1),
(60, 1, 7, 'Guziliyamparai', 1),
(61, 1, 7, 'Kodaikanal', 1),
(62, 1, 7, 'Natham', 1),
(63, 1, 7, 'Nilakottai', 1),
(64, 1, 7, 'Oddanchatram', 1),
(65, 1, 7, 'Palani', 1),
(66, 1, 7, 'Vedasandur', 1),
(67, 1, 8, 'Erode', 1),
(68, 1, 8, 'Anthiyur', 1),
(69, 1, 8, 'Bhavani', 1),
(70, 1, 8, 'Gobichettipalayam', 1),
(71, 1, 8, 'Kodumudi', 1),
(72, 1, 8, 'Modakurichi', 1),
(73, 1, 8, 'Nambiyur', 1),
(74, 1, 8, 'Perundurai', 1),
(75, 1, 8, 'Sathiyamangalam', 1),
(76, 1, 8, 'Thalavadi', 1),
(77, 1, 9, 'Kallakurichi', 1),
(78, 1, 9, 'Chinnaselam', 1),
(79, 1, 9, 'Kalvarayan Hills', 1),
(80, 1, 9, 'Sankarapuram', 1),
(81, 1, 9, 'Tirukoilur', 1),
(82, 1, 9, 'Ulundurpet', 1),
(83, 1, 10, 'Kancheepuram', 1),
(84, 1, 10, 'Kundrathur', 1),
(85, 1, 10, 'Sriperumbudur', 1),
(86, 1, 10, 'Uthiramerur', 1),
(87, 1, 10, 'Walajabad', 1),
(88, 1, 11, 'Agasteeswaram', 1),
(89, 1, 11, 'Kalkulam', 1),
(90, 1, 11, 'Killiyur', 1),
(91, 1, 11, 'Thiruvatar', 1),
(92, 1, 11, 'Thovalai', 1),
(93, 1, 11, 'Vilavankodu', 1),
(94, 1, 12, 'Karur', 1),
(95, 1, 12, 'Aravakurichi', 1),
(96, 1, 12, 'Kadavur', 1),
(97, 1, 12, 'Krishnarayapuram', 1),
(98, 1, 12, 'Kulithalai', 1),
(99, 1, 12, 'Manmangalam', 1),
(100, 1, 12, 'Pugalur', 1),
(101, 1, 13, 'Krishnagiri', 1),
(102, 1, 13, 'Anjetty', 1),
(103, 1, 13, 'Bargur', 1),
(104, 1, 13, 'Hosur', 1),
(105, 1, 13, 'Pochampalli', 1),
(106, 1, 13, 'Sulagiri', 1),
(107, 1, 13, 'Thenkanikottai', 1),
(108, 1, 13, 'Uthangarai', 1),
(109, 1, 14, 'Kallikudi', 1),
(110, 1, 14, 'Madurai (East)', 1),
(111, 1, 14, 'Madurai (North)', 1),
(112, 1, 14, 'Madurai (South)', 1),
(113, 1, 14, 'Madurai (West)', 1),
(114, 1, 14, 'Melur', 1),
(115, 1, 14, 'Peraiyur', 1),
(116, 1, 14, 'Thirumangalam', 1),
(117, 1, 14, 'Thiruparankundram', 1),
(118, 1, 14, 'Usilampatti', 1),
(119, 1, 14, 'Vadipatti', 1),
(120, 1, 15, 'Mayiladuthurai', 1),
(121, 1, 15, 'Kuthalam', 1),
(122, 1, 15, 'Sirkali', 1),
(123, 1, 15, 'Tharangambadi', 1),
(124, 1, 16, 'Nagapattinam', 1),
(125, 1, 16, 'Kilvelur', 1),
(126, 1, 16, 'Thirukkuvalai', 1),
(127, 1, 16, 'Vedaranyam', 1),
(128, 1, 17, 'Namakkal', 1),
(129, 1, 17, 'Kholli Hills', 1),
(130, 1, 17, 'Kumarapalayam', 1),
(131, 1, 17, 'Mohanoor', 1),
(132, 1, 17, 'Paramathi Velur', 1),
(133, 1, 17, 'Rasipuram', 1),
(134, 1, 17, 'Senthamangalam', 1),
(135, 1, 17, 'Tiruchengode', 1),
(136, 1, 18, 'Udagamandalam', 1),
(137, 1, 18, 'Coonoor', 1),
(138, 1, 18, 'Gudalur', 1),
(139, 1, 18, 'Kothagiri', 1),
(140, 1, 18, 'Kundah', 1),
(141, 1, 18, 'Pandalur', 1),
(142, 1, 19, 'Perambalur', 1),
(143, 1, 19, 'Alathur', 1),
(144, 1, 19, 'Kunnam', 1),
(145, 1, 19, 'Veppanthattai', 1),
(146, 1, 20, 'Pudukottai', 1),
(147, 1, 20, 'Alangudi', 1),
(148, 1, 20, 'Aranthangi', 1),
(149, 1, 20, 'Avudiyarkoil', 1),
(150, 1, 20, 'Gandarvakottai', 1),
(151, 1, 20, 'Iluppur', 1),
(152, 1, 20, 'Karambakudi', 1),
(153, 1, 20, 'Kulathur', 1),
(154, 1, 20, 'Manamelkudi', 1),
(155, 1, 20, 'Ponnamaravathi', 1),
(156, 1, 20, 'Thirumayam', 1),
(157, 1, 20, 'Viralimalai', 1),
(158, 1, 21, 'Ramanathapuram', 1),
(159, 1, 21, 'Kadaladi', 1),
(160, 1, 21, 'Kamuthi', 1),
(161, 1, 21, 'Kezhakarai', 1),
(162, 1, 21, 'Mudukulathur', 1),
(163, 1, 21, 'Paramakudi', 1),
(164, 1, 21, 'Rajasingamangalam', 1),
(165, 1, 21, 'Rameswaram', 1),
(166, 1, 21, 'Tiruvadanai', 1),
(167, 1, 22, 'Arakkonam', 1),
(168, 1, 22, 'Arcot', 1),
(169, 1, 22, 'Kalavai', 1),
(170, 1, 22, 'Nemili', 1),
(171, 1, 22, 'Sholingur', 1),
(172, 1, 22, 'Walajah', 1),
(173, 1, 23, 'Salem', 1),
(174, 1, 23, 'Attur', 1),
(175, 1, 23, 'Edapadi', 1),
(176, 1, 23, 'Gangavalli', 1),
(177, 1, 23, 'Kadaiyampatti', 1),
(178, 1, 23, 'Mettur', 1),
(179, 1, 23, 'Omalur', 1),
(180, 1, 23, 'Pethanayakanpalayam', 1),
(181, 1, 23, 'Salem South', 1),
(182, 1, 23, 'Salem West', 1),
(183, 1, 23, 'Sankari', 1),
(184, 1, 23, 'Vazhapadi', 1),
(185, 1, 23, 'Yercaud', 1),
(186, 1, 24, 'Sivagangai', 1),
(187, 1, 24, 'Devakottai', 1),
(188, 1, 24, 'Ilayankudi', 1),
(189, 1, 24, 'Kalaiyarkovil', 1),
(190, 1, 24, 'Karaikudi', 1),
(191, 1, 24, 'Manamadurai', 1),
(192, 1, 24, 'Singampunari', 1),
(193, 1, 24, 'Thirupuvanam', 1),
(194, 1, 24, 'Tirupathur', 1),
(195, 1, 25, 'Tenkasi', 1),
(196, 1, 25, 'Alangulam', 1),
(197, 1, 25, 'Kadayanallur', 1),
(198, 1, 25, 'Sankarankovil', 1),
(199, 1, 25, 'Shenkottai', 1),
(200, 1, 25, 'Sivagiri', 1),
(201, 1, 25, 'Thiruvengadam', 1),
(202, 1, 25, 'Veerakeralampudur', 1),
(203, 1, 26, 'Thanjavur', 1),
(204, 1, 26, 'Boothalur', 1),
(205, 1, 26, 'Kumbakonam', 1),
(206, 1, 26, 'Orathanadu', 1),
(207, 1, 26, 'Papanasam', 1),
(208, 1, 26, 'Pattukottai', 1),
(209, 1, 26, 'Peravurani', 1),
(210, 1, 26, 'Thiruvaiyaru', 1),
(211, 1, 26, 'Thiruvidaimaruthur', 1),
(212, 1, 27, 'Theni', 1),
(213, 1, 27, 'Aandipatti', 1),
(214, 1, 27, 'Bodinayakanur', 1),
(215, 1, 27, 'Periyakulam', 1),
(216, 1, 27, 'Uthamapalayam', 1),
(217, 1, 28, 'Thoothukudi', 1),
(218, 1, 28, 'Eral', 1),
(219, 1, 28, 'Ettayapuram', 1),
(220, 1, 28, 'Kayathar', 1),
(221, 1, 28, 'Kovilpatti', 1),
(222, 1, 28, 'Ottapidaram', 1),
(223, 1, 28, 'Sattankulam', 1),
(224, 1, 28, 'Srivaikundam', 1),
(225, 1, 28, 'Tiruchendur', 1),
(226, 1, 28, 'Vilathikulam', 1),
(227, 1, 29, 'Lalgudi', 1),
(228, 1, 29, 'Manachanallur', 1),
(229, 1, 29, 'Manapparai', 1),
(230, 1, 29, 'Marungapuri', 1),
(231, 1, 29, 'Musiri', 1),
(232, 1, 29, 'Srirangam', 1),
(233, 1, 29, 'Thottiam', 1),
(234, 1, 29, 'Thuraiyur', 1),
(235, 1, 29, 'Tiruchirapalli (West)', 1),
(236, 1, 29, 'Tiruchirappalli (East)', 1),
(237, 1, 29, 'Tiruverumbur', 1),
(238, 1, 30, 'Tirunelveli', 1),
(239, 1, 30, 'Ambasamudram', 1),
(240, 1, 30, 'Cheranmahadevi', 1),
(241, 1, 30, 'Manur', 1),
(242, 1, 30, 'Nanguneri', 1),
(243, 1, 30, 'Palayamkottai', 1),
(244, 1, 30, 'Radhapuram', 1),
(245, 1, 30, 'Thisayanvilai', 1),
(246, 1, 31, 'Avinashi', 1),
(247, 1, 31, 'Dharapuram', 1),
(248, 1, 31, 'Kangeyam', 1),
(249, 1, 31, 'Madathukkulam', 1),
(250, 1, 31, 'Oothukuli', 1),
(251, 1, 31, 'Palladam', 1),
(252, 1, 31, 'Tiruppur (North)', 1),
(253, 1, 31, 'Tiruppur (South)', 1),
(254, 1, 31, 'Udumalaipettai', 1),
(255, 1, 32, 'Tirupathur\"', 1),
(256, 1, 32, 'Ambur', 1),
(257, 1, 32, 'Natrampalli', 1),
(258, 1, 32, 'Vaniyambadi', 1),
(259, 1, 33, 'Thiruvallur', 1),
(260, 1, 33, 'Avadi', 1),
(261, 1, 33, 'Gummidipoondi', 1),
(262, 1, 33, 'Pallipattu', 1),
(263, 1, 33, 'Ponneri', 1),
(264, 1, 33, 'Poonamallee', 1),
(265, 1, 33, 'R.K. Pet', 1),
(266, 1, 33, 'Tiruthani', 1),
(267, 1, 33, 'Uthukottai', 1),
(268, 1, 34, 'Thiruvannamalai', 1),
(269, 1, 34, 'Arni', 1),
(270, 1, 34, 'Chengam', 1),
(271, 1, 34, 'Chetpet', 1),
(272, 1, 34, 'Cheyyar', 1),
(273, 1, 34, 'Jamunamarathur', 1),
(274, 1, 34, 'Kalasapakkam', 1),
(275, 1, 34, 'Kilpennathur', 1),
(276, 1, 34, 'Polur', 1),
(277, 1, 34, 'Thandramet', 1),
(278, 1, 34, 'Vandavasi', 1),
(279, 1, 34, 'Vembakkam', 1),
(280, 1, 35, 'Thiruvarur', 1),
(281, 1, 35, 'Kodavasal', 1),
(282, 1, 35, 'Koothanallur', 1),
(283, 1, 35, 'Mannargudi', 1),
(284, 1, 35, 'Nannilam', 1),
(285, 1, 35, 'Needamangalam', 1),
(286, 1, 35, 'Thiruthuraipoondi', 1),
(287, 1, 35, 'Valangaiman', 1),
(288, 1, 36, 'Vellore', 1),
(289, 1, 36, 'Aanikattu', 1),
(290, 1, 36, 'Gudiyatham', 1),
(291, 1, 36, 'K V Kuppam', 1),
(292, 1, 36, 'Katpadi', 1),
(293, 1, 36, 'Pernambut', 1),
(294, 1, 37, 'Villupuram', 1),
(295, 1, 37, 'Gingee', 1),
(296, 1, 37, 'Kandachipuram', 1),
(297, 1, 37, 'Marakanam', 1),
(298, 1, 37, 'Melmalaiyanur', 1),
(299, 1, 37, 'Thiruvennainallur', 1),
(300, 1, 37, 'Tindivanam', 1),
(301, 1, 37, 'Vanur', 1),
(302, 1, 37, 'Vikravandi', 1),
(303, 1, 38, 'Virudhunagar', 1),
(304, 1, 38, 'Aruppukottai', 1),
(305, 1, 38, 'Kariyapatti', 1),
(306, 1, 38, 'Rajapalayam', 1),
(307, 1, 38, 'Sathur', 1),
(308, 1, 38, 'Sivakasi', 1),
(309, 1, 38, 'Srivilliputhur', 1),
(310, 1, 38, 'Tiruchuli', 1),
(311, 1, 38, 'Vembakottai', 1),
(312, 1, 38, 'Watrap', 1),
(313, 2, 39, 'Puducherry', 1),
(314, 2, 39, 'Oulgaret', 1),
(315, 2, 39, 'Villianur', 1),
(316, 2, 39, 'Bahour', 1),
(317, 2, 39, 'Karaikal', 1),
(318, 2, 39, 'Thirunallar', 1),
(319, 2, 39, 'Mahe', 1),
(320, 2, 39, 'Yanam', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `user_code` varchar(100) NOT NULL,
  `role` int(255) NOT NULL,
  `address` varchar(100) NOT NULL,
  `place` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `designation` int(11) NOT NULL,
  `occ_detail` varchar(255) DEFAULT NULL,
  `screens` varchar(255) NOT NULL,
  `insert_login_id` varchar(100) NOT NULL,
  `update_login_id` varchar(100) DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `updated_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='All the users will be stored here with screen access details';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `user_code`, `role`, `address`, `place`, `email`, `mobile`, `user_name`, `password`, `branch`, `designation`, `occ_detail`, `screens`, `insert_login_id`, `update_login_id`, `created_on`, `updated_on`) VALUES
(1, 'Super Admin', 'US-001', 1, '', 1, '', '', 'admin', '123', '1,2', 1, '1,2', '1,2,3,4,5,6,7,8,9,10,11,15,12,13,14', '1', '1', '2024-06-13', '2024-08-30'),
(13, 'Tester', 'US-002', 2, 'Gandhi road', 3, '', '', 'tester', '123', '1,2', 3, '', '1,2,3,4,5,6,7', '1', '', '2024-09-02', '0000-00-00'),
(14, 'testing user', 'US-003', 2, '', 3, '', '', 'qwerty', '123', '1,2', 3, '', '1,2,3,4,5', '1', '', '2024-09-13', '0000-00-00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_collect_entry`
--
ALTER TABLE `accounts_collect_entry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auction_details`
--
ALTER TABLE `auction_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auction_modal`
--
ALTER TABLE `auction_modal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auc_id` (`auction_id`);

--
-- Indexes for table `bank_creation`
--
ALTER TABLE `bank_creation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branch_creation`
--
ALTER TABLE `branch_creation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `state_id` (`state`),
  ADD KEY `district_id` (`district`),
  ADD KEY `taluk_id` (`taluk`);

--
-- Indexes for table `collection`
--
ALTER TABLE `collection`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commitment_info`
--
ALTER TABLE `commitment_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_creation`
--
ALTER TABLE `company_creation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `State ids` (`state`),
  ADD KEY `District ids` (`district`),
  ADD KEY `Taluk ids` (`taluk`);

--
-- Indexes for table `customer_creation`
--
ALTER TABLE `customer_creation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `places` (`place`);

--
-- Indexes for table `designation`
--
ALTER TABLE `designation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `State id` (`state_id`);

--
-- Indexes for table `document_info`
--
ALTER TABLE `document_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiry_creation`
--
ALTER TABLE `enquiry_creation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiry_creation_customer`
--
ALTER TABLE `enquiry_creation_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `family_info`
--
ALTER TABLE `family_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_creation`
--
ALTER TABLE `group_creation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_cus_mapping`
--
ALTER TABLE `group_cus_mapping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cus_id` (`cus_id`);

--
-- Indexes for table `guarantor_info`
--
ALTER TABLE `guarantor_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_list`
--
ALTER TABLE `menu_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `noc`
--
ALTER TABLE `noc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doc_id` (`doc_id`);

--
-- Indexes for table `noc_ref`
--
ALTER TABLE `noc_ref`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `other_transaction`
--
ALTER TABLE `other_transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `other_trans_name`
--
ALTER TABLE `other_trans_name`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `place`
--
ALTER TABLE `place`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settlement_info`
--
ALTER TABLE `settlement_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `source`
--
ALTER TABLE `source`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_menu_list`
--
ALTER TABLE `sub_menu_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Main menu id` (`main_menu`);

--
-- Indexes for table `taluks`
--
ALTER TABLE `taluks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `District id` (`district_id`),
  ADD KEY `States id` (`state_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `place` (`place`),
  ADD KEY `role` (`role`),
  ADD KEY `designation` (`designation`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_collect_entry`
--
ALTER TABLE `accounts_collect_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `auction_details`
--
ALTER TABLE `auction_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT for table `auction_modal`
--
ALTER TABLE `auction_modal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `bank_creation`
--
ALTER TABLE `bank_creation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `branch_creation`
--
ALTER TABLE `branch_creation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `collection`
--
ALTER TABLE `collection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `commitment_info`
--
ALTER TABLE `commitment_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `company_creation`
--
ALTER TABLE `company_creation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_creation`
--
ALTER TABLE `customer_creation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `designation`
--
ALTER TABLE `designation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `document_info`
--
ALTER TABLE `document_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `enquiry_creation`
--
ALTER TABLE `enquiry_creation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `enquiry_creation_customer`
--
ALTER TABLE `enquiry_creation_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `family_info`
--
ALTER TABLE `family_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `group_creation`
--
ALTER TABLE `group_creation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `group_cus_mapping`
--
ALTER TABLE `group_cus_mapping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `guarantor_info`
--
ALTER TABLE `guarantor_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `menu_list`
--
ALTER TABLE `menu_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `noc`
--
ALTER TABLE `noc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `noc_ref`
--
ALTER TABLE `noc_ref`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `other_transaction`
--
ALTER TABLE `other_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `other_trans_name`
--
ALTER TABLE `other_trans_name`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `place`
--
ALTER TABLE `place`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settlement_info`
--
ALTER TABLE `settlement_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `source`
--
ALTER TABLE `source`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sub_menu_list`
--
ALTER TABLE `sub_menu_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `taluks`
--
ALTER TABLE `taluks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=321;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `branch_creation`
--
ALTER TABLE `branch_creation`
  ADD CONSTRAINT `district_id` FOREIGN KEY (`district`) REFERENCES `districts` (`id`),
  ADD CONSTRAINT `state_id` FOREIGN KEY (`state`) REFERENCES `states` (`id`),
  ADD CONSTRAINT `taluk_id` FOREIGN KEY (`taluk`) REFERENCES `taluks` (`id`);

--
-- Constraints for table `company_creation`
--
ALTER TABLE `company_creation`
  ADD CONSTRAINT `District ids` FOREIGN KEY (`district`) REFERENCES `districts` (`id`),
  ADD CONSTRAINT `State ids` FOREIGN KEY (`state`) REFERENCES `states` (`id`),
  ADD CONSTRAINT `Taluk ids` FOREIGN KEY (`taluk`) REFERENCES `taluks` (`id`);

--
-- Constraints for table `customer_creation`
--
ALTER TABLE `customer_creation`
  ADD CONSTRAINT `place` FOREIGN KEY (`place`) REFERENCES `place` (`id`) ON UPDATE NO ACTION;

--
-- Constraints for table `districts`
--
ALTER TABLE `districts`
  ADD CONSTRAINT `State id` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`);

--
-- Constraints for table `group_cus_mapping`
--
ALTER TABLE `group_cus_mapping`
  ADD CONSTRAINT `cus_id` FOREIGN KEY (`cus_id`) REFERENCES `customer_creation` (`id`) ON UPDATE NO ACTION;

--
-- Constraints for table `noc`
--
ALTER TABLE `noc`
  ADD CONSTRAINT `doc_id` FOREIGN KEY (`doc_id`) REFERENCES `document_info` (`id`) ON UPDATE NO ACTION;

--
-- Constraints for table `sub_menu_list`
--
ALTER TABLE `sub_menu_list`
  ADD CONSTRAINT `Main menu id` FOREIGN KEY (`main_menu`) REFERENCES `menu_list` (`id`);

--
-- Constraints for table `taluks`
--
ALTER TABLE `taluks`
  ADD CONSTRAINT `District id` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`),
  ADD CONSTRAINT `States id` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
