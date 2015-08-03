-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2015 at 01:22 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `diamond`
--

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
  `cmobile` bigint(11) NOT NULL,
  `ctel` bigint(20) NOT NULL,
  `pan` varchar(50) NOT NULL,
  `sertexno` varchar(50) NOT NULL,
  `caddress` varchar(255) NOT NULL,
  `clogo` text,
  `establishdate` date DEFAULT NULL,
  `invoice_template` int(1) NOT NULL,
  `terms_condition` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`companyid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`companyid`, `companyname`, `shortname`, `tag_line`, `owner`, `cemail`, `cmobile`, `ctel`, `pan`, `sertexno`, `caddress`, `clogo`, `establishdate`, `invoice_template`, `terms_condition`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'DIAMOND LOGISTICS', 'DL', '', '', 'info@diamondlogistics.in', 9702744687, 2241237517, '', '', 'Office No. 227/ B,\r\nSecond Floor, Sai Chamber,\r\nPlot No. 44, Sector-11,\r\nCBD Belapur, Navi Mumbai.\r\nPin- 400614.', 'DL/600100.png', '0000-00-00', 0, '1) The Cheque/DD should be drawn in favour of DIAMOND LOGISTIC\r\n2) For RTGS/NEFT Payment :-\r\nA/C No :-0183102000009751/IFSC CODE -IBKL 0000183\r\nBank Name :- IDBI BANK, Branch :- CBD Belapur \r\nPAN NO. AISPB7546C\r\nST NO. AISPB7546CSD001', '2015-05-27 06:58:01', '2015-05-28 14:37:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `container`
--

CREATE TABLE IF NOT EXISTS `container` (
  `container_id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `container_no` varchar(220) NOT NULL,
  `container_type` varchar(100) NOT NULL,
  `truck_no` varchar(220) NOT NULL,
  `truckintime` datetime NOT NULL,
  `truckinremark` text NOT NULL,
  `truckouttime` datetime NOT NULL,
  `truckoutremark` text NOT NULL,
  `description` text NOT NULL,
  `pkgs_type` varchar(220) NOT NULL,
  `pkgs_quantity` int(11) NOT NULL,
  `unit_pkgs_wt` int(11) NOT NULL,
  `net_wt` varchar(220) NOT NULL,
  `gross_wt` varchar(220) NOT NULL,
  `remark` text NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`container_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `container`
--

INSERT INTO `container` (`container_id`, `companyid`, `job_id`, `container_no`, `container_type`, `truck_no`, `truckintime`, `truckinremark`, `truckouttime`, `truckoutremark`, `description`, `pkgs_type`, `pkgs_quantity`, `unit_pkgs_wt`, `net_wt`, `gross_wt`, `remark`, `created_at`) VALUES
(1, 1, 1, 'NYKU777999666', '20', 'MH46 XZ 3232', '2015-05-27 15:15:00', '', '2015-05-27 16:30:00', '', '', 'Bags(Mesh)', 0, 0, '', '', '', '2015-05-27 12:34:17');

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
-- Table structure for table `invoice`
--

CREATE TABLE IF NOT EXISTS `invoice` (
  `inid` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `invoice_number` varchar(50) NOT NULL,
  `people_id` int(11) NOT NULL,
  `total_amount` double NOT NULL,
  `bill_date` date NOT NULL,
  `payment_status` varchar(50) NOT NULL,
  `bill_type` varchar(220) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`inid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`inid`, `companyid`, `job_id`, `invoice_number`, `people_id`, `total_amount`, `bill_date`, `payment_status`, `bill_type`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'inv/CL/001', 1, 5500, '2015-05-28', 'drafted', 'clearing', '2015-05-28 10:34:50', '2015-05-28 13:09:33'),
