-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 24, 2022 at 04:04 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `agni`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1:Admin 2:Accountant',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1:Active 0:Inactive',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `type`, `email`, `email_verified_at`, `status`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Agni Admin', '1', 'admin@agni.com', NULL, 1, '$2y$10$fdGD3yrhs/u/BCXDl22HgOT/kJM2KVE1sEN.mD5.6BA9sXV2KAYiC', NULL, NULL, '2022-05-30 03:03:48'),
(8, 'Agni 2', '1', 'admin@agni2.com', NULL, 1, '$2y$10$vSi.yb4LdI72wLgtIQsf5uM99Jwebf7OPw48j97wAohTjz7otYyQa', NULL, '2022-07-19 06:28:03', '2022-07-19 06:36:50'),
(9, 'Accountant One', '2', 'accountant1@agni.com', NULL, 1, '$2y$10$fbPtWIWquR3DTYYPRu6hK.WlxCrSL.UNx0k2rc68AQ9zut2pezrRK', NULL, '2022-08-01 07:17:22', '2022-08-17 07:20:40');

-- --------------------------------------------------------

--
-- Table structure for table `app_settings`
--

CREATE TABLE `app_settings` (
  `id` int(11) NOT NULL,
  `website_name` varchar(255) DEFAULT NULL,
  `website_link` varchar(255) DEFAULT NULL,
  `po_order_address` text DEFAULT NULL,
  `po_order_city` varchar(255) DEFAULT NULL,
  `po_order_state` varchar(255) DEFAULT NULL,
  `po_order_country` varchar(255) DEFAULT NULL,
  `po_order_pin` varchar(255) DEFAULT NULL,
  `sgst_percentage` int(11) NOT NULL DEFAULT 9,
  `cgst_percentage` int(11) NOT NULL DEFAULT 9,
  `staff_payment_incentive` varchar(255) DEFAULT NULL COMMENT 'percentage val',
  `order_collector_commission` varchar(255) DEFAULT NULL COMMENT 'percentage val;',
  `payment_collector_commission` varchar(255) DEFAULT NULL COMMENT 'percentage val;',
  `product_sales_price_threshold_percentage` varchar(255) NOT NULL DEFAULT '10',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_settings`
--

INSERT INTO `app_settings` (`id`, `website_name`, `website_link`, `po_order_address`, `po_order_city`, `po_order_state`, `po_order_country`, `po_order_pin`, `sgst_percentage`, `cgst_percentage`, `staff_payment_incentive`, `order_collector_commission`, `payment_collector_commission`, `product_sales_price_threshold_percentage`, `created_at`, `updated_at`) VALUES
(1, 'Agni Inventory', 'https://demo91.co.in/dev/agni/public/', '2 B, Rani Sankari Ln, Jatin Das Park, Patuapara, Bhowanipore, Kolkata, West Bengal 700025', 'Kolkata', 'West Bengal', 'India', '700025', 9, 9, '0.2', '30', '70', '10', '2022-07-05 10:13:58', '2022-08-24 14:51:30');

-- --------------------------------------------------------

--
-- Table structure for table `bank_lists`
--

CREATE TABLE `bank_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Public-sector banks, Private-sector banks',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bank_lists`
--

INSERT INTO `bank_lists` (`id`, `name`, `type`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Bank of Baroda', 'Public-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(2, 'Vijaya Bank', 'Public-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(3, 'Dena Bank', 'Public-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(4, 'Bank of India', 'Public-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(5, 'Bank of Maharashtra', 'Public-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(6, 'Canara Bank', 'Public-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(7, 'Syndicate Bank', 'Public-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(8, 'Central Bank of India', 'Public-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(9, 'Indian Bank', 'Public-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(10, 'Allahabad Bank', 'Public-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(11, 'Indian Overseas Bank', 'Public-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(12, 'Punjab and Sind Bank', 'Public-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(13, 'Punjab National Bank', 'Public-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(14, 'Oriental Bank of Commerce', 'Public-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(15, 'United Bank of India', 'Public-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(16, 'State Bank of India', 'Public-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(17, 'State Bank of Bikaner & Jaipur', 'Public-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(18, 'State Bank of Hyderabad', 'Public-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(19, 'State Bank of Indore', 'Public-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(20, 'State Bank of Mysore', 'Public-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(21, 'State Bank of Patiala', 'Public-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(22, 'State Bank of Saurashtra', 'Public-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(23, 'State Bank of Travancore', 'Public-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(24, 'Bhartiya Mahila Bank', 'Public-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(25, 'UCO Bank', 'Public-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(26, 'Union Bank of India', 'Public-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(27, 'Andhra Bank', 'Public-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(28, 'Corporation Bank', 'Public-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(29, 'Axis Bank', 'Private-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(30, 'Bandhan Bank', 'Private-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(31, 'CSB Bank', 'Private-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(32, 'City Union Bank', 'Private-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(33, 'DCB Bank', 'Private-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(34, 'Dhanlaxmi Bank', 'Private-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(35, 'Federal Bank', 'Private-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(36, 'HDFC Bank', 'Private-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(37, 'ICICI Bank', 'Private-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(38, 'IDBI Bank', 'Private-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(39, 'IDFC First Bank', 'Private-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(40, 'IndusInd Bank', 'Private-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(41, 'Jammu & Kashmir Bank', 'Private-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(42, 'Karnataka Bank', 'Private-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(43, 'Karur Vysya Bank', 'Private-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(44, 'Kotak Mahindra Bank', 'Private-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(45, 'Nainital Bank', 'Private-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(46, 'RBL Bank', 'Private-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(47, 'South Indian Bank', 'Private-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(48, 'Tamilnad Mercantile Bank', 'Private-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(49, 'Yes Bank', 'Private-sector banks', NULL, '2022-02-18 05:08:57', '2022-07-07 09:57:26'),
(78, ' - OTHERS -', 'others', NULL, '2022-07-07 11:02:11', '2022-07-07 11:02:11');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `store_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint(20) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(10,2) NOT NULL DEFAULT 0.00,
  `offer_price` double(10,2) NOT NULL DEFAULT 0.00,
  `qty` int(11) NOT NULL DEFAULT 1,
  `coupon_code_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1: active, 0: inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `order_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sketch_icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1: active, 0: inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `position`, `name`, `parent`, `icon_path`, `sketch_icon`, `image_path`, `banner_image`, `slug`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Test Category', NULL, 'uploads/category/1659340400.1616406864.agnilogo.jpg', NULL, NULL, NULL, 'test-category-2', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 0, '2022-05-24 04:24:52', '2022-08-11 06:32:55'),
(2, 0, 'Electronics', NULL, 'uploads/category/1659340600.1582150836.electronics.jpg', NULL, NULL, NULL, 'electronics-2', NULL, 1, '2022-07-05 02:22:40', '2022-08-01 07:56:40'),
(3, 0, 'Groceries', NULL, 'uploads/category/1659340611.1190154300.grocery.jpg', NULL, NULL, NULL, 'groceries', 'Groceries', 1, '2022-07-07 00:03:18', '2022-08-11 06:32:44'),
(4, 0, 'Accessories', NULL, 'uploads/category/1659340621.1265644165.accessories.jpeg', NULL, NULL, NULL, 'accessories-2', 'Accessories', 1, '2022-07-07 00:03:46', '2022-08-11 06:32:41'),
(5, 0, 'Test 2', NULL, NULL, NULL, NULL, NULL, 'test-2', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 0, '2022-08-11 05:20:53', '2022-08-11 06:32:55');

-- --------------------------------------------------------

--
-- Table structure for table `category_parents`
--

CREATE TABLE `category_parents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1: active, 0: inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_parents`
--

INSERT INTO `category_parents` (`id`, `name`, `slug`, `position`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Innerwear', 'innerwear', 1, 1, '2022-05-04 12:29:09', '2022-05-30 13:49:44'),
(2, 'Outerwear', 'outerwear', 2, 1, '2022-05-04 12:29:09', '2022-05-30 13:49:44'),
(3, 'Winter wear', 'winter-wear', 3, 1, '2022-05-04 12:29:09', '2022-05-30 13:49:44'),
(4, 'Footkins', 'footkins', 4, 1, '2022-05-04 12:29:09', '2022-05-30 13:49:44');

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

CREATE TABLE `designation` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `designation`
--

INSERT INTO `designation` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Salesman', 1, '2022-08-11 19:52:31', '2022-08-11 19:52:31'),
(2, 'Manager', 1, '2022-08-11 19:52:31', '2022-08-11 19:52:31'),
(3, 'Housekeeping', 1, '2022-08-11 19:52:31', '2022-08-11 19:52:31'),
(4, 'Security Guard', 1, '2022-08-11 19:52:31', '2022-08-11 19:52:31'),
(5, 'Godown Manager', 1, '2022-08-11 19:52:31', '2022-08-11 19:52:31');

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `for_debit` tinyint(1) NOT NULL DEFAULT 0,
  `for_credit` tinyint(1) NOT NULL DEFAULT 0,
  `for_staff` tinyint(1) NOT NULL DEFAULT 0,
  `for_store` tinyint(1) NOT NULL DEFAULT 0,
  `for_partner` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `expense`
--

INSERT INTO `expense` (`id`, `parent_id`, `title`, `slug`, `description`, `for_debit`, `for_credit`, `for_staff`, `for_store`, `for_partner`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Recurring', 'recurring', 'Recurring', 0, 0, 0, 0, 0, 1, '2022-07-01 10:33:19', '2022-07-01 10:33:19'),
(2, 0, 'Non-recurring', 'non-recurring', 'Non-recurring', 0, 0, 0, 0, 0, 1, '2022-07-01 10:33:19', '2022-07-01 10:33:19'),
(4, 1, 'Salary', 'salary', 'Salary', 1, 0, 1, 0, 0, 1, '2022-07-01 10:33:19', '2022-08-16 16:12:55'),
(5, 1, 'Internet', 'internet', 'Internet', 1, 0, 0, 1, 0, 1, '2022-07-01 10:33:19', '2022-08-16 16:13:34'),
(6, 2, 'Incentive', 'incentive', 'Incentive', 1, 0, 1, 0, 0, 1, '2022-07-01 10:35:28', '2022-07-27 15:32:26'),
(7, 2, 'Electricity', 'electricity', 'Electricity', 1, 0, 0, 1, 0, 1, '2022-07-01 10:35:28', '2022-07-04 13:16:19'),
(8, 2, 'Water', 'water', 'Water', 1, 0, 0, 1, 0, 1, '2022-07-01 10:35:28', '2022-07-04 13:16:33'),
(9, 2, 'Allowance', 'allowance', 'Allowance', 1, 0, 1, 0, 0, 1, '2022-07-01 10:35:28', '2022-07-04 13:16:42'),
(20, 2, 'Business Capital', 'business-capital', 'Business Capital as Business Partners', 1, 0, 0, 0, 1, 1, '2022-07-18 15:20:02', '2022-08-11 14:23:32'),
(21, 2, 'Business Investment', 'business-investment', 'Business Investment as business partner', 0, 1, 0, 0, 1, 1, '2022-07-18 18:50:02', '2022-07-18 18:50:02');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `invoice_no` varchar(255) DEFAULT NULL,
  `net_price` double(10,2) NOT NULL COMMENT 'total with gst',
  `order_id` int(11) NOT NULL DEFAULT 0,
  `order_no` varchar(255) DEFAULT NULL,
  `slip_no` varchar(255) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT 'order placed by whom or staff_id',
  `product_id_arr` text DEFAULT NULL,
  `trn_file` varchar(255) DEFAULT NULL COMMENT 'upload trn file if store has outstation address',
  `payment_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:pending;1:half_paid;2:full_paid',
  `is_paid` tinyint(1) NOT NULL DEFAULT 0,
  `required_payment_amount` double(10,2) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`id`, `invoice_no`, `net_price`, `order_id`, `order_no`, `slip_no`, `store_id`, `user_id`, `product_id_arr`, `trn_file`, `payment_status`, `is_paid`, `required_payment_amount`, `created_at`, `updated_at`) VALUES
(1, 'B8F46FSROK72JHB', 2596.00, 1, 'AGNI1866328802', '20220824122343', 2, 8, '[\"7\"]', '', 0, 0, 0.00, '2022-08-24 18:04:02', '2022-08-24 18:04:02');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_payments`
--

CREATE TABLE `invoice_payments` (
  `id` int(11) NOT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `invoice_no` varchar(255) DEFAULT NULL,
  `voucher_no` varchar(255) DEFAULT NULL COMMENT 'payment_receipt',
  `invoice_amount` double(10,2) NOT NULL COMMENT 'invoice''s net amount',
  `vouchar_amount` double(10,2) NOT NULL,
  `paid_amount` double(10,2) NOT NULL COMMENT 'payment amount',
  `rest_amount` double(10,2) NOT NULL,
  `is_commisionable` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'for staff',
  `commission_amount` double(10,2) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='payments (vouchar_no of payment_receipt) covers which invoices at a time';

-- --------------------------------------------------------

--
-- Table structure for table `invoice_products`
--

CREATE TABLE `invoice_products` (
  `id` int(11) NOT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double(10,2) NOT NULL COMMENT 'each ctn price',
  `count_price` double(10,2) NOT NULL,
  `total_price` double(10,2) NOT NULL COMMENT 'with gst price',
  `is_store_address_outstation` tinyint(1) NOT NULL DEFAULT 0,
  `hsn_code` varchar(255) DEFAULT NULL,
  `igst` varchar(255) DEFAULT NULL,
  `cgst` varchar(255) DEFAULT NULL,
  `sgst` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `invoice_products`
--

INSERT INTO `invoice_products` (`id`, `invoice_id`, `product_id`, `quantity`, `price`, `count_price`, `total_price`, `is_store_address_outstation`, `hsn_code`, `igst`, `cgst`, `sgst`, `created_at`, `updated_at`) VALUES
(1, 1, 7, 2, 1100.00, 2200.00, 2596.00, 1, '1122334469', '18', '9', '9', '2022-08-24 18:04:02', '2022-08-24 18:04:02');

-- --------------------------------------------------------

--
-- Table structure for table `journal`
--

CREATE TABLE `journal` (
  `id` int(11) NOT NULL,
  `transaction_amount` double(10,2) NOT NULL,
  `is_credit` tinyint(1) NOT NULL DEFAULT 0,
  `is_debit` tinyint(1) NOT NULL DEFAULT 0,
  `purpose` varchar(255) DEFAULT NULL,
  `purpose_description` text DEFAULT NULL,
  `purpose_id` varchar(255) DEFAULT NULL COMMENT 'invoice_no / vouchar_no',
  `entry_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='revenue / profit n loss';

--
-- Dumping data for table `journal`
--

INSERT INTO `journal` (`id`, `transaction_amount`, `is_credit`, `is_debit`, `purpose`, `purpose_description`, `purpose_id`, `entry_date`, `created_at`, `updated_at`) VALUES
(1, 1000.00, 1, 0, 'opening_balance', 'store opening balance', '1661166795', '2022-06-01', '2022-08-22 16:44:02', '2022-08-22 16:44:02'),
(6, 300.00, 1, 0, 'opening_balance', 'store opening balance', '1661168943', '2022-06-01', '2022-08-22 17:19:36', '2022-08-22 17:19:36'),
(7, 700.00, 1, 0, 'opening_balance', 'store opening balance', '1661168943', '2022-06-01', '2022-08-22 17:19:36', '2022-08-22 17:19:36'),
(9, 5000.00, 0, 1, 'purchase_order_receives', 'Purchase Order Receives', '1661323585381', '2022-08-24', '2022-08-24 12:18:49', '2022-08-24 12:18:49'),
(11, 2596.00, 0, 1, 'raise_invoice', 'invoice raised of sales order for store', 'B8F46FSROK72JHB', '2022-08-24', '2022-08-24 18:04:02', '2022-08-24 18:04:02');

-- --------------------------------------------------------

--
-- Table structure for table `ledger`
--

CREATE TABLE `ledger` (
  `id` int(11) NOT NULL,
  `user_type` varchar(255) NOT NULL DEFAULT 'staff',
  `staff_id` int(11) NOT NULL DEFAULT 0,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `admin_id` int(11) NOT NULL DEFAULT 0,
  `transaction_id` varchar(244) CHARACTER SET utf8 DEFAULT NULL COMMENT 'invoice_no / vouchar_no',
  `transaction_amount` double(10,2) NOT NULL,
  `last_closing_amount` double(10,2) NOT NULL,
  `is_credit` tinyint(1) NOT NULL DEFAULT 0,
  `is_debit` tinyint(1) NOT NULL DEFAULT 0,
  `entry_date` date DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `purpose_description` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ledger`
--

INSERT INTO `ledger` (`id`, `user_type`, `staff_id`, `store_id`, `admin_id`, `transaction_id`, `transaction_amount`, `last_closing_amount`, `is_credit`, `is_debit`, `entry_date`, `purpose`, `purpose_description`, `created_at`, `updated_at`) VALUES
(1, 'staff', 8, 0, 0, 'SAL8202208011661160860', 500.00, 0.00, 1, 0, '2022-08-01', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:20', '2022-08-22 15:04:20'),
(2, 'staff', 11, 0, 0, 'SAL11202208011661160860', 500.00, 0.00, 1, 0, '2022-08-01', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:20', '2022-08-22 15:04:20'),
(3, 'staff', 21, 0, 0, 'SAL21202208011661160860', 500.00, 0.00, 1, 0, '2022-08-01', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:20', '2022-08-22 15:04:20'),
(4, 'staff', 22, 0, 0, 'SAL22202208011661160861', 100.00, 0.00, 1, 0, '2022-08-01', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:21', '2022-08-22 15:04:21'),
(5, 'staff', 24, 0, 0, 'SAL24202208011661160861', 1050.00, 0.00, 1, 0, '2022-08-01', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:21', '2022-08-22 15:04:21'),
(6, 'staff', 8, 0, 0, 'SAL8202208021661160871', 500.00, 0.00, 1, 0, '2022-08-02', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:31', '2022-08-22 15:04:31'),
(7, 'staff', 11, 0, 0, 'SAL11202208021661160871', 500.00, 0.00, 1, 0, '2022-08-02', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:31', '2022-08-22 15:04:31'),
(8, 'staff', 21, 0, 0, 'SAL21202208021661160871', 500.00, 0.00, 1, 0, '2022-08-02', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:31', '2022-08-22 15:04:31'),
(9, 'staff', 22, 0, 0, 'SAL22202208021661160871', 100.00, 0.00, 1, 0, '2022-08-02', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:31', '2022-08-22 15:04:31'),
(10, 'staff', 24, 0, 0, 'SAL24202208021661160871', 1050.00, 0.00, 1, 0, '2022-08-02', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:31', '2022-08-22 15:04:31'),
(11, 'staff', 8, 0, 0, 'SAL8202208031661160879', 500.00, 0.00, 1, 0, '2022-08-03', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:39', '2022-08-22 15:04:39'),
(12, 'staff', 11, 0, 0, 'SAL11202208031661160879', 500.00, 0.00, 1, 0, '2022-08-03', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:39', '2022-08-22 15:04:39'),
(13, 'staff', 21, 0, 0, 'SAL21202208031661160879', 500.00, 0.00, 1, 0, '2022-08-03', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:39', '2022-08-22 15:04:39'),
(14, 'staff', 22, 0, 0, 'SAL22202208031661160880', 100.00, 0.00, 1, 0, '2022-08-03', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:40', '2022-08-22 15:04:40'),
(15, 'staff', 24, 0, 0, 'SAL24202208031661160880', 1050.00, 0.00, 1, 0, '2022-08-03', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:40', '2022-08-22 15:04:40'),
(16, 'staff', 8, 0, 0, 'SAL8202208041661160883', 500.00, 0.00, 1, 0, '2022-08-04', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:43', '2022-08-22 15:04:43'),
(17, 'staff', 11, 0, 0, 'SAL11202208041661160883', 500.00, 0.00, 1, 0, '2022-08-04', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:43', '2022-08-22 15:04:43'),
(18, 'staff', 21, 0, 0, 'SAL21202208041661160883', 500.00, 0.00, 1, 0, '2022-08-04', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:43', '2022-08-22 15:04:43'),
(19, 'staff', 22, 0, 0, 'SAL22202208041661160883', 100.00, 0.00, 1, 0, '2022-08-04', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:43', '2022-08-22 15:04:43'),
(20, 'staff', 24, 0, 0, 'SAL24202208041661160883', 1050.00, 0.00, 1, 0, '2022-08-04', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:43', '2022-08-22 15:04:43'),
(21, 'staff', 8, 0, 0, 'SAL8202208051661160887', 500.00, 0.00, 1, 0, '2022-08-05', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:47', '2022-08-22 15:04:47'),
(22, 'staff', 11, 0, 0, 'SAL11202208051661160887', 500.00, 0.00, 1, 0, '2022-08-05', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:47', '2022-08-22 15:04:47'),
(23, 'staff', 21, 0, 0, 'SAL21202208051661160887', 500.00, 0.00, 1, 0, '2022-08-05', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:47', '2022-08-22 15:04:47'),
(24, 'staff', 22, 0, 0, 'SAL22202208051661160887', 100.00, 0.00, 1, 0, '2022-08-05', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:47', '2022-08-22 15:04:47'),
(25, 'staff', 24, 0, 0, 'SAL24202208051661160887', 1050.00, 0.00, 1, 0, '2022-08-05', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:47', '2022-08-22 15:04:47'),
(26, 'staff', 8, 0, 0, 'SAL8202208061661160891', 500.00, 0.00, 1, 0, '2022-08-06', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:51', '2022-08-22 15:04:51'),
(27, 'staff', 11, 0, 0, 'SAL11202208061661160891', 500.00, 0.00, 1, 0, '2022-08-06', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:51', '2022-08-22 15:04:51'),
(28, 'staff', 21, 0, 0, 'SAL21202208061661160891', 500.00, 0.00, 1, 0, '2022-08-06', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:51', '2022-08-22 15:04:51'),
(29, 'staff', 22, 0, 0, 'SAL22202208061661160891', 100.00, 0.00, 1, 0, '2022-08-06', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:51', '2022-08-22 15:04:51'),
(30, 'staff', 24, 0, 0, 'SAL24202208061661160891', 1050.00, 0.00, 1, 0, '2022-08-06', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:51', '2022-08-22 15:04:51'),
(31, 'staff', 8, 0, 0, 'SAL8202208071661160895', 500.00, 0.00, 1, 0, '2022-08-07', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:55', '2022-08-22 15:04:55'),
(32, 'staff', 11, 0, 0, 'SAL11202208071661160895', 500.00, 0.00, 1, 0, '2022-08-07', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:55', '2022-08-22 15:04:55'),
(33, 'staff', 21, 0, 0, 'SAL21202208071661160895', 500.00, 0.00, 1, 0, '2022-08-07', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:55', '2022-08-22 15:04:55'),
(34, 'staff', 22, 0, 0, 'SAL22202208071661160895', 100.00, 0.00, 1, 0, '2022-08-07', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:55', '2022-08-22 15:04:55'),
(35, 'staff', 24, 0, 0, 'SAL24202208071661160895', 1050.00, 0.00, 1, 0, '2022-08-07', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:55', '2022-08-22 15:04:55'),
(36, 'staff', 8, 0, 0, 'SAL8202208081661160899', 500.00, 0.00, 1, 0, '2022-08-08', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:59', '2022-08-22 15:04:59'),
(37, 'staff', 11, 0, 0, 'SAL11202208081661160899', 500.00, 0.00, 1, 0, '2022-08-08', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:59', '2022-08-22 15:04:59'),
(38, 'staff', 21, 0, 0, 'SAL21202208081661160899', 500.00, 0.00, 1, 0, '2022-08-08', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:59', '2022-08-22 15:04:59'),
(39, 'staff', 22, 0, 0, 'SAL22202208081661160899', 100.00, 0.00, 1, 0, '2022-08-08', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:59', '2022-08-22 15:04:59'),
(40, 'staff', 24, 0, 0, 'SAL24202208081661160899', 1050.00, 0.00, 1, 0, '2022-08-08', 'staff_salary', 'Staff Salary', '2022-08-22 15:04:59', '2022-08-22 15:04:59'),
(41, 'staff', 8, 0, 0, 'SAL8202208091661160902', 500.00, 0.00, 1, 0, '2022-08-09', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:02', '2022-08-22 15:05:02'),
(42, 'staff', 11, 0, 0, 'SAL11202208091661160902', 500.00, 0.00, 1, 0, '2022-08-09', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:02', '2022-08-22 15:05:02'),
(43, 'staff', 21, 0, 0, 'SAL21202208091661160902', 500.00, 0.00, 1, 0, '2022-08-09', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:02', '2022-08-22 15:05:02'),
(44, 'staff', 22, 0, 0, 'SAL22202208091661160902', 100.00, 0.00, 1, 0, '2022-08-09', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:02', '2022-08-22 15:05:02'),
(45, 'staff', 24, 0, 0, 'SAL24202208091661160903', 1050.00, 0.00, 1, 0, '2022-08-09', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:03', '2022-08-22 15:05:03'),
(46, 'staff', 8, 0, 0, 'SAL8202208101661160906', 500.00, 0.00, 1, 0, '2022-08-10', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:06', '2022-08-22 15:05:06'),
(47, 'staff', 11, 0, 0, 'SAL11202208101661160907', 500.00, 0.00, 1, 0, '2022-08-10', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:07', '2022-08-22 15:05:07'),
(48, 'staff', 21, 0, 0, 'SAL21202208101661160907', 500.00, 0.00, 1, 0, '2022-08-10', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:07', '2022-08-22 15:05:07'),
(49, 'staff', 22, 0, 0, 'SAL22202208101661160907', 100.00, 0.00, 1, 0, '2022-08-10', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:07', '2022-08-22 15:05:07'),
(50, 'staff', 24, 0, 0, 'SAL24202208101661160907', 1050.00, 0.00, 1, 0, '2022-08-10', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:07', '2022-08-22 15:05:07'),
(51, 'staff', 8, 0, 0, 'SAL8202208111661160910', 500.00, 0.00, 1, 0, '2022-08-11', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:10', '2022-08-22 15:05:10'),
(52, 'staff', 11, 0, 0, 'SAL11202208111661160910', 500.00, 0.00, 1, 0, '2022-08-11', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:10', '2022-08-22 15:05:10'),
(53, 'staff', 21, 0, 0, 'SAL21202208111661160910', 500.00, 0.00, 1, 0, '2022-08-11', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:10', '2022-08-22 15:05:10'),
(54, 'staff', 22, 0, 0, 'SAL22202208111661160910', 100.00, 0.00, 1, 0, '2022-08-11', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:10', '2022-08-22 15:05:10'),
(55, 'staff', 24, 0, 0, 'SAL24202208111661160910', 1050.00, 0.00, 1, 0, '2022-08-11', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:10', '2022-08-22 15:05:10'),
(56, 'staff', 8, 0, 0, 'SAL8202208121661160913', 500.00, 0.00, 1, 0, '2022-08-12', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:13', '2022-08-22 15:05:13'),
(57, 'staff', 11, 0, 0, 'SAL11202208121661160913', 500.00, 0.00, 1, 0, '2022-08-12', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:13', '2022-08-22 15:05:13'),
(58, 'staff', 21, 0, 0, 'SAL21202208121661160914', 500.00, 0.00, 1, 0, '2022-08-12', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:14', '2022-08-22 15:05:14'),
(59, 'staff', 22, 0, 0, 'SAL22202208121661160914', 100.00, 0.00, 1, 0, '2022-08-12', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:14', '2022-08-22 15:05:14'),
(60, 'staff', 24, 0, 0, 'SAL24202208121661160914', 1050.00, 0.00, 1, 0, '2022-08-12', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:14', '2022-08-22 15:05:14'),
(61, 'staff', 8, 0, 0, 'SAL8202208131661160917', 500.00, 0.00, 1, 0, '2022-08-13', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:17', '2022-08-22 15:05:17'),
(62, 'staff', 11, 0, 0, 'SAL11202208131661160917', 500.00, 0.00, 1, 0, '2022-08-13', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:17', '2022-08-22 15:05:17'),
(63, 'staff', 21, 0, 0, 'SAL21202208131661160917', 500.00, 0.00, 1, 0, '2022-08-13', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:17', '2022-08-22 15:05:17'),
(64, 'staff', 22, 0, 0, 'SAL22202208131661160917', 100.00, 0.00, 1, 0, '2022-08-13', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:17', '2022-08-22 15:05:17'),
(65, 'staff', 24, 0, 0, 'SAL24202208131661160917', 1050.00, 0.00, 1, 0, '2022-08-13', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:17', '2022-08-22 15:05:17'),
(66, 'staff', 8, 0, 0, 'SAL8202208141661160921', 500.00, 0.00, 1, 0, '2022-08-14', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:21', '2022-08-22 15:05:21'),
(67, 'staff', 11, 0, 0, 'SAL11202208141661160921', 500.00, 0.00, 1, 0, '2022-08-14', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:21', '2022-08-22 15:05:21'),
(68, 'staff', 21, 0, 0, 'SAL21202208141661160921', 500.00, 0.00, 1, 0, '2022-08-14', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:21', '2022-08-22 15:05:21'),
(69, 'staff', 22, 0, 0, 'SAL22202208141661160921', 100.00, 0.00, 1, 0, '2022-08-14', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:21', '2022-08-22 15:05:21'),
(70, 'staff', 24, 0, 0, 'SAL24202208141661160921', 1050.00, 0.00, 1, 0, '2022-08-14', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:21', '2022-08-22 15:05:21'),
(71, 'staff', 8, 0, 0, 'SAL8202208151661160924', 500.00, 0.00, 1, 0, '2022-08-15', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:24', '2022-08-22 15:05:24'),
(72, 'staff', 11, 0, 0, 'SAL11202208151661160924', 500.00, 0.00, 1, 0, '2022-08-15', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:24', '2022-08-22 15:05:24'),
(73, 'staff', 21, 0, 0, 'SAL21202208151661160924', 500.00, 0.00, 1, 0, '2022-08-15', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:24', '2022-08-22 15:05:24'),
(74, 'staff', 22, 0, 0, 'SAL22202208151661160924', 100.00, 0.00, 1, 0, '2022-08-15', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:24', '2022-08-22 15:05:24'),
(75, 'staff', 24, 0, 0, 'SAL24202208151661160924', 1050.00, 0.00, 1, 0, '2022-08-15', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:24', '2022-08-22 15:05:24'),
(76, 'staff', 8, 0, 0, 'SAL8202208161661160927', 500.00, 0.00, 1, 0, '2022-08-16', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:27', '2022-08-22 15:05:27'),
(77, 'staff', 11, 0, 0, 'SAL11202208161661160927', 500.00, 0.00, 1, 0, '2022-08-16', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:27', '2022-08-22 15:05:27'),
(78, 'staff', 21, 0, 0, 'SAL21202208161661160928', 500.00, 0.00, 1, 0, '2022-08-16', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:28', '2022-08-22 15:05:28'),
(79, 'staff', 22, 0, 0, 'SAL22202208161661160928', 100.00, 0.00, 1, 0, '2022-08-16', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:28', '2022-08-22 15:05:28'),
(80, 'staff', 24, 0, 0, 'SAL24202208161661160928', 1050.00, 0.00, 1, 0, '2022-08-16', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:28', '2022-08-22 15:05:28'),
(81, 'staff', 8, 0, 0, 'SAL8202208171661160931', 500.00, 0.00, 1, 0, '2022-08-17', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:31', '2022-08-22 15:05:31'),
(82, 'staff', 11, 0, 0, 'SAL11202208171661160931', 500.00, 0.00, 1, 0, '2022-08-17', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:31', '2022-08-22 15:05:31'),
(83, 'staff', 21, 0, 0, 'SAL21202208171661160932', 500.00, 0.00, 1, 0, '2022-08-17', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:32', '2022-08-22 15:05:32'),
(84, 'staff', 22, 0, 0, 'SAL22202208171661160932', 100.00, 0.00, 1, 0, '2022-08-17', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:32', '2022-08-22 15:05:32'),
(85, 'staff', 24, 0, 0, 'SAL24202208171661160932', 1050.00, 0.00, 1, 0, '2022-08-17', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:32', '2022-08-22 15:05:32'),
(86, 'staff', 8, 0, 0, 'SAL8202208181661160936', 500.00, 0.00, 1, 0, '2022-08-18', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:36', '2022-08-22 15:05:36'),
(87, 'staff', 11, 0, 0, 'SAL11202208181661160936', 500.00, 0.00, 1, 0, '2022-08-18', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:36', '2022-08-22 15:05:36'),
(88, 'staff', 21, 0, 0, 'SAL21202208181661160936', 500.00, 0.00, 1, 0, '2022-08-18', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:36', '2022-08-22 15:05:36'),
(89, 'staff', 22, 0, 0, 'SAL22202208181661160936', 100.00, 0.00, 1, 0, '2022-08-18', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:36', '2022-08-22 15:05:36'),
(90, 'staff', 24, 0, 0, 'SAL24202208181661160936', 1050.00, 0.00, 1, 0, '2022-08-18', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:36', '2022-08-22 15:05:36'),
(91, 'staff', 8, 0, 0, 'SAL8202208191661160955', 500.00, 0.00, 1, 0, '2022-08-19', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:55', '2022-08-22 15:05:55'),
(92, 'staff', 11, 0, 0, 'SAL11202208191661160955', 500.00, 0.00, 1, 0, '2022-08-19', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:55', '2022-08-22 15:05:55'),
(93, 'staff', 21, 0, 0, 'SAL21202208191661160955', 500.00, 0.00, 1, 0, '2022-08-19', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:55', '2022-08-22 15:05:55'),
(94, 'staff', 22, 0, 0, 'SAL22202208191661160955', 100.00, 0.00, 1, 0, '2022-08-19', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:55', '2022-08-22 15:05:55'),
(95, 'staff', 24, 0, 0, 'SAL24202208191661160955', 1050.00, 0.00, 1, 0, '2022-08-19', 'staff_salary', 'Staff Salary', '2022-08-22 15:05:55', '2022-08-22 15:05:55'),
(96, 'staff', 8, 0, 0, 'SAL8202208201661160962', 500.00, 0.00, 1, 0, '2022-08-20', 'staff_salary', 'Staff Salary', '2022-08-22 15:06:02', '2022-08-22 15:06:02'),
(97, 'staff', 11, 0, 0, 'SAL11202208201661160962', 500.00, 0.00, 1, 0, '2022-08-20', 'staff_salary', 'Staff Salary', '2022-08-22 15:06:02', '2022-08-22 15:06:02'),
(98, 'staff', 21, 0, 0, 'SAL21202208201661160962', 500.00, 0.00, 1, 0, '2022-08-20', 'staff_salary', 'Staff Salary', '2022-08-22 15:06:02', '2022-08-22 15:06:02'),
(99, 'staff', 22, 0, 0, 'SAL22202208201661160962', 100.00, 0.00, 1, 0, '2022-08-20', 'staff_salary', 'Staff Salary', '2022-08-22 15:06:02', '2022-08-22 15:06:02'),
(100, 'staff', 24, 0, 0, 'SAL24202208201661160962', 1050.00, 0.00, 1, 0, '2022-08-20', 'staff_salary', 'Staff Salary', '2022-08-22 15:06:02', '2022-08-22 15:06:02'),
(101, 'staff', 8, 0, 0, 'SAL8202208211661160966', 500.00, 0.00, 1, 0, '2022-08-21', 'staff_salary', 'Staff Salary', '2022-08-22 15:06:06', '2022-08-22 15:06:06'),
(102, 'staff', 11, 0, 0, 'SAL11202208211661160966', 500.00, 0.00, 1, 0, '2022-08-21', 'staff_salary', 'Staff Salary', '2022-08-22 15:06:06', '2022-08-22 15:06:06'),
(103, 'staff', 21, 0, 0, 'SAL21202208211661160966', 500.00, 0.00, 1, 0, '2022-08-21', 'staff_salary', 'Staff Salary', '2022-08-22 15:06:06', '2022-08-22 15:06:06'),
(104, 'staff', 22, 0, 0, 'SAL22202208211661160966', 100.00, 0.00, 1, 0, '2022-08-21', 'staff_salary', 'Staff Salary', '2022-08-22 15:06:06', '2022-08-22 15:06:06'),
(105, 'staff', 24, 0, 0, 'SAL24202208211661160966', 1050.00, 0.00, 1, 0, '2022-08-21', 'staff_salary', 'Staff Salary', '2022-08-22 15:06:06', '2022-08-22 15:06:06'),
(109, 'store', 0, 1, 0, '1661166795', 1000.00, 0.00, 1, 0, '2022-06-01', 'opening_balance', 'store opening balance', '2022-08-22 16:44:02', '2022-08-22 16:44:02'),
(114, 'store', 0, 2, 0, '1661168943', 300.00, 0.00, 1, 0, '2022-06-01', 'opening_balance', 'store opening balance', '2022-08-22 17:19:36', '2022-08-22 17:19:36'),
(115, 'store', 0, 2, 0, '1661168943', 700.00, 0.00, 1, 0, '2022-06-01', 'opening_balance', 'store opening balance', '2022-08-22 17:19:36', '2022-08-22 17:19:36'),
(117, 'store', 0, 2, 0, 'B8F46FSROK72JHB', 2596.00, 0.00, 0, 1, '2022-08-24', 'raise_invoice', 'invoice raised of sales order for store', '2022-08-24 18:04:02', '2022-08-24 18:04:02');

-- --------------------------------------------------------

--
-- Table structure for table `mail_logs`
--

CREATE TABLE `mail_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blade_file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mail_logs`
--

INSERT INTO `mail_logs` (`id`, `from`, `to`, `subject`, `blade_file`, `payload`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'onenesstechsolution@gmail.com', 'suvajit.bardhan@onenesstechs.in', 'Onn - New registration', 'front/mail/register', '{\"name\":\"\",\"subject\":\"Onn - New registration\",\"email\":\"suvajit.bardhan@onenesstechs.in\",\"password\":\"1212\",\"blade_file\":\"front\\/mail\\/register\"}', NULL, '2022-03-11 10:31:35', '2022-05-30 13:49:45'),
(2, 'onenesstechsolution@gmail.com', 'suvajit.bardhan@onenesstechs.in', 'Onn - New registration', 'front/mail/register', '{\"name\":\"\",\"subject\":\"Onn - New registration\",\"email\":\"suvajit.bardhan@onenesstechs.in\",\"password\":\"123456\",\"blade_file\":\"front\\/mail\\/register\"}', NULL, '2022-03-11 10:38:49', '2022-05-30 13:49:45'),
(6, 'onenesstechsolution@gmail.com', 'suvajit.bardhan@onenesstechs.in', 'Onn - New registration', 'front/mail/register', '{\"name\":\"\",\"subject\":\"Onn - New registration\",\"email\":\"suvajit.bardhan@onenesstechs.in\",\"password\":\"1111\",\"blade_file\":\"front\\/mail\\/register\"}', NULL, '2022-03-11 11:41:41', '2022-05-30 13:49:45'),
(7, 'onenesstechsolution@gmail.com', 'suvajit.bardhan@onenesstechs.in', 'Onn - New registration', 'front/mail/register', '{\"name\":\"\",\"subject\":\"Onn - New registration\",\"email\":\"suvajit.bardhan@onenesstechs.in\",\"password\":\"1111\",\"blade_file\":\"front\\/mail\\/register\"}', NULL, '2022-03-11 11:45:02', '2022-05-30 13:49:45'),
(8, 'onenesstechsolution@gmail.com', 'suvajit.bardhan@onenesstechs.in', 'Onn - New registration', 'front/mail/register', '{\"name\":\"\",\"subject\":\"Onn - New registration\",\"email\":\"suvajit.bardhan@onenesstechs.in\",\"password\":\"1111\",\"blade_file\":\"front\\/mail\\/register\"}', NULL, '2022-03-11 11:55:07', '2022-05-30 13:49:45'),
(9, 'onenesstechsolution@gmail.com', 'arpanc314@gmail.com', 'Onn - New registration', 'front/mail/register', '{\"name\":\"\",\"subject\":\"Onn - New registration\",\"email\":\"arpanc314@gmail.com\",\"password\":\"4444\",\"blade_file\":\"front\\/mail\\/register\"}', NULL, '2022-03-11 11:56:33', '2022-05-30 13:49:45'),
(10, 'onenesstechsolution@gmail.com', 'suvajit.bardhan@onenesstechs.in', 'Onn - New registration', 'front/mail/register', '{\"name\":\"\",\"subject\":\"Onn - New registration\",\"email\":\"suvajit.bardhan@onenesstechs.in\",\"password\":\"1111\",\"blade_file\":\"front\\/mail\\/register\"}', NULL, '2022-03-11 12:04:35', '2022-05-30 13:49:45'),
(11, 'onenesstechsolution@gmail.com', 'suvajit.oneness@gmail.com', 'Onn - New registration', 'front/mail/register', '{\"name\":\"\",\"subject\":\"Onn - New registration\",\"email\":\"suvajit.oneness@gmail.com\",\"password\":\"123456\",\"blade_file\":\"front\\/mail\\/register\"}', NULL, '2022-03-11 12:11:34', '2022-05-30 13:49:45'),
(12, 'onenesstechsolution@gmail.com', 'suvajit.oneness@gmail.com', 'Onn - New registration', 'front/mail/register', '{\"name\":\"\",\"subject\":\"Onn - New registration\",\"email\":\"suvajit.oneness@gmail.com\",\"password\":\"1111\",\"blade_file\":\"front\\/mail\\/register\"}', NULL, '2022-03-11 12:14:04', '2022-05-30 13:49:45'),
(13, 'onenesstechsolution@gmail.com', 'suvajit.oneness@gmail.com', 'Onn - New registration', 'front/mail/register', '{\"name\":\"\",\"subject\":\"Onn - New registration\",\"email\":\"suvajit.oneness@gmail.com\",\"password\":\"sdfsdfsdfd\",\"blade_file\":\"front\\/mail\\/register\"}', NULL, '2022-03-11 12:33:10', '2022-05-30 13:49:45'),
(14, 'onenesstechsolution@gmail.com', 'mail@Mail.com', 'Onn - New registration', 'front/mail/register', '{\"name\":\"suvajit bardhan\",\"subject\":\"Onn - New registration\",\"email\":\"mail@Mail.com\",\"password\":\"123456\",\"blade_file\":\"front\\/mail\\/register\"}', NULL, '2022-03-11 13:44:53', '2022-05-30 13:49:45'),
(15, 'onenesstechsolution@gmail.com', 'test@test2.com', 'Onn - New registration', 'front/mail/register', '{\"name\":\"suvajit bardhan\",\"subject\":\"Onn - New registration\",\"email\":\"test@test2.com\",\"password\":\"test@test2.com\",\"blade_file\":\"front\\/mail\\/register\"}', NULL, '2022-03-16 13:30:04', '2022-05-30 13:49:45'),
(16, 'onenesstechsolution@gmail.com', 'suvajit.bardhan@onenesstechs.in', 'Onn - New order', 'front/mail/order-confirm', '{\"name\":\"Suvajit Guha\",\"subject\":\"Onn - New order\",\"email\":\"suvajit.bardhan@onenesstechs.in\",\"orderNo\":\"ONN2086027772\",\"orderAmount\":6000,\"orderProducts\":[{\"order_id\":25,\"product_id\":7,\"product_name\":\"LOW SHOW SOCKS\",\"product_image\":\"http:\\/\\/localhost:8000\\/uploads\\/product\\/polo_tshirt_front.png\",\"product_slug\":\"low-show-socks\",\"product_variation_id\":null,\"price\":90,\"offer_price\":90,\"qty\":4},{\"order_id\":25,\"product_id\":125,\"product_name\":\"FULL SLEEVES V\\/NECK\",\"product_image\":\"http:\\/\\/localhost:8000\\/uploads\\/product\\/polo_tshirt_front.png\",\"product_slug\":\"full-sleeves-v-neck\",\"product_variation_id\":null,\"price\":610,\"offer_price\":610,\"qty\":7},{\"order_id\":25,\"product_id\":17,\"product_name\":\"FINE VEST\",\"product_image\":\"http:\\/\\/localhost:8000\\/uploads\\/product\\/polo_tshirt_front.png\",\"product_slug\":\"fine-vest-2\",\"product_variation_id\":null,\"price\":280,\"offer_price\":280,\"qty\":3},{\"order_id\":25,\"product_id\":38,\"product_name\":\"HALF SLEEVE R\\/ NECK\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\/product\\/polo_tshirt_front.png\",\"product_slug\":\"half-sleeve-r-neck\",\"product_variation_id\":\"1\",\"price\":530,\"offer_price\":530,\"qty\":1}],\"blade_file\":\"front\\/mail\\/order-confirm\"}', NULL, '2022-03-22 08:53:20', '2022-05-30 13:49:45'),
(17, 'onenesstechsolution@gmail.com', 'suvajit.bardhan@onenesstechs.in', 'Onn - New order', 'front/mail/order-confirm', '{\"name\":\"Suvajit Guha\",\"subject\":\"Onn - New order\",\"email\":\"suvajit.bardhan@onenesstechs.in\",\"orderNo\":\"ONN557402884\",\"orderAmount\":1060,\"orderProducts\":[{\"order_id\":26,\"product_id\":38,\"product_name\":\"HALF SLEEVE R\\/ NECK\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\/product\\/polo_tshirt_front.png\",\"product_slug\":\"half-sleeve-r-neck\",\"product_variation_id\":\"7\",\"price\":530,\"offer_price\":530,\"qty\":2}],\"blade_file\":\"front\\/mail\\/order-confirm\"}', NULL, '2022-03-22 09:04:28', '2022-05-30 13:49:45'),
(25, 'onenesstechsolution@gmail.com', 'suvajit.bardhan@onenesstechs.in', 'Onn - New order', 'front/mail/order-confirm', '{\"name\":\"Suvajit bardhan\",\"subject\":\"Onn - New order\",\"email\":\"suvajit.bardhan@onenesstechs.in\",\"orderNo\":\"ONN1687431651\",\"orderAmount\":1060,\"orderProducts\":[{\"order_id\":34,\"product_id\":38,\"product_name\":\"HALF SLEEVE R\\/ NECK\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\/product\\/polo_tshirt_front.png\",\"product_slug\":\"half-sleeve-r-neck\",\"product_variation_id\":\"7\",\"price\":530,\"offer_price\":530,\"qty\":2}],\"blade_file\":\"front\\/mail\\/order-confirm\"}', NULL, '2022-03-22 11:35:08', '2022-05-30 13:49:45'),
(26, 'onenesstechsolution@gmail.com', 'suvajit.bardhan@onenesstechs.in', 'Onn - New registration', 'front/mail/register', '{\"name\":\"Suvajit Bardhan\",\"subject\":\"Onn - New registration\",\"email\":\"suvajit.bardhan@onenesstechs.in\",\"password\":\"suvajit.bardhan@onenesstechs.in\",\"blade_file\":\"front\\/mail\\/register\"}', NULL, '2022-03-22 11:38:58', '2022-05-30 13:49:45'),
(27, 'onenesstechsolution@gmail.com', 'suvajit.bardhan2@onenesstechs.in', 'Onn - New registration', 'front/mail/register', '{\"name\":\"test user\",\"subject\":\"Onn - New registration\",\"email\":\"suvajit.bardhan2@onenesstechs.in\",\"password\":\"secret\",\"blade_file\":\"front\\/mail\\/register\"}', NULL, '2022-03-23 07:50:31', '2022-05-30 13:49:45'),
(28, 'onenesstechsolution@gmail.com', 'suvajit.bardhan2@onenesstechs.in', 'Onn - New registration', 'front/mail/register', '{\"name\":\"test user\",\"subject\":\"Onn - New registration\",\"email\":\"suvajit.bardhan2@onenesstechs.in\",\"password\":\"secret\",\"blade_file\":\"front\\/mail\\/register\"}', NULL, '2022-03-23 07:52:25', '2022-05-30 13:49:45'),
(29, 'onenesstechsolution@gmail.com', 'suvajit.bardhan2@onenesstechs.in', 'Onn - New registration', 'front/mail/register', '{\"name\":\"test user\",\"subject\":\"Onn - New registration\",\"email\":\"suvajit.bardhan2@onenesstechs.in\",\"password\":\"secret\",\"blade_file\":\"front\\/mail\\/register\"}', NULL, '2022-03-23 07:55:11', '2022-05-30 13:49:45'),
(30, 'onenesstechsolution@gmail.com', 'suvajit.bardhan2@onenesstechs.in', 'Onn - New order', 'front/mail/order-confirm', '{\"name\":\"test user\",\"subject\":\"Onn - New order\",\"email\":\"suvajit.bardhan2@onenesstechs.in\",\"orderNo\":\"ONN1568407002\",\"orderAmount\":5529,\"orderProducts\":[{\"order_id\":35,\"product_id\":13,\"product_name\":\"ROUND NECK T-SHIRT\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\/product\\/polo_tshirt_front.png\",\"product_slug\":\"round-neck-t-shirt\",\"product_variation_id\":null,\"price\":399,\"offer_price\":399,\"qty\":3},{\"order_id\":35,\"product_id\":79,\"product_name\":\"FASHION BRIEF O\\/E\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\\\product\\\\product_images\\\\262\\\\ONN-Grande-262-1.jpg\",\"product_slug\":\"fashion-brief-o-e\",\"product_variation_id\":null,\"price\":175,\"offer_price\":175,\"qty\":5},{\"order_id\":35,\"product_id\":32,\"product_name\":\"PRINTED SWEATSHIRT\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\/product\\/product_images\\/1021\\/1021-1.jpg\",\"product_slug\":\"printed-sweatshirt\",\"product_variation_id\":null,\"price\":799,\"offer_price\":799,\"qty\":3},{\"order_id\":35,\"product_id\":38,\"product_name\":\"HALF SLEEVE R\\/ NECK\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\/product\\/polo_tshirt_front.png\",\"product_slug\":\"half-sleeve-r-neck\",\"product_variation_id\":\"3\",\"price\":530,\"offer_price\":530,\"qty\":2}],\"blade_file\":\"front\\/mail\\/order-confirm\"}', NULL, '2022-03-23 08:39:59', '2022-05-30 13:49:45'),
(31, 'onenesstechsolution@gmail.com', 'suvajit.bardhan2@onenesstechs.in', 'Onn - New order', 'front/mail/order-confirm', '{\"name\":\"test user\",\"subject\":\"Onn - New order\",\"email\":\"suvajit.bardhan2@onenesstechs.in\",\"orderNo\":\"ONN1986548744\",\"orderAmount\":4400,\"orderProducts\":[{\"order_id\":36,\"product_id\":125,\"product_name\":\"FULL SLEEVES V\\/NECK\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\/product\\/polo_tshirt_front.png\",\"product_slug\":\"full-sleeves-v-neck\",\"product_variation_id\":null,\"price\":610,\"offer_price\":610,\"qty\":2},{\"order_id\":36,\"product_id\":38,\"product_name\":\"HALF SLEEVE R\\/ NECK\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\/product\\/polo_tshirt_front.png\",\"product_slug\":\"half-sleeve-r-neck\",\"product_variation_id\":\"5\",\"price\":530,\"offer_price\":530,\"qty\":4},{\"order_id\":36,\"product_id\":38,\"product_name\":\"HALF SLEEVE R\\/ NECK\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\/product\\/polo_tshirt_front.png\",\"product_slug\":\"half-sleeve-r-neck\",\"product_variation_id\":\"6\",\"price\":530,\"offer_price\":530,\"qty\":2}],\"blade_file\":\"front\\/mail\\/order-confirm\"}', NULL, '2022-03-23 14:43:27', '2022-05-30 13:49:45'),
(32, 'onenesstechsolution@gmail.com', 'suvajit.bardhan@onenesstechs.in', 'Onn - New order', 'front/mail/order-confirm', '{\"name\":\"Suvajit Bardhan\",\"subject\":\"Onn - New order\",\"email\":\"suvajit.bardhan@onenesstechs.in\",\"orderNo\":\"ONN1731083780\",\"orderAmount\":1622,\"orderProducts\":[{\"order_id\":37,\"product_id\":13,\"product_name\":\"ROUND NECK T-SHIRT\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\\\product\\\\product_images\\\\422\\\\422-1.jpg\",\"product_slug\":\"round-neck-t-shirt\",\"product_variation_id\":\"17\",\"price\":399,\"offer_price\":399,\"qty\":3},{\"order_id\":37,\"product_id\":13,\"product_name\":\"ROUND NECK T-SHIRT\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\\\product\\\\product_images\\\\422\\\\422-1.jpg\",\"product_slug\":\"round-neck-t-shirt\",\"product_variation_id\":\"24\",\"price\":425,\"offer_price\":425,\"qty\":1}],\"blade_file\":\"front\\/mail\\/order-confirm\"}', NULL, '2022-03-24 13:53:14', '2022-05-30 13:49:45'),
(33, 'onenesstechsolution@gmail.com', 'bardhan@user.com', 'Onn - New order', 'front/mail/order-confirm', '{\"name\":\"Suvajit Bardhan\",\"subject\":\"Onn - New order\",\"email\":\"bardhan@user.com\",\"orderNo\":\"ONN2126371347\",\"orderAmount\":3669,\"orderProducts\":[{\"order_id\":38,\"product_id\":13,\"product_name\":\"ROUND NECK T-SHIRT\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\\\product\\\\product_images\\\\422\\\\422-1.jpg\",\"product_slug\":\"round-neck-t-shirt\",\"product_variation_id\":\"95\",\"price\":425,\"offer_price\":425,\"qty\":3},{\"order_id\":38,\"product_id\":13,\"product_name\":\"ROUND NECK T-SHIRT\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\\\product\\\\product_images\\\\422\\\\422-1.jpg\",\"product_slug\":\"round-neck-t-shirt\",\"product_variation_id\":\"83\",\"price\":399,\"offer_price\":399,\"qty\":1},{\"order_id\":38,\"product_id\":13,\"product_name\":\"ROUND NECK T-SHIRT\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\\\product\\\\product_images\\\\422\\\\422-1.jpg\",\"product_slug\":\"round-neck-t-shirt\",\"product_variation_id\":\"74\",\"price\":399,\"offer_price\":399,\"qty\":5}],\"blade_file\":\"front\\/mail\\/order-confirm\"}', NULL, '2022-03-24 14:05:40', '2022-05-30 13:49:45'),
(34, 'onenesstechsolution@gmail.com', 'suvajit.bardhan@onenesstechs.in', 'Onn - New order', 'front/mail/order-confirm', '{\"name\":\"Suvajit Bardhan\",\"subject\":\"Onn - New order\",\"email\":\"suvajit.bardhan@onenesstechs.in\",\"orderNo\":\"ONN272894762\",\"orderAmount\":3669,\"orderProducts\":[{\"order_id\":39,\"product_id\":13,\"product_name\":\"ROUND NECK T-SHIRT\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\\\product\\\\product_images\\\\422\\\\422-1.jpg\",\"product_slug\":\"round-neck-t-shirt\",\"product_variation_id\":\"95\",\"price\":425,\"offer_price\":425,\"qty\":3},{\"order_id\":39,\"product_id\":13,\"product_name\":\"ROUND NECK T-SHIRT\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\\\product\\\\product_images\\\\422\\\\422-1.jpg\",\"product_slug\":\"round-neck-t-shirt\",\"product_variation_id\":\"83\",\"price\":399,\"offer_price\":399,\"qty\":1},{\"order_id\":39,\"product_id\":13,\"product_name\":\"ROUND NECK T-SHIRT\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\\\product\\\\product_images\\\\422\\\\422-1.jpg\",\"product_slug\":\"round-neck-t-shirt\",\"product_variation_id\":\"74\",\"price\":399,\"offer_price\":399,\"qty\":5}],\"blade_file\":\"front\\/mail\\/order-confirm\"}', NULL, '2022-03-25 05:52:51', '2022-05-30 13:49:45'),
(35, 'onenesstechsolution@gmail.com', 'your.email+fakedata44065@gmail.com', 'Onn - New order', 'front/mail/order-confirm', '{\"name\":\"Sarla Varrier\",\"subject\":\"Onn - New order\",\"email\":\"your.email+fakedata44065@gmail.com\",\"orderNo\":\"ONN1097170116\",\"orderAmount\":3669,\"orderProducts\":[{\"order_id\":40,\"product_id\":13,\"product_name\":\"ROUND NECK T-SHIRT\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\\\product\\\\product_images\\\\422\\\\422-1.jpg\",\"product_slug\":\"round-neck-t-shirt\",\"product_variation_id\":\"95\",\"price\":425,\"offer_price\":425,\"qty\":3},{\"order_id\":40,\"product_id\":13,\"product_name\":\"ROUND NECK T-SHIRT\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\\\product\\\\product_images\\\\422\\\\422-1.jpg\",\"product_slug\":\"round-neck-t-shirt\",\"product_variation_id\":\"83\",\"price\":399,\"offer_price\":399,\"qty\":1},{\"order_id\":40,\"product_id\":13,\"product_name\":\"ROUND NECK T-SHIRT\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\\\product\\\\product_images\\\\422\\\\422-1.jpg\",\"product_slug\":\"round-neck-t-shirt\",\"product_variation_id\":\"74\",\"price\":399,\"offer_price\":399,\"qty\":5}],\"blade_file\":\"front\\/mail\\/order-confirm\"}', NULL, '2022-03-25 06:23:15', '2022-05-30 13:49:45'),
(36, 'onenesstechsolution@gmail.com', 'your.email+fakedata34742@gmail.com', 'Onn - New order', 'front/mail/order-confirm', '{\"name\":\"Atreyi Nehru\",\"subject\":\"Onn - New order\",\"email\":\"your.email+fakedata34742@gmail.com\",\"orderNo\":\"ONN1495017718\",\"orderAmount\":3669,\"orderProducts\":[{\"order_id\":41,\"product_id\":13,\"product_name\":\"ROUND NECK T-SHIRT\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\\\product\\\\product_images\\\\422\\\\422-1.jpg\",\"product_slug\":\"round-neck-t-shirt\",\"product_variation_id\":\"95\",\"price\":425,\"offer_price\":425,\"qty\":3},{\"order_id\":41,\"product_id\":13,\"product_name\":\"ROUND NECK T-SHIRT\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\\\product\\\\product_images\\\\422\\\\422-1.jpg\",\"product_slug\":\"round-neck-t-shirt\",\"product_variation_id\":\"83\",\"price\":399,\"offer_price\":399,\"qty\":1},{\"order_id\":41,\"product_id\":13,\"product_name\":\"ROUND NECK T-SHIRT\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\\\product\\\\product_images\\\\422\\\\422-1.jpg\",\"product_slug\":\"round-neck-t-shirt\",\"product_variation_id\":\"74\",\"price\":399,\"offer_price\":399,\"qty\":5}],\"blade_file\":\"front\\/mail\\/order-confirm\"}', NULL, '2022-03-25 06:24:32', '2022-05-30 13:49:45'),
(37, 'onenesstechsolution@gmail.com', 'your.email+fakedata23545@gmail.com', 'Onn - New order', 'front/mail/order-confirm', '{\"name\":\"Rukmin Varman\",\"subject\":\"Onn - New order\",\"email\":\"your.email+fakedata23545@gmail.com\",\"orderNo\":\"ONN1929079053\",\"orderAmount\":2871,\"orderProducts\":[{\"order_id\":42,\"product_id\":13,\"product_name\":\"ROUND NECK T-SHIRT\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\\\product\\\\product_images\\\\422\\\\422-1.jpg\",\"product_slug\":\"round-neck-t-shirt\",\"product_variation_id\":\"95\",\"price\":425,\"offer_price\":425,\"qty\":3},{\"order_id\":42,\"product_id\":13,\"product_name\":\"ROUND NECK T-SHIRT\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\\\product\\\\product_images\\\\422\\\\422-1.jpg\",\"product_slug\":\"round-neck-t-shirt\",\"product_variation_id\":\"83\",\"price\":399,\"offer_price\":399,\"qty\":1},{\"order_id\":42,\"product_id\":13,\"product_name\":\"ROUND NECK T-SHIRT\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\\\product\\\\product_images\\\\422\\\\422-1.jpg\",\"product_slug\":\"round-neck-t-shirt\",\"product_variation_id\":\"74\",\"price\":399,\"offer_price\":399,\"qty\":3}],\"blade_file\":\"front\\/mail\\/order-confirm\"}', NULL, '2022-03-25 07:15:50', '2022-05-30 13:49:45'),
(38, 'onenesstechsolution@gmail.com', 'your.email+fakedata16501@gmail.com', 'Onn - New order', 'front/mail/order-confirm', '{\"name\":\"Kalyani Mahajan\",\"subject\":\"Onn - New order\",\"email\":\"your.email+fakedata16501@gmail.com\",\"orderNo\":\"ONN904550126\",\"orderAmount\":2871,\"orderProducts\":[{\"order_id\":43,\"product_id\":13,\"product_name\":\"ROUND NECK T-SHIRT\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\\\product\\\\product_images\\\\422\\\\422-1.jpg\",\"product_slug\":\"round-neck-t-shirt\",\"product_variation_id\":\"95\",\"price\":425,\"offer_price\":425,\"qty\":3},{\"order_id\":43,\"product_id\":13,\"product_name\":\"ROUND NECK T-SHIRT\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\\\product\\\\product_images\\\\422\\\\422-1.jpg\",\"product_slug\":\"round-neck-t-shirt\",\"product_variation_id\":\"83\",\"price\":399,\"offer_price\":399,\"qty\":1},{\"order_id\":43,\"product_id\":13,\"product_name\":\"ROUND NECK T-SHIRT\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\\\product\\\\product_images\\\\422\\\\422-1.jpg\",\"product_slug\":\"round-neck-t-shirt\",\"product_variation_id\":\"74\",\"price\":399,\"offer_price\":399,\"qty\":3}],\"blade_file\":\"front\\/mail\\/order-confirm\"}', NULL, '2022-03-25 07:20:08', '2022-05-30 13:49:45'),
(39, 'onenesstechsolution@gmail.com', 'your.email+fakedata31683@gmail.com', 'Onn - New order', 'front/mail/order-confirm', '{\"name\":\"Aatreya Bharadwaj\",\"subject\":\"Onn - New order\",\"email\":\"your.email+fakedata31683@gmail.com\",\"orderNo\":\"ONN549247929\",\"orderAmount\":2871,\"orderProducts\":[{\"order_id\":44,\"product_id\":13,\"product_name\":\"ROUND NECK T-SHIRT\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\\\product\\\\product_images\\\\422\\\\422-1.jpg\",\"product_slug\":\"round-neck-t-shirt\",\"product_variation_id\":\"95\",\"price\":425,\"offer_price\":425,\"qty\":3},{\"order_id\":44,\"product_id\":13,\"product_name\":\"ROUND NECK T-SHIRT\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\\\product\\\\product_images\\\\422\\\\422-1.jpg\",\"product_slug\":\"round-neck-t-shirt\",\"product_variation_id\":\"83\",\"price\":399,\"offer_price\":399,\"qty\":1},{\"order_id\":44,\"product_id\":13,\"product_name\":\"ROUND NECK T-SHIRT\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\\\product\\\\product_images\\\\422\\\\422-1.jpg\",\"product_slug\":\"round-neck-t-shirt\",\"product_variation_id\":\"74\",\"price\":399,\"offer_price\":399,\"qty\":3}],\"blade_file\":\"front\\/mail\\/order-confirm\"}', NULL, '2022-03-25 07:20:33', '2022-05-30 13:49:45'),
(40, 'onenesstechsolution@gmail.com', 'your.email+fakedata45947@gmail.com', 'Onn - New order', 'front/mail/order-confirm', '{\"name\":\"Jai Pilla\",\"subject\":\"Onn - New order\",\"email\":\"your.email+fakedata45947@gmail.com\",\"orderNo\":\"ONN1716375495\",\"orderAmount\":2871,\"orderProducts\":[{\"order_id\":45,\"product_id\":13,\"product_name\":\"ROUND NECK T-SHIRT\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\\\product\\\\product_images\\\\422\\\\422-1.jpg\",\"product_slug\":\"round-neck-t-shirt\",\"product_variation_id\":\"95\",\"price\":425,\"offer_price\":425,\"qty\":3},{\"order_id\":45,\"product_id\":13,\"product_name\":\"ROUND NECK T-SHIRT\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\\\product\\\\product_images\\\\422\\\\422-1.jpg\",\"product_slug\":\"round-neck-t-shirt\",\"product_variation_id\":\"83\",\"price\":399,\"offer_price\":399,\"qty\":1},{\"order_id\":45,\"product_id\":13,\"product_name\":\"ROUND NECK T-SHIRT\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\\\product\\\\product_images\\\\422\\\\422-1.jpg\",\"product_slug\":\"round-neck-t-shirt\",\"product_variation_id\":\"74\",\"price\":399,\"offer_price\":399,\"qty\":3}],\"blade_file\":\"front\\/mail\\/order-confirm\"}', NULL, '2022-03-25 07:49:35', '2022-05-30 13:49:45'),
(41, 'onenesstechsolution@gmail.com', 'your.email+fakedata94337@gmail.com', 'Onn - New order', 'front/mail/order-confirm', '{\"name\":\"Deenabandhu Bhattathiri\",\"subject\":\"Onn - New order\",\"email\":\"your.email+fakedata94337@gmail.com\",\"orderNo\":\"ONN111264837\",\"orderAmount\":2871,\"orderProducts\":[{\"order_id\":46,\"product_id\":13,\"product_name\":\"ROUND NECK T-SHIRT\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\\\product\\\\product_images\\\\422\\\\422-1.jpg\",\"product_slug\":\"round-neck-t-shirt\",\"product_variation_id\":\"95\",\"price\":425,\"offer_price\":425,\"qty\":3},{\"order_id\":46,\"product_id\":13,\"product_name\":\"ROUND NECK T-SHIRT\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\\\product\\\\product_images\\\\422\\\\422-1.jpg\",\"product_slug\":\"round-neck-t-shirt\",\"product_variation_id\":\"83\",\"price\":399,\"offer_price\":399,\"qty\":1},{\"order_id\":46,\"product_id\":13,\"product_name\":\"ROUND NECK T-SHIRT\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\\\product\\\\product_images\\\\422\\\\422-1.jpg\",\"product_slug\":\"round-neck-t-shirt\",\"product_variation_id\":\"74\",\"price\":399,\"offer_price\":399,\"qty\":3}],\"blade_file\":\"front\\/mail\\/order-confirm\"}', NULL, '2022-03-25 07:50:17', '2022-05-30 13:49:45'),
(42, 'onenesstechsolution@gmail.com', 'your.email+fakedata75409@gmail.com', 'Onn - New order', 'front/mail/order-confirm', '{\"name\":\"Dhatri Dwivedi\",\"subject\":\"Onn - New order\",\"email\":\"your.email+fakedata75409@gmail.com\",\"orderNo\":\"ONN280091922\",\"orderAmount\":2871,\"orderProducts\":[{\"order_id\":47,\"product_id\":13,\"product_name\":\"ROUND NECK T-SHIRT\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\\\product\\\\product_images\\\\422\\\\422-1.jpg\",\"product_slug\":\"round-neck-t-shirt\",\"product_variation_id\":\"95\",\"price\":425,\"offer_price\":425,\"qty\":3},{\"order_id\":47,\"product_id\":13,\"product_name\":\"ROUND NECK T-SHIRT\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\\\product\\\\product_images\\\\422\\\\422-1.jpg\",\"product_slug\":\"round-neck-t-shirt\",\"product_variation_id\":\"83\",\"price\":399,\"offer_price\":399,\"qty\":1},{\"order_id\":47,\"product_id\":13,\"product_name\":\"ROUND NECK T-SHIRT\",\"product_image\":\"http:\\/\\/127.0.0.1:8000\\/uploads\\\\product\\\\product_images\\\\422\\\\422-1.jpg\",\"product_slug\":\"round-neck-t-shirt\",\"product_variation_id\":\"74\",\"price\":399,\"offer_price\":399,\"qty\":3}],\"blade_file\":\"front\\/mail\\/order-confirm\"}', NULL, '2022-03-25 07:51:03', '2022-05-30 13:49:45');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(14, '2014_10_12_000000_create_users_table', 1),
(15, '2014_10_12_100000_create_password_resets_table', 1),
(16, '2019_08_19_000000_create_failed_jobs_table', 1),
(17, '2022_02_28_100529_create_categories_table', 1),
(18, '2022_03_01_060945_create_admins_table', 1),
(19, '2022_03_01_113157_create_sub_categories_table', 1),
(20, '2022_03_01_113259_create_collections_table', 1),
(21, '2022_03_01_131758_create_coupons_table', 1),
(24, '2022_03_02_075005_create_products_table', 2),
(25, '2022_03_02_120938_create_addresses_table', 3),
(26, '2022_03_02_132406_create_faqs_table', 4),
(27, '2022_03_02_134321_create_settings_table', 5),
(28, '2022_03_02_140807_create_product_images_table', 6),
(49, '2022_03_03_084615_create_product_colors_table', 7),
(50, '2022_03_03_084729_create_product_color_sizes_table', 7),
(51, '2022_03_03_085246_create_colors_table', 7),
(52, '2022_03_03_112136_create_sizes_table', 7),
(53, '2022_03_04_080922_create_orders_table', 8),
(54, '2022_03_04_080937_create_transactions_table', 8),
(55, '2022_03_04_081901_create_order_products_table', 8),
(56, '2022_03_04_082329_create_carts_table', 8),
(58, '2022_03_07_151020_add_banner_image_to_categories_table', 9),
(59, '2022_03_07_163254_add_banner_image_to_collections_table', 10),
(60, '2022_03_08_114708_add_column_to_carts_table', 11),
(66, '2022_03_08_154736_add_columns_to_orders_table', 12),
(67, '2022_03_09_121714_add_columns_to_addresses_table', 13),
(69, '2022_03_09_173649_create_subscription_mails_table', 14),
(70, '2022_03_10_124914_add_columns_to_categories_and_collections_table', 15),
(72, '2022_03_11_152029_create_mail_logs_table', 16),
(74, '2022_03_16_115151_add_new_columns_to_categories_and_collections_table', 17),
(75, '2022_03_16_193141_create_galleries_table', 18),
(76, '2022_03_16_193356_create_wishlists_table', 18),
(77, '2022_03_17_114435_add_new_column_to_galleries_table', 19),
(79, '2022_03_21_171424_add_columns_to_products_table', 20),
(82, '2022_03_22_165852_add_new_column_to_transactions_table', 21),
(83, '2022_03_23_181303_add_new_column_to_carts_table', 22),
(84, '2022_03_24_121204_add_more_columns_to_categories_and_collections_table', 23),
(85, '2022_03_24_195535_create_coupon_usages_table', 24),
(86, '2022_03_31_145730_add_column_to_products_table', 25),
(87, '2022_03_07_065136_create_table_offers', 26),
(94, '2022_05_25_062356_create_suppliers_table', 27),
(95, '2022_05_25_062344_create_customers_table', 28),
(98, '2022_05_25_105311_create_staff_post_details_table', 29),
(100, '2022_05_27_113941_create_purchase_orders_table', 30),
(102, '2022_06_13_045945_create_payment_collections_table', 31),
(104, '2022_06_17_050408_create_units_table', 32);

-- --------------------------------------------------------

--
-- Table structure for table `no_order_reasons`
--

CREATE TABLE `no_order_reasons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `noorderreason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `no_order_reasons`
--

INSERT INTO `no_order_reasons` (`id`, `noorderreason`, `created_at`, `updated_at`) VALUES
(1, 'Product related issue', '2022-04-26 18:08:43', '2022-05-30 13:49:45'),
(2, 'Product related issue', '2022-04-26 18:08:43', '2022-05-30 13:49:45'),
(3, 'Distributor related issue', '2022-04-26 18:08:43', '2022-05-30 13:49:45'),
(4, 'Competitor related issue', '2022-04-26 18:08:43', '2022-05-30 13:49:45'),
(5, 'Company related issue', '2022-04-26 18:08:43', '2022-05-30 13:49:45'),
(6, 'Shop related issue', '2022-04-26 18:08:43', '2022-05-30 13:49:45'),
(7, 'More Factor', '2022-04-26 18:08:43', '2022-05-30 13:49:45');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_no` varchar(255) CHARACTER SET utf8 NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT 'staff_id or order placed by whom',
  `store_id` bigint(20) DEFAULT NULL,
  `fname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_mobile` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_landmark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_pin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shippingSameAsBilling` tinyint(4) NOT NULL DEFAULT 0,
  `shipping_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_landmark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_pin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(10,2) NOT NULL DEFAULT 0.00,
  `shipping_charges` double(10,2) DEFAULT 0.00,
  `tax_amount` double(10,2) DEFAULT 0.00,
  `discount_amount` double(10,2) DEFAULT 0.00,
  `coupon_code_id` bigint(20) DEFAULT 0,
  `final_amount` double(10,2) DEFAULT 0.00,
  `paid_amount` double NOT NULL,
  `gst_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'cash_on_delivery',
  `is_paid` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1: paid, 0: not paid',
  `txn_id` bigint(20) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1:Received;2:Pending;3:Cancelled;4:Completed',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `order_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_lat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_lng` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_no`, `ip`, `user_id`, `store_id`, `fname`, `lname`, `email`, `mobile`, `alt_mobile`, `billing_address`, `billing_landmark`, `billing_country`, `billing_state`, `billing_city`, `billing_pin`, `shippingSameAsBilling`, `shipping_address`, `shipping_landmark`, `shipping_country`, `shipping_state`, `shipping_city`, `shipping_pin`, `amount`, `shipping_charges`, `tax_amount`, `discount_amount`, `coupon_code_id`, `final_amount`, `paid_amount`, `gst_no`, `payment_method`, `is_paid`, `txn_id`, `status`, `created_at`, `updated_at`, `order_type`, `order_location`, `order_lat`, `order_lng`, `comment`) VALUES
(1, 'AGNI1866328802', '', 8, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 2200.00, 0.00, 0.00, 0.00, 0, 2200.00, 0, NULL, 'cash_on_delivery', 0, 0, 4, '2022-08-24 06:52:31', '2022-08-24 06:53:43', NULL, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `order_cancelled_products`
--

CREATE TABLE `order_cancelled_products` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT 0,
  `product_id` int(11) NOT NULL DEFAULT 0,
  `qty` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_variation_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(10,2) NOT NULL DEFAULT 0.00,
  `offer_price` double(10,2) NOT NULL DEFAULT 0.00,
  `color` int(11) DEFAULT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT 1,
  `release_qty` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1:received;2:pending/ongoing;3:cancelled;4:completed',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `product_name`, `product_image`, `product_slug`, `product_variation_id`, `price`, `offer_price`, `color`, `size`, `qty`, `release_qty`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 7, 'Realme c11', 'uploads/product/1656925687.dummy.png', NULL, NULL, 1100.00, 0.00, NULL, NULL, 2, 2, 1, '2022-08-24 06:52:31', '2022-08-24 06:53:43');

-- --------------------------------------------------------

--
-- Table structure for table `packing_slip`
--

CREATE TABLE `packing_slip` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT 0,
  `product_id` int(11) NOT NULL DEFAULT 0,
  `slip_no` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `invoice_no` varchar(255) NOT NULL,
  `is_invoice_raised` tinyint(1) NOT NULL DEFAULT 0,
  `is_disbursed` tinyint(1) NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL DEFAULT 0 COMMENT 'box',
  `product_description` longtext DEFAULT NULL,
  `_sgst_percentage` int(11) NOT NULL DEFAULT 9,
  `_cgst_percentage` int(11) NOT NULL DEFAULT 9,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `packing_slip`
--

INSERT INTO `packing_slip` (`id`, `order_id`, `product_id`, `slip_no`, `invoice_no`, `is_invoice_raised`, `is_disbursed`, `quantity`, `product_description`, `_sgst_percentage`, `_cgst_percentage`, `created_at`, `updated_at`) VALUES
(1, 1, 7, '20220824122343', 'B8F46FSROK72JHB', 1, 1, 2, '', 9, 9, '2022-08-24 12:23:43', '2022-08-24 12:23:43');

-- --------------------------------------------------------

--
-- Table structure for table `packing_slip_boxes`
--

CREATE TABLE `packing_slip_boxes` (
  `id` int(11) NOT NULL,
  `packing_slip_id` int(11) NOT NULL DEFAULT 0,
  `slip_no` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `product_id` int(11) NOT NULL DEFAULT 0,
  `barcode_no` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `code_html` longtext DEFAULT NULL,
  `code_base64_img` longtext DEFAULT NULL,
  `is_disbursed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `packing_slip_boxes`
--

INSERT INTO `packing_slip_boxes` (`id`, `packing_slip_id`, `slip_no`, `product_id`, `barcode_no`, `code_html`, `code_base64_img`, `is_disbursed`, `created_at`, `updated_at`) VALUES
(1, 1, '20220824122343', 7, '83040591526', '<div style=\"font-size:0;position:relative;width:224px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:30px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:36px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:48px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:56px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:72px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:78px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:98px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:102px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:122px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:128px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:136px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:146px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:164px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:170px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:184px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:192px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:208px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:216px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:220px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAOAAAAAeAQMAAAAPe4DLAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAADBJREFUKJFj+MzD/Jmf589/m88HPhgzf7A588fGnsfmw4HDB/6cZxiVHJUclaRcEgBTDNsG3NIKqwAAAABJRU5ErkJggg==', 1, '2022-08-24 12:23:43', '2022-08-24 12:23:43'),
(2, 1, '20220824122343', 7, '434685184802', '<div style=\"font-size:0;position:relative;width:202px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:26px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:36px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:48px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:60px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:72px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:84px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:96px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:106px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:118px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:126px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:140px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:148px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:164px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:172px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:186px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:194px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAMoAAAAeAQMAAABXBBPSAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAC1JREFUKJFj+Mx/2Ib/zB9+g/88H/4Yf/58np/f/gzPB3vjAwyjUqNSo1IwKQDgeI8WgpSgRQAAAABJRU5ErkJggg==', 1, '2022-08-24 12:23:43', '2022-08-24 12:23:43');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('diptitrader@gmail.com', 'baIln4TDv8yNSceJK6ASng2Pd2qij7e78YJU0rVczvyzAjHc8sqgLV9pD4f5gy45', '2022-04-26 06:32:05'),
('diptitrader@gmail.com', 'z3nRp39pUcaaEwYEBvzQMM1RbXn8zbQ6lKE1GHTvGhYeAPncrHaTj1xXkmAR5VYg', '2022-04-26 06:32:56'),
('ravishankar20@gmail.com', 'aWE08aZwjCye6onVnPZsvpCOIrugCRJCXfFO1CDVsXRD2m0qYOtXrcrJB3Z09nYa', '2022-04-26 06:33:32');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `staff_id` int(11) NOT NULL DEFAULT 0,
  `admin_id` int(11) NOT NULL DEFAULT 0,
  `payment_for` varchar(255) NOT NULL DEFAULT 'credit',
  `payment_in` varchar(255) NOT NULL DEFAULT 'bank',
  `expense_id` int(11) NOT NULL DEFAULT 0,
  `voucher_no` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_mode` varchar(255) DEFAULT NULL,
  `amount` double(10,2) NOT NULL,
  `chq_utr_no` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `narration` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='added to ledger transaction';

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `store_id`, `staff_id`, `admin_id`, `payment_for`, `payment_in`, `expense_id`, `voucher_no`, `payment_date`, `payment_mode`, `amount`, `chq_utr_no`, `bank_name`, `narration`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 0, 'credit', 'bank', 0, '1661166795', '2022-06-01', 'cheque', 1000.00, '1223234545', 'ICICI Bank', NULL, '2022-08-22 16:44:02', '2022-08-22 16:44:02'),
(6, 2, 0, 0, 'credit', 'bank_n_cash', 0, '1661168943', '2022-06-01', 'cheque', 300.00, '54565656', 'ICICI Bank', NULL, '2022-08-22 17:19:36', '2022-08-22 17:19:36'),
(7, 2, 0, 0, 'credit', 'bank_n_cash', 0, '1661168943', '2022-06-01', 'cash', 700.00, '', '', NULL, '2022-08-22 17:19:36', '2022-08-22 17:19:36');

-- --------------------------------------------------------

--
-- Table structure for table `payment_collections`
--

CREATE TABLE `payment_collections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  `collection_amount` double(10,2) UNSIGNED DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cheque' COMMENT 'cheque,neft,cash',
  `is_ledger_added` tinyint(1) NOT NULL DEFAULT 0,
  `vouchar_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'payemt receipt voucher no',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_approve` int(11) NOT NULL COMMENT '1=approved',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cat_id` bigint(20) NOT NULL,
  `sub_cat_id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost_price` double(10,2) NOT NULL,
  `sell_price` double(10,2) NOT NULL,
  `threshold_price` double(10,2) NOT NULL,
  `product_sales_price_threshold_percentage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '10' COMMENT 'threshold price percentage controlled from settings',
  `hsn_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `_unit_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_unit_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_weight_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_weight_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `igst` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '18' COMMENT 'gst values',
  `sgst` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '9' COMMENT 'gst values',
  `cgst` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '9' COMMENT 'gst values',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1: active, 0: inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `cat_id`, `sub_cat_id`, `name`, `image`, `short_desc`, `desc`, `cost_price`, `sell_price`, `threshold_price`, `product_sales_price_threshold_percentage`, `hsn_code`, `slug`, `_unit_value`, `_unit_type`, `_weight_value`, `_weight_type`, `igst`, `sgst`, `cgst`, `status`, `created_at`, `updated_at`) VALUES
(3, 1, 1, 'Agni Super Cut Off Wheel', 'uploads/product/1653395020.img2.jpg', '<p><a href=\"https://www.indiamart.com/proddetail/agni-super-cut-off-wheel-20921936433.html\">Agni Super Cut Off Wheel</a>…</p>', '<h2><a href=\"https://www.indiamart.com/proddetail/agni-super-cut-off-wheel-20921936433.html\">Agni Super Cut Off Wheel</a></h2>', 0.00, 0.00, 0.00, '10', '1122334473', 'agni-super-cut-off-wheel', '100', 'pieces', '1', 'kg', '18', '9', '9', 1, '2022-05-24 06:53:40', '2022-08-11 07:58:07'),
(4, 1, 1, 'AGNI Premium Double Net Cut Off Wheel Cutting Wheel 4 inch', 'uploads/product/1653829784.91HX4WAQ6OL._SY450_.jpg', '<p>AGNI Premium Double Net Cut Off Wheel Cutting Wheel 4 inch for Metal &amp; Stainless Steel- Red (Pack of 50pcs)</p>', '<ul><li>1) Engineered for general use on metal and stainless steel 2 full sheets of fiberglass nets for added safety</li><li>2) High Quality Abrasive Grains Material for Fast Metal Cutting &amp; Very Long Life. Double-Netted For Better Life. Home &amp; Professional Usage. Can Easily Cut Hard Metals Like Iron &amp; Stainless Steel.</li><li>3) Appropriate For Hand-Held Angle Grinders</li><li>4 )Special bond ensures durable and long-life High-grain concentration for smooth and burr-free cuts</li><li>5) Package Contents : 50 Pieces Of Cut Of Wheels.</li></ul>', 0.00, 0.00, 0.00, '10', '1122334472', 'agni-premium-double-net-cut-off-wheel-cutting-wheel-4-inch-2', '50', 'pieces', '1', 'kg', '18', '9', '9', 1, '2022-05-29 07:39:44', '2022-08-11 08:29:52'),
(5, 2, 2, 'Realme 5i', 'uploads/product/1655905836.images.jpeg', '<p>Realme 5i</p>', '<p>Realme 5i</p>', 0.00, 0.00, 0.00, '10', '1122334471', 'realme-5i-2', '20', 'pieces', '2', 'kg', '18', '9', '9', 1, '2022-06-22 08:20:36', '2022-08-01 12:03:02'),
(6, 2, 2, 'Oppo S3', 'uploads/product/1656062473.images.jpeg', '<p>Oppo S3</p>', '<p>Oppo S3</p>', 0.00, 0.00, 0.00, '10', '1122334470', 'oppo-s3-2', '20', 'pieces', '5', 'kg', '18', '9', '9', 1, '2022-06-24 03:51:13', '2022-08-22 12:32:07'),
(7, 2, 2, 'Realme c11', 'uploads/product/1656925687.dummy.png', '<p>Realme c11</p>', '<p>Realme c11</p>', 200.00, 1100.00, 1000.00, '10', '1122334469', 'realme-c11', '20', 'pieces', '2', 'kg', '18', '9', '9', 1, '2022-07-04 03:38:07', '2022-08-24 06:46:59'),
(8, 2, 2, 'Realme 9 pro', 'uploads/product/1657003593.dummy.png', '<p>Realme 9 pro</p>', '<p>Realme 9 pro</p>', 0.00, 0.00, 0.00, '10', '1122334468', 'realme-9-pro-2', '30', 'pieces', '5', 'kg', '18', '9', '9', 1, '2022-07-05 01:16:33', '2022-08-01 08:31:33'),
(9, 2, 2, 'Oppo A74 5g', 'uploads/product/1657109398.images.jpeg', '<p>Oppo A74 5g</p>', '<p>Oppo A74 5g</p>', 120.00, 1320.00, 1200.00, '10', '1122334467', 'oppo-a74-5g', '10', 'pieces', '5', 'kg', '18', '9', '9', 1, '2022-07-06 06:39:58', '2022-08-23 13:02:15'),
(10, 2, 2, 'Oppo K10 5G', 'uploads/product/1657109444.dummy.png', '<p>Oppo K10 5G</p>', '<p>Oppo K10 5G</p>', 115.00, 1265.00, 1150.00, '10', '1122334466', 'oppo-k10-5g', '10', 'pieces', '5', 'kg', '18', '9', '9', 1, '2022-07-06 06:40:44', '2022-08-23 13:02:15'),
(11, 2, 2, 'Oppo F21 Pro', 'uploads/product/1657109482.dummy.png', '<p>Oppo F21 Pro</p>', '<p>Oppo F21 Pro</p>', 0.00, 0.00, 0.00, '10', '1122334465', 'oppo-f21-pro', '10', 'pieces', '5', 'kg', '18', '9', '9', 1, '2022-07-06 06:41:22', '2022-08-17 06:18:34'),
(12, 2, 2, 'Oppo Reno7 5G', 'uploads/product/1657109523.images.jpeg', '<p>Oppo Reno7 5G</p>', '<p>Oppo Reno7 5G</p>', 0.00, 0.00, 0.00, '10', '1122334459', 'oppo-reno7-5g', '10', 'pieces', '5', 'kg', '18', '9', '9', 1, '2022-07-06 06:42:03', '2022-08-16 11:25:34'),
(13, 2, 3, 'Asus Vivobook 15', 'uploads/product/1657109594.images.jpeg', '<p>Asus Vivobook 15</p>', '<p>Asus Vivobook 15</p>', 155.00, 1705.00, 1550.00, '10', '1122334460', 'asus-vivobook-15', '10', 'pieces', '20', 'kg', '18', '9', '9', 1, '2022-07-06 06:43:14', '2022-08-23 12:18:31'),
(14, 2, 3, 'Lenovo ThinkBook 14', 'uploads/product/1657109635.images.jpeg', '<p>Lenovo ThinkBook 14</p>', '<p>Lenovo ThinkBook 14</p>', 125.00, 1375.00, 1250.00, '10', '1122334461', 'lenovo-thinkbook-14', '10', 'pieces', '20', 'kg', '18', '9', '9', 1, '2022-07-06 06:43:55', '2022-08-23 12:40:02'),
(15, 2, 3, 'Dell Inspiration Core I3', 'uploads/product/1657109688.images.jpeg', '<p>Dell Inspiration Core I3</p>', '<p>Dell Inspiration Core I3</p>', 150.00, 1650.00, 1500.00, '10', '1122334462', 'dell-inspiration-core-i3', '10', 'pieces', '20', 'kg', '18', '9', '9', 1, '2022-07-06 06:44:48', '2022-08-23 12:40:02'),
(16, 2, 3, 'Dell Vostro Core I3', 'uploads/product/1657109729.images.jpeg', '<p>Dell Vostro Core I3</p>', '<p>Dell Vostro Core I3</p>', 130.00, 1430.00, 1300.00, '10', '1122334463', 'dell-vostro-core-i3', '10', 'pieces', '20', 'kg', '18', '9', '9', 1, '2022-07-06 06:45:29', '2022-08-23 12:40:02'),
(17, 2, 2, 'Oppo F19', 'uploads/product/1659341086.Oppo F19.png', '<p>Oppo F19</p>', '<p>Oppo F19</p>', 0.00, 0.00, 0.00, '10', '1122334464', 'oppo-f19-2', '10', 'pieces', '20', 'kg', '18', '9', '9', 1, '2022-07-07 00:55:42', '2022-08-22 12:32:07'),
(18, 2, 2, 'Oppo A31', 'uploads/product/1659341011.Oppo A31.png', '<p>Oppo A31</p>', '<p>Oppo A31</p>', 125.00, 1375.00, 1250.00, '10', '1122334455', 'oppo-a31-2', '10', 'pieces', '25', 'kg', '18', '9', '9', 1, '2022-07-07 00:56:27', '2022-08-23 13:02:15'),
(19, 2, 2, 'Test Mobile One', 'uploads/product/1660716022.realme-5i.jpg', '<p>Test</p>', '<p>Test</p>', 0.00, 0.00, 0.00, '10', '4343434', 'test-mobile-one', '5', 'pieces', '50', 'kg', '18', '9', '9', 1, '2022-08-17 06:00:22', '2022-08-24 05:43:02');

-- --------------------------------------------------------

--
-- Table structure for table `products_old`
--

CREATE TABLE `products_old` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cat_id` bigint(20) NOT NULL,
  `sub_cat_id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost_price` double(10,2) NOT NULL,
  `sell_price` double(10,2) NOT NULL,
  `threshold_price` double(10,2) NOT NULL,
  `product_sales_price_threshold_percentage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '10',
  `hsn_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size_chart` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pack` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `master_pack` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_desc` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keyword` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `view_count` int(11) NOT NULL DEFAULT 0,
  `last_view_count_updated_at` timestamp NULL DEFAULT NULL,
  `is_trending` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1: yes, 0:no',
  `is_best_seller` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1: yes, 0:no',
  `unit_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `igst` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '18',
  `sgst` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '9',
  `cgst` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '9',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1: active, 0: inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products_old`
--

INSERT INTO `products_old` (`id`, `cat_id`, `sub_cat_id`, `name`, `image`, `short_desc`, `desc`, `cost_price`, `sell_price`, `threshold_price`, `product_sales_price_threshold_percentage`, `hsn_code`, `size_chart`, `pack`, `master_pack`, `slug`, `meta_title`, `meta_desc`, `meta_keyword`, `view_count`, `last_view_count_updated_at`, `is_trending`, `is_best_seller`, `unit_value`, `unit_type`, `weight_value`, `weight_type`, `igst`, `sgst`, `cgst`, `status`, `created_at`, `updated_at`) VALUES
(3, 1, 1, 'Agni Super Cut Off Wheel', 'uploads/product/1653395020.img2.jpg', '<p><a href=\"https://www.indiamart.com/proddetail/agni-super-cut-off-wheel-20921936433.html\">Agni Super Cut Off Wheel</a>…</p>', '<h2><a href=\"https://www.indiamart.com/proddetail/agni-super-cut-off-wheel-20921936433.html\">Agni Super Cut Off Wheel</a></h2>', 0.00, 0.00, 0.00, '10', '1122334473', NULL, NULL, NULL, 'agni-super-cut-off-wheel', NULL, NULL, NULL, 0, NULL, 0, 0, '100', 'pieces', '1', 'kg', '18', '9', '9', 1, '2022-05-24 06:53:40', '2022-08-11 07:58:07'),
(4, 1, 1, 'AGNI Premium Double Net Cut Off Wheel Cutting Wheel 4 inch', 'uploads/product/1653829784.91HX4WAQ6OL._SY450_.jpg', '<p>AGNI Premium Double Net Cut Off Wheel Cutting Wheel 4 inch for Metal &amp; Stainless Steel- Red (Pack of 50pcs)</p>', '<ul><li>1) Engineered for general use on metal and stainless steel 2 full sheets of fiberglass nets for added safety</li><li>2) High Quality Abrasive Grains Material for Fast Metal Cutting &amp; Very Long Life. Double-Netted For Better Life. Home &amp; Professional Usage. Can Easily Cut Hard Metals Like Iron &amp; Stainless Steel.</li><li>3) Appropriate For Hand-Held Angle Grinders</li><li>4 )Special bond ensures durable and long-life High-grain concentration for smooth and burr-free cuts</li><li>5) Package Contents : 50 Pieces Of Cut Of Wheels.</li></ul>', 0.00, 1538.90, 1399.00, '10', '1122334472', NULL, NULL, NULL, 'agni-premium-double-net-cut-off-wheel-cutting-wheel-4-inch-2', NULL, NULL, NULL, 0, NULL, 0, 0, '50', 'pieces', '1', 'kg', '18', '9', '9', 1, '2022-05-29 07:39:44', '2022-08-11 08:29:52'),
(5, 2, 2, 'Realme 5i', 'uploads/product/1655905836.images.jpeg', '<p>Realme 5i</p>', '<p>Realme 5i</p>', 0.00, 11000.00, 10000.00, '10', '1122334471', NULL, NULL, NULL, 'realme-5i-2', NULL, NULL, NULL, 0, NULL, 0, 0, '20', 'pieces', '2', 'kg', '18', '9', '9', 1, '2022-06-22 08:20:36', '2022-08-01 12:03:02'),
(6, 2, 2, 'Oppo S3', 'uploads/product/1656062473.images.jpeg', '<p>Oppo S3</p>', '<p>Oppo S3</p>', 0.00, 2200.00, 2000.00, '10', '1122334470', NULL, NULL, NULL, 'oppo-s3-2', NULL, NULL, NULL, 0, NULL, 0, 0, '20', 'pieces', '5', 'kg', '18', '9', '9', 1, '2022-06-24 03:51:13', '2022-08-22 12:32:07'),
(7, 2, 2, 'Realme c11', 'uploads/product/1656925687.dummy.png', '<p>Realme c11</p>', '<p>Realme c11</p>', 0.00, 17050.00, 15500.00, '10', '1122334469', NULL, NULL, NULL, 'realme-c11', NULL, NULL, NULL, 0, NULL, 0, 0, '20', 'pieces', '2', 'kg', '18', '9', '9', 1, '2022-07-04 03:38:07', '2022-08-09 10:54:14'),
(8, 2, 2, 'Realme 9 pro', 'uploads/product/1657003593.dummy.png', '<p>Realme 9 pro</p>', '<p>Realme 9 pro</p>', 0.00, 16500.00, 15000.00, '10', '1122334468', NULL, NULL, NULL, 'realme-9-pro-2', NULL, NULL, NULL, 0, NULL, 0, 0, '30', 'pieces', '5', 'kg', '18', '9', '9', 1, '2022-07-05 01:16:33', '2022-08-01 08:31:33'),
(9, 2, 2, 'Oppo A74 5g', 'uploads/product/1657109398.images.jpeg', '<p>Oppo A74 5g</p>', '<p>Oppo A74 5g</p>', 0.00, 16500.00, 15000.00, '10', '1122334467', NULL, NULL, NULL, 'oppo-a74-5g', NULL, NULL, NULL, 0, NULL, 0, 0, '10', 'pieces', '5', 'kg', '18', '9', '9', 1, '2022-07-06 06:39:58', '2022-08-01 08:11:16'),
(10, 2, 2, 'Oppo K10 5G', 'uploads/product/1657109444.dummy.png', '<p>Oppo K10 5G</p>', '<p>Oppo K10 5G</p>', 0.00, 550.00, 500.00, '10', '1122334466', NULL, NULL, NULL, 'oppo-k10-5g', NULL, NULL, NULL, 0, NULL, 0, 0, '10', 'pieces', '5', 'kg', '18', '9', '9', 1, '2022-07-06 06:40:44', '2022-08-17 06:18:33'),
(11, 2, 2, 'Oppo F21 Pro', 'uploads/product/1657109482.dummy.png', '<p>Oppo F21 Pro</p>', '<p>Oppo F21 Pro</p>', 0.00, 16500.00, 15000.00, '10', '1122334465', NULL, NULL, NULL, 'oppo-f21-pro', NULL, NULL, NULL, 0, NULL, 0, 0, '10', 'pieces', '5', 'kg', '18', '9', '9', 1, '2022-07-06 06:41:22', '2022-08-17 06:18:34'),
(12, 2, 2, 'Oppo Reno7 5G', 'uploads/product/1657109523.images.jpeg', '<p>Oppo Reno7 5G</p>', '<p>Oppo Reno7 5G</p>', 0.00, 1100.00, 1000.00, '10', '1122334459', NULL, NULL, NULL, 'oppo-reno7-5g', NULL, NULL, NULL, 0, NULL, 0, 0, '10', 'pieces', '5', 'kg', '18', '9', '9', 1, '2022-07-06 06:42:03', '2022-08-16 11:25:34'),
(13, 2, 3, 'Asus Vivobook 15', 'uploads/product/1657109594.images.jpeg', '<p>Asus Vivobook 15</p>', '<p>Asus Vivobook 15</p>', 0.00, 1650.00, 1500.00, '10', '1122334460', NULL, NULL, NULL, 'asus-vivobook-15', NULL, NULL, NULL, 0, NULL, 0, 0, '10', 'pieces', '20', 'kg', '18', '9', '9', 1, '2022-07-06 06:43:14', '2022-08-01 08:12:35'),
(14, 2, 3, 'Lenovo ThinkBook 14', 'uploads/product/1657109635.images.jpeg', '<p>Lenovo ThinkBook 14</p>', '<p>Lenovo ThinkBook 14</p>', 0.00, 1375.00, 1250.00, '10', '1122334461', NULL, NULL, NULL, 'lenovo-thinkbook-14', NULL, NULL, NULL, 0, NULL, 0, 0, '10', 'pieces', '20', 'kg', '18', '9', '9', 1, '2022-07-06 06:43:55', '2022-08-01 08:12:35'),
(15, 2, 3, 'Dell Inspiration Core I3', 'uploads/product/1657109688.images.jpeg', '<p>Dell Inspiration Core I3</p>', '<p>Dell Inspiration Core I3</p>', 0.00, 1485.00, 1350.00, '10', '1122334462', NULL, NULL, NULL, 'dell-inspiration-core-i3', NULL, NULL, NULL, 0, NULL, 0, 0, '10', 'pieces', '20', 'kg', '18', '9', '9', 1, '2022-07-06 06:44:48', '2022-08-01 08:12:34'),
(16, 2, 3, 'Dell Vostro Core I3', 'uploads/product/1657109729.images.jpeg', '<p>Dell Vostro Core I3</p>', '<p>Dell Vostro Core I3</p>', 0.00, 1595.00, 1450.00, '10', '1122334463', NULL, NULL, NULL, 'dell-vostro-core-i3', NULL, NULL, NULL, 0, NULL, 0, 0, '10', 'pieces', '20', 'kg', '18', '9', '9', 1, '2022-07-06 06:45:29', '2022-08-16 10:22:28'),
(17, 2, 2, 'Oppo F19', 'uploads/product/1659341086.Oppo F19.png', '<p>Oppo F19</p>', '<p>Oppo F19</p>', 0.00, 1540.00, 1400.00, '10', '1122334464', NULL, NULL, NULL, 'oppo-f19-2', NULL, NULL, NULL, 0, NULL, 0, 0, '10', 'pieces', '20', 'kg', '18', '9', '9', 1, '2022-07-07 00:55:42', '2022-08-22 12:32:07'),
(18, 2, 2, 'Oppo A31', 'uploads/product/1659341011.Oppo A31.png', '<p>Oppo A31</p>', '<p>Oppo A31</p>', 0.00, 1650.00, 1500.00, '10', '1122334455', NULL, NULL, NULL, 'oppo-a31-2', NULL, NULL, NULL, 0, NULL, 0, 0, '10', 'pieces', '25', 'kg', '18', '9', '9', 1, '2022-07-07 00:56:27', '2022-08-22 12:32:07'),
(19, 2, 2, 'Test Mobile One', 'uploads/product/1660716022.realme-5i.jpg', '<p>Test</p>', '<p>Test</p>', 0.00, 0.00, 0.00, '10', NULL, NULL, NULL, NULL, 'test-mobile-one-2', NULL, NULL, NULL, 0, NULL, 0, 0, '5', 'pieces', '50', 'kg', '18', '9', '9', 1, '2022-08-17 06:00:22', '2022-08-22 07:12:25');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1: active, 0: inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_threshold_request`
--

CREATE TABLE `product_threshold_request` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT 'staff_id / placed by',
  `store_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `threshold_price` double(10,2) NOT NULL COMMENT 'product threshold price as per last PO',
  `sell_price` double(10,2) NOT NULL COMMENT 'product sell price as per last PO',
  `price` double(10,2) NOT NULL,
  `qty` int(11) DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `expired_at` datetime DEFAULT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:pending;1:approved;2:denied',
  `customer_approve_note` text DEFAULT NULL,
  `customer_approval` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:pending;1:approved;2:denied',
  `order_no` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_orders`
--

CREATE TABLE `purchase_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unique_id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `supplier_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) NOT NULL,
  `product` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL COMMENT 'no of cartons',
  `pcs` int(11) NOT NULL DEFAULT 0 COMMENT 'no of pieces',
  `unit_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'price per carton',
  `piece_price` double(10,2) NOT NULL COMMENT 'price per piece / product cost price',
  `total_price` double(10,2) NOT NULL,
  `hsn_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight_unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'in gram (calculated)',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1:pending;2:received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_orders`
--

INSERT INTO `purchase_orders` (`id`, `unique_id`, `supplier_id`, `product_id`, `product`, `address`, `state`, `city`, `country`, `pin`, `qty`, `pcs`, `unit_price`, `piece_price`, `total_price`, `hsn_code`, `weight`, `weight_unit`, `weight_value`, `status`, `created_at`, `updated_at`) VALUES
(3, '1661259555119', 2, 18, 'Oppo A31', '2 B, Rani Sankari Ln, Jatin Das Park, Patuapara, Bhowanipore, Kolkata, West Bengal 700025', 'West Bengal', 'Kolkata', 'India', '700025', 10, 5, '1250', 125.00, 12500.00, '1122334455', '2.5', 'kg', '2500', 1, '2022-08-23 13:02:15', '2022-08-23 13:02:15'),
(4, '1661259555119', 2, 9, 'Oppo A74 5g', '2 B, Rani Sankari Ln, Jatin Das Park, Patuapara, Bhowanipore, Kolkata, West Bengal 700025', 'West Bengal', 'Kolkata', 'India', '700025', 10, 5, '1200', 120.00, 12000.00, '1122334467', '3.5', 'kg', '3500', 1, '2022-08-23 13:02:15', '2022-08-23 13:02:15'),
(5, '1661259555119', 2, 10, 'Oppo K10 5G', '2 B, Rani Sankari Ln, Jatin Das Park, Patuapara, Bhowanipore, Kolkata, West Bengal 700025', 'West Bengal', 'Kolkata', 'India', '700025', 10, 5, '1150', 115.00, 11500.00, '1122334466', '4.5', 'kg', '4500', 1, '2022-08-23 13:02:15', '2022-08-23 13:02:15'),
(6, '1661323585381', 2, 7, 'Realme c11', '2 B, Rani Sankari Ln, Jatin Das Park, Patuapara, Bhowanipore, Kolkata, West Bengal 700025', 'West Bengal', 'Kolkata', 'India', '700025', 5, 1, '1000', 200.00, 5000.00, '1122334469', '5', 'kg', '5000', 2, '2022-08-24 06:46:59', '2022-08-24 06:46:59');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_archived_boxes`
--

CREATE TABLE `purchase_order_archived_boxes` (
  `id` int(11) NOT NULL,
  `barcode_no` varchar(255) DEFAULT NULL,
  `code_html` longtext DEFAULT NULL,
  `code_base64_img` longtext DEFAULT NULL,
  `po_id` int(11) NOT NULL DEFAULT 0,
  `po_uniquie_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `product_id` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_boxes`
--

CREATE TABLE `purchase_order_boxes` (
  `id` int(11) NOT NULL,
  `po_id` int(11) NOT NULL DEFAULT 0,
  `po_uniquie_id` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `product_id` int(11) NOT NULL DEFAULT 0,
  `product_description` longtext DEFAULT NULL,
  `barcode_no` varchar(255) NOT NULL DEFAULT '',
  `code_html` longtext DEFAULT NULL,
  `code_base64_img` longtext DEFAULT NULL,
  `is_scanned` tinyint(1) NOT NULL DEFAULT 0,
  `scan_no` varchar(255) DEFAULT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT 0,
  `po_weight_val` varchar(255) DEFAULT NULL COMMENT 'in gram (calculated)',
  `scanned_weight_val` varchar(255) DEFAULT NULL COMMENT 'in gram (calculated)',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `purchase_order_boxes`
--

INSERT INTO `purchase_order_boxes` (`id`, `po_id`, `po_uniquie_id`, `product_id`, `product_description`, `barcode_no`, `code_html`, `code_base64_img`, `is_scanned`, `scan_no`, `is_new`, `po_weight_val`, `scanned_weight_val`, `created_at`, `updated_at`) VALUES
(21, 3, '1661259555119', 18, NULL, '654767851985', '<div style=\"font-size:0;position:relative;width:202px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:28px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:32px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:52px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:60px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:76px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:80px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:94px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:106px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:118px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:122px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:138px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:150px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:160px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:166px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:186px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:194px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAMoAAAAeAQMAAABXBBPSAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAC1JREFUKJFj+Mx/mOcDD/95A54Ph/8YH7bnsT9s8Jnhg73xAYZRqVGpUSmYFABF02uUU1OacAAAAABJRU5ErkJggg==', 1, NULL, 0, '2500', '2499', '2022-08-23 18:32:15', '2022-08-23 18:55:18'),
(22, 3, '1661259555119', 18, NULL, '195628339418', '<div style=\"font-size:0;position:relative;width:202px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:30px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:34px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:56px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:60px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:76px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:82px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:92px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:100px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:118px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:122px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:140px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:150px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:160px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:168px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:186px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:194px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAMoAAAAeAQMAAABXBBPSAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAC1JREFUKJFj+Mx/+LA9/4Hz9vwGZ/iZme3P8x+2+fDhg73xAYZRqVGpUSmYFACHQ2SMAc4f3gAAAABJRU5ErkJggg==', 1, NULL, 0, '2500', '2495', '2022-08-23 18:32:15', '2022-08-23 18:55:04'),
(23, 3, '1661259555119', 18, NULL, '791180965608', '<div style=\"font-size:0;position:relative;width:202px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:30px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:40px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:54px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:60px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:70px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:76px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:92px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:106px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:122px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:126px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:140px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:148px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:164px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:168px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:186px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:194px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAMoAAAAeAQMAAABXBBPSAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAC1JREFUKJFj+Mx/mPnPeWYeY/4P5z8YfzA+w89jz/Phg73xAYZRqVGpUSmYFABFSW1WQIsOIAAAAABJRU5ErkJggg==', 1, NULL, 0, '2500', '2499', '2022-08-23 18:32:15', '2022-08-23 18:54:04'),
(24, 3, '1661259555119', 18, NULL, '59612745174', '<div style=\"font-size:0;position:relative;width:224px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:28px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:38px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:48px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:56px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:70px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:84px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:92px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:100px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:120px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:128px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:138px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:146px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:164px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:172px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:186px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:190px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:208px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:216px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:220px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAOAAAAAeAQMAAAAPe4DLAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAADBJREFUKJFj+MzDfP4wz5//xn94zvMfZvhw3t7AgJ/nv/HnA3/OM4xKjkqOSlIuCQDaHLbQKOQpwQAAAABJRU5ErkJggg==', 1, NULL, 0, '2500', '2499', '2022-08-23 18:32:15', '2022-08-23 18:54:47'),
(25, 3, '1661259555119', 18, NULL, '933818613454', '<div style=\"font-size:0;position:relative;width:202px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:26px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:34px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:52px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:62px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:74px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:84px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:96px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:106px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:118px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:122px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:140px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:144px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:158px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:168px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:186px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:194px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAMoAAAAeAQMAAABXBBPSAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAC1JREFUKJFj+Mx/2MD+DD+zjT3PhwPGzDb8Zz4YHzjwwd74AMOo1KjUqBRMCgC77FS6w01bBgAAAABJRU5ErkJggg==', 1, NULL, 0, '2500', '2499', '2022-08-23 18:32:15', '2022-08-23 18:54:38'),
(26, 3, '1661259555119', 18, NULL, '77648722073', '<div style=\"font-size:0;position:relative;width:224px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:30px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:36px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:48px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:56px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:74px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:78px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:96px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:104px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:116px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:128px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:140px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:146px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:164px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:170px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:188px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:194px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:208px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:216px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:220px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAOAAAAAeAQMAAAAPe4DLAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAADBJREFUKJFj+MzD/Pn8mT//bYwZ/vz5zM9wnsfegN/gP4/xgT/nGUYlRyVHJSmXBADlEqxEWhY4dQAAAABJRU5ErkJggg==', 1, NULL, 0, '2500', '2497', '2022-08-23 18:32:15', '2022-08-23 18:52:36'),
(27, 3, '1661259555119', 18, NULL, '6013204798', '<div style=\"font-size:0;position:relative;width:180px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:30px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:40px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:50px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:56px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:74px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:80px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:96px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:104px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:120px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:128px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:140px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:148px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:164px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:172px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAALQAAAAeAQMAAAC/hKb5AAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAClJREFUKJFj+Mx/+POfMzZ/bAz+HPjz+c+B8/z8NvxnPjCMio+KD0FxAOBesvKQyUMVAAAAAElFTkSuQmCC', 1, NULL, 0, '2500', '2501', '2022-08-23 18:32:15', '2022-08-23 18:48:33'),
(28, 3, '1661259555119', 18, NULL, '695420516161', '<div style=\"font-size:0;position:relative;width:202px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:26px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:34px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:52px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:56px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:74px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:80px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:94px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:102px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:118px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:128px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:140px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:150px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:160px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:170px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:186px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:194px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAMoAAAAeAQMAAABXBBPSAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAC1JREFUKJFj+Mx/2MaA/8wHG4M/nz8zH2Y4z8Ns8N/gg73xAYZRqVGpUSmYFACrMXUSzAe57AAAAABJRU5ErkJggg==', 1, NULL, 0, '2500', '2502', '2022-08-23 18:32:15', '2022-08-23 18:48:20'),
(29, 3, '1661259555119', 18, NULL, '717965504983', '<div style=\"font-size:0;position:relative;width:202px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:28px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:34px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:52px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:62px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:72px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:76px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:98px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:102px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:116px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:124px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:136px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:148px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:160px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:166px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:186px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:194px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAMoAAAAeAQMAAABXBBPSAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAC1JREFUKJFj+Mx/mN+Ah/+zwXmGD8afz/Cf+c9j8/nAB3vjAwyjUqNSo1IwKQB12YN8BEAp2QAAAABJRU5ErkJggg==', 1, NULL, 0, '2500', '2497', '2022-08-23 18:32:15', '2022-08-23 18:48:06'),
(30, 3, '1661259555119', 18, NULL, '996043604290', '<div style=\"font-size:0;position:relative;width:202px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:26px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:34px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:52px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:62px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:70px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:80px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:96px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:106px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:114px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:120px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:138px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:148px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:162px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:168px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:186px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:194px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAMoAAAAeAQMAAABXBBPSAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAC1JREFUKJFj+Mx/2N7+/PnPxgf+/PlvbPOH3/68jc2HD/bGBxhGpUalRqVgUgDv1bxw60Uq9AAAAABJRU5ErkJggg==', 1, NULL, 0, '2500', '2498', '2022-08-23 18:32:15', '2022-08-23 18:44:54'),
(31, 4, '1661259555119', 9, NULL, '223250699909', '<div style=\"font-size:0;position:relative;width:202px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:30px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:38px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:54px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:60px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:76px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:80px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:92px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:100px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:114px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:122px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:140px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:146px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:158px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:166px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:186px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:194px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAMoAAAAeAQMAAABXBBPSAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAC1JREFUKJFj+Mx/+PBnfubzNjx/zvMw29uf5zEwZj7wwd74AMOo1KjUqBRMCgAXxk2yEOm+TwAAAABJRU5ErkJggg==', 0, NULL, 0, '3500', NULL, '2022-08-23 18:32:15', '2022-08-23 18:32:15'),
(32, 4, '1661259555119', 9, NULL, '707250837717', '<div style=\"font-size:0;position:relative;width:202px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:26px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:38px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:50px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:62px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:76px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:80px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:92px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:104px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:120px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:128px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:138px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:148px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:160px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:172px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:186px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:194px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAMoAAAAeAQMAAABXBBPSAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAC1JREFUKJFj+Mx/2IaZx4bZhufP+Q+H//w5Y89v84fng73xAYZRqVGpUSmYFACM8XiW276j8wAAAABJRU5ErkJggg==', 0, NULL, 0, '3500', NULL, '2022-08-23 18:32:15', '2022-08-23 18:32:15'),
(33, 4, '1661259555119', 9, NULL, '460697691', '<div style=\"font-size:0;position:relative;width:202px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:30px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:36px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:48px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:56px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:74px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:84px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:92px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:100px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:118px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:122px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:142px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:148px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:166px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:170px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:186px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:194px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAMoAAAAeAQMAAABXBBPSAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAACxJREFUKJFj+MzDfJj/zJ//9vZnzgOZBvyfz9sz23ywNz7AMCo1KjUqBZMCAJoEbKLfwxM1AAAAAElFTkSuQmCC', 0, NULL, 0, '3500', NULL, '2022-08-23 18:32:15', '2022-08-23 18:32:15'),
(34, 4, '1661259555119', 9, NULL, '664754174101', '<div style=\"font-size:0;position:relative;width:202px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:28px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:38px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:52px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:60px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:74px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:78px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:94px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:104px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:120px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:128px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:140px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:146px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:166px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:172px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:186px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:194px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAMoAAAAeAQMAAABXBBPSAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAACxJREFUKJFj+Mx/mIf5DP95e+MDhz98PnDgPL+N/WGeD0Auw6jUqNSoFEwKAOX0idCshC/1AAAAAElFTkSuQmCC', 0, NULL, 0, '3500', NULL, '2022-08-23 18:32:15', '2022-08-23 18:32:15');
INSERT INTO `purchase_order_boxes` (`id`, `po_id`, `po_uniquie_id`, `product_id`, `product_description`, `barcode_no`, `code_html`, `code_base64_img`, `is_scanned`, `scan_no`, `is_new`, `po_weight_val`, `scanned_weight_val`, `created_at`, `updated_at`) VALUES
(35, 4, '1661259555119', 9, NULL, '288759444491', '<div style=\"font-size:0;position:relative;width:202px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:32px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:38px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:56px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:60px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:78px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:84px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:96px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:102px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:118px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:124px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:142px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:148px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:166px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:170px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:186px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:194px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAMoAAAAeAQMAAABXBBPSAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAC5JREFUKJFj+Mx/+MNn/g9n7JnPHPj8mfn8+c/n7Q8bfLA3PsAwKjUqNSoFkwIAFPbcFMkAlq0AAAAASUVORK5CYII=', 0, NULL, 0, '3500', NULL, '2022-08-23 18:32:15', '2022-08-23 18:32:15'),
(36, 4, '1661259555119', 9, NULL, '693005117172', '<div style=\"font-size:0;position:relative;width:202px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:26px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:34px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:50px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:56px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:74px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:80px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:98px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:104px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:116px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:122px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:138px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:150px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:164px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:168px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:186px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:194px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAMoAAAAeAQMAAABXBBPSAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAC1JREFUKJFj+Mx/2MaA3+aDgcGHDwaH+Q14bJhteP58sDc+wDAqNSo1KgWTAgBjeDzSS5bKxAAAAABJRU5ErkJggg==', 0, NULL, 0, '3500', NULL, '2022-08-23 18:32:15', '2022-08-23 18:32:15'),
(37, 4, '1661259555119', 9, NULL, '271293231164', '<div style=\"font-size:0;position:relative;width:202px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:30px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:38px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:48px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:56px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:70px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:78px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:96px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:102px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:120px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:126px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:136px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:146px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:160px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:168px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:186px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:194px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAMoAAAAeAQMAAABXBBPSAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAC5JREFUKJFj+Mx/+PNhng9/jJn//Pn8+cBhngM2NgcOfLA3PsAwKjUqNSoFkwIAjvHeMKuHxnAAAAAASUVORK5CYII=', 0, NULL, 0, '3500', NULL, '2022-08-23 18:32:15', '2022-08-23 18:32:15'),
(38, 4, '1661259555119', 9, NULL, '83337447', '<div style=\"font-size:0;position:relative;width:158px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:26px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:38px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:48px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:56px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:76px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:84px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:96px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:104px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:114px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:126px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:142px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:150px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAJ4AAAAeAQMAAADn+zXgAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAACVJREFUKJFj+Mx/2P4wz4EPBvw8B/58tmc+z/zZhmFUcFSQloIAVAYkkFlT61kAAAAASUVORK5CYII=', 0, NULL, 0, '3500', NULL, '2022-08-23 18:32:15', '2022-08-23 18:32:15'),
(39, 4, '1661259555119', 9, NULL, '55652295303', '<div style=\"font-size:0;position:relative;width:224px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:28px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:38px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:48px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:56px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:78px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:82px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:94px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:106px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:120px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:128px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:138px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:146px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:160px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:166px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:186px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:190px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:208px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:216px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:220px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAOAAAAAeAQMAAAAPe4DLAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAADBJREFUKJFj+MzDfP4wz5//9sw2nz8Yf/hw3t7e4PCBD8afD/w5zzAqOSo5Kkm5JACXQvSwnHxh5wAAAABJRU5ErkJggg==', 1, NULL, 0, '3500', '3502', '2022-08-23 18:32:15', '2022-08-23 18:56:41'),
(40, 4, '1661259555119', 9, NULL, '964152436812', '<div style=\"font-size:0;position:relative;width:202px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:26px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:40px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:54px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:62px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:72px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:84px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:92px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:102px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:120px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:126px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:136px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:144px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:158px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:172px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:186px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:194px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAMoAAAAeAQMAAABXBBPSAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAC1JREFUKJFj+Mx/2P7AeWZmmz8855k/Mxw+8+GP8R+eD/bGBxhGpUalRqVgUgAYk5RcDoYFywAAAABJRU5ErkJggg==', 1, NULL, 0, '3500', '3503', '2022-08-23 18:32:15', '2022-08-23 18:56:25'),
(41, 5, '1661259555119', 10, NULL, '435132504015', '<div style=\"font-size:0;position:relative;width:202px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:26px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:36px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:50px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:58px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:76px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:82px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:98px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:102px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:120px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:124px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:136px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:146px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:158px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:166px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:186px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:194px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAMoAAAAeAQMAAABXBBPSAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAC1JREFUKJFj+Mx/2Ib/vL2BDb/NB+PPB87w/LExPvzhg73xAYZRqVGpUSmYFABkeX7qIibAkQAAAABJRU5ErkJggg==', 0, NULL, 0, '4500', NULL, '2022-08-23 18:32:15', '2022-08-23 18:32:15'),
(42, 5, '1661259555119', 10, NULL, '245793609283', '<div style=\"font-size:0;position:relative;width:202px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:30px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:36px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:52px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:58px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:70px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:78px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:96px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:106px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:114px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:118px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:136px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:148px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:160px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:172px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:186px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:194px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAMoAAAAeAQMAAABXBBPSAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAC1JREFUKJFj+Mx/+DM//3kDY+Y/f/4bG//h+c9j8IHng73xAYZRqVGpUSmYFAA/5n+ee1CxMQAAAABJRU5ErkJggg==', 0, NULL, 0, '4500', NULL, '2022-08-23 18:32:15', '2022-08-23 18:32:15'),
(43, 5, '1661259555119', 10, NULL, '26553090989', '<div style=\"font-size:0;position:relative;width:224px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:30px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:40px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:48px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:56px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:72px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:76px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:94px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:102px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:118px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:124px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:140px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:146px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:160px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:166px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:182px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:192px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:208px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:216px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:220px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAOAAAAAeAQMAAAAPe4DLAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAADBJREFUKJFj+MzDfPjDmT//Dc4zfP78+TAPP4+Bzec/hw8cPvAHKDIqOSo5KkmxJADEdgqLrSEpoQAAAABJRU5ErkJggg==', 0, NULL, 0, '4500', NULL, '2022-08-23 18:32:15', '2022-08-23 18:32:15'),
(44, 5, '1661259555119', 10, NULL, '28954545303', '<div style=\"font-size:0;position:relative;width:224px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:30px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:40px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:48px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:56px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:72px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:78px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:96px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:100px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:118px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:122px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:138px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:146px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:160px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:166px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:186px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:192px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:208px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:216px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:220px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAOAAAAAeAQMAAAAPe4DLAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAADBJREFUKJFj+MzDfPjDmT//bT7/+XOe+bMNv729weEDB2wOH/hznmFUclRyVJJySQAQgAODuqdFeAAAAABJRU5ErkJggg==', 0, NULL, 0, '4500', NULL, '2022-08-23 18:32:15', '2022-08-23 18:32:15'),
(45, 5, '1661259555119', 10, NULL, '981994239295', '<div style=\"font-size:0;position:relative;width:202px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:32px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:40px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:52px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:56px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:74px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:78px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:96px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:102px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:114px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:118px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:136px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:146px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:158px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:168px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:186px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:194px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAMoAAAAeAQMAAABXBBPSAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAACtJREFUKJFj+Mx/+M+B8zx/DIz//Pn82fgPz38Q64O98QGGUalRqVEpmBQA9/7pcCToENwAAAAASUVORK5CYII=', 0, NULL, 0, '4500', NULL, '2022-08-23 18:32:15', '2022-08-23 18:32:15'),
(46, 5, '1661259555119', 10, NULL, '115068910793', '<div style=\"font-size:0;position:relative;width:202px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:32px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:38px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:54px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:58px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:76px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:82px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:98px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:104px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:116px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:126px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:136px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:144px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:162px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:172px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:186px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:194px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAMoAAAAeAQMAAABXBBPSAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAC1JREFUKJFj+Mx/+MBhfmZ7Ax6b/zaf+Zl5Dvw3sOH5YG98gGFUalRqVAomBQDW7kFkgf9AcgAAAABJRU5ErkJggg==', 0, NULL, 0, '4500', NULL, '2022-08-23 18:32:15', '2022-08-23 18:32:15'),
(47, 5, '1661259555119', 10, NULL, '526847585858', '<div style=\"font-size:0;position:relative;width:202px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:28px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:40px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:54px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:60px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:74px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:82px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:96px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:106px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:118px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:128px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:140px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:150px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:164px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:170px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:186px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:194px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAMoAAAAeAQMAAABXBBPSAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAC1JREFUKJFj+Mx/+PyBM8z8BvY2fz4Yfz5w/jyzAY/NB3vjAwyjUqNSo1IwKQARpIN8LyAtvQAAAABJRU5ErkJggg==', 0, NULL, 0, '4500', NULL, '2022-08-23 18:32:15', '2022-08-23 18:32:15'),
(48, 5, '1661259555119', 10, NULL, '724551259842', '<div style=\"font-size:0;position:relative;width:202px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:28px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:40px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:48px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:56px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:72px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:80px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:98px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:102px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:120px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:128px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:136px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:142px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:164px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:170px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:186px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:194px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAMoAAAAeAQMAAABXBBPSAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAC5JREFUKJFj+Mx/mJ/hzJ8PNn8O/DE+/OfAmc8f7HlsPtgbH2AYlRqVGpWCSQEAF9bSPAC8CDwAAAAASUVORK5CYII=', 0, NULL, 0, '4500', NULL, '2022-08-23 18:32:15', '2022-08-23 18:32:15');
INSERT INTO `purchase_order_boxes` (`id`, `po_id`, `po_uniquie_id`, `product_id`, `product_description`, `barcode_no`, `code_html`, `code_base64_img`, `is_scanned`, `scan_no`, `is_new`, `po_weight_val`, `scanned_weight_val`, `created_at`, `updated_at`) VALUES
(49, 5, '1661259555119', 10, NULL, '573143514854', '<div style=\"font-size:0;position:relative;width:202px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:30px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:36px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:50px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:60px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:70px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:80px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:94px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:102px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:118px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:126px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:140px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:144px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:164px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:170px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:186px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:194px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAMoAAAAeAQMAAABXBBPSAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAC5JREFUKJFj+Mx/+PMZfht+4wN/Pn9m/vz5/JkP9udtPtgbH2AYlRqVGpWCSQEAJmzTSnYcILsAAAAASUVORK5CYII=', 0, NULL, 0, '4500', NULL, '2022-08-23 18:32:15', '2022-08-23 18:32:15'),
(50, 5, '1661259555119', 10, NULL, '128748141766', '<div style=\"font-size:0;position:relative;width:202px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:26px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:34px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:56px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:60px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:74px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:82px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:94px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:102px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:116px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:126px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:138px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:148px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:158px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:166px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:186px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:194px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAMoAAAAeAQMAAABXBBPSAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAACxJREFUKJFj+Mx/2Mae/8MZe3ubw4eBnDMG/MafD3ywNz7AMCo1KjUqBZMCABtGiiq1Wqc3AAAAAElFTkSuQmCC', 0, NULL, 0, '4500', NULL, '2022-08-23 18:32:15', '2022-08-23 18:32:15'),
(51, 6, '1661323585381', 7, NULL, '358968811470', '<div style=\"font-size:0;position:relative;width:202px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:30px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:38px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:50px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:56px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:76px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:82px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:94px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:98px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:116px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:124px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:136px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:148px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:158px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:168px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:186px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:194px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAMoAAAAeAQMAAABXBBPSAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAC1JREFUKJFj+Mx/mJn5vM1/Ax6bw/aH+fnPfOAx/vPng73xAYZRqVGpUSmYFAAhxHAmq+oROgAAAABJRU5ErkJggg==', 1, NULL, 0, '5000', '4994', '2022-08-24 12:16:59', '2022-08-24 12:18:40'),
(52, 6, '1661323585381', 7, NULL, '244414959956', '<div style=\"font-size:0;position:relative;width:202px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:30px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:36px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:52px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:58px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:72px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:80px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:92px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:102px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:114px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:122px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:144px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:148px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:164px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:170px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:186px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:194px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAMoAAAAeAQMAAABXBBPSAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAC1JREFUKJFj+Mx/+DM/D7+9wYc/5z8z29ufP3Dent/gg73xAYZRqVGpUSmYFABFZ3bUCSonywAAAABJRU5ErkJggg==', 1, NULL, 0, '5000', '4992', '2022-08-24 12:16:59', '2022-08-24 12:18:15'),
(53, 6, '1661323585381', 7, NULL, '618282541291', '<div style=\"font-size:0;position:relative;width:202px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:30px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:40px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:50px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:56px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:72px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:78px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:96px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:100px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:114px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:122px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:142px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:148px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:166px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:172px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:186px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:194px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAMoAAAAeAQMAAABXBBPSAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAC1JREFUKJFj+Mx/+DDDGYP/Bof//DnPbGPP//m8PfOZD/bGBxhGpUalRqVgUgDNlJwYXETnxAAAAABJRU5ErkJggg==', 1, NULL, 0, '5000', '4997', '2022-08-24 12:16:59', '2022-08-24 12:17:58'),
(54, 6, '1661323585381', 7, NULL, '434685184802', '<div style=\"font-size:0;position:relative;width:202px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:26px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:36px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:48px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:60px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:72px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:84px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:96px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:106px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:118px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:126px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:140px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:148px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:164px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:172px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:186px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:194px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAMoAAAAeAQMAAABXBBPSAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAC1JREFUKJFj+Mx/2Ib/zB9+g/88H/4Yf/58np/f/gzPB3vjAwyjUqNSo1IwKQDgeI8WgpSgRQAAAABJRU5ErkJggg==', 1, NULL, 0, '5000', '4992', '2022-08-24 12:16:59', '2022-08-24 12:18:28'),
(55, 6, '1661323585381', 7, NULL, '83040591526', '<div style=\"font-size:0;position:relative;width:224px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:30px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:36px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:48px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:56px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:72px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:78px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:98px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:102px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:122px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:128px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:136px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:146px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:164px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:170px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:184px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:192px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:208px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:216px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:220px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAOAAAAAeAQMAAAAPe4DLAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAADBJREFUKJFj+MzD/Jmf589/m88HPhgzf7A588fGnsfmw4HDB/6cZxiVHJUclaRcEgBTDNsG3NIKqwAAAABJRU5ErkJggg==', 1, NULL, 0, '5000', '5001', '2022-08-24 12:16:59', '2022-08-24 12:17:32');

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1: active, 0: inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'XS', 1, '2022-03-04 00:20:48', '2022-05-30 13:49:46'),
(2, 'S', 1, '2022-03-04 00:20:48', '2022-05-30 13:49:46'),
(3, 'M', 1, '2022-03-04 00:20:48', '2022-05-30 13:49:46'),
(4, 'L', 1, '2022-03-04 00:20:48', '2022-05-30 13:49:46'),
(5, 'XL', 1, '2022-03-04 00:20:48', '2022-05-30 13:49:46'),
(6, '2XL', 1, '2022-03-04 00:20:48', '2022-05-30 13:49:46'),
(7, '3XL', 1, '2022-03-10 04:30:59', '2022-05-30 13:49:46'),
(8, '4XL', 1, '2022-03-10 04:30:59', '2022-05-30 13:49:46'),
(9, '1 yr', 1, '2022-03-21 08:16:06', '2022-05-30 13:49:46'),
(10, '2 yr', 1, '2022-03-21 08:16:33', '2022-05-30 13:49:46'),
(11, '3 yr', 1, '2022-03-21 08:16:33', '2022-05-30 13:49:46'),
(12, '4 yr', 1, '2022-03-21 08:16:33', '2022-05-30 13:49:46'),
(13, '5 yr', 1, '2022-03-21 08:16:33', '2022-05-30 13:49:46'),
(14, '6 yr', 1, '2022-03-21 08:16:33', '2022-05-30 13:49:46'),
(15, '7 yr', 1, '2022-03-21 08:16:33', '2022-05-30 13:49:46'),
(16, '8 yr', 1, '2022-03-21 08:16:34', '2022-05-30 13:49:46'),
(17, '9 yr', 1, '2022-03-21 08:16:34', '2022-05-30 13:49:46'),
(18, '10 yr', 1, '2022-03-21 08:16:34', '2022-05-30 13:49:46'),
(19, '11 yr', 1, '2022-03-21 08:16:34', '2022-05-30 13:49:46'),
(20, '12 yr', 1, '2022-03-21 08:16:34', '2022-05-30 13:49:46'),
(21, '13 yr', 1, '2022-03-21 08:16:34', '2022-05-30 13:49:46'),
(22, '14 yr', 1, '2022-03-21 08:16:34', '2022-05-30 13:49:46'),
(23, 'FREE SIZE', 1, '2022-03-30 09:34:57', '2022-05-30 13:49:46');

-- --------------------------------------------------------

--
-- Table structure for table `staff_commision`
--

CREATE TABLE `staff_commision` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `paid_as` varchar(255) DEFAULT NULL COMMENT 'order_creator;payment_collector',
  `commission_percentage_val` varchar(255) DEFAULT '''30''' COMMENT 'order_creator or payment_collector',
  `commission_amount` double NOT NULL,
  `vouchar_no` varchar(255) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `invoice_payment_id` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff_commision`
--

INSERT INTO `staff_commision` (`id`, `staff_id`, `paid_as`, `commission_percentage_val`, `commission_amount`, `vouchar_no`, `order_id`, `invoice_id`, `invoice_payment_id`, `created_at`, `updated_at`) VALUES
(1, 8, 'order_creator', '30', 3.42, '1659349241', 8, 1, 3, '2022-08-01 15:50:45', '2022-08-01 15:50:45'),
(2, 11, 'payment_collector', '70', 7.98, '1659349241', 8, 1, 3, '2022-08-01 15:50:45', '2022-08-01 15:50:45'),
(3, 8, 'order_creator', '30', 3.36, '1659530074', 9, 2, 8, '2022-08-03 18:04:39', '2022-08-03 18:04:39'),
(4, 21, 'payment_collector', '70', 7.84, '1659530074', 9, 2, 8, '2022-08-03 18:04:39', '2022-08-03 18:04:39'),
(5, 8, 'order_creator', '30', 0.19, '1659534696', 9, 3, 10, '2022-08-03 19:21:39', '2022-08-03 19:21:39'),
(6, 21, 'payment_collector', '70', 0.45, '1659534696', 9, 3, 10, '2022-08-03 19:21:39', '2022-08-03 19:21:39');

-- --------------------------------------------------------

--
-- Table structure for table `staff_post_details`
--

CREATE TABLE `staff_post_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `staff_id` bigint(20) NOT NULL,
  `designation` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` double(10,2) DEFAULT 0.00,
  `house_rent` double(10,2) DEFAULT 0.00,
  `convenience` double(10,2) DEFAULT 0.00 COMMENT 'per kilometer TA amount',
  `dearness` double(10,2) DEFAULT 0.00,
  `medical` double(10,2) DEFAULT 0.00,
  `overtime` double(10,2) DEFAULT 0.00,
  `city_compensatory` double(10,2) DEFAULT 0.00,
  `project` double(10,2) DEFAULT 0.00,
  `food` double(10,2) DEFAULT 0.00,
  `special` double(10,2) DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `staff_post_details`
--

INSERT INTO `staff_post_details` (`id`, `staff_id`, `designation`, `salary`, `house_rent`, `convenience`, `dearness`, `medical`, `overtime`, `city_compensatory`, `project`, `food`, `special`, `created_at`, `updated_at`) VALUES
(1, 8, 'staff', 10000.00, 106.00, 30.00, 564.00, 980.00, 99.00, 886.00, 809.00, 743.00, 230.00, '2022-05-26 00:30:05', '2022-06-13 01:31:41'),
(2, 11, 'staff', 10000.00, 106.00, 30.00, 564.00, 980.00, 99.00, 886.00, 809.00, 743.00, 230.00, '2022-05-26 00:30:05', '2022-06-13 01:31:41'),
(12, 21, 'Staff', 10000.00, 434.00, 34324.00, 221.00, 1212.00, 12121.00, 212.00, 1212.00, 2122.00, 122.00, '2022-07-06 23:45:15', '2022-07-06 23:45:15'),
(13, 22, '5', 6656566.00, 656.00, 30.00, 268.00, 634.00, 39.00, 269.00, 960.00, 843.00, 287.00, '2022-08-05 05:44:23', '2022-08-17 08:33:20');

-- --------------------------------------------------------

--
-- Table structure for table `staff_salary`
--

CREATE TABLE `staff_salary` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `monthly_salary` double(10,2) NOT NULL,
  `daily_salary` double(10,2) NOT NULL,
  `travelling_allowance` double(10,2) NOT NULL,
  `is_current` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff_salary`
--

INSERT INTO `staff_salary` (`id`, `user_id`, `monthly_salary`, `daily_salary`, `travelling_allowance`, `is_current`, `created_at`, `updated_at`) VALUES
(1, 22, 3000.00, 100.00, 5.00, 1, '2022-08-22 11:45:53', '2022-08-22 11:45:53'),
(6, 24, 31500.00, 1050.00, 5.00, 0, '2022-08-22 12:21:15', '2022-08-22 12:21:15'),
(7, 24, 31500.00, 1050.00, 6.00, 0, '2022-08-22 12:22:16', '2022-08-22 12:22:16'),
(8, 24, 31500.00, 1050.00, 7.50, 0, '2022-08-22 12:23:37', '2022-08-22 12:23:37'),
(9, 24, 31500.00, 1050.00, 6.50, 1, '2022-08-22 12:24:01', '2022-08-22 12:24:01'),
(10, 21, 15000.00, 500.00, 5.00, 1, '2022-08-22 14:00:39', '2022-08-22 14:00:39'),
(11, 11, 15000.00, 500.00, 5.00, 1, '2022-08-22 14:01:19', '2022-08-22 14:01:19'),
(12, 8, 15000.00, 500.00, 5.00, 1, '2022-08-22 14:02:00', '2022-08-22 14:02:00');

-- --------------------------------------------------------

--
-- Table structure for table `staff_unpaid_amounts`
--

CREATE TABLE `staff_unpaid_amounts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `entry_date` date DEFAULT NULL,
  `purpose` varchar(255) NOT NULL,
  `amount` double(10,2) NOT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `id` int(11) NOT NULL,
  `po_unique_id` varchar(255) NOT NULL DEFAULT '',
  `grn_no` varchar(255) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='inventory';

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`id`, `po_unique_id`, `grn_no`, `created_at`, `updated_at`) VALUES
(1, '1661323585381', 'TDQJS4C07P', '2022-08-24 12:18:49', '2022-08-24 12:18:49');

-- --------------------------------------------------------

--
-- Table structure for table `stock_boxes`
--

CREATE TABLE `stock_boxes` (
  `id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL DEFAULT 0,
  `product_id` int(11) NOT NULL DEFAULT 0,
  `barcode_no` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `code_html` longtext DEFAULT NULL,
  `code_base64_img` longtext DEFAULT NULL,
  `is_scanned` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'scan for packing slip',
  `scan_no` varchar(255) DEFAULT NULL COMMENT 'for stockout; validate the same barcode here',
  `packing_slip_box_id` int(11) DEFAULT NULL,
  `stock_in_weight_val` varchar(255) DEFAULT NULL COMMENT 'stock in time scanned weight; in gram (calculated); from api',
  `stock_out_weight_val` varchar(255) DEFAULT NULL COMMENT 'stock out time scanned weight; in gram (calculated); from api',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stock_boxes`
--

INSERT INTO `stock_boxes` (`id`, `stock_id`, `product_id`, `barcode_no`, `code_html`, `code_base64_img`, `is_scanned`, `scan_no`, `packing_slip_box_id`, `stock_in_weight_val`, `stock_out_weight_val`, `created_at`, `updated_at`) VALUES
(1, 1, 7, '83040591526', '<div style=\"font-size:0;position:relative;width:224px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:30px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:36px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:48px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:56px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:72px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:78px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:98px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:102px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:122px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:128px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:136px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:146px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:164px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:170px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:184px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:192px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:208px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:216px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:220px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAOAAAAAeAQMAAAAPe4DLAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAADBJREFUKJFj+MzD/Jmf589/m88HPhgzf7A588fGnsfmw4HDB/6cZxiVHJUclaRcEgBTDNsG3NIKqwAAAABJRU5ErkJggg==', 1, '83040591526', 1, '5001', '5003', '2022-08-24 12:18:49', '2022-08-24 12:31:58'),
(2, 1, 7, '434685184802', '<div style=\"font-size:0;position:relative;width:202px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:26px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:36px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:48px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:60px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:72px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:84px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:96px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:106px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:118px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:126px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:140px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:148px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:164px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:172px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:186px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:194px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAMoAAAAeAQMAAABXBBPSAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAC1JREFUKJFj+Mx/2Ib/zB9+g/88H/4Yf/58np/f/gzPB3vjAwyjUqNSo1IwKQDgeI8WgpSgRQAAAABJRU5ErkJggg==', 1, '434685184802', 2, '4992', '4991', '2022-08-24 12:18:49', '2022-08-24 12:33:36'),
(3, 1, 7, '618282541291', '<div style=\"font-size:0;position:relative;width:202px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:30px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:40px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:50px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:56px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:72px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:78px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:96px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:100px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:114px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:122px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:142px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:148px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:166px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:172px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:186px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:194px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAMoAAAAeAQMAAABXBBPSAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAC1JREFUKJFj+Mx/+DDDGYP/Bof//DnPbGPP//m8PfOZD/bGBxhGpUalRqVgUgDNlJwYXETnxAAAAABJRU5ErkJggg==', 0, NULL, NULL, '4997', NULL, '2022-08-24 12:18:49', '2022-08-24 12:18:49'),
(4, 1, 7, '244414959956', '<div style=\"font-size:0;position:relative;width:202px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:30px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:36px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:52px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:58px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:72px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:80px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:92px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:102px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:114px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:122px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:144px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:148px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:164px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:170px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:186px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:194px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAMoAAAAeAQMAAABXBBPSAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAC1JREFUKJFj+Mx/+DM/D7+9wYc/5z8z29ufP3Dent/gg73xAYZRqVGpUSmYFABFZ3bUCSonywAAAABJRU5ErkJggg==', 0, NULL, NULL, '4992', NULL, '2022-08-24 12:18:49', '2022-08-24 12:18:49'),
(5, 1, 7, '358968811470', '<div style=\"font-size:0;position:relative;width:202px;height:30px;\">\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:0px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:6px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:12px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:22px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:30px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:38px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:44px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:50px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:56px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:66px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:76px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:82px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:88px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:94px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:98px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:110px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:116px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:124px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:132px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:136px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:148px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:154px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:8px;height:30px;position:absolute;left:158px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:168px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:176px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:6px;height:30px;position:absolute;left:186px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:2px;height:30px;position:absolute;left:194px;top:0\">&nbsp;</div>\n<div style=\"background-color:black;width:4px;height:30px;position:absolute;left:198px;top:0\">&nbsp;</div>\n</div>\n', 'iVBORw0KGgoAAAANSUhEUgAAAMoAAAAeAQMAAABXBBPSAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAC1JREFUKJFj+Mx/mJn5vM1/Ax6bw/aH+fnPfOAx/vPng73xAYZRqVGpUSmYFAAhxHAmq+oROgAAAABJRU5ErkJggg==', 0, NULL, NULL, '4994', NULL, '2022-08-24 12:18:49', '2022-08-24 12:18:49');

-- --------------------------------------------------------

--
-- Table structure for table `stock_products`
--

CREATE TABLE `stock_products` (
  `id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL DEFAULT 0,
  `product_id` int(11) NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `product_description` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stock_products`
--

INSERT INTO `stock_products` (`id`, `stock_id`, `product_id`, `quantity`, `product_description`, `created_at`, `updated_at`) VALUES
(1, 1, 7, 5, '', '2022-08-24 12:18:49', '2022-08-24 12:18:49');

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `store_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bussiness_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_OCC_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_wa_same` tinyint(1) NOT NULL DEFAULT 0,
  `whatsapp` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lng` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `area` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_outstation` tinyint(1) NOT NULL DEFAULT 0,
  `billing_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_landmark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_pin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_billing_shipping_same` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_landmark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_pin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gst_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gst_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_limit` int(11) DEFAULT NULL,
  `credit_days` int(11) DEFAULT NULL,
  `no_order_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1: active, 0: inactive, 2: pending\r\n',
  `created_from` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `created_by` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='or customers';

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `user_id`, `store_name`, `slug`, `bussiness_name`, `store_OCC_number`, `email`, `contact`, `is_wa_same`, `whatsapp`, `address`, `lat`, `lng`, `area`, `state`, `city`, `pin`, `address_outstation`, `billing_address`, `billing_landmark`, `billing_state`, `billing_city`, `billing_pin`, `billing_country`, `is_billing_shipping_same`, `shipping_address`, `shipping_landmark`, `shipping_state`, `shipping_city`, `shipping_pin`, `shipping_country`, `gst_number`, `gst_file`, `credit_limit`, `credit_days`, `no_order_reason`, `image`, `status`, `created_from`, `created_by`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Sample store 1', 'sample-store-1', 'S1', NULL, 'samplestore1@gmail.com', '9876543213', 1, '9876543213', 'Plot-A1-4 Block EP &GP, 804, Street Number 23, GP Block, Sector V, Bidhannagar, Kolkata, West Bengal 700091, India', '22.5706249', '88.4324954', NULL, 'West Bengal', 'Kolkata', '700091', 0, 'Sodepur', 'Readymade Center', 'West Bengal', 'Kolkata', '700110', 'India', 1, 'Sodepur', 'Readymade Center', 'West Bengal', 'Kolkata', '700110', 'India', '45454545454545', 'uploads/store/1658230873.1396655948.gstfile-1.png', 1000000, 30, NULL, NULL, 1, 'admin', NULL, '2022-06-11 01:04:01', '2022-07-19 11:41:13'),
(2, NULL, 'Sample store 2', 'sample-store-1', 'S2', NULL, 'samplestore1@gmail.com', '9876543212', 1, '9876543212', 'Plot-A1-4 Block EP &GP, 804, Street Number 23, GP Block, Sector V, Bidhannagar, Kolkata, West Bengal 700091, India', '22.570943', '88.432554', NULL, 'West Bengal', 'Kolkata', '700091', 1, 'Bidhan Nagar', 'Airport', 'West Bengal', 'Kolkata', '700114', 'India', 1, 'Bidhan Nagar', 'Airport', 'West Bengal', 'Kolkata', '700114', 'India', '65656456', 'uploads/store/1658230938.700969406.gstfile-1.png', 1000000, 30, NULL, NULL, 1, 'admin', NULL, '2022-06-11 01:04:01', '2022-08-16 10:28:37'),
(3, NULL, 'Sample store 3', 'sample-store-3', 'S3', NULL, 'samplestore3@gmail.com', '9876543211', 1, '9876543211', 'Plot-A1-4 Block EP &GP, 804, Street Number 23, GP Block, Sector V, Bidhannagar, Kolkata, West Bengal 700091, India', '22.570943', '88.432554', NULL, 'West Bengal', 'Kolkata', '700092', 0, 'Barrackpore', 'Station', 'West Bengal', 'Kolkata', '700110', 'India', 1, 'Barrackpore', 'Station', 'West Bengal', 'Kolkata', '700110', 'India', '767657567', 'uploads/store/1658230967.897813568.gstfile-1.png', 1000000, 30, NULL, NULL, 1, 'admin', NULL, '2022-07-11 01:04:01', '2022-08-16 10:28:35'),
(4, NULL, 'Sample store 4', 'sample-store-4', '', NULL, 'samplestore4@gmail.com', '9876543210', 1, '9876543210', 'Plot-A1-4 Block EP &GP, 804, Street Number 23, GP Block, Sector V, Bidhannagar, Kolkata, West Bengal 700091, India', '22.570943', '88.432554', NULL, 'West Bengal', 'Kolkata', '700093', 0, 'Bidhan Nagar', 'Block EP', 'West Bengal', 'Kolkata', '700114', 'India', 1, 'Bidhan Nagar', 'Block EP', 'West Bengal', 'Kolkata', '700114', 'India', '64654654', 'uploads/store/1658231043.1411377555.gstfile-1.png', 1000000, 30, NULL, NULL, 1, 'admin', NULL, '2022-07-11 01:04:01', '2022-08-16 10:28:33'),
(5, NULL, 'Sample Store 5', 'gdfgfgfgfg', '', NULL, 'store5@test.com', '9000343434', 1, '9000343434', 'H2QV+XPQ, Pocket 7, Sector 12 Dwarka, Dwarka, New Delhi, Delhi 110075, India', '28.5899619', '77.0443591', NULL, 'Delhi', 'New Delhi', '110075', 0, 'Dumdum', 'Station', 'West Bengal', 'Kolkata', '700110', 'India', 1, 'Dumdum', 'Station', 'West Bengal', 'Kolkata', '700110', 'India', '656546546', 'uploads/store/1658230998.1651673114.gstfile-1.png', 1000000, 30, NULL, NULL, 1, 'admin', NULL, '2022-07-14 08:32:21', '2022-08-16 10:28:30'),
(6, NULL, 'Ayan', 'fggdfgdfgdfg', 'Ayan Enterprise', NULL, 'store6@test.com', '9843242342', 1, '9843242342', NULL, '', '', NULL, NULL, NULL, NULL, 1, 'Dumdum', 'Readymade Center', 'WB', 'Kolkata', '700111', 'India', 1, 'Dumdum', 'Readymade Center', 'WB', 'Kolkata', '700111', 'India', '534534534', 'uploads/store/1658230266.1665122259.gstfile-1.png', 1000000, 30, NULL, NULL, 1, 'admin', NULL, '2022-07-19 11:18:43', '2022-08-19 09:52:07');

-- --------------------------------------------------------

--
-- Table structure for table `store_visits`
--

CREATE TABLE `store_visits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `start_date` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_time` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_date` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_time` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_latitude` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_longitude` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_distance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'in meter',
  `total_distance_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_ledger_added` int(1) NOT NULL DEFAULT 0,
  `convenience_per_km` double(10,2) NOT NULL,
  `staff_convenience_amount` double(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `store_visit_details`
--

CREATE TABLE `store_visit_details` (
  `id` int(11) NOT NULL,
  `visit_id` int(11) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `distance_value` varchar(255) DEFAULT NULL,
  `distance` varchar(255) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_mails`
--

CREATE TABLE `subscription_mails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1: active, 0: inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cat_id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1: active, 0: inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `cat_id`, `name`, `image_path`, `slug`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Sub category 1', 'uploads/sub-category/1653386718.img2.jpg', 'sub-category-1', 'This is sub category 1', 1, '2022-05-24 04:35:18', '2022-08-11 06:23:32'),
(2, 2, 'Mobile Phones', 'uploads/sub-category/1657007584.dummy.png', 'mobile-phones', NULL, 1, '2022-07-05 02:23:04', '2022-07-05 02:23:04'),
(3, 2, 'Laptops', 'uploads/sub-category/1657007596.dummy.png', 'laptops', NULL, 1, '2022-07-05 02:23:16', '2022-07-05 02:23:16'),
(4, 2, 'Headphones', 'uploads/sub-category/1657007608.dummy.png', 'headphones', NULL, 1, '2022-07-05 02:23:28', '2022-07-05 02:23:28'),
(5, 2, 'Earbuds', 'uploads/sub-category/1657173422.images.jpeg', 'earbuds', NULL, 1, '2022-07-07 00:27:02', '2022-07-13 08:30:38'),
(6, 2, 'Data Cables', 'uploads/sub-category/1657173501.images.jpeg', 'data-cables', 'Data Cables', 1, '2022-07-07 00:28:21', '2022-07-07 00:28:21'),
(7, 3, 'Bakery and Bread', 'uploads/sub-category/1657708473.images.jpeg', 'bakery-and-bread', NULL, 1, '2022-07-13 10:34:33', '2022-07-13 10:34:33'),
(8, 3, 'Meat and Seafood.', 'uploads/sub-category/1659340932.145760656.meat-n-seafood.png', 'meat-and-seafood-2', NULL, 1, '2022-07-13 10:34:48', '2022-08-01 08:02:12'),
(9, 3, 'Pasta and Rice', 'uploads/sub-category/1659340883.1027016326.pasta-n-rice.jpg', 'pasta-and-rice-2', NULL, 1, '2022-07-13 10:35:01', '2022-08-01 08:01:23'),
(10, 3, 'Oils, Sauces, Salad Dressings, and Condiments.', 'uploads/sub-category/1659340841.1943268974.oil-sauce-salad.jpeg', 'oils-sauces-salad-dressings-and-condiments-2', NULL, 1, '2022-07-13 10:35:15', '2022-08-01 08:00:41'),
(11, 3, 'Cereals and Breakfast Foods.', 'uploads/sub-category/1659340789.931944161.Cereals.jpg', 'cereals-and-breakfast-foods-2', NULL, 1, '2022-07-13 10:35:34', '2022-08-11 06:28:20'),
(12, 3, 'Soups and Canned Goods', 'uploads/sub-category/1659340749.559822031.soups.jpg', 'soups-and-canned-goods-2', NULL, 1, '2022-07-13 10:35:48', '2022-08-11 06:28:19'),
(13, 3, 'Frozen Foods.', 'uploads/sub-category/1659340711.1335780877.frozen-food.jpg', 'frozen-foods-2', NULL, 1, '2022-07-13 10:36:07', '2022-08-11 06:28:17'),
(14, 3, 'Dairy, Cheese, and Eggs.', 'uploads/sub-category/1659340663.1917263425.dairy.png', 'dairy-cheese-and-eggs', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1, '2022-07-13 10:36:20', '2022-08-11 06:26:18'),
(15, 1, 'Test Sub Category', '', 'test-sub-category', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 0, '2022-08-11 06:22:58', '2022-08-11 06:26:11');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` bigint(20) DEFAULT NULL,
  `is_wa_same` tinyint(1) NOT NULL DEFAULT 0,
  `whatsapp_no` bigint(20) DEFAULT NULL,
  `billing_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_landmark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_pin` int(11) DEFAULT NULL,
  `billing_country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_landmark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_pin` int(11) DEFAULT NULL,
  `shipping_country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_billing_shipping_same` tinyint(1) NOT NULL DEFAULT 0,
  `gst_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gst_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_limit` int(11) DEFAULT NULL,
  `credit_days` int(11) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `is_verified` int(11) NOT NULL DEFAULT 0 COMMENT '1: verified, 0: not verified',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '1: active, 0: inactive',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `email`, `mobile`, `is_wa_same`, `whatsapp_no`, `billing_address`, `billing_landmark`, `billing_state`, `billing_city`, `billing_pin`, `billing_country`, `shipping_address`, `shipping_landmark`, `shipping_state`, `shipping_city`, `shipping_pin`, `shipping_country`, `is_billing_shipping_same`, `gst_number`, `gst_file`, `credit_limit`, `credit_days`, `email_verified_at`, `is_verified`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test User', 'testuser@gmail.com', 9874222555, 0, 9874277711, 'Salt alke, sector V', 'Kolkata', 'West Bengal', 'Kokata', 700046, 'India', 'Kokata, salt lake', 'Sector v', 'WB', 'Kolkata', 700001, 'India', 0, 'GSTIN7789741', 'uploads/user/1653468750.gst-medvita.png', 200000, 25, NULL, 0, 0, NULL, '2022-05-25 03:22:30', '2022-08-16 13:58:40'),
(2, 'Supplier 2', 'supplier2@supplier.com', 987456221, 0, 9800213554, 'Kolkata', 'Saltlae, sector v', 'WB', 'bangalore', 700045, 'India', 'bangalore, karnataka', 'Sector v', 'karnataka', 'bangalore', 700001, 'India', 0, '987455102236', 'uploads/user/1653830311.gst-registration-certificate.jpg', 90000, 4, NULL, 0, 1, NULL, '2022-05-29 07:48:31', '2022-06-20 01:27:17'),
(3, 'Supplier 3', 'supplier3@test.com', 9563457347, 0, 8944534545, 'Sodepur', 'Readymade Center', 'WB', 'Kolkata', 700114, 'India', 'Sodepur', 'Readymade Center', 'WB', 'Kolkata', 700114, 'India', 1, 'DHSDGSHDG4574545', 'uploads/user/1656591860.30.05.2019-Affidavit-1-1.jpg', 1000000, 15, NULL, 0, 1, NULL, '2022-06-30 06:54:20', '2022-06-30 07:36:22'),
(4, 'Supplier 4', NULL, 9034365436, 1, 9034365436, 'Sodepur', 'Readymade Center', 'WB', 'Kolkata', 700114, 'India', 'Sodepur', 'Readymade Center', 'WB', 'Kolkata', 700114, 'India', 1, '503100000191193', 'uploads/user/1656915738.756982867.stamp_paper-250x330.jpg', 1000000, 30, NULL, 0, 1, NULL, '2022-07-04 00:42:26', '2022-07-04 00:54:43'),
(5, 'Supplier 5', NULL, 9000000011, 1, 9000000011, 'Sodepur', 'Readymade Center', 'West Bengal', 'Kolkata', 700111, 'India', 'Sodepur', 'Readymade Center', 'West Bengal', 'Kolkata', 700111, 'India', 1, '1010111000001211', 'uploads/user/1657169896.gstfile-1.png', NULL, NULL, NULL, 0, 1, NULL, '2022-07-06 23:28:16', '2022-07-06 23:28:16'),
(6, 'Supplier 6', NULL, 8998000011, 1, 8998000011, 'Sodepur', 'Readymade Center', 'West Bengal', 'Kolkata', 7000001, 'India', 'Sodepur', 'Readymade Center', 'West Bengal', 'Kolkata', 7000001, 'India', 1, '110211100000001212', 'uploads/user/1657169950.gstfile-1.png', NULL, NULL, NULL, 0, 1, NULL, '2022-07-06 23:29:10', '2022-07-06 23:29:10');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `user_id`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, 8, '2022-06-26', '2022-07-02', '2022-06-26 05:19:56', '2022-06-26 05:19:56'),
(2, 8, '2022-07-03', '2022-07-09', '2022-07-03 05:19:56', '2022-07-03 05:19:56'),
(3, 8, '2022-07-10', '2022-07-16', '2022-07-10 05:21:11', '2022-07-10 05:21:11'),
(4, 11, '2022-06-26', '2022-07-02', '2022-06-26 05:23:19', '2022-06-26 05:23:19'),
(5, 11, '2022-07-03', '2022-07-09', '2022-07-03 05:23:19', '2022-07-03 05:23:19'),
(7, 11, '2022-07-10', '2022-07-16', '2022-07-12 11:26:27', '2022-07-12 11:26:27'),
(8, 11, '2022-07-24', '2022-07-30', '2022-07-29 11:40:08', '2022-07-29 11:40:08');

-- --------------------------------------------------------

--
-- Table structure for table `task_details`
--

CREATE TABLE `task_details` (
  `id` int(11) NOT NULL,
  `task_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `no_of_visit` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `task_details`
--

INSERT INTO `task_details` (`id`, `task_id`, `store_id`, `no_of_visit`, `comment`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 3, 'Test', '2022-07-12 10:52:47', '2022-07-12 10:52:47'),
(2, 2, 1, 7, 'Test', '2022-07-12 10:52:47', '2022-07-12 10:52:47'),
(3, 3, 1, 2, 'Test', '2022-07-12 10:52:47', '2022-07-12 10:52:47'),
(4, 4, 4, 2, 'Test', '2022-07-12 10:55:56', '2022-07-12 10:55:56'),
(5, 5, 4, 7, 'Test', '2022-07-12 10:55:56', '2022-07-12 10:55:56'),
(7, 7, 4, 7, NULL, '2022-07-12 16:56:27', '2022-07-12 16:56:27'),
(8, 8, 1, 2, 'Test One', '2022-07-29 17:10:08', '2022-07-29 17:10:08'),
(9, 8, 2, 4, 'Test Two', '2022-07-29 17:10:08', '2022-07-29 17:10:08');

-- --------------------------------------------------------

--
-- Table structure for table `test_cron`
--

CREATE TABLE `test_cron` (
  `id` int(11) NOT NULL,
  `unique_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT '',
  `value` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'unit value',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1:Active;0:Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `description`, `value`, `status`, `created_at`, `updated_at`) VALUES
(5, 'Pieces', 'Pieces', 'pieces', 1, '2022-06-17 02:01:31', '2022-08-08 08:54:20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_wa_same` tinyint(1) NOT NULL DEFAULT 0,
  `mobile` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landmark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aadhar_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pan_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '1:Staff',
  `otp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gst_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gst_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id_back` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id_front` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_limit` int(11) DEFAULT NULL,
  `credit_days` int(11) DEFAULT NULL,
  `designation` int(11) NOT NULL DEFAULT 1,
  `account_holder_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'banking cred',
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'banking cred',
  `branch_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'banking cred',
  `bank_account_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'banking cred',
  `ifsc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'banking cred',
  `monthly_salary` double(10,2) NOT NULL COMMENT 'salary & allowance',
  `daily_salary` double(10,2) NOT NULL COMMENT 'salary & allowance',
  `travelling_allowance` double(10,2) NOT NULL COMMENT 'salary & allowance',
  `is_verified` int(11) NOT NULL DEFAULT 0 COMMENT '1: verified, 0: not verified',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '1: active, 0: inactive',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `employee_id`, `whatsapp_no`, `is_wa_same`, `mobile`, `address`, `landmark`, `state`, `city`, `pin`, `country`, `aadhar_no`, `pan_no`, `type`, `otp`, `image`, `gst_number`, `gst_file`, `user_id_back`, `user_id_front`, `credit_limit`, `credit_days`, `designation`, `account_holder_name`, `bank_name`, `branch_name`, `bank_account_no`, `ifsc`, `monthly_salary`, `daily_salary`, `travelling_allowance`, `is_verified`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(8, 'Staff One', 'staff1@user.com', NULL, '7845999661', 0, '7845999661', 'Kolkata, sector v', 'Bidhanagar', 'West Bengal', 'Kolkata', '700091', 'India', '120021233333', NULL, '1', '1234', 'uploads/staff/1660126766.835044712.maxresdefault.jpg', NULL, NULL, 'uploads/staff/1660126766.1719210516.Aadhaar_card.jpg', 'uploads/staff/1660126766.1592839510.aadhar-front.jpg', NULL, NULL, 1, 'Staff One', 'ICICI', 'Salt Lake', '123455602131', 'ICIC001234', 15000.00, 500.00, 5.00, 0, 1, NULL, '2022-05-26 00:30:04', '2022-08-22 08:32:00'),
(11, 'Staff Two', 'staff2@user.com', NULL, '7845999662', 0, '7845999662', 'Kolkata, sector v', 'Bidhanagar', 'West Bengal', 'Kolkata', '700091', 'India', '120000045454', NULL, '1', '1234', 'uploads/user/1653544804.default-user-image.png', NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Staff Two', 'ICICI', 'Salt Lake', '123455602133', 'ICIC001234', 15000.00, 500.00, 5.00, 0, 1, NULL, '2022-05-26 00:30:04', '2022-08-22 08:31:19'),
(21, 'Staff Three', 'staff3@user.com', NULL, '9856666666', 0, '9856666666', '2121', '2121', '1212', '1212', '21212', '1212', '121090909909', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Staff Three', 'ICICI', 'Salt Lake', '123455602135', 'ICIC001234', 15000.00, 500.00, 5.00, 0, 1, NULL, '2022-07-06 23:45:15', '2022-08-22 08:30:39'),
(22, 'Test Staff', NULL, NULL, '4554545454', 1, '4554545454', '800', '506', '485', '954', '94', '476', '5345345345', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 'Test Staff', 'ICICI', 'Salt Lake', '123455602130', 'ICIC001234', 3000.00, 100.00, 5.00, 0, 1, NULL, '2022-08-05 05:44:23', '2022-08-22 06:15:53'),
(24, 'Manoj Sharma', NULL, NULL, '9800000000', 0, NULL, 'Baguiatii', 'Traffic More', 'West Bengal', 'Kokata', '7220021', 'India', '122232212222', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 'Manoj Sharma', 'ICICI', 'Salt Lake', '123455602135', 'ICIC001234', 31500.00, 1050.00, 6.50, 0, 1, NULL, '2022-08-22 06:19:46', '2022-08-22 06:54:52');

-- --------------------------------------------------------

--
-- Table structure for table `users_old`
--

CREATE TABLE `users_old` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `official_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_wa_same` tinyint(1) NOT NULL DEFAULT 0,
  `mobile` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landmark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aadhar_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pan_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '1:Staff',
  `dob` date DEFAULT NULL,
  `anniversary_date` date DEFAULT NULL,
  `otp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gst_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gst_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id_back` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id_front` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_limit` int(11) DEFAULT NULL,
  `credit_days` int(11) DEFAULT NULL,
  `designation` int(11) NOT NULL DEFAULT 1,
  `bank_account_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'banking cred',
  `ifsc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'banking cred',
  `account_holder_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'banking cred',
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'banking cred',
  `branch_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'banking cred',
  `monthly_salary` double(10,2) NOT NULL,
  `daily_salary` double(10,2) NOT NULL,
  `travelling_allowance` double(10,2) NOT NULL,
  `is_verified` int(11) NOT NULL DEFAULT 0 COMMENT '1: verified, 0: not verified',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '1: active, 0: inactive',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_old`
--

INSERT INTO `users_old` (`id`, `name`, `fname`, `lname`, `alias`, `official_name`, `business_name`, `email`, `employee_id`, `whatsapp_no`, `is_wa_same`, `mobile`, `email_verified_at`, `password`, `address`, `landmark`, `state`, `city`, `pin`, `country`, `aadhar_no`, `pan_no`, `type`, `dob`, `anniversary_date`, `otp`, `image`, `gender`, `social_id`, `gst_number`, `gst_file`, `user_id_back`, `user_id_front`, `credit_limit`, `credit_days`, `designation`, `bank_account_no`, `ifsc`, `account_holder_name`, `bank_name`, `branch_name`, `monthly_salary`, `daily_salary`, `travelling_allowance`, `is_verified`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(8, 'Staff One', NULL, NULL, 'staff1', 'staff1', NULL, 'staff1@user.com', NULL, '7845999661', 0, '7845999661', NULL, '$2y$10$nJdffrROX7rGXdbX56SFCuamVeBJCKeJHryJ9Na.84u6GT/LA.QKO', 'Kolkata, sector v', 'Bidhanagar', 'West Bengal', 'Kolkata', '700091', 'India', '187455612478', NULL, '1', NULL, NULL, '1234', 'uploads/staff/1660126766.835044712.maxresdefault.jpg', NULL, NULL, NULL, NULL, 'uploads/staff/1660126766.1719210516.Aadhaar_card.jpg', 'uploads/staff/1660126766.1592839510.aadhar-front.jpg', NULL, NULL, 1, '5689784561', NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0, 1, NULL, '2022-05-26 00:30:04', '2022-08-16 10:37:51'),
(11, 'Staff Two', NULL, NULL, 'staff2', 'staff2', NULL, 'staff2@user.com', NULL, '7845999662', 0, '7845999662', NULL, '$2y$10$nJdffrROX7rGXdbX56SFCuamVeBJCKeJHryJ9Na.84u6GT/LA.QKO', 'Kolkata, sector v', 'Bidhanagar', 'West Bengal', 'Kolkata', '700091', 'India', '187455612478', NULL, '1', NULL, NULL, '1234', 'uploads/user/1653544804.default-user-image.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '5689784561', NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0, 1, NULL, '2022-05-26 00:30:04', '2022-08-16 10:36:04'),
(21, 'Staff Three', NULL, NULL, 'staff3', 'Staff 3', NULL, 'staff3@user.com', NULL, '9856666666', 0, '9856666666', NULL, '$2y$10$MHqBLoBnlHwlAbY5/tikIewVPb8CZT0hUcdOCe0Izkacjo1vVLOCS', '2121', '2121', '1212', '1212', '21212', '1212', '32323232323', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '12220000', NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0, 1, NULL, '2022-07-06 23:45:15', '2022-08-16 10:31:41'),
(22, 'Test Staff', NULL, NULL, 'teststaff', 'teststaff', NULL, NULL, NULL, '4554545454', 1, '4554545454', NULL, '$2y$10$dkwSqV9qwkiyL9sl5gydE.ck1VHUchSersnR/DyLf7/zpsmXIYVzy', '800', '506', '485', '954', '94', '476', '5345345345', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, '5543543545', '33434', NULL, NULL, NULL, 0.00, 0.00, 0.00, 0, 1, NULL, '2022-08-05 05:44:23', '2022-08-18 06:54:29');

-- --------------------------------------------------------

--
-- Table structure for table `user_attendances`
--

CREATE TABLE `user_attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_attendances`
--

INSERT INTO `user_attendances` (`id`, `user_id`, `location`, `lat`, `lng`, `date`, `start_time`, `end_time`, `created_at`, `updated_at`) VALUES
(1, 5, 'East Mumbai', 19, 1, '2022-03-08', '06:29:22', '07:29:02', '2022-03-09 01:57:18', '2022-04-25 01:39:50'),
(3, 5, 'East Mumbai', 19.1582, 72.9597, '2022-03-24', '10:00:22', '06:30:22', '2022-04-25 01:36:50', '2022-04-25 01:36:50'),
(4, 5, 'East Mumbai', 19.1582, 72.9597, '2022-03-25', '10:00:22', '06:30:22', '2022-04-25 01:37:14', '2022-04-25 01:37:14'),
(5, 5, 'East Delhi', 22.1582, 77.9597, '2022-03-26', '10:00:22', '06:30:22', '2022-04-25 01:38:34', '2022-04-25 01:38:34');

-- --------------------------------------------------------

--
-- Table structure for table `user_noorderreasons`
--

CREATE TABLE `user_noorderreasons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lng` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_noorderreasons`
--

INSERT INTO `user_noorderreasons` (`id`, `store_id`, `user_id`, `comment`, `location`, `lat`, `lng`, `created_at`, `updated_at`) VALUES
(4, 1, 8, 'Not interested in placing order at the moment', 'Kolkata', '80.2564798', '52.2314583', '2022-06-12 02:01:44', '2022-06-12 02:01:44');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL DEFAULT 0,
  `product_id` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `ip`, `store_id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 11, 18, '2022-07-29 12:20:29', '2022-07-29 12:20:29'),
(2, NULL, 1, 11, 17, '2022-07-29 12:20:29', '2022-07-29 12:20:29');

-- --------------------------------------------------------

--
-- Table structure for table `_addresses`
--

CREATE TABLE `_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landmark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lng` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1: customer_billing, 2: customer_shipping, 3: staff',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1: active, 0: inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_collections`
--

CREATE TABLE `_collections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sketch_icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1: active, 0: inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_collections`
--

INSERT INTO `_collections` (`id`, `position`, `name`, `icon_path`, `sketch_icon`, `image_path`, `banner_image`, `slug`, `description`, `status`, `created_at`, `updated_at`) VALUES
(2, 0, 'Footkins', 'uploads/collection/range4.png', 'uploads/collection/1648110294.665818788.footkins.png', 'uploads/collection/onn_footkins.png', 'uploads/collection/1646652429.banner1.jpg', 'footkins', NULL, 1, '2022-03-07 09:30:10', '2022-05-30 13:49:44'),
(3, 0, 'Grandde', 'uploads/collection/range3.png', 'uploads/collection/1648110322.1721975126.grandde.png', 'uploads/collection/onn_innerwear.png', 'uploads/collection/1646652429.banner1.jpg', 'grandde', NULL, 1, '2022-03-07 09:30:24', '2022-05-30 13:49:44'),
(4, 0, 'Acttive', 'uploads/collection/range5.png', 'uploads/collection/1648110335.673340868.acttive.png', 'uploads/collection/onn_outerwear.png', 'uploads/collection/1646652429.banner1.jpg', 'acttive', NULL, 1, '2022-03-07 09:30:36', '2022-05-30 13:49:44'),
(6, 0, 'Thermal', 'uploads/collection/range.png', 'uploads/collection/1648110344.1885323119.thermal.png', 'uploads/collection/onn_thermal.png', 'uploads/collection/1646652429.banner1.jpg', 'thermal', NULL, 1, '2022-03-10 07:42:23', '2022-05-30 13:49:44'),
(7, 0, 'Winter Wear', 'uploads/collection/range1.png', 'uploads/collection/1648110354.1286489689.winter-wear.png', 'uploads/collection/onn_winter-product.png', 'uploads/collection/1646652429.banner1.jpg', 'winter-wear', NULL, 1, '2022-03-10 07:52:10', '2022-05-30 13:49:44'),
(8, 0, 'Relaxz', 'uploads/collection/range6.png', 'uploads/collection/1648110364.1549682793.relaxz.png', 'uploads/collection/onn_relaxz.png', 'uploads/collection/1646652429.banner1.jpg', 'relaxz', NULL, 1, '2022-03-10 07:52:26', '2022-05-30 13:49:44'),
(9, 0, 'Platina', 'uploads/collection/range2.png', 'uploads/collection/1648110379.991784936.platina.png', 'uploads/collection/onn_platina.png', 'uploads/collection/1646652429.banner1.jpg', 'platina', NULL, 1, '2022-03-10 07:52:26', '2022-05-30 13:49:44'),
(11, 0, 'Stretchz', 'uploads/collection/1648068223.509795879.range3.png', 'uploads/collection/1648110389.467029930.stretchz.png', 'uploads/collection/1648068223.379099523.stretchz.png', 'uploads/collection/1648068223.2053266682.banner2.jpg', 'stretchz', NULL, 1, '2022-03-24 02:13:43', '2022-05-30 13:49:44'),
(12, 0, 'Sport', 'uploads/collection/1648068876.960883191.onn-men-s-sports-and-gym-vest-500x500.png', 'uploads/collection/1648110397.2106029333.sport.png', 'uploads/collection/1648068723.482089929.onn_sports.png', 'uploads/collection/1648068723.855994381.banner2.png', 'sport', NULL, 1, '2022-03-24 02:22:03', '2022-05-30 13:49:44'),
(13, 0, 'Comfortz', 'uploads/collection/1648068987.1494204055.relaxz.png', 'uploads/collection/1648110406.283624293.comfortz.png', 'uploads/collection/1648068987.810786002.comfortz.png', 'uploads/collection/1648068987.23204190.banner2.jpg', 'comfortz', NULL, 1, '2022-03-24 02:26:27', '2022-05-30 13:49:44');

-- --------------------------------------------------------

--
-- Table structure for table `_colors`
--

CREATE TABLE `_colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1: active, 0: inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_colors`
--

INSERT INTO `_colors` (`id`, `name`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Red', '#DB2828', 1, '2022-03-03 18:50:47', '2022-05-30 13:49:44'),
(2, 'Orange', '#F2711C', 1, '2022-03-03 18:50:47', '2022-05-30 13:49:44'),
(3, 'Yellow', '#FBBD08', 1, '2022-03-03 18:50:47', '2022-05-30 13:49:44'),
(4, 'Olive', '#B5CC18', 1, '2022-03-03 18:50:47', '2022-05-30 13:49:44'),
(5, 'Green', '#21BA45', 1, '2022-03-03 18:50:47', '2022-05-30 13:49:44'),
(6, 'Teal', '#00B5AD', 1, '2022-03-03 18:50:47', '2022-05-30 13:49:44'),
(7, 'Blue', '#2185D0', 1, '2022-03-03 18:50:47', '2022-05-30 13:49:44'),
(8, 'Violet', '#6435C9', 1, '2022-03-03 18:50:47', '2022-05-30 13:49:44'),
(9, 'Purple', '#A333C8', 1, '2022-03-03 18:50:47', '2022-05-30 13:49:44'),
(10, 'Pink', '#E03997', 1, '2022-03-03 18:50:47', '2022-05-30 13:49:44'),
(11, 'Black', '#000000', 1, '2022-03-20 21:05:41', '2022-05-30 13:49:44'),
(12, 'White', '#FFFFFF', 1, '2022-03-20 21:07:22', '2022-05-30 13:49:44'),
(13, 'Navy', '#000080', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(14, 'Charcoal', '#36454F', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(15, 'Sea Green', '#2e8b57', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(16, 'LT Blue', '#ADD8E6\r\n', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(17, 'Maroon', '#800000', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(18, 'Royal Blue', '#4169e1', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(19, 'Coffee', '#6f4e37', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(20, 'Cool Yellow', '#ECEA98', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(21, 'Goldfish', '#f98332', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(22, 'Baby Pink', '#f4c2c2', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(23, 'Tel', '#008080', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(24, 'Air Force Blue', '#00308F', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(25, 'Mustard', '#FFDB58', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(26, 'Peacock Blue', '#326872', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(27, 'Forest Green', '#228B22', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(28, 'Bottle Green', '#006A4E', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(29, 'Camel', '#c19a6b', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(30, 'Lemon', '#E7C91B', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(31, 'Bright Blue', '#0096FF', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(32, 'Wine', '#58181F', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(33, 'Aqua', '#00FFFF', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(34, 'Powder Blue', '#B6D0E2', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(35, 'Tangerine', '#F28500', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(36, 'Smoke Green', '#a8bba2', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(37, 'Fluorescent Green', '#39FF14', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(38, 'Peach', '#FFE5B4', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(39, 'Navy Melange', '#282B57', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(40, 'Pea Green', '#52D017', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(41, 'Canary Yellow', '#FFEF00', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(42, 'Sky Blue', '#87CEEB', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(43, 'grass Green', '#7CFC00', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(44, 'Mouse', '#6e5f57', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(45, 'Sapphire Blue', '#0F52BA', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(46, 'Dusty Pink', '#E1AD9D', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(47, 'Blue Mist', '#dbe5ef', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(48, 'Azure', '#007fff', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(49, 'Ocean Blue', '#2B65EC', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(50, 'Rose Wood', '#65000b', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(51, 'Dark Sapphire', '#082567', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(52, 'Imperial Blue', '#002395', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(53, 'Slate Grey', '#708090', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(54, 'Java Brown', '#50382E', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(55, 'Turquoise Blue', '#30D5C8', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(56, 'Mocha', '#967969', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(57, 'Steel Grey', '#71797E', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(58, 'Grey Melange', '#afafaf', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(59, 'Lavender', '#E6E6FA', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44'),
(60, 'Dark Grey', '#a9a9a9', 1, '2022-03-22 04:21:11', '2022-05-30 13:49:44'),
(61, 'Assorted', '#99CCFF', 1, '2022-03-22 04:21:11', '2022-05-30 13:49:44'),
(62, 'Crimson', '#DC143C', 1, '2022-03-22 04:21:11', '2022-05-30 13:49:44'),
(63, 'British Tan', '#C2A47F', 1, '2022-04-01 13:59:30', '2022-05-30 13:49:44'),
(64, 'Black Melange', '#383838', 1, '2022-03-21 22:51:11', '2022-05-30 13:49:44');

-- --------------------------------------------------------

--
-- Table structure for table `_coupons`
--

CREATE TABLE `_coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1: flat, 2: offer',
  `amount` double(8,2) NOT NULL,
  `max_time_of_use` bigint(20) NOT NULL,
  `max_time_one_can_use` bigint(20) NOT NULL,
  `no_of_usage` bigint(20) NOT NULL DEFAULT 0,
  `start_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `end_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1: active, 0: inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_coupons`
--

INSERT INTO `_coupons` (`id`, `name`, `coupon_code`, `type`, `amount`, `max_time_of_use`, `max_time_one_can_use`, `no_of_usage`, `start_date`, `end_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Buy now & get 30% instant discount', 'ONNIT30', 1, 800.00, 50, 1, 0, '2022-05-30 13:49:44', '2022-03-09 18:30:00', 1, '2022-03-04 05:19:33', '2022-05-30 13:49:44'),
(2, '50% OFF On minimum purchase of Rs. 500', 'FLIPFLOP', 1, 500.00, 30, 1, 4, '2022-05-30 13:49:44', '2022-04-29 18:30:00', 1, '2022-03-22 05:18:37', '2022-05-30 13:49:44');

-- --------------------------------------------------------

--
-- Table structure for table `_coupon_usages`
--

CREATE TABLE `_coupon_usages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_code_id` bigint(20) NOT NULL,
  `coupon_code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` double(10,2) NOT NULL,
  `total_checkout_amount` double(10,2) NOT NULL,
  `final_amount` double(10,2) NOT NULL,
  `user_id` bigint(20) NOT NULL DEFAULT 0,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `usage_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_coupon_usages`
--

INSERT INTO `_coupon_usages` (`id`, `coupon_code_id`, `coupon_code`, `discount`, `total_checkout_amount`, `final_amount`, `user_id`, `email`, `ip`, `order_id`, `usage_time`, `created_at`, `updated_at`) VALUES
(1, 2, 'FLIPFLOP', 500.00, 3669.00, 3169.00, 0, 'your.email+fakedata44065@gmail.com', '127.0.0.1', 40, '2022-03-25 11:53:15', '2022-03-25 06:23:15', '2022-05-30 13:49:44'),
(2, 2, 'FLIPFLOP', 500.00, 3669.00, 3169.00, 0, 'your.email+fakedata34742@gmail.com', '127.0.0.1', 41, '2022-03-25 11:54:32', '2022-03-25 06:24:32', '2022-05-30 13:49:44'),
(3, 2, 'FLIPFLOP', 500.00, 2871.00, 2371.00, 0, 'your.email+fakedata23545@gmail.com', '127.0.0.1', 42, '2022-03-25 12:45:50', '2022-03-25 07:15:50', '2022-05-30 13:49:44');

-- --------------------------------------------------------

--
-- Table structure for table `_customers`
--

CREATE TABLE `_customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` bigint(20) DEFAULT NULL,
  `is_wa_same` tinyint(1) NOT NULL DEFAULT 0,
  `whatsapp_no` bigint(20) DEFAULT NULL,
  `billing_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_landmark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_pin` int(11) DEFAULT NULL,
  `billing_country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_billing_shipping_same` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_landmark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_pin` int(11) DEFAULT NULL,
  `shipping_country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gst_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gst_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_limit` int(11) DEFAULT NULL,
  `credit_days` int(11) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `is_verified` int(11) NOT NULL DEFAULT 0 COMMENT '1: verified, 0: not verified',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '1: active, 0: inactive',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_customers`
--

INSERT INTO `_customers` (`id`, `name`, `email`, `mobile`, `is_wa_same`, `whatsapp_no`, `billing_address`, `billing_landmark`, `billing_state`, `billing_city`, `billing_pin`, `billing_country`, `is_billing_shipping_same`, `shipping_address`, `shipping_landmark`, `shipping_state`, `shipping_city`, `shipping_pin`, `shipping_country`, `gst_number`, `gst_file`, `credit_limit`, `credit_days`, `email_verified_at`, `is_verified`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Arpan', 'arpan@test.com', 9988000111, 0, 9988000111, 'Kolkata', 'Kolkata', 'WB', 'Kolkata', 700001, 'India', 0, 'Kolakta', 'Kolkata', 'WB', 'Kolkata', 700001, 'India', 'GSTIN5751232418', 'uploads/user/1653468114.gst-medvita.png', 100000, 30, NULL, 0, 1, NULL, '2022-05-25 03:11:54', '2022-07-06 23:26:53'),
(2, 'Customer 2', 'customer2@customer.com', 9874566621, 0, 6541223007, 'Kolkata', 'Saltlae, sector v', 'WB', 'Kolkata', 700012, 'India', 0, 'Kokata', 'Sector v', 'WB', 'Kolkata', 700001, 'India', 'GSTIN6541187942', 'uploads/user/1653831103.gst-registration-certificate.jpg', 45000, 45, NULL, 0, 1, NULL, '2022-05-29 08:01:43', '2022-07-05 06:46:55'),
(3, 'Arnab', NULL, 9333434343, 1, 9333434343, 'Sodepur', 'Readymade Center', 'WB', 'Kolkata', 700114, 'India', 1, 'Sodepur', 'Readymade Center', 'WB', 'Kolkata', 700114, 'India', '4234234234234234', 'uploads/customer/1657015555.324812453.gstfile-1.png', NULL, NULL, NULL, 0, 1, NULL, '2022-07-05 03:34:34', '2022-07-06 23:26:55'),
(4, 'Shreyan', NULL, 9888888888, 1, 9888888888, 'Dumdum', 'Airport', 'West Bengal', 'Kolkata', 700111, 'India', 1, 'Dumdum', 'Airport', 'West Bengal', 'Kolkata', 700111, 'India', '11000000012121', 'uploads/customer/1657169584.gstfile-1.png', NULL, NULL, NULL, 0, 1, NULL, '2022-07-06 23:23:04', '2022-07-06 23:23:04'),
(5, 'Suvajit', NULL, 9777777777, 1, 9777777777, 'Bidhan Nagar', 'Axis Bank', 'West Bengal', 'Kolkata', 700110, 'India', 1, 'Bidhan Nagar', 'Axis Bank', 'West Bengal', 'Kolkata', 700110, 'India', '11010111111000001212', 'uploads/customer/1657169677.gstfile-1.png', NULL, NULL, NULL, 0, 1, NULL, '2022-07-06 23:24:37', '2022-07-06 23:24:37'),
(6, 'Sourab', NULL, 9876666666, 1, 9876666666, 'Barrackpore', 'Station', 'West Bengal', 'Kolkata', 7000001, 'India', 1, 'Barrackpore', 'Station', 'West Bengal', 'Kolkata', 7000001, 'India', '1010111110000001212', 'uploads/customer/1657169790.gstfile-1.png', NULL, NULL, NULL, 0, 1, NULL, '2022-07-06 23:26:30', '2022-07-06 23:26:30');

-- --------------------------------------------------------

--
-- Table structure for table `_distributors`
--

CREATE TABLE `_distributors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `store_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bussiness_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_OCC_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1: active, 0: inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_faqs`
--

CREATE TABLE `_faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1: active, 0: inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_faqs`
--

INSERT INTO `_faqs` (`id`, `question`, `answer`, `status`, `created_at`, `updated_at`) VALUES
(1, 'What is Lorem Ipsum?', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1, '2022-03-02 08:06:18', '2022-05-30 13:49:45'),
(3, 'Why do we use it?', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 1, '2022-03-10 06:14:28', '2022-05-30 13:49:45'),
(4, 'Where does it come from?', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.', 1, '2022-03-10 06:15:05', '2022-05-30 13:49:45'),
(5, 'Where can I get some?', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 1, '2022-03-10 06:15:05', '2022-05-30 13:49:45');

-- --------------------------------------------------------

--
-- Table structure for table `_galleries`
--

CREATE TABLE `_galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1: active, 0: inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_galleries`
--

INSERT INTO `_galleries` (`id`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'uploads/gallery/gallery.jpg', 1, '2022-03-16 14:09:31', '2022-05-30 13:49:45'),
(2, 'uploads/gallery/gallery2.jpg', 1, '2022-03-16 14:09:31', '2022-05-30 13:49:45'),
(3, 'uploads/gallery/gallery3.webp', 1, '2022-03-16 14:10:06', '2022-05-30 13:49:45'),
(4, 'uploads/gallery/gallery4.jpg', 1, '2022-03-16 14:10:06', '2022-05-30 13:49:45'),
(5, 'uploads/gallery/gallery5.png', 1, '2022-03-16 14:10:19', '2022-05-30 13:49:45'),
(6, 'uploads/gallery/gallery6.jpg', 1, '2022-03-16 14:10:19', '2022-05-30 13:49:45');

-- --------------------------------------------------------

--
-- Table structure for table `_offers`
--

CREATE TABLE `_offers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pdf` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_current` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1: active, 0: inactive',
  `start_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_product_colors`
--

CREATE TABLE `_product_colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `color_id` bigint(20) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1: active, 0: inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_product_color_sizes`
--

CREATE TABLE `_product_color_sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `color` bigint(20) NOT NULL,
  `size` bigint(20) NOT NULL,
  `assorted_flag` tinyint(4) NOT NULL DEFAULT 0,
  `price` double(10,2) NOT NULL DEFAULT 0.00,
  `offer_price` double(10,2) NOT NULL DEFAULT 0.00,
  `stock` int(11) NOT NULL DEFAULT 1,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1: active, 0: inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_product_color_sizes`
--

INSERT INTO `_product_color_sizes` (`id`, `product_id`, `color`, `size`, `assorted_flag`, `price`, `offer_price`, `stock`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1, 38, 11, 1, 0, 530.00, 530.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(2, 38, 11, 2, 0, 530.00, 530.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(3, 38, 11, 3, 0, 530.00, 530.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(4, 38, 11, 4, 0, 530.00, 530.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(5, 38, 11, 5, 0, 550.00, 550.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(6, 38, 11, 6, 0, 550.00, 550.00, 1, NULL, 1, '2022-03-07 07:09:28', '2022-05-30 13:49:45'),
(7, 38, 11, 7, 0, 550.00, 550.00, 1, NULL, 1, '2022-03-07 07:09:28', '2022-05-30 13:49:45'),
(9, 39, 12, 1, 0, 520.00, 520.00, 1, NULL, 1, '2022-03-07 07:09:28', '2022-05-30 13:49:45'),
(10, 39, 12, 2, 0, 520.00, 520.00, 1, NULL, 1, '2022-03-07 07:09:28', '2022-05-30 13:49:45'),
(11, 39, 12, 3, 0, 520.00, 520.00, 1, NULL, 1, '2022-03-07 07:09:28', '2022-05-30 13:49:45'),
(12, 39, 12, 4, 0, 520.00, 520.00, 1, NULL, 1, '2022-03-21 03:30:33', '2022-05-30 13:49:45'),
(13, 39, 12, 5, 0, 540.00, 540.00, 1, NULL, 1, '2022-03-21 03:31:16', '2022-05-30 13:49:45'),
(14, 39, 12, 6, 0, 540.00, 540.00, 1, NULL, 1, '2022-03-21 03:31:16', '2022-05-30 13:49:45'),
(15, 39, 12, 7, 0, 540.00, 540.00, 1, NULL, 1, '2022-03-21 03:31:16', '2022-05-30 13:49:45'),
(17, 13, 12, 1, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(18, 13, 12, 2, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(19, 13, 12, 3, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(20, 13, 12, 4, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(21, 13, 12, 5, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(22, 13, 12, 6, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(23, 13, 12, 7, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(24, 13, 12, 8, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(25, 13, 1, 0, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(26, 13, 1, 2, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(27, 13, 1, 3, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(28, 13, 1, 4, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(29, 13, 1, 5, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(30, 13, 1, 6, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(31, 13, 1, 7, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(32, 13, 1, 8, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(33, 13, 13, 1, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(34, 13, 13, 2, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(35, 13, 13, 3, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(36, 13, 13, 4, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(37, 13, 13, 5, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(38, 13, 13, 6, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(39, 13, 13, 7, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(40, 13, 13, 8, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(41, 13, 14, 1, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(42, 13, 14, 2, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(43, 13, 14, 3, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(44, 13, 14, 4, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(45, 13, 14, 5, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(46, 13, 14, 6, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(47, 13, 14, 7, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(48, 13, 14, 8, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(49, 13, 15, 1, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(50, 13, 15, 2, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(51, 13, 15, 3, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(52, 13, 15, 4, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(53, 13, 15, 5, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(54, 13, 15, 6, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(55, 13, 15, 7, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(56, 13, 15, 8, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(57, 13, 16, 1, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(58, 13, 16, 2, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(59, 13, 16, 3, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(60, 13, 16, 4, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(61, 13, 16, 5, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(62, 13, 16, 6, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(63, 13, 16, 7, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(64, 13, 16, 8, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(65, 13, 17, 1, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(66, 13, 17, 2, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(67, 13, 17, 3, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(68, 13, 17, 4, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(69, 13, 17, 5, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(70, 13, 17, 6, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(71, 13, 17, 7, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(72, 13, 17, 8, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(73, 13, 11, 1, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(74, 13, 11, 2, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(75, 13, 11, 3, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(76, 13, 11, 4, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(77, 13, 11, 5, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(78, 13, 11, 6, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(79, 13, 11, 7, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(80, 13, 11, 8, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(81, 13, 9, 1, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(82, 13, 9, 2, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(83, 13, 9, 3, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(84, 13, 9, 4, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(85, 13, 9, 5, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(86, 13, 9, 6, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(87, 13, 9, 7, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(88, 13, 9, 8, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(89, 13, 5, 1, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(90, 13, 5, 2, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(91, 13, 5, 3, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(92, 13, 5, 4, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(93, 13, 5, 5, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(94, 13, 5, 6, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(95, 13, 5, 7, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(96, 13, 5, 8, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(97, 13, 18, 1, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(98, 13, 18, 2, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(99, 13, 18, 3, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(100, 13, 18, 4, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(101, 13, 18, 5, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(102, 13, 18, 6, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(103, 13, 18, 7, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(104, 13, 18, 8, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(105, 13, 19, 1, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(106, 13, 19, 2, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(107, 13, 19, 3, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(108, 13, 19, 4, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(109, 13, 19, 5, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(110, 13, 19, 6, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(111, 13, 19, 7, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(112, 13, 19, 8, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(113, 13, 20, 1, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(114, 13, 20, 2, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(115, 13, 20, 3, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(116, 13, 20, 4, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(117, 13, 20, 5, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(118, 13, 20, 6, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(119, 13, 20, 7, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(120, 13, 20, 8, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(121, 13, 21, 1, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(122, 13, 21, 2, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(123, 13, 21, 3, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(124, 13, 21, 4, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(125, 13, 21, 5, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(126, 13, 21, 6, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(127, 13, 21, 7, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(128, 13, 21, 8, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(129, 13, 22, 1, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(130, 13, 22, 2, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(131, 13, 22, 3, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(132, 13, 22, 4, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(133, 13, 22, 5, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(134, 13, 22, 6, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(135, 13, 22, 7, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(136, 13, 22, 8, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(137, 13, 23, 1, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(138, 13, 23, 2, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(139, 13, 23, 3, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(140, 13, 23, 4, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(141, 13, 23, 5, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(142, 13, 23, 6, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(143, 13, 23, 7, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(144, 13, 23, 8, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(145, 13, 24, 1, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(146, 13, 24, 2, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(147, 13, 24, 3, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(148, 13, 24, 4, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(149, 13, 24, 5, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(150, 13, 24, 6, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(151, 13, 24, 7, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(152, 13, 24, 8, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(153, 13, 25, 1, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(154, 13, 25, 2, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(155, 13, 25, 3, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(156, 13, 25, 4, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(157, 13, 25, 5, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(158, 13, 25, 6, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(159, 13, 25, 7, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(160, 13, 25, 8, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(161, 13, 26, 1, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(162, 13, 26, 2, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(163, 13, 26, 3, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(164, 13, 26, 4, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(165, 13, 26, 5, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(166, 13, 26, 6, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(167, 13, 26, 7, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(168, 13, 26, 8, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(169, 13, 27, 1, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(170, 13, 27, 2, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(171, 13, 27, 3, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(172, 13, 27, 4, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(173, 13, 27, 5, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(174, 13, 27, 6, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(175, 13, 27, 7, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(176, 13, 27, 8, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(177, 12, 12, 1, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(178, 12, 12, 2, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(179, 12, 12, 3, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(180, 12, 12, 4, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(181, 12, 12, 5, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(182, 12, 12, 6, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(183, 12, 12, 7, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(184, 12, 12, 8, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(185, 12, 1, 1, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(186, 12, 1, 2, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(187, 12, 1, 3, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(188, 12, 1, 4, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(189, 12, 1, 5, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(190, 12, 1, 6, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(191, 12, 1, 7, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(192, 12, 1, 8, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(193, 12, 13, 1, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(194, 12, 13, 2, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(195, 12, 13, 3, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(196, 12, 13, 4, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(197, 12, 13, 5, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(198, 12, 13, 6, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(199, 12, 13, 7, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(200, 12, 13, 8, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(201, 12, 16, 1, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(202, 12, 16, 2, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(203, 12, 16, 3, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(204, 12, 16, 4, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(205, 12, 16, 5, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(206, 12, 16, 6, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(207, 12, 16, 7, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(208, 12, 16, 8, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(209, 12, 17, 1, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(210, 12, 17, 2, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(211, 12, 17, 3, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(212, 12, 17, 4, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(213, 12, 17, 5, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(214, 12, 17, 6, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(215, 12, 17, 7, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(216, 12, 17, 8, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(217, 12, 11, 1, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(218, 12, 11, 2, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(219, 12, 11, 3, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(220, 12, 11, 4, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(221, 12, 11, 5, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(222, 12, 11, 6, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(223, 12, 11, 7, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(224, 12, 11, 8, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(225, 12, 18, 1, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(226, 12, 18, 2, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(227, 12, 18, 3, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(228, 12, 18, 4, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(229, 12, 18, 5, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(230, 12, 18, 6, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(231, 12, 18, 7, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(232, 12, 18, 8, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(233, 12, 19, 1, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(234, 12, 19, 2, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(235, 12, 19, 3, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(236, 12, 19, 4, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(237, 12, 19, 5, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(238, 12, 19, 6, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(239, 12, 19, 7, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(240, 12, 19, 8, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(241, 14, 11, 1, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(242, 14, 11, 2, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(243, 14, 11, 3, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(244, 14, 11, 4, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(245, 14, 11, 5, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(246, 14, 11, 6, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(247, 14, 11, 7, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(248, 14, 11, 8, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(249, 14, 13, 1, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(250, 14, 13, 2, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(251, 14, 13, 3, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(252, 14, 13, 4, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(253, 14, 13, 5, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(254, 14, 13, 6, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(255, 14, 13, 7, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(256, 14, 13, 8, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(257, 14, 12, 1, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(258, 14, 12, 2, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(259, 14, 12, 3, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(260, 14, 12, 4, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(261, 14, 12, 5, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(262, 14, 12, 6, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(263, 14, 12, 7, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(264, 14, 12, 8, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(265, 14, 1, 1, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(266, 14, 1, 2, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(267, 14, 1, 3, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(268, 14, 1, 4, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(269, 14, 1, 5, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(270, 14, 1, 6, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(271, 14, 1, 7, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(272, 14, 1, 8, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(273, 15, 24, 1, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(274, 15, 24, 2, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(275, 15, 24, 3, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(276, 15, 24, 4, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(277, 15, 24, 5, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(278, 15, 24, 6, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(279, 15, 24, 7, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(280, 15, 24, 8, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(281, 15, 11, 1, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(282, 15, 11, 2, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(283, 15, 11, 3, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(284, 15, 11, 4, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(285, 15, 11, 5, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(286, 15, 11, 6, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(287, 15, 11, 7, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(288, 15, 11, 8, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(289, 15, 28, 1, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(290, 15, 28, 2, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(291, 15, 28, 3, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(292, 15, 28, 4, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(293, 15, 28, 5, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(294, 15, 28, 6, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(295, 15, 28, 7, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(296, 15, 28, 8, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(297, 15, 29, 1, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(298, 15, 29, 2, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(299, 15, 29, 3, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(300, 15, 29, 4, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(301, 15, 29, 5, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(302, 15, 29, 6, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(303, 15, 29, 7, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(304, 15, 29, 8, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(305, 15, 19, 1, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(306, 15, 19, 2, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(307, 15, 19, 3, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(308, 15, 19, 4, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(309, 15, 19, 5, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(310, 15, 19, 6, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(311, 15, 19, 7, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(312, 15, 19, 8, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(313, 15, 30, 1, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(314, 15, 30, 2, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(315, 15, 30, 3, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(316, 15, 30, 4, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(317, 15, 30, 5, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(318, 15, 30, 6, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(319, 15, 30, 7, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(320, 15, 30, 8, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(321, 15, 17, 1, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(322, 15, 17, 2, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(323, 15, 17, 3, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(324, 15, 17, 4, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(325, 15, 17, 5, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(326, 15, 17, 6, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(327, 15, 17, 7, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(328, 15, 17, 8, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(329, 15, 25, 1, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(330, 15, 25, 2, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(331, 15, 25, 3, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(332, 15, 25, 4, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(333, 15, 25, 5, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(334, 15, 25, 6, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(335, 15, 25, 7, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(336, 15, 25, 8, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(337, 15, 13, 1, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(338, 15, 13, 2, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(339, 15, 13, 3, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(340, 15, 13, 4, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(341, 15, 13, 5, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(342, 15, 13, 6, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(343, 15, 13, 7, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(344, 15, 13, 8, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(345, 15, 4, 1, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(346, 15, 4, 2, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(347, 15, 4, 3, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(348, 15, 4, 4, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(349, 15, 4, 5, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(350, 15, 4, 6, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(351, 15, 4, 7, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(352, 15, 4, 8, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(353, 15, 31, 1, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(354, 15, 31, 2, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(355, 15, 31, 3, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(356, 15, 31, 4, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(357, 15, 31, 5, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(358, 15, 31, 6, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(359, 15, 31, 7, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(360, 15, 31, 8, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(361, 15, 26, 1, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(362, 15, 26, 2, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(363, 15, 26, 3, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(364, 15, 26, 4, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(365, 15, 26, 5, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(366, 15, 26, 6, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(367, 15, 26, 7, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(368, 15, 26, 8, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(369, 15, 9, 1, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(370, 15, 9, 2, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(371, 15, 9, 3, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(372, 15, 9, 4, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(373, 15, 9, 5, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(374, 15, 9, 6, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(375, 15, 9, 7, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(376, 15, 9, 8, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(377, 15, 1, 1, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(378, 15, 1, 2, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(379, 15, 1, 3, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(380, 15, 1, 4, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(381, 15, 1, 5, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(382, 15, 1, 6, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(383, 15, 1, 7, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(384, 15, 1, 8, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(385, 15, 12, 1, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(386, 15, 12, 2, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(387, 15, 12, 3, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(388, 15, 12, 4, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(389, 15, 12, 5, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(390, 15, 12, 6, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(391, 15, 12, 7, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(392, 15, 12, 8, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(393, 15, 32, 1, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(394, 15, 32, 2, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(395, 15, 32, 3, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(396, 15, 32, 4, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(397, 15, 32, 5, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(398, 15, 32, 6, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(399, 15, 32, 7, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(400, 15, 32, 8, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(401, 15, 33, 1, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(402, 15, 33, 2, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(403, 15, 33, 3, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(404, 15, 33, 4, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(405, 15, 33, 5, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(406, 15, 33, 6, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(407, 15, 33, 7, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(408, 15, 33, 8, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(409, 15, 34, 1, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(410, 15, 34, 2, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(411, 15, 34, 3, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(412, 15, 34, 4, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(413, 15, 34, 5, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(414, 15, 34, 6, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(415, 15, 34, 7, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(416, 15, 34, 8, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(417, 15, 35, 1, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(418, 15, 35, 2, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(419, 15, 35, 3, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(420, 15, 35, 4, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(421, 15, 35, 5, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(422, 15, 35, 6, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(423, 15, 35, 7, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(424, 15, 35, 8, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(425, 15, 36, 1, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(426, 15, 36, 2, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(427, 15, 36, 3, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(428, 15, 36, 4, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(429, 15, 36, 5, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(430, 15, 36, 6, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(431, 15, 36, 7, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(432, 15, 36, 8, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(433, 15, 37, 1, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(434, 15, 37, 2, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(435, 15, 37, 3, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(436, 15, 37, 4, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(437, 15, 37, 5, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(438, 15, 37, 6, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(439, 15, 37, 7, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(440, 15, 37, 8, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(441, 15, 38, 1, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(442, 15, 38, 2, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(443, 15, 38, 3, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(444, 15, 38, 4, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(445, 15, 38, 5, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(446, 15, 38, 6, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(447, 15, 38, 7, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(448, 15, 38, 8, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(449, 15, 15, 1, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(450, 15, 15, 2, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(451, 15, 15, 3, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(452, 15, 15, 4, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(453, 15, 15, 5, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(454, 15, 15, 6, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(455, 15, 15, 7, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(456, 15, 15, 8, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(457, 15, 39, 1, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(458, 15, 39, 2, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(459, 15, 39, 3, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(460, 15, 39, 4, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(461, 15, 39, 5, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(462, 15, 39, 6, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(463, 15, 39, 7, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(464, 15, 39, 8, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(465, 15, 40, 1, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(466, 15, 40, 2, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(467, 15, 40, 3, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(468, 15, 40, 4, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(469, 15, 40, 5, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(470, 15, 40, 6, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(471, 15, 40, 7, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(472, 15, 40, 8, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(473, 15, 41, 1, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(474, 15, 41, 2, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(475, 15, 41, 3, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(476, 15, 41, 4, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(477, 15, 41, 5, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(478, 15, 41, 6, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(479, 15, 41, 7, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(480, 15, 41, 8, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(481, 15, 42, 1, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(482, 15, 42, 2, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(483, 15, 42, 3, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(484, 15, 42, 4, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(485, 15, 42, 5, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(486, 15, 42, 6, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(487, 15, 42, 7, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(488, 15, 42, 8, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(489, 15, 22, 1, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(490, 15, 22, 2, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(491, 15, 22, 3, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(492, 15, 22, 4, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(493, 15, 22, 5, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(494, 15, 22, 6, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(495, 15, 22, 7, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(496, 15, 22, 8, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(497, 15, 43, 1, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(498, 15, 43, 2, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(499, 15, 43, 3, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(500, 15, 43, 4, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(501, 15, 43, 5, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(502, 15, 43, 6, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(503, 15, 43, 7, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(504, 15, 43, 8, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(505, 15, 44, 1, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(506, 15, 44, 2, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(507, 15, 44, 3, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(508, 15, 44, 4, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(509, 15, 44, 5, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(510, 15, 44, 6, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(511, 15, 44, 7, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(512, 15, 44, 8, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(513, 15, 45, 1, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(514, 15, 45, 2, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(515, 15, 45, 3, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(516, 15, 45, 4, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(517, 15, 45, 5, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(518, 15, 45, 6, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(519, 15, 45, 7, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(520, 15, 45, 8, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(521, 15, 46, 1, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(522, 15, 46, 2, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(523, 15, 46, 3, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(524, 15, 46, 4, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(525, 15, 46, 5, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(526, 15, 46, 6, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(527, 15, 46, 7, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(528, 15, 46, 8, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(529, 15, 47, 1, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(530, 15, 47, 2, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(531, 15, 47, 3, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(532, 15, 47, 4, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(533, 15, 47, 5, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(534, 15, 47, 6, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(535, 15, 47, 7, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(536, 15, 47, 8, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(537, 15, 48, 1, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(538, 15, 48, 2, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(539, 15, 48, 3, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45');
INSERT INTO `_product_color_sizes` (`id`, `product_id`, `color`, `size`, `assorted_flag`, `price`, `offer_price`, `stock`, `code`, `status`, `created_at`, `updated_at`) VALUES
(540, 15, 48, 4, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(541, 15, 48, 5, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(542, 15, 48, 6, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(543, 15, 48, 7, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(544, 15, 48, 8, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(545, 54, 49, 1, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(546, 54, 49, 2, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(547, 54, 49, 3, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(548, 54, 49, 4, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(549, 54, 49, 5, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(550, 54, 49, 6, 0, 615.00, 615.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(551, 54, 49, 7, 0, 615.00, 615.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(552, 54, 49, 8, 0, 615.00, 615.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(553, 54, 50, 1, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(554, 54, 50, 2, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(555, 54, 50, 3, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(556, 54, 50, 4, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(557, 54, 50, 5, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(558, 54, 50, 6, 0, 615.00, 615.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(559, 54, 50, 7, 0, 615.00, 615.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(560, 54, 50, 8, 0, 615.00, 615.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(561, 54, 51, 1, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(562, 54, 51, 2, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(563, 54, 51, 3, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(564, 54, 51, 4, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(565, 54, 51, 5, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(566, 54, 51, 6, 0, 615.00, 615.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(567, 54, 51, 7, 0, 615.00, 615.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(568, 54, 51, 8, 0, 615.00, 615.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(569, 54, 52, 1, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(570, 54, 52, 2, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(571, 54, 52, 3, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(572, 54, 52, 4, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(573, 54, 52, 5, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(574, 54, 52, 6, 0, 615.00, 615.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(575, 54, 52, 7, 0, 615.00, 615.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(576, 54, 52, 8, 0, 615.00, 615.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(577, 54, 53, 1, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(578, 54, 53, 2, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(579, 54, 53, 3, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(580, 54, 53, 4, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(581, 54, 53, 5, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(582, 54, 53, 6, 0, 615.00, 615.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(583, 54, 53, 7, 0, 615.00, 615.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(584, 54, 53, 8, 0, 615.00, 615.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(585, 54, 54, 1, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(586, 54, 54, 2, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(587, 54, 54, 3, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(588, 54, 54, 4, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(589, 54, 54, 5, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(590, 54, 54, 6, 0, 615.00, 615.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(591, 54, 54, 7, 0, 615.00, 615.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(592, 54, 54, 8, 0, 615.00, 615.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(593, 54, 55, 1, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(594, 54, 55, 2, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(595, 54, 55, 3, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(596, 54, 55, 4, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(597, 54, 55, 5, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(598, 54, 55, 6, 0, 615.00, 615.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(599, 54, 55, 7, 0, 615.00, 615.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(600, 54, 55, 8, 0, 615.00, 615.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(601, 54, 56, 1, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(602, 54, 56, 2, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(603, 54, 56, 3, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(604, 54, 56, 4, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(605, 54, 56, 5, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(606, 54, 56, 6, 0, 615.00, 615.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(607, 54, 56, 7, 0, 615.00, 615.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(608, 54, 56, 8, 0, 615.00, 615.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(609, 55, 11, 1, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(610, 55, 11, 2, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(611, 55, 11, 3, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(612, 55, 11, 4, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(613, 55, 11, 5, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(614, 55, 11, 6, 0, 475.00, 475.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(615, 55, 11, 7, 0, 475.00, 475.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(616, 55, 11, 8, 0, 475.00, 475.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(617, 55, 13, 1, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(618, 55, 13, 2, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(619, 55, 13, 3, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(620, 55, 13, 4, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(621, 55, 13, 5, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(622, 55, 13, 6, 0, 475.00, 475.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(623, 55, 13, 7, 0, 475.00, 475.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(624, 55, 13, 8, 0, 475.00, 475.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(625, 55, 17, 1, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(626, 55, 17, 2, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(627, 55, 17, 3, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(628, 55, 17, 4, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(629, 55, 17, 5, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(630, 55, 17, 6, 0, 475.00, 475.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(631, 55, 17, 7, 0, 475.00, 475.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(632, 55, 17, 8, 0, 475.00, 475.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(633, 55, 27, 1, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(634, 55, 27, 2, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(635, 55, 27, 3, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(636, 55, 27, 4, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(637, 55, 27, 5, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(638, 55, 27, 6, 0, 475.00, 475.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(639, 55, 27, 7, 0, 475.00, 475.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(640, 55, 27, 8, 0, 475.00, 475.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(641, 55, 9, 1, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(642, 55, 9, 2, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(643, 55, 9, 3, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(644, 55, 9, 4, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(645, 55, 9, 5, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(646, 55, 9, 6, 0, 475.00, 475.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(647, 55, 9, 7, 0, 475.00, 475.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(648, 55, 9, 8, 0, 475.00, 475.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(649, 55, 12, 1, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(650, 55, 12, 2, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(651, 55, 12, 3, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(652, 55, 12, 4, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(653, 55, 12, 5, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(654, 55, 12, 6, 0, 475.00, 475.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(655, 55, 12, 7, 0, 475.00, 475.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(656, 55, 12, 8, 0, 475.00, 475.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(657, 55, 18, 1, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(658, 55, 18, 2, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(659, 55, 18, 3, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(660, 55, 18, 4, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(661, 55, 18, 5, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(662, 55, 18, 6, 0, 475.00, 475.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(663, 55, 18, 7, 0, 475.00, 475.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(664, 55, 18, 8, 0, 475.00, 475.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(665, 55, 1, 1, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(666, 55, 1, 2, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(667, 55, 1, 3, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(668, 55, 1, 4, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(669, 55, 1, 5, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(670, 55, 1, 6, 0, 475.00, 475.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(671, 55, 1, 7, 0, 475.00, 475.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(672, 55, 1, 8, 0, 475.00, 475.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(673, 57, 1, 2, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(674, 57, 1, 3, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(675, 57, 1, 4, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(676, 57, 1, 5, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(677, 57, 1, 6, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(678, 57, 30, 2, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(679, 57, 30, 3, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(680, 57, 30, 4, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(681, 57, 30, 5, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(682, 57, 30, 6, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(683, 57, 13, 2, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(684, 57, 13, 3, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(685, 57, 13, 4, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(686, 57, 13, 5, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(687, 57, 13, 6, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(688, 57, 10, 2, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(689, 57, 10, 3, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(690, 57, 10, 4, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(691, 57, 10, 5, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(692, 57, 10, 6, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(693, 57, 26, 2, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(694, 57, 26, 3, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(695, 57, 26, 4, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(696, 57, 26, 5, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(697, 57, 26, 6, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(698, 57, 11, 2, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(699, 57, 11, 3, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(700, 57, 11, 4, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(701, 57, 11, 5, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(702, 57, 11, 6, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(703, 57, 43, 2, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(704, 57, 43, 3, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(705, 57, 43, 4, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(706, 57, 43, 5, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(707, 57, 43, 6, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(708, 57, 12, 2, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(709, 57, 12, 3, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(710, 57, 12, 4, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(711, 57, 12, 5, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(712, 57, 12, 6, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(713, 59, 30, 11, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(714, 59, 30, 12, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(715, 59, 30, 13, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(716, 59, 30, 14, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(717, 59, 30, 15, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(718, 59, 30, 16, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(719, 59, 30, 17, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(720, 59, 30, 18, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(721, 59, 30, 19, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(722, 59, 30, 20, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(723, 59, 30, 21, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(724, 59, 30, 22, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(725, 59, 1, 11, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(726, 59, 1, 12, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(727, 59, 1, 13, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(728, 59, 1, 14, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(729, 59, 1, 15, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(730, 59, 1, 16, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(731, 59, 1, 17, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(732, 59, 1, 18, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(733, 59, 1, 19, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(734, 59, 1, 20, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(735, 59, 1, 21, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(736, 59, 1, 22, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(737, 59, 24, 11, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(738, 59, 24, 12, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(739, 59, 24, 13, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(740, 59, 24, 14, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(741, 59, 24, 15, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(742, 59, 24, 16, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(743, 59, 24, 17, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(744, 59, 24, 18, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(745, 59, 24, 19, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(746, 59, 24, 20, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(747, 59, 24, 21, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(748, 59, 24, 22, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(749, 59, 16, 11, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(750, 59, 16, 12, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(751, 59, 16, 13, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(752, 59, 16, 14, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(753, 59, 16, 15, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(754, 59, 16, 16, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(755, 59, 16, 17, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(756, 59, 16, 18, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(757, 59, 16, 19, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(758, 59, 16, 20, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(759, 59, 16, 21, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(760, 59, 16, 22, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(761, 59, 17, 11, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(762, 59, 17, 12, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(763, 59, 17, 13, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(764, 59, 17, 14, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(765, 59, 17, 15, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(766, 59, 17, 16, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(767, 59, 17, 17, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(768, 59, 17, 18, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(769, 59, 17, 19, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(770, 59, 17, 20, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(771, 59, 17, 21, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(772, 59, 17, 22, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(773, 59, 5, 11, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(774, 59, 5, 12, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(775, 59, 5, 13, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(776, 59, 5, 14, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(777, 59, 5, 15, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(778, 59, 5, 16, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(779, 59, 5, 17, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(780, 59, 5, 18, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(781, 59, 5, 19, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(782, 59, 5, 20, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(783, 59, 5, 21, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(784, 59, 5, 22, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(785, 59, 11, 11, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(786, 59, 11, 12, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(787, 59, 11, 13, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(788, 59, 11, 14, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(789, 59, 11, 15, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(790, 59, 11, 16, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(791, 59, 11, 17, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(792, 59, 11, 18, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(793, 59, 11, 19, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(794, 59, 11, 20, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(795, 59, 11, 21, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(796, 59, 11, 22, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(797, 59, 12, 11, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(798, 59, 12, 12, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(799, 59, 12, 13, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(800, 59, 12, 14, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(801, 59, 12, 15, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(802, 59, 12, 16, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(803, 59, 12, 17, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(804, 59, 12, 18, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(805, 59, 12, 19, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(806, 59, 12, 20, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(807, 59, 12, 21, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(808, 59, 12, 22, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(809, 59, 13, 11, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(810, 59, 13, 12, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(811, 59, 13, 13, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(812, 59, 13, 14, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(813, 59, 13, 15, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(814, 59, 13, 16, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(815, 59, 13, 17, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(816, 59, 13, 18, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(817, 59, 13, 19, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(818, 59, 13, 20, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(819, 59, 13, 21, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(820, 59, 13, 22, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(821, 60, 11, 11, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(822, 60, 11, 12, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(823, 60, 11, 13, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(824, 60, 11, 14, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(825, 60, 11, 15, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(826, 60, 11, 16, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(827, 60, 11, 17, 0, 380.00, 380.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(828, 60, 11, 18, 0, 380.00, 380.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(829, 60, 11, 19, 0, 380.00, 380.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(830, 60, 11, 20, 0, 380.00, 380.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(831, 60, 11, 21, 0, 380.00, 380.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(832, 60, 11, 22, 0, 380.00, 380.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(833, 60, 13, 11, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(834, 60, 13, 12, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(835, 60, 13, 13, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(836, 60, 13, 14, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(837, 60, 13, 15, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(838, 60, 13, 16, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(839, 60, 13, 17, 0, 380.00, 380.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(840, 60, 13, 18, 0, 380.00, 380.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(841, 60, 13, 19, 0, 380.00, 380.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(842, 60, 13, 20, 0, 380.00, 380.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(843, 60, 13, 21, 0, 380.00, 380.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(844, 60, 13, 22, 0, 380.00, 380.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(845, 60, 27, 11, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(846, 60, 27, 12, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(847, 60, 27, 13, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(848, 60, 27, 14, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(849, 60, 27, 15, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(850, 60, 27, 16, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(851, 60, 27, 17, 0, 380.00, 380.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(852, 60, 27, 18, 0, 380.00, 380.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(853, 60, 27, 19, 0, 380.00, 380.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(854, 60, 27, 20, 0, 380.00, 380.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(855, 60, 27, 21, 0, 380.00, 380.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(856, 60, 27, 22, 0, 380.00, 380.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(857, 60, 18, 11, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(858, 60, 18, 12, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(859, 60, 18, 13, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(860, 60, 18, 14, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(861, 60, 18, 15, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(862, 60, 18, 16, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(863, 60, 18, 17, 0, 380.00, 380.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(864, 60, 18, 18, 0, 380.00, 380.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(865, 60, 18, 19, 0, 380.00, 380.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(866, 60, 18, 20, 0, 380.00, 380.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(867, 60, 18, 21, 0, 380.00, 380.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(868, 60, 18, 22, 0, 380.00, 380.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(869, 91, 11, 2, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(870, 91, 11, 3, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(871, 91, 11, 4, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(872, 91, 11, 5, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(873, 91, 11, 6, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(874, 91, 14, 2, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(875, 91, 14, 3, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(876, 91, 14, 4, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(877, 91, 14, 5, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(878, 91, 14, 6, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(879, 91, 13, 2, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(880, 91, 13, 3, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(881, 91, 13, 4, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(882, 91, 13, 5, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(883, 91, 13, 6, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(884, 92, 11, 2, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(885, 92, 11, 3, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(886, 92, 11, 4, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(887, 92, 11, 5, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(888, 92, 11, 6, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(889, 92, 14, 2, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(890, 92, 14, 3, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(891, 92, 14, 4, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(892, 92, 14, 5, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(893, 92, 14, 6, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(894, 92, 13, 2, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(895, 92, 13, 3, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(896, 92, 13, 4, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(897, 92, 13, 5, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(898, 92, 13, 6, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(899, 93, 11, 2, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(900, 93, 11, 3, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(901, 93, 11, 4, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(902, 93, 11, 5, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(903, 93, 11, 6, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(904, 93, 14, 2, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(905, 93, 14, 3, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(906, 93, 14, 4, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(907, 93, 14, 5, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(908, 93, 14, 6, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(909, 93, 13, 2, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(910, 93, 13, 3, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(911, 93, 13, 4, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(912, 93, 13, 5, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(913, 93, 13, 6, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(914, 94, 11, 2, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(915, 94, 11, 3, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(916, 94, 11, 4, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(917, 94, 11, 5, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(918, 94, 11, 6, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(919, 94, 14, 2, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(920, 94, 14, 3, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(921, 94, 14, 4, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(922, 94, 14, 5, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(923, 94, 14, 6, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(924, 94, 13, 2, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(925, 94, 13, 3, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(926, 94, 13, 4, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(927, 94, 13, 5, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(928, 94, 13, 6, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(929, 95, 11, 2, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(930, 95, 11, 3, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(931, 95, 11, 4, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(932, 95, 11, 5, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(933, 95, 11, 6, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(934, 95, 14, 2, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(935, 95, 14, 3, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(936, 95, 14, 4, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(937, 95, 14, 5, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(938, 95, 14, 6, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(939, 95, 13, 2, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(940, 95, 13, 3, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(941, 95, 13, 4, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(942, 95, 13, 5, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(943, 95, 13, 6, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(944, 96, 11, 2, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(945, 96, 11, 3, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(946, 96, 11, 4, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(947, 96, 11, 5, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(948, 96, 11, 6, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(949, 96, 14, 2, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(950, 96, 14, 3, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(951, 96, 14, 4, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(952, 96, 14, 5, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(953, 96, 14, 6, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(954, 96, 13, 2, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(955, 96, 13, 3, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(956, 96, 13, 4, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(957, 96, 13, 5, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(958, 96, 13, 6, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(959, 96, 1, 2, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(960, 96, 1, 3, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(961, 96, 1, 4, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(962, 96, 1, 5, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(963, 96, 1, 6, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(964, 97, 14, 2, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(965, 97, 14, 3, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(966, 97, 14, 4, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(967, 97, 14, 5, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(968, 97, 14, 6, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(969, 97, 13, 2, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(970, 97, 13, 3, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(971, 97, 13, 4, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(972, 97, 13, 5, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(973, 97, 13, 6, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(974, 97, 1, 2, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(975, 97, 1, 3, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(976, 97, 1, 4, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(977, 97, 1, 5, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(978, 97, 1, 6, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(979, 98, 11, 2, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(980, 98, 11, 3, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(981, 98, 11, 4, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(982, 98, 11, 5, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(983, 98, 11, 6, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(984, 98, 14, 2, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(985, 98, 14, 3, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(986, 98, 14, 4, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(987, 98, 14, 5, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(988, 98, 14, 6, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(989, 98, 13, 2, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(990, 98, 13, 3, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(991, 98, 13, 4, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(992, 98, 13, 5, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(993, 98, 13, 6, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(994, 99, 11, 2, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(995, 99, 11, 3, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(996, 99, 11, 4, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(997, 99, 11, 5, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(998, 99, 11, 6, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(999, 99, 14, 2, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1000, 99, 14, 3, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1001, 99, 14, 4, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1002, 99, 14, 5, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1003, 99, 14, 6, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1004, 99, 13, 2, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1005, 99, 13, 3, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1006, 99, 13, 4, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1007, 99, 13, 5, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1008, 99, 13, 6, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1009, 100, 11, 2, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1010, 100, 11, 3, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1011, 100, 11, 4, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1012, 100, 11, 5, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1013, 100, 11, 6, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1014, 100, 14, 2, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1015, 100, 14, 3, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1016, 100, 14, 4, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1017, 100, 14, 5, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1018, 100, 14, 6, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1019, 100, 13, 2, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1020, 100, 13, 3, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1021, 100, 13, 4, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1022, 100, 13, 5, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1023, 100, 13, 6, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1024, 101, 11, 2, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1025, 101, 11, 3, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1026, 101, 11, 4, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1027, 101, 11, 5, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1028, 101, 11, 6, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1029, 101, 14, 2, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1030, 101, 14, 3, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1031, 101, 14, 4, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1032, 101, 14, 5, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1033, 101, 14, 6, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1034, 101, 13, 2, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1035, 101, 13, 3, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1036, 101, 13, 4, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1037, 101, 13, 5, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1038, 101, 13, 6, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1039, 101, 42, 2, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1040, 101, 42, 3, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1041, 101, 42, 4, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1042, 101, 42, 5, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1043, 101, 42, 6, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1044, 101, 57, 2, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1045, 101, 57, 3, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1046, 101, 57, 4, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1047, 101, 57, 5, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1048, 101, 57, 6, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1049, 102, 11, 2, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1050, 102, 11, 3, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1051, 102, 11, 4, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1052, 102, 11, 5, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1053, 102, 11, 6, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1054, 102, 58, 2, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1055, 102, 58, 3, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1056, 102, 58, 4, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1057, 102, 58, 5, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1058, 102, 58, 6, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1059, 102, 13, 2, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1060, 102, 13, 3, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1061, 102, 13, 4, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1062, 102, 13, 5, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1063, 102, 13, 6, 0, 849.00, 849.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1064, 103, 11, 2, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1065, 103, 11, 3, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1066, 103, 11, 4, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1067, 103, 11, 5, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1068, 103, 11, 6, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1069, 103, 13, 2, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1070, 103, 13, 3, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1071, 103, 13, 4, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1072, 103, 13, 5, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45');
INSERT INTO `_product_color_sizes` (`id`, `product_id`, `color`, `size`, `assorted_flag`, `price`, `offer_price`, `stock`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1073, 103, 13, 6, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1074, 104, 11, 2, 0, 650.00, 650.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1075, 104, 11, 3, 0, 650.00, 650.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1076, 104, 11, 4, 0, 650.00, 650.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1077, 104, 11, 5, 0, 650.00, 650.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1078, 104, 11, 6, 0, 650.00, 650.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1079, 104, 58, 2, 0, 650.00, 650.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1080, 104, 58, 3, 0, 650.00, 650.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1081, 104, 58, 4, 0, 650.00, 650.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1082, 104, 58, 5, 0, 650.00, 650.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1083, 104, 58, 6, 0, 650.00, 650.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1084, 104, 13, 2, 0, 650.00, 650.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1085, 104, 13, 3, 0, 650.00, 650.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1086, 104, 13, 4, 0, 650.00, 650.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1087, 104, 13, 5, 0, 650.00, 650.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1088, 104, 13, 6, 0, 650.00, 650.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1089, 104, 39, 2, 0, 650.00, 650.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1090, 104, 39, 3, 0, 650.00, 650.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1091, 104, 39, 4, 0, 650.00, 650.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1092, 104, 39, 5, 0, 650.00, 650.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1093, 104, 39, 6, 0, 650.00, 650.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1094, 139, 11, 2, 0, 549.00, 549.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1095, 139, 11, 3, 0, 549.00, 549.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1096, 139, 11, 4, 0, 549.00, 549.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1097, 139, 11, 5, 0, 549.00, 549.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1098, 139, 11, 6, 0, 549.00, 549.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1099, 139, 58, 2, 0, 549.00, 549.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1100, 139, 58, 3, 0, 549.00, 549.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1101, 139, 58, 4, 0, 549.00, 549.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1102, 139, 58, 5, 0, 549.00, 549.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1103, 139, 58, 6, 0, 549.00, 549.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1104, 139, 13, 2, 0, 549.00, 549.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1105, 139, 13, 3, 0, 549.00, 549.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1106, 139, 13, 4, 0, 549.00, 549.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1107, 139, 13, 5, 0, 549.00, 549.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1108, 139, 13, 6, 0, 549.00, 549.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1109, 139, 24, 2, 0, 549.00, 549.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1110, 139, 24, 3, 0, 549.00, 549.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1111, 139, 24, 4, 0, 549.00, 549.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1112, 139, 24, 5, 0, 549.00, 549.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1113, 139, 24, 6, 0, 549.00, 549.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1114, 58, 11, 2, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1115, 58, 11, 3, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1116, 58, 11, 4, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1117, 58, 11, 5, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1118, 58, 11, 6, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1119, 58, 12, 2, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1120, 58, 12, 3, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1121, 58, 12, 4, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1122, 58, 12, 5, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1123, 58, 12, 6, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1124, 58, 13, 2, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1125, 58, 13, 3, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1126, 58, 13, 4, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1127, 58, 13, 5, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1128, 58, 13, 6, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1129, 58, 1, 2, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1130, 58, 1, 3, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1131, 58, 1, 4, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1132, 58, 1, 5, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1133, 58, 1, 6, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1134, 58, 5, 2, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1135, 58, 5, 3, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1136, 58, 5, 4, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1137, 58, 5, 5, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1138, 58, 5, 6, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1139, 58, 30, 2, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1140, 58, 30, 3, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1141, 58, 30, 4, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1142, 58, 30, 5, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1143, 58, 30, 6, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1144, 58, 10, 2, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1145, 58, 10, 3, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1146, 58, 10, 4, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1147, 58, 10, 5, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1148, 58, 10, 6, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1149, 58, 26, 2, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1150, 58, 26, 3, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1151, 58, 26, 4, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1152, 58, 26, 5, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1153, 58, 26, 6, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1154, 58, 59, 2, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1155, 58, 59, 3, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1156, 58, 59, 4, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1157, 58, 59, 5, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1158, 58, 59, 6, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1159, 16, 24, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1160, 16, 24, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1161, 16, 24, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1162, 16, 24, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1163, 16, 24, 5, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1164, 16, 24, 6, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1165, 16, 24, 7, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1166, 16, 24, 8, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1167, 16, 11, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1168, 16, 11, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1169, 16, 11, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1170, 16, 11, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1171, 16, 11, 5, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1172, 16, 11, 6, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1173, 16, 11, 7, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1174, 16, 11, 8, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1175, 16, 28, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1176, 16, 28, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1177, 16, 28, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1178, 16, 28, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1179, 16, 28, 5, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1180, 16, 28, 6, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1181, 16, 28, 7, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1182, 16, 28, 8, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1183, 16, 29, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1184, 16, 29, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1185, 16, 29, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1186, 16, 29, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1187, 16, 29, 5, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1188, 16, 29, 6, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1189, 16, 29, 7, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1190, 16, 29, 8, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1191, 16, 19, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1192, 16, 19, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1193, 16, 19, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1194, 16, 19, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1195, 16, 19, 5, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1196, 16, 19, 6, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1197, 16, 19, 7, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1198, 16, 19, 8, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1199, 16, 30, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1200, 16, 30, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1201, 16, 30, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1202, 16, 30, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1203, 16, 30, 5, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1204, 16, 30, 6, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1205, 16, 30, 7, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1206, 16, 30, 8, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1207, 16, 17, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1208, 16, 17, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1209, 16, 17, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1210, 16, 17, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1211, 16, 17, 5, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1212, 16, 17, 6, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1213, 16, 17, 7, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1214, 16, 17, 8, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1215, 16, 25, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1216, 16, 25, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1217, 16, 25, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1218, 16, 25, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1219, 16, 25, 5, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1220, 16, 25, 6, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1221, 16, 25, 7, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1222, 16, 25, 8, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1223, 16, 13, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1224, 16, 13, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1225, 16, 13, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1226, 16, 13, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1227, 16, 13, 5, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1228, 16, 13, 6, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1229, 16, 13, 7, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1230, 16, 13, 8, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1231, 16, 4, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1232, 16, 4, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1233, 16, 4, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1234, 16, 4, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1235, 16, 4, 5, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1236, 16, 4, 6, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1237, 16, 4, 7, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1238, 16, 4, 8, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1239, 16, 31, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1240, 16, 31, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1241, 16, 31, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1242, 16, 31, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1243, 16, 31, 5, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1244, 16, 31, 6, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1245, 16, 31, 7, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1246, 16, 31, 8, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1247, 16, 26, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1248, 16, 26, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1249, 16, 26, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1250, 16, 26, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1251, 16, 26, 5, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1252, 16, 26, 6, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1253, 16, 26, 7, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1254, 16, 26, 8, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1255, 16, 9, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1256, 16, 9, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1257, 16, 9, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1258, 16, 9, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1259, 16, 9, 5, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1260, 16, 9, 6, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1261, 16, 9, 7, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1262, 16, 9, 8, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1263, 16, 1, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1264, 16, 1, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1265, 16, 1, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1266, 16, 1, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1267, 16, 1, 5, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1268, 16, 1, 6, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1269, 16, 1, 7, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1270, 16, 1, 8, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1271, 16, 12, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1272, 16, 12, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1273, 16, 12, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1274, 16, 12, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1275, 16, 12, 5, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1276, 16, 12, 6, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1277, 16, 12, 7, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1278, 16, 12, 8, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1279, 16, 32, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1280, 16, 32, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1281, 16, 32, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1282, 16, 32, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1283, 16, 32, 5, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1284, 16, 32, 6, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1285, 16, 32, 7, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1286, 16, 32, 8, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1287, 16, 33, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1288, 16, 33, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1289, 16, 33, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1290, 16, 33, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1291, 16, 33, 5, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1292, 16, 33, 6, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1293, 16, 33, 7, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1294, 16, 33, 8, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1295, 16, 34, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1296, 16, 34, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1297, 16, 34, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1298, 16, 34, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1299, 16, 34, 5, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1300, 16, 34, 6, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1301, 16, 34, 7, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1302, 16, 34, 8, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1303, 16, 35, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1304, 16, 35, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1305, 16, 35, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1306, 16, 35, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1307, 16, 35, 5, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1308, 16, 35, 6, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1309, 16, 35, 7, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1310, 16, 35, 8, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1311, 16, 36, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1312, 16, 36, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1313, 16, 36, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1314, 16, 36, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1315, 16, 36, 5, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1316, 16, 36, 6, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1317, 16, 36, 7, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1318, 16, 36, 8, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1319, 16, 37, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1320, 16, 37, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1321, 16, 37, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1322, 16, 37, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1323, 16, 37, 5, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1324, 16, 37, 6, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1325, 16, 37, 7, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1326, 16, 37, 8, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1327, 16, 38, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1328, 16, 38, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1329, 16, 38, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1330, 16, 38, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1331, 16, 38, 5, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1332, 16, 38, 6, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1333, 16, 38, 7, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1334, 16, 38, 8, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1335, 16, 15, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1336, 16, 15, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1337, 16, 15, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1338, 16, 15, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1339, 16, 15, 5, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1340, 16, 15, 6, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1341, 16, 15, 7, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1342, 16, 15, 8, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1343, 16, 39, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1344, 16, 39, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1345, 16, 39, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1346, 16, 39, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1347, 16, 39, 5, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1348, 16, 39, 6, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1349, 16, 39, 7, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1350, 16, 39, 8, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1351, 16, 40, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1352, 16, 40, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1353, 16, 40, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1354, 16, 40, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1355, 16, 40, 5, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1356, 16, 40, 6, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1357, 16, 40, 7, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1358, 16, 40, 8, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1359, 16, 41, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1360, 16, 41, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1361, 16, 41, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1362, 16, 41, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1363, 16, 41, 5, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1364, 16, 41, 6, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1365, 16, 41, 7, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1366, 16, 41, 8, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1367, 16, 42, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1368, 16, 42, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1369, 16, 42, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1370, 16, 42, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1371, 16, 42, 5, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1372, 16, 42, 6, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1373, 16, 42, 7, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1374, 16, 42, 8, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1375, 16, 22, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1376, 16, 22, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1377, 16, 22, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1378, 16, 22, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1379, 16, 22, 5, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1380, 16, 22, 6, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1381, 16, 22, 7, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1382, 16, 22, 8, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1383, 16, 43, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1384, 16, 43, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1385, 16, 43, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1386, 16, 43, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1387, 16, 43, 5, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1388, 16, 43, 6, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1389, 16, 43, 7, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1390, 16, 43, 8, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1391, 16, 44, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1392, 16, 44, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1393, 16, 44, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1394, 16, 44, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1395, 16, 44, 5, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1396, 16, 44, 6, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1397, 16, 44, 7, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1398, 16, 44, 8, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1399, 16, 45, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1400, 16, 45, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1401, 16, 45, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1402, 16, 45, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1403, 16, 45, 5, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1404, 16, 45, 6, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1405, 16, 45, 7, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1406, 16, 45, 8, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1407, 16, 46, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1408, 16, 46, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1409, 16, 46, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1410, 16, 46, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1411, 16, 46, 5, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1412, 16, 46, 6, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1413, 16, 46, 7, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1414, 16, 46, 8, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1415, 16, 47, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1416, 16, 47, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1417, 16, 47, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1418, 16, 47, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1419, 16, 47, 5, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1420, 16, 47, 6, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1421, 16, 47, 7, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1422, 16, 47, 8, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1423, 16, 48, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1424, 16, 48, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1425, 16, 48, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1426, 16, 48, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1427, 16, 48, 5, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1428, 16, 48, 6, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1429, 16, 48, 7, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1430, 16, 48, 8, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1431, 22, 12, 2, 0, 140.00, 140.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1432, 22, 12, 3, 0, 140.00, 140.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1433, 22, 12, 4, 0, 140.00, 140.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1434, 22, 12, 5, 0, 150.00, 150.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1435, 22, 12, 6, 0, 150.00, 150.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1436, 23, 11, 2, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1437, 23, 11, 3, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1438, 23, 11, 4, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1439, 23, 11, 5, 0, 335.00, 335.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1440, 23, 11, 6, 0, 335.00, 335.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1441, 23, 13, 2, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1442, 23, 13, 3, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1443, 23, 13, 4, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1444, 23, 13, 5, 0, 335.00, 335.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1445, 23, 13, 6, 0, 335.00, 335.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1446, 23, 17, 2, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1447, 23, 17, 3, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1448, 23, 17, 4, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1449, 23, 17, 5, 0, 335.00, 335.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1450, 23, 17, 6, 0, 335.00, 335.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1451, 23, 42, 2, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1452, 23, 42, 3, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1453, 23, 42, 4, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1454, 23, 42, 5, 0, 335.00, 335.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1455, 23, 42, 6, 0, 335.00, 335.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1456, 23, 60, 2, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1457, 23, 60, 3, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1458, 23, 60, 4, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1459, 23, 60, 5, 0, 335.00, 335.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1460, 23, 60, 6, 0, 335.00, 335.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1461, 23, 19, 2, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1462, 23, 19, 3, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1463, 23, 19, 4, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1464, 23, 19, 5, 0, 335.00, 335.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1465, 23, 19, 6, 0, 335.00, 335.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1466, 23, 57, 2, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1467, 23, 57, 3, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1468, 23, 57, 4, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1469, 23, 57, 5, 0, 335.00, 335.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1470, 23, 57, 6, 0, 335.00, 335.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1471, 24, 11, 2, 0, 140.00, 140.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1472, 24, 11, 3, 0, 140.00, 140.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1473, 24, 11, 4, 0, 140.00, 140.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1474, 24, 11, 5, 0, 150.00, 150.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1475, 24, 11, 6, 0, 150.00, 150.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1476, 24, 13, 2, 0, 140.00, 140.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1477, 24, 13, 3, 0, 140.00, 140.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1478, 24, 13, 4, 0, 140.00, 140.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1479, 24, 13, 5, 0, 150.00, 150.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1480, 24, 13, 6, 0, 150.00, 150.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1481, 24, 17, 2, 0, 140.00, 140.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1482, 24, 17, 3, 0, 140.00, 140.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1483, 24, 17, 4, 0, 140.00, 140.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1484, 24, 17, 5, 0, 150.00, 150.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1485, 24, 17, 6, 0, 150.00, 150.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1486, 24, 42, 2, 0, 140.00, 140.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1487, 24, 42, 3, 0, 140.00, 140.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1488, 24, 42, 4, 0, 140.00, 140.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1489, 24, 42, 5, 0, 150.00, 150.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1490, 24, 42, 6, 0, 150.00, 150.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1491, 24, 60, 2, 0, 140.00, 140.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1492, 24, 60, 3, 0, 140.00, 140.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1493, 24, 60, 4, 0, 140.00, 140.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1494, 24, 60, 5, 0, 150.00, 150.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1495, 24, 60, 6, 0, 150.00, 150.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1496, 25, 61, 2, 0, 165.00, 165.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1497, 25, 61, 3, 0, 165.00, 165.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1498, 25, 61, 4, 0, 165.00, 165.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1499, 25, 61, 5, 0, 175.00, 175.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1500, 25, 61, 6, 0, 175.00, 175.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1501, 26, 61, 2, 0, 185.00, 185.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1502, 26, 61, 3, 0, 185.00, 185.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1503, 26, 61, 4, 0, 185.00, 185.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1504, 26, 61, 5, 0, 195.00, 195.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1505, 26, 61, 6, 0, 195.00, 195.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1506, 107, 61, 2, 0, 310.00, 310.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1507, 107, 61, 3, 0, 310.00, 310.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1508, 107, 61, 4, 0, 310.00, 310.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1509, 107, 61, 5, 0, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1510, 107, 61, 6, 0, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1511, 61, 61, 2, 0, 649.00, 649.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1512, 61, 61, 3, 0, 649.00, 649.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1513, 61, 61, 4, 0, 649.00, 649.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1514, 61, 61, 5, 0, 649.00, 649.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1515, 61, 61, 6, 0, 649.00, 649.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1516, 61, 61, 7, 0, 649.00, 649.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1517, 61, 61, 8, 0, 649.00, 649.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1518, 62, 61, 2, 0, 649.00, 649.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1519, 62, 61, 3, 0, 649.00, 649.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1520, 62, 61, 4, 0, 649.00, 649.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1521, 62, 61, 5, 0, 649.00, 649.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1522, 62, 61, 6, 0, 649.00, 649.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1523, 62, 61, 7, 0, 649.00, 649.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1524, 62, 61, 8, 0, 649.00, 649.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1525, 63, 61, 2, 0, 649.00, 649.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1526, 63, 61, 3, 0, 649.00, 649.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1527, 63, 61, 4, 0, 649.00, 649.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1528, 63, 61, 5, 0, 649.00, 649.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1529, 63, 61, 6, 0, 649.00, 649.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1530, 63, 61, 7, 0, 649.00, 649.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1531, 63, 61, 8, 0, 649.00, 649.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1532, 64, 61, 2, 0, 649.00, 649.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1533, 64, 61, 3, 0, 649.00, 649.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1534, 64, 61, 4, 0, 649.00, 649.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1535, 64, 61, 5, 0, 649.00, 649.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1536, 64, 61, 6, 0, 649.00, 649.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1537, 64, 61, 7, 0, 649.00, 649.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1538, 64, 61, 8, 0, 649.00, 649.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1539, 65, 61, 2, 0, 649.00, 649.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1540, 65, 61, 3, 0, 649.00, 649.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1541, 65, 61, 4, 0, 649.00, 649.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1542, 65, 61, 5, 0, 649.00, 649.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1543, 65, 61, 6, 0, 649.00, 649.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1544, 65, 61, 7, 0, 649.00, 649.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1545, 65, 61, 8, 0, 649.00, 649.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1546, 56, 61, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1547, 56, 61, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1548, 56, 61, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1549, 56, 61, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1550, 56, 61, 5, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1551, 56, 61, 6, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1552, 56, 61, 7, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1553, 56, 61, 8, 0, 625.00, 625.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1554, 105, 61, 2, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1555, 105, 61, 3, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1556, 105, 61, 4, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1557, 105, 61, 5, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1558, 105, 61, 6, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1559, 106, 61, 2, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1560, 106, 61, 3, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1561, 106, 61, 4, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1562, 106, 61, 5, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1563, 106, 61, 6, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1564, 27, 12, 1, 0, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1565, 27, 12, 2, 0, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1566, 27, 12, 3, 0, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1567, 27, 12, 4, 0, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1568, 27, 12, 5, 0, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1569, 28, 11, 1, 0, 275.00, 275.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1570, 28, 11, 2, 0, 275.00, 275.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1571, 28, 11, 3, 0, 275.00, 275.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1572, 28, 11, 4, 0, 275.00, 275.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1573, 28, 11, 5, 0, 275.00, 275.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1584, 108, 11, 1, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1585, 108, 11, 2, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1586, 108, 11, 3, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1587, 108, 11, 4, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1588, 108, 11, 5, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1589, 109, 61, 1, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1590, 109, 61, 2, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1591, 109, 61, 3, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1592, 109, 61, 4, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1593, 109, 61, 5, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1594, 110, 61, 1, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1595, 110, 61, 2, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1596, 110, 61, 3, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1597, 110, 61, 4, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1598, 110, 61, 5, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1599, 111, 13, 1, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1600, 111, 13, 2, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1601, 111, 13, 3, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1602, 111, 13, 4, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1603, 111, 13, 5, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1604, 111, 11, 1, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1605, 111, 11, 2, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1606, 111, 11, 3, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1607, 111, 11, 4, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1608, 111, 11, 5, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1609, 111, 60, 1, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1610, 111, 60, 2, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1611, 111, 60, 3, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45');
INSERT INTO `_product_color_sizes` (`id`, `product_id`, `color`, `size`, `assorted_flag`, `price`, `offer_price`, `stock`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1612, 111, 60, 4, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1613, 111, 60, 5, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1614, 31, 13, 1, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1615, 31, 13, 2, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1616, 31, 13, 3, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1617, 31, 13, 4, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1618, 31, 13, 5, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1619, 31, 11, 1, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1620, 31, 11, 2, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1621, 31, 11, 3, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1622, 31, 11, 4, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1623, 31, 11, 5, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1624, 31, 60, 1, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1625, 31, 60, 2, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1626, 31, 60, 3, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1627, 31, 60, 4, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1628, 31, 60, 5, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1629, 32, 13, 2, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1630, 32, 13, 3, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1631, 32, 13, 4, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1632, 32, 13, 5, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1633, 32, 13, 6, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1634, 32, 58, 2, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1635, 32, 58, 3, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1636, 32, 58, 4, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1637, 32, 58, 5, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1638, 32, 58, 6, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1639, 32, 39, 2, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1640, 32, 39, 3, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1641, 32, 39, 4, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1642, 32, 39, 5, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1643, 32, 39, 6, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1644, 32, 11, 2, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1645, 32, 11, 3, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1646, 32, 11, 4, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1647, 32, 11, 5, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1648, 32, 11, 6, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1649, 33, 13, 2, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1650, 33, 13, 3, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1651, 33, 13, 4, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1652, 33, 13, 5, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1653, 33, 13, 6, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1654, 33, 58, 2, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1655, 33, 58, 3, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1656, 33, 58, 4, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1657, 33, 58, 5, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1658, 33, 58, 6, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1659, 33, 47, 2, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1660, 33, 47, 3, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1661, 33, 47, 4, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1662, 33, 47, 5, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1663, 33, 47, 6, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1664, 33, 11, 2, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1665, 33, 11, 3, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1666, 33, 11, 4, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1667, 33, 11, 5, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1668, 33, 11, 6, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1669, 33, 46, 2, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1670, 33, 46, 3, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1671, 33, 46, 4, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1672, 33, 46, 5, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1673, 33, 46, 6, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1674, 33, 25, 2, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1675, 33, 25, 3, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1676, 33, 25, 4, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1677, 33, 25, 5, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1678, 33, 25, 6, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1679, 33, 4, 2, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1680, 33, 4, 3, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1681, 33, 4, 4, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1682, 33, 4, 5, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1683, 33, 4, 6, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1684, 33, 62, 2, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1685, 33, 62, 3, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1686, 33, 62, 4, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1687, 33, 62, 5, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1688, 33, 62, 6, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1689, 34, 13, 2, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1690, 34, 13, 3, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1691, 34, 13, 4, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1692, 34, 13, 5, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1693, 34, 13, 6, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1694, 34, 58, 2, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1695, 34, 58, 3, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1696, 34, 58, 4, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1697, 34, 58, 5, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1698, 34, 58, 6, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1699, 34, 11, 2, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1700, 34, 11, 3, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1701, 34, 11, 4, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1702, 34, 11, 5, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1703, 34, 11, 6, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1704, 35, 13, 2, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1705, 35, 13, 3, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1706, 35, 13, 4, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1707, 35, 13, 5, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1708, 35, 13, 6, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1709, 35, 58, 2, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1710, 35, 58, 3, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1711, 35, 58, 4, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1712, 35, 58, 5, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1713, 35, 58, 6, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1714, 35, 11, 2, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1715, 35, 11, 3, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1716, 35, 11, 4, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1717, 35, 11, 5, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1718, 35, 11, 6, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1719, 36, 13, 2, 0, 1099.00, 1099.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1720, 36, 13, 3, 0, 1099.00, 1099.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1721, 36, 13, 4, 0, 1099.00, 1099.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1722, 36, 13, 5, 0, 1099.00, 1099.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1723, 36, 13, 6, 0, 1099.00, 1099.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1724, 36, 58, 2, 0, 1099.00, 1099.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1725, 36, 58, 3, 0, 1099.00, 1099.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1726, 36, 58, 4, 0, 1099.00, 1099.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1727, 36, 58, 5, 0, 1099.00, 1099.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1728, 36, 58, 6, 0, 1099.00, 1099.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1729, 36, 11, 2, 0, 1099.00, 1099.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1730, 36, 11, 3, 0, 1099.00, 1099.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1731, 36, 11, 4, 0, 1099.00, 1099.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1732, 36, 11, 5, 0, 1099.00, 1099.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1733, 36, 11, 6, 0, 1099.00, 1099.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1734, 36, 39, 2, 0, 1099.00, 1099.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1735, 36, 39, 3, 0, 1099.00, 1099.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1736, 36, 39, 4, 0, 1099.00, 1099.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1737, 36, 39, 5, 0, 1099.00, 1099.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1738, 36, 39, 6, 0, 1099.00, 1099.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1739, 36, 4, 2, 0, 1099.00, 1099.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1740, 36, 4, 3, 0, 1099.00, 1099.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1741, 36, 4, 4, 0, 1099.00, 1099.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1742, 36, 4, 5, 0, 1099.00, 1099.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1743, 36, 4, 6, 0, 1099.00, 1099.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1744, 37, 13, 2, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1745, 37, 13, 3, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1746, 37, 13, 4, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1747, 37, 13, 5, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1748, 37, 13, 6, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1749, 37, 58, 2, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1750, 37, 58, 3, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1751, 37, 58, 4, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1752, 37, 58, 5, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1753, 37, 58, 6, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1754, 37, 11, 2, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1755, 37, 11, 3, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1756, 37, 11, 4, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1757, 37, 11, 5, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1758, 37, 11, 6, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1759, 37, 39, 2, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1760, 37, 39, 3, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1761, 37, 39, 4, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1762, 37, 39, 5, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1763, 37, 39, 6, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1764, 113, 13, 2, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1765, 113, 13, 3, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1766, 113, 13, 4, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1767, 113, 13, 5, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1768, 113, 13, 6, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1769, 113, 58, 2, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1770, 113, 58, 3, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1771, 113, 58, 4, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1772, 113, 58, 5, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1773, 113, 58, 6, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1774, 113, 11, 2, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1775, 113, 11, 3, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1776, 113, 11, 4, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1777, 113, 11, 5, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1778, 113, 11, 6, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1779, 114, 13, 2, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1780, 114, 13, 3, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1781, 114, 13, 4, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1782, 114, 13, 5, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1783, 114, 13, 6, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1784, 114, 58, 2, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1785, 114, 58, 3, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1786, 114, 58, 4, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1787, 114, 58, 5, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1788, 114, 58, 6, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1789, 114, 11, 2, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1790, 114, 11, 3, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1791, 114, 11, 4, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1792, 114, 11, 5, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1793, 114, 11, 6, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1794, 115, 13, 2, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1795, 115, 13, 3, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1796, 115, 13, 4, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1797, 115, 13, 5, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1798, 115, 13, 6, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1799, 115, 58, 2, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1800, 115, 58, 3, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1801, 115, 58, 4, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1802, 115, 58, 5, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1803, 115, 58, 6, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1804, 115, 11, 2, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1805, 115, 11, 3, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1806, 115, 11, 4, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1807, 115, 11, 5, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1808, 115, 11, 6, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1824, 118, 13, 2, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1825, 118, 13, 3, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1826, 118, 13, 4, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1827, 118, 13, 5, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1828, 118, 58, 2, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1829, 118, 58, 3, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1830, 118, 58, 4, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1831, 118, 58, 5, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1832, 118, 11, 2, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1833, 118, 11, 3, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1834, 118, 11, 4, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1835, 118, 11, 5, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1836, 118, 22, 2, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1837, 118, 22, 3, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1838, 118, 22, 4, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1839, 118, 22, 5, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1840, 119, 13, 2, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1841, 119, 13, 3, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1842, 119, 13, 4, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1843, 119, 13, 5, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1844, 119, 58, 2, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1845, 119, 58, 3, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1846, 119, 58, 4, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1847, 119, 58, 5, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1848, 119, 11, 2, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1849, 119, 11, 3, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1850, 119, 11, 4, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1851, 119, 11, 5, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1852, 119, 22, 2, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1853, 119, 22, 3, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1854, 119, 22, 4, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1855, 119, 22, 5, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1856, 120, 13, 2, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1857, 120, 13, 3, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1858, 120, 13, 4, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1859, 120, 13, 5, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1860, 120, 58, 2, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1861, 120, 58, 3, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1862, 120, 58, 4, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1863, 120, 58, 5, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1864, 120, 11, 2, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1865, 120, 11, 3, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1866, 120, 11, 4, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1867, 120, 11, 5, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1868, 120, 22, 2, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1869, 120, 22, 3, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1870, 120, 22, 4, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1871, 120, 22, 5, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:45'),
(1872, 121, 58, 11, 0, 550.00, 550.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1873, 121, 58, 12, 0, 550.00, 550.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1874, 121, 58, 13, 0, 550.00, 550.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1875, 121, 58, 14, 0, 550.00, 550.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1876, 121, 58, 15, 0, 550.00, 550.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1877, 121, 58, 16, 0, 550.00, 550.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1878, 121, 58, 17, 0, 650.00, 650.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1879, 121, 58, 18, 0, 650.00, 650.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1880, 121, 58, 19, 0, 650.00, 650.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1881, 121, 58, 20, 0, 650.00, 650.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1882, 121, 13, 11, 0, 550.00, 550.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1883, 121, 13, 12, 0, 550.00, 550.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1884, 121, 13, 13, 0, 550.00, 550.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1885, 121, 13, 14, 0, 550.00, 550.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1886, 121, 13, 15, 0, 550.00, 550.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1887, 121, 13, 16, 0, 550.00, 550.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1888, 121, 13, 17, 0, 650.00, 650.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1889, 121, 13, 18, 0, 650.00, 650.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1890, 121, 13, 19, 0, 650.00, 650.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1891, 121, 13, 20, 0, 650.00, 650.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1892, 121, 11, 11, 0, 550.00, 550.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1893, 121, 11, 12, 0, 550.00, 550.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1894, 121, 11, 13, 0, 550.00, 550.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1895, 121, 11, 14, 0, 550.00, 550.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1896, 121, 11, 15, 0, 550.00, 550.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1897, 121, 11, 16, 0, 550.00, 550.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1898, 121, 11, 17, 0, 650.00, 650.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1899, 121, 11, 18, 0, 650.00, 650.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1900, 121, 11, 19, 0, 650.00, 650.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1901, 121, 11, 20, 0, 650.00, 650.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1902, 121, 62, 11, 0, 550.00, 550.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1903, 121, 62, 12, 0, 550.00, 550.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1904, 121, 62, 13, 0, 550.00, 550.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1905, 121, 62, 14, 0, 550.00, 550.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1906, 121, 62, 15, 0, 550.00, 550.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1907, 121, 62, 16, 0, 550.00, 550.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1908, 121, 62, 17, 0, 650.00, 650.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1909, 121, 62, 18, 0, 650.00, 650.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1910, 121, 62, 19, 0, 650.00, 650.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1911, 121, 62, 20, 0, 650.00, 650.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1912, 122, 58, 11, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1913, 122, 58, 12, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1914, 122, 58, 13, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1915, 122, 58, 14, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1916, 122, 58, 15, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1917, 122, 58, 16, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1918, 122, 58, 17, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1919, 122, 58, 18, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1920, 122, 58, 19, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1921, 122, 58, 20, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1922, 122, 13, 11, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1923, 122, 13, 12, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1924, 122, 13, 13, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1925, 122, 13, 14, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1926, 122, 13, 15, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1927, 122, 13, 16, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1928, 122, 13, 17, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1929, 122, 13, 18, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1930, 122, 13, 19, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1931, 122, 13, 20, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1932, 122, 11, 11, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1933, 122, 11, 12, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1934, 122, 11, 13, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1935, 122, 11, 14, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1936, 122, 11, 15, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1937, 122, 11, 16, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1938, 122, 11, 17, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1939, 122, 11, 18, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1940, 122, 11, 19, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1941, 122, 11, 20, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1942, 122, 62, 11, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1943, 122, 62, 12, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1944, 122, 62, 13, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1945, 122, 62, 14, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1946, 122, 62, 15, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1947, 122, 62, 16, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1948, 122, 62, 17, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1949, 122, 62, 18, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1950, 122, 62, 19, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1951, 122, 62, 20, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1952, 123, 58, 11, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1953, 123, 58, 12, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1954, 123, 58, 13, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1955, 123, 58, 14, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1956, 123, 58, 15, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1957, 123, 58, 16, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1958, 123, 58, 17, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1959, 123, 58, 18, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1960, 123, 58, 19, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1961, 123, 58, 20, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1962, 123, 13, 11, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1963, 123, 13, 12, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1964, 123, 13, 13, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1965, 123, 13, 14, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1966, 123, 13, 15, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1967, 123, 13, 16, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1968, 123, 13, 17, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1969, 123, 13, 18, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1970, 123, 13, 19, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1971, 123, 13, 20, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1972, 123, 11, 11, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1973, 123, 11, 12, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1974, 123, 11, 13, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1975, 123, 11, 14, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1976, 123, 11, 15, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1977, 123, 11, 16, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1978, 123, 11, 17, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1979, 123, 11, 18, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1980, 123, 11, 19, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1981, 123, 11, 20, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1982, 123, 62, 11, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1983, 123, 62, 12, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1984, 123, 62, 13, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1985, 123, 62, 14, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1986, 123, 62, 15, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1987, 123, 62, 16, 0, 750.00, 750.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1988, 123, 62, 17, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1989, 123, 62, 18, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1990, 123, 62, 19, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1991, 123, 62, 20, 0, 850.00, 850.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1992, 124, 58, 11, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1993, 124, 58, 12, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1994, 124, 58, 13, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1995, 124, 58, 14, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1996, 124, 58, 15, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1997, 124, 58, 16, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1998, 124, 58, 17, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(1999, 124, 58, 18, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2000, 124, 58, 19, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2001, 124, 58, 20, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2002, 124, 13, 11, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2003, 124, 13, 12, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2004, 124, 13, 13, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2005, 124, 13, 14, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2006, 124, 13, 15, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2007, 124, 13, 16, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2008, 124, 13, 17, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2009, 124, 13, 18, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2010, 124, 13, 19, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2011, 124, 13, 20, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2012, 124, 11, 11, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2013, 124, 11, 12, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2014, 124, 11, 13, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2015, 124, 11, 14, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2016, 124, 11, 15, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2017, 124, 11, 16, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2018, 124, 11, 17, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2019, 124, 11, 18, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2020, 124, 11, 19, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2021, 124, 11, 20, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2022, 124, 62, 11, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2023, 124, 62, 12, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2024, 124, 62, 13, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2025, 124, 62, 14, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2026, 124, 62, 15, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2027, 124, 62, 16, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2028, 124, 62, 17, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2029, 124, 62, 18, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2030, 124, 62, 19, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2031, 124, 62, 20, 0, 699.00, 699.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2032, 116, 11, 2, 1, 1290.00, 1290.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2033, 116, 11, 3, 1, 1290.00, 1290.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2034, 116, 11, 4, 1, 1290.00, 1290.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2035, 116, 11, 5, 1, 1290.00, 1290.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2036, 116, 11, 6, 1, 1290.00, 1290.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2042, 117, 11, 2, 1, 1590.00, 1590.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2043, 117, 11, 3, 1, 1590.00, 1590.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2044, 117, 11, 4, 1, 1590.00, 1590.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2045, 117, 11, 5, 1, 1590.00, 1590.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2046, 117, 11, 6, 1, 1590.00, 1590.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2047, 140, 64, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2048, 140, 64, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2049, 140, 64, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2050, 140, 64, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2051, 140, 64, 5, 0, 620.00, 620.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2052, 140, 64, 6, 0, 620.00, 620.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2053, 140, 64, 7, 0, 620.00, 620.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2054, 40, 12, 1, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2055, 40, 12, 2, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2056, 40, 12, 3, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2057, 40, 12, 4, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2058, 40, 12, 5, 0, 610.00, 610.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2059, 40, 12, 6, 0, 610.00, 610.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2060, 40, 12, 7, 0, 610.00, 610.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2061, 125, 64, 1, 0, 610.00, 610.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2062, 125, 64, 2, 0, 610.00, 610.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2063, 125, 64, 3, 0, 610.00, 610.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2064, 125, 64, 4, 0, 610.00, 610.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2065, 125, 64, 5, 0, 630.00, 630.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2066, 125, 64, 6, 0, 630.00, 630.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2067, 125, 64, 7, 0, 630.00, 630.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2068, 126, 12, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2069, 126, 12, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2070, 126, 12, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2071, 126, 12, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2072, 126, 12, 5, 0, 620.00, 620.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2073, 126, 12, 6, 0, 620.00, 620.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2074, 126, 12, 7, 0, 620.00, 620.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2075, 127, 11, 1, 0, 620.00, 620.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2076, 127, 11, 2, 0, 620.00, 620.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2077, 127, 11, 3, 0, 620.00, 620.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2078, 127, 11, 4, 0, 620.00, 620.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2079, 127, 11, 5, 0, 640.00, 640.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2080, 127, 11, 6, 0, 640.00, 640.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2081, 127, 11, 7, 0, 640.00, 640.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2082, 42, 64, 1, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2083, 42, 64, 2, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2084, 42, 64, 3, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2085, 42, 64, 4, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2086, 42, 64, 5, 0, 620.00, 620.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2087, 42, 64, 6, 0, 620.00, 620.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2088, 42, 64, 7, 0, 620.00, 620.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2089, 41, 12, 1, 0, 610.00, 610.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2090, 41, 12, 2, 0, 610.00, 610.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2091, 41, 12, 3, 0, 610.00, 610.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2092, 41, 12, 4, 0, 610.00, 610.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2093, 41, 12, 5, 0, 630.00, 630.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2094, 41, 12, 6, 0, 630.00, 630.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2095, 41, 12, 7, 0, 630.00, 630.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2096, 43, 12, 1, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2097, 43, 12, 2, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2098, 43, 12, 3, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2099, 43, 12, 4, 0, 590.00, 590.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2100, 43, 12, 5, 0, 610.00, 610.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2101, 43, 12, 6, 0, 610.00, 610.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2102, 43, 12, 7, 0, 610.00, 610.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2103, 129, 12, 1, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2104, 129, 12, 2, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2105, 129, 12, 3, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2106, 129, 12, 4, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2107, 129, 12, 5, 0, 520.00, 520.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2108, 129, 12, 6, 0, 520.00, 520.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2109, 129, 12, 7, 0, 520.00, 520.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2110, 131, 12, 1, 0, 420.00, 420.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2111, 131, 12, 2, 0, 420.00, 420.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2112, 131, 12, 3, 0, 420.00, 420.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2113, 131, 12, 4, 0, 420.00, 420.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2114, 131, 12, 5, 0, 440.00, 440.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2115, 131, 12, 6, 0, 440.00, 440.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2116, 131, 12, 7, 0, 440.00, 440.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2117, 133, 12, 1, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2118, 133, 12, 2, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2119, 133, 12, 3, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2120, 133, 12, 4, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2121, 133, 12, 5, 0, 520.00, 520.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2122, 133, 12, 6, 0, 520.00, 520.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2123, 133, 12, 7, 0, 520.00, 520.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2124, 128, 64, 1, 0, 510.00, 510.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2125, 128, 64, 2, 0, 510.00, 510.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2126, 128, 64, 3, 0, 510.00, 510.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2127, 128, 64, 4, 0, 510.00, 510.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2128, 128, 64, 5, 0, 530.00, 530.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2129, 128, 64, 6, 0, 530.00, 530.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2130, 128, 64, 7, 0, 530.00, 530.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2131, 130, 11, 1, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2132, 130, 11, 2, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2133, 130, 11, 3, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2134, 130, 11, 4, 0, 430.00, 430.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2135, 130, 11, 5, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2136, 130, 11, 6, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2137, 130, 11, 7, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2138, 132, 64, 1, 0, 510.00, 510.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2139, 132, 64, 2, 0, 510.00, 510.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2140, 132, 64, 3, 0, 510.00, 510.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2141, 132, 64, 4, 0, 510.00, 510.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2142, 132, 64, 5, 0, 530.00, 530.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:45'),
(2143, 132, 64, 6, 0, 530.00, 530.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2144, 132, 64, 7, 0, 530.00, 530.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2145, 134, 11, 9, 0, 350.00, 350.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2146, 134, 11, 10, 0, 350.00, 350.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2147, 134, 11, 11, 0, 350.00, 350.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2148, 134, 11, 12, 0, 350.00, 350.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2149, 134, 11, 13, 0, 350.00, 350.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2150, 134, 11, 14, 0, 350.00, 350.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2151, 134, 11, 15, 0, 350.00, 350.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2152, 134, 11, 16, 0, 350.00, 350.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2153, 134, 11, 17, 0, 360.00, 360.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2154, 134, 11, 18, 0, 360.00, 360.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46');
INSERT INTO `_product_color_sizes` (`id`, `product_id`, `color`, `size`, `assorted_flag`, `price`, `offer_price`, `stock`, `code`, `status`, `created_at`, `updated_at`) VALUES
(2155, 134, 11, 19, 0, 360.00, 360.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2156, 134, 11, 20, 0, 360.00, 360.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2157, 136, 11, 9, 0, 350.00, 350.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2158, 136, 11, 10, 0, 350.00, 350.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2159, 136, 11, 11, 0, 350.00, 350.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2160, 136, 11, 12, 0, 350.00, 350.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2161, 136, 11, 13, 0, 350.00, 350.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2162, 136, 11, 14, 0, 350.00, 350.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2163, 136, 11, 15, 0, 350.00, 350.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2164, 136, 11, 16, 0, 350.00, 350.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2165, 136, 11, 17, 0, 360.00, 360.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2166, 136, 11, 18, 0, 360.00, 360.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2167, 136, 11, 19, 0, 360.00, 360.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2168, 136, 11, 20, 0, 360.00, 360.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2169, 135, 12, 9, 0, 340.00, 340.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2170, 135, 12, 10, 0, 340.00, 340.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2171, 135, 12, 11, 0, 340.00, 340.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2172, 135, 12, 12, 0, 340.00, 340.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2173, 135, 12, 13, 0, 340.00, 340.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2174, 135, 12, 14, 0, 340.00, 340.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2175, 135, 12, 15, 0, 340.00, 340.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2176, 135, 12, 16, 0, 340.00, 340.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2177, 135, 12, 17, 0, 350.00, 350.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2178, 135, 12, 18, 0, 350.00, 350.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2179, 135, 12, 19, 0, 350.00, 350.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2180, 135, 12, 20, 0, 350.00, 350.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2181, 137, 12, 9, 0, 340.00, 340.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2182, 137, 12, 10, 0, 340.00, 340.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2183, 137, 12, 11, 0, 340.00, 340.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2184, 137, 12, 12, 0, 340.00, 340.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2185, 137, 12, 13, 0, 340.00, 340.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2186, 137, 12, 14, 0, 340.00, 340.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2187, 137, 12, 15, 0, 340.00, 340.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2188, 137, 12, 16, 0, 340.00, 340.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2189, 137, 12, 17, 0, 350.00, 350.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2190, 137, 12, 18, 0, 350.00, 350.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2191, 137, 12, 19, 0, 350.00, 350.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2192, 137, 12, 20, 0, 350.00, 350.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2194, 17, 12, 1, 0, 280.00, 280.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2195, 17, 12, 2, 0, 280.00, 280.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2196, 17, 12, 3, 0, 280.00, 280.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2197, 17, 12, 4, 0, 280.00, 280.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2198, 17, 12, 5, 0, 280.00, 280.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2199, 18, 12, 1, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2200, 18, 12, 2, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2201, 18, 12, 3, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2202, 18, 12, 4, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2203, 18, 12, 5, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2204, 69, 12, 1, 0, 175.00, 175.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2205, 69, 12, 2, 0, 175.00, 175.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2206, 69, 12, 3, 0, 175.00, 175.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2207, 69, 12, 4, 0, 175.00, 175.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2208, 69, 12, 5, 0, 185.00, 185.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2209, 4, 61, 23, 0, 85.00, 85.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2210, 138, 61, 23, 0, 85.00, 85.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2211, 7, 61, 23, 0, 90.00, 90.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2212, 6, 12, 23, 0, 90.00, 90.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2213, 8, 61, 23, 0, 95.00, 95.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2214, 9, 61, 23, 0, 95.00, 95.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2215, 11, 61, 23, 0, 90.00, 90.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2216, 44, 61, 23, 0, 129.00, 129.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2217, 45, 61, 23, 0, 129.00, 129.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2218, 46, 61, 23, 0, 129.00, 129.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2219, 47, 61, 23, 0, 139.00, 139.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2220, 48, 61, 23, 0, 109.00, 109.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2221, 49, 12, 23, 0, 109.00, 109.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2222, 50, 61, 23, 0, 109.00, 109.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2223, 51, 61, 23, 0, 159.00, 159.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2224, 52, 61, 23, 0, 159.00, 159.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2225, 53, 61, 23, 0, 159.00, 159.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2226, 19, 13, 1, 0, 225.00, 225.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2227, 19, 13, 2, 0, 225.00, 225.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2228, 19, 13, 3, 0, 225.00, 225.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2229, 19, 13, 4, 0, 225.00, 225.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2230, 19, 13, 5, 0, 225.00, 225.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2236, 70, 12, 1, 0, 195.00, 195.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2237, 70, 12, 2, 0, 195.00, 195.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2238, 70, 12, 3, 0, 195.00, 195.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2239, 70, 12, 4, 0, 195.00, 195.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2240, 70, 12, 5, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2241, 67, 12, 1, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2242, 67, 12, 2, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2243, 67, 12, 3, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2244, 67, 12, 4, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2245, 67, 12, 5, 0, 215.00, 215.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2246, 68, 13, 1, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2247, 68, 13, 2, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2248, 68, 13, 3, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2249, 68, 13, 4, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2250, 68, 13, 5, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2251, 66, 11, 1, 0, 325.00, 325.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2252, 66, 11, 2, 0, 325.00, 325.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2253, 66, 11, 3, 0, 325.00, 325.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2254, 66, 11, 4, 0, 325.00, 325.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2255, 66, 11, 5, 0, 325.00, 325.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2256, 72, 58, 2, 0, 170.00, 170.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2257, 72, 58, 3, 0, 170.00, 170.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2258, 72, 58, 4, 0, 170.00, 170.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2259, 72, 58, 5, 0, 180.00, 180.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2260, 72, 58, 6, 0, 180.00, 180.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2301, 81, 11, 2, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2302, 81, 11, 3, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2303, 81, 11, 4, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2304, 81, 11, 5, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2305, 81, 11, 6, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2316, 84, 61, 2, 0, 260.00, 260.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2317, 84, 61, 3, 0, 260.00, 260.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2318, 84, 61, 4, 0, 260.00, 260.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2319, 84, 61, 5, 0, 260.00, 260.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2320, 84, 61, 6, 0, 260.00, 260.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2321, 85, 61, 2, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2322, 85, 61, 3, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2323, 85, 61, 4, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2324, 85, 61, 5, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2325, 85, 61, 6, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2326, 86, 61, 2, 0, 280.00, 280.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2327, 86, 61, 3, 0, 280.00, 280.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2328, 86, 61, 4, 0, 280.00, 280.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2329, 86, 61, 5, 0, 280.00, 280.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2330, 86, 61, 6, 0, 280.00, 280.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2346, 90, 61, 2, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2347, 90, 61, 3, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2348, 90, 61, 4, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2349, 90, 61, 5, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2350, 90, 61, 6, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2351, 57, 58, 2, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2352, 57, 58, 3, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2353, 57, 58, 4, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2354, 57, 58, 5, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2355, 57, 58, 6, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2356, 91, 58, 2, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2357, 91, 58, 3, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2358, 91, 58, 4, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2359, 91, 58, 5, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2360, 91, 58, 6, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2361, 92, 58, 2, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2362, 92, 58, 3, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2363, 92, 58, 4, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2364, 92, 58, 5, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2365, 92, 58, 6, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2366, 93, 58, 2, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2367, 93, 58, 3, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2368, 93, 58, 4, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2369, 93, 58, 5, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2370, 93, 58, 6, 0, 899.00, 899.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2371, 13, 64, 1, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2372, 13, 64, 2, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2373, 13, 64, 3, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2374, 13, 64, 4, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2375, 13, 64, 5, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2376, 13, 64, 6, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2377, 13, 64, 7, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2378, 13, 64, 8, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2379, 13, 58, 1, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2380, 13, 58, 2, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2381, 13, 58, 3, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2382, 13, 58, 4, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2383, 13, 58, 5, 0, 399.00, 399.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2384, 13, 58, 6, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2385, 13, 58, 7, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2386, 13, 58, 8, 0, 425.00, 425.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2387, 12, 64, 1, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2388, 12, 64, 2, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2389, 12, 64, 3, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2390, 12, 64, 4, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2391, 12, 64, 5, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2392, 12, 64, 6, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2393, 12, 64, 7, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2394, 12, 64, 8, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2395, 12, 5, 1, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2396, 12, 5, 2, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2397, 12, 5, 3, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2398, 12, 5, 4, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2399, 12, 5, 5, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2400, 12, 5, 6, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2401, 12, 5, 7, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2402, 12, 5, 8, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2403, 12, 58, 1, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2404, 12, 58, 2, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2405, 12, 58, 3, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2406, 12, 58, 4, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2407, 12, 58, 5, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2408, 12, 58, 6, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2409, 12, 58, 7, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2410, 12, 58, 8, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2411, 12, 9, 1, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2412, 12, 9, 2, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2413, 12, 9, 3, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2414, 12, 9, 4, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2415, 12, 9, 5, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2416, 12, 9, 6, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2417, 12, 9, 7, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2418, 12, 9, 8, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2419, 12, 14, 1, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2420, 12, 14, 2, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2421, 12, 14, 3, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2422, 12, 14, 4, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2423, 12, 14, 5, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2424, 12, 14, 6, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2425, 12, 14, 7, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2426, 12, 14, 8, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2427, 12, 15, 1, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2428, 12, 15, 2, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2429, 12, 15, 3, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2430, 12, 15, 4, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2431, 12, 15, 5, 0, 410.00, 410.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2432, 12, 15, 6, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2433, 12, 15, 7, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2434, 12, 15, 8, 0, 450.00, 450.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2435, 14, 64, 1, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2436, 14, 64, 2, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2437, 14, 64, 3, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2438, 14, 64, 4, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2439, 14, 64, 5, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2440, 14, 64, 6, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2441, 14, 64, 7, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2442, 14, 64, 8, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2443, 14, 14, 1, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2444, 14, 14, 2, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2445, 14, 14, 3, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2446, 14, 14, 4, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2447, 14, 14, 5, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2448, 14, 14, 6, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2449, 14, 14, 7, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2450, 14, 14, 8, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2451, 14, 5, 1, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2452, 14, 5, 2, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2453, 14, 5, 3, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2454, 14, 5, 4, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2455, 14, 5, 5, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2456, 14, 5, 6, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2457, 14, 5, 7, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2458, 14, 5, 8, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2459, 14, 19, 1, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2460, 14, 19, 2, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2461, 14, 19, 3, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2462, 14, 19, 4, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2463, 14, 19, 5, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2464, 14, 19, 6, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2465, 14, 19, 7, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2466, 14, 19, 8, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2467, 14, 58, 1, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2468, 14, 58, 2, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2469, 14, 58, 3, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2470, 14, 58, 4, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2471, 14, 58, 5, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2472, 14, 58, 6, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2473, 14, 58, 7, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2474, 14, 58, 8, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2475, 14, 16, 1, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2476, 14, 16, 2, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2477, 14, 16, 3, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2478, 14, 16, 4, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2479, 14, 16, 5, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2480, 14, 16, 6, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2481, 14, 16, 7, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2482, 14, 16, 8, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2483, 14, 17, 1, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2484, 14, 17, 2, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2485, 14, 17, 3, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2486, 14, 17, 4, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2487, 14, 17, 5, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2488, 14, 17, 6, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2489, 14, 17, 7, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2490, 14, 17, 8, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2491, 14, 9, 1, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2492, 14, 9, 2, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2493, 14, 9, 3, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2494, 14, 9, 4, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2495, 14, 9, 5, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2496, 14, 9, 6, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2497, 14, 9, 7, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2498, 14, 9, 8, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2499, 14, 18, 1, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2500, 14, 18, 2, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2501, 14, 18, 3, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2502, 14, 18, 4, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2503, 14, 18, 5, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2504, 14, 18, 6, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2505, 14, 18, 7, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2506, 14, 18, 8, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2507, 14, 15, 1, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2508, 14, 15, 2, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2509, 14, 15, 3, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2510, 14, 15, 4, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2511, 14, 15, 5, 0, 499.00, 499.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2512, 14, 15, 6, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2513, 14, 15, 7, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2514, 14, 15, 8, 0, 525.00, 525.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2515, 15, 64, 1, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2516, 15, 64, 2, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2517, 15, 64, 3, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2518, 15, 64, 4, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2519, 15, 64, 5, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2520, 15, 64, 6, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2521, 15, 64, 7, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2522, 15, 64, 8, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2523, 15, 58, 1, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2524, 15, 58, 2, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2525, 15, 58, 3, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2526, 15, 58, 4, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2527, 15, 58, 5, 0, 575.00, 575.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2528, 15, 58, 6, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2529, 15, 58, 7, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2530, 15, 58, 8, 0, 599.00, 599.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2531, 32, 64, 2, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2532, 32, 64, 3, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2533, 32, 64, 4, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2534, 32, 64, 5, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2535, 32, 64, 6, 0, 799.00, 799.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2536, 34, 64, 2, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2537, 34, 64, 3, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2538, 34, 64, 4, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2539, 34, 64, 5, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2540, 34, 64, 6, 0, 999.00, 999.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2541, 36, 64, 2, 0, 1099.00, 1099.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2542, 36, 64, 3, 0, 1099.00, 1099.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2543, 36, 64, 4, 0, 1099.00, 1099.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2544, 36, 64, 5, 0, 1099.00, 1099.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2545, 36, 64, 6, 0, 1099.00, 1099.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2546, 37, 64, 2, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2547, 37, 64, 3, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2548, 37, 64, 4, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2549, 37, 64, 5, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2550, 37, 64, 6, 0, 950.00, 950.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2551, 117, 13, 2, 1, 1590.00, 1590.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2552, 117, 13, 3, 1, 1590.00, 1590.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2553, 117, 13, 4, 1, 1590.00, 1590.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2554, 117, 13, 5, 1, 1590.00, 1590.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2555, 117, 13, 6, 1, 1590.00, 1590.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2556, 108, 44, 1, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2557, 108, 44, 2, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2558, 108, 44, 3, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2559, 108, 44, 4, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2560, 108, 44, 5, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2561, 108, 45, 1, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2562, 108, 45, 2, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2563, 108, 45, 3, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2564, 108, 45, 4, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2565, 108, 45, 5, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2566, 108, 13, 1, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2567, 108, 13, 2, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2568, 108, 13, 3, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2569, 108, 13, 4, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2570, 108, 13, 5, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2571, 108, 32, 1, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2572, 108, 32, 2, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2573, 108, 32, 3, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2574, 108, 32, 4, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2575, 108, 32, 5, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2576, 30, 11, 1, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2577, 30, 11, 2, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2578, 30, 11, 3, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2579, 30, 11, 4, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2580, 30, 11, 5, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2581, 30, 44, 1, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2582, 30, 44, 2, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2583, 30, 44, 3, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2584, 30, 44, 4, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2585, 30, 44, 5, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2586, 30, 45, 1, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2587, 30, 45, 2, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2588, 30, 45, 3, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2589, 30, 45, 4, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2590, 30, 45, 5, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2591, 30, 13, 1, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2592, 30, 13, 2, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2593, 30, 13, 3, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2594, 30, 13, 4, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2595, 30, 13, 5, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2596, 30, 32, 1, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2597, 30, 32, 2, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2598, 30, 32, 3, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2599, 30, 32, 4, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2600, 30, 32, 5, 1, 325.00, 325.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2601, 29, 11, 1, 1, 275.00, 275.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2602, 29, 11, 2, 1, 275.00, 275.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2603, 29, 11, 3, 1, 275.00, 275.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2604, 29, 11, 4, 1, 275.00, 275.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2605, 29, 11, 5, 1, 275.00, 275.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2606, 29, 44, 1, 1, 275.00, 275.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2607, 29, 44, 2, 1, 275.00, 275.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2608, 29, 44, 3, 1, 275.00, 275.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2609, 29, 44, 4, 1, 275.00, 275.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2610, 29, 44, 5, 1, 275.00, 275.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2611, 29, 45, 1, 1, 275.00, 275.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2612, 29, 45, 2, 1, 275.00, 275.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2613, 29, 45, 3, 1, 275.00, 275.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2614, 29, 45, 4, 1, 275.00, 275.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2615, 29, 45, 5, 1, 275.00, 275.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2616, 29, 13, 1, 1, 275.00, 275.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2617, 29, 13, 2, 1, 275.00, 275.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2618, 29, 13, 3, 1, 275.00, 275.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2619, 29, 13, 4, 1, 275.00, 275.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2620, 29, 13, 5, 1, 275.00, 275.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2621, 29, 32, 1, 1, 275.00, 275.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2622, 29, 32, 2, 1, 275.00, 275.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2623, 29, 32, 3, 1, 275.00, 275.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2624, 29, 32, 4, 1, 275.00, 275.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2625, 29, 32, 5, 1, 275.00, 275.00, 1, NULL, 1, '2022-03-04 00:07:17', '2022-05-30 13:49:46'),
(2626, 28, 44, 1, 0, 275.00, 275.00, 1, NULL, 1, '2022-05-03 10:51:17', '2022-05-30 13:49:46'),
(2627, 28, 44, 2, 0, 275.00, 275.00, 1, NULL, 1, '2022-05-03 10:51:57', '2022-05-30 13:49:46'),
(2628, 28, 44, 3, 0, 275.00, 275.00, 1, NULL, 1, '2022-05-03 10:51:57', '2022-05-30 13:49:46'),
(2629, 28, 44, 4, 0, 275.00, 275.00, 1, NULL, 1, '2022-05-03 10:51:57', '2022-05-30 13:49:46'),
(2630, 28, 44, 5, 0, 275.00, 275.00, 1, NULL, 1, '2022-05-03 10:51:57', '2022-05-30 13:49:46'),
(2631, 28, 13, 1, 0, 275.00, 275.00, 1, NULL, 1, '2022-05-03 10:55:08', '2022-05-30 13:49:46'),
(2632, 28, 13, 2, 0, 275.00, 275.00, 1, NULL, 1, '2022-05-03 10:55:08', '2022-05-30 13:49:46'),
(2633, 28, 13, 3, 0, 275.00, 275.00, 1, NULL, 1, '2022-05-03 10:55:08', '2022-05-30 13:49:46'),
(2634, 28, 13, 4, 0, 275.00, 275.00, 1, NULL, 1, '2022-05-03 10:55:08', '2022-05-30 13:49:46'),
(2635, 28, 13, 5, 0, 275.00, 275.00, 1, NULL, 1, '2022-05-03 10:55:08', '2022-05-30 13:49:46'),
(2636, 28, 45, 1, 0, 275.00, 275.00, 1, NULL, 1, '2022-05-03 10:55:08', '2022-05-30 13:49:46'),
(2637, 28, 45, 2, 0, 275.00, 275.00, 1, NULL, 1, '2022-05-03 10:55:08', '2022-05-30 13:49:46'),
(2638, 28, 45, 3, 0, 275.00, 275.00, 1, NULL, 1, '2022-05-03 10:55:08', '2022-05-30 13:49:46'),
(2639, 28, 45, 4, 0, 275.00, 275.00, 1, NULL, 1, '2022-05-03 10:55:08', '2022-05-30 13:49:46'),
(2640, 28, 45, 5, 0, 275.00, 275.00, 1, NULL, 1, '2022-05-03 10:55:08', '2022-05-30 13:49:46'),
(2641, 28, 32, 1, 0, 275.00, 275.00, 1, NULL, 1, '2022-05-03 10:55:08', '2022-05-30 13:49:46'),
(2642, 28, 32, 2, 0, 275.00, 275.00, 1, NULL, 1, '2022-05-03 10:55:08', '2022-05-30 13:49:46'),
(2643, 28, 32, 3, 0, 275.00, 275.00, 1, NULL, 1, '2022-05-03 10:55:08', '2022-05-30 13:49:46'),
(2644, 28, 32, 4, 0, 275.00, 275.00, 1, NULL, 1, '2022-05-03 10:55:08', '2022-05-30 13:49:46'),
(2645, 28, 32, 5, 0, 275.00, 275.00, 1, NULL, 1, '2022-05-03 10:55:08', '2022-05-30 13:49:46'),
(2647, 19, 64, 1, 0, 225.00, 225.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2648, 19, 64, 2, 0, 225.00, 225.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2649, 19, 64, 3, 0, 225.00, 225.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2650, 19, 64, 4, 0, 225.00, 225.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2651, 19, 64, 5, 0, 225.00, 225.00, 0, NULL, 1, '2022-05-04 02:14:32', '2022-05-30 13:49:46'),
(2652, 19, 11, 1, 0, 225.00, 225.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2653, 19, 11, 2, 0, 225.00, 225.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2654, 19, 11, 3, 0, 225.00, 225.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2655, 19, 11, 4, 0, 225.00, 225.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2656, 19, 11, 5, 0, 225.00, 225.00, 0, NULL, 1, '2022-05-04 02:14:32', '2022-05-30 13:49:46'),
(2662, 19, 58, 1, 0, 225.00, 225.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2663, 19, 58, 2, 0, 225.00, 225.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2664, 19, 58, 3, 0, 225.00, 225.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2665, 19, 58, 4, 0, 225.00, 225.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2666, 19, 58, 5, 0, 225.00, 225.00, 0, NULL, 1, '2022-05-04 02:14:32', '2022-05-30 13:49:46'),
(2737, 71, 11, 2, 1, 225.00, 225.00, 1, NULL, 1, '2022-03-03 08:07:17', '2022-05-30 13:49:46'),
(2738, 71, 11, 3, 1, 225.00, 225.00, 1, NULL, 1, '2022-03-03 08:07:17', '2022-05-30 13:49:46'),
(2739, 71, 11, 4, 1, 225.00, 225.00, 1, NULL, 1, '2022-03-03 08:07:17', '2022-05-30 13:49:46'),
(2740, 71, 11, 5, 1, 225.00, 225.00, 0, NULL, 1, '2022-05-03 16:44:32', '2022-05-30 13:49:46'),
(2741, 71, 58, 1, 1, 225.00, 225.00, 1, NULL, 1, '2022-03-03 08:07:17', '2022-05-30 13:49:46'),
(2742, 71, 58, 2, 1, 225.00, 225.00, 1, NULL, 1, '2022-03-03 08:07:17', '2022-05-30 13:49:46'),
(2743, 71, 58, 3, 1, 225.00, 225.00, 1, NULL, 1, '2022-03-03 08:07:17', '2022-05-30 13:49:46'),
(2744, 71, 58, 4, 1, 225.00, 225.00, 1, NULL, 1, '2022-03-03 08:07:17', '2022-05-30 13:49:46'),
(2745, 71, 11, 1, 1, 225.00, 225.00, 1, NULL, 1, '2022-03-03 08:07:17', '2022-05-30 13:49:46'),
(2746, 71, 58, 5, 1, 225.00, 225.00, 0, NULL, 1, '2022-05-03 16:44:32', '2022-05-30 13:49:46'),
(2747, 71, 64, 1, 1, 225.00, 225.00, 1, NULL, 1, '2022-03-03 08:07:17', '2022-05-30 13:49:46'),
(2748, 71, 64, 2, 1, 225.00, 225.00, 1, NULL, 1, '2022-03-03 08:07:17', '2022-05-30 13:49:46'),
(2749, 71, 64, 3, 1, 225.00, 225.00, 1, NULL, 1, '2022-03-03 08:07:17', '2022-05-30 13:49:46'),
(2750, 71, 64, 4, 1, 225.00, 225.00, 1, NULL, 1, '2022-03-03 08:07:17', '2022-05-30 13:49:46'),
(2751, 71, 64, 5, 1, 225.00, 225.00, 0, NULL, 1, '2022-05-03 16:44:32', '2022-05-30 13:49:46'),
(2752, 71, 13, 1, 1, 225.00, 225.00, 1, NULL, 1, '2022-03-03 08:07:17', '2022-05-30 13:49:46'),
(2753, 71, 13, 2, 1, 225.00, 225.00, 1, NULL, 1, '2022-03-03 08:07:17', '2022-05-30 13:49:46'),
(2754, 71, 13, 3, 1, 225.00, 225.00, 1, NULL, 1, '2022-03-03 08:07:17', '2022-05-30 13:49:46'),
(2755, 71, 13, 4, 1, 225.00, 225.00, 1, NULL, 1, '2022-03-03 08:07:17', '2022-05-30 13:49:46'),
(2756, 71, 13, 5, 1, 225.00, 225.00, 0, NULL, 1, '2022-05-03 16:44:32', '2022-05-30 13:49:46'),
(2757, 71, 17, 1, 1, 225.00, 225.00, 1, NULL, 1, '2022-03-03 08:07:17', '2022-05-30 13:49:46'),
(2758, 71, 17, 2, 1, 225.00, 225.00, 1, NULL, 1, '2022-03-03 08:07:17', '2022-05-30 13:49:46'),
(2759, 71, 17, 3, 1, 225.00, 225.00, 1, NULL, 1, '2022-03-03 08:07:17', '2022-05-30 13:49:46'),
(2760, 71, 17, 4, 1, 225.00, 225.00, 1, NULL, 1, '2022-03-03 08:07:17', '2022-05-30 13:49:46'),
(2761, 71, 17, 5, 1, 225.00, 225.00, 0, NULL, 1, '2022-05-03 16:44:32', '2022-05-30 13:49:46'),
(2762, 71, 1, 1, 1, 225.00, 225.00, 1, NULL, 1, '2022-03-03 08:07:17', '2022-05-30 13:49:46'),
(2763, 71, 1, 2, 1, 225.00, 225.00, 1, NULL, 1, '2022-03-03 08:07:17', '2022-05-30 13:49:46'),
(2764, 71, 1, 3, 1, 225.00, 225.00, 1, NULL, 1, '2022-03-03 08:07:17', '2022-05-30 13:49:46'),
(2765, 71, 1, 4, 1, 225.00, 225.00, 1, NULL, 1, '2022-03-03 08:07:17', '2022-05-30 13:49:46'),
(2766, 71, 1, 5, 1, 225.00, 225.00, 0, NULL, 1, '2022-05-03 16:44:32', '2022-05-30 13:49:46'),
(2767, 71, 31, 1, 1, 225.00, 225.00, 1, NULL, 1, '2022-03-03 08:07:17', '2022-05-30 13:49:46'),
(2768, 71, 31, 2, 1, 225.00, 225.00, 1, NULL, 1, '2022-03-03 08:07:17', '2022-05-30 13:49:46'),
(2769, 71, 31, 3, 1, 225.00, 225.00, 1, NULL, 1, '2022-03-03 08:07:17', '2022-05-30 13:49:46'),
(2770, 71, 31, 4, 1, 225.00, 225.00, 1, NULL, 1, '2022-03-03 08:07:17', '2022-05-30 13:49:46'),
(2771, 71, 31, 5, 1, 225.00, 225.00, 0, NULL, 1, '2022-05-03 16:44:32', '2022-05-30 13:49:46'),
(2797, 72, 14, 2, 0, 170.00, 170.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2798, 72, 14, 3, 0, 170.00, 170.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2799, 72, 14, 4, 0, 170.00, 170.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2800, 72, 14, 5, 0, 180.00, 180.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2801, 72, 14, 6, 0, 180.00, 180.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2802, 72, 13, 2, 0, 170.00, 170.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2803, 72, 13, 3, 0, 170.00, 170.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2804, 72, 13, 4, 0, 170.00, 170.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2805, 72, 13, 5, 0, 180.00, 180.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2806, 72, 13, 6, 0, 180.00, 180.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2807, 72, 11, 2, 0, 170.00, 170.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2808, 72, 11, 3, 0, 170.00, 170.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2809, 72, 11, 4, 0, 170.00, 170.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2810, 72, 11, 5, 0, 180.00, 180.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2811, 72, 11, 6, 0, 180.00, 180.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2812, 72, 57, 2, 0, 170.00, 170.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2813, 72, 57, 3, 0, 170.00, 170.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2814, 72, 57, 4, 0, 170.00, 170.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2815, 72, 57, 5, 0, 180.00, 180.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2816, 72, 57, 6, 0, 180.00, 180.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2817, 72, 17, 2, 0, 170.00, 170.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2818, 72, 17, 3, 0, 170.00, 170.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2819, 72, 17, 4, 0, 170.00, 170.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2820, 72, 17, 5, 0, 180.00, 180.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2821, 72, 17, 6, 0, 180.00, 180.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2822, 72, 24, 2, 0, 170.00, 170.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2823, 72, 24, 3, 0, 170.00, 170.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2824, 72, 24, 4, 0, 170.00, 170.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2825, 72, 24, 5, 0, 180.00, 180.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2826, 72, 24, 6, 0, 180.00, 180.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2827, 72, 18, 2, 0, 170.00, 170.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2828, 72, 18, 3, 0, 170.00, 170.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2829, 72, 18, 4, 0, 170.00, 170.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2830, 72, 18, 5, 0, 180.00, 180.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2831, 72, 18, 6, 0, 180.00, 180.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2832, 72, 4, 2, 0, 170.00, 170.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2833, 72, 4, 3, 0, 170.00, 170.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2834, 72, 4, 4, 0, 170.00, 170.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2835, 72, 4, 5, 0, 180.00, 180.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2836, 72, 4, 6, 0, 180.00, 180.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(2837, 73, 58, 2, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2838, 73, 58, 3, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2839, 73, 58, 4, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2840, 73, 58, 5, 0, 340.00, 340.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2841, 73, 58, 6, 0, 340.00, 340.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2842, 73, 14, 2, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2843, 73, 14, 3, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2844, 73, 14, 4, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2845, 73, 14, 5, 0, 340.00, 340.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2846, 73, 14, 6, 0, 340.00, 340.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2847, 73, 13, 2, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2848, 73, 13, 3, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2849, 73, 13, 4, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2850, 73, 13, 5, 0, 340.00, 340.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2851, 73, 13, 6, 0, 340.00, 340.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2852, 73, 11, 2, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2853, 73, 11, 3, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2854, 73, 11, 4, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2855, 73, 11, 5, 0, 340.00, 340.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46');
INSERT INTO `_product_color_sizes` (`id`, `product_id`, `color`, `size`, `assorted_flag`, `price`, `offer_price`, `stock`, `code`, `status`, `created_at`, `updated_at`) VALUES
(2856, 73, 11, 6, 0, 340.00, 340.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2857, 73, 57, 2, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2858, 73, 57, 3, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2859, 73, 57, 4, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2860, 73, 57, 5, 0, 340.00, 340.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2861, 73, 57, 6, 0, 340.00, 340.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2862, 73, 17, 2, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2863, 73, 17, 3, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2864, 73, 17, 4, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2865, 73, 17, 5, 0, 340.00, 340.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2866, 73, 17, 6, 0, 340.00, 340.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2867, 73, 24, 2, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2868, 73, 24, 3, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2869, 73, 24, 4, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2870, 73, 24, 5, 0, 340.00, 340.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2871, 73, 24, 6, 0, 340.00, 340.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2872, 73, 18, 2, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2873, 73, 18, 3, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2874, 73, 18, 4, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2875, 73, 18, 5, 0, 340.00, 340.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2876, 73, 18, 6, 0, 340.00, 340.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2877, 73, 4, 2, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2878, 73, 4, 3, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2879, 73, 4, 4, 0, 320.00, 320.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2880, 73, 4, 5, 0, 340.00, 340.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2881, 73, 4, 6, 0, 340.00, 340.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2882, 74, 58, 2, 0, 195.00, 195.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2883, 74, 58, 3, 0, 195.00, 195.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2884, 74, 58, 4, 0, 195.00, 195.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2885, 74, 58, 5, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2886, 74, 58, 6, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2887, 74, 14, 2, 0, 195.00, 195.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2888, 74, 14, 3, 0, 195.00, 195.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2889, 74, 14, 4, 0, 195.00, 195.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2890, 74, 14, 5, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2891, 74, 14, 6, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2892, 74, 13, 2, 0, 195.00, 195.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2893, 74, 13, 3, 0, 195.00, 195.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2894, 74, 13, 4, 0, 195.00, 195.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2895, 74, 13, 5, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2896, 74, 13, 6, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2897, 74, 11, 2, 0, 195.00, 195.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2898, 74, 11, 3, 0, 195.00, 195.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2899, 74, 11, 4, 0, 195.00, 195.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2900, 74, 11, 5, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2901, 74, 11, 6, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2902, 74, 57, 2, 0, 195.00, 195.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2903, 74, 57, 3, 0, 195.00, 195.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2904, 74, 57, 4, 0, 195.00, 195.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2905, 74, 57, 5, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2906, 74, 57, 6, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2907, 74, 17, 2, 0, 195.00, 195.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2908, 74, 17, 3, 0, 195.00, 195.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2909, 74, 17, 4, 0, 195.00, 195.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2910, 74, 17, 5, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2911, 74, 17, 6, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2912, 74, 24, 2, 0, 195.00, 195.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2913, 74, 24, 3, 0, 195.00, 195.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2914, 74, 24, 4, 0, 195.00, 195.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2915, 74, 24, 5, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2916, 74, 24, 6, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2917, 74, 18, 2, 0, 195.00, 195.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2918, 74, 18, 3, 0, 195.00, 195.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2919, 74, 18, 4, 0, 195.00, 195.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2920, 74, 18, 5, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2921, 74, 18, 6, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2922, 74, 4, 2, 0, 195.00, 195.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2923, 74, 4, 3, 0, 195.00, 195.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2924, 74, 4, 4, 0, 195.00, 195.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2925, 74, 4, 5, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2926, 74, 4, 6, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2927, 75, 58, 2, 0, 365.00, 365.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2928, 75, 58, 3, 0, 365.00, 365.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2929, 75, 58, 4, 0, 365.00, 365.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2930, 75, 58, 5, 0, 385.00, 385.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2931, 75, 58, 6, 0, 385.00, 385.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2932, 75, 14, 2, 0, 365.00, 365.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2933, 75, 14, 3, 0, 365.00, 365.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2934, 75, 14, 4, 0, 365.00, 365.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2935, 75, 14, 5, 0, 385.00, 385.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2936, 75, 14, 6, 0, 385.00, 385.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2937, 75, 13, 2, 0, 365.00, 365.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2938, 75, 13, 3, 0, 365.00, 365.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2939, 75, 13, 4, 0, 365.00, 365.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2940, 75, 13, 5, 0, 385.00, 385.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2941, 75, 13, 6, 0, 385.00, 385.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2942, 75, 11, 2, 0, 365.00, 365.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2943, 75, 11, 3, 0, 365.00, 365.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2944, 75, 11, 4, 0, 365.00, 365.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2945, 75, 11, 5, 0, 385.00, 385.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2946, 75, 11, 6, 0, 385.00, 385.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2947, 75, 57, 2, 0, 365.00, 365.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2948, 75, 57, 3, 0, 365.00, 365.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2949, 75, 57, 4, 0, 365.00, 365.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2950, 75, 57, 5, 0, 385.00, 385.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2951, 75, 57, 6, 0, 385.00, 385.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2952, 75, 17, 2, 0, 365.00, 365.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2953, 75, 17, 3, 0, 365.00, 365.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2954, 75, 17, 4, 0, 365.00, 365.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2955, 75, 17, 5, 0, 385.00, 385.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2956, 75, 17, 6, 0, 385.00, 385.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2957, 75, 24, 2, 0, 365.00, 365.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2958, 75, 24, 3, 0, 365.00, 365.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2959, 75, 24, 4, 0, 365.00, 365.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2960, 75, 24, 5, 0, 385.00, 385.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2961, 75, 24, 6, 0, 385.00, 385.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2962, 75, 18, 2, 0, 365.00, 365.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2963, 75, 18, 3, 0, 365.00, 365.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2964, 75, 18, 4, 0, 365.00, 365.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2965, 75, 18, 5, 0, 385.00, 385.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2966, 75, 18, 6, 0, 385.00, 385.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2967, 75, 4, 2, 0, 365.00, 365.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2968, 75, 4, 3, 0, 365.00, 365.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2969, 75, 4, 4, 0, 365.00, 365.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2970, 75, 4, 5, 0, 385.00, 385.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2971, 75, 4, 6, 0, 385.00, 385.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2972, 76, 58, 2, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2973, 76, 58, 3, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2974, 76, 58, 4, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2975, 76, 58, 5, 0, 215.00, 215.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2976, 76, 58, 6, 0, 215.00, 215.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2977, 76, 14, 2, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2978, 76, 14, 3, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2979, 76, 14, 4, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2980, 76, 14, 5, 0, 215.00, 215.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2981, 76, 14, 6, 0, 215.00, 215.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2982, 76, 13, 2, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2983, 76, 13, 3, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2984, 76, 13, 4, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2985, 76, 13, 5, 0, 215.00, 215.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2986, 76, 13, 6, 0, 215.00, 215.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2987, 76, 11, 2, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2988, 76, 11, 3, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2989, 76, 11, 4, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2990, 76, 11, 5, 0, 215.00, 215.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2991, 76, 11, 6, 0, 215.00, 215.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2992, 76, 57, 2, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2993, 76, 57, 3, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2994, 76, 57, 4, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2995, 76, 57, 5, 0, 215.00, 215.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2996, 76, 57, 6, 0, 215.00, 215.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2997, 76, 17, 2, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2998, 76, 17, 3, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(2999, 76, 17, 4, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3000, 76, 17, 5, 0, 215.00, 215.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3001, 76, 17, 6, 0, 215.00, 215.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3002, 76, 24, 2, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3003, 76, 24, 3, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3004, 76, 24, 4, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3005, 76, 24, 5, 0, 215.00, 215.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3006, 76, 24, 6, 0, 215.00, 215.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3007, 76, 18, 2, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3008, 76, 18, 3, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3009, 76, 18, 4, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3010, 76, 18, 5, 0, 215.00, 215.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3011, 76, 18, 6, 0, 215.00, 215.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3012, 76, 4, 2, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3013, 76, 4, 3, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3014, 76, 4, 4, 0, 205.00, 205.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3015, 76, 4, 5, 0, 215.00, 215.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3016, 76, 4, 6, 0, 215.00, 215.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3017, 78, 58, 2, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3018, 78, 58, 3, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3019, 78, 58, 4, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3020, 78, 58, 5, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3021, 78, 58, 6, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3022, 78, 14, 2, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3023, 78, 14, 3, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3024, 78, 14, 4, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3025, 78, 14, 5, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3026, 78, 14, 6, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3027, 78, 13, 2, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3028, 78, 13, 3, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3029, 78, 13, 4, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3030, 78, 13, 5, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3031, 78, 13, 6, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3032, 78, 11, 2, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3033, 78, 11, 3, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3034, 78, 11, 4, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3035, 78, 11, 5, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3036, 78, 11, 6, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3037, 78, 57, 2, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3038, 78, 57, 3, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3039, 78, 57, 4, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3040, 78, 57, 5, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3041, 78, 57, 6, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3042, 78, 17, 2, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3043, 78, 17, 3, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3044, 78, 17, 4, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3045, 78, 17, 5, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3046, 78, 17, 6, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3047, 78, 24, 2, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3048, 78, 24, 3, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3049, 78, 24, 4, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3050, 78, 24, 5, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3051, 78, 24, 6, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3052, 78, 18, 2, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3053, 78, 18, 3, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3054, 78, 18, 4, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3055, 78, 18, 5, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3056, 78, 18, 6, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3057, 78, 4, 2, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3058, 78, 4, 3, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3059, 78, 4, 4, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3060, 78, 4, 5, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3061, 78, 4, 6, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3062, 77, 17, 2, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3063, 77, 17, 3, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3064, 77, 17, 4, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3065, 77, 17, 5, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3066, 77, 17, 6, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3067, 77, 54, 2, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3068, 77, 54, 3, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3069, 77, 54, 4, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3070, 77, 54, 5, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3071, 77, 54, 6, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3072, 77, 13, 2, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3073, 77, 13, 3, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3074, 77, 13, 4, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3075, 77, 13, 5, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3076, 77, 13, 6, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3077, 77, 42, 2, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3078, 77, 42, 3, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3079, 77, 42, 4, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3080, 77, 42, 5, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3081, 77, 42, 6, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3082, 77, 57, 2, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3083, 77, 57, 3, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3084, 77, 57, 4, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3085, 77, 57, 5, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3086, 77, 57, 6, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3087, 79, 58, 2, 0, 175.00, 175.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3088, 79, 58, 3, 0, 175.00, 175.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3089, 79, 58, 4, 0, 175.00, 175.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3090, 79, 58, 5, 0, 185.00, 185.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3091, 79, 58, 6, 0, 185.00, 185.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3092, 79, 24, 2, 0, 175.00, 175.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3093, 79, 24, 3, 0, 175.00, 175.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3094, 79, 24, 4, 0, 175.00, 175.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3095, 79, 24, 5, 0, 185.00, 185.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3096, 79, 24, 6, 0, 185.00, 185.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3097, 79, 13, 2, 0, 175.00, 175.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3098, 79, 13, 3, 0, 175.00, 175.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3099, 79, 13, 4, 0, 175.00, 175.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3100, 79, 13, 5, 0, 185.00, 185.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3101, 79, 13, 6, 0, 185.00, 185.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3102, 79, 11, 2, 0, 175.00, 175.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3103, 79, 11, 3, 0, 175.00, 175.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3104, 79, 11, 4, 0, 175.00, 175.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3105, 79, 11, 5, 0, 185.00, 185.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3106, 79, 11, 6, 0, 185.00, 185.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3107, 79, 4, 2, 0, 175.00, 175.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3108, 79, 4, 3, 0, 175.00, 175.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3109, 79, 4, 4, 0, 175.00, 175.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3110, 79, 4, 5, 0, 185.00, 185.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3111, 79, 4, 6, 0, 185.00, 185.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3112, 79, 16, 2, 0, 175.00, 175.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3113, 79, 16, 3, 0, 175.00, 175.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3114, 79, 16, 4, 0, 175.00, 175.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3115, 79, 16, 5, 0, 185.00, 185.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3116, 79, 16, 6, 0, 185.00, 185.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3117, 80, 58, 2, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3118, 80, 58, 3, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3119, 80, 58, 4, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3120, 80, 58, 5, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3121, 80, 58, 6, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3122, 80, 24, 2, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3123, 80, 24, 3, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3124, 80, 24, 4, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3125, 80, 24, 5, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3126, 80, 24, 6, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3127, 80, 13, 2, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3128, 80, 13, 3, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3129, 80, 13, 4, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3130, 80, 13, 5, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3131, 80, 13, 6, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3132, 80, 11, 2, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3133, 80, 11, 3, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3134, 80, 11, 4, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3135, 80, 11, 5, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3136, 80, 11, 6, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3137, 80, 4, 2, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3138, 80, 4, 3, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3139, 80, 4, 4, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3140, 80, 4, 5, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3141, 80, 4, 6, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3142, 80, 16, 2, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3143, 80, 16, 3, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3144, 80, 16, 4, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3145, 80, 16, 5, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3146, 80, 16, 6, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 07:37:17', '2022-05-30 13:49:46'),
(3147, 68, 11, 1, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3148, 68, 11, 2, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3149, 68, 11, 3, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3150, 68, 11, 4, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3151, 68, 11, 5, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3152, 68, 64, 1, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3153, 68, 64, 2, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3154, 68, 64, 3, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3155, 68, 64, 4, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3156, 68, 64, 5, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3157, 68, 58, 1, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3158, 68, 58, 2, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3159, 68, 58, 3, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3160, 68, 58, 4, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3161, 68, 58, 5, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3162, 87, 58, 2, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3163, 87, 58, 3, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3164, 87, 58, 4, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3165, 87, 58, 5, 0, 235.00, 235.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3166, 87, 58, 6, 0, 235.00, 235.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3167, 87, 24, 2, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3168, 87, 24, 3, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3169, 87, 24, 4, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3170, 87, 24, 5, 0, 235.00, 235.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3171, 87, 24, 6, 0, 235.00, 235.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3172, 87, 13, 2, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3173, 87, 13, 3, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3174, 87, 13, 4, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3175, 87, 13, 5, 0, 235.00, 235.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3176, 87, 13, 6, 0, 235.00, 235.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3177, 87, 11, 2, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3178, 87, 11, 3, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3179, 87, 11, 4, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3180, 87, 11, 5, 0, 235.00, 235.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3181, 87, 11, 6, 0, 235.00, 235.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3182, 87, 17, 2, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3183, 87, 17, 3, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3184, 87, 17, 4, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3185, 87, 17, 5, 0, 235.00, 235.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3186, 87, 17, 6, 0, 235.00, 235.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3187, 87, 16, 2, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3188, 87, 16, 3, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3189, 87, 16, 4, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3190, 87, 16, 5, 0, 235.00, 235.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3191, 87, 16, 6, 0, 235.00, 235.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3192, 87, 14, 2, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3193, 87, 14, 3, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3194, 87, 14, 4, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3195, 87, 14, 5, 0, 235.00, 235.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3196, 87, 14, 6, 0, 235.00, 235.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3197, 87, 7, 2, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3198, 87, 7, 3, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3199, 87, 7, 4, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3200, 87, 7, 5, 0, 235.00, 235.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3201, 87, 7, 6, 0, 235.00, 235.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3202, 87, 60, 2, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3203, 87, 60, 3, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3204, 87, 60, 4, 0, 220.00, 220.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3205, 87, 60, 5, 0, 235.00, 235.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3206, 87, 60, 6, 0, 235.00, 235.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3207, 88, 60, 2, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3208, 88, 60, 3, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3209, 88, 60, 4, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3210, 88, 60, 5, 0, 225.00, 225.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3211, 88, 60, 6, 0, 225.00, 225.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3212, 88, 24, 2, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3213, 88, 24, 3, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3214, 88, 24, 4, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3215, 88, 24, 5, 0, 225.00, 225.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3216, 88, 24, 6, 0, 225.00, 225.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3217, 88, 13, 2, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3218, 88, 13, 3, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3219, 88, 13, 4, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3220, 88, 13, 5, 0, 225.00, 225.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3221, 88, 13, 6, 0, 225.00, 225.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3222, 88, 11, 2, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3223, 88, 11, 3, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3224, 88, 11, 4, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3225, 88, 11, 5, 0, 225.00, 225.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3226, 88, 11, 6, 0, 225.00, 225.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3227, 88, 17, 2, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3228, 88, 17, 3, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3229, 88, 17, 4, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3230, 88, 17, 5, 0, 225.00, 225.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3231, 88, 17, 6, 0, 225.00, 225.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3232, 88, 16, 2, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3233, 88, 16, 3, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3234, 88, 16, 4, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3235, 88, 16, 5, 0, 225.00, 225.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3236, 88, 16, 6, 0, 225.00, 225.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3237, 88, 14, 2, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3238, 88, 14, 3, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3239, 88, 14, 4, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3240, 88, 14, 5, 0, 225.00, 225.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3241, 88, 14, 6, 0, 225.00, 225.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3242, 88, 58, 2, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3243, 88, 58, 3, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3244, 88, 58, 4, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3245, 88, 58, 5, 0, 225.00, 225.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3246, 88, 58, 6, 0, 225.00, 225.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3247, 88, 64, 2, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3248, 88, 64, 3, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3249, 88, 64, 4, 0, 210.00, 210.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3250, 88, 64, 5, 0, 225.00, 225.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3251, 88, 64, 6, 0, 225.00, 225.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3252, 89, 58, 2, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3253, 89, 58, 3, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3254, 89, 58, 4, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3255, 89, 58, 5, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3256, 89, 58, 6, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3257, 89, 24, 2, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3258, 89, 24, 3, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3259, 89, 24, 4, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3260, 89, 24, 5, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3261, 89, 24, 6, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3262, 89, 13, 2, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3263, 89, 13, 3, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3264, 89, 13, 4, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3265, 89, 13, 5, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3266, 89, 13, 6, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3267, 89, 11, 2, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3268, 89, 11, 3, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3269, 89, 11, 4, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3270, 89, 11, 5, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3271, 89, 11, 6, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3272, 89, 17, 2, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3273, 89, 17, 3, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3274, 89, 17, 4, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3275, 89, 17, 5, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3276, 89, 17, 6, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3277, 89, 16, 2, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3278, 89, 16, 3, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3279, 89, 16, 4, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3280, 89, 16, 5, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3281, 89, 16, 6, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3282, 89, 14, 2, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3283, 89, 14, 3, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3284, 89, 14, 4, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3285, 89, 14, 5, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3286, 89, 14, 6, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3287, 89, 19, 2, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3288, 89, 19, 3, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3289, 89, 19, 4, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3290, 89, 19, 5, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3291, 89, 19, 6, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3292, 89, 60, 2, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3293, 89, 60, 3, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3294, 89, 60, 4, 0, 230.00, 230.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3295, 89, 60, 5, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3296, 89, 60, 6, 0, 240.00, 240.00, 1, NULL, 1, '2022-03-03 02:07:17', '2022-05-30 13:49:46'),
(3297, 66, 13, 1, 0, 325.00, 325.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3298, 66, 13, 2, 0, 325.00, 325.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3299, 66, 13, 3, 0, 325.00, 325.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3300, 66, 13, 4, 0, 325.00, 325.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3301, 66, 13, 5, 0, 325.00, 325.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3302, 66, 12, 1, 0, 325.00, 325.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3303, 66, 12, 2, 0, 325.00, 325.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3304, 66, 12, 3, 0, 325.00, 325.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3305, 66, 12, 4, 0, 325.00, 325.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3306, 66, 12, 5, 0, 325.00, 325.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3307, 66, 18, 1, 0, 325.00, 325.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3308, 66, 18, 2, 0, 325.00, 325.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3309, 66, 18, 3, 0, 325.00, 325.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3310, 66, 18, 4, 0, 325.00, 325.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3311, 66, 18, 5, 0, 325.00, 325.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3312, 66, 4, 1, 0, 325.00, 325.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3313, 66, 4, 2, 0, 325.00, 325.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3314, 66, 4, 3, 0, 325.00, 325.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3315, 66, 4, 4, 0, 325.00, 325.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3316, 66, 4, 5, 0, 325.00, 325.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3317, 81, 13, 2, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3318, 81, 13, 3, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3319, 81, 13, 4, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3320, 81, 13, 5, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3321, 81, 13, 6, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3322, 81, 58, 2, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3323, 81, 58, 3, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3324, 81, 58, 4, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3325, 81, 58, 5, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3326, 81, 58, 6, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3327, 81, 60, 2, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3328, 81, 60, 3, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3329, 81, 60, 4, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3330, 81, 60, 5, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3331, 81, 60, 6, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3332, 81, 64, 2, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3333, 81, 64, 3, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3334, 81, 64, 4, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3335, 81, 64, 5, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3336, 81, 64, 6, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3337, 81, 32, 2, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3338, 81, 32, 3, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3339, 81, 32, 4, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3340, 81, 32, 5, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3341, 81, 32, 6, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3342, 81, 10, 2, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3343, 81, 10, 3, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3344, 81, 10, 4, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3345, 81, 10, 5, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3346, 81, 10, 6, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3347, 81, 42, 2, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3348, 81, 42, 3, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3349, 81, 42, 4, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3350, 81, 42, 5, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3351, 81, 42, 6, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3352, 81, 26, 2, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3353, 81, 26, 3, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3354, 81, 26, 4, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3355, 81, 26, 5, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3356, 81, 26, 6, 0, 190.00, 190.00, 1, NULL, 1, '2022-03-03 18:37:17', '2022-05-30 13:49:46'),
(3357, 82, 11, 2, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3358, 82, 11, 3, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3359, 82, 11, 4, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3360, 82, 11, 5, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3361, 82, 11, 6, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3362, 82, 13, 2, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3363, 82, 13, 3, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3364, 82, 13, 4, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3365, 82, 13, 5, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3366, 82, 13, 6, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3367, 82, 58, 2, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3368, 82, 58, 3, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3369, 82, 58, 4, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3370, 82, 58, 5, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3371, 82, 58, 6, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3372, 82, 60, 2, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3373, 82, 60, 3, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3374, 82, 60, 4, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3375, 82, 60, 5, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3376, 82, 60, 6, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3377, 82, 64, 2, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3378, 82, 64, 3, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3379, 82, 64, 4, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3380, 82, 64, 5, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3381, 82, 64, 6, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3382, 82, 32, 2, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3383, 82, 32, 3, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3384, 82, 32, 4, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3385, 82, 32, 5, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46');
INSERT INTO `_product_color_sizes` (`id`, `product_id`, `color`, `size`, `assorted_flag`, `price`, `offer_price`, `stock`, `code`, `status`, `created_at`, `updated_at`) VALUES
(3386, 82, 32, 6, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3387, 82, 10, 2, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3388, 82, 10, 3, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3389, 82, 10, 4, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3390, 82, 10, 5, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3391, 82, 10, 6, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3392, 82, 42, 2, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3393, 82, 42, 3, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3394, 82, 42, 4, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3395, 82, 42, 5, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3396, 82, 42, 6, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3397, 82, 26, 2, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3398, 82, 26, 3, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3399, 82, 26, 4, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3400, 82, 26, 5, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3401, 82, 26, 6, 0, 199.00, 199.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3402, 83, 11, 2, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3403, 83, 11, 3, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3404, 83, 11, 4, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3405, 83, 11, 5, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3406, 83, 11, 6, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3407, 83, 13, 2, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3408, 83, 13, 3, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3409, 83, 13, 4, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3410, 83, 13, 5, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3411, 83, 13, 6, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3412, 83, 58, 2, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3413, 83, 58, 3, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3414, 83, 58, 4, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3415, 83, 58, 5, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3416, 83, 58, 6, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3417, 83, 60, 2, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3418, 83, 60, 3, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3419, 83, 60, 4, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3420, 83, 60, 5, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3421, 83, 60, 6, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3422, 83, 64, 2, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3423, 83, 64, 3, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3424, 83, 64, 4, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3425, 83, 64, 5, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3426, 83, 64, 6, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3427, 83, 32, 2, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3428, 83, 32, 3, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3429, 83, 32, 4, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3430, 83, 32, 5, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3431, 83, 32, 6, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3432, 83, 10, 2, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3433, 83, 10, 3, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3434, 83, 10, 4, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3435, 83, 10, 5, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3436, 83, 10, 6, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3437, 83, 42, 2, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3438, 83, 42, 3, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3439, 83, 42, 4, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3440, 83, 42, 5, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3441, 83, 42, 6, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3442, 83, 26, 2, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3443, 83, 26, 3, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3444, 83, 26, 4, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3445, 83, 26, 5, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46'),
(3446, 83, 26, 6, 0, 250.00, 250.00, 1, NULL, 1, '2022-03-03 13:07:17', '2022-05-30 13:49:46');

-- --------------------------------------------------------

--
-- Table structure for table `_sales`
--

CREATE TABLE `_sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_sales`
--

INSERT INTO `_sales` (`id`, `product_id`, `position`, `created_at`, `updated_at`) VALUES
(1, 140, 0, '2022-05-04 02:36:40', '2022-05-30 13:49:46'),
(2, 34, 0, '2022-05-04 02:36:44', '2022-05-30 13:49:46'),
(3, 58, 0, '2022-05-04 02:36:50', '2022-05-30 13:49:46'),
(4, 71, 0, '2022-05-04 02:36:55', '2022-05-30 13:49:46'),
(6, 7, 0, '2022-05-10 10:13:32', '2022-05-30 13:49:46'),
(7, 9, 0, '2022-05-10 10:13:54', '2022-05-30 13:49:46');

-- --------------------------------------------------------

--
-- Table structure for table `_settings`
--

CREATE TABLE `_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_heading` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1: active, 0: inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_settings`
--

INSERT INTO `_settings` (`id`, `page_heading`, `content`, `status`, `created_at`, `updated_at`) VALUES
(1, 'about', 'About us page Where does it come from?\r\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', 1, '2022-03-02 13:47:50', '2022-05-30 13:49:46'),
(2, 'terms', 'Terms page Where does it come from?\r\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', 1, '2022-03-02 13:47:50', '2022-05-30 13:49:46'),
(3, 'privacy', 'Privacy page Where does it come from?\r\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', 1, '2022-03-02 13:47:50', '2022-05-30 13:49:46'),
(4, 'cancellation_and_refund', 'Cancellation & Refund page Where does it come from?\r\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', 1, '2022-03-02 13:47:50', '2022-05-30 13:49:46'),
(5, 'return', 'Return page Where does it come from?\r\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', 1, '2022-03-02 13:47:50', '2022-05-30 13:49:46'),
(6, 'address', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 1, '2022-03-02 13:47:50', '2022-05-30 13:49:46'),
(7, 'contact_no', '9876543210', 1, '2022-03-02 13:47:50', '2022-05-30 13:49:46'),
(8, 'email_id', 'help@onn.com', 1, '2022-03-02 13:47:50', '2022-05-30 13:49:46'),
(9, 'google_map_iframe', NULL, 1, '2022-03-02 13:47:50', '2022-05-30 13:49:46'),
(10, 'fb_link', 'https://www.facebook.com/LuxInnerwear/', 1, '2022-03-02 13:47:50', '2022-05-30 13:49:46'),
(11, 'twitter_link', 'https://twitter.com/Lux_Innerwear', 1, '2022-03-02 13:47:50', '2022-05-30 13:49:46'),
(12, 'youtube_link', 'https://www.youtube.com/channel/UCsHxH5IoJxIipaNcv1Eg1wA', 1, '2022-03-02 13:47:50', '2022-05-30 13:49:46'),
(13, 'insta_link', 'https://instagram.com/lux_cozi_innerwear?igshid=9ensolghw1cq', 1, '2022-03-02 13:47:50', '2022-05-30 13:49:46'),
(14, 'disclaimer', 'Disclaimer page Where does it come from?\r\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', 1, '2022-03-17 07:24:21', '2022-05-30 13:49:46'),
(15, 'security', 'Security page Where does it come from?\r\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', 1, '2022-03-17 07:24:21', '2022-05-30 13:49:46'),
(16, 'shipping_delivery', 'Shipping& delivery page Where does it come from?\r\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', 1, '2022-03-17 08:07:07', '2022-05-30 13:49:46'),
(17, 'payment_voucher_promotion', 'payment, voucher & promotions page Where does it come from?\r\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', 1, '2022-03-17 08:07:44', '2022-05-30 13:49:46'),
(18, 'service_contact', 'services & contacts page Where does it come from?\r\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', 1, '2022-03-17 08:07:44', '2022-05-30 13:49:46');

-- --------------------------------------------------------

--
-- Table structure for table `_staff_allowance`
--

CREATE TABLE `_staff_allowance` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `staff_id` bigint(20) NOT NULL,
  `designation` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` double(10,2) DEFAULT 0.00,
  `house_rent` double(10,2) DEFAULT 0.00,
  `convenience` double(10,2) DEFAULT 0.00,
  `dearness` double(10,2) DEFAULT 0.00,
  `medical` double(10,2) DEFAULT 0.00,
  `overtime` double(10,2) DEFAULT 0.00,
  `city_compensatory` double(10,2) DEFAULT 0.00,
  `project` double(10,2) DEFAULT 0.00,
  `food` double(10,2) DEFAULT 0.00,
  `special` double(10,2) DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_start_end_days`
--

CREATE TABLE `_start_end_days` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `start_location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_lat` double NOT NULL,
  `end_lat` double NOT NULL,
  `start_lng` double NOT NULL,
  `end_lng` double NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_start_end_days`
--

INSERT INTO `_start_end_days` (`id`, `user_id`, `start_location`, `end_location`, `start_lat`, `end_lat`, `start_lng`, `end_lng`, `start_date`, `end_date`, `start_time`, `end_time`, `created_at`, `updated_at`) VALUES
(3, 5, 'Mumbai', 'Mumbai', 19.1582, 19.9597, 72.9597, 72.9599, '2022-03-22', '2022-03-23', '10:04:34', '01:04:34', '2022-04-25 01:28:37', '2022-04-25 01:28:37'),
(4, 5, 'East Mumbai', 'Mumbai', 19.1582, 19.9597, 72.9597, 72.9599, '2022-03-23', '2022-03-23', '02:04:34', '05:04:34', '2022-04-25 01:30:21', '2022-04-25 01:30:21'),
(5, 5, 'Delhi', 'Delhi', 28.1582, 28.9597, 77.9597, 77.9599, '2022-03-24', '2022-03-24', '02:04:34', '05:04:34', '2022-04-25 01:32:24', '2022-04-25 01:32:24'),
(6, 6, 'Delhi', 'Delhi', 28.1582, 28.9597, 77.9597, 77.9599, '2022-03-24', '2022-03-24', '02:04:34', '05:04:34', '2022-04-26 04:14:30', '2022-04-26 04:14:30'),
(7, 6, 'Delhi', 'mumbai', 28.1582, 28.9597, 77.9597, 77.9599, '2022-03-24', '2022-03-24', '02:04:34', '05:04:34', '2022-04-26 04:14:30', '2022-04-26 04:29:34');

-- --------------------------------------------------------

--
-- Table structure for table `_transactions`
--

CREATE TABLE `_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `transaction` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `online_payment_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(10,2) NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `upi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1: active, 0: inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_transactions`
--

INSERT INTO `_transactions` (`id`, `user_id`, `order_id`, `transaction`, `online_payment_id`, `amount`, `currency`, `method`, `description`, `bank`, `upi`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'TXN_98473IG5YDYRUY8IDY8', NULL, 2400.00, 'INR', 'upi', '', '', '', 1, '2022-03-04 11:14:07', '2022-05-30 13:49:46'),
(2, 0, 34, 'TXN_NHL0CLQJW0HU0K1LAR1M', 'pay_JA7VqFzh3JejBE', 1060.00, 'INR', '', '', '', '', 1, '2022-03-22 11:35:11', '2022-05-30 13:49:46'),
(3, 26, 35, 'TXN_Y237OET0GPAA1CUNEICC', 'pay_JAT3w1Yb7n7qcj', 5529.00, 'INR', '', '', '', '', 1, '2022-03-23 08:40:03', '2022-05-30 13:49:46'),
(4, 26, 36, 'TXN_JR9JG4KYB6XZ6VVQ3PYV', 'pay_JAZFtErXoUaH2B', 4400.00, 'INR', '', '', '', '', 1, '2022-03-23 14:43:32', '2022-05-30 13:49:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_lists`
--
ALTER TABLE `bank_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_parents`
--
ALTER TABLE `category_parents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designation`
--
ALTER TABLE `designation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_payments`
--
ALTER TABLE `invoice_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_products`
--
ALTER TABLE `invoice_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `journal`
--
ALTER TABLE `journal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ledger`
--
ALTER TABLE `ledger`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mail_logs`
--
ALTER TABLE `mail_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_cancelled_products`
--
ALTER TABLE `order_cancelled_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packing_slip`
--
ALTER TABLE `packing_slip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packing_slip_boxes`
--
ALTER TABLE `packing_slip_boxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_collections`
--
ALTER TABLE `payment_collections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_old`
--
ALTER TABLE `products_old`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_threshold_request`
--
ALTER TABLE `product_threshold_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_order_archived_boxes`
--
ALTER TABLE `purchase_order_archived_boxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_order_boxes`
--
ALTER TABLE `purchase_order_boxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_commision`
--
ALTER TABLE `staff_commision`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_post_details`
--
ALTER TABLE `staff_post_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_salary`
--
ALTER TABLE `staff_salary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_unpaid_amounts`
--
ALTER TABLE `staff_unpaid_amounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_boxes`
--
ALTER TABLE `stock_boxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_products`
--
ALTER TABLE `stock_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `whatsapp` (`whatsapp`);

--
-- Indexes for table `store_visits`
--
ALTER TABLE `store_visits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_visit_details`
--
ALTER TABLE `store_visit_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_mails`
--
ALTER TABLE `subscription_mails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `whatsapp_no` (`whatsapp_no`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_details`
--
ALTER TABLE `task_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_cron`
--
ALTER TABLE `test_cron`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `whatsapp_no` (`whatsapp_no`);

--
-- Indexes for table `users_old`
--
ALTER TABLE `users_old`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `whatsapp_no` (`whatsapp_no`);

--
-- Indexes for table `user_attendances`
--
ALTER TABLE `user_attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_noorderreasons`
--
ALTER TABLE `user_noorderreasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_addresses`
--
ALTER TABLE `_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_collections`
--
ALTER TABLE `_collections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_colors`
--
ALTER TABLE `_colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_coupons`
--
ALTER TABLE `_coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_coupon_usages`
--
ALTER TABLE `_coupon_usages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_customers`
--
ALTER TABLE `_customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `whatsapp_no` (`whatsapp_no`);

--
-- Indexes for table `_distributors`
--
ALTER TABLE `_distributors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_faqs`
--
ALTER TABLE `_faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_galleries`
--
ALTER TABLE `_galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_offers`
--
ALTER TABLE `_offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_product_colors`
--
ALTER TABLE `_product_colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_product_color_sizes`
--
ALTER TABLE `_product_color_sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_sales`
--
ALTER TABLE `_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_settings`
--
ALTER TABLE `_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_staff_allowance`
--
ALTER TABLE `_staff_allowance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_start_end_days`
--
ALTER TABLE `_start_end_days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_transactions`
--
ALTER TABLE `_transactions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `app_settings`
--
ALTER TABLE `app_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bank_lists`
--
ALTER TABLE `bank_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `category_parents`
--
ALTER TABLE `category_parents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `designation`
--
ALTER TABLE `designation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `expense`
--
ALTER TABLE `expense`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoice_payments`
--
ALTER TABLE `invoice_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_products`
--
ALTER TABLE `invoice_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `journal`
--
ALTER TABLE `journal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ledger`
--
ALTER TABLE `ledger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `mail_logs`
--
ALTER TABLE `mail_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_cancelled_products`
--
ALTER TABLE `order_cancelled_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `packing_slip`
--
ALTER TABLE `packing_slip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `packing_slip_boxes`
--
ALTER TABLE `packing_slip_boxes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `payment_collections`
--
ALTER TABLE `payment_collections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `products_old`
--
ALTER TABLE `products_old`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_threshold_request`
--
ALTER TABLE `product_threshold_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `purchase_order_archived_boxes`
--
ALTER TABLE `purchase_order_archived_boxes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_order_boxes`
--
ALTER TABLE `purchase_order_boxes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `staff_commision`
--
ALTER TABLE `staff_commision`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `staff_post_details`
--
ALTER TABLE `staff_post_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `staff_salary`
--
ALTER TABLE `staff_salary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `staff_unpaid_amounts`
--
ALTER TABLE `staff_unpaid_amounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stock_boxes`
--
ALTER TABLE `stock_boxes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `stock_products`
--
ALTER TABLE `stock_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `store_visits`
--
ALTER TABLE `store_visits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `store_visit_details`
--
ALTER TABLE `store_visit_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_mails`
--
ALTER TABLE `subscription_mails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `task_details`
--
ALTER TABLE `task_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `test_cron`
--
ALTER TABLE `test_cron`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users_old`
--
ALTER TABLE `users_old`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `user_attendances`
--
ALTER TABLE `user_attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_noorderreasons`
--
ALTER TABLE `user_noorderreasons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `_addresses`
--
ALTER TABLE `_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_collections`
--
ALTER TABLE `_collections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `_colors`
--
ALTER TABLE `_colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `_coupons`
--
ALTER TABLE `_coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `_coupon_usages`
--
ALTER TABLE `_coupon_usages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `_customers`
--
ALTER TABLE `_customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `_distributors`
--
ALTER TABLE `_distributors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `_faqs`
--
ALTER TABLE `_faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `_galleries`
--
ALTER TABLE `_galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `_offers`
--
ALTER TABLE `_offers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_product_colors`
--
ALTER TABLE `_product_colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_product_color_sizes`
--
ALTER TABLE `_product_color_sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3447;

--
-- AUTO_INCREMENT for table `_sales`
--
ALTER TABLE `_sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `_settings`
--
ALTER TABLE `_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `_staff_allowance`
--
ALTER TABLE `_staff_allowance`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_start_end_days`
--
ALTER TABLE `_start_end_days`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `_transactions`
--
ALTER TABLE `_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
