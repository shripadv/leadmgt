-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2015 at 01:15 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `aura`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE IF NOT EXISTS `account` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `currency_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `total_amount` double NOT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=46 ;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`account_id`, `company_id`, `branch_id`, `date`, `currency_id`, `count`, `total_amount`) VALUES
(1, 1, 1, '2015-07-10', 9, 3, 3000),
(2, 1, 1, '2015-07-10', 8, 3, 1500),
(3, 1, 1, '2015-07-10', 7, 14, 1400),
(4, 1, 1, '2015-07-10', 6, 31, 1550),
(5, 1, 1, '2015-07-10', 5, 15, 300),
(6, 1, 1, '2015-07-10', 4, 15, 150),
(7, 1, 1, '2015-07-10', 3, 6, 30),
(8, 1, 1, '2015-07-10', 2, 5, 10),
(9, 1, 1, '2015-07-10', 1, 10, 10),
(10, 1, 1, '2015-07-11', 9, 5, 5000),
(11, 1, 1, '2015-07-11', 8, 4, 2000),
(12, 1, 1, '2015-07-11', 7, 9, 900),
(13, 1, 1, '2015-07-11', 6, 31, 1550),
(14, 1, 1, '2015-07-11', 5, 17, 340),
(15, 1, 1, '2015-07-11', 4, 16, 160),
(16, 1, 1, '2015-07-11', 3, 6, 30),
(17, 1, 1, '2015-07-11', 2, 5, 10),
(18, 1, 1, '2015-07-11', 1, 10, 10),
(19, 1, 1, '2015-07-12', 9, 5, 5000),
(20, 1, 1, '2015-07-12', 8, 4, 2000),
(21, 1, 1, '2015-07-12', 7, 9, 900),
(22, 1, 1, '2015-07-12', 6, 31, 1550),
(23, 1, 1, '2015-07-12', 5, 17, 340),
(24, 1, 1, '2015-07-12', 4, 16, 160),
(25, 1, 1, '2015-07-12', 3, 6, 30),
(26, 1, 1, '2015-07-12', 2, 5, 10),
(27, 1, 1, '2015-07-12', 1, 10, 10),
(28, 1, 1, '2015-07-13', 9, 5, 5000),
(29, 1, 1, '2015-07-13', 8, 4, 2000),
(30, 1, 1, '2015-07-13', 7, 10, 1000),
(31, 1, 1, '2015-07-13', 6, 31, 1550),
(32, 1, 1, '2015-07-13', 5, 16, 320),
(33, 1, 1, '2015-07-13', 4, 16, 160),
(34, 1, 1, '2015-07-13', 3, 6, 30),
(35, 1, 1, '2015-07-13', 2, 4, 8),
(36, 1, 1, '2015-07-13', 1, 9, 9),
(37, 1, 1, '2015-07-14', 9, 5, 5000),
(38, 1, 1, '2015-07-14', 8, 4, 2000),
(39, 1, 1, '2015-07-14', 7, 13, 1300),
(40, 1, 1, '2015-07-14', 6, 25, 1250),
(41, 1, 1, '2015-07-14', 5, 17, 320),
(42, 1, 1, '2015-07-14', 4, 16, 160),
(43, 1, 1, '2015-07-14', 3, 6, 30),
(44, 1, 1, '2015-07-14', 2, 4, 8),
(45, 1, 1, '2015-07-14', 1, 9, 9);

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE IF NOT EXISTS `appointment` (
  `appointment_id` int(6) NOT NULL AUTO_INCREMENT,
  `customer_id` int(6) NOT NULL,
  `company_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `schedule_time` datetime NOT NULL,
  `status_id` varchar(50) NOT NULL,
  `start` time DEFAULT NULL,
  `end` time DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `total_amount` int(6) DEFAULT NULL,
  PRIMARY KEY (`appointment_id`),
  KEY `appointment_FKIndex1` (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointment_id`, `customer_id`, `company_id`, `branch_id`, `schedule_time`, `status_id`, `start`, `end`, `created_at`, `created_by`, `total_amount`) VALUES
(1, 1, 1, 1, '2015-03-31 12:01:00', '5', NULL, NULL, '2015-03-20 18:37:56', 6, 1970),
(2, 2, 1, 1, '2015-04-01 17:30:00', '2', NULL, NULL, '2015-03-20 18:37:56', 6, 1400),
(3, 3, 1, 1, '2015-04-07 03:30:00', '5', '03:30:00', '04:35:00', '2015-03-31 16:45:16', 6, 135),
(4, 5, 1, 1, '2015-04-03 12:00:00', '5', NULL, NULL, '2015-04-02 16:21:55', 6, 150),
(5, 4, 1, 1, '2015-04-07 10:45:00', '3', '13:57:00', '16:47:00', '2015-04-04 10:43:51', 6, 2150),
(6, 9, 1, 1, '2015-04-16 15:25:05', '4', '15:27:00', '16:17:00', '2015-04-14 11:38:05', 6, 150),
(7, 2, 1, 1, '2015-04-18 09:00:00', '5', '11:07:00', '11:57:00', '2015-04-17 16:51:03', 6, 140),
(8, 3, 1, 1, '2015-04-18 16:00:00', '1', NULL, NULL, '2015-04-18 15:39:24', 6, 135),
(9, 10, 1, 1, '2015-04-24 12:33:00', '5', '15:55:00', '18:45:00', '2015-04-22 17:30:08', 6, 5150),
(10, 14, 1, 1, '2015-04-24 19:11:00', '5', '19:07:00', '19:57:00', '2015-04-24 19:07:07', 6, 150),
(11, 8, 1, 1, '2015-04-27 15:59:00', '3', '16:01:00', '16:51:00', '2015-04-27 15:54:47', 6, 150),
(12, 8, 1, 1, '2015-05-04 10:37:00', '5', '10:33:00', '11:23:00', '2015-05-04 10:32:57', 6, 150),
(13, 5, 1, 1, '2015-05-06 20:10:00', '3', '20:08:00', '20:58:00', '2015-05-06 20:05:42', 6, 150),
(14, 4, 1, 1, '2015-05-07 11:59:00', '5', '11:55:00', '12:45:00', '2015-05-07 11:55:03', 6, 135),
(15, 11, 1, 1, '2015-05-07 12:05:15', '5', NULL, NULL, '2015-05-07 11:55:15', 6, 150),
(16, 8, 1, 1, '2015-05-07 12:05:27', '5', NULL, NULL, '2015-05-07 11:55:27', 6, 150),
(17, 4, 1, 1, '2015-05-19 15:10:00', '11', '15:10:00', '16:00:00', '2015-05-19 17:44:45', 6, 135),
(18, 3, 1, 1, '2015-05-22 12:14:00', '11', NULL, NULL, '2015-05-22 12:09:50', 6, 250),
(19, 2, 1, 1, '2015-05-22 15:33:00', '11', NULL, NULL, '2015-05-22 15:28:55', 6, 210),
(20, 2, 1, 1, '2015-05-25 18:45:00', '11', NULL, NULL, '2015-05-25 18:42:01', 6, 0),
(21, 2, 1, 1, '2015-05-25 18:58:00', '11', NULL, NULL, '2015-05-25 18:59:01', 6, 135),
(22, 2, 1, 1, '2015-05-26 11:02:00', '11', NULL, NULL, '2015-05-26 11:57:41', 6, 0),
(23, 5, 1, 1, '2015-06-03 17:47:00', '11', NULL, NULL, '2015-06-03 17:42:43', 6, 0),
(24, 5, 1, 1, '2015-06-03 17:49:00', '12', NULL, NULL, '2015-06-03 17:44:26', 6, 200);

--
-- Triggers `appointment`
--
DROP TRIGGER IF EXISTS `BD_appointmentdel`;
DELIMITER //
CREATE TRIGGER `BD_appointmentdel` BEFORE DELETE ON `appointment`
 FOR EACH ROW BEGIN
	insert into appointment_deleted select * from appointment where appointment_id=OLD.appointment_id;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `appointment_deleted`
--

CREATE TABLE IF NOT EXISTS `appointment_deleted` (
  `appointment_id` int(6) NOT NULL,
  `customer_id` int(6) NOT NULL,
  `company_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `schedule_time` datetime NOT NULL,
  `status_id` varchar(50) NOT NULL,
  `start` time DEFAULT NULL,
  `end` time DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `total_amount` int(6) DEFAULT NULL,
  PRIMARY KEY (`appointment_id`),
  KEY `appointment_FKIndex1` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment_deleted`
--

INSERT INTO `appointment_deleted` (`appointment_id`, `customer_id`, `company_id`, `branch_id`, `schedule_time`, `status_id`, `start`, `end`, `created_at`, `created_by`, `total_amount`) VALUES
(7, 2, 1, 1, '2015-04-17 17:30:00', '1', NULL, NULL, '2015-04-17 15:16:54', 6, 140),
(14, 4, 1, 1, '2015-05-07 11:53:00', '5', '11:50:00', '12:40:00', '2015-05-07 11:48:43', 6, 150),
(15, 11, 1, 1, '2015-05-07 11:53:00', '1', NULL, NULL, '2015-05-07 11:49:40', 6, 150),
(16, 8, 1, 1, '2015-05-07 11:54:00', '1', NULL, NULL, '2015-05-07 11:50:00', 6, 150),
(18, 4, 1, 1, '2015-05-19 14:03:00', '12', '16:52:00', '17:42:00', '2015-05-19 14:59:05', 6, 135),
(21, 2, 1, 1, '2015-05-25 18:56:00', '1', NULL, NULL, '2015-05-25 18:51:10', 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `appointment_item`
--

CREATE TABLE IF NOT EXISTS `appointment_item` (
  `appointment_item_id` int(6) NOT NULL AUTO_INCREMENT,
  `services_id` int(6) NOT NULL,
  `therapist_id` int(6) NOT NULL,
  `appointment_id` int(6) NOT NULL,
  `membership_type_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `price` int(6) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  PRIMARY KEY (`appointment_item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `appointment_item`
--

INSERT INTO `appointment_item` (`appointment_item_id`, `services_id`, `therapist_id`, `appointment_id`, `membership_type_id`, `package_id`, `price`, `status_id`, `start_time`, `end_time`) VALUES
(1, 1, 1, 1, 1, NULL, 120, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 2, 2, 1, 1, NULL, 1850, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 2, 2, 2, 2, NULL, 1400, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 1, 1, 3, 3, NULL, 135, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 1, 1, 4, 0, NULL, 150, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 1, 1, 5, 0, NULL, 150, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 2, 2, 5, 0, NULL, 2000, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 1, 1, 6, 0, NULL, 150, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 1, 1, 7, 2, NULL, 140, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 1, 1, 8, 3, NULL, 135, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 1, 1, 9, 0, NULL, 150, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 3, 1, 9, 0, NULL, 5000, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 1, 1, 10, 0, NULL, 150, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 1, 1, 11, 0, NULL, 150, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 1, 1, 12, 0, NULL, 150, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 1, 1, 13, 0, NULL, 150, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 1, 1, 14, 3, NULL, 135, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 1, 1, 15, 0, NULL, 150, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 1, 1, 16, 0, NULL, 150, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 1, 1, 17, 3, NULL, 135, 11, '2015-05-19 15:10:00', '2015-05-19 16:00:00'),
(21, 1, 1, 18, 2, NULL, 140, 11, '2015-05-22 12:07:00', '1974-02-01 05:30:00'),
(22, 4, 1, 18, 2, NULL, 80, 11, '2015-05-22 14:08:00', '1970-01-01 05:30:00'),
(23, 1, 1, 19, 3, NULL, 135, 11, '2015-05-22 15:29:00', '2015-05-22 16:49:00'),
(24, 4, 1, 19, 3, NULL, 75, 11, '2015-05-22 16:52:00', '2015-05-22 06:12:00'),
(25, 1, 1, 20, 3, NULL, NULL, 11, '2015-05-25 18:46:00', '2015-05-25 19:36:00'),
(26, 1, 1, 21, 3, NULL, 135, 11, '2015-05-25 18:59:00', '2015-05-25 19:49:00'),
(27, 4, 1, 22, 3, 1, NULL, 11, '2015-05-26 11:03:00', '2015-05-26 11:33:00'),
(28, 6, 1, 23, 0, 2, NULL, 11, '2015-06-03 17:48:00', '2015-06-03 18:48:00'),
(29, 6, 1, 24, 0, 2, 200, 12, '2015-06-03 17:50:00', '2015-06-03 18:50:00');

--
-- Triggers `appointment_item`
--
DROP TRIGGER IF EXISTS `BD_appointment_item_del`;
DELIMITER //
CREATE TRIGGER `BD_appointment_item_del` BEFORE DELETE ON `appointment_item`
 FOR EACH ROW BEGIN
	insert into appointment_item_deleted select * from appointment_item where appointment_id=OLD.appointment_id;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `appointment_item_deleted`
--

CREATE TABLE IF NOT EXISTS `appointment_item_deleted` (
  `appointment_item_id` int(6) NOT NULL,
  `services_id` int(6) NOT NULL,
  `therapist_id` int(6) NOT NULL,
  `appointment_id` int(6) NOT NULL,
  `membership_type_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `price` int(6) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  PRIMARY KEY (`appointment_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment_item_deleted`
--

INSERT INTO `appointment_item_deleted` (`appointment_item_id`, `services_id`, `therapist_id`, `appointment_id`, `membership_type_id`, `package_id`, `price`, `status_id`, `start_time`, `end_time`) VALUES
(9, 1, 1, 7, 2, NULL, 140, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 1, 1, 14, 0, NULL, 150, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 1, 1, 15, 0, NULL, 150, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 1, 1, 16, 0, NULL, 150, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 1, 1, 18, 3, NULL, 135, 12, '2015-05-19 13:54:00', '1970-01-01 05:30:00'),
(26, 1, 1, 21, 3, NULL, NULL, 1, '2015-05-25 18:57:00', '2015-05-25 19:47:00');

-- --------------------------------------------------------

--
-- Table structure for table `appointment_status`
--

CREATE TABLE IF NOT EXISTS `appointment_status` (
  `status_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  `note` varchar(220) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment_status`
--

INSERT INTO `appointment_status` (`status_id`, `status`, `color`, `note`) VALUES
(1, 'Booked', '#FFE763', '1 to 5 Pre Active'),
(2, 'Waiting', '#FF4AFF', ''),
(6, 'Active', '#00F8FF', '6 to 10 Active'),
(11, 'Payment done', '#4BFE78', 'more than 10 Closed'),
(12, 'Complete', '#7BA7E1', ''),
(13, 'Cancelled', '#E17B7B', ''),
(14, 'No Show', '#E17B7B', '');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE IF NOT EXISTS `attendance` (
  `attendance_id` int(11) NOT NULL AUTO_INCREMENT,
  `therapist_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(1) NOT NULL,
  `enter_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`attendance_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attendance_id`, `therapist_id`, `date`, `status`, `enter_time`, `end_time`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, '2015-05-18', 'P', '10:43:00', '18:53:00', 6, '2015-05-18 18:43:47', NULL),
(2, 2, '2015-05-18', 'P', '10:18:00', '15:18:00', 6, '2015-05-18 18:43:47', NULL),
(3, 3, '2015-05-18', 'A', NULL, NULL, 6, '2015-05-18 18:43:47', NULL),
(4, 1, '2015-05-19', 'P', '10:00:00', '18:26:00', 6, '2015-05-19 12:35:00', '2015-05-20 10:26:23'),
(5, 2, '2015-05-19', 'L', NULL, NULL, 6, '2015-05-19 12:35:00', NULL),
(6, 3, '2015-05-19', 'P', '10:00:00', '18:26:00', 6, '2015-05-19 12:35:00', '2015-05-20 10:26:15'),
(7, 1, '2015-05-20', 'P', '17:18:00', '19:08:00', 6, '2015-05-20 17:18:39', '2015-05-20 19:09:28'),
(8, 2, '2015-05-20', 'L', NULL, NULL, 6, '2015-05-20 17:18:39', NULL),
(9, 3, '2015-05-20', 'P', '17:18:00', '19:09:00', 6, '2015-05-20 17:18:39', '2015-05-20 19:09:41'),
(10, 1, '2015-05-21', 'P', '10:13:00', NULL, 6, '2015-05-21 10:15:00', NULL),
(11, 1, '2015-05-22', 'P', '18:29:00', NULL, 6, '2015-05-22 18:29:31', NULL),
(12, 2, '2015-05-22', 'P', '18:29:00', NULL, 6, '2015-05-22 18:29:38', NULL),
(13, 1, '2015-05-25', 'P', '10:06:00', NULL, 6, '2015-05-25 10:06:22', NULL),
(14, 2, '2015-05-25', 'P', '10:06:00', NULL, 6, '2015-05-25 10:06:28', NULL),
(15, 3, '2015-05-25', 'P', '10:06:00', NULL, 6, '2015-05-25 10:06:35', NULL),
(16, 1, '2015-05-26', 'P', '10:03:00', '18:32:00', 6, '2015-05-26 12:03:50', '2015-05-26 18:32:32'),
(17, 2, '2015-05-26', 'P', '10:03:00', '18:32:00', 6, '2015-05-26 12:04:00', '2015-05-26 18:32:36'),
(18, 3, '2015-05-26', 'P', '12:04:00', '21:00:00', 6, '2015-05-26 12:04:11', '2015-05-26 19:00:22'),
(19, 1, '2015-07-02', 'P', '13:34:00', NULL, 6, '2015-07-02 13:34:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE IF NOT EXISTS `branches` (
  `branch_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `branch_title` varchar(220) DEFAULT NULL,
  `branch_code` varchar(220) DEFAULT NULL,
  `contact_person` varchar(220) DEFAULT NULL,
  `branch_tel_no` varchar(220) DEFAULT NULL,
  `branch_address1` varchar(220) DEFAULT NULL,
  `branch_address2` varchar(220) DEFAULT NULL,
  `branch_email` varchar(220) NOT NULL,
  `city` varchar(220) DEFAULT NULL,
  `branch_pincode` int(6) DEFAULT NULL,
  `state` varchar(220) DEFAULT NULL,
  `contact_mobile` varchar(220) DEFAULT NULL,
  `invoice_prefix` varchar(10) NOT NULL,
  `pre_message` text,
  `post_message` text,
  `post_promotion` text,
  `receipt_format` int(1) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`branch_id`, `company_id`, `branch_title`, `branch_code`, `contact_person`, `branch_tel_no`, `branch_address1`, `branch_address2`, `branch_email`, `city`, `branch_pincode`, `state`, `contact_mobile`, `invoice_prefix`, `pre_message`, `post_message`, `post_promotion`, `receipt_format`, `created_at`) VALUES
(1, 1, 'CBD', 'CBD1', 'John', '', 'Sector 12', 'Navi Mumbai', '', 'Nerul, Navi-mumbai', 400000, 'MAHARASHTRA', '8989898989', '', '', 'Thank you for youe help, you just donated Rs.5000 to save & educate a child. We support NISHTHA FOUNDATION. Further details at www.nishthafoundation.org', 'THANKS FOR YOUR VISIT, HOPE YOU LIKE THE AURA EXPERIENCE . WISH TO SEE YOU AGAIN.', 1, '0000-00-00 00:00:00'),
(2, 1, 'KHARGHAR', 'KHA1', 'John', '', 'Sector 12', 'Kharghar', '', 'Nerul, Navi-mumbai', 400000, 'MAHARASHTRA', '8989898989', '', '', '', '', 1, '0000-00-00 00:00:00'),
(3, 2, 'DEFAULT', NULL, NULL, '', NULL, NULL, '', 'CBD', 400000, 'MAHARASHTRA', '9876543210', '', NULL, NULL, NULL, 0, '0000-00-00 00:00:00'),
(4, 3, 'DEFAULT', NULL, NULL, '', NULL, NULL, '', '', 0, 'MAHARASHTRA', '9856237410', '', NULL, NULL, NULL, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `campaign`
--

CREATE TABLE IF NOT EXISTS `campaign` (
  `cid` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(6) NOT NULL COMMENT 'company id',
  `branch_id` int(6) NOT NULL COMMENT 'branch id',
  `stid` int(3) NOT NULL COMMENT 'sms type id',
  `tid` int(3) NOT NULL COMMENT 'template id',
  `message` text CHARACTER SET utf8 NOT NULL,
  `total_customer` int(10) NOT NULL,
  `note` text NOT NULL,
  `title` varchar(50) NOT NULL,
  `sheduled_time` datetime DEFAULT NULL,
  `added_on` datetime NOT NULL,
  `cg_id` int(11) NOT NULL COMMENT 'customers group id',
  `mobile_numbers` text NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `campaign`
--

INSERT INTO `campaign` (`cid`, `company_id`, `branch_id`, `stid`, `tid`, `message`, `total_customer`, `note`, `title`, `sheduled_time`, `added_on`, `cg_id`, `mobile_numbers`) VALUES
(1, 1, 1, 0, 0, 'Hii |*email*| ,\r\n\r\nhow are you dear,\r\nhappy birthday.', 1, '', 'Birthday', NULL, '2015-05-15 11:36:03', 0, ''),
(2, 1, 1, 0, 0, 'Hii |*email*| ,\r\n\r\nhow are you dear,\r\nhappy birthday.', 1, '', 'Birthday', NULL, '2015-05-18 10:52:18', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `campaign_log`
--

CREATE TABLE IF NOT EXISTS `campaign_log` (
  `clid` int(10) NOT NULL AUTO_INCREMENT,
  `cid` int(10) NOT NULL,
  `company_id` int(6) NOT NULL COMMENT 'company id',
  `branch_id` int(6) NOT NULL COMMENT 'branch id',
  `customer_id` int(11) NOT NULL,
  `msg` text CHARACTER SET utf8 NOT NULL,
  `datetime` datetime NOT NULL,
  `mobile` text NOT NULL,
  `response` text CHARACTER SET utf8,
  `count` int(3) NOT NULL,
  `unicode` int(1) NOT NULL DEFAULT '0',
  `priority` int(1) NOT NULL,
  `status` varchar(100) NOT NULL,
  `sheduled_time` datetime DEFAULT NULL,
  PRIMARY KEY (`clid`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `campaign_log`
--

INSERT INTO `campaign_log` (`clid`, `cid`, `company_id`, `branch_id`, `customer_id`, `msg`, `datetime`, `mobile`, `response`, `count`, `unicode`, `priority`, `status`, `sheduled_time`) VALUES
(1, 1, 1, 1, 0, 'Hii |*email*| ,\r\n\r\nhow are you dear,\r\nhappy birthday.', '2015-05-15 11:36:03', '9265636267', 'sent|http://shortmsg.net/api/secure_compose?securekey=ayujbbn@**7&token=f3676ahn&to=9265636267&message=Hii+%7C%2Aemail%2A%7C+%2C%0D%0A%0D%0Ahow+are+you+dear%2C%0D%0Ahappy+birthday.', 1, 0, 0, 'Sent', NULL),
(2, 2, 1, 1, 0, 'Hii |*email*| ,\r\n\r\nhow are you dear,\r\nhappy birthday.', '2015-05-18 10:52:18', '8989898989', 'sent|http://shortmsg.net/api/secure_compose?securekey=ayujbbn@**7&token=f3676ahn&to=8989898989&message=Hii+%7C%2Aemail%2A%7C+%2C%0D%0A%0D%0Ahow+are+you+dear%2C%0D%0Ahappy+birthday.', 1, 0, 0, 'Sent', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cashin`
--

CREATE TABLE IF NOT EXISTS `cashin` (
  `cashin_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `ctid` int(3) DEFAULT NULL,
  `payment_type` enum('Cash','Debit Card','Credit Card','Cheque','Store Account') CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` float NOT NULL,
  `date` date NOT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`cashin_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `cashin`
--

INSERT INTO `cashin` (`cashin_id`, `company_id`, `branch_id`, `ctid`, `payment_type`, `ref_no`, `amount`, `date`, `note`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, 'Cash', '', 3100, '2015-07-11', '', '2015-07-11 15:38:18', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cashin_type`
--

CREATE TABLE IF NOT EXISTS `cashin_type` (
  `ctid` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `note` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`ctid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `cashin_type`
--

INSERT INTO `cashin_type` (`ctid`, `company_id`, `branch_id`, `title`, `note`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'CASH FROM HOME', '', '2015-07-11 13:06:38', '2015-07-11 13:09:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cashout`
--

CREATE TABLE IF NOT EXISTS `cashout` (
  `cashout_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `cashout_type` enum('expense','bank_deposit','cash_taken') NOT NULL,
  `extid` int(3) DEFAULT NULL,
  `payment_type` enum('Cash','Debit Card','Credit Card','Cheque','Store Account') CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` float NOT NULL,
  `date` date NOT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`cashout_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `cashout`
--

INSERT INTO `cashout` (`cashout_id`, `company_id`, `branch_id`, `cashout_type`, `extid`, `payment_type`, `ref_no`, `amount`, `date`, `note`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'expense', 2, 'Cash', '', 2050, '2015-07-10', '', '2015-07-10 15:17:50', '0000-00-00 00:00:00', NULL),
(2, 1, 1, 'expense', 1, 'Cash', '', 1050, '2015-07-11', 'Salary for waldo', '2015-07-11 11:07:55', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cash_exchange`
--

CREATE TABLE IF NOT EXISTS `cash_exchange` (
  `cash_exchange_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `amount` float NOT NULL,
  `date` date NOT NULL,
  `exchange_by` int(11) NOT NULL COMMENT 'user id done exchange',
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`cash_exchange_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `cash_exchange`
--

INSERT INTO `cash_exchange` (`cash_exchange_id`, `company_id`, `branch_id`, `amount`, `date`, `exchange_by`, `created_at`) VALUES
(1, 1, 1, 300, '2015-07-14', 6, '2015-07-14 12:05:17');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE IF NOT EXISTS `company` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(220) DEFAULT NULL,
  `company_address1` varchar(220) DEFAULT NULL,
  `company_address2` varchar(220) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `pin_no` int(6) NOT NULL,
  `company_telephone` varchar(220) DEFAULT NULL,
  `company_email` varchar(220) DEFAULT NULL,
  `company_website` varchar(220) NOT NULL,
  `mobile` varchar(220) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `company_logo` varchar(220) NOT NULL,
  `note` text,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `company_name`, `company_address1`, `company_address2`, `city`, `pin_no`, `company_telephone`, `company_email`, `company_website`, `mobile`, `state`, `country`, `company_logo`, `note`) VALUES
(1, 'KRSNA THE HOLISTIC SPA', 'Shop#1, Himsagar C.H.S, Plot 67 & 68, Sector 19,', 'Agarwal corner,', 'Nerul, Navi-mumbai', 400076, '2232197731', 'info@krsnaspa.com', 'www.krsnaspa.com', '8989898989', 'MAHARASHTRA', 'India', 'upload/AURA/Krsna_B_Logo.png', ''),
(2, 'OM SALON', 'CBD, Navi-Mumbai', '', 'CBD', 400000, '', 'omsalon@email.com', 'www.omsalon.com', '9876543210', 'MAHARASHTRA', 'India', '', ''),
(3, 'ABC SALON', '', '', '', 0, '', '', '', '9856237410', 'MAHARASHTRA', 'India', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `countryid` int(11) NOT NULL AUTO_INCREMENT,
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `country_name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`countryid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=243 ;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`countryid`, `country_code`, `country_name`) VALUES
(1, 'US', 'United States'),
(2, 'CA', 'Canada'),
(3, 'AF', 'Afghanistan'),
(4, 'AL', 'Albania'),
(5, 'DZ', 'Algeria'),
(6, 'DS', 'American Samoa'),
(7, 'AD', 'Andorra'),
(8, 'AO', 'Angola'),
(9, 'AI', 'Anguilla'),
(10, 'AQ', 'Antarctica'),
(11, 'AG', 'Antigua and/or Barbuda'),
(12, 'AR', 'Argentina'),
(13, 'AM', 'Armenia'),
(14, 'AW', 'Aruba'),
(15, 'AU', 'Australia'),
(16, 'AT', 'Austria'),
(17, 'AZ', 'Azerbaijan'),
(18, 'BS', 'Bahamas'),
(19, 'BH', 'Bahrain'),
(20, 'BD', 'Bangladesh'),
(21, 'BB', 'Barbados'),
(22, 'BY', 'Belarus'),
(23, 'BE', 'Belgium'),
(24, 'BZ', 'Belize'),
(25, 'BJ', 'Benin'),
(26, 'BM', 'Bermuda'),
(27, 'BT', 'Bhutan'),
(28, 'BO', 'Bolivia'),
(29, 'BA', 'Bosnia and Herzegovina'),
(30, 'BW', 'Botswana'),
(31, 'BV', 'Bouvet Island'),
(32, 'BR', 'Brazil'),
(33, 'IO', 'British lndian Ocean Territory'),
(34, 'BN', 'Brunei Darussalam'),
(35, 'BG', 'Bulgaria'),
(36, 'BF', 'Burkina Faso'),
(37, 'BI', 'Burundi'),
(38, 'KH', 'Cambodia'),
(39, 'CM', 'Cameroon'),
(40, 'CV', 'Cape Verde'),
(41, 'KY', 'Cayman Islands'),
(42, 'CF', 'Central African Republic'),
(43, 'TD', 'Chad'),
(44, 'CL', 'Chile'),
(45, 'CN', 'China'),
(46, 'CX', 'Christmas Island'),
(47, 'CC', 'Cocos (Keeling) Islands'),
(48, 'CO', 'Colombia'),
(49, 'KM', 'Comoros'),
(50, 'CG', 'Congo'),
(51, 'CK', 'Cook Islands'),
(52, 'CR', 'Costa Rica'),
(53, 'HR', 'Croatia (Hrvatska)'),
(54, 'CU', 'Cuba'),
(55, 'CY', 'Cyprus'),
(56, 'CZ', 'Czech Republic'),
(57, 'DK', 'Denmark'),
(58, 'DJ', 'Djibouti'),
(59, 'DM', 'Dominica'),
(60, 'DO', 'Dominican Republic'),
(61, 'TP', 'East Timor'),
(62, 'EC', 'Ecuador'),
(63, 'EG', 'Egypt'),
(64, 'SV', 'El Salvador'),
(65, 'GQ', 'Equatorial Guinea'),
(66, 'ER', 'Eritrea'),
(67, 'EE', 'Estonia'),
(68, 'ET', 'Ethiopia'),
(69, 'FK', 'Falkland Islands (Malvinas)'),
(70, 'FO', 'Faroe Islands'),
(71, 'FJ', 'Fiji'),
(72, 'FI', 'Finland'),
(73, 'FR', 'France'),
(74, 'FX', 'France, Metropolitan'),
(75, 'GF', 'French Guiana'),
(76, 'PF', 'French Polynesia'),
(77, 'TF', 'French Southern Territories'),
(78, 'GA', 'Gabon'),
(79, 'GM', 'Gambia'),
(80, 'GE', 'Georgia'),
(81, 'DE', 'Germany'),
(82, 'GH', 'Ghana'),
(83, 'GI', 'Gibraltar'),
(84, 'GR', 'Greece'),
(85, 'GL', 'Greenland'),
(86, 'GD', 'Grenada'),
(87, 'GP', 'Guadeloupe'),
(88, 'GU', 'Guam'),
(89, 'GT', 'Guatemala'),
(90, 'GN', 'Guinea'),
(91, 'GW', 'Guinea-Bissau'),
(92, 'GY', 'Guyana'),
(93, 'HT', 'Haiti'),
(94, 'HM', 'Heard and Mc Donald Islands'),
(95, 'HN', 'Honduras'),
(96, 'HK', 'Hong Kong'),
(97, 'HU', 'Hungary'),
(98, 'IS', 'Iceland'),
(99, 'IN', 'India'),
(100, 'ID', 'Indonesia'),
(101, 'IR', 'Iran (Islamic Republic of)'),
(102, 'IQ', 'Iraq'),
(103, 'IE', 'Ireland'),
(104, 'IL', 'Israel'),
(105, 'IT', 'Italy'),
(106, 'CI', 'Ivory Coast'),
(107, 'JM', 'Jamaica'),
(108, 'JP', 'Japan'),
(109, 'JO', 'Jordan'),
(110, 'KZ', 'Kazakhstan'),
(111, 'KE', 'Kenya'),
(112, 'KI', 'Kiribati'),
(113, 'KP', 'Korea, Democratic People''s Republic of'),
(114, 'KR', 'Korea, Republic of'),
(115, 'XK', 'Kosovo'),
(116, 'KW', 'Kuwait'),
(117, 'KG', 'Kyrgyzstan'),
(118, 'LA', 'Lao People''s Democratic Republic'),
(119, 'LV', 'Latvia'),
(120, 'LB', 'Lebanon'),
(121, 'LS', 'Lesotho'),
(122, 'LR', 'Liberia'),
(123, 'LY', 'Libyan Arab Jamahiriya'),
(124, 'LI', 'Liechtenstein'),
(125, 'LT', 'Lithuania'),
(126, 'LU', 'Luxembourg'),
(127, 'MO', 'Macau'),
(128, 'MK', 'Macedonia'),
(129, 'MG', 'Madagascar'),
(130, 'MW', 'Malawi'),
(131, 'MY', 'Malaysia'),
(132, 'MV', 'Maldives'),
(133, 'ML', 'Mali'),
(134, 'MT', 'Malta'),
(135, 'MH', 'Marshall Islands'),
(136, 'MQ', 'Martinique'),
(137, 'MR', 'Mauritania'),
(138, 'MU', 'Mauritius'),
(139, 'TY', 'Mayotte'),
(140, 'MX', 'Mexico'),
(141, 'FM', 'Micronesia, Federated States of'),
(142, 'MD', 'Moldova, Republic of'),
(143, 'MC', 'Monaco'),
(144, 'MN', 'Mongolia'),
(145, 'ME', 'Montenegro'),
(146, 'MS', 'Montserrat'),
(147, 'MA', 'Morocco'),
(148, 'MZ', 'Mozambique'),
(149, 'MM', 'Myanmar'),
(150, 'NA', 'Namibia'),
(151, 'NR', 'Nauru'),
(152, 'NP', 'Nepal'),
(153, 'NL', 'Netherlands'),
(154, 'AN', 'Netherlands Antilles'),
(155, 'NC', 'New Caledonia'),
(156, 'NZ', 'New Zealand'),
(157, 'NI', 'Nicaragua'),
(158, 'NE', 'Niger'),
(159, 'NG', 'Nigeria'),
(160, 'NU', 'Niue'),
(161, 'NF', 'Norfork Island'),
(162, 'MP', 'Northern Mariana Islands'),
(163, 'NO', 'Norway'),
(164, 'OM', 'Oman'),
(165, 'PK', 'Pakistan'),
(166, 'PW', 'Palau'),
(167, 'PA', 'Panama'),
(168, 'PG', 'Papua New Guinea'),
(169, 'PY', 'Paraguay'),
(170, 'PE', 'Peru'),
(171, 'PH', 'Philippines'),
(172, 'PN', 'Pitcairn'),
(173, 'PL', 'Poland'),
(174, 'PT', 'Portugal'),
(175, 'PR', 'Puerto Rico'),
(176, 'QA', 'Qatar'),
(177, 'RE', 'Reunion'),
(178, 'RO', 'Romania'),
(179, 'RU', 'Russian Federation'),
(180, 'RW', 'Rwanda'),
(181, 'KN', 'Saint Kitts and Nevis'),
(182, 'LC', 'Saint Lucia'),
(183, 'VC', 'Saint Vincent and the Grenadines'),
(184, 'WS', 'Samoa'),
(185, 'SM', 'San Marino'),
(186, 'ST', 'Sao Tome and Principe'),
(187, 'SA', 'Saudi Arabia'),
(188, 'SN', 'Senegal'),
(189, 'RS', 'Serbia'),
(190, 'SC', 'Seychelles'),
(191, 'SL', 'Sierra Leone'),
(192, 'SG', 'Singapore'),
(193, 'SK', 'Slovakia'),
(194, 'SI', 'Slovenia'),
(195, 'SB', 'Solomon Islands'),
(196, 'SO', 'Somalia'),
(197, 'ZA', 'South Africa'),
(198, 'GS', 'South Georgia South Sandwich Islands'),
(199, 'ES', 'Spain'),
(200, 'LK', 'Sri Lanka'),
(201, 'SH', 'St. Helena'),
(202, 'PM', 'St. Pierre and Miquelon'),
(203, 'SD', 'Sudan'),
(204, 'SR', 'Suriname'),
(205, 'SJ', 'Svalbarn and Jan Mayen Islands'),
(206, 'SZ', 'Swaziland'),
(207, 'SE', 'Sweden'),
(208, 'CH', 'Switzerland'),
(209, 'SY', 'Syrian Arab Republic'),
(210, 'TW', 'Taiwan'),
(211, 'TJ', 'Tajikistan'),
(212, 'TZ', 'Tanzania, United Republic of'),
(213, 'TH', 'Thailand'),
(214, 'TG', 'Togo'),
(215, 'TK', 'Tokelau'),
(216, 'TO', 'Tonga'),
(217, 'TT', 'Trinidad and Tobago'),
(218, 'TN', 'Tunisia'),
(219, 'TR', 'Turkey'),
(220, 'TM', 'Turkmenistan'),
(221, 'TC', 'Turks and Caicos Islands'),
(222, 'TV', 'Tuvalu'),
(223, 'UG', 'Uganda'),
(224, 'UA', 'Ukraine'),
(225, 'AE', 'United Arab Emirates'),
(226, 'GB', 'United Kingdom'),
(227, 'UM', 'United States minor outlying islands'),
(228, 'UY', 'Uruguay'),
(229, 'UZ', 'Uzbekistan'),
(230, 'VU', 'Vanuatu'),
(231, 'VA', 'Vatican City State'),
(232, 'VE', 'Venezuela'),
(233, 'VN', 'Vietnam'),
(234, 'VG', 'Virgin Islands (British)'),
(235, 'VI', 'Virgin Islands (U.S.)'),
(236, 'WF', 'Wallis and Futuna Islands'),
(237, 'EH', 'Western Sahara'),
(238, 'YE', 'Yemen'),
(239, 'YU', 'Yugoslavia'),
(240, 'ZR', 'Zaire'),
(241, 'ZM', 'Zambia'),
(242, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE IF NOT EXISTS `currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `currency` varchar(50) NOT NULL,
  `currency_value` int(11) NOT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`currency_id`, `currency`, `currency_value`) VALUES
(1, 'one', 1),
(2, 'two', 2),
(3, 'five', 5),
(4, 'ten', 10),
(5, 'twenty', 20),
(6, 'fifty', 50),
(7, 'hundred', 100),
(8, 'five hundred', 500),
(9, 'thousand', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `currency_exchange`
--

CREATE TABLE IF NOT EXISTS `currency_exchange` (
  `currency_exchange_id` int(11) NOT NULL AUTO_INCREMENT,
  `sales_id` int(11) NOT NULL,
  `cashout_id` int(11) NOT NULL,
  `cashin_id` int(11) NOT NULL,
  `cash_exchange_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `exchange_type` enum('money-in','money-out') NOT NULL,
  PRIMARY KEY (`currency_exchange_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `currency_exchange`
--

INSERT INTO `currency_exchange` (`currency_exchange_id`, `sales_id`, `cashout_id`, `cashin_id`, `cash_exchange_id`, `currency_id`, `count`, `exchange_type`) VALUES
(1, 0, 1, 0, 0, 9, 2, 'money-out'),
(2, 0, 1, 0, 0, 7, 1, 'money-out'),
(3, 0, 1, 0, 0, 6, 1, 'money-in'),
(4, 0, 2, 0, 0, 8, 1, 'money-out'),
(5, 0, 2, 0, 0, 7, 6, 'money-out'),
(6, 0, 2, 0, 0, 5, 2, 'money-in'),
(7, 0, 2, 0, 0, 4, 1, 'money-in'),
(8, 0, 0, 1, 0, 9, 2, 'money-in'),
(9, 0, 0, 1, 0, 8, 2, 'money-in'),
(10, 0, 0, 1, 0, 7, 1, 'money-in'),
(11, 26, 0, 0, 0, 7, 1, 'money-in'),
(12, 26, 0, 0, 0, 5, 1, 'money-out'),
(13, 26, 0, 0, 0, 2, 1, 'money-out'),
(14, 26, 0, 0, 0, 1, 1, 'money-out'),
(15, 0, 0, 0, 1, 7, 3, 'money-in'),
(16, 0, 0, 0, 1, 6, 6, 'money-out');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `first_name` varchar(220) DEFAULT NULL,
  `middle_name` varchar(220) NOT NULL,
  `last_name` varchar(220) NOT NULL,
  `customer_mobile` varchar(220) DEFAULT NULL,
  `customer_email` varchar(220) DEFAULT NULL,
  `customer_gender` varchar(220) DEFAULT NULL,
  `customer_dob` date DEFAULT NULL,
  `marital_status` varchar(220) DEFAULT NULL,
  `anniversary_date` date DEFAULT NULL,
  `address1` varchar(220) NOT NULL,
  `address2` varchar(220) NOT NULL,
  `city` varchar(220) NOT NULL,
  `pincode` varchar(220) NOT NULL,
  `state` varchar(220) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`customer_id`),
  KEY `customers_FKIndex1` (`company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `company_id`, `first_name`, `middle_name`, `last_name`, `customer_mobile`, `customer_email`, `customer_gender`, `customer_dob`, `marital_status`, `anniversary_date`, `address1`, `address2`, `city`, `pincode`, `state`, `created_at`, `updated_at`, `note`) VALUES
(1, 1, 'PAUL', 'CONOR', 'POL', '8989898989', 'paul@email.com', 'male', '2000-02-29', 'married', '2015-03-11', 'CBD, Navi-Mumbai', '', 'CBD', '400000', 'MAHARASHTRA', '2015-03-10 16:57:39', '2015-03-30 14:49:12', ''),
(2, 1, 'ALBERT', '', 'D', '9242424242', 'albert@email.com', 'male', '2000-02-29', 'unmarried', NULL, 'CBD, Navi-Mumbai', '', 'CBD', '400000', 'MAHARASHTRA', '2015-03-19 11:10:13', NULL, ''),
(3, 1, 'GRAHAM', '', 'WILL', '9232323232', 'graham@email.com', 'male', '2000-02-29', 'unmarried', NULL, 'CBD, Navi-Mumbai', '', 'CBD', '400000', 'MAHARASHTRA', '2015-03-19 14:38:11', NULL, ''),
(4, 1, 'YURI', '', 'STEVE', '9272727272', 'yuri@email.com', 'male', '2000-02-29', 'unmarried', '0000-00-00', 'CBD, Navi-Mumbai', '', 'CBD', '400000', 'MAHARASHTRA', '2015-04-05 11:02:46', '2015-03-30 15:19:28', ''),
(5, 1, 'NARAN', '', 'ARETHIYA', '7878787878', '', 'female', NULL, 'unmarried', NULL, '', '', '', '', 'MAHARASHTRA', '2015-03-23 20:09:53', '2015-06-03 17:42:23', ''),
(6, 1, 'CAPT.SHRI', '', 'V', '9768045205', '', 'male', NULL, 'unmarried', NULL, '', '', '', '', 'MAHARASHTRA', '2015-03-25 18:52:13', NULL, ''),
(8, 1, 'WALDO', '', '', '7878789525', '', 'male', NULL, 'unmarried', NULL, '', '', '', '', 'MAHARASHTRA', '2015-03-27 18:43:07', NULL, ''),
(9, 1, 'NININ', '', '', '4567897895', '', 'male', NULL, 'unmarried', NULL, '', '', '', '', 'MAHARASHTRA', '2015-03-27 18:47:51', NULL, ''),
(10, 1, 'NILESH', '', '', '9265636267', '', 'male', '1988-05-17', 'married', '1996-02-28', '', '', '', '', 'MAHARASHTRA', '2015-04-22 17:20:08', '2015-04-24 17:51:34', ''),
(11, 1, 'GUNESH', '', '', '7894561231', '', 'male', NULL, 'unmarried', NULL, '', '', '', '', 'MAHARASHTRA', '2015-04-22 17:20:39', NULL, ''),
(12, 1, 'DINESH', '', '', '3221456789', '', 'male', NULL, 'unmarried', NULL, '', '', '', '', 'MAHARASHTRA', '2015-04-22 17:21:19', NULL, ''),
(13, 2, 'NEELAM', '', '', '5684585245', '', 'male', NULL, 'unmarried', NULL, '', '', '', '', 'MAHARASHTRA', '2015-04-22 17:24:34', NULL, ''),
(14, 1, 'NILESH', '', '', '5612354871', '', 'male', NULL, 'unmarried', NULL, '', '', '', '', 'MAHARASHTRA', '2015-04-22 17:25:07', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `customer_balance`
--

CREATE TABLE IF NOT EXISTS `customer_balance` (
  `customer_id` int(11) NOT NULL,
  `credit` double DEFAULT '0',
  `debit` double DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_balance`
--

INSERT INTO `customer_balance` (`customer_id`, `credit`, `debit`, `updated_at`) VALUES
(1, 2228, 2228, '2015-07-02 19:20:45'),
(2, 10983, 10983, '2015-07-13 16:09:37'),
(3, 13356, 18356, '2015-05-22 15:37:33'),
(4, 2767, 2767, '2015-07-02 18:56:35'),
(5, 1815, 1815, '2015-06-03 17:44:05'),
(6, 277, 308, '2015-07-02 19:21:23'),
(8, 227, 227, '2015-07-02 19:17:12'),
(9, 168, 168, '2015-04-16 15:28:59'),
(10, 5768, 5768, '2015-04-24 15:00:51'),
(11, 150, 150, '2015-05-07 11:59:02'),
(12, 0, 0, '2015-04-22 17:21:19'),
(13, 0, 0, '2015-04-22 17:24:34'),
(14, 168, 168, '2015-04-24 19:07:30');

-- --------------------------------------------------------

--
-- Table structure for table `customer_group`
--

CREATE TABLE IF NOT EXISTS `customer_group` (
  `cg_id` int(6) NOT NULL AUTO_INCREMENT,
  `company_id` int(6) NOT NULL COMMENT 'company id',
  `branch_id` int(6) NOT NULL COMMENT 'branch id',
  `title` varchar(250) NOT NULL,
  `customer` mediumtext COMMENT 'comma separated customer',
  `note` varchar(250) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`cg_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `customer_group`
--

INSERT INTO `customer_group` (`cg_id`, `company_id`, `branch_id`, `title`, `customer`, `note`, `added_at`, `updated_at`) VALUES
(1, 1, 1, 'cust1', '1,2,3,4,8', '', '2015-05-14 11:32:53', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `customer_package`
--

CREATE TABLE IF NOT EXISTS `customer_package` (
  `package_customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`package_customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `customer_package`
--

INSERT INTO `customer_package` (`package_customer_id`, `customer_id`, `package_id`, `start_date`, `end_date`, `created_by`, `created_at`) VALUES
(1, 2, 1, '2015-05-25', '2015-08-23', 6, '2015-05-25 17:43:29'),
(2, 5, 2, '2015-06-03', '2015-07-03', 6, '2015-06-03 17:41:25'),
(3, 2, 0, '2015-07-01', '1970-01-01', 6, '2015-07-01 18:32:11'),
(4, 2, 0, '2015-07-01', '1970-01-01', 6, '2015-07-01 18:33:58'),
(6, 8, 0, '2015-07-02', '1970-01-01', 6, '2015-07-02 17:05:15'),
(7, 8, 0, '2015-07-02', '1970-01-01', 6, '2015-07-02 19:17:12'),
(8, 1, 0, '2015-07-02', '1970-01-01', 6, '2015-07-02 19:20:45'),
(9, 6, 0, '2015-07-02', '1970-01-01', 6, '2015-07-02 19:21:23'),
(10, 2, 0, '2015-07-13', '1970-01-01', 6, '2015-07-13 16:09:37');

-- --------------------------------------------------------

--
-- Table structure for table `customer_package_services`
--

CREATE TABLE IF NOT EXISTS `customer_package_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_customer_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `service_used` int(11) NOT NULL,
  `used_date` date DEFAULT NULL,
  `sales_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `customer_package_services`
--

INSERT INTO `customer_package_services` (`id`, `package_customer_id`, `package_id`, `service_id`, `service_used`, `used_date`, `sales_id`) VALUES
(1, 1, 1, 1, 1, '2015-05-25', 17),
(2, 1, 1, 4, 1, '2015-05-26', 19),
(3, 1, 1, 5, 0, NULL, 0),
(4, 2, 2, 2, 0, NULL, 0),
(5, 2, 2, 6, 1, '2015-06-03', 21);

-- --------------------------------------------------------

--
-- Table structure for table `customer_relation`
--

CREATE TABLE IF NOT EXISTS `customer_relation` (
  `customer_relation_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_customer` int(11) NOT NULL,
  `child_customer` int(11) NOT NULL,
  `relation` int(6) DEFAULT NULL,
  PRIMARY KEY (`customer_relation_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `customer_relation`
--

INSERT INTO `customer_relation` (`customer_relation_id`, `parent_customer`, `child_customer`, `relation`) VALUES
(1, 2, 4, 3),
(2, 10, 11, 5),
(3, 10, 12, 5),
(4, 10, 13, 10);

-- --------------------------------------------------------

--
-- Table structure for table `customer_transactions`
--

CREATE TABLE IF NOT EXISTS `customer_transactions` (
  `transaction_id` int(6) NOT NULL AUTO_INCREMENT,
  `customer_id` int(6) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `sales_id` int(6) DEFAULT NULL,
  `membership_id` int(11) NOT NULL,
  `particular` text NOT NULL,
  `transction_type` enum('sales_receipt','payment','invoice','membership_receipt','membership') NOT NULL COMMENT 'invoice meanse sell on credit,payment receive payment from customer,sales receipt means sell by cash, membership means take membership on credit',
  `ref_no` varchar(220) DEFAULT NULL COMMENT 'Invoice or payment id',
  `payment_type` varchar(220) DEFAULT NULL COMMENT 'Payment type',
  `amount` double DEFAULT NULL,
  `note` text,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `transaction_FKIndex2` (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

--
-- Dumping data for table `customer_transactions`
--

INSERT INTO `customer_transactions` (`transaction_id`, `customer_id`, `branch_id`, `sales_id`, `membership_id`, `particular`, `transction_type`, `ref_no`, `payment_type`, `amount`, `note`, `created_at`, `created_by`) VALUES
(1, 1, 1, NULL, 1, 'Membership fees', 'membership', 'membership no.1', 'cash', 1000, 'credit 1000', '2015-03-19 12:49:08', 6),
(2, 2, 1, NULL, 2, 'Membership fees', 'membership_receipt', 'membership no.2', 'Debit Card', 10000, '', '2015-03-19 12:51:28', 6),
(3, 1, 1, 1, 0, 'Sales receipt of no. 1', 'sales_receipt', 'sales_id1', 'Cash', 89, NULL, '2015-03-23 15:23:07', 6),
(4, 3, 1, 2, 0, 'Transaction against sales no.2', 'invoice', 'sales_id2', 'Cash', 3000, NULL, '2015-03-23 15:25:01', 6),
(5, 3, 1, 2, 0, 'Transaction against sales no.2', 'invoice', 'sales_id2', 'Store Account', 136, NULL, '2015-03-23 15:25:01', 6),
(6, 3, 1, NULL, 0, 'Bal amount for sales_id 2', 'payment', 'sales_id 2', 'Cash', 136, '', '2015-03-24 16:05:59', 6),
(7, 6, 1, 3, 0, 'Cash for invoice no.3', 'invoice', 'sales_id3', 'Cash', 200, NULL, '2015-03-25 18:52:53', 6),
(8, 6, 1, 3, 0, 'Store Account for invoice no.3', 'invoice', 'sales_id3', 'Store Account', 31, NULL, '2015-03-25 18:52:53', 6),
(9, 3, 1, NULL, 3, 'Take platinum membership of worth 15000', 'membership', 'membership no.2', 'cash', 10000, '', '2015-03-30 11:33:26', 0),
(10, 3, 1, NULL, 3, 'Take platinum membership of worth 15000', 'membership', 'membership no.2', 'Store Account', 5000, '', '2015-03-30 11:33:26', 0),
(11, 1, 1, 4, 0, 'Sales receipt of no. 4', 'sales_receipt', 'sales_id4', 'Cash', 62, NULL, '2015-04-03 15:01:30', 6),
(12, 4, 1, 5, 0, 'Cash for invoice no.5', 'invoice', 'sales_id5', 'Cash', 1000, NULL, '2015-04-04 11:05:23', 6),
(13, 4, 1, 5, 0, 'Store Account for invoice no.5', 'invoice', 'sales_id5', 'Store Account', 1497, NULL, '2015-04-04 11:05:23', 6),
(14, 9, 1, 6, 0, 'Sales receipt of no. 6', 'sales_receipt', 'sales_id6', 'Cash', 168, NULL, '2015-04-16 15:28:59', 6),
(15, 10, 1, 7, 0, 'Sales receipt of no. 7', 'sales_receipt', 'sales_id7', 'Cash', 5768, NULL, '2015-04-24 15:00:51', 6),
(16, 14, 1, 8, 0, 'Sales receipt of no. 8', 'sales_receipt', 'sales_id8', 'Cash', 168, NULL, '2015-04-24 19:07:30', 6),
(17, 5, 1, 9, 0, 'Sales receipt of no. 9', 'sales_receipt', 'sales_id9', 'Cash', 0, NULL, '2015-04-29 18:30:51', 6),
(18, 8, 1, 10, 0, 'Sales receipt of no. 10', 'sales_receipt', 'sales_id10', 'Cash', 150, NULL, '2015-05-07 11:58:40', 6),
(19, 11, 1, 11, 0, 'Sales receipt of no. 11', 'sales_receipt', 'sales_id11', 'Cash', 150, NULL, '2015-05-07 11:59:02', 6),
(20, 4, 1, 12, 0, 'Sales receipt of no. 12', 'sales_receipt', 'sales_id12', 'Cash', 135, NULL, '2015-05-07 11:59:20', 6),
(21, 4, 1, 13, 0, 'Sales receipt of no. 13', 'sales_receipt', 'sales_id13', 'Cash', 135, NULL, '2015-05-19 18:26:23', 6),
(22, 2, 1, 14, 0, 'Sales receipt of no. 14', 'sales_receipt', 'sales_id14', 'Cash', 210, NULL, '2015-05-22 15:37:05', 6),
(23, 3, 1, 15, 0, 'Sales receipt of no. 15', 'sales_receipt', 'sales_id15', 'Cash', 220, NULL, '2015-05-22 15:37:33', 6),
(24, 2, 1, 16, 0, 'Sales receipt of no. 16', 'sales_receipt', 'sales_id16', 'Cash', 363, NULL, '2015-05-25 17:43:29', 6),
(25, 2, 1, 17, 0, 'Sales receipt of no. 17', 'sales_receipt', 'sales_id17', 'Cash', 0, NULL, '2015-05-25 18:50:22', 6),
(26, 2, 1, 18, 0, 'Sales receipt of no. 18', 'sales_receipt', 'sales_id18', 'Cash', 163, NULL, '2015-05-25 18:59:14', 6),
(27, 2, 1, 19, 0, 'Sales receipt of no. 19', 'sales_receipt', 'sales_id19', 'Cash', 0, NULL, '2015-05-26 11:57:55', 6),
(28, 1, 1, NULL, 1, 'membership balance fee', 'payment', '', 'Cash', 1000, '', '2015-05-26 17:00:52', 6),
(29, 5, 1, 20, 0, 'Sales receipt of no. 20', 'sales_receipt', 'sales_id20', 'Cash', 1815, NULL, '2015-06-03 17:41:25', 6),
(30, 5, 1, 21, 0, 'Sales receipt of no. 21', 'sales_receipt', 'sales_id21', 'Cash', 0, NULL, '2015-06-03 17:44:05', 6),
(31, 4, 1, 22, 0, 'Sales receipt of no. 22', 'sales_receipt', 'sales_id22', 'Debit Card', 1647, NULL, '2015-07-02 18:56:35', 6),
(32, 8, 1, 23, 0, 'Sales receipt of no. 23', 'sales_receipt', 'sales_id23', 'Debit Card', 77, NULL, '2015-07-02 19:17:12', 6),
(33, 1, 1, 24, 0, 'Sales receipt of no. 24', 'sales_receipt', 'sales_id24', 'Debit Card', 77, NULL, '2015-07-02 19:20:45', 6),
(34, 6, 1, 25, 0, 'Sales receipt of no. 25', 'sales_receipt', 'sales_id25', 'Cash', 77, NULL, '2015-07-02 19:21:23', 6),
(35, 2, 1, 26, 0, 'Sales receipt of no. 26', 'sales_receipt', 'sales_id26', 'Cash', 77, NULL, '2015-07-13 16:09:37', 6);

-- --------------------------------------------------------

--
-- Table structure for table `day_balance`
--

CREATE TABLE IF NOT EXISTS `day_balance` (
  `bal_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `total_balance` double NOT NULL,
  `remark` text NOT NULL,
  `bal_type` varchar(220) NOT NULL,
  PRIMARY KEY (`bal_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `day_balance`
--

INSERT INTO `day_balance` (`bal_id`, `company_id`, `branch_id`, `date`, `total_balance`, `remark`, `bal_type`) VALUES
(1, 1, 1, '2015-07-10', 10000, '', 'open'),
(2, 1, 1, '2015-07-10', 7950, '', 'close'),
(3, 1, 1, '2015-07-11', 7950, '', 'open'),
(4, 1, 1, '2015-07-11', 10000, '', 'close'),
(5, 1, 1, '2015-07-12', 10000, '', 'open'),
(6, 1, 1, '2015-07-12', 10000, '', 'close'),
(7, 1, 1, '2015-07-13', 10000, '', 'open'),
(8, 1, 1, '2015-07-13', 10077, '', 'close'),
(9, 1, 1, '2015-07-14', 10077, '', 'open');

-- --------------------------------------------------------

--
-- Table structure for table `day_balance_currency`
--

CREATE TABLE IF NOT EXISTS `day_balance_currency` (
  `bal_cur_id` int(11) NOT NULL AUTO_INCREMENT,
  `bal_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`bal_cur_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=82 ;

--
-- Dumping data for table `day_balance_currency`
--

INSERT INTO `day_balance_currency` (`bal_cur_id`, `bal_id`, `currency_id`, `count`, `total`) VALUES
(1, 1, 9, 5, 5000),
(2, 1, 8, 3, 1500),
(3, 1, 7, 15, 1500),
(4, 1, 6, 30, 1500),
(5, 1, 5, 15, 300),
(6, 1, 4, 15, 150),
(7, 1, 3, 6, 30),
(8, 1, 2, 5, 10),
(9, 1, 1, 10, 10),
(10, 2, 9, 3, 3000),
(11, 2, 8, 3, 1500),
(12, 2, 7, 14, 1400),
(13, 2, 6, 31, 1550),
(14, 2, 5, 15, 300),
(15, 2, 4, 15, 150),
(16, 2, 3, 6, 30),
(17, 2, 2, 5, 10),
(18, 2, 1, 10, 10),
(19, 3, 9, 3, 3000),
(20, 3, 8, 3, 1500),
(21, 3, 7, 14, 1400),
(22, 3, 6, 31, 1550),
(23, 3, 5, 15, 300),
(24, 3, 4, 15, 150),
(25, 3, 3, 6, 30),
(26, 3, 2, 5, 10),
(27, 3, 1, 10, 10),
(28, 4, 9, 5, 5000),
(29, 4, 8, 4, 2000),
(30, 4, 7, 9, 900),
(31, 4, 6, 31, 1550),
(32, 4, 5, 17, 340),
(33, 4, 4, 16, 160),
(34, 4, 3, 6, 30),
(35, 4, 2, 5, 10),
(36, 4, 1, 10, 10),
(37, 5, 9, 5, 5000),
(38, 5, 8, 4, 2000),
(39, 5, 7, 9, 900),
(40, 5, 6, 31, 1550),
(41, 5, 5, 17, 340),
(42, 5, 4, 16, 160),
(43, 5, 3, 6, 30),
(44, 5, 2, 5, 10),
(45, 5, 1, 10, 10),
(46, 6, 9, 5, 5000),
(47, 6, 8, 4, 2000),
(48, 6, 7, 9, 900),
(49, 6, 6, 31, 1550),
(50, 6, 5, 17, 340),
(51, 6, 4, 16, 160),
(52, 6, 3, 6, 30),
(53, 6, 2, 5, 10),
(54, 6, 1, 10, 10),
(55, 7, 9, 5, 5000),
(56, 7, 8, 4, 2000),
(57, 7, 7, 9, 900),
(58, 7, 6, 31, 1550),
(59, 7, 5, 17, 340),
(60, 7, 4, 16, 160),
(61, 7, 3, 6, 30),
(62, 7, 2, 5, 10),
(63, 7, 1, 10, 10),
(64, 8, 9, 5, 5000),
(65, 8, 8, 4, 2000),
(66, 8, 7, 10, 1000),
(67, 8, 6, 31, 1550),
(68, 8, 5, 17, 320),
(69, 8, 4, 16, 160),
(70, 8, 3, 6, 30),
(71, 8, 2, 4, 8),
(72, 8, 1, 9, 9),
(73, 9, 9, 5, 5000),
(74, 9, 8, 4, 2000),
(75, 9, 7, 10, 1000),
(76, 9, 6, 31, 1550),
(77, 9, 5, 17, 320),
(78, 9, 4, 16, 160),
(79, 9, 3, 6, 30),
(80, 9, 2, 4, 8),
(81, 9, 1, 9, 9);

-- --------------------------------------------------------

--
-- Table structure for table `expense_currency`
--

CREATE TABLE IF NOT EXISTS `expense_currency` (
  `expense_currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `exid` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`expense_currency_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `expense_currency`
--

INSERT INTO `expense_currency` (`expense_currency_id`, `exid`, `currency_id`, `count`) VALUES
(1, 1, 9, 2),
(2, 1, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `expense_type`
--

CREATE TABLE IF NOT EXISTS `expense_type` (
  `extid` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `note` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`extid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `expense_type`
--

INSERT INTO `expense_type` (`extid`, `company_id`, `branch_id`, `title`, `note`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'SALARY', '', '2015-07-10 12:01:55', '0000-00-00 00:00:00', NULL),
(2, 1, 1, 'OFFICE RENT', '', '2015-07-10 12:16:58', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gift_vouchar`
--

CREATE TABLE IF NOT EXISTS `gift_vouchar` (
  `gift_vid` int(11) NOT NULL AUTO_INCREMENT,
  `giftcardno` varchar(220) NOT NULL,
  `amount` double NOT NULL,
  `expire_date` date DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `enable` enum('0','1') NOT NULL COMMENT '0 for disable, 1 for enable',
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`gift_vid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `leave_tab`
--

CREATE TABLE IF NOT EXISTS `leave_tab` (
  `leave_id` int(11) NOT NULL AUTO_INCREMENT,
  `therapist_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `leave_type` varchar(220) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`leave_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `leave_tab`
--

INSERT INTO `leave_tab` (`leave_id`, `therapist_id`, `date`, `leave_type`, `start_time`, `end_time`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 2, '2015-05-18', 'halfday', '2015-05-18 15:18:00', '2015-05-18 18:18:00', 6, '2015-05-18 19:19:24', NULL),
(2, 2, '2015-05-19', 'casualleave', '2015-05-19 00:00:00', '2015-05-21 00:00:00', 6, '2015-05-19 12:21:20', NULL),
(3, 3, '2015-05-21', 'unauthorisedleave', '2015-05-21 11:06:00', '2015-05-21 11:06:00', 6, '2015-05-21 11:07:00', NULL),
(4, 3, '2015-05-22', 'unauthorisedleave', '2015-05-22 18:47:00', '2015-05-22 18:47:00', 6, '2015-05-22 18:47:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `login_history`
--

CREATE TABLE IF NOT EXISTS `login_history` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `username` varchar(220) NOT NULL,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=133 ;

--
-- Dumping data for table `login_history`
--

INSERT INTO `login_history` (`login_id`, `users_id`, `username`, `datetime`) VALUES
(1, 6, 'john', '2015-04-03 19:00:00'),
(2, 6, 'john', '2015-04-04 10:00:00'),
(3, 6, 'john', '2015-04-04 10:00:00'),
(4, 7, 'waldo', '2015-04-04 14:00:00'),
(5, 7, 'waldo', '2015-04-04 14:00:00'),
(6, 6, 'john', '2015-04-06 11:00:00'),
(7, 6, 'john', '2015-04-06 12:00:00'),
(8, 7, 'waldo', '2015-04-06 12:00:00'),
(9, 7, 'waldo', '2015-04-06 16:00:00'),
(10, 7, 'waldo', '2015-04-06 16:00:00'),
(11, 7, 'waldo', '2015-04-06 16:00:00'),
(12, 6, 'john', '2015-04-07 10:00:00'),
(13, 6, 'john', '2015-04-07 10:00:00'),
(14, 6, 'john', '2015-04-07 10:00:00'),
(15, 6, 'john', '2015-04-07 13:00:00'),
(16, 6, 'john', '2015-04-07 13:00:00'),
(17, 6, 'john', '2015-04-07 14:00:00'),
(18, 6, 'john', '2015-04-07 14:00:00'),
(19, 5, 'admin', '2015-04-07 17:00:00'),
(20, 6, 'john', '2015-04-07 17:00:00'),
(21, 6, 'john', '2015-04-07 18:00:00'),
(22, 6, 'john', '2015-04-13 14:00:00'),
(23, 6, 'john', '2015-04-13 18:00:00'),
(24, 6, 'john', '2015-04-13 20:00:00'),
(25, 6, 'john', '2015-04-14 10:00:00'),
(26, 6, 'john', '2015-04-15 10:00:00'),
(27, 6, 'john', '2015-04-15 11:00:00'),
(28, 6, 'john', '2015-04-15 12:00:00'),
(29, 6, 'john', '2015-04-15 12:00:00'),
(30, 6, 'john', '2015-04-15 12:00:00'),
(31, 6, 'john', '2015-04-15 15:00:00'),
(32, 6, 'john', '2015-04-16 10:00:00'),
(33, 6, 'john', '2015-04-16 18:00:00'),
(34, 6, 'john', '2015-04-16 19:00:00'),
(35, 6, 'john', '2015-04-17 10:00:00'),
(36, 6, 'john', '2015-04-17 10:00:00'),
(37, 6, 'john', '2015-04-18 10:00:00'),
(38, 6, 'john', '2015-04-18 11:00:00'),
(39, 6, 'john', '2015-04-18 13:00:00'),
(40, 6, 'john', '2015-04-18 15:00:00'),
(41, 6, 'john', '2015-04-21 11:00:00'),
(42, 6, 'john', '2015-04-22 17:00:00'),
(43, 6, 'john', '2015-04-22 18:00:00'),
(44, 6, 'john', '2015-04-24 14:00:00'),
(45, 6, 'john', '2015-04-24 15:00:00'),
(46, 6, 'john', '2015-04-24 16:00:00'),
(47, 6, 'john', '2015-04-24 17:00:00'),
(48, 6, 'john', '2015-04-24 18:00:00'),
(49, 6, 'john', '2015-04-25 09:00:00'),
(50, 6, 'john', '2015-04-25 14:00:00'),
(51, 6, 'john', '2015-04-25 16:00:00'),
(52, 6, 'john', '2015-04-25 18:00:00'),
(53, 6, 'john', '2015-04-27 10:00:00'),
(54, 5, 'admin', '2015-04-27 13:00:00'),
(55, 6, 'john', '2015-04-27 13:00:00'),
(56, 5, 'admin', '2015-04-27 16:00:00'),
(57, 6, 'john', '2015-04-27 16:00:00'),
(58, 6, 'john', '2015-04-28 11:00:00'),
(59, 6, 'john', '2015-04-29 17:00:00'),
(60, 6, 'john', '2015-04-29 18:00:00'),
(61, 6, 'john', '2015-05-04 10:00:00'),
(62, 6, 'john', '2015-05-04 12:00:00'),
(63, 6, 'john', '2015-05-04 16:00:00'),
(64, 6, 'john', '2015-05-06 19:00:00'),
(65, 6, 'john', '2015-05-07 10:00:00'),
(66, 6, 'john', '2015-05-07 14:00:00'),
(67, 6, 'john', '2015-05-09 11:00:00'),
(68, 6, 'john', '2015-05-14 14:00:00'),
(69, 6, 'john', '2015-05-14 14:00:00'),
(70, 5, 'admin', '2015-05-14 15:00:00'),
(71, 6, 'john', '2015-05-14 16:00:00'),
(72, 6, 'john', '2015-05-15 10:00:00'),
(73, 6, 'john', '2015-05-18 10:00:00'),
(74, 5, 'admin', '2015-05-18 10:00:00'),
(75, 6, 'john', '2015-05-18 10:00:00'),
(76, 5, 'admin', '2015-05-18 11:00:00'),
(77, 6, 'john', '2015-05-18 13:00:00'),
(78, 5, 'admin', '2015-05-18 14:00:00'),
(79, 5, 'admin', '2015-05-18 15:00:00'),
(80, 6, 'john', '2015-05-18 15:00:00'),
(81, 6, 'john', '2015-05-19 10:00:00'),
(82, 6, 'john', '2015-05-20 10:00:00'),
(83, 5, 'admin', '2015-05-20 10:00:00'),
(84, 7, 'waldo', '2015-05-20 10:00:00'),
(85, 8, 'waldo1', '2015-05-20 10:00:00'),
(86, 5, 'admin', '2015-05-20 11:00:00'),
(87, 5, 'admin', '2015-05-20 16:00:00'),
(88, 6, 'john', '2015-05-20 16:00:00'),
(89, 6, 'john', '2015-05-21 10:00:00'),
(90, 6, 'john', '2015-05-22 12:00:00'),
(91, 6, 'john', '2015-05-22 14:00:00'),
(92, 7, 'waldo', '2015-05-22 14:00:00'),
(93, 6, 'john', '2015-05-22 15:00:00'),
(94, 6, 'john', '2015-05-25 09:00:00'),
(95, 6, 'john', '2015-05-26 10:00:00'),
(96, 6, 'john', '2015-05-26 11:00:00'),
(97, 7, 'waldo', '2015-05-26 17:00:00'),
(98, 5, 'admin', '2015-05-26 17:00:00'),
(99, 7, 'waldo', '2015-05-26 17:00:00'),
(100, 7, 'waldo', '2015-05-26 18:00:00'),
(101, 6, 'john', '2015-05-26 18:00:00'),
(102, 5, 'admin', '2015-05-26 18:00:00'),
(103, 5, 'admin', '2015-05-26 18:00:00'),
(104, 6, 'john', '2015-05-26 19:00:00'),
(105, 6, 'john', '2015-05-30 17:00:00'),
(106, 6, 'john', '2015-06-03 17:00:00'),
(107, 7, 'waldo', '2015-06-03 17:00:00'),
(108, 6, 'john', '2015-06-03 17:00:00'),
(109, 6, 'john', '2015-06-03 17:00:00'),
(110, 6, 'john', '2015-06-03 18:00:00'),
(111, 6, 'john', '2015-06-27 18:00:00'),
(112, 6, 'john', '2015-06-30 13:00:00'),
(113, 6, 'john', '2015-06-30 13:00:00'),
(114, 5, 'admin', '2015-06-30 14:00:00'),
(115, 6, 'john', '2015-06-30 14:00:00'),
(116, 6, 'john', '2015-06-30 17:00:00'),
(117, 6, 'john', '2015-07-01 16:00:00'),
(118, 6, 'john', '2015-07-02 11:00:00'),
(119, 6, 'john', '2015-07-02 17:00:00'),
(120, 6, 'john', '2015-07-08 13:00:00'),
(121, 6, 'john', '2015-07-09 17:00:00'),
(122, 6, 'john', '2015-07-10 11:00:00'),
(123, 7, 'waldo', '2015-07-10 12:00:00'),
(124, 7, 'waldo', '2015-07-10 17:00:00'),
(125, 6, 'john', '2015-07-11 09:00:00'),
(126, 6, 'john', '2015-07-11 17:00:00'),
(127, 6, 'john', '2015-07-13 13:00:00'),
(128, 6, 'john', '2015-07-13 18:00:00'),
(129, 6, 'john', '2015-07-13 18:00:00'),
(130, 6, 'john', '2015-07-14 10:00:00'),
(131, 6, 'john', '2015-07-17 16:00:00'),
(132, 6, 'john', '2015-07-23 14:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `measurement_unit`
--

CREATE TABLE IF NOT EXISTS `measurement_unit` (
  `measurement_unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `measurement_unit` varchar(220) NOT NULL,
  `note` text NOT NULL,
  PRIMARY KEY (`measurement_unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

CREATE TABLE IF NOT EXISTS `membership` (
  `membership_id` int(6) NOT NULL AUTO_INCREMENT,
  `membership_type_id` int(6) NOT NULL,
  `customer_id` int(6) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`membership_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `membership`
--

INSERT INTO `membership` (`membership_id`, `membership_type_id`, `customer_id`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2015-03-10', '2015-04-10', '2015-03-19 12:49:08', NULL),
(2, 3, 2, '2015-03-15', '2015-08-15', '2015-03-19 12:51:28', NULL),
(3, 2, 3, '2015-03-01', '2016-02-29', '2015-03-30 11:33:26', NULL),
(4, 0, 8, '2015-07-02', '2015-08-01', '2015-07-02 19:17:12', NULL),
(5, 0, 1, '2015-07-02', '2015-08-01', '2015-07-02 19:20:45', NULL),
(6, 0, 6, '2015-07-02', '2015-08-01', '2015-07-02 19:21:23', NULL),
(7, 0, 2, '2015-07-13', '2015-08-12', '2015-07-13 16:09:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `membership_renew`
--

CREATE TABLE IF NOT EXISTS `membership_renew` (
  `membership_renew_id` int(11) NOT NULL AUTO_INCREMENT,
  `membership_id` int(11) NOT NULL,
  `membership_type_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `discount_rate` double NOT NULL,
  `discount_amount` double NOT NULL,
  `final_amount` double NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `note` text NOT NULL,
  PRIMARY KEY (`membership_renew_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `membership_type`
--

CREATE TABLE IF NOT EXISTS `membership_type` (
  `membership_type_id` int(6) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `title` varchar(220) DEFAULT NULL,
  `price` int(6) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL COMMENT 'in days',
  `price_percentage` int(11) NOT NULL,
  `percentage` int(11) NOT NULL,
  `description` text NOT NULL,
  `note` text NOT NULL,
  `disabled` int(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`membership_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `membership_type`
--

INSERT INTO `membership_type` (`membership_type_id`, `company_id`, `branch_id`, `title`, `price`, `duration`, `price_percentage`, `percentage`, `description`, `note`, `disabled`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'BASIC', 2000, 30, 1, 10, 'basic', '', 1, '2015-05-15 13:28:26', NULL),
(2, 1, 1, 'PLATINUM', 15000, 365, 1, 10, '', '', 1, '2015-05-15 13:29:19', NULL),
(3, 1, 1, 'GOLD', 10000, 180, 1, 10, '', '', 1, '2015-05-15 13:29:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE IF NOT EXISTS `module` (
  `module_id` int(11) NOT NULL,
  `module_title` varchar(200) NOT NULL,
  `module_sort` int(3) NOT NULL,
  `module_note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE IF NOT EXISTS `package` (
  `package_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL COMMENT '''0'' the used in all branches else used only in selected branch',
  `package_title` varchar(220) NOT NULL,
  `package_amount` int(11) NOT NULL,
  `package_duration` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`package_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`package_id`, `company_id`, `branch_id`, `package_title`, `package_amount`, `package_duration`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 'HAIR PACKAGE', 300, 90, '2015-05-25 13:31:06', '2015-05-25 16:58:37'),
(2, 1, 0, 'NARAN SPECIAL', 1500, 30, '2015-06-03 17:33:22', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `package_services`
--

CREATE TABLE IF NOT EXISTS `package_services` (
  `package_service_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `services_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  PRIMARY KEY (`package_service_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `package_services`
--

INSERT INTO `package_services` (`package_service_id`, `company_id`, `branch_id`, `services_id`, `package_id`) VALUES
(1, 1, 0, 1, 1),
(2, 1, 0, 4, 1),
(3, 1, 0, 5, 1),
(4, 1, 0, 2, 2),
(5, 1, 0, 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `payment_type`
--

CREATE TABLE IF NOT EXISTS `payment_type` (
  `payment_type_id` int(2) NOT NULL,
  `payment_type_title` varchar(50) NOT NULL,
  `note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_type`
--

INSERT INTO `payment_type` (`payment_type_id`, `payment_type_title`, `note`) VALUES
(1, 'Cash', ''),
(2, 'Debit Card', ''),
(3, 'Credit Card', ''),
(4, 'Cheque', ''),
(5, 'Store Account', '');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(6) NOT NULL AUTO_INCREMENT,
  `company_id` int(6) NOT NULL,
  `product_category_id` int(11) NOT NULL,
  `product_subcategory_id` int(11) NOT NULL,
  `product_title` varchar(220) DEFAULT NULL,
  `product_code` varchar(220) DEFAULT NULL,
  `product_barcode` varchar(220) DEFAULT NULL,
  `product_cost` int(11) DEFAULT NULL,
  `product_price` int(11) DEFAULT NULL COMMENT 'Selling price',
  `order_level` int(11) DEFAULT NULL,
  `measure_unit` varchar(100) DEFAULT NULL,
  `volume` int(11) NOT NULL,
  `volume_unit` varchar(100) NOT NULL,
  `ava_volume` int(6) NOT NULL,
  `service_product` int(11) DEFAULT NULL COMMENT '1 if product will use in service only and 0 for for sell only',
  `sell_product` int(11) NOT NULL,
  `product_note` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `product_FKIndex1` (`company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `company_id`, `product_category_id`, `product_subcategory_id`, `product_title`, `product_code`, `product_barcode`, `product_cost`, `product_price`, `order_level`, `measure_unit`, `volume`, `volume_unit`, `ava_volume`, `service_product`, `sell_product`, `product_note`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'GARNIER OIL CARE', 'GF1', 'EIKILO1123', 70, 85, 1, 'PCS', 60, 'ML', 0, 0, 1, '', '2015-03-11 15:29:38', '2015-03-30 11:52:49'),
(2, 1, 2, 2, 'SUNSILK PINK 230 ML', 'SS1', '', 56, 60, 1, 'PCS', 230, 'ML', 0, 0, 1, '', '2015-03-11 18:45:10', NULL),
(3, 1, 1, 1, 'NIVEA FASE WASH', '', '', 75, 75, 10, 'PCS', 10, 'PCS', 0, 0, 1, '', '2015-04-14 14:21:30', '2015-04-14 15:37:43'),
(4, 1, 1, 3, 'Nivea Advance Whitening ', '', '', 71, 71, 10, 'PCS', 50, 'ML', 0, 0, 1, 'for dry skin', '2015-04-15 19:20:25', '0000-00-00 00:00:00'),
(5, 1, 1, 1, 'NIVEA ADVANCE WHITENING SERVICE PRODUCT', '', '', 71, 0, 5, 'PCS', 50, 'ML', 0, 1, 0, '', '2015-04-17 16:57:15', '2015-04-17 16:58:28'),
(6, 1, 2, 5, 'GARNIER FRUCTIS TRIPLE NUTRITION SHAMPOO', '', '', 135, 135, 10, 'PCS', 100, 'ML', 0, 0, 1, '', '2015-04-27 15:20:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE IF NOT EXISTS `product_category` (
  `product_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `product_category_code` varchar(200) NOT NULL,
  `product_category_title` varchar(200) NOT NULL,
  `product_category_note` text NOT NULL,
  PRIMARY KEY (`product_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`product_category_id`, `company_id`, `product_category_code`, `product_category_title`, `product_category_note`) VALUES
(1, 1, 'Pr1', 'FACE WASH', ''),
(2, 1, 'Pr2', 'SAMPOO', '');

-- --------------------------------------------------------

--
-- Table structure for table `product_category1`
--

CREATE TABLE IF NOT EXISTS `product_category1` (
  `product_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `product_category_code` varchar(200) NOT NULL,
  `product_category_title` varchar(200) NOT NULL,
  `product_category_note` text NOT NULL,
  PRIMARY KEY (`product_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `product_category1`
--

INSERT INTO `product_category1` (`product_category_id`, `company_id`, `product_category_code`, `product_category_title`, `product_category_note`) VALUES
(1, 1, 'Pr1', 'FACE WASH', ''),
(2, 1, 'Pr2', 'SAMPOO', '');

-- --------------------------------------------------------

--
-- Table structure for table `product_subcategory`
--

CREATE TABLE IF NOT EXISTS `product_subcategory` (
  `product_subcategory_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_category_id` int(11) NOT NULL,
  `product_subcategory_code` varchar(200) NOT NULL,
  `product_subcategory_title` varchar(200) NOT NULL,
  `product_subcategory_note` text NOT NULL,
  PRIMARY KEY (`product_subcategory_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `product_subcategory`
--

INSERT INTO `product_subcategory` (`product_subcategory_id`, `product_category_id`, `product_subcategory_code`, `product_subcategory_title`, `product_subcategory_note`) VALUES
(1, 1, 'Prs1', 'OILCARE', 'for oily skin'),
(2, 2, 'Prs2', 'SUNSILK PINK', 'Smooth hair'),
(3, 1, 'Prs3', ' Skin Naturals Gentle', 'for dry skin'),
(4, 1, 'Prs4', ' Acno Face Wash ', 'pimple skin'),
(5, 2, 'Prs5', 'NUTRITION SHAMPOO', '');

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE IF NOT EXISTS `purchase` (
  `purchase_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `vender_id` int(6) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `invoice_number` varchar(220) NOT NULL,
  `invoice_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`purchase_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`purchase_id`, `company_id`, `branch_id`, `vender_id`, `amount`, `invoice_number`, `invoice_date`, `created_at`, `created_by`, `updated_at`) VALUES
(1, 1, 1, 1, 6000, '1', NULL, '2015-03-20 12:02:53', 6, '0000-00-00 00:00:00'),
(2, 1, 1, 0, 2080, '2', NULL, '2015-03-23 17:13:41', 6, '0000-00-00 00:00:00'),
(3, 1, 1, 1, 3500, '3', '2015-04-15', '2015-04-15 12:34:58', 6, '0000-00-00 00:00:00'),
(4, 1, 1, 3, 13500, '10023', '2015-04-27', '2015-04-27 15:24:05', 6, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_item`
--

CREATE TABLE IF NOT EXISTS `purchase_item` (
  `purchase_item_id` int(6) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(6) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(6) DEFAULT NULL,
  `rate` int(6) DEFAULT NULL,
  `selling_price` double DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `old_stock` int(11) DEFAULT NULL,
  `new_stock` int(11) DEFAULT NULL,
  PRIMARY KEY (`purchase_item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `purchase_item`
--

INSERT INTO `purchase_item` (`purchase_item_id`, `purchase_id`, `product_id`, `quantity`, `rate`, `selling_price`, `total_amount`, `old_stock`, `new_stock`) VALUES
(1, 1, 1, 40, 80, 85, 3200, 0, 40),
(2, 1, 2, 50, 56, 60, 2800, 0, 50),
(3, 2, 1, 26, 80, 85, 2080, 40, 66),
(4, 3, 1, 50, 70, 85, 3500, 150, 200),
(5, 4, 6, 100, 135, 135, 13500, 0, 100);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_return`
--

CREATE TABLE IF NOT EXISTS `purchase_return` (
  `purchase_return` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `rate` double NOT NULL,
  `total_amount` double NOT NULL,
  `invoice_number` varchar(220) NOT NULL,
  `old_stock` int(11) DEFAULT NULL,
  `new_stock` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`purchase_return`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `purchase_return`
--

INSERT INTO `purchase_return` (`purchase_return`, `company_id`, `branch_id`, `vendor_id`, `product_id`, `quantity`, `rate`, `total_amount`, `invoice_number`, `old_stock`, `new_stock`, `created_at`, `updated_at`, `created_by`) VALUES
(1, 1, 1, 1, 1, 25, 80, 2000, '1', 66, 41, '2015-03-20 12:29:01', '0000-00-00 00:00:00', 6);

-- --------------------------------------------------------

--
-- Table structure for table `relation`
--

CREATE TABLE IF NOT EXISTS `relation` (
  `relation_id` int(11) NOT NULL,
  `relation_title` varchar(220) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `relation`
--

INSERT INTO `relation` (`relation_id`, `relation_title`) VALUES
(1, 'Father'),
(2, 'Mother'),
(3, 'Son'),
(4, 'Daughter'),
(5, 'Brother'),
(6, 'Sister'),
(7, 'Uncle'),
(8, 'Auntie'),
(9, 'Husband'),
(10, 'Wife');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE IF NOT EXISTS `sales` (
  `sales_id` int(6) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `customer_id` int(6) NOT NULL,
  `appointment_id` int(6) NOT NULL,
  `invoice_number` varchar(50) NOT NULL,
  `total_amount` int(6) DEFAULT NULL,
  `discount_rate` int(6) DEFAULT NULL,
  `discount_amount` int(6) DEFAULT NULL,
  `final_amount` int(6) NOT NULL,
  `tax` varchar(10) NOT NULL,
  `tax_amount` int(11) DEFAULT NULL,
  `payment_status` varchar(220) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL COMMENT 'user id',
  PRIMARY KEY (`sales_id`),
  KEY `sales_FKIndex2` (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sales_id`, `company_id`, `branch_id`, `customer_id`, `appointment_id`, `invoice_number`, `total_amount`, `discount_rate`, `discount_amount`, `final_amount`, `tax`, `tax_amount`, `payment_status`, `created_at`, `created_by`) VALUES
(1, 1, 1, 1, 0, 'inv/1', 80, 0, 0, 89, '12', 9, 'Paid', '2015-03-23 15:23:07', 6),
(2, 1, 1, 3, 0, 'inv/2', 2800, 0, 0, 3136, '12', 336, 'Pending', '2015-03-23 15:25:01', 6),
(3, 1, 1, 6, 0, 'inv/3', 230, 10, 23, 231, '12', 24, 'Pending', '2015-03-25 18:52:53', 6),
(4, 1, 1, 1, 0, 'inv/4', 56, 0, NULL, 62, '12', 6, 'Paid', '2015-04-03 15:01:30', 6),
(5, 1, 1, 4, 5, 'inv/5', 2230, 0, NULL, 2497, '12', 267, 'Store Account', '2015-04-05 11:05:23', 6),
(6, 1, 1, 9, 6, 'inv/6', 150, 0, NULL, 168, '', 18, 'Paid', '2015-04-16 15:28:59', 6),
(7, 1, 1, 10, 9, 'inv/7', 5150, 0, NULL, 5768, '', 618, 'Paid', '2015-04-24 15:00:51', 6),
(8, 1, 1, 14, 10, 'inv/8', 150, 0, NULL, 168, '', 18, 'Paid', '2015-04-24 19:07:30', 6),
(9, 1, 1, 5, 0, 'inv/9', 70, 100, 70, 0, '', 0, 'Paid', '2015-04-29 18:30:51', 6),
(10, 1, 1, 8, 16, 'inv/10', 150, 0, NULL, 150, '', 0, 'Paid', '2015-05-07 11:58:40', 6),
(11, 1, 1, 11, 15, 'inv/11', 150, 0, NULL, 150, '', 0, 'Paid', '2015-05-07 11:59:02', 6),
(12, 1, 1, 4, 14, 'inv/12', 135, 0, NULL, 135, '', 0, 'Paid', '2015-05-07 11:59:20', 6),
(13, 1, 1, 4, 17, 'inv/13', 135, 0, NULL, 135, '', 0, 'Paid', '2015-05-19 18:26:23', 6),
(14, 1, 1, 2, 19, 'inv/14', 210, 0, NULL, 210, '', 0, 'Paid', '2015-05-22 15:37:05', 6),
(15, 1, 1, 3, 18, 'inv/15', 220, 0, NULL, 220, '', 0, 'Paid', '2015-05-22 15:37:33', 6),
(16, 1, 1, 2, 0, 'inv/16', 300, 0, NULL, 360, '', 60, 'Paid', '2015-05-25 17:43:29', 6),
(17, 1, 1, 2, 20, 'inv/17', 135, 0, NULL, 0, '', 0, 'Paid', '2015-05-25 18:50:22', 6),
(18, 1, 1, 2, 21, 'inv/18', 135, 0, NULL, 162, '', 27, 'Paid', '2015-05-25 18:59:14', 6),
(19, 1, 1, 2, 22, 'inv/19', 0, 0, NULL, 0, '', 0, 'Paid', '2015-05-26 11:57:55', 6),
(20, 1, 1, 5, 0, 'inv/20', 1500, 0, NULL, 1800, '', 300, 'Paid', '2015-06-03 17:41:25', 6),
(21, 1, 1, 5, 23, 'inv/21', 0, 0, NULL, 0, '', 0, 'Paid', '2015-06-03 17:44:05', 6),
(22, 1, 1, 4, 0, 'inv/22', 1497, 0, NULL, 1647, '', 150, 'Paid', '2015-07-02 18:56:35', 6),
(23, 1, 1, 8, 0, 'inv/23', 70, 0, NULL, 77, '', 7, 'Paid', '2015-07-02 19:17:12', 6),
(24, 1, 1, 1, 0, 'inv/24', 70, 0, NULL, 77, '', 7, 'Paid', '2015-07-02 19:20:45', 6),
(25, 1, 1, 6, 0, 'inv/25', 70, 0, NULL, 77, '', 7, 'Paid', '2015-07-02 19:21:23', 6),
(26, 1, 1, 2, 0, 'inv/26', 70, 0, NULL, 77, '', 7, 'Paid', '2015-07-13 16:09:37', 6);

-- --------------------------------------------------------

--
-- Table structure for table `sales_item`
--

CREATE TABLE IF NOT EXISTS `sales_item` (
  `sales_item_id` int(6) NOT NULL AUTO_INCREMENT,
  `sales_id` int(6) NOT NULL,
  `company_id` int(6) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `services_id` int(6) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `membership_id` int(11) DEFAULT NULL,
  `is_payment` int(11) DEFAULT NULL,
  `particular` text,
  `price` int(6) DEFAULT NULL COMMENT 'each unit price',
  `quantity` int(6) DEFAULT NULL,
  `discount_rate` int(2) NOT NULL,
  `discount_amount` double NOT NULL,
  `actual_amount` double NOT NULL COMMENT 'actual price * quantity',
  `amount` int(6) DEFAULT NULL COMMENT 'quantity*rate-discount',
  PRIMARY KEY (`sales_item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `sales_item`
--

INSERT INTO `sales_item` (`sales_item_id`, `sales_id`, `company_id`, `product_id`, `services_id`, `package_id`, `membership_id`, `is_payment`, `particular`, `price`, `quantity`, `discount_rate`, `discount_amount`, `actual_amount`, `amount`) VALUES
(1, 1, 1, 1, 0, 0, NULL, NULL, NULL, 80, 1, 0, 0, 0, 80),
(2, 2, 1, 2, 0, 0, NULL, NULL, NULL, 56, 50, 0, 0, 0, 2800),
(3, 3, 1, 1, 0, 0, NULL, NULL, NULL, 80, 1, 0, 0, 0, 80),
(4, 3, 1, 0, 1, 0, NULL, NULL, NULL, 150, 1, 0, 0, 0, 150),
(5, 4, 1, 2, 0, 0, NULL, NULL, NULL, 56, 1, 0, 0, 0, 56),
(6, 5, 1, 0, 1, 0, NULL, NULL, NULL, 150, 1, 0, 0, 0, 150),
(7, 5, 1, 0, 2, 0, NULL, NULL, NULL, 2000, 1, 0, 0, 0, 2000),
(8, 5, 1, 1, 0, 0, NULL, NULL, NULL, 80, 1, 0, 0, 0, 80),
(9, 6, 1, 0, 1, 0, NULL, NULL, NULL, 150, 1, 0, 0, 0, 150),
(10, 7, 1, 0, 1, 0, NULL, NULL, NULL, 150, 1, 0, 0, 0, 150),
(11, 7, 1, 0, 3, 0, NULL, NULL, NULL, 5000, 1, 0, 0, 0, 5000),
(12, 8, 1, 0, 1, 0, NULL, NULL, NULL, 150, 1, 0, 0, 0, 150),
(13, 9, 1, 1, 0, 0, NULL, NULL, NULL, 70, 1, 0, 0, 0, 70),
(14, 10, 1, 0, 1, 0, NULL, NULL, NULL, 150, 1, 0, 0, 0, 150),
(15, 11, 1, 0, 1, 0, NULL, NULL, NULL, 150, 1, 0, 0, 0, 150),
(16, 12, 1, 0, 1, 0, NULL, NULL, NULL, 135, 1, 0, 0, 0, 135),
(17, 13, 1, 0, 1, 0, NULL, NULL, NULL, 135, 1, 0, 0, 0, 135),
(18, 14, 1, 0, 1, 0, NULL, NULL, NULL, 135, 1, 0, 0, 150, 135),
(19, 14, 1, 0, 4, 0, NULL, NULL, NULL, 75, 1, 0, 0, 100, 75),
(20, 15, 1, 0, 1, 0, NULL, NULL, NULL, 140, 1, 0, 0, 150, 140),
(21, 15, 1, 0, 4, 0, NULL, NULL, NULL, 80, 1, 0, 0, 100, 80),
(22, 16, 1, 0, 0, 1, NULL, NULL, NULL, 300, 1, 0, 0, 0, 300),
(23, 17, 1, 0, 1, 1, NULL, NULL, NULL, 0, 1, 0, 0, 150, 0),
(24, 18, 1, 0, 1, 1, NULL, NULL, NULL, 135, 1, 0, 0, 150, 135),
(25, 19, 1, 0, 4, 1, NULL, NULL, NULL, 0, 1, 0, 0, 100, 0),
(26, 20, 1, 0, 0, 2, NULL, NULL, NULL, 1500, 1, 0, 0, 0, 1500),
(27, 21, 1, 0, 6, 2, NULL, NULL, NULL, 0, 1, 0, 0, 200, 0),
(28, 22, 1, NULL, NULL, NULL, NULL, 1, 'Remaining balance of Rs. 1497', 1497, 1, 0, 0, 0, 1497),
(29, 23, 1, 1, 0, NULL, 0, NULL, NULL, 70, 1, 0, 0, 0, 70),
(30, 24, 1, 1, 0, NULL, 0, NULL, NULL, 70, 1, 0, 0, 0, 70),
(31, 25, 1, 1, 0, NULL, 0, NULL, NULL, 70, 1, 0, 0, 0, 70),
(32, 26, 1, 1, 0, 1, 0, NULL, NULL, 70, 1, 0, 0, 0, 70);

-- --------------------------------------------------------

--
-- Table structure for table `sales_tax`
--

CREATE TABLE IF NOT EXISTS `sales_tax` (
  `sales_tax_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `tax_rate` int(11) NOT NULL,
  `tax_amount` int(11) NOT NULL,
  PRIMARY KEY (`sales_tax_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `sales_tax`
--

INSERT INTO `sales_tax` (`sales_tax_id`, `tax_id`, `sales_id`, `tax_rate`, `tax_amount`) VALUES
(1, 1, 6, 12, 18),
(2, 1, 7, 12, 618),
(3, 1, 8, 12, 18),
(4, 1, 9, 12, 0),
(5, 1, 16, 10, 30),
(6, 2, 16, 10, 30),
(7, 1, 17, 10, 0),
(8, 2, 17, 10, 0),
(9, 1, 18, 10, 14),
(10, 2, 18, 10, 14),
(11, 1, 19, 10, 0),
(12, 2, 19, 10, 0),
(13, 1, 20, 10, 150),
(14, 2, 20, 10, 150),
(15, 1, 21, 10, 0),
(16, 2, 21, 10, 0),
(17, 1, 22, 10, 150),
(18, 1, 23, 10, 7),
(19, 1, 24, 10, 7),
(20, 1, 25, 10, 7),
(21, 1, 26, 10, 7);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE IF NOT EXISTS `services` (
  `services_id` int(6) NOT NULL AUTO_INCREMENT,
  `company_id` int(6) NOT NULL,
  `service_category_id` int(6) NOT NULL,
  `service_subcategory_id` int(6) NOT NULL,
  `gender` varchar(25) NOT NULL,
  `service_title` varchar(220) DEFAULT NULL,
  `service_code` varchar(220) DEFAULT NULL,
  `service_duration` int(6) DEFAULT NULL,
  `visite_frequency` int(6) DEFAULT NULL,
  `cost_to_center` int(6) NOT NULL,
  `service_note` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`services_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`services_id`, `company_id`, `service_category_id`, `service_subcategory_id`, `gender`, `service_title`, `service_code`, `service_duration`, `visite_frequency`, `cost_to_center`, `service_note`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'male', 'HAIR CUTTING', 'HCS1', 50, 30, 150, '', '2015-03-12 13:54:43', '2015-05-18 15:50:12'),
(2, 1, 2, 1, 'female', 'HAIR COLOR', 'HCS2', 120, 180, 2000, '', '2015-03-12 18:08:38', '2015-03-12 18:46:11'),
(3, 1, 3, 3, 'male', 'HAIR PLANTATION', 'HCS3', 120, 365, 5000, '', '2015-03-13 09:57:20', '2015-04-27 12:35:39'),
(4, 1, 4, 0, 'male', 'SHAVING', '', 30, 15, 100, '', '2015-05-15 12:41:29', '0000-00-00 00:00:00'),
(5, 1, 4, 0, 'male', 'SPECIAL SAVING', '', 30, 15, 150, '', '2015-05-15 13:04:21', '0000-00-00 00:00:00'),
(6, 1, 4, 0, 'female', 'HAIR CUT', '', 60, 60, 200, '', '2015-05-15 13:32:31', '2015-05-15 13:33:16');

-- --------------------------------------------------------

--
-- Table structure for table `services_has_therapist`
--

CREATE TABLE IF NOT EXISTS `services_has_therapist` (
  `service_theropist_id` int(6) NOT NULL AUTO_INCREMENT,
  `company_id` int(6) NOT NULL,
  `branch_id` int(6) NOT NULL,
  `services_id` int(6) NOT NULL,
  `therapist_id` int(6) NOT NULL,
  PRIMARY KEY (`service_theropist_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `services_has_therapist`
--

INSERT INTO `services_has_therapist` (`service_theropist_id`, `company_id`, `branch_id`, `services_id`, `therapist_id`) VALUES
(1, 1, 1, 1, 1),
(3, 1, 1, 2, 2),
(4, 1, 1, 1, 2),
(5, 1, 1, 3, 1),
(6, 1, 1, 4, 1),
(7, 1, 1, 6, 1),
(8, 1, 1, 4, 3),
(9, 1, 1, 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `services_product`
--

CREATE TABLE IF NOT EXISTS `services_product` (
  `services_product_id` int(6) NOT NULL AUTO_INCREMENT,
  `company_id` int(6) NOT NULL,
  `services_id` int(6) NOT NULL,
  `product_id` int(11) NOT NULL,
  `use_quantity` int(6) DEFAULT NULL,
  PRIMARY KEY (`services_product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `services_product`
--

INSERT INTO `services_product` (`services_product_id`, `company_id`, `services_id`, `product_id`, `use_quantity`) VALUES
(1, 1, 1, 5, 10),
(2, 1, 3, 5, 10),
(3, 1, 4, 0, 0),
(4, 1, 6, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `service_category`
--

CREATE TABLE IF NOT EXISTS `service_category` (
  `service_category` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `service_category_code` varchar(220) NOT NULL,
  `service_category_title` varchar(220) NOT NULL,
  `service_category_note` text NOT NULL,
  PRIMARY KEY (`service_category`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `service_category`
--

INSERT INTO `service_category` (`service_category`, `company_id`, `service_category_code`, `service_category_title`, `service_category_note`) VALUES
(1, 1, 'sc1', 'HAIR CUTTING', ''),
(2, 1, 'sc2', 'HAIR COLOR', ''),
(3, 1, 'sc3', 'HAIR PLANTATION', ''),
(4, 1, '', 'HAIR', '');

-- --------------------------------------------------------

--
-- Table structure for table `service_price`
--

CREATE TABLE IF NOT EXISTS `service_price` (
  `service_price_id` int(6) NOT NULL AUTO_INCREMENT,
  `company_id` int(6) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `membership_type_id` int(6) NOT NULL,
  `services_id` int(6) NOT NULL,
  `price` int(6) DEFAULT NULL,
  PRIMARY KEY (`service_price_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `service_price`
--

INSERT INTO `service_price` (`service_price_id`, `company_id`, `branch_id`, `membership_type_id`, `services_id`, `price`) VALUES
(1, 1, 1, 1, 1, 150),
(2, 1, 1, 1, 2, 1850),
(3, 1, 1, 1, 3, 4800),
(4, 1, 1, 2, 1, 140),
(5, 1, 1, 2, 2, 1400),
(6, 1, 1, 2, 3, 4500),
(7, 1, 1, 3, 1, 135),
(8, 1, 1, 3, 2, 1800),
(10, 1, 1, 3, 3, 4700),
(11, 1, 1, 1, 4, 100),
(12, 1, 1, 2, 4, 80),
(13, 1, 1, 3, 4, 75),
(14, 1, 1, 1, 5, 150),
(15, 1, 1, 2, 5, 125),
(16, 1, 1, 3, 5, 100);

-- --------------------------------------------------------

--
-- Table structure for table `service_subcategory`
--

CREATE TABLE IF NOT EXISTS `service_subcategory` (
  `service_subcategory_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_category_id` int(11) NOT NULL,
  `service_subcategory_code` varchar(220) NOT NULL,
  `service_subcategory_title` varchar(220) NOT NULL,
  `service_subcategory_note` text NOT NULL,
  PRIMARY KEY (`service_subcategory_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `service_subcategory`
--

INSERT INTO `service_subcategory` (`service_subcategory_id`, `service_category_id`, `service_subcategory_code`, `service_subcategory_title`, `service_subcategory_note`) VALUES
(1, 1, 'ssubc1', 'CLASSIC', 'classic'),
(2, 2, 'ssubc2', 'COLORING HAIR', ''),
(3, 3, 'ssubc3', 'PLANTING HAIR', ''),
(4, 4, '', 'IRONING', '');

-- --------------------------------------------------------

--
-- Table structure for table `service_type`
--

CREATE TABLE IF NOT EXISTS `service_type` (
  `service_type_id` int(6) NOT NULL AUTO_INCREMENT,
  `company_id` int(6) NOT NULL,
  `title` varchar(220) DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`service_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sms_template`
--

CREATE TABLE IF NOT EXISTS `sms_template` (
  `tid` int(6) NOT NULL AUTO_INCREMENT,
  `company_id` int(6) NOT NULL,
  `branch_id` int(6) NOT NULL,
  `title` varchar(50) NOT NULL,
  `text` text NOT NULL,
  `added_by` int(6) NOT NULL,
  `updated_by` int(6) NOT NULL,
  `added_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `sms_template`
--

INSERT INTO `sms_template` (`tid`, `company_id`, `branch_id`, `title`, `text`, `added_by`, `updated_by`, `added_on`, `updated_on`) VALUES
(1, 1, 1, 'Birthday wishes', 'Hii |*email*| ,\r\n\r\nhow are you dear,\r\nhappy birthday.', 1, 0, '2014-09-06 17:03:07', '2015-05-14 17:15:17'),
(2, 1, 1, 'Wedding Anniversary', 'Happy  Wedding Anniversary *|name|*', 1, 0, '2014-09-06 17:43:37', '0000-00-00 00:00:00'),
(3, 1, 1, 'group message', 'this inform you all that please be kind toward animal and birds. ', 1, 0, '2014-09-06 17:46:34', '0000-00-00 00:00:00'),
(4, 1, 1, 'RESET_PASSWORD', 'Hii |*name*| , Your password is reset, Your new password is |*otp*|', 1, 0, '2014-11-18 10:56:15', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE IF NOT EXISTS `state` (
  `StateID` int(11) NOT NULL AUTO_INCREMENT,
  `StateName` varchar(50) NOT NULL,
  PRIMARY KEY (`StateID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`StateID`, `StateName`) VALUES
(1, 'ANDHRA PRADESH'),
(2, 'ASSAM'),
(3, 'ARUNACHAL PRADESH'),
(4, 'GUJRAT'),
(5, 'BIHAR'),
(6, 'HARYANA'),
(7, 'HIMACHAL PRADESH'),
(8, 'JAMMU & KASHMIR'),
(9, 'KARNATAKA'),
(10, 'KERALA'),
(11, 'MADHYA PRADESH'),
(12, 'MAHARASHTRA'),
(13, 'MANIPUR'),
(14, 'MEGHALAYA'),
(15, 'MIZORAM'),
(16, 'NAGALAND'),
(17, 'ORISSA'),
(18, 'PUNJAB'),
(19, 'RAJASTHAN'),
(20, 'SIKKIM'),
(21, 'TAMIL NADU'),
(22, 'TRIPURA'),
(23, 'UTTAR PRADESH'),
(24, 'WEST BENGAL'),
(25, 'DELHI'),
(26, 'GOA'),
(27, 'PONDICHERY'),
(28, 'LAKSHDWEEP'),
(29, 'DAMAN & DIU'),
(30, 'DADRA & NAGAR'),
(31, 'CHANDIGARH'),
(32, 'ANDAMAN & NICOBAR'),
(33, 'UTTARANCHAL'),
(34, 'JHARKHAND'),
(35, 'CHATTISGARH');

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE IF NOT EXISTS `stock` (
  `stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(6) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `stock` int(6) DEFAULT '0' COMMENT 'Available quentity',
  `volumn_stock` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`stock_id`),
  KEY `stock_FKIndex1` (`company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`stock_id`, `company_id`, `branch_id`, `product_id`, `stock`, `volumn_stock`) VALUES
(1, 1, 1, 1, 193, 0),
(2, 1, 1, 2, 99, 0),
(3, 1, 1, 3, 0, 0),
(4, 1, 1, 4, 0, 0),
(5, 1, 1, 5, 10, 350),
(6, 1, 2, 5, 0, 0),
(7, 1, 1, 6, 100, 0),
(8, 1, 2, 6, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tax`
--

CREATE TABLE IF NOT EXISTS `tax` (
  `tax_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `tax_title` varchar(200) NOT NULL,
  `rate` int(11) NOT NULL,
  `enable` int(1) NOT NULL,
  `product_based` int(11) NOT NULL,
  `service_based` int(11) NOT NULL,
  `note` text NOT NULL,
  PRIMARY KEY (`tax_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tax`
--

INSERT INTO `tax` (`tax_id`, `company_id`, `tax_title`, `rate`, `enable`, `product_based`, `service_based`, `note`) VALUES
(1, 1, 'SERVICE TAX @', 10, 1, 1, 1, ''),
(2, 1, 'EDU CESS @', 10, 0, 1, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `therapist`
--

CREATE TABLE IF NOT EXISTS `therapist` (
  `therapist_id` int(6) NOT NULL AUTO_INCREMENT,
  `company_id` int(6) NOT NULL,
  `branch_id` int(6) NOT NULL,
  `name` varchar(220) DEFAULT NULL,
  `mobile` varchar(220) DEFAULT NULL,
  `email` varchar(220) DEFAULT NULL,
  `note` varchar(220) DEFAULT NULL,
  PRIMARY KEY (`therapist_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `therapist`
--

INSERT INTO `therapist` (`therapist_id`, `company_id`, `branch_id`, `name`, `mobile`, `email`, `note`) VALUES
(1, 1, 1, 'RON WILL', '9252525252', 'ron@email.com', ''),
(2, 1, 1, 'CONOR', '9262626262', 'conor@email.com', ''),
(3, 1, 1, 'PHONIX', '9242424242', 'phonix@yopmail.com', '');

-- --------------------------------------------------------

--
-- Table structure for table `therapist_worktime`
--

CREATE TABLE IF NOT EXISTS `therapist_worktime` (
  `therapist_worktime_id` int(11) NOT NULL AUTO_INCREMENT,
  `therapist_id` int(11) NOT NULL,
  `workday_id` int(11) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `available` enum('0','1') NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`therapist_worktime_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `therapist_worktime`
--

INSERT INTO `therapist_worktime` (`therapist_worktime_id`, `therapist_id`, `workday_id`, `start_time`, `end_time`, `available`, `updated_at`) VALUES
(1, 1, 1, '10:00:00', '18:00:00', '1', '2015-05-22 17:52:29'),
(2, 1, 2, '10:00:00', '18:00:00', '1', '2015-05-22 17:52:29'),
(3, 1, 3, '10:00:00', '18:00:00', '1', '2015-05-22 17:52:29'),
(4, 1, 4, '10:00:00', '18:00:00', '1', '2015-05-22 17:52:29'),
(5, 1, 5, '10:00:00', '18:00:00', '1', '2015-05-22 17:52:29'),
(6, 1, 6, '10:00:00', '18:00:00', '1', '2015-05-22 17:52:29'),
(7, 1, 7, '10:00:00', '18:00:00', '1', '2015-05-22 17:52:29'),
(8, 2, 1, '10:00:00', '18:00:00', '1', '0000-00-00 00:00:00'),
(9, 2, 2, '10:00:00', '18:00:00', '1', '0000-00-00 00:00:00'),
(10, 2, 3, '10:00:00', '18:00:00', '1', '0000-00-00 00:00:00'),
(11, 2, 4, '10:00:00', '18:00:00', '1', '0000-00-00 00:00:00'),
(12, 2, 5, '10:00:00', '18:00:00', '1', '0000-00-00 00:00:00'),
(13, 2, 6, '10:00:00', '18:00:00', '1', '0000-00-00 00:00:00'),
(14, 2, 7, '10:00:00', '18:00:00', '1', '0000-00-00 00:00:00'),
(15, 3, 1, '10:00:00', '21:00:00', '0', '2015-05-22 18:07:27'),
(16, 3, 2, '10:00:00', '21:00:00', '1', '2015-05-22 18:07:27'),
(17, 3, 3, '10:00:00', '21:00:00', '1', '2015-05-22 18:07:27'),
(18, 3, 4, '10:00:00', '21:00:00', '1', '2015-05-22 18:07:27'),
(19, 3, 5, '10:00:00', '21:00:00', '1', '2015-05-22 18:07:27'),
(20, 3, 6, '10:00:00', '21:00:00', '1', '2015-05-22 18:07:27'),
(21, 3, 7, '10:00:00', '21:00:00', '1', '2015-05-22 18:07:27');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_currency`
--

CREATE TABLE IF NOT EXISTS `transaction_currency` (
  `transaction_currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `sales_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`transaction_currency_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `transaction_currency`
--

INSERT INTO `transaction_currency` (`transaction_currency_id`, `sales_id`, `currency_id`, `count`) VALUES
(1, 25, 4, 7),
(2, 25, 3, 1),
(3, 25, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `userrole`
--

CREATE TABLE IF NOT EXISTS `userrole` (
  `role_id` int(11) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userrole`
--

INSERT INTO `userrole` (`role_id`, `role`) VALUES
(1, 'admin'),
(2, 'manager'),
(3, 'operator');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `users_id` int(6) NOT NULL AUTO_INCREMENT,
  `company_id` int(6) NOT NULL,
  `branch_id` int(6) NOT NULL,
  `name` varchar(220) NOT NULL,
  `username` varchar(220) NOT NULL,
  `email` varchar(220) NOT NULL,
  `mobile` varchar(220) DEFAULT NULL,
  `password` varchar(220) DEFAULT NULL,
  `temp_pass` varchar(220) DEFAULT NULL,
  `role` varchar(220) DEFAULT NULL,
  `remember_token` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`users_id`, `company_id`, `branch_id`, `name`, `username`, `email`, `mobile`, `password`, `temp_pass`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(5, 0, 0, 'RON WILL', 'admin', 'admin@email.com', '8879331463', '900150983cd24fb0d6963f7d28e17f72', 'abc', 'admin', '', '2015-03-09 11:06:29', '2015-03-09 11:22:34'),
(6, 1, 0, 'John Nash', 'john', 'john@email.com', '8879331463', 'e99a18c428cb38d5f260853678922e03', 'abc123', 'manager', '', '2015-03-09 11:06:29', '2015-03-24 14:32:06'),
(7, 1, 1, 'Waldo', 'waldo', 'waldo@email.com', '9565656564', 'e99a18c428cb38d5f260853678922e03', 'abc123', 'operator', '', '2015-04-03 19:02:58', '2015-04-07 12:30:27');

-- --------------------------------------------------------

--
-- Table structure for table `variable`
--

CREATE TABLE IF NOT EXISTS `variable` (
  `variable_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `key` varchar(220) NOT NULL,
  `value` varchar(220) NOT NULL,
  PRIMARY KEY (`variable_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `variable`
--

INSERT INTO `variable` (`variable_id`, `company_id`, `key`, `value`) VALUES
(1, 1, 'secure_sms', ''),
(2, 1, 'sales_sms', 'Hi |*name*|, Thank you for paying Rs. |*amount*|. Visit Again.\n\nRegards\nAURA THE HOLISTIC SPA'),
(3, 1, 'secure_app_key', 'ayujbbn@**7'),
(4, 1, 'RESET_PASSWORD', 'Hii , Your password is reset, Your new password is |*otp*|'),
(5, 1, 'BIRTHDAY_TEMPLATE', 'Wishing you a birthday full of  everything that makes you happy, healthy, wealthy and wise year-round.  Regard |*company_name*|'),
(6, 1, 'ANNIVERSARY_TEMPLATE', 'Happy Anniversary And May\r\nYour Marriage Be Blessed\r\nWith Love, Joy And\r\nCompanionship For All The\r\nYears Of Your Lives!\r\n\r\nRegard |*company_name*|'),
(7, 1, 'WELCOME_TEMPLATE', 'Dear |*name*|, Welcome to the wonderful world of |*company_name*|. you will definitely have a great experience with us.'),
(8, 1, 'RECHARGE_MESSAGES', 'Dear ShortMSG Customer, Your account has been recharged with amount Rs. |*amount*|.\r\nRegard ShortMSG team.'),
(9, 1, 'sms_token', 'f3676ahn');

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE IF NOT EXISTS `vendor` (
  `vender_id` int(6) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `company_name` varchar(220) NOT NULL,
  `vendor_name` varchar(220) DEFAULT NULL,
  `vendor_mobile` varchar(220) DEFAULT NULL,
  `vendor_phone` varchar(30) NOT NULL,
  `vendor_email` varchar(220) DEFAULT NULL,
  `vendor_address` varchar(220) DEFAULT NULL,
  `vender_note` text,
  PRIMARY KEY (`vender_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`vender_id`, `company_id`, `company_name`, `vendor_name`, `vendor_mobile`, `vendor_phone`, `vendor_email`, `vendor_address`, `vender_note`) VALUES
(1, 1, 'CONOR PVT. LTD.', 'CONOR', '8989898989', '', 'conor@email.com', 'CBD, Navi-Mumbai', ''),
(2, 1, 'graham PVT. LTD.', 'graham', '8989898989', '', 'graham@email.com', 'CBD, Navi-Mumbai', ''),
(3, 1, 'KYLE PVT. LTD.', 'KYLE FRANK', '9262626262', '', 'kyle@email.com', 'CBD, Navi-Mumbai', '');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_balance`
--

CREATE TABLE IF NOT EXISTS `vendor_balance` (
  `vendor_balance_id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `debit` double NOT NULL,
  `credit` double NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`vendor_balance_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `vendor_balance`
--

INSERT INTO `vendor_balance` (`vendor_balance_id`, `vendor_id`, `debit`, `credit`, `updated_at`) VALUES
(1, 1, 9590, 9590, '0000-00-00 00:00:00'),
(2, 2, 0, 0, '0000-00-00 00:00:00'),
(3, 3, 13500, 13500, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_product`
--

CREATE TABLE IF NOT EXISTS `vendor_product` (
  `vender_product` int(6) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `vender_id` int(6) NOT NULL,
  PRIMARY KEY (`vender_product`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `vendor_product`
--

INSERT INTO `vendor_product` (`vender_product`, `product_id`, `vender_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 5, 2),
(5, 6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_transctions`
--

CREATE TABLE IF NOT EXISTS `vendor_transctions` (
  `vender_transction_id` int(11) NOT NULL AUTO_INCREMENT,
  `vender_id` int(6) NOT NULL,
  `purchase_id` int(6) DEFAULT NULL,
  `transction_type` enum('purchase receipt','purchase','payment') NOT NULL COMMENT 'purchase receipt means full payment, purchase means on credit, payment means pay amount to vendor',
  `particular` text NOT NULL,
  `ref_no` varchar(220) DEFAULT NULL,
  `payment_type` varchar(220) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`vender_transction_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `vendor_transctions`
--

INSERT INTO `vendor_transctions` (`vender_transction_id`, `vender_id`, `purchase_id`, `transction_type`, `particular`, `ref_no`, `payment_type`, `total_amount`, `created_at`, `updated_at`, `created_by`) VALUES
(1, 1, 1, 'purchase receipt', 'product purchase', '1', 'cash', 3000, '2015-04-13 00:00:00', '0000-00-00 00:00:00', 6),
(2, 1, 1, 'purchase receipt', 'product purchase', '1', 'debit card', 3000, '2015-04-13 00:00:00', '0000-00-00 00:00:00', 6),
(3, 1, 3, 'purchase receipt', 'product purchase', '3', 'Cash', 90, '2015-04-14 15:26:38', '0000-00-00 00:00:00', 6),
(4, 1, 3, 'purchase receipt', 'product purchase', '3', 'Cash', 3500, '2015-04-15 12:34:58', '0000-00-00 00:00:00', 6),
(5, 3, 4, 'purchase receipt', 'product purchase', '4', 'Cheque', 13500, '2015-04-27 15:24:05', '0000-00-00 00:00:00', 6);

-- --------------------------------------------------------

--
-- Table structure for table `workday`
--

CREATE TABLE IF NOT EXISTS `workday` (
  `workday_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `workday_title` varchar(220) NOT NULL,
  `available` enum('0','1') NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `workday`
--

INSERT INTO `workday` (`workday_id`, `company_id`, `branch_id`, `workday_title`, `available`, `start_time`, `end_time`) VALUES
(1, 0, 0, 'SUNDAY', '1', '10:00:00', '21:00:00'),
(2, 0, 0, 'MONDAY', '1', '10:00:00', '21:00:00'),
(3, 0, 0, 'TUESDAY', '1', '10:00:00', '21:00:00'),
(4, 0, 0, 'WEDNESDAY', '1', '10:00:00', '21:00:00'),
(5, 0, 0, 'THURSDAY', '1', '10:00:00', '21:00:00'),
(6, 0, 0, 'FRIDAY', '1', '10:00:00', '21:00:00'),
(7, 0, 0, 'SATURDAY', '1', '10:00:00', '21:00:00'),
(1, 1, 1, 'SUNDAY', '1', '10:00:00', '21:00:00'),
(2, 1, 1, 'MONDAY', '1', '10:00:00', '21:00:00'),
(3, 1, 1, 'TUESDAY', '1', '10:00:00', '21:00:00'),
(4, 1, 1, 'WEDNESDAY', '1', '10:00:00', '21:00:00'),
(5, 1, 1, 'THURSDAY', '1', '10:00:00', '21:00:00'),
(6, 1, 1, 'FRIDAY', '1', '10:00:00', '21:00:00'),
(7, 1, 1, 'SATURDAY', '1', '10:00:00', '21:00:00'),
(1, 1, 2, 'SUNDAY', '1', '10:00:00', '21:00:00'),
(2, 1, 2, 'MONDAY', '1', '10:00:00', '21:00:00'),
(3, 1, 2, 'TUESDAY', '1', '10:00:00', '21:00:00'),
(4, 1, 2, 'WEDNESDAY', '1', '10:00:00', '21:00:00'),
(5, 1, 2, 'THURSDAY', '1', '10:00:00', '21:00:00'),
(6, 1, 2, 'FRIDAY', '1', '10:00:00', '21:00:00'),
(7, 1, 2, 'SATURDAY', '1', '10:00:00', '21:00:00'),
(1, 2, 3, 'SUNDAY', '0', '10:00:00', '19:00:00'),
(2, 2, 3, 'MONDAY', '1', '10:00:00', '19:00:00'),
(3, 2, 3, 'TUESDAY', '1', '10:00:00', '19:00:00'),
(4, 2, 3, 'WEDNESDAY', '1', '10:00:00', '19:00:00'),
(5, 2, 3, 'THURSDAY', '1', '10:00:00', '19:00:00'),
(6, 2, 3, 'FRIDAY', '1', '10:00:00', '19:00:00'),
(7, 2, 3, 'SATURDAY', '1', '10:00:00', '19:00:00'),
(1, 3, 4, 'SUNDAY', '1', '10:00:00', '21:00:00'),
(2, 3, 4, 'MONDAY', '1', '10:00:00', '21:00:00'),
(3, 3, 4, 'TUESDAY', '1', '10:00:00', '21:00:00'),
(4, 3, 4, 'WEDNESDAY', '1', '10:00:00', '21:00:00'),
(5, 3, 4, 'THURSDAY', '1', '10:00:00', '21:00:00'),
(6, 3, 4, 'FRIDAY', '1', '10:00:00', '21:00:00'),
(7, 3, 4, 'SATURDAY', '1', '10:00:00', '21:00:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
