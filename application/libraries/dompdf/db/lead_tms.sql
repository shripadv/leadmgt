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
-- Database: `lead_tms`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE IF NOT EXISTS `activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_owner` int(11) NOT NULL COMMENT 'activity performer',
  `lead_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `activity_title` varchar(220) NOT NULL,
  `datetime` datetime NOT NULL,
  `activity_type` varchar(220) NOT NULL,
  `lead_status` varchar(220) NOT NULL,
  `project_status` varchar(220) NOT NULL,
  `comment` varchar(220) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`activity_id`, `activity_owner`, `lead_id`, `project_id`, `activity_title`, `datetime`, `activity_type`, `lead_status`, `project_status`, `comment`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 0, 'Demo', '2015-06-16 11:35:36', 'meeting', '6', '', 'DEmo meeting', 3, '2015-06-16 11:35:36', '0000-00-00 00:00:00'),
(2, 3, 1, 0, 'gsfdgfdg', '2015-06-16 16:02:18', 'meeting', '6', '', 'sdfgsdgsd', 3, '2015-06-16 16:02:18', '0000-00-00 00:00:00'),
(3, 3, 2, 0, 'DEdsfs', '2015-06-16 16:07:59', 'meeting', '6', '', 'sdfsdfsdf', 3, '2015-06-16 16:07:59', '0000-00-00 00:00:00'),
(5, 2, 2, 0, 'safdsdf', '2015-07-03 08:21:19', 'other', '1', '', 'asdfdsfsf', 2, '2015-07-03 08:18:28', '2015-07-03 08:21:19'),
(6, 2, 1, 0, 'sdfdsf fsdafdsafsd', '2015-07-03 08:31:27', 'meeting', '2', '', 'asfsdfdsfsd', 2, '2015-07-03 08:30:59', '2015-07-03 08:31:27');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE IF NOT EXISTS `company` (
  `companyid` int(11) NOT NULL AUTO_INCREMENT,
  `companyname` varchar(255) DEFAULT NULL,
  `shortname` text NOT NULL,
  `tag_line` varchar(100) NOT NULL,
  `owner` varchar(150) NOT NULL,
  `cemail` varchar(100) NOT NULL,
  `cmobile` varchar(13) NOT NULL,
  `ctel` varchar(20) NOT NULL,
  `pan` varchar(50) NOT NULL,
  `sertexno` varchar(50) NOT NULL,
  `caddress` varchar(255) NOT NULL,
  `clogo` text,
  `establishdate` date NOT NULL,
  `invoice_template` text NOT NULL,
  `terms_condition` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`companyid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`companyid`, `companyname`, `shortname`, `tag_line`, `owner`, `cemail`, `cmobile`, `ctel`, `pan`, `sertexno`, `caddress`, `clogo`, `establishdate`, `invoice_template`, `terms_condition`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'RBS LOGISTICS INDIA PVT LTD', 'RBS LOGISTICS(I) PVT LTD.', 'TOTAL SUPPLY CHAIN SOLUTION', 'RAJDOOT', 'rajdoot.shinde@rbslogistics.in', '2266733888', '2265241888', 'AAGCR3777G', 'AAGCR3777GSD001', 'Office No.34 & 35, Ground Floor, Agarwal Trade Centre, Sector No.11, CBD, Belapur,\r\nNavi Mumbai-400614.', '', '0000-00-00', '0', '1. SUBJECT TO NAVI MUMBAI JURISDICTION\r\n2. CONSIGNOR/CONSIGNEE SHOULD TAKE THEIR \r\nOWN INSURANCE TO PROTECT THEMSELVES AGAINST ANY RISK\r\n3. Service tax should be paid to GOVT by benificiary only.', '2015-04-10 09:35:09', '2015-06-17 09:08:05', NULL),