(2, 1, 1, 'inv/AL/001', 1, 6118, '2015-05-29', 'drafted', 'agency', '2015-05-29 11:19:09', '2015-05-29 13:38:11');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_item`
--

CREATE TABLE IF NOT EXISTS `invoice_item` (
  `initid` int(11) NOT NULL AUTO_INCREMENT,
  `inid` int(11) NOT NULL,
  `particularid` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` double NOT NULL,
  `tax_id` int(11) NOT NULL COMMENT '0 for added item and other than 0 is tax item(tax id)',
  `tax_rate` double DEFAULT NULL,
  `tax_amount` double DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`initid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `invoice_item`
--

INSERT INTO `invoice_item` (`initid`, `inid`, `particularid`, `description`, `amount`, `tax_id`, `tax_rate`, `tax_amount`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'fdaf', 5000, 0, NULL, NULL, '2015-05-28 10:34:50', '2015-05-28 13:13:39'),
(2, 1, 2, 'tc', 500, 0, NULL, NULL, '0000-00-00 00:00:00', '2015-05-28 13:13:39'),
(3, 2, 0, 'Agency Bill', 5000, 0, NULL, NULL, '2015-05-29 11:19:09', '2015-05-29 13:38:11'),
(4, 2, 0, '', 618, 1, 12.36, 618, '2015-05-29 11:19:09', '2015-05-29 13:38:11'),
(5, 2, 0, '', 500, 2, 10, 500, '2015-05-29 13:35:39', '2015-05-29 13:38:11');

-- --------------------------------------------------------

--
-- Table structure for table `job_register`
--

CREATE TABLE IF NOT EXISTS `job_register` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) NOT NULL,
  `invoice_number` varchar(100) NOT NULL,
  `bill_date` date NOT NULL,
  `exporter_id` int(11) NOT NULL,
  `consignee` varchar(220) NOT NULL,
  `sb_no` varchar(100) NOT NULL,
  `sb_date` date NOT NULL,
  `no_of_container` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `pkgs` varchar(220) NOT NULL,
  `rate` int(11) NOT NULL,
  `fob` double NOT NULL,
  `pod` varchar(220) NOT NULL,
  `country_of_destination` varchar(220) NOT NULL,
  `pol` varchar(220) NOT NULL,
  `vessel_name` varchar(220) NOT NULL,
  `voy_no` varchar(100) NOT NULL,
  `cutofftime` varchar(220) NOT NULL,
  `gate` varchar(100) NOT NULL,
  `agent` varchar(220) NOT NULL,
  `broaker` varchar(220) NOT NULL,
  `freight_amount` int(11) NOT NULL,
  `stuffing_place` varchar(100) NOT NULL,
  `bill_no` varchar(220) NOT NULL,
  `bill_amount` int(11) NOT NULL,
  `ep_status` varchar(220) NOT NULL,
  `remark` text NOT NULL,
  `net_wt` varchar(220) NOT NULL,
  `gross_wt` varchar(220) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `job_register`
--

INSERT INTO `job_register` (`job_id`, `companyid`, `invoice_number`, `bill_date`, `exporter_id`, `consignee`, `sb_no`, `sb_date`, `no_of_container`, `description`, `pkgs`, `rate`, `fob`, `pod`, `country_of_destination`, `pol`, `vessel_name`, `voy_no`, `cutofftime`, `gate`, `agent`, `broaker`, `freight_amount`, `stuffing_place`, `bill_no`, `bill_amount`, `ep_status`, `remark`, `net_wt`, `gross_wt`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'inv/001', '2015-05-27', 1, 'DE OCEAN', '3777846', '2015-05-27', '10 X 20', 'ONION', '24000 BAGS', 0, 0, 'CBD', 'Malaysia', 'CBD', 'WAN HAI 502', 'E-056', 'E-056', 'JNPT', 'EVERGREEN', 'INTERCONT', 0, 'MR', '', 0, '', '', '120.000 MTS', '121.200 MTS', 2, '2015-05-27 09:44:05', NULL);

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
(1, 1, 'CBD', '', '2015-05-27 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `login_history`
--

CREATE TABLE IF NOT EXISTS `login_history` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `name` varchar(220) NOT NULL,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `login_history`
--

INSERT INTO `login_history` (`login_id`, `users_id`, `name`, `datetime`) VALUES
(1, 2, 'john', '2015-05-27 06:00:00'),
(2, 1, 'admin', '2015-05-27 06:00:00'),
(3, 1, 'admin', '2015-05-27 07:00:00'),
(4, 2, 'john', '2015-05-27 07:00:00'),
(5, 2, 'john', '2015-05-28 06:00:00'),
(6, 2, 'john', '2015-05-28 08:00:00'),
(7, 2, 'john', '2015-05-28 16:00:00'),
(8, 2, 'john', '2015-05-29 07:00:00'),
(9, 2, 'john', '2015-05-29 14:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `particular`
--

CREATE TABLE IF NOT EXISTS `particular` (
  `particularid` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) NOT NULL,
  `particularname` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`particularid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `particular`
