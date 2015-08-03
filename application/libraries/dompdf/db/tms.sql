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
-- Database: `tms`
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
(1, 'RBS LOGISTICS INDIA PVT LTD', 'RBS LOGISTICS(I) PVT LTD.', 'TOTAL SUPPLY CHAIN SOLUTION', 'RAJDOOT', 'rajdoot.shinde@rbslogistics.in', 2266733888, 2265241888, 'AAGCR3777G', 'AAGCR3777GSD001', 'Office No.34 & 35, Ground Floor, Agarwal Trade Centre, Sector No.11, CBD, Belapur,\r\nNavi Mumbai-400614.', '', '0000-00-00', 0, '1. SUBJECT TO NAVI MUMBAI JURISDICTION\n2. CONSIGNOR/CONSIGNEE SHOULD TAKE THEIR \nOWN INSURANCE TO PROTECT THEMSELVES AGAINST ANY RISK\n3. Service tax should be paid to GOVT by benificiary only.', '2015-04-10 09:35:09', '2015-05-30 10:22:48', NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `deten`
--

INSERT INTO `deten` (`deten_id`, `job_id`, `deten_rate`, `deten_days`, `deten_place`, `total`) VALUES
(1, 1, 100, 15, 'CBD', 1500),
(2, 2, 0, 0, '', 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `job_register`
--

INSERT INTO `job_register` (`job_id`, `companyid`, `trip`, `invoice_number`, `bill_date`, `lr_no`, `lr_date`, `client_id`, `consignor_id`, `consignor_type`, `consignee_id`, `consignee_type`, `driver_name`, `vehicle`, `trip_no`, `container_no`, `container_size`, `SHPT`, `from`, `destination`, `back_to`, `weight`, `bkfright`, `vendorfright`, `kickback`, `ECOC`, `offload_date`, `advance`, `adv_client_note`, `advance_to_driver`, `adv_driver_note`, `vendor`, `bill_no`, `misc`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 'TRPT-001', '2015-05-13', 1, '2015-05-13', 1, 3, 'importer', 4, 'exporter', 'asfsaf', 'MH46 AZ 9638', 0, 'asfdsd', '20ft', 'import', 'CBD', 'CBD', 'CBD', 222, 4354, 0, 0, '600', '2015-05-13', 2000, '', 0, '', 2, '5435435', 0, '2015-05-13 10:30:10', '2015-05-22 11:36:13'),
(2, 1, 0, 'TRPT-002', '2015-05-30', 2, '2015-05-30', 1, 5, 'importer', 4, 'exporter', 'KARL', 'MH46 AZ 966', 0, 'AABB-15935746', '20ft', 'import', 'CBD', 'CBD', 'CBD', 120, 4500, 0, 0, '600', '2015-05-30', 0, '', 0, '', 0, '', 0, '2015-05-30 08:46:13', NULL),
(3, 1, 0, 'TRPT-003', '2015-05-13', 1, '2015-05-13', 1, 3, 'importer', 4, 'exporter', 'asfsaf', 'MH46 AZ 9638', 0, 'asfdsd', '20ft', 'import', 'CBD', 'CBD', 'CBD', 222, 4354, 0, 0, '600', '2015-05-13', 2000, '', 0, '', 2, '5435435', 0, '2015-05-13 10:30:10', '2015-05-22 11:36:13');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `kata`
--

INSERT INTO `kata` (`kata_id`, `job_id`, `kata_charge`, `kata_place`) VALUES
(1, 1, 100, 'CBD'),
(2, 1, 100, 'Vashi'),
(3, 2, 200, 'CBD');

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
(1, 1, 'CBD', '', '2015-05-12 13:38:08', NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `login_history`
--

INSERT INTO `login_history` (`login_id`, `users_id`, `name`, `datetime`) VALUES
(1, 2, 'john', '2015-05-12 08:00:00'),
(2, 2, 'john', '2015-05-12 09:00:00'),
(3, 2, 'john', '2015-05-12 09:00:00'),
(4, 2, 'john', '2015-05-13 06:00:00'),
(5, 2, 'john', '2015-05-21 13:00:00'),
(6, 2, 'john', '2015-05-22 06:00:00'),
(7, 2, 'john', '2015-05-22 11:00:00'),
(8, 2, 'john', '2015-05-27 06:00:00'),
(9, 2, 'john', '2015-05-30 06:00:00'),
(10, 2, 'john', '2015-05-30 13:00:00'),
(11, 2, 'john', '2015-06-15 07:00:00'),
(12, 2, 'john', '2015-06-16 09:00:00'),
(13, 2, 'john', '2015-06-16 12:00:00'),
(14, 2, 'john', '2015-06-16 12:00:00'),
(15, 2, 'john', '2015-06-16 15:00:00'),
(16, 2, 'john', '2015-06-16 16:00:00'),
(17, 2, 'john', '2015-06-17 06:00:00'),
(18, 2, 'john', '2015-06-17 09:00:00'),
(19, 2, 'john', '2015-06-27 13:00:00'),
(20, 2, 'john', '2015-06-27 14:00:00'),
(21, 2, 'john', '2015-07-03 06:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE IF NOT EXISTS `people` (
  `people_id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) NOT NULL,
  `people_type` varchar(220) NOT NULL,
  `ctype` varchar(220) DEFAULT NULL,
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
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`people_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`people_id`, `companyid`, `people_type`, `ctype`, `company_name`, `first_name`, `last_name`, `email`, `mobile`, `phone`, `website`, `sec_email`, `industry`, `skype`, `address1`, `address2`, `city`, `state`, `country`, `note`, `created_at`, `updated_at`) VALUES
(1, 1, 'client', NULL, 'RON PVT LTD', 'RON', 'VALDIMIR', 'ron@email.com', '9272727272', '', '', '', '', '', 'CBD, Navi-Mumbai', '', 'CBD', 'maharashatra', 'india', '', '2015-05-12 09:19:16', NULL),
(2, 1, 'vendor', NULL, 'CONOR PVT. LTD.', 'CONOR', 'POL', 'conor@email.com', '9242424242', '', '', '', '', '', 'CBD, Navi-Mumbai', '', 'CBD', 'maharashatra', 'india', '', '2015-05-12 09:39:24', NULL),
(3, 1, 'consignor', 'importer', 'GRAHAM PVT. LTD.', 'GRAHAM', 'WILL', 'graham@email.com', '9252525252', '', '', '', '', '', 'CBD, Navi-Mumbai', '', 'CBD', 'MAHARASHTRA', 'India', '', '2015-05-12 14:46:30', NULL),
(4, 1, 'consignee', 'exporter', 'PHONIX LTD.', 'PHONIX', 'SMITH', 'phonix@yopmail.com', '9242424242', '', '', '', '', '', 'CBD, Navi-Mumbai', '', 'CBD', 'MAHARASHTRA', 'India', '', '2015-05-22 09:57:15', NULL),
(5, 1, 'client', '', 'DEMO', 'NARAN', 'ARETHIYA', 'naran@gmail.com', '8879331463', '', '', '', '', '', 'aaa', '', 'aaaa', 'MAHARASHTRA', 'India', '', '2015-06-27 16:06:48', NULL),
(6, 1, 'client', '', 'AAAAA', 'NANAAA', 'AAAAA', 'albert@email.com', '8989898989', '08989898989', '', 'albert@email.com', '', '', 'CBD', '', 'CBD', 'MAHARASHTRA', 'India', '', '2015-06-27 16:09:04', NULL),
(7, 1, 'client', '', 'ABC PVT LTD', 'PAUL', 'POL', 'paul@email.com', '9242424242', '', '', '', '', '', 'CBD', '', 'CBD', 'MAHARASHTRA', 'India', '', '2015-06-27 16:12:57', NULL),
(8, 1, 'client', '', '', 'ALBERT', 'AAAA', 'albert@email.com', '9242424242', '', '', 'albert@email.com', '', '', 'CBD, Navi-Mumbai', '', 'CBD', 'MAHARASHTRA', 'India', '', '2015-06-27 16:13:58', NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`vehicle_id`, `companyid`, `people_id`, `vehicle_no`, `vehicle_type`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 'MH46 AZ 9638', 'Taurus', '2015-05-12 12:56:21', NULL),
(2, 1, 2, 'MH46 AZ 966', '407-Tempo', '2015-05-12 13:57:06', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