(2, 'RON PVT LTD', 'RON PVT LTD', '', 'RON', '', '', '', '', '', 'CBD, Navi-Mumbai', '', '0000-00-00', '1', '', '2015-06-10 13:19:39', '0000-00-00 00:00:00', '2015-06-16 09:49:53');

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
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `custid` int(11) NOT NULL AUTO_INCREMENT,
  `people_id` int(11) NOT NULL,
  `companyid` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`custid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `deten`
--

CREATE TABLE IF NOT EXISTS `deten` (
  `deten_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `deten_rate` int(11) NOT NULL,
  `deten_days` int(11) NOT NULL,
  `deten_place` varchar(220) NOT NULL,
  `total` int(11) NOT NULL,
  PRIMARY KEY (`deten_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `deten`
--

INSERT INTO `deten` (`deten_id`, `job_id`, `deten_rate`, `deten_days`, `deten_place`, `total`) VALUES
(1, 1, 100, 15, 'CBD', 1500),
(2, 2, 0, 0, '', 0),
(3, 4, 0, 0, '', 0),
(4, 4, 0, 0, '', 0),
(5, 5, 10, 1, 'CBD', 10),
(6, 5, 15, 1, 'Khaghar', 15);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) NOT NULL,
  `people_id` int(11) NOT NULL,
  `dob` date NOT NULL,
  `join_date` date NOT NULL,
  `designation` varchar(220) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `companyid`, `people_id`, `dob`, `join_date`, `designation`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '0000-00-00', '0000-00-00', 'superadmin', '0000-00-00 00:00:00', NULL),
(2, 1, 2, '2015-04-28', '2015-04-28', 'Director', '2015-04-29 00:00:00', '0000-00-00 00:00:00'),
(3, 1, 3, '0000-00-00', '0000-00-00', '', '2015-06-10 13:24:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE IF NOT EXISTS `expenses` (
  `exid` int(10) NOT NULL AUTO_INCREMENT,
  `companyid` int(10) NOT NULL,
  `extid` int(3) DEFAULT NULL,
  `payment_type` enum('cheque','cash') CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` float NOT NULL,
  `date` date NOT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`exid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `expense_type`
--

CREATE TABLE IF NOT EXISTS `expense_type` (
  `extid` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `note` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`extid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE IF NOT EXISTS `file` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` int(11) NOT NULL,
  `file_title` varchar(200) NOT NULL,
  `file_path` varchar(200) NOT NULL,
  `project_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `file_type` varchar(220) NOT NULL,
  `file_size` varchar(220) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `industry`
--

CREATE TABLE IF NOT EXISTS `industry` (
  `industry_id` int(11) NOT NULL AUTO_INCREMENT,
  `industry` varchar(220) NOT NULL,
  PRIMARY KEY (`industry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE IF NOT EXISTS `invoice` (
  `inid` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(50) NOT NULL,
  `companyid` int(12) NOT NULL,
  `custid` int(11) NOT NULL,
  `total_amount` float NOT NULL,
  `advance` int(11) NOT NULL,
  `bill_date` date NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`inid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_item`
--

CREATE TABLE IF NOT EXISTS `invoice_item` (
  `initid` int(11) NOT NULL AUTO_INCREMENT,
  `inid` int(11) NOT NULL,
  `particular` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `rate` float NOT NULL,
  `amount` float NOT NULL,
  `tax_id` int(11) NOT NULL COMMENT '0 for added item and other than 0 is tax item',
  `reimbursement` int(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`initid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_item_update`
--

CREATE TABLE IF NOT EXISTS `invoice_item_update` (
  `initid` int(11) NOT NULL,
  `inid` int(11) NOT NULL,
  `particular` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `rate` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_update`
--

CREATE TABLE IF NOT EXISTS `invoice_update` (
  `inid` int(11) NOT NULL,
  `invoice_no` varchar(50) NOT NULL,
  `custid` int(11) NOT NULL,
  `total_amount` int(11) NOT NULL,
  `advance` int(11) NOT NULL,
  `bill_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `job_register`
--

CREATE TABLE IF NOT EXISTS `job_register` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) NOT NULL,
  `trip` int(11) NOT NULL,
  `invoice_number` varchar(50) NOT NULL,
  `bill_date` date DEFAULT NULL,
  `lr_no` int(11) NOT NULL,
  `lr_date` date NOT NULL,
  `client_id` int(11) NOT NULL,
  `consignor_id` int(11) NOT NULL,
  `consignor_type` varchar(220) NOT NULL,
  `consignee_id` int(11) NOT NULL,
  `consignee_type` varchar(220) NOT NULL,
  `driver_name` varchar(220) NOT NULL,
  `vehicle` varchar(220) NOT NULL,
  `trip_no` int(11) NOT NULL,
  `container_no` varchar(100) NOT NULL,
  `container_size` varchar(100) NOT NULL,
  `SHPT` varchar(100) NOT NULL,
  `from` varchar(220) NOT NULL,
  `destination` varchar(220) NOT NULL,
  `back_to` varchar(220) NOT NULL,
  `weight` int(11) NOT NULL,
  `weight_measurement` varchar(100) DEFAULT NULL,
  `bkfright` int(11) NOT NULL,
  `vendorfright` int(11) NOT NULL,
  `kickback` int(11) NOT NULL,
  `ECOC` varchar(100) NOT NULL,
  `offload_date` date NOT NULL,
  `advance` int(11) NOT NULL COMMENT 'advance received from client',
  `adv_client_note` text NOT NULL,
  `advance_to_driver` int(11) NOT NULL COMMENT 'advanced paid to driver',
  `adv_driver_note` text NOT NULL,
  `vendor` int(11) NOT NULL,
  `bill_no` varchar(100) DEFAULT NULL,
  `misc` double NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `job_register`
--

INSERT INTO `job_register` (`job_id`, `companyid`, `trip`, `invoice_number`, `bill_date`, `lr_no`, `lr_date`, `client_id`, `consignor_id`, `consignor_type`, `consignee_id`, `consignee_type`, `driver_name`, `vehicle`, `trip_no`, `container_no`, `container_size`, `SHPT`, `from`, `destination`, `back_to`, `weight`, `weight_measurement`, `bkfright`, `vendorfright`, `kickback`, `ECOC`, `offload_date`, `advance`, `adv_client_note`, `advance_to_driver`, `adv_driver_note`, `vendor`, `bill_no`, `misc`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 'TRPT-001', '2015-05-13', 1, '2015-05-13', 6, 3, 'importer', 4, 'exporter', 'asfsaf', 'MH46 AZ 9638', 0, 'asfdsd', '20ft', 'import', 'CBD', 'CBD', 'CBD', 222, NULL, 4354, 0, 0, '600', '2015-05-13', 2000, '', 0, '', 2, '5435435', 0, '2015-05-13 10:30:10', '2015-05-22 11:36:13'),
(2, 1, 0, 'TRPT-002', '2015-05-30', 2, '2015-05-30', 6, 5, 'importer', 4, 'exporter', 'KARL', 'MH46 AZ 966', 0, 'AABB-15935746', '20ft', 'import', 'CBD', 'CBD', 'CBD', 120, NULL, 4500, 0, 0, '600', '2015-05-30', 0, '', 0, '', 0, '', 0, '2015-05-30 08:46:13', NULL),
(3, 1, 0, 'TRPT-003', '2015-05-13', 1, '2015-05-13', 6, 3, 'importer', 4, 'exporter', 'asfsaf', 'MH46 AZ 9638', 0, 'asfdsd', '20ft', 'import', 'CBD', 'CBD', 'CBD', 222, NULL, 4354, 0, 0, '600', '2015-05-13', 2000, '', 0, '', 2, '5435435', 0, '2015-05-13 10:30:10', '2015-05-22 11:36:13'),
(4, 1, 0, 'TRPT-004', '2015-07-03', 4, '2015-07-03', 10, 6, 'importer', 7, 'exporter', 'Kyle', 'MH 06 P 899', 0, '', '', '', 'CBD', 'CBD', 'CBD', 0, 'kg', 2000, 0, 0, '', '2015-07-03', 1500, '', 1000, '', 0, '', 0, '2015-07-03 09:58:03', NULL),
(5, 1, 0, '', '2015-07-03', 5, '2015-07-03', 10, 11, 'importer', 12, 'exporter', 'Kyle', 'MH 46 F 420', 0, 'sdfsdf342342', '20ft', 'export', 'CBD', 'CBD', 'CBD', 200, 'kg', 2000, 1800, 0, '', '2015-07-03', 1200, 'Demo ADV', 500, 'Demo Adv', 7, '', 0, '2015-07-03 10:08:29', '2015-07-03 10:43:49');

-- --------------------------------------------------------

--
-- Table structure for table `kata`
--

CREATE TABLE IF NOT EXISTS `kata` (
  `kata_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `kata_charge` int(11) NOT NULL,
  `kata_place` varchar(220) NOT NULL,
  PRIMARY KEY (`kata_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `kata`
--

INSERT INTO `kata` (`kata_id`, `job_id`, `kata_charge`, `kata_place`) VALUES
(1, 1, 100, 'CBD'),
(2, 1, 100, 'Vashi'),
(3, 2, 200, 'CBD'),
(4, 4, 0, ''),
(5, 4, 0, ''),
(6, 5, 20, 'CBD'),
(7, 5, 21, 'Khaghar');

-- --------------------------------------------------------

--
-- Table structure for table `lead`
--

CREATE TABLE IF NOT EXISTS `lead` (
  `lead_id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) NOT NULL,
  `lead_owner` int(11) NOT NULL COMMENT 'owner user id',
  `people_id` int(11) NOT NULL,
  `lead_source` varchar(220) NOT NULL,
  `product` text NOT NULL,
  `lead_status` varchar(220) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL COMMENT 'creater user id',
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`lead_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `lead`
--

INSERT INTO `lead` (`lead_id`, `companyid`, `lead_owner`, `people_id`, `lead_source`, `product`, `lead_status`, `created_at`, `created_by`, `updated_at`) VALUES
(1, 1, 2, 4, '4', 'WAREHOUSING,TRANSPOTATION', '2', '2015-04-29 08:47:26', 2, '2015-07-03 08:31:27'),
(2, 1, 3, 5, '4', 'WAREHOUSING', '1', '2015-06-16 16:07:41', 3, '2015-07-03 08:21:19');

-- --------------------------------------------------------

--
-- Table structure for table `lead_source`
--

CREATE TABLE IF NOT EXISTS `lead_source` (
  `lead_source_id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_source` varchar(220) NOT NULL,
  PRIMARY KEY (`lead_source_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `lead_source`
--

INSERT INTO `lead_source` (`lead_source_id`, `lead_source`) VALUES
(1, 'Could calling'),
(2, 'Online marketing'),
(3, 'Referrals'),
(4, 'Personal Contact'),
(5, 'Event'),
(6, 'Email marketing');

-- --------------------------------------------------------

--
-- Table structure for table `lead_status`
--

CREATE TABLE IF NOT EXISTS `lead_status` (
  `lead_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_status` varchar(220) NOT NULL,
  `rank` int(11) NOT NULL,
  `color` varchar(220) NOT NULL,
  PRIMARY KEY (`lead_status_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `lead_status`
--

INSERT INTO `lead_status` (`lead_status_id`, `lead_status`, `rank`, `color`) VALUES
(1, 'Convert', 4, '#20A821'),
(2, 'follow-up', 2, '#3CB2BC'),
(3, 'bad info', 3, '#CF1F1F'),
(5, 'Closed', 5, '#A82020'),
(6, 'Open', 1, '#3C3DBC');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) NOT NULL,
  `location` varchar(220) NOT NULL,
  `note` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_id`, `companyid`, `location`, `note`, `created_at`, `updated_at`) VALUES
(1, 1, 'CBD', '', '2015-06-17 00:00:00', NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=126 ;

--
-- Dumping data for table `log_history`
--

INSERT INTO `log_history` (`log_id`, `uid`, `name`, `datetime`) VALUES
(88, 3, 'john@email.com', '2015-04-29 07:00:00'),
(89, 3, 'john@email.com', '2015-04-29 08:00:00'),
(90, 3, 'john@email.com', '2015-04-29 12:00:00'),
(91, 3, 'john@email.com', '2015-04-29 12:00:00'),
(92, 3, 'john@email.com', '2015-06-10 13:00:00'),
(93, 1, 'info@gordinateur.com ', '2015-06-10 13:00:00'),
(94, 3, 'john@email.com', '2015-06-16 09:00:00'),
(95, 1, 'info@gordinateur.com ', '2015-06-16 09:00:00'),
(96, 2, 'rajdoot.shinde@rbslogistics.in', '2015-06-16 09:00:00'),
(97, 2, 'rajdoot.shinde@rbslogistics.in', '2015-06-16 09:00:00'),
(98, 1, 'info@gordinateur.com ', '2015-06-16 09:00:00'),
(99, 3, 'john@email.com', '2015-06-16 09:00:00'),
(100, 2, 'rajdoot.shinde@rbslogistics.in', '2015-06-16 10:00:00'),
(101, 3, 'john@email.com', '2015-06-16 11:00:00'),
(102, 3, 'john@email.com', '2015-06-16 16:00:00'),
(103, 3, 'john@email.com', '2015-06-16 16:00:00'),
(104, 1, 'info@gordinateur.com ', '2015-06-17 09:00:00'),
(105, 3, 'john@email.com', '2015-06-17 09:00:00'),
(106, 3, 'john@email.com', '2015-06-17 09:00:00'),
(107, 3, 'john@email.com', '2015-06-17 09:00:00'),
(108, 2, 'rajdoot.shinde@rbslogistics.in', '2015-06-17 09:00:00'),
(109, 3, 'john@email.com', '2015-06-17 09:00:00'),
(110, 3, 'john@email.com', '2015-06-17 11:00:00'),
(111, 2, 'rajdoot.shinde@rbslogistics.in', '2015-06-17 11:00:00'),
(112, 1, 'info@gordinateur.com ', '2015-06-18 14:00:00'),
(113, 3, 'john@email.com', '2015-06-26 13:00:00'),
(114, 3, 'john@email.com', '2015-07-03 06:00:00'),
(115, 2, 'rajdoot.shinde@rbslogistics.in', '2015-07-03 07:00:00'),
(116, 3, 'john@email.com', '2015-07-03 07:00:00'),
(117, 3, 'john@email.com', '2015-07-03 07:00:00'),
(118, 2, 'rajdoot.shinde@rbslogistics.in', '2015-07-03 08:00:00'),
(119, 2, 'rajdoot.shinde@rbslogistics.in', '2015-07-03 08:00:00'),
(120, 2, 'rajdoot.shinde@rbslogistics.in', '2015-07-03 08:00:00'),
(121, 3, 'john@email.com', '2015-07-03 11:00:00'),
(122, 3, 'john@email.com', '2015-07-03 15:00:00'),
(123, 2, 'rajdoot.shinde@rbslogistics.in', '2015-07-04 10:00:00'),
(124, 3, 'john@email.com', '2015-07-20 10:00:00'),
(125, 3, 'john@email.com', '2015-07-20 10:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `payment_received`
--

CREATE TABLE IF NOT EXISTS `payment_received` (
  `prid` int(10) NOT NULL AUTO_INCREMENT,
  `companyid` int(10) NOT NULL,
  `inid` int(11) DEFAULT NULL COMMENT 'Invoice id',
  `payment_type` enum('cheque','cash') CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` float NOT NULL,
  `date` date NOT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`prid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE IF NOT EXISTS `people` (
  `people_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(220) NOT NULL,
  `first_name` varchar(220) NOT NULL,
  `last_name` varchar(220) NOT NULL,
  `email` varchar(220) NOT NULL,
  `mobile` varchar(220) NOT NULL,
  `phone` varchar(220) NOT NULL,
  `website` varchar(220) NOT NULL,
  `sec_email` varchar(220) NOT NULL,
  `industry` varchar(220) NOT NULL,
  `skype` varchar(220) NOT NULL,
  `address1` varchar(220) NOT NULL,
  `address2` varchar(220) NOT NULL,
  `city` varchar(220) NOT NULL,
  `state` varchar(220) NOT NULL,
  `country` varchar(220) NOT NULL,
  `note` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`people_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`people_id`, `company_name`, `first_name`, `last_name`, `email`, `mobile`, `phone`, `website`, `sec_email`, `industry`, `skype`, `address1`, `address2`, `city`, `state`, `country`, `note`, `created_at`, `updated_at`) VALUES
(1, 'Gordinateur', 'Gunesh', '', 'info@gordinateur.com ', '', '', '', '', 'Software', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'RBS LOGISTICS', 'RAJDOOT', 'A', 'rajdoot.shinde@rbslogistics.in', '8879331466', '', '', '', '', '', 'Address', '', 'belapur', 'maharashatra', 'india', '', '2015-04-10 09:45:30', '0000-00-00 00:00:00'),
(3, 'Gordinateur', 'John', 'Nash', 'john@email.com', '', '', '', '', 'Software', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'RON PVT LTD', 'Ron', 'Will', 'ron@email.com', '9272727272', '', 'www.ron.com', '', '', '', 'CBD, Navi-Mumbai', '', 'CBD', 'MAHARASHTRA', 'India', '', '2015-06-16 00:00:00', '0000-00-00 00:00:00'),
(5, 'ABC PVT LTD', 'ALBERT', 'D', 'albert@email.com', '9252525252', '', '', '', '', '', 'CBD, Navi-Mumbai', '', 'CBD', 'maharashatra', 'india', '0', '2015-06-16 16:07:41', '0000-00-00 00:00:00'),
(6, 'RON PVT LTD', 'RON', 'VALDIMIR', 'ron@email.com', '9272727272', '', '', '', '', '', 'CBD, Navi-Mumbai', '', 'CBD', 'maharashatra', 'india', '', '2015-06-17 08:44:08', '0000-00-00 00:00:00'),
(7, 'CONOR PVT. LTD.', 'CONOR', 'POL', 'conor@email.com', '9242424242', '', '', '', '', '', 'CBD, Navi-Mumbai', '', 'CBD', 'maharashatra', 'india', '', '2015-06-17 08:47:28', '0000-00-00 00:00:00'),
(8, 'GRAHAM PVT. LTD.', 'GRAHAM', 'WILL', 'graham@email.com', '9252525252', '', '', '', '', '', 'CBD, Navi-Mumbai', '', 'CBD', 'maharashatra', 'india', '', '2015-06-17 08:48:17', '0000-00-00 00:00:00'),
(9, 'PHONIX LTD.', 'PHONIX', 'SMITH', 'phonix@yopmail.com', '9262626262', '', '', '', '', '', 'CBD, Navi-Mumbai', '', 'CBD', 'maharashatra', 'india', '', '2015-06-17 08:49:41', '0000-00-00 00:00:00'),
(10, 'ABC PVT LTD', 'PAUL', 'POL', 'paul@email.com', '9262626262', '', '', '', '', '', 'CBD, Navi-Mumbai', '', 'CBD', 'MAHARASHTRA', 'India', '', '2015-07-03 07:41:02', '0000-00-00 00:00:00'),
(11, 'Andrew', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'Uri', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) NOT NULL,
  `product_title` varchar(220) NOT NULL,
  `price` int(6) NOT NULL,
  `note` text NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `companyid`, `product_title`, `price`, `note`, `created_at`) VALUES
(1, 1, 'WAREHOUSING', 0, '', '2015-04-28 00:00:00'),
(2, 1, 'TRANSPOTATION', 0, '', '2015-04-28 00:00:00'),
(3, 1, 'CHA', 0, '', '2015-04-28 00:00:00'),
(4, 1, 'FRIGHT FORWARDING', 0, '', '2015-04-28 00:00:00'),
(5, 1, '3PL', 0, '', '2015-05-01 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) NOT NULL,
  `project_title` varchar(220) NOT NULL,
  `lead_id` int(11) NOT NULL,
  `custid` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `project_status` varchar(220) NOT NULL,
  `apporx_end` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_status`
--

CREATE TABLE IF NOT EXISTS `project_status` (
  `project_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_status` varchar(220) NOT NULL,
  `project_status_color` varchar(220) NOT NULL,
  PRIMARY KEY (`project_status_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `project_status`
--

INSERT INTO `project_status` (`project_status_id`, `project_status`, `project_status_color`) VALUES
(1, 'Inserted', ''),
(2, 'In progress', ''),
(3, 'ready to test', ''),
(4, 'Buggy', ''),
(5, 'tested', ''),
(6, 'unclear', ''),
(7, 'Complete', '');

-- --------------------------------------------------------

--
-- Table structure for table `reminder`
--

CREATE TABLE IF NOT EXISTS `reminder` (
  `reminder_id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) NOT NULL,
  `reminder_title` varchar(220) NOT NULL,
  `remind_to` int(11) NOT NULL COMMENT 'user id',
  `datettime` datetime NOT NULL,
  `project_id` int(11) NOT NULL,
  `lead_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`reminder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE IF NOT EXISTS `service` (
  `serviceid` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) NOT NULL,
  `servicename` text NOT NULL,
  `note` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
-- Table structure for table `tax`
--

CREATE TABLE IF NOT EXISTS `tax` (
  `taxid` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `tax` int(11) NOT NULL,
  `note` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`taxid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tms_people`
--

CREATE TABLE IF NOT EXISTS `tms_people` (
  `tms_people_id` int(11) NOT NULL AUTO_INCREMENT,
  `people_id` int(11) NOT NULL,
  `companyid` int(11) NOT NULL,
  `people_type` varchar(220) NOT NULL,
  `ctype` varchar(220) NOT NULL,
  PRIMARY KEY (`tms_people_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `tms_people`
--

INSERT INTO `tms_people` (`tms_people_id`, `people_id`, `companyid`, `people_type`, `ctype`) VALUES
(1, 6, 1, 'client', ''),
(2, 7, 1, 'vendor', ''),
(3, 8, 1, 'consignor', 'importer'),
(4, 9, 1, 'consignee', 'exporter'),
(5, 10, 1, 'client', ''),
(6, 11, 1, 'consignor', 'importer'),
(7, 12, 1, 'consignee', 'exporter');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `uid` int(6) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) NOT NULL,
  `people_id` int(11) NOT NULL,
  `password` varchar(100) NOT NULL,
  `temp` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `note` text NOT NULL,
  `role` enum('admin','user','employee') NOT NULL,
  `leadmgt` enum('0','1') NOT NULL COMMENT '1 for have access 0 for no access',
  `tms` enum('0','1') NOT NULL COMMENT '1 for have access 0 for no access',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `companyid`, `people_id`, `password`, `temp`, `email`, `dob`, `note`, `role`, `leadmgt`, `tms`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 1, 'a800038549d9e6e80afe85b877708272', 'gunesh123', 'info@gordinateur.com', '0000-00-00', '', 'admin', '0', '0', '2015-03-16 00:00:00', '0000-00-00 00:00:00', NULL),
(2, 1, 2, 'f1f1dc9d4b60771a9770a15777820cee', 'rbs@123', 'rajdoot.shinde@rbslogistics.in', '2015-04-10', '', 'user', '1', '1', '2015-04-10 09:45:30', '0000-00-00 00:00:00', NULL),
(3, 1, 3, 'e99a18c428cb38d5f260853678922e03', 'abc123', 'john@email.com', '2015-04-10', '', 'user', '0', '1', '2015-04-10 09:45:30', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE IF NOT EXISTS `vehicle` (
  `vehicle_id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) NOT NULL,
  `people_id` int(11) NOT NULL,
  `vehicle_no` varchar(220) NOT NULL,
  `vehicle_type` varchar(220) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`vehicle_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`vehicle_id`, `companyid`, `people_id`, `vehicle_no`, `vehicle_type`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 'MH46 AZ 9638', 'Taurus', '2015-05-12 12:56:21', NULL),
(2, 1, 7, 'MH46 AZ 966', '407-Tempo', '2015-05-12 13:57:06', NULL),
(3, 1, 0, 'MH 06 P 899', '', '0000-00-00 00:00:00', NULL),
(4, 1, 0, 'MH 46 F 420', '', '0000-00-00 00:00:00', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