--

INSERT INTO `particular` (`particularid`, `companyid`, `particularname`, `created_at`, `updated_at`) VALUES
(1, 1, 'C & F CHARGES', '2015-05-27 13:54:10', '0000-00-00 00:00:00'),
(2, 1, 'Transportation Charges', '2015-05-27 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `payment_received`
--

CREATE TABLE IF NOT EXISTS `payment_received` (
  `prid` int(10) NOT NULL AUTO_INCREMENT,
  `companyid` int(10) NOT NULL,
  `inid` int(11) DEFAULT NULL COMMENT 'Invoice id',
  `job_id` int(11) NOT NULL,
  `payment_type` enum('cheque','cash') CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` double NOT NULL,
  `date` date NOT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`prid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `payment_received`
--

INSERT INTO `payment_received` (`prid`, `companyid`, `inid`, `job_id`, `payment_type`, `ref_no`, `amount`, `date`, `note`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'cash', '', 2000, '2015-05-28', '', '2015-05-28 10:34:50', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE IF NOT EXISTS `people` (
  `people_id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) NOT NULL,
  `people_type` varchar(220) NOT NULL,
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
  `iec_no` int(11) DEFAULT NULL,
  `iec_date` date DEFAULT NULL,
  `address1` varchar(220) NOT NULL,
  `address2` varchar(220) NOT NULL,
  `city` varchar(220) NOT NULL,
  `state` varchar(220) NOT NULL,
  `country` varchar(220) NOT NULL,
  `note` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`people_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`people_id`, `companyid`, `people_type`, `company_name`, `first_name`, `last_name`, `email`, `mobile`, `phone`, `website`, `sec_email`, `industry`, `skype`, `iec_no`, `iec_date`, `address1`, `address2`, `city`, `state`, `country`, `note`, `created_at`, `updated_at`) VALUES
(1, 1, 'exporter', 'CONOR PVT. LTD.', 'CONOR', 'STEVE', 'conor@email.com', '9252525252', '', '', '', '', '', 0, '2015-05-27', 'CBD, Navi-Mumbai', '', 'CBD', 'MAHARASHTRA', 'India', '', '2015-05-27 08:10:49', NULL);

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
  `tax` double NOT NULL,
  `tax_based` enum('1','2','3') NOT NULL COMMENT '1 for clearing bill, 2 for agency bill, 3 for both',
  `tax_include` enum('0','1') NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`taxid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tax`
--

INSERT INTO `tax` (`taxid`, `companyid`, `name`, `tax`, `tax_based`, `tax_include`, `created_at`, `updated_at`) VALUES
(1, 1, 'SERVICE TAX@', 12.36, '2', '1', '2015-05-29 08:52:41', '2015-05-29 10:55:33'),
(2, 1, 'TDS@', 10, '2', '1', '2015-05-29 12:30:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `users_id` int(6) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) NOT NULL,
  `password` varchar(100) NOT NULL,
  `temp` varchar(100) NOT NULL,
  `username` varchar(220) NOT NULL,
  `email` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `note` text NOT NULL,
  `role` enum('admin','user') NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`users_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`users_id`, `companyid`, `password`, `temp`, `username`, `email`, `dob`, `note`, `role`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'e99a18c428cb38d5f260853678922e03', 'abc123', 'admin', 'admin@email.com', '1996-02-29', '', 'admin', '2015-05-05 00:00:00', '2015-05-05 09:00:59', NULL),
(2, 1, 'e99a18c428cb38d5f260853678922e03', 'abc123', 'john', 'john@email.com', '2000-02-29', '', 'user', '2015-05-05 08:58:51', '2015-05-05 10:20:26', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
