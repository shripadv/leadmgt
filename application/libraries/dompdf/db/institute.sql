-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2015 at 01:23 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `institute`
--

-- --------------------------------------------------------

--
-- Table structure for table `balance`
--

CREATE TABLE IF NOT EXISTS `balance` (
  `sid` int(11) NOT NULL,
  `credit` int(20) NOT NULL,
  `debit` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `balance`
--

INSERT INTO `balance` (`sid`, `credit`, `debit`) VALUES
(1, 10100, 25200),
(2, 10100, 20100),
(4, 5100, 6100),
(5, 7100, 7100),
(6, 4250, 14250);

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE IF NOT EXISTS `batch` (
  `batchid` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `institute_id` int(11) NOT NULL,
  `batch_title` varchar(255) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`batchid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`batchid`, `cid`, `institute_id`, `batch_title`, `start_time`, `end_time`, `branch_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'PHP BATCH C1', '01:00:00', '03:00:00', 1, '2015-01-14 11:05:10', '2015-01-20 09:03:39', NULL),
(2, 1, 1, 'PHP BATCH n1', '15:00:00', '17:00:00', 2, '2015-01-14 14:18:45', '0000-00-00 00:00:00', NULL),
(3, 1, 1, 'PHP BATCH k1', '18:00:00', '20:00:00', 2, '2015-01-14 14:18:18', '0000-00-00 00:00:00', NULL),
(4, 3, 1, 'JAVA BATCH K1', '10:00:00', '12:00:00', 3, '2015-01-17 12:58:14', '0000-00-00 00:00:00', NULL),
(5, 3, 1, 'JAVA BATCH C1', '13:00:00', '15:00:00', 1, '2015-01-15 08:26:48', '0000-00-00 00:00:00', NULL),
(6, 4, 1, 'NET Batch1', '03:00:00', '05:00:00', 1, '2015-01-15 00:00:00', '0000-00-00 00:00:00', NULL),
(7, 4, 1, 'NET Batch2', '05:30:00', '07:30:00', 1, '2015-01-15 00:00:00', '0000-00-00 00:00:00', NULL),
(8, 5, 1, 'karate b1', '05:53:00', '07:53:00', 1, '2015-01-15 13:23:45', '0000-00-00 00:00:00', '2015-01-20 09:29:01'),
(9, 2, 1, 'CC BATCH C1', '10:00:00', '12:00:00', 1, '2015-01-15 06:05:27', '0000-00-00 00:00:00', NULL),
(10, 7, 1, 'Azure c1', '03:00:00', '05:00:00', 1, '2015-02-02 05:48:44', '0000-00-00 00:00:00', NULL),
(11, 7, 1, 'Azure c2', '03:45:00', '05:45:00', 1, '2015-02-02 05:48:44', '0000-00-00 00:00:00', NULL),
(12, 6, 1, 'TABALA BATCH C1', '03:00:00', '05:00:00', 1, '2015-03-20 05:54:21', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE IF NOT EXISTS `branches` (
  `branch_id` int(11) NOT NULL AUTO_INCREMENT,
  `institute_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `address` text NOT NULL,
  `mobile` bigint(11) NOT NULL,
  `contact_person` varchar(255) NOT NULL,
  `note` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`branch_id`, `institute_id`, `title`, `address`, `mobile`, `contact_person`, `note`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'CBD BRANCH', 'CBD, Navi mumbai', 8989898989, 'RON', '', '2015-01-14 10:44:58', '2015-03-19 05:58:54', NULL),
(2, 1, 'NERUL BRANCH', 'Nerul', 8989898989, 'QUINN', '', '2015-01-14 14:08:18', '2015-01-14 14:08:18', NULL),
(3, 1, 'KHARGHAR BRANCH', 'Kharghar', 8989898989, 'WALTO', '', '2015-01-14 14:09:06', '2015-01-14 14:09:06', NULL),
(4, 4, 'CBD', 'CBD', 8182828282, 'ETHAN', '', '2015-02-04 09:39:07', '2015-02-04 09:39:07', NULL);

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
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `institute_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `price` bigint(20) NOT NULL,
  `enrollfee` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `doption` varchar(10) NOT NULL,
  `note` text NOT NULL,
  `feestructure` varchar(50) NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`cid`, `title`, `institute_id`, `branch_id`, `price`, `enrollfee`, `duration`, `doption`, `note`, `feestructure`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'PHP', 1, 1, 10000, 100, 1, 'month', '', 'duration', 1, '2015-01-14 10:59:28', '2015-01-15 12:36:14', NULL),
(2, 'Cloude Computing', 1, 1, 5000, 100, 1, 'month', 'Cloude Computing ', 'fixed', 1, '2015-01-14 14:01:25', '2015-01-14 02:27:10', NULL),
(3, 'JAVA', 1, 3, 5000, 100, 2, 'month', '', 'fixed', 1, '2015-01-15 07:55:40', '2015-01-15 12:35:24', NULL),
(4, '.NET', 1, 1, 5000, 50, 1, 'month', '', 'fixed', 1, '2015-01-15 11:45:40', '2015-01-15 01:18:09', NULL),
(5, 'Karate', 1, 1, 500, 100, 1, 'month', '', 'duration', 0, '2015-01-15 13:23:45', '2015-01-15 01:23:58', '2015-01-20 09:29:01'),
(6, 'Tabala', 1, 1, 1000, 50, 1, 'month', '', 'duration', 1, '2015-01-16 08:38:38', '2015-01-20 08:59:49', NULL),
(7, 'Azure1', 1, 1, 2000, 500, 1, 'month', '', 'fixed', 1, '2015-02-02 05:48:44', '2015-04-08 07:56:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `courseexam`
--

CREATE TABLE IF NOT EXISTS `courseexam` (
  `ceid` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `note` text NOT NULL,
  `institute_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  PRIMARY KEY (`ceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `courseexam`
--

INSERT INTO `courseexam` (`ceid`, `cid`, `title`, `note`, `institute_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'Cloude Computing beginner', 'Beginner level', 1, '2015-01-14 02:01:51', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 1, 'Php beginner Test', 'Beginner level Test', 1, '2015-01-14 02:05:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 3, 'Java Test1', '', 1, '2015-01-15 08:11:31', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 7, 'Azure Test Feb - 2015', 'Azure Test Feb - 2015', 1, '2015-02-02 05:49:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `credit`
--

CREATE TABLE IF NOT EXISTS `credit` (
  `credit_id` int(11) NOT NULL AUTO_INCREMENT,
  `rec_id` varchar(50) NOT NULL,
  `eid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `institute_id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `camount` bigint(20) NOT NULL,
  `paid_date` date NOT NULL,
  `particular` text NOT NULL,
  `note` text NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`credit_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `credit`
--

INSERT INTO `credit` (`credit_id`, `rec_id`, `eid`, `sid`, `institute_id`, `cid`, `camount`, `paid_date`, `particular`, `note`, `created_at`) VALUES
(2, 'CBD/1', 1, 1, 1, 1, 10100, '2015-01-20', 'PHP CLASSES fee with Enrollment', '', '2015-01-20 07:45:59'),
(3, 'KHA/1', 3, 4, 1, 3, 5100, '2015-02-03', 'JAVA CLASSES fee with Enrollment', 'JAVA CLASSES fee with Enrollment', '2015-02-03 12:52:10'),
(4, 'CBD/2', 5, 5, 1, 7, 2000, '2015-02-03', 'Azure CLASSES fee with Enrollment', 'Azure CLASSES fee with Enrollment', '2015-02-03 01:34:59'),
(5, 'CBD/3', 6, 5, 1, 3, 5100, '2015-02-03', 'JAVA CLASSES fee with Enrollment', 'JAVA CLASSES fee with Enrollment', '2015-02-03 01:37:08'),
(6, 'CBD/4', 7, 6, 1, 4, 4250, '2015-03-20', '4250', 'fees of .NET for February month.', '2015-03-20 05:33:46');

--
-- Triggers `credit`
--
DROP TRIGGER IF EXISTS `AI_creditbal`;
DELIMITER //
CREATE TRIGGER `AI_creditbal` AFTER INSERT ON `credit`
 FOR EACH ROW BEGIN
	IF (SELECT COUNT(*) FROM balance WHERE `sid`=NEW.sid) = 0 THEN
		INSERT INTO `balance`(`sid`, `credit`) VALUES (NEW.sid,NEW.camount);
    ELSE
		UPDATE `balance` SET `credit`= `credit` + NEW.camount WHERE `sid`=NEW.sid;	
	END IF;	
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `BD_creditdel`;
DELIMITER //
CREATE TRIGGER `BD_creditdel` BEFORE DELETE ON `credit`
 FOR EACH ROW BEGIN
	insert into credit_delete select * from credit where credit_id=OLD.credit_id;
        IF (SELECT COUNT(*) FROM balance WHERE `sid`=OLD.sid) != 0 THEN	
        UPDATE `balance` SET `credit`= `credit` - OLD.camount WHERE `sid`=OLD.sid;	
	END IF;	
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `credit_delete`
--

CREATE TABLE IF NOT EXISTS `credit_delete` (
  `credit_id` int(11) NOT NULL,
  `rec_id` varchar(50) NOT NULL,
  `eid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `institute_id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `camount` bigint(20) NOT NULL,
  `paid_date` date NOT NULL,
  `particular` text NOT NULL,
  `note` text NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`credit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `credit_delete`
--

INSERT INTO `credit_delete` (`credit_id`, `rec_id`, `eid`, `sid`, `institute_id`, `cid`, `camount`, `paid_date`, `particular`, `note`, `created_at`) VALUES
(1, 'CBD/1', 1, 1, 1, 1, 10100, '2015-01-16', 'PHP CLASSES fee with Enrollment', '', '2015-01-16 07:21:24'),
(7, 'CBD/2', 5, 5, 1, 7, 2000, '2015-02-03', 'Azure CLASSES fee with Enrollment', 'Azure CLASSES fee with Enrollment', '2015-02-03 01:34:59');

-- --------------------------------------------------------

--
-- Table structure for table `debit`
--

CREATE TABLE IF NOT EXISTS `debit` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `damount` int(20) NOT NULL,
  `particular` text NOT NULL,
  `bill_date` date NOT NULL,
  `set_off` int(11) NOT NULL,
  `note` text NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `debit`
--

INSERT INTO `debit` (`did`, `eid`, `sid`, `cid`, `damount`, `particular`, `bill_date`, `set_off`, `note`, `created_at`) VALUES
(1, 1, 1, 1, 100, 'Enrollment Fee of PHP', '2015-01-16', 0, '', '2015-01-16 07:20:49'),
(2, 1, 1, 1, 10000, 'fees of PHP for January month.', '2015-01-16', 0, '', '2015-01-16 07:20:49'),
(3, 2, 2, 1, 100, 'Enrollment Fee of PHP', '2015-01-16', 0, '', '2015-01-16 09:51:01'),
(4, 2, 2, 1, 10000, 'fees of PHP for January month.', '2015-01-16', 0, '', '2015-01-16 09:51:01'),
(5, 3, 4, 3, 100, 'Enrollment Fee of JAVA ', '2015-01-17', 0, '', '2015-01-17 12:59:04'),
(6, 3, 4, 3, 5000, 'fees of JAVA for January month.', '2015-01-17', 0, '', '2015-01-17 12:59:04'),
(7, 4, 1, 3, 100, 'Enrollment Fee of JAVA ', '2015-01-20', 0, '', '2015-01-20 10:19:28'),
(8, 4, 1, 3, 5000, 'fees of JAVA for January month.', '2015-01-20', 0, '', '2015-01-20 10:19:28'),
(9, 5, 5, 7, 2000, 'fees of Azure for February month.', '2015-02-03', 0, '', '2015-02-03 12:30:56'),
(10, 6, 5, 3, 100, 'Enrollment Fee of JAVA', '2015-02-03', 0, '', '2015-02-03 12:32:23'),
(11, 6, 5, 3, 5000, 'fees of JAVA for February month.', '2015-02-03', 0, '', '2015-02-03 12:32:23'),
(12, 7, 6, 4, 4250, 'fees of .NET for February month.', '2015-02-28', 0, '', '2015-02-28 02:08:55'),
(13, 8, 6, 1, 10000, 'fees of PHP for February month.', '2015-02-28', 0, '', '2015-02-28 02:15:19'),
(14, 1, 1, 1, 10000, 'fees of PHP for March month.', '2015-03-05', 0, '', '2015-03-05 06:51:55'),
(15, 2, 2, 1, 10000, 'fees of PHP for March month.', '2015-03-05', 1, '', '2015-03-05 06:51:55'),
(16, 9, 4, 6, 1000, 'fees of Tabala for March month.', '2015-03-20', 0, '', '2015-03-20 05:54:53');

--
-- Triggers `debit`
--
DROP TRIGGER IF EXISTS `AI_debitbal`;
DELIMITER //
CREATE TRIGGER `AI_debitbal` AFTER INSERT ON `debit`
 FOR EACH ROW BEGIN
	IF (SELECT COUNT(*) FROM balance WHERE `sid`=NEW.sid) = 0 THEN
		INSERT INTO `balance`(`sid`, `debit`) VALUES (NEW.sid,NEW.damount);
    ELSE
		UPDATE `balance` SET `debit`= `debit` + NEW.damount WHERE `sid`=NEW.sid;	
	END IF;	
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `BD_debitdel`;
DELIMITER //
CREATE TRIGGER `BD_debitdel` BEFORE DELETE ON `debit`
 FOR EACH ROW BEGIN
	insert into debit_delete select * from debit where did=OLD.did;
        IF (SELECT COUNT(*) FROM balance WHERE `sid`=OLD.sid) != 0 THEN	
        UPDATE `balance` SET `debit`= `debit` - OLD.damount WHERE `sid`=OLD.sid;	
	END IF;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `debit_delete`
--

CREATE TABLE IF NOT EXISTS `debit_delete` (
  `did` int(11) NOT NULL,
  `eid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `damount` int(20) NOT NULL,
  `particular` text NOT NULL,
  `bill_date` date NOT NULL,
  `set_off` int(11) NOT NULL,
  `note` text NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `donation`
--

CREATE TABLE IF NOT EXISTS `donation` (
  `doid` int(11) NOT NULL AUTO_INCREMENT,
  `institute_id` int(11) NOT NULL,
  `donarname` varchar(255) NOT NULL,
  `mobile` bigint(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `note` text NOT NULL,
  `paymenttype` varchar(50) NOT NULL,
  `cheque_date` date NOT NULL,
  `cheque_bank` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`doid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `donation`
--

INSERT INTO `donation` (`doid`, `institute_id`, `donarname`, `mobile`, `address`, `email`, `amount`, `note`, `paymenttype`, `cheque_date`, `cheque_bank`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Yuri', 9172727272, 'CBD, Navi-Mumbai', 'yuri@email.com', 5000, 'Donation', 'cash', '0000-00-00', '', '2015-02-03 09:29:51', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE IF NOT EXISTS `enrollment` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `institute_id` int(11) NOT NULL COMMENT 'institute id',
  `sid` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `batchid` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  `start_date` date NOT NULL,
  `drop_date` date NOT NULL,
  `billing` varchar(50) NOT NULL,
  `enfee` int(11) NOT NULL,
  `bill_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `enrollment`
--

INSERT INTO `enrollment` (`eid`, `institute_id`, `sid`, `branch_id`, `cid`, `batchid`, `status`, `start_date`, `drop_date`, `billing`, `enfee`, `bill_date`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, 1, 1, 1, '2015-01-16', '2015-03-08', '', 0, '2015-01-16', '2015-01-16 07:20:49', '0000-00-00 00:00:00', NULL),
(2, 1, 2, 1, 1, 1, 1, '2015-01-16', '2015-03-08', '', 0, '2015-01-16', '2015-01-16 09:51:01', '0000-00-00 00:00:00', NULL),
(3, 1, 4, 3, 3, 4, 1, '2015-01-17', '2015-03-20', '', 0, '2015-01-17', '2015-01-17 12:59:03', '0000-00-00 00:00:00', NULL),
(4, 1, 1, 1, 3, 5, 0, '2015-01-20', '2015-02-19', 'duration', 0, '2015-01-20', '2015-01-20 10:19:28', '2015-03-09 10:32:21', NULL),
(5, 1, 5, 1, 7, 10, 1, '2015-02-03', '2015-02-04', 'fixed', 0, '2015-02-03', '2015-02-03 12:30:56', '0000-00-00 00:00:00', NULL),
(6, 1, 5, 1, 3, 5, 1, '2015-02-03', '2015-02-04', 'fixed', 1, '2015-02-03', '2015-02-03 12:32:23', '0000-00-00 00:00:00', NULL),
(7, 1, 6, 1, 4, 6, 1, '2015-02-28', '2015-03-31', 'fixed', 0, '2015-02-28', '2015-02-28 02:08:55', '0000-00-00 00:00:00', NULL),
(8, 1, 6, 1, 1, 1, 1, '2015-01-28', '2015-03-31', 'duration', 0, '2015-02-28', '2015-02-28 02:15:19', '0000-00-00 00:00:00', NULL),
(9, 1, 4, 1, 6, 12, 1, '2015-03-20', '2015-05-20', 'duration', 0, '2015-03-20', '2015-03-20 05:54:53', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE IF NOT EXISTS `expenses` (
  `exid` int(10) NOT NULL AUTO_INCREMENT,
  `institute_id` int(10) NOT NULL,
  `brid` int(3) DEFAULT NULL,
  `extid` int(3) DEFAULT NULL,
  `payment_type` enum('cheque','cash') CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cheque_date` date NOT NULL,
  `ref_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` enum('expense','receipt') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `amount` int(10) NOT NULL,
  `date` date NOT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`exid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`exid`, `institute_id`, `brid`, `extid`, `payment_type`, `cheque_date`, `ref_no`, `type`, `amount`, `date`, `note`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, 'cash', '0000-00-00', 'RF1', 'expense', 30, '2015-01-28', 'Pens', '2015-01-28 07:40:46', '2015-01-28 07:41:04', NULL),
(2, 1, 3, 1, 'cash', '0000-00-00', 'RF2', 'expense', 15, '2015-01-28', 'Pens', '2015-01-28 07:45:05', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `expense_type`
--

CREATE TABLE IF NOT EXISTS `expense_type` (
  `exid` int(11) NOT NULL AUTO_INCREMENT,
  `institute_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `note` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`exid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `expense_type`
--

INSERT INTO `expense_type` (`exid`, `institute_id`, `title`, `note`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'STATIONARY', 'stationary', '2015-01-27 14:36:19', '2015-01-28 06:33:23', NULL),
(2, 1, 'BILL', 'Electricity, mobile', '2015-01-29 08:06:31', '0000-00-00 00:00:00', NULL),
(3, 1, 'OFFICE', 'Salary', '2015-02-02 10:50:37', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `expense_type1`
--

CREATE TABLE IF NOT EXISTS `expense_type1` (
  `exid` int(11) NOT NULL AUTO_INCREMENT,
  `institute_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `note` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`exid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `inquiry`
--

CREATE TABLE IF NOT EXISTS `inquiry` (
  `inid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `mobile` bigint(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `batchid` int(11) NOT NULL,
  `institute_id` int(11) NOT NULL,
  `refer` varchar(100) NOT NULL,
  `occupation` varchar(255) NOT NULL,
  `note` text NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`inid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `inquiry`
--

INSERT INTO `inquiry` (`inid`, `name`, `gender`, `mobile`, `branch_id`, `cid`, `batchid`, `institute_id`, `refer`, `occupation`, `note`, `created_at`) VALUES
(1, 'ALBERT D', '', 8989898989, 1, 1, 1, 1, '', '', 'Core PHP, Mysql', '2015-01-14 14:04:06'),
(2, 'PAUL POL', '', 8989898989, 2, 1, 2, 1, '', '', 'Core PHP', '2015-01-14 14:12:25'),
(3, 'GRAHAM', '', 8989898989, 3, 3, 0, 1, '', '', '', '2015-01-20 14:00:22'),
(4, 'CONOR', 'male', 8989898989, 1, 3, 0, 1, 'PHONIX', 'Student', '', '2015-01-24 07:04:51');

-- --------------------------------------------------------

--
-- Table structure for table `institute`
--

CREATE TABLE IF NOT EXISTS `institute` (
  `institute_id` int(11) NOT NULL AUTO_INCREMENT,
  `institute_name` varchar(255) NOT NULL,
  `short_name` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` bigint(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `logo` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`institute_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `institute`
--

INSERT INTO `institute` (`institute_id`, `institute_name`, `short_name`, `email`, `mobile`, `address`, `logo`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'CS INSTITUTE', 'CS INSTITUTE', 'CSI@email.com', 9282828282, 'CBD', 'CS INSTITUTE/Penguins.jpg', '2015-01-14 10:43:46', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'DRAWING INSTITUTE', 'LETS DRAW', 'draw@email.com', 8989898989, 'Nerul', 'LETS DRAW/Penguins.jpg', '2015-01-27 12:00:33', '0000-00-00 00:00:00', NULL),
(4, 'NFS INSTITUTE', 'NFS INSTITUTE', 'nfs@email.com', 9282828282, 'CBD, Navi-Mumbai', 'NFS INSTITUTE/Desert.jpg', '2015-02-04 08:47:53', '0000-00-00 00:00:00', NULL),
(5, 'DEMO INSTITUTE', 'DEMO INSTITUTE', 'demo@email.com', 3232323232, 'CBD, Navi-Mumbai', '', '2015-02-04 08:50:26', '0000-00-00 00:00:00', NULL),
(6, 'CULTURE INSTITUTE', 'CULTURE INSTITU', 'culture@email.com', 7232323232, 'CBD, Navi-Mumbai', 'CULTURE INSTITU/Hydrangeas.jpg', '2015-02-04 08:51:33', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `log_history`
--

CREATE TABLE IF NOT EXISTS `log_history` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=100 ;

--
-- Dumping data for table `log_history`
--

INSERT INTO `log_history` (`log_id`, `uid`, `name`, `datetime`) VALUES
(1, 1, 'JOHN NASH', '2015-01-14 10:00:00'),
(2, 1, 'JOHN NASH', '2015-01-14 10:00:00'),
(3, 6, 'RON WILL', '2015-01-14 10:00:00'),
(4, 6, 'RON WILL', '2015-01-14 11:00:00'),
(5, 1, 'JOHN NASH', '2015-01-14 13:00:00'),
(6, 9, 'WALTO', '2015-01-14 18:42:10'),
(7, 1, 'JOHN NASH', '2015-01-15 05:00:00'),
(8, 7, 'KYLE URI', '2015-01-15 06:00:00'),
(9, 6, 'RON WILL', '2015-01-15 06:00:00'),
(10, 1, 'JOHN NASH', '2015-01-15 07:00:00'),
(11, 6, 'RON WILL', '2015-01-15 07:00:00'),
(12, 7, 'KYLE URI', '2015-01-15 07:00:00'),
(13, 1, 'JOHN NASH', '2015-01-15 10:00:00'),
(14, 7, 'KYLE URI', '2015-01-15 10:00:00'),
(15, 6, 'RON WILL', '2015-01-15 11:00:00'),
(16, 6, 'RON WILL', '2015-01-15 12:00:00'),
(17, 7, 'KYLE URI', '2015-01-16 05:00:00'),
(18, 6, 'RON WILL', '2015-01-16 06:00:00'),
(19, 1, 'JOHN NASH', '2015-01-16 07:00:00'),
(20, 6, 'RON WILL', '2015-01-16 07:00:00'),
(21, 6, 'RON WILL', '2015-01-16 14:00:00'),
(22, 6, 'RON WILL', '2015-01-17 05:00:00'),
(23, 6, 'RON WILL', '2015-01-17 10:00:00'),
(24, 7, 'KYLE URI', '2015-01-17 10:00:00'),
(25, 6, 'RON WILL', '2015-01-17 11:00:00'),
(26, 7, 'KYLE URI', '2015-01-17 11:00:00'),
(27, 6, 'RON WILL', '2015-01-19 06:00:00'),
(28, 7, 'KYLE URI', '2015-01-19 08:00:00'),
(29, 9, 'WALTO', '2015-01-19 08:00:00'),
(30, 7, 'KYLE URI', '2015-01-19 08:00:00'),
(31, 9, 'WALTO', '2015-01-19 08:00:00'),
(32, 1, 'JOHN NASH', '2015-01-19 13:00:00'),
(33, 1, 'JOHN NASH', '2015-01-20 05:00:00'),
(34, 6, 'RON WILL', '2015-01-20 05:00:00'),
(35, 7, 'KYLE URI', '2015-01-20 05:00:00'),
(36, 6, 'RON WILL', '2015-01-20 06:00:00'),
(37, 1, 'JOHN NASH', '2015-01-20 06:00:00'),
(38, 7, 'KYLE URI', '2015-01-20 08:00:00'),
(39, 9, 'WALTO', '2015-01-20 13:00:00'),
(40, 9, 'WALTO', '2015-01-20 14:00:00'),
(41, 6, 'RON WILL', '2015-01-20 14:00:00'),
(42, 6, 'RON WILL', '2015-01-21 05:00:00'),
(43, 1, 'JOHN NASH', '2015-01-21 07:00:00'),
(44, 7, 'KYLE URI', '2015-01-21 07:00:00'),
(45, 9, 'WALTO', '2015-01-21 07:00:00'),
(46, 7, 'KYLE URI', '2015-01-21 07:00:00'),
(47, 7, 'KYLE URI', '2015-01-21 11:00:00'),
(48, 6, 'RON WILL', '2015-01-21 11:00:00'),
(49, 6, 'RON WILL', '2015-01-23 10:00:00'),
(50, 6, 'RON WILL', '2015-01-24 05:00:00'),
(51, 6, 'RON WILL', '2015-01-27 06:00:00'),
(52, 1, 'JOHN NASH', '2015-01-27 11:00:00'),
(53, 6, 'RON WILL', '2015-01-27 12:00:00'),
(54, 6, 'RON WILL', '2015-01-28 05:00:00'),
(55, 7, 'KYLE URI', '2015-01-28 07:00:00'),
(56, 6, 'RON WILL', '2015-01-28 07:00:00'),
(57, 7, 'KYLE URI', '2015-01-28 07:00:00'),
(58, 6, 'RON WILL', '2015-01-28 07:00:00'),
(59, 6, 'RON WILL', '2015-01-29 06:00:00'),
(60, 6, 'RON WILL', '2015-01-29 07:00:00'),
(61, 6, 'RON WILL', '2015-02-02 05:00:00'),
(62, 6, 'RON WILL', '2015-02-02 09:00:00'),
(63, 6, 'RON WILL', '2015-02-02 09:00:00'),
(64, 6, 'RON WILL', '2015-02-03 05:00:00'),
(65, 6, 'RON WILL', '2015-02-03 08:00:00'),
(66, 6, 'RON WILL', '2015-02-04 05:00:00'),
(67, 6, 'RON WILL', '2015-02-04 08:00:00'),
(68, 6, 'RON WILL', '2015-02-04 08:00:00'),
(69, 1, 'JOHN NASH', '2015-02-04 08:00:00'),
(70, 6, 'RON WILL', '2015-02-04 08:00:00'),
(71, 1, 'JOHN NASH', '2015-02-04 08:00:00'),
(72, 6, 'RON WILL', '2015-02-04 09:00:00'),
(73, 11, 'VLADIMIR', '2015-02-04 09:00:00'),
(74, 11, 'VLADIMIR', '2015-02-04 11:00:00'),
(75, 6, 'RON WILL', '2015-02-05 08:00:00'),
(76, 6, 'RON WILL', '2015-02-05 14:00:00'),
(77, 6, 'RON WILL', '2015-02-06 05:00:00'),
(78, 6, 'RON WILL', '2015-02-06 10:00:00'),
(79, 6, 'RON WILL', '2015-02-10 13:00:00'),
(80, 7, 'KYLE URI', '2015-02-10 14:00:00'),
(81, 6, 'RON WILL', '2015-02-10 14:00:00'),
(82, 6, 'RON WILL', '2015-02-10 14:00:00'),
(83, 6, 'RON WILL', '2015-02-25 08:00:00'),
(84, 6, 'RON WILL', '2015-02-27 05:00:00'),
(85, 6, 'RON WILL', '2015-02-28 11:00:00'),
(86, 6, 'RON WILL', '2015-02-28 11:00:00'),
(87, 6, 'RON WILL', '2015-03-05 13:00:00'),
(88, 6, 'RON WILL', '2015-03-09 09:00:00'),
(89, 6, 'RON WILL', '2015-03-18 14:00:00'),
(90, 6, 'RON WILL', '2015-03-19 05:00:00'),
(91, 6, 'RON WILL', '2015-03-19 06:00:00'),
(92, 6, 'RON WILL', '2015-03-20 05:00:00'),
(93, 6, 'RON WILL', '2015-03-20 05:00:00'),
(94, 6, 'RON WILL', '2015-03-20 08:00:00'),
(95, 6, 'RON WILL', '2015-04-08 07:00:00'),
(96, 6, 'RON WILL', '2015-04-08 07:00:00'),
(97, 6, 'RON WILL', '2015-05-28 06:00:00'),
(98, 6, 'RON WILL', '2015-06-15 14:00:00'),
(99, 6, 'RON WILL', '2015-07-04 07:00:00');

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
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `bid` int(10) NOT NULL COMMENT 'Branch ID',
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `mobile` bigint(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `parent_no` bigint(11) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(10) NOT NULL,
  `occupation` varchar(100) NOT NULL,
  `occ_type` varchar(255) NOT NULL,
  `note` text NOT NULL,
  `inquiry_for` int(11) NOT NULL,
  `institute_id` int(11) NOT NULL,
  `city` varchar(100) NOT NULL,
  `pin` varchar(6) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `marital_status` enum('0','married','unmarried') NOT NULL,
  `anniversary_date` date DEFAULT NULL,
  `admission_date` date NOT NULL,
  `photo` text NOT NULL,
  `added_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`sid`, `bid`, `name`, `address`, `mobile`, `email`, `parent_no`, `dob`, `gender`, `occupation`, `occ_type`, `note`, `inquiry_for`, `institute_id`, `city`, `pin`, `state`, `country`, `marital_status`, `anniversary_date`, `admission_date`, `photo`, `added_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'PAUL POL', 'CBD', 8989898989, 'paul@email.com', 9876854315, '2000-02-29', 'male', '', '', '', 0, 1, 'CBD', '400000', 'MAHARASHTRA', 'India', 'unmarried', '0000-00-00', '0000-00-00', 'PAUL POL/Penguins.jpg', 6, '2015-01-14 12:27:46', '2015-01-20 08:55:48', NULL),
(2, 2, 'ALBERT D', 'CBD', 8989898989, 'albert@email.com', 9876854315, '2004-02-29', 'male', '', '', '', 0, 1, 'CBD', '400000', 'MAHARASHTRA', 'India', 'married', '2013-01-22', '0000-00-00', 'ALBERT D/Penguins.jpg', 6, '2015-01-14 01:42:30', '2015-01-16 09:50:43', NULL),
(4, 3, 'GRAHAM', 'Kharghar', 7987985484, 'graham@email.com', 7987985484, '2000-01-15', 'male', '', '', '', 0, 1, 'KHARGHAR', '400000', 'MAHARASHTRA', 'India', 'unmarried', '0000-00-00', '0000-00-00', 'GRAHAM/Penguins.jpg', 7, '2015-01-15 08:25:19', '2015-01-20 08:56:16', NULL),
(5, 1, 'PHONIX', 'CBD', 8989898989, 'phonix@email.com', 9876854315, '2015-01-21', 'male', 'Student', 'BE', '', 0, 1, 'CBD', '', 'MAHARASHTRA', 'India', 'unmarried', '0000-00-00', '0000-00-00', 'PHONIX/Penguins.jpg', 6, '2015-01-21 10:42:27', '2015-01-24 07:42:43', NULL),
(6, 1, 'CONOR', 'CBD, Navi-Mumbai', 9252525252, 'conor@email.com', 987654321, '2000-02-29', 'male', 'Student', 'BE', '', 0, 1, 'CBD', '400000', 'MAHARASHTRA', 'India', 'unmarried', '0000-00-00', '0000-00-00', '', 6, '2015-02-04 08:20:35', '0000-00-00 00:00:00', NULL),
(7, 4, 'DEREK JOE', 'CBD, Navi-Mumbai', 8385858585, '', 987654321, '2015-02-01', 'male', 'Student', 'BE', '', 0, 4, 'CBD', '400000', 'MAHARASHTRA', 'India', 'unmarried', '0000-00-00', '2015-02-01', '', 11, '2015-02-04 09:41:19', '0000-00-00 00:00:00', NULL),
(8, 4, 'TONY TYLER', 'CBD, Navi-Mumbai', 8486868686, 'tony@email.com', 9876854315, '2015-02-02', 'male', 'Student', 'BE', '', 0, 4, 'CBD', '400000', 'MAHARASHTRA', 'India', 'unmarried', '0000-00-00', '2015-02-01', 'TONY TYLER/Koala.jpg', 11, '2015-02-04 11:00:44', '0000-00-00 00:00:00', NULL),
(9, 4, 'VICTOR', 'CBD, Navi-Mumbai', 8384848484, 'victor@email.com', 987654321, '2015-02-03', 'male', 'Student', 'BE', '', 0, 4, 'CBD', '400000', 'MAHARASHTRA', 'India', 'unmarried', '0000-00-00', '2015-02-01', '', 11, '2015-02-04 11:02:07', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `studentexam`
--

CREATE TABLE IF NOT EXISTS `studentexam` (
  `seid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL,
  `ceid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `note` text NOT NULL,
  `result` varchar(100) NOT NULL,
  `exam_date` date NOT NULL,
  `status` varchar(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`seid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `studentexam`
--

INSERT INTO `studentexam` (`seid`, `sid`, `ceid`, `cid`, `note`, `result`, `exam_date`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 2, 1, 'Beginner test result', '60%', '2015-01-14', 'pass', '2015-01-14 02:05:57', '0000-00-00 00:00:00', NULL),
(2, 2, 2, 1, 'Beginner test result', '60%', '2015-01-14', 'fail', '2015-01-14 02:05:57', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `temp_password` varchar(255) NOT NULL,
  `institute_id` int(11) NOT NULL,
  `mobile` bigint(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `marital_status` enum('0','married','unmarried') NOT NULL,
  `anniversary_date` date DEFAULT NULL,
  `note` text NOT NULL,
  `branch_id` int(11) NOT NULL,
  `role` varchar(25) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `username`, `password`, `temp_password`, `institute_id`, `mobile`, `email`, `name`, `dob`, `marital_status`, `anniversary_date`, `note`, `branch_id`, `role`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'john', 'e99a18c428cb38d5f260853678922e03', 'abc123', 0, 8989898989, 'john@email.com', 'JOHN NASH', '2000-02-29', '0', NULL, '', 0, 'admin', '2015-01-06 00:00:00', '0000-00-00 00:00:00', NULL),
(6, 'ron', 'e99a18c428cb38d5f260853678922e03', 'abc123', 1, 8989898989, 'ron@email.com', 'RON WILL', '2000-02-29', 'married', '2008-02-29', '0', 0, 'branchmgr', '2015-01-14 10:45:27', '0000-00-00 00:00:00', NULL),
(7, 'kyleuri', 'e99a18c428cb38d5f260853678922e03', 'abc123', 1, 8989898989, 'kyle@email.com', 'KYLE URI', '2004-02-29', '0', NULL, '0', 1, 'operator', '2015-01-14 13:58:09', '0000-00-00 00:00:00', NULL),
(8, 'quinn', 'e99a18c428cb38d5f260853678922e03', 'abc123', 1, 8989898989, 'quinn@email.com', 'QUINN', '2000-02-29', '0', NULL, '0', 0, 'branchmgr', '2015-01-14 13:59:03', '2015-01-14 14:09:20', NULL),
(9, 'walto', 'e99a18c428cb38d5f260853678922e03', 'abc123', 1, 8989898989, 'walto@email.com', 'WALTO', '2000-02-29', '0', NULL, '0', 3, 'operator', '2015-01-14 14:00:17', '2015-01-14 14:09:31', NULL),
(10, 'peterson', 'e99a18c428cb38d5f260853678922e03', 'abc123', 1, 8989898989, 'peterson@email.com', 'PETERSON', '2004-02-29', '0', NULL, '0', 0, 'branchmgr', '2015-01-14 14:11:27', '0000-00-00 00:00:00', NULL),
(11, 'vladimir', 'e99a18c428cb38d5f260853678922e03', 'abc123', 4, 9252525252, 'vladimir@email.com', 'VLADIMIR', '2015-02-04', 'unmarried', '0000-00-00', '0', 0, 'branchmgr', '2015-02-04 08:55:31', '0000-00-00 00:00:00', NULL),
(12, 'ethan', 'e99a18c428cb38d5f260853678922e03', 'abc123', 4, 8182828282, 'ethan@email.com', 'ETHAN', '2015-02-04', 'unmarried', '0000-00-00', '0', 4, 'operator', '2015-02-04 09:39:48', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `variable`
--

CREATE TABLE IF NOT EXISTS `variable` (
  `vid` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`vid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `variable`
--

INSERT INTO `variable` (`vid`, `key`, `value`) VALUES
(1, 'CRON_JOB', '0YahB50jrn'),
(2, 'sms_template', 'Thank you, |*name*|, for paying Rs. |*amount*| of |*particular*|, Regards |*institute*|'),
(3, 'sms_debit_template', 'Hello |*name*|, |*particular*| of Rs. |*amount*| is pending, Regards |*institute*|');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
