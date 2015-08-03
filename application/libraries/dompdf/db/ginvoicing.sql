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
-- Database: `ginvoicing`
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
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`activity_id`, `activity_owner`, `lead_id`, `project_id`, `activity_title`, `datetime`, `activity_type`, `lead_status`, `project_status`, `comment`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 0, 'Initial meeting with client', '2015-03-13 12:57:57', 'meeting', '2', '', 'Presention of about company, data requirement', 2, '2015-03-14 00:00:00', '2015-03-16 12:57:57'),
(2, 2, 1, 0, 'Project Done', '2015-03-17 11:46:36', 'meeting', '1', '', 'Project Done', 2, '2015-03-17 11:46:36', NULL),
(3, 2, 2, 0, 'Initial meeting with client', '2015-03-15 15:33:14', 'meeting', '2', '', 'Initial meeting with client', 2, '2015-03-18 06:06:57', '2015-07-01 15:33:14'),
(4, 2, 0, 2, 'form design', '2015-03-18 08:35:56', 'meeting', '', '2', 'form design', 2, '2015-03-18 08:30:21', '2015-03-18 08:35:56'),
(5, 2, 2, 0, 'new', '2015-07-01 15:34:01', 'meeting', '2', '', 'gsdfgsdfgdfg', 2, '2015-07-01 15:34:01', NULL),
(6, 3, 2, 0, 'dsgdsfgfdg', '2015-07-03 09:28:01', 'meeting', '6', '', 'sdgfdgfdg', 3, '2015-07-03 09:14:56', '2015-07-03 09:28:01');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment_title` varchar(220) NOT NULL,
  `comment_descriptio` text NOT NULL,
  `project_status` smallint(2) NOT NULL,
  `task_status` smallint(2) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`comment_id`, `project_id`, `task_id`, `user_id`, `comment_title`, `comment_descriptio`, `project_status`, `task_status`, `created_at`, `updated_at`) VALUES
(1, 2, 0, 1, 'initial comment', 'form design phase 1', 2, 0, '2015-04-20 08:42:16', '2015-04-20 09:43:21'),
(2, 0, 1, 1, 'report design', 'Exam report design', 0, 1, '2015-04-20 14:18:34', '0000-00-00 00:00:00'),
(3, 0, 1, 1, 'Exam report design complete', '<p>designed completed</p>\r\n', 0, 3, '2015-05-09 12:55:49', '0000-00-00 00:00:00'),
(5, 1, 0, 1, 'demo', '<p>demo</p>\r\n', 2, 0, '2015-05-12 07:41:58', '0000-00-00 00:00:00'),
(6, 1, 0, 1, 'demo', '<p>dsfasdf</p>\r\n', 3, 0, '2015-05-12 07:42:08', '0000-00-00 00:00:00'),
(7, 2, 0, 1, 'demo', '<p>demo task closed</p>\r\n', 3, 0, '2015-05-13 12:23:12', '0000-00-00 00:00:00'),
(8, 0, 2, 1, 'demo complete', '<p>demo complete</p>\r\n', 0, 3, '2015-05-14 07:00:11', '0000-00-00 00:00:00');

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
  `establishdate` date NOT NULL,
  `invoice_template` int(1) NOT NULL,
  `module` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 for not display cash, 1 for display cash',
  `invoice_prefix` varchar(100) DEFAULT NULL,
  `cashinvoice_prefix` varchar(100) DEFAULT NULL,
  `terms_condition` text NOT NULL,
  `bank_details` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`companyid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`companyid`, `companyname`, `shortname`, `tag_line`, `owner`, `cemail`, `cmobile`, `ctel`, `pan`, `sertexno`, `caddress`, `clogo`, `establishdate`, `invoice_template`, `module`, `invoice_prefix`, `cashinvoice_prefix`, `terms_condition`, `bank_details`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'G-ORDINATEUR PVT. LTD.', 'G-ORDINATEUR', '', 'CONOR', 'conor@email.com', 9242424242, 2265651233, 'AAAAA1234Z', 'AAAAA1234ZD001', 'C-508, Kukreja Center, Sector-11, \nCBD Belapur, Navi Mumbai 400614,\nMaharashtra, India', 'G-ORDINATEUR/logo.png', '2013-01-30', 1, '1', 'G00', 'GCA00', '1. Subject to Thane Jurisdiction.\r\n2. All Payment by Cheque subject to realisation.\r\n3. Cheque dishonored Rs. 500/- Penalty.\r\n4. I heae by understand the rules by G-Ordinateur and kindly accept it.', '', '2015-01-30 07:00:23', '2015-07-01 12:20:18', NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=76 ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`custid`, `people_id`, `companyid`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, '2015-02-20 12:03:21', '2015-02-20 12:13:24', NULL),
(2, 2, 1, '2015-02-20 12:05:52', '2015-02-26 07:52:03', NULL),
(3, 3, 1, '2015-02-20 12:12:55', '2015-02-20 12:14:54', NULL),
(4, 4, 1, '2015-02-20 12:20:44', '0000-00-00 00:00:00', NULL),
(5, 5, 1, '2015-02-20 12:25:53', '0000-00-00 00:00:00', NULL),
(6, 6, 1, '2015-02-20 12:28:35', '0000-00-00 00:00:00', NULL),
(7, 7, 1, '2015-02-20 12:34:48', '0000-00-00 00:00:00', NULL),
(8, 8, 1, '2015-02-20 12:37:47', '2015-02-20 12:40:12', NULL),
(9, 9, 1, '2015-02-20 12:39:47', '2015-02-21 16:15:48', NULL),
(10, 10, 1, '2015-02-20 12:42:17', '0000-00-00 00:00:00', NULL),
(11, 11, 1, '2015-02-20 12:44:22', '0000-00-00 00:00:00', NULL),
(12, 12, 1, '2015-02-20 12:47:29', '0000-00-00 00:00:00', NULL),
(13, 13, 1, '2015-02-20 12:49:34', '0000-00-00 00:00:00', NULL),
(14, 14, 1, '2015-02-20 12:53:26', '0000-00-00 00:00:00', NULL),
(15, 15, 1, '2015-02-20 12:56:32', '0000-00-00 00:00:00', NULL),
(16, 16, 1, '2015-02-20 12:58:49', '0000-00-00 00:00:00', NULL),
(17, 17, 1, '2015-02-20 13:01:04', '0000-00-00 00:00:00', NULL),
(18, 18, 1, '2015-02-20 13:07:33', '0000-00-00 00:00:00', NULL),
(19, 19, 1, '2015-02-20 13:10:15', '0000-00-00 00:00:00', NULL),
(20, 20, 1, '2015-02-20 13:13:42', '0000-00-00 00:00:00', NULL),
(21, 21, 1, '2015-02-20 13:20:06', '0000-00-00 00:00:00', NULL),
(22, 22, 1, '2015-02-20 13:22:08', '0000-00-00 00:00:00', NULL),
(23, 23, 1, '2015-02-20 13:27:13', '0000-00-00 00:00:00', NULL),
(24, 24, 1, '2015-02-20 13:29:25', '0000-00-00 00:00:00', NULL),
(25, 25, 1, '2015-02-20 13:32:30', '0000-00-00 00:00:00', NULL),
(26, 26, 1, '2015-02-20 13:33:52', '0000-00-00 00:00:00', NULL),
(27, 27, 1, '2015-02-20 13:37:00', '0000-00-00 00:00:00', NULL),
(28, 28, 1, '2015-02-20 13:39:04', '0000-00-00 00:00:00', NULL),
(29, 29, 1, '2015-02-20 13:41:25', '0000-00-00 00:00:00', NULL),
(30, 30, 1, '2015-02-20 13:44:19', '0000-00-00 00:00:00', NULL),
(31, 31, 1, '2015-02-20 13:47:14', '0000-00-00 00:00:00', NULL),
(32, 32, 1, '2015-02-20 13:49:09', '0000-00-00 00:00:00', NULL),
(33, 33, 1, '2015-02-20 13:53:54', '0000-00-00 00:00:00', NULL),
(34, 34, 1, '2015-02-20 13:55:25', '0000-00-00 00:00:00', NULL),
(35, 35, 1, '2015-02-20 13:57:09', '0000-00-00 00:00:00', NULL),
(36, 36, 1, '2015-02-20 13:59:14', '0000-00-00 00:00:00', NULL),
(37, 37, 1, '2015-02-20 14:01:19', '0000-00-00 00:00:00', NULL),
(38, 38, 1, '2015-02-20 14:03:39', '0000-00-00 00:00:00', NULL),
(39, 39, 1, '2015-02-20 14:05:34', '0000-00-00 00:00:00', NULL),
(40, 40, 1, '2015-02-20 14:07:47', '0000-00-00 00:00:00', NULL),
(41, 41, 1, '2015-02-20 14:10:32', '0000-00-00 00:00:00', NULL),
(42, 42, 1, '2015-02-20 14:12:35', '0000-00-00 00:00:00', NULL),
(43, 43, 1, '2015-02-20 14:14:40', '0000-00-00 00:00:00', NULL),
(44, 44, 1, '2015-02-20 14:17:30', '0000-00-00 00:00:00', NULL),
(45, 45, 1, '2015-02-20 14:19:57', '0000-00-00 00:00:00', NULL),
(46, 46, 1, '2015-02-20 14:25:51', '0000-00-00 00:00:00', NULL),
(47, 47, 1, '2015-02-20 14:27:33', '0000-00-00 00:00:00', NULL),
(48, 48, 1, '2015-02-20 14:35:35', '0000-00-00 00:00:00', NULL),
(49, 49, 1, '2015-02-20 14:40:28', '0000-00-00 00:00:00', NULL),
(50, 50, 1, '2015-02-20 14:44:40', '0000-00-00 00:00:00', NULL),
(51, 51, 1, '2015-02-21 07:53:05', '0000-00-00 00:00:00', NULL),
(52, 52, 1, '2015-02-23 16:56:34', '0000-00-00 00:00:00', NULL),
(53, 53, 1, '2015-02-23 16:58:38', '0000-00-00 00:00:00', NULL),
(54, 54, 1, '2015-02-23 17:00:54', '0000-00-00 00:00:00', NULL),
(55, 55, 1, '2015-02-23 17:24:12', '0000-00-00 00:00:00', NULL),
(56, 56, 1, '2015-02-23 17:25:25', '2015-02-27 06:18:07', NULL),
(57, 57, 1, '2015-02-23 17:26:44', '0000-00-00 00:00:00', NULL),
(58, 58, 1, '2015-02-23 17:33:10', '0000-00-00 00:00:00', NULL),
(59, 59, 1, '2015-02-23 17:34:25', '0000-00-00 00:00:00', NULL),
(60, 60, 1, '2015-02-23 17:36:07', '0000-00-00 00:00:00', NULL),
(61, 61, 1, '2015-02-23 17:38:01', '0000-00-00 00:00:00', NULL),
(62, 62, 1, '2015-02-23 17:39:09', '0000-00-00 00:00:00', NULL),
(63, 63, 1, '2015-02-23 17:40:50', '0000-00-00 00:00:00', NULL),
(64, 64, 1, '2015-02-26 07:42:50', '0000-00-00 00:00:00', NULL),
(65, 65, 1, '2015-02-26 07:46:21', '2015-02-26 07:53:29', NULL),
(66, 66, 1, '2015-02-26 08:36:26', '0000-00-00 00:00:00', NULL),
(67, 67, 1, '2015-02-26 08:44:32', '0000-00-00 00:00:00', NULL),
(68, 68, 1, '2015-02-26 08:48:36', '0000-00-00 00:00:00', NULL),
(69, 69, 1, '2015-02-26 08:53:04', '0000-00-00 00:00:00', NULL),
(70, 70, 1, '2015-03-05 07:24:24', '0000-00-00 00:00:00', NULL),
(71, 71, 1, '2015-03-05 08:37:06', '0000-00-00 00:00:00', NULL),
(72, 72, 1, '2015-03-09 05:02:37', '0000-00-00 00:00:00', NULL),
(73, 73, 1, '2015-03-09 05:10:14', '0000-00-00 00:00:00', NULL),
(74, 74, 1, '2015-03-11 13:30:50', '0000-00-00 00:00:00', NULL),
(75, 75, 1, '2015-03-13 09:41:30', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_old`
--

CREATE TABLE IF NOT EXISTS `customer_old` (
  `custid` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) NOT NULL,
  `cust_name` varchar(255) NOT NULL,
  `cperson` varchar(255) NOT NULL,
  `cust_email` varchar(100) NOT NULL,
  `cust_mobile` varchar(11) NOT NULL,
  `cust_address` text NOT NULL,
  `note` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`custid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=76 ;

--
-- Dumping data for table `customer_old`
--

INSERT INTO `customer_old` (`custid`, `companyid`, `cust_name`, `cperson`, `cust_email`, `cust_mobile`, `cust_address`, `note`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'MEYASA REALTY', 'YAWAR KHAN', 'care@meyasarealty.com', '8268899786', 'A1/34/6, Sector 21\nVashi (Turbhe)\nNavi Mumbai 400705\nMaharashtra, India', 'http://www.meyasarealty.com/', '2015-02-20 12:03:21', '2015-02-20 12:13:24', NULL),
(2, 1, 'ARMAAN HR SOLUTION', 'PRAVIN NAIR', '', '9920172567', 'Office No.50, Ground floor, \nVindhya, Commercial Complex,\n Plot no.1, Sector 11, \nCBD, Belapur 400614, \nMumbai, Maharashtra, India', 'http://armaanhrsolutions.com/', '2015-02-20 12:05:52', '2015-02-26 07:52:03', NULL),
(3, 1, 'SHREE GRAPHICS', 'SUJIT DAS', 'shgraph474@gmail.com', '8692090909', 'Sai Tej, Shop No. 6,\nPlot No. 1& 3, Sector-19,\nroad no-11,near post office,\nNew Panvel-410 206\nMumbai, Maharashtra, India', 'http://shreegraphics.co.in/', '2015-02-20 12:12:55', '2015-02-20 12:14:54', NULL),
(4, 1, 'SHREE TOURS & TRAVELS', 'RANJEET DAS', 'info@shreetravels24.com', '8652286666', 'Sai Tej, Shop no-06, Plot no-1/3, Sec-19, Near post office, New panvel-410206, Mumbai, Maharashtra, India.', 'http://www.shreetravels24.com/', '2015-02-20 12:20:44', '0000-00-00 00:00:00', NULL),
(5, 1, 'VISHWA ASSOCIATES', 'VISHU', 'hr@vishvaassociates.com', '9323040973', '304, Chawla Complex, Sector - 15, CBD - Belapur,\n                                    Navi Mumbai - 400614. Maharshtra, India.', 'http://vishvaassociates.com/', '2015-02-20 12:25:53', '0000-00-00 00:00:00', NULL),
(6, 1, 'VISHVA PROTECH PVT. LTD.', 'VISHU', 'info@vishvaprotech.com', '9820229591', '10/C, 7th Cross, 2nd Main, Basaveshwara Road,\nAkshayanagar(w), Bangalore - 560068, India.', 'http://www.vishvaprotech.com/', '2015-02-20 12:28:35', '0000-00-00 00:00:00', NULL),
(7, 1, 'KONARK SHIPPING LINES PVT. LTD.', 'SURESH RAMAN', 'info@konarkshipping.in', '9769922670', '07, 4th Floor, Vindhya Commercial Complex,\nPlot No.1, Sector-11, CBD Belapur-400 614,\nNavi Mumbai, Maharashtra, India.', 'http://konarkshipping.in/', '2015-02-20 12:34:48', '0000-00-00 00:00:00', NULL),
(8, 1, 'PALLAS SOLUTIONS', 'PRASHAT LALKA', '', '9820527690', 'A- 204, Kukreja Centre, Plot No-13, Sector-11, CBD Belapur, Navi Mumbai, India-400 614.', 'pallassolutions.in', '2015-02-20 12:37:47', '2015-02-20 12:40:12', NULL),
(9, 1, 'GLAMRACE PRODUCTIONS', 'PRASHANT LALKA', 'productions@glamrace.com', '9820527690', 'A-204, Kukreja Centre,\nSector - 11, CBD Belapur,\nNavi Mumbai\nPin 400614\nMaharashtra,\nIndia.', 'http://glamrace.com/', '2015-02-20 12:39:47', '2015-02-21 16:15:48', NULL),
(10, 1, 'ABB MARINE SERVICES PVT. LTD.', 'CAPT. RAJU BHANUSE', 'info@abbmarineservice.com', '9967213647', 'A-203, Kukreja Centre, \nSector No:- 11, CBD Belapur, \nNavi Mumbai:- 400614, Mumbai, Maharashtra, India.', 'http://www.abbmarineservice.com/', '2015-02-20 12:42:17', '0000-00-00 00:00:00', NULL),
(11, 1, 'MAHESNDRA S. BHILARE & CO.', 'MAHENDRA BHILARE', 'cabhilarems@gmail.com', '9819437881', 'A-101, Kukreja Centre, Plot No-13, Sector-11, CBD Belapur, Navi Mumbai, India-400 614.', 'http://bhilareca.com/\n', '2015-02-20 12:44:22', '0000-00-00 00:00:00', NULL),
(12, 1, 'RAHUL S. BHILARE & CO.', 'RAHUL BHILARE', 'rbhilare11@gmail.com', '9920761045', 'A-101, Kukreja Centre,Plot No.13, Sector-11, CBD Belapur, Navi Mumbai- 400614, Mumbai, Maharashtra, India.', 'http://bhilarecs.com/', '2015-02-20 12:47:29', '0000-00-00 00:00:00', NULL),
(13, 1, 'DNAV MARINE MANAGEMENT LLC.', 'CAPT. PAWAN', 'info@dnavmarine.com', '9969842729', 'DNAV Marine Management LLC, 420, Al Attar Mall, Al Karama, Dubai, UAE.', 'http://dnavmarine.com/', '2015-02-20 12:49:34', '0000-00-00 00:00:00', NULL),
(14, 1, 'GANPATI HOSPITALITY SERVICES PVT. LTD.', 'RAVI KUMAR', 'info@ganpatiship.com', '9819112285', 'C-211 To C-214, Kukreja centre,\n2nd floor, Plot no-13, Sector-11, \nCBD Belapur, Navi Mumbai-400614, Mumbai, Maharashtra, India.', 'http://www.ganpatiship.com/', '2015-02-20 12:53:26', '0000-00-00 00:00:00', NULL),
(15, 1, 'DIAMOND LOGISTICS', 'MAHESH BANKHALE', 'info@diamondlogistics.in', '9702744687', 'Office No. 227/ B,\nSecond Floor, Sai Chamber,\nPlot No. 44, Sector-11,\nCBD Belapur, Navi Mumbai, Mumbai, Maharashtra, India.', 'http://diamondlogistics.in/', '2015-02-20 12:56:32', '0000-00-00 00:00:00', NULL),
(16, 1, 'AVS SHIPPING AGENCIES', 'SANTOSH SAWANT', 'info@avsshipping.com', '9870889991', '2, Donald Gomes House, \n      Road No. - 3, \n      Sahar Village,\n      International Air Cargo Road,\n      Andheri ( East ),\n      Mumbai - 400 099, Maharashtra, India.', 'http://avsshipping.com/', '2015-02-20 12:58:49', '0000-00-00 00:00:00', NULL),
(17, 1, 'BUFFER LOGISTICS (INDIA) PVT. LTD.', 'NADIM KHAN', 'info@bufferlogistics.com', '9833190366', 'Ideal Trade Center, \nOffice No. 601, 6th Floor,\nPlot No. 64, Scetor - 11, \nCBD-Belapur, Navi Mumbai - 400614, Mumbai, Maharashtra, India.', 'http://www.bufferlogistics.com/', '2015-02-20 13:01:04', '0000-00-00 00:00:00', NULL),
(18, 1, 'K STAR SHIPPING AGENCY PVT. LTD.', 'GANPAT KARDE', 'info@kstarship.com', '9987272221', '242, Sai Chambers, 2nd Floor,\n       Plot No. 44, Sector 11,\n       CBD Belapur,\n       Navi Mumbai 400 614, Mumbai, Maharashtra, India.', 'http://www.kstarship.com/', '2015-02-20 13:07:33', '0000-00-00 00:00:00', NULL),
(19, 1, 'YES SHIP MARINE TRANSPORT PVT. LTD.', 'CAPT. SUBODH KUMAR', 'info@yesshipmarine.com', '8879162829', 'Office no : 1204, Real Tech Park,\nSec -30A, Opp Vashi Station, \nVashi, Navi Mumbai.\nPin Code - 400 703, Mumbai, Maharashtra, India.', 'http://www.yesshipmarine.com/', '2015-02-20 13:10:15', '0000-00-00 00:00:00', NULL),
(20, 1, 'OCEAN GOLD SEAFOODS', 'NASIR', 'info@oceangoldseafoods.com', '8652002495', 'A-302, Kukreja Center, \n              Sector-11, CBD Belapur,\n              Navi Mumbai, Maharashtra,\n              India, Pin-400614.', 'http://oceangoldseafood.in/', '2015-02-20 13:13:42', '0000-00-00 00:00:00', NULL),
(21, 1, 'J LINK BROADBAND SERVICES', 'J. P. SHARMA', '', '9321009100', 'Ambience Court, 1 st Floor, Plot No.2, Sector-19D, Vashi. Navi Mumbai-400705, Mumbai, Maharashtra, India.', 'http://jlinkindia.com/', '2015-02-20 13:20:06', '0000-00-00 00:00:00', NULL),
(22, 1, 'SLIMTECH WELLNESS', 'GURU', 'info@slimtechwellness.com', '9773590040', 'Safal Park Housing Society, Sector 25,\nOpp. Haware Centurian Mall, \nNerul, Navi Mumbai,\nMaharashtra, India.', 'http://slimtechwellness.com/', '2015-02-20 13:22:08', '0000-00-00 00:00:00', NULL),
(23, 1, 'MEGHA CONSTRUCTIONS', 'PATIL', 'info@meghaconstruction.com', '9892988246', 'Office No.1,Sec 1E,Patil Villa,Near Kalamboli Police Station,Kalamboli, Navi Mumbai\nPin Code-410 218, Mumbai, Maharashtra, India. ', 'http://meghaconstruction.com/', '2015-02-20 13:27:13', '0000-00-00 00:00:00', NULL),
(24, 1, 'JAY LANDSCAPER', 'JAYENDRA PATIL', 'info@jaylandscaper.com', '9967034394', 'Shree Nursery, Behind Saraswat Bank, Near Rajiv Gandhi Flyover,\nSec-4, Phase-2, Nerul,\nNavi Mumbai, Mumbai, Maharashtra, India.', 'http://jaylandscaper.com/', '2015-02-20 13:29:25', '0000-00-00 00:00:00', NULL),
(25, 1, 'SHUBHANGI ROADLINES', 'PRADIP BHULE', 'info@shubhangiroadlines.com', '9870441371', 'Mahavir vihar, B-504\nSec-25, Nerul\nNavi Mumbai 400706, Mumbai, Maharashtra, India', 'http://shubhangiroadlines.com/', '2015-02-20 13:32:30', '0000-00-00 00:00:00', NULL),
(26, 1, 'BIG STREAM', 'PETER', 'marketing@bigstream.in', '9768022272', 'Kailash Bhavan, Shop No.1, \nPlot No. B67 Sector-23\nNerul, Navi-Mumbai, 400706, Mumbai, Maharashtra, India', 'http://bigstream.in/', '2015-02-20 13:33:52', '0000-00-00 00:00:00', NULL),
(27, 1, 'VIJAYASHRI GRAPHICS', 'VIRENDRA KULKARNI', 'vijayashrigraphics@gmail.com', '9964999948', '#103 Vindhya Complex, \nSec. 11, CBD Belapur \nNavi Mumbai - 410206, Mumbai, Maharashtra, India', 'http://www.vijayashrigraphics.com/', '2015-02-20 13:37:00', '0000-00-00 00:00:00', NULL),
(28, 1, 'REMEDY PHARMA', 'ANIL', 'info@remedypharma.co.in', '9223592231', '1 & 3, Suyash Heights, Plot No. 36,\nSector-18,Kharghar, Navi Mumbai,\nMaharashtra, India-410210', 'http://remedypharma.co.in/', '2015-02-20 13:39:04', '0000-00-00 00:00:00', NULL),
(29, 1, 'JAGRUTI FOUNDATION', 'RAVINDRA SONAVANE', 'Jagrutifoundation@yahoo.in', '9757388421', 'D - 17,  1:6,\nSahyadri CHS. Ltd.,\nSector- 08, Sanpada, \nNavi Mumbai- 400705.\nMaharashtra, India.', 'http://jagrutifoundationtrust.org/', '2015-02-20 13:41:25', '0000-00-00 00:00:00', NULL),
(30, 1, 'LORVEN INTERNATIONAL PVT. LTD.', 'SANGEETA AGARWAL', 'info@lorveninternational.com', '9223742666', 'First Floor, Opp Metro Magnet Mall\nL.B.S. Marg, Bhandup West,\nMumbai- 400078, Maharashtra, India.', 'http://lorveninternational.com/', '2015-02-20 13:44:19', '0000-00-00 00:00:00', NULL),
(31, 1, 'LORVEN SPINE MANIPULATION & FITNESS CLINIC', 'DR. MANISH MOTA', 'info@lorvenhealthcare.com', '9892269079', 'Lorven House,\nOpp Metro Magnet Mall,LBS Marg,\nBhandup(W), Mumbai-78,Maharashtra, India .', 'http://www.lorvenhealthcare.com/', '2015-02-20 13:47:14', '0000-00-00 00:00:00', NULL),
(32, 1, 'SUPREME IN SAFETY', 'RAJU BHISE', 'sales@supremeinsafety.com', '9920470266', 'A-25 Naik Nagar, Behind Sangam Hotel, Opposite Moin Masjid, \nSion – 400022, Mumbai, Maharashtra, India.', 'http://supremeinsafety.com/', '2015-02-20 13:49:09', '0000-00-00 00:00:00', NULL),
(33, 1, 'PUJNAM', 'HITESH JOSHI', 'info@pujnam.com', '9224628606', '407, Chhellavas na Nake, Mahdev vas number 1 ni same, shak market, NAVA VADAJ Ahmedabad 13, India.', 'http://pujnam.com/', '2015-02-20 13:53:54', '0000-00-00 00:00:00', NULL),
(34, 1, 'SAMINAYU INVESTMENT', 'NAYAN BHANUSHALI', 'info@saminayuinvestments.com', '9892612806', 'Satra Plaza, Sector 19/D, Palm Beach Road Vashi, Navi Mumbai-400703, Mumbai, Maharashtra, India.', 'http://saminayuinvestments.com/', '2015-02-20 13:55:25', '0000-00-00 00:00:00', NULL),
(35, 1, 'SAMINAYU PRODUCTION', 'NAYAN BHANUSHALI', 'info@saminayuproductions.com', '9892612806', 'Satra Plaza, Sector 19/D, Palm Beach Road Vashi, Navi Mumbai-400703, Mumbai, Maharashtra, India.', 'http://saminayuproductions.com/', '2015-02-20 13:57:09', '0000-00-00 00:00:00', NULL),
(36, 1, 'MAHARASHTRA ARCHERY ASSOCIATIONS', 'POONAM MAHATME', 'info@maharashtraarchery.com', '7666246126', 'C - 31, Industrial Estate Area,\n     Shilangan Road, Saturna,\n     Amravati, Maharashtra, India.', 'http://maharashtraarchery.com/', '2015-02-20 13:59:14', '0000-00-00 00:00:00', NULL),
(37, 1, 'AGRIM PROPERTIES', 'PANKAJ SHRIVASTAVA', 'info@agrimproperties.com', '9619161130', 'Green Field Residency, Shop No. 04,, Plot No. 03, Sec -35 I, Kharghar, Navi Mumbai - 410 210, Mumbai, Maharashtra, India.', 'http://agrimproperty.com/', '2015-02-20 14:01:19', '0000-00-00 00:00:00', NULL),
(38, 1, 'CAS & ASSOCIATES', 'SANTOSH AMBEKAR', 'info@casassociates.co.in', '9767330710', 'B/10, Habbib Terrace, Ganesh Gally,\nDr. Ambedkar Road, Lalbaug,\nMumbai - 400 012. India.', 'http://casassociates.co.in/Contact.php', '2015-02-20 14:03:39', '0000-00-00 00:00:00', NULL),
(39, 1, 'SOUMIL ENTERPRISES', 'DINESH GUPTA', 'soumilenterprises@gmail.com', '9833858949', '001, Build. No. : R-2, Nirlon Complex, \nPlot No. : 257D, Walbhat Road, \nOpposite Sharma Industrial Estate, \nGoregaon(East), Mumbai : 400063, Maharashtra, India.', 'http://soumilenterprises.in/', '2015-02-20 14:05:34', '0000-00-00 00:00:00', NULL),
(40, 1, 'NAVIN ENTERPRISES', 'MAHESH SODA', 'info@navienterprises.com', '9321182419', 'Gala No:26, Azad Nagar,\nCama Estate, Wallbhat Road,\nNear Kusum Masala, Goregaon (E)\nMumbai - 400 063, Maharashtra, India', 'http://navinenterprises.com/', '2015-02-20 14:07:47', '0000-00-00 00:00:00', NULL),
(41, 1, 'PATH FINDER HR SOLUTIONS LLP.', 'HARI', 'hr@pathfinderhr.in', '9619598507', 'Pujeet Plaza, Shop No-25 G-Floor,\nSector-11 CBD,\nBelapur 400614, Mumbai, Maharashtra, India.', 'http://pathfinderhr.in/', '2015-02-20 14:10:32', '0000-00-00 00:00:00', NULL),
(42, 1, 'EXHIKRAFTZ', 'ASHOK GUPTA', 'info@exhikraftz.in', '9820449669', 'Office Block. 6, Sai Mangal Apts.,\nSector - 8, Plot No. 18,\nCharkop, Kandivali (West),\nMumbai - 67.\nMaharashtra, India.', 'http://exhikraftz.in/', '2015-02-20 14:12:35', '0000-00-00 00:00:00', NULL),
(43, 1, 'MRG WATCHES', 'MANAMANT RAI GOSWAMI', 'info@mrgwatches.com', '9712202616', 'Office No. 227/ B, CBD Belapur, Navi Mumabi, Mumbai, Maharashtra, India.', 'http://mrgwatches.com/', '2015-02-20 14:14:40', '0000-00-00 00:00:00', NULL),
(44, 1, 'BRIJJKIING PROJECTS', 'BRIJESH KUMAR NAIR', 'brijjkiing@gmail.com', '9004608888', '4, Saiviraj Apartment. Plot C-8, Sector 9\nAiroli, Navi Mumbai, Mumbai, Maharashtra, India.', 'http://brijjkiingprojects.com/', '2015-02-20 14:17:30', '0000-00-00 00:00:00', NULL),
(45, 1, 'MAULI SHIPPING SERVICES', 'MILIND SALVI', 'info@maulishipping.com', '9893077725', 'Gauri Complex, Office No. 31, Ground Floor, Plot No. 19,Next to M.T.N.L Bldg., Sector - 11, C.B.D., Belapur, Navi Mumbai - 400614, Mumbai, Maharashtra, India. ', 'http://maulishipping.com/', '2015-02-20 14:19:57', '0000-00-00 00:00:00', NULL),
(46, 1, 'SHREE AAI PRATISHTHAN ', 'AMIT JADHAV', 'aaiprinters11@gmail.com', '9819164482', 'Shop No- 4, Yashwant Tower, Sector-1,\nPlot No-1, Palm Beach, Sanpada,\nNavi Mumbai-400 705, Mumbai, Maharashtra, India.', 'http://shreeaaipratishthan.org/', '2015-02-20 14:25:51', '0000-00-00 00:00:00', NULL),
(47, 1, 'SHREE AAI PRINTERS', 'AMIT JADHAV', 'aaiprinters11@gmail.com', '9819164482', 'Shop No- 4, Yashwant Tower, Sector-1,\nPlot No-1, Palm Beach, Sanpada,\nNavi Mumbai-400 705, Mumbai, Maharashtra, India.', '', '2015-02-20 14:27:33', '0000-00-00 00:00:00', NULL),
(48, 1, 'KGN ENTERPRISES', 'ZUBER SHAIKH', 'info@kgnindia.com', '7666609000', 'New Ashirwad Industrial Premises,\nCo - Op. Society Ltd.,\nBuilding No. 5,\nRam Mandir Road,\nGoregaon (West),\nMumbai - 400104, Maharashtra, India.', 'http://kgnindia.com/', '2015-02-20 14:35:35', '0000-00-00 00:00:00', NULL),
(49, 1, 'KRSNA SPA', 'RUDHIR ARORA', 'contact@krsnaspa.com', '', 'Shop No.1, Himsagar C.H.S. Plot 67 & 68, \nSector 19, Agarwal Corner, Nerul, \nNavi Mumbai -400706, Mumbai, Maharashtra, India \n', 'http://krsnaspa.com/', '2015-02-20 14:40:28', '0000-00-00 00:00:00', NULL),
(50, 1, 'EDIGI WORLD', 'RAJKUMAR', '', '', 'G 32 A/33a,Centurion Mall,Plot No 88/91,Sector 19 A, Opp HP Petrol Pump, Nerul, Navi Mumbai - 400706, Mumbai, Maharashtra, India', 'http://edigiworldmumbai.com/', '2015-02-20 14:44:40', '0000-00-00 00:00:00', NULL),
(51, 1, 'SOBEST', 'SACHIN SHEWALE', 'sobestwebest@gmail.com', '9223331111', 'SANPADA APMC Market', '', '2015-02-21 07:53:05', '0000-00-00 00:00:00', NULL),
(52, 1, 'ULTRA TECHNOLOGY', 'KULDEEP', '', '', 'DLEHI', '', '2015-02-23 16:56:34', '0000-00-00 00:00:00', NULL),
(53, 1, 'ATTIS GROUP', 'AMIT C', '', '', 'MUMBAI', '', '2015-02-23 16:58:38', '0000-00-00 00:00:00', NULL),
(54, 1, 'SWORDS  LOGISTICS', 'PUNEKAR', '', '9321511089', 'A /147, Balaji Bhavan, \nPLot No.42A, Sec No. 11, \nCBD Belapur,\nNavi Mumbai - 400 614.', '', '2015-02-23 17:00:54', '0000-00-00 00:00:00', NULL),
(55, 1, 'STAR INDIA GROUP', 'CHANDRAMA RAJBHAR', '', '', 'Star India Offshore Engineering Pvt. Ltd.\nH212, 2nd Floor, Station Complex, \nCBD Belapur, Navi Mumbai, Maharashtra,\nIndia. Pin-400614', '', '2015-02-23 17:24:12', '0000-00-00 00:00:00', NULL),
(56, 1, 'SHIRKE LOGISTICS', 'SACHIN', '', '', 'B -208, \n2nd Floor, Kukreja Centre, \nPlot no.13, Sector 11, \nCBD Belapur,\nNavi Mumbai-400614.', '', '2015-02-23 17:25:25', '2015-02-27 06:18:07', NULL),
(57, 1, 'TORQUE FITNESS', 'SUSHANT', '', '', '2nd floor, \nShiva complex, \nSector - 19, New Panvel, \n410206', '', '2015-02-23 17:26:44', '0000-00-00 00:00:00', NULL),
(58, 1, 'R F AGRAWAL', 'AGRAWAL', '', '', 'BHANDUP,\nMUMBAI', '', '2015-02-23 17:33:10', '0000-00-00 00:00:00', NULL),
(59, 1, 'N. K. ENTERPRISE', 'NILESH', '', '', 'MUMBAI', '', '2015-02-23 17:34:25', '0000-00-00 00:00:00', NULL),
(60, 1, 'ARYA PROPERTIES', 'GAGAN ARYA', '', '9619129264', '12, Kukreja Estate, \nSector-11, C.B.D., Belapur.\nNavi Mumbai - 400614.', '', '2015-02-23 17:36:07', '0000-00-00 00:00:00', NULL),
(61, 1, 'VIKON', 'VIKRAM SANGHVI', '', '', '95, Vindhya Commercial Complex,\nSector 11, CBD Belapur,\nNavi Mumbai, 400614', '', '2015-02-23 17:38:01', '0000-00-00 00:00:00', NULL),
(62, 1, 'GANSONS RADIATORS PVT LTD', 'GANI', '', '9820322705', 'D - 147, TTC Ind. Area,\nMIDC, Shirvane, Nerul, \nNavi Mumbai – 400 706', '', '2015-02-23 17:39:09', '0000-00-00 00:00:00', NULL),
(63, 1, 'PRAJAPATI INFOMEDIA', 'PRAJAPATI', '', '', 'MUMBAI', '', '2015-02-23 17:40:50', '0000-00-00 00:00:00', NULL),
(64, 1, 'SUN ALLIANCE ', 'ATMARAM', 'info@sunalliance.in', '', 'International info Tech Park, E-215,\n2nd Floor, Tower No.3,\nVashi Navi Mumbai - 400 705.', '', '2015-02-26 07:42:50', '0000-00-00 00:00:00', NULL),
(65, 1, 'RX INTUTION', 'RUPESH PANDIT', '', '', 'Vashi, Navi mumbai', '', '2015-02-26 07:46:21', '2015-02-26 07:53:29', NULL),
(66, 1, 'GOODWILL PROPERTIES', 'NAMAN MALHOTRA', '', '8655556771', 'Office No.A/345,\nBalaji Bhavan,Nr.C.B.D Rly.Stn.,\nSctor-11,C.B.D.Belapur,\nNavi Mumbai-400614', '', '2015-02-26 08:36:26', '0000-00-00 00:00:00', NULL),
(67, 1, 'INSTANCE PHOTO SOLUTION SDN. BHD.', 'BOSCO', '', '', 'Mumbai', '', '2015-02-26 08:44:32', '0000-00-00 00:00:00', NULL),
(68, 1, 'KALARAJ ACADAMY', 'MJ PATEL', '', '9833428915', 'Belapure mumbai.', '', '2015-02-26 08:48:36', '0000-00-00 00:00:00', NULL),
(69, 1, 'RBS LOGISTICS INDIA PVT LTD.', 'RAJDOOT SHINDE', '', '9930464888', 'Ground Floor, 34-35,\n Agarwal Trade Center, \nSector 11, CBD- Belapur, \nNavi Mumbai- 400614, Mharashtra, India.', '', '2015-02-26 08:53:04', '0000-00-00 00:00:00', NULL),
(70, 1, 'EGLE STAR MARINE', 'KAMAL B. SINGH', 'ESM.GOA@GMAIL.COM', '8450973055', 'KARMA HEIGHT BULG, SHOP NO. S5B,\n NEAR GOA, SHIPYARD LTD,\n VADDEM VASCO DA GAMA\n GOA - 403802, MAHARASHTRA', '', '2015-03-05 07:24:24', '0000-00-00 00:00:00', NULL),
(71, 1, 'MADEA CREATIVE HOUSE', 'PULIN PARIKH', 'info@madea.in', '2265550077', 'Raj Avenue, Office No.102, Plot G-43 & G-44,\nSector-20, Behind Bhoomi Mall,\nCBD Belapur, Navi Mumbai 400-614, India', '', '2015-03-05 08:37:06', '0000-00-00 00:00:00', NULL),
(72, 1, 'DEEPTI CATERERS', 'RAKESH', '', '9820038072', 'Ghatkoper', '', '2015-03-09 05:02:37', '0000-00-00 00:00:00', NULL),
(73, 1, 'MONEY MOVER', 'JAIN', '', '9224701725', 'GHATKOPER', '', '2015-03-09 05:10:14', '0000-00-00 00:00:00', NULL),
(74, 1, 'TRANS IMPEX SHIPPING INC', 'SANTOSH  PANDA', 'santosh.panda@transimpex.co.in', '9820793681', 'CBD BELAPUR', '', '2015-03-11 13:30:50', '0000-00-00 00:00:00', NULL),
(75, 1, 'SHRADHA SHIPPING AGENCY', 'KIRAN NANGARE', '', '8424049294', '308, Skylark, 3rd floor, Plot no 63, CBD Belapur, Navi Mumbai - 400614.', '', '2015-03-13 09:41:30', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) NOT NULL,
  `people_id` int(11) NOT NULL,
  `join_date` date NOT NULL,
  `dob` date DEFAULT NULL,
  `designation` varchar(220) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `companyid`, `people_id`, `join_date`, `dob`, `designation`, `created_at`, `updated_at`) VALUES
(1, 1, 78, '2015-03-15', '2015-03-03', 'developer', '2015-03-17 07:06:47', '0000-00-00 00:00:00'),
(2, 1, 76, '2015-03-15', '2013-05-17', 'Marketer', '2015-03-17 07:06:47', '0000-00-00 00:00:00'),
(3, 1, 77, '2015-03-15', '2015-03-03', 'developer', '2015-03-17 07:06:47', '0000-00-00 00:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`exid`, `companyid`, `extid`, `payment_type`, `ref_no`, `amount`, `date`, `note`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, 'cash', '123456789', 3000, '2015-02-15', '', '2015-02-16 13:13:04', '0000-00-00 00:00:00', NULL),
(2, 2, 2, 'cheque', '65665', 8600, '2015-02-16', 'rent of month jun 2013', '2015-02-16 13:48:14', '0000-00-00 00:00:00', NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `expense_type`
--

INSERT INTO `expense_type` (`extid`, `companyid`, `title`, `note`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'TEA AND COFEESS', 'ssssssssssssss', '2015-02-16 12:50:17', '2015-02-16 13:00:11', NULL),
(2, 2, 'RENT', 'rent for office', '2015-02-16 13:47:04', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE IF NOT EXISTS `file` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) NOT NULL,
  `lead_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `emp_id` int(11) NOT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `file_title` varchar(220) NOT NULL,
  `file_path` varchar(220) NOT NULL,
  `file_type` varchar(220) NOT NULL,
  `file_size` varchar(220) NOT NULL,
  `upload_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `file`
--

INSERT INTO `file` (`file_id`, `companyid`, `lead_id`, `project_id`, `client_id`, `emp_id`, `comment_id`, `file_title`, `file_path`, `file_type`, `file_size`, `upload_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, 0, 0, NULL, 'Koala.jpg', 'upload/project1/Koala.jpg', '.jpg', '132', 2, '2015-03-14 00:00:00', '0000-00-00 00:00:00'),
(2, 1, 0, 2, 0, 0, NULL, 'Koala.jpg', 'upload/Online Exam/Koala.jpg', 'jpg', '780831', 2, '2015-03-18 07:41:59', '0000-00-00 00:00:00'),
(3, 1, 0, 2, 0, 0, NULL, 'Hydrangeas.jpg', 'upload/Online Exam/Hydrangeas.jpg', 'jpg', '595284', 2, '2015-03-18 09:21:16', '0000-00-00 00:00:00'),
(4, 1, 0, 2, 0, 0, NULL, 'Penguins.jpg', 'upload/Online Exam/Penguins.jpg', 'jpg', '777835', 2, '2015-03-18 09:21:16', '0000-00-00 00:00:00'),
(5, 1, 0, 0, 0, 1, NULL, 'news.txt', 'upload/GRAHAM WADE/news.txt', 'txt', '647', 2, '2015-03-18 11:22:32', '0000-00-00 00:00:00');

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
  `companyid` int(11) NOT NULL,
  `invoice_type` enum('1','2') NOT NULL DEFAULT '2' COMMENT '1 for cash invoice, 2 for other invoice',
  `invoice_no` varchar(50) NOT NULL,
  `custid` int(11) NOT NULL,
  `advance` double NOT NULL,
  `total_amount` double NOT NULL,
  `bill_date` date NOT NULL,
  `payment_status` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`inid`),
  UNIQUE KEY `invoice_no` (`invoice_no`),
  UNIQUE KEY `companyid` (`companyid`,`invoice_no`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`inid`, `companyid`, `invoice_type`, `invoice_no`, `custid`, `advance`, `total_amount`, `bill_date`, `payment_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '2', 'G001', 1, 0, 5000, '2015-03-16', 'draft', '2015-03-16 08:08:38', '2015-03-16 08:16:54', NULL),
(2, 1, '2', 'G002', 3, 0, 5000, '2015-03-16', 'partial', '2015-03-16 13:03:50', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_item`
--

CREATE TABLE IF NOT EXISTS `invoice_item` (
  `initid` int(11) NOT NULL AUTO_INCREMENT,
  `inid` int(11) NOT NULL,
  `particular` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `rate` double NOT NULL,
  `amount` double NOT NULL,
  `tax_id` int(11) NOT NULL COMMENT '0 for added item and other than 0 is tax item(tax id)',
  `reimbursement` int(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`initid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `invoice_item`
--

INSERT INTO `invoice_item` (`initid`, `inid`, `particular`, `quantity`, `rate`, `amount`, `tax_id`, `reimbursement`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'WEB DESIGN', 1, 5000, 5000, 0, 0, '2015-03-16 08:08:38', '2015-03-16 08:16:54', NULL),
(2, 2, 'WEB DESIGN', 1, 5000, 5000, 0, 0, '2015-03-16 13:03:50', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lead`
--

CREATE TABLE IF NOT EXISTS `lead` (
  `lead_id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) NOT NULL,
  `people_id` int(11) NOT NULL,
  `lead_owner` int(11) NOT NULL COMMENT 'owner user id',
  `lead_source` varchar(220) NOT NULL,
  `product` varchar(220) NOT NULL,
  `lead_status` varchar(220) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL COMMENT 'creater user id',
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`lead_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `lead`
--

INSERT INTO `lead` (`lead_id`, `companyid`, `people_id`, `lead_owner`, `lead_source`, `product`, `lead_status`, `created_at`, `created_by`, `updated_at`) VALUES
(1, 1, 5, 1, '1', '1', '2', '2015-03-14 11:58:39', 2, '0000-00-00 00:00:00'),
(2, 1, 6, 1, '1', '1', '6', '2015-03-14 14:15:15', 2, '2015-03-16 12:51:21');

-- --------------------------------------------------------

--
-- Table structure for table `lead_source`
--

CREATE TABLE IF NOT EXISTS `lead_source` (
  `lead_source_id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_source` varchar(220) NOT NULL,
  PRIMARY KEY (`lead_source_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `lead_source`
--

INSERT INTO `lead_source` (`lead_source_id`, `lead_source`) VALUES
(1, 'marketing');

-- --------------------------------------------------------

--
-- Table structure for table `lead_status`
--

CREATE TABLE IF NOT EXISTS `lead_status` (
  `lead_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_status` varchar(220) NOT NULL,
  `rank` int(2) NOT NULL,
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
-- Table structure for table `log_history`
--

CREATE TABLE IF NOT EXISTS `log_history` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `browser` varchar(100) NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `log_history`
--

INSERT INTO `log_history` (`log_id`, `uid`, `name`, `ip`, `browser`, `datetime`) VALUES
(1, 1, 'conor@email.com', '', '', '2015-03-14 06:00:00'),
(2, 2, 'ron@email.com', '', '', '2015-03-14 06:00:00'),
(3, 2, 'ron@email.com', '', '', '2015-03-14 06:00:00'),
(4, 1, 'conor@email.com', '', '', '2015-03-14 06:00:00'),
(5, 2, 'ron@email.com', '', '', '2015-03-14 07:00:00'),
(6, 1, 'admin@email.com', '', '', '2015-03-14 07:00:00'),
(7, 2, 'conor@email.com', '', '', '2015-03-14 08:00:00'),
(8, 2, 'conor@email.com', '', '', '2015-03-14 08:00:00'),
(9, 2, 'conor@email.com', '', '', '2015-03-14 08:00:00'),
(10, 1, 'admin@email.com', '', '', '2015-03-14 08:00:00'),
(11, 2, 'conor@email.com', '', '', '2015-03-14 09:00:00'),
(12, 1, 'admin@email.com', '', '', '2015-03-16 06:00:00'),
(13, 2, 'conor@email.com', '', '', '2015-03-16 06:00:00'),
(14, 1, 'admin@email.com', '', '', '2015-03-16 10:00:00'),
(15, 2, 'conor@email.com', '', '', '2015-03-16 10:00:00'),
(16, 2, 'conor@email.com', '', '', '2015-03-16 13:00:00'),
(17, 2, 'shgraph474@gmail.com', '', '', '2015-03-16 13:00:00'),
(18, 2, 'conor@email.com', '', '', '2015-03-16 13:00:00'),
(19, 2, 'conor@email.com', '', '', '2015-03-16 13:00:00'),
(20, 1, 'admin@email.com', '', '', '2015-03-16 13:00:00'),
(21, 2, 'conor@email.com', '', '', '2015-03-17 06:00:00'),
(22, 1, 'admin@email.com', '', '', '2015-03-17 06:00:00'),
(23, 2, 'conor@email.com', '', '', '2015-03-17 06:00:00'),
(24, 3, 'graham@email.com', '', '', '2015-03-17 07:00:00'),
(25, 3, 'graham@email.com', '', '', '2015-03-17 07:00:00'),
(26, 2, 'conor@email.com', '', '', '2015-03-17 07:00:00'),
(27, 3, 'graham@email.com', '', '', '2015-03-17 07:00:00'),
(28, 2, 'conor@email.com', '', '', '2015-03-17 08:00:00'),
(29, 3, 'graham@email.com', '', '', '2015-03-17 12:00:00'),
(30, 2, 'conor@email.com', '', '', '2015-03-17 13:00:00'),
(31, 2, 'conor@email.com', '', '', '2015-03-18 05:00:00'),
(32, 2, 'conor@email.com', '', '', '2015-03-18 07:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `payment_received`
--

INSERT INTO `payment_received` (`prid`, `companyid`, `inid`, `payment_type`, `ref_no`, `amount`, `date`, `note`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'cash', '', 2500, '2015-03-16', '', '2015-03-16 09:26:32', '0000-00-00 00:00:00', NULL),
(2, 1, 2, 'cash', '', 2000, '2015-03-16', '', '2015-03-16 13:03:50', '0000-00-00 00:00:00', NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=79 ;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`people_id`, `company_name`, `first_name`, `last_name`, `email`, `mobile`, `phone`, `website`, `sec_email`, `industry`, `skype`, `address1`, `address2`, `city`, `state`, `country`, `note`, `created_at`, `updated_at`) VALUES
(1, 'MEYASA REALTY', 'YAWAR', 'KHAN', 'care@meyasarealty.com', '8268899786', '', 'http://www.meyasarealty.com/', '', '', '', 'A1/34/6, Sector 21\nVashi (Turbhe)\nNavi Mumbai 400705\nMaharashtra, India', '', '', 'maharashatra', 'india', '', '2015-02-20 12:03:21', '2015-02-20 12:13:24'),
(2, 'ARMAAN HR SOLUTION', 'PRAVIN', 'NAIR', '', '9920172567', '', 'http://armaanhrsolutions.com/', '', '', '', 'Office No.50, Ground floor, \nVindhya, Commercial Complex,\n Plot no.1, Sector 11, \nCBD, Belapur 400614, \nMumbai, Maharashtra, India', '', '', 'maharashatra', 'india', '', '2015-02-20 12:05:52', '2015-02-26 07:52:03'),
(3, 'SHREE GRAPHICS', 'SUJIT', 'DAS', 'shgraph474@gmail.com', '8692090909', '', 'http://shreegraphics.co.in/', '', '', '', 'Sai Tej, Shop No. 6,\nPlot No. 1& 3, Sector-19,\nroad no-11,near post office,\nNew Panvel-410 206\nMumbai, Maharashtra, India', '', '', 'maharashatra', 'india', '', '2015-02-20 12:12:55', '2015-02-20 12:14:54'),
(4, 'SHREE TOURS & TRAVELS', 'RANJEET', 'DAS', 'info@shreetravels24.com', '8652286666', '', 'http://www.shreetravels24.com/', '', '', '', 'Sai Tej, Shop no-06, Plot no-1/3, Sec-19, Near post office, New panvel-410206, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 12:20:44', '0000-00-00 00:00:00'),
(5, 'VISHWA ASSOCIATES', 'VISHU', '', 'hr@vishvaassociates.com', '9323040973', '', 'http://vishvaassociates.com/', '', '', '', '304, Chawla Complex, Sector - 15, CBD - Belapur,\n                                    Navi Mumbai - 400614. Maharshtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 12:25:53', '0000-00-00 00:00:00'),
(6, 'VISHVA PROTECH PVT. LTD.', 'VISHU', '', 'info@vishvaprotech.com', '9820229591', '', 'http://www.vishvaprotech.com/', '', '', '', '10/C, 7th Cross, 2nd Main, Basaveshwara Road,\nAkshayanagar(w), Bangalore - 560068, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 12:28:35', '0000-00-00 00:00:00'),
(7, 'KONARK SHIPPING LINES PVT. LTD.', 'SURESH', 'RAMAN', 'info@konarkshipping.in', '9769922670', '', 'http://konarkshipping.in/', '', '', '', '07, 4th Floor, Vindhya Commercial Complex,\nPlot No.1, Sector-11, CBD Belapur-400 614,\nNavi Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 12:34:48', '0000-00-00 00:00:00'),
(8, 'PALLAS SOLUTIONS', 'PRASHAT', 'LALKA', '', '9820527690', '', 'pallassolutions.in', '', '', '', 'A- 204, Kukreja Centre, Plot No-13, Sector-11, CBD Belapur, Navi Mumbai, India-400 614.', '', '', 'maharashatra', 'india', '', '2015-02-20 12:37:47', '2015-02-20 12:40:12'),
(9, 'GLAMRACE PRODUCTIONS', 'PRASHANT', 'LALKA', 'productions@glamrace.com', '9820527690', '', 'http://glamrace.com/', '', '', '', 'A-204, Kukreja Centre,\nSector - 11, CBD Belapur,\nNavi Mumbai\nPin 400614\nMaharashtra,\nIndia.', '', '', 'maharashatra', 'india', '', '2015-02-20 12:39:47', '2015-02-21 16:15:48'),
(10, 'ABB MARINE SERVICES PVT. LTD.', 'CAPT.', 'RAJU', 'info@abbmarineservice.com', '9967213647', '', 'http://www.abbmarineservice.com/', '', '', '', 'A-203, Kukreja Centre, \nSector No:- 11, CBD Belapur, \nNavi Mumbai:- 400614, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 12:42:17', '0000-00-00 00:00:00'),
(11, 'MAHESNDRA S. BHILARE & CO.', 'MAHENDRA', 'BHILARE', 'cabhilarems@gmail.com', '9819437881', '', 'http://bhilareca.com/\n', '', '', '', 'A-101, Kukreja Centre, Plot No-13, Sector-11, CBD Belapur, Navi Mumbai, India-400 614.', '', '', 'maharashatra', 'india', '', '2015-02-20 12:44:22', '0000-00-00 00:00:00'),
(12, 'RAHUL S. BHILARE & CO.', 'RAHUL', 'BHILARE', 'rbhilare11@gmail.com', '9920761045', '', 'http://bhilarecs.com/', '', '', '', 'A-101, Kukreja Centre,Plot No.13, Sector-11, CBD Belapur, Navi Mumbai- 400614, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 12:47:29', '0000-00-00 00:00:00'),
(13, 'DNAV MARINE MANAGEMENT LLC.', 'CAPT.', 'PAWAN', 'info@dnavmarine.com', '9969842729', '', 'http://dnavmarine.com/', '', '', '', 'DNAV Marine Management LLC, 420, Al Attar Mall, Al Karama, Dubai, UAE.', '', '', 'maharashatra', 'india', '', '2015-02-20 12:49:34', '0000-00-00 00:00:00'),
(14, 'GANPATI HOSPITALITY SERVICES PVT. LTD.', 'RAVI', 'KUMAR', 'info@ganpatiship.com', '9819112285', '', 'http://www.ganpatiship.com/', '', '', '', 'C-211 To C-214, Kukreja centre,\n2nd floor, Plot no-13, Sector-11, \nCBD Belapur, Navi Mumbai-400614, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 12:53:26', '0000-00-00 00:00:00'),
(15, 'DIAMOND LOGISTICS', 'MAHESH', 'BANKHALE', 'info@diamondlogistics.in', '9702744687', '', 'http://diamondlogistics.in/', '', '', '', 'Office No. 227/ B,\nSecond Floor, Sai Chamber,\nPlot No. 44, Sector-11,\nCBD Belapur, Navi Mumbai, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 12:56:32', '0000-00-00 00:00:00'),
(16, 'AVS SHIPPING AGENCIES', 'SANTOSH', 'SAWANT', 'info@avsshipping.com', '9870889991', '', 'http://avsshipping.com/', '', '', '', '2, Donald Gomes House, \n      Road No. - 3, \n      Sahar Village,\n      International Air Cargo Road,\n      Andheri ( East ),\n      Mumbai - 400 099, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 12:58:49', '0000-00-00 00:00:00'),
(17, 'BUFFER LOGISTICS (INDIA) PVT. LTD.', 'NADIM', 'KHAN', 'info@bufferlogistics.com', '9833190366', '', 'http://www.bufferlogistics.com/', '', '', '', 'Ideal Trade Center, \nOffice No. 601, 6th Floor,\nPlot No. 64, Scetor - 11, \nCBD-Belapur, Navi Mumbai - 400614, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 13:01:04', '0000-00-00 00:00:00'),
(18, 'K STAR SHIPPING AGENCY PVT. LTD.', 'GANPAT', 'KARDE', 'info@kstarship.com', '9987272221', '', 'http://www.kstarship.com/', '', '', '', '242, Sai Chambers, 2nd Floor,\n       Plot No. 44, Sector 11,\n       CBD Belapur,\n       Navi Mumbai 400 614, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 13:07:33', '0000-00-00 00:00:00'),
(19, 'YES SHIP MARINE TRANSPORT PVT. LTD.', 'CAPT.', 'SUBODH', 'info@yesshipmarine.com', '8879162829', '', 'http://www.yesshipmarine.com/', '', '', '', 'Office no : 1204, Real Tech Park,\nSec -30A, Opp Vashi Station, \nVashi, Navi Mumbai.\nPin Code - 400 703, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 13:10:15', '0000-00-00 00:00:00'),
(20, 'OCEAN GOLD SEAFOODS', 'NASIR', '', 'info@oceangoldseafoods.com', '8652002495', '', 'http://oceangoldseafood.in/', '', '', '', 'A-302, Kukreja Center, \n              Sector-11, CBD Belapur,\n              Navi Mumbai, Maharashtra,\n              India, Pin-400614.', '', '', 'maharashatra', 'india', '', '2015-02-20 13:13:42', '0000-00-00 00:00:00'),
(21, 'J LINK BROADBAND SERVICES', 'J.', 'P.', '', '9321009100', '', 'http://jlinkindia.com/', '', '', '', 'Ambience Court, 1 st Floor, Plot No.2, Sector-19D, Vashi. Navi Mumbai-400705, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 13:20:06', '0000-00-00 00:00:00'),
(22, 'SLIMTECH WELLNESS', 'GURU', '', 'info@slimtechwellness.com', '9773590040', '', 'http://slimtechwellness.com/', '', '', '', 'Safal Park Housing Society, Sector 25,\nOpp. Haware Centurian Mall, \nNerul, Navi Mumbai,\nMaharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 13:22:08', '0000-00-00 00:00:00'),
(23, 'MEGHA CONSTRUCTIONS', 'PATIL', '', 'info@meghaconstruction.com', '9892988246', '', 'http://meghaconstruction.com/', '', '', '', 'Office No.1,Sec 1E,Patil Villa,Near Kalamboli Police Station,Kalamboli, Navi Mumbai\nPin Code-410 218, Mumbai, Maharashtra, India. ', '', '', 'maharashatra', 'india', '', '2015-02-20 13:27:13', '0000-00-00 00:00:00'),
(24, 'JAY LANDSCAPER', 'JAYENDRA', 'PATIL', 'info@jaylandscaper.com', '9967034394', '', 'http://jaylandscaper.com/', '', '', '', 'Shree Nursery, Behind Saraswat Bank, Near Rajiv Gandhi Flyover,\nSec-4, Phase-2, Nerul,\nNavi Mumbai, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 13:29:25', '0000-00-00 00:00:00'),
(25, 'SHUBHANGI ROADLINES', 'PRADIP', 'BHULE', 'info@shubhangiroadlines.com', '9870441371', '', 'http://shubhangiroadlines.com/', '', '', '', 'Mahavir vihar, B-504\nSec-25, Nerul\nNavi Mumbai 400706, Mumbai, Maharashtra, India', '', '', 'maharashatra', 'india', '', '2015-02-20 13:32:30', '0000-00-00 00:00:00'),
(26, 'BIG STREAM', 'PETER', '', 'marketing@bigstream.in', '9768022272', '', 'http://bigstream.in/', '', '', '', 'Kailash Bhavan, Shop No.1, \nPlot No. B67 Sector-23\nNerul, Navi-Mumbai, 400706, Mumbai, Maharashtra, India', '', '', 'maharashatra', 'india', '', '2015-02-20 13:33:52', '0000-00-00 00:00:00'),
(27, 'VIJAYASHRI GRAPHICS', 'VIRENDRA', 'KULKARNI', 'vijayashrigraphics@gmail.com', '9964999948', '', 'http://www.vijayashrigraphics.com/', '', '', '', '#103 Vindhya Complex, \nSec. 11, CBD Belapur \nNavi Mumbai - 410206, Mumbai, Maharashtra, India', '', '', 'maharashatra', 'india', '', '2015-02-20 13:37:00', '0000-00-00 00:00:00'),
(28, 'REMEDY PHARMA', 'ANIL', '', 'info@remedypharma.co.in', '9223592231', '', 'http://remedypharma.co.in/', '', '', '', '1 & 3, Suyash Heights, Plot No. 36,\nSector-18,Kharghar, Navi Mumbai,\nMaharashtra, India-410210', '', '', 'maharashatra', 'india', '', '2015-02-20 13:39:04', '0000-00-00 00:00:00'),
(29, 'JAGRUTI FOUNDATION', 'RAVINDRA', 'SONAVANE', 'Jagrutifoundation@yahoo.in', '9757388421', '', 'http://jagrutifoundationtrust.org/', '', '', '', 'D - 17,  1:6,\nSahyadri CHS. Ltd.,\nSector- 08, Sanpada, \nNavi Mumbai- 400705.\nMaharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 13:41:25', '0000-00-00 00:00:00'),
(30, 'LORVEN INTERNATIONAL PVT. LTD.', 'SANGEETA', 'AGARWAL', 'info@lorveninternational.com', '9223742666', '', 'http://lorveninternational.com/', '', '', '', 'First Floor, Opp Metro Magnet Mall\nL.B.S. Marg, Bhandup West,\nMumbai- 400078, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 13:44:19', '0000-00-00 00:00:00'),
(31, 'LORVEN SPINE MANIPULATION & FITNESS CLINIC', 'DR.', 'MANISH', 'info@lorvenhealthcare.com', '9892269079', '', 'http://www.lorvenhealthcare.com/', '', '', '', 'Lorven House,\nOpp Metro Magnet Mall,LBS Marg,\nBhandup(W), Mumbai-78,Maharashtra, India .', '', '', 'maharashatra', 'india', '', '2015-02-20 13:47:14', '0000-00-00 00:00:00'),
(32, 'SUPREME IN SAFETY', 'RAJU', 'BHISE', 'sales@supremeinsafety.com', '9920470266', '', 'http://supremeinsafety.com/', '', '', '', 'A-25 Naik Nagar, Behind Sangam Hotel, Opposite Moin Masjid, \nSion – 400022, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 13:49:09', '0000-00-00 00:00:00'),
(33, 'PUJNAM', 'HITESH', 'JOSHI', 'info@pujnam.com', '9224628606', '', 'http://pujnam.com/', '', '', '', '407, Chhellavas na Nake, Mahdev vas number 1 ni same, shak market, NAVA VADAJ Ahmedabad 13, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 13:53:54', '0000-00-00 00:00:00'),
(34, 'SAMINAYU INVESTMENT', 'NAYAN', 'BHANUSHALI', 'info@saminayuinvestments.com', '9892612806', '', 'http://saminayuinvestments.com/', '', '', '', 'Satra Plaza, Sector 19/D, Palm Beach Road Vashi, Navi Mumbai-400703, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 13:55:25', '0000-00-00 00:00:00'),
(35, 'SAMINAYU PRODUCTION', 'NAYAN', 'BHANUSHALI', 'info@saminayuproductions.com', '9892612806', '', 'http://saminayuproductions.com/', '', '', '', 'Satra Plaza, Sector 19/D, Palm Beach Road Vashi, Navi Mumbai-400703, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 13:57:09', '0000-00-00 00:00:00'),
(36, 'MAHARASHTRA ARCHERY ASSOCIATIONS', 'POONAM', 'MAHATME', 'info@maharashtraarchery.com', '7666246126', '', 'http://maharashtraarchery.com/', '', '', '', 'C - 31, Industrial Estate Area,\n     Shilangan Road, Saturna,\n     Amravati, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 13:59:14', '0000-00-00 00:00:00'),
(37, 'AGRIM PROPERTIES', 'PANKAJ', 'SHRIVASTAVA', 'info@agrimproperties.com', '9619161130', '', 'http://agrimproperty.com/', '', '', '', 'Green Field Residency, Shop No. 04,, Plot No. 03, Sec -35 I, Kharghar, Navi Mumbai - 410 210, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 14:01:19', '0000-00-00 00:00:00'),
(38, 'CAS & ASSOCIATES', 'SANTOSH', 'AMBEKAR', 'info@casassociates.co.in', '9767330710', '', 'http://casassociates.co.in/Contact.php', '', '', '', 'B/10, Habbib Terrace, Ganesh Gally,\nDr. Ambedkar Road, Lalbaug,\nMumbai - 400 012. India.', '', '', 'maharashatra', 'india', '', '2015-02-20 14:03:39', '0000-00-00 00:00:00'),
(39, 'SOUMIL ENTERPRISES', 'DINESH', 'GUPTA', 'soumilenterprises@gmail.com', '9833858949', '', 'http://soumilenterprises.in/', '', '', '', '001, Build. No. : R-2, Nirlon Complex, \nPlot No. : 257D, Walbhat Road, \nOpposite Sharma Industrial Estate, \nGoregaon(East), Mumbai : 400063, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 14:05:34', '0000-00-00 00:00:00'),
(40, 'NAVIN ENTERPRISES', 'MAHESH', 'SODA', 'info@navienterprises.com', '9321182419', '', 'http://navinenterprises.com/', '', '', '', 'Gala No:26, Azad Nagar,\nCama Estate, Wallbhat Road,\nNear Kusum Masala, Goregaon (E)\nMumbai - 400 063, Maharashtra, India', '', '', 'maharashatra', 'india', '', '2015-02-20 14:07:47', '0000-00-00 00:00:00'),
(41, 'PATH FINDER HR SOLUTIONS LLP.', 'HARI', '', 'hr@pathfinderhr.in', '9619598507', '', 'http://pathfinderhr.in/', '', '', '', 'Pujeet Plaza, Shop No-25 G-Floor,\nSector-11 CBD,\nBelapur 400614, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 14:10:32', '0000-00-00 00:00:00'),
(42, 'EXHIKRAFTZ', 'ASHOK', 'GUPTA', 'info@exhikraftz.in', '9820449669', '', 'http://exhikraftz.in/', '', '', '', 'Office Block. 6, Sai Mangal Apts.,\nSector - 8, Plot No. 18,\nCharkop, Kandivali (West),\nMumbai - 67.\nMaharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 14:12:35', '0000-00-00 00:00:00'),
(43, 'MRG WATCHES', 'MANAMANT', 'RAI', 'info@mrgwatches.com', '9712202616', '', 'http://mrgwatches.com/', '', '', '', 'Office No. 227/ B, CBD Belapur, Navi Mumabi, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 14:14:40', '0000-00-00 00:00:00'),
(44, 'BRIJJKIING PROJECTS', 'BRIJESH', 'KUMAR', 'brijjkiing@gmail.com', '9004608888', '', 'http://brijjkiingprojects.com/', '', '', '', '4, Saiviraj Apartment. Plot C-8, Sector 9\nAiroli, Navi Mumbai, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 14:17:30', '0000-00-00 00:00:00'),
(45, 'MAULI SHIPPING SERVICES', 'MILIND', 'SALVI', 'info@maulishipping.com', '9893077725', '', 'http://maulishipping.com/', '', '', '', 'Gauri Complex, Office No. 31, Ground Floor, Plot No. 19,Next to M.T.N.L Bldg., Sector - 11, C.B.D., Belapur, Navi Mumbai - 400614, Mumbai, Maharashtra, India. ', '', '', 'maharashatra', 'india', '', '2015-02-20 14:19:57', '0000-00-00 00:00:00'),
(46, 'SHREE AAI PRATISHTHAN ', 'AMIT', 'JADHAV', 'aaiprinters11@gmail.com', '9819164482', '', 'http://shreeaaipratishthan.org/', '', '', '', 'Shop No- 4, Yashwant Tower, Sector-1,\nPlot No-1, Palm Beach, Sanpada,\nNavi Mumbai-400 705, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 14:25:51', '0000-00-00 00:00:00'),
(47, 'SHREE AAI PRINTERS', 'AMIT', 'JADHAV', 'aaiprinters11@gmail.com', '9819164482', '', '', '', '', '', 'Shop No- 4, Yashwant Tower, Sector-1,\nPlot No-1, Palm Beach, Sanpada,\nNavi Mumbai-400 705, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 14:27:33', '0000-00-00 00:00:00'),
(48, 'KGN ENTERPRISES', 'ZUBER', 'SHAIKH', 'info@kgnindia.com', '7666609000', '', 'http://kgnindia.com/', '', '', '', 'New Ashirwad Industrial Premises,\nCo - Op. Society Ltd.,\nBuilding No. 5,\nRam Mandir Road,\nGoregaon (West),\nMumbai - 400104, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 14:35:35', '0000-00-00 00:00:00'),
(49, 'KRSNA SPA', 'RUDHIR', 'ARORA', 'contact@krsnaspa.com', '', '', 'http://krsnaspa.com/', '', '', '', 'Shop No.1, Himsagar C.H.S. Plot 67 & 68, \nSector 19, Agarwal Corner, Nerul, \nNavi Mumbai -400706, Mumbai, Maharashtra, India \n', '', '', 'maharashatra', 'india', '', '2015-02-20 14:40:28', '0000-00-00 00:00:00'),
(50, 'EDIGI WORLD', 'RAJKUMAR', '', '', '', '', 'http://edigiworldmumbai.com/', '', '', '', 'G 32 A/33a,Centurion Mall,Plot No 88/91,Sector 19 A, Opp HP Petrol Pump, Nerul, Navi Mumbai - 400706, Mumbai, Maharashtra, India', '', '', 'maharashatra', 'india', '', '2015-02-20 14:44:40', '0000-00-00 00:00:00'),
(51, 'SOBEST', 'SACHIN', 'SHEWALE', 'sobestwebest@gmail.com', '9223331111', '', '', '', '', '', 'SANPADA APMC Market', '', '', 'maharashatra', 'india', '', '2015-02-21 07:53:05', '0000-00-00 00:00:00'),
(52, 'ULTRA TECHNOLOGY', 'KULDEEP', '', '', '', '', '', '', '', '', 'DLEHI', '', '', 'maharashatra', 'india', '', '2015-02-23 16:56:34', '0000-00-00 00:00:00'),
(53, 'ATTIS GROUP', 'AMIT', 'C', '', '', '', '', '', '', '', 'MUMBAI', '', '', 'maharashatra', 'india', '', '2015-02-23 16:58:38', '0000-00-00 00:00:00'),
(54, 'SWORDS  LOGISTICS', 'PUNEKAR', '', '', '9321511089', '', '', '', '', '', 'A /147, Balaji Bhavan, \nPLot No.42A, Sec No. 11, \nCBD Belapur,\nNavi Mumbai - 400 614.', '', '', 'maharashatra', 'india', '', '2015-02-23 17:00:54', '0000-00-00 00:00:00'),
(55, 'STAR INDIA GROUP', 'CHANDRAMA', 'RAJBHAR', '', '', '', '', '', '', '', 'Star India Offshore Engineering Pvt. Ltd.\nH212, 2nd Floor, Station Complex, \nCBD Belapur, Navi Mumbai, Maharashtra,\nIndia. Pin-400614', '', '', 'maharashatra', 'india', '', '2015-02-23 17:24:12', '0000-00-00 00:00:00'),
(56, 'SHIRKE LOGISTICS', 'SACHIN', '', '', '', '', '', '', '', '', 'B -208, \n2nd Floor, Kukreja Centre, \nPlot no.13, Sector 11, \nCBD Belapur,\nNavi Mumbai-400614.', '', '', 'maharashatra', 'india', '', '2015-02-23 17:25:25', '2015-02-27 06:18:07'),
(57, 'TORQUE FITNESS', 'SUSHANT', '', '', '', '', '', '', '', '', '2nd floor, \nShiva complex, \nSector - 19, New Panvel, \n410206', '', '', 'maharashatra', 'india', '', '2015-02-23 17:26:44', '0000-00-00 00:00:00'),
(58, 'R F AGRAWAL', 'AGRAWAL', '', '', '', '', '', '', '', '', 'BHANDUP,\nMUMBAI', '', '', 'maharashatra', 'india', '', '2015-02-23 17:33:10', '0000-00-00 00:00:00'),
(59, 'N. K. ENTERPRISE', 'NILESH', '', '', '', '', '', '', '', '', 'MUMBAI', '', '', 'maharashatra', 'india', '', '2015-02-23 17:34:25', '0000-00-00 00:00:00'),
(60, 'ARYA PROPERTIES', 'GAGAN', 'ARYA', '', '9619129264', '', '', '', '', '', '12, Kukreja Estate, \nSector-11, C.B.D., Belapur.\nNavi Mumbai - 400614.', '', '', 'maharashatra', 'india', '', '2015-02-23 17:36:07', '0000-00-00 00:00:00'),
(61, 'VIKON', 'VIKRAM', 'SANGHVI', '', '', '', '', '', '', '', '95, Vindhya Commercial Complex,\nSector 11, CBD Belapur,\nNavi Mumbai, 400614', '', '', 'maharashatra', 'india', '', '2015-02-23 17:38:01', '0000-00-00 00:00:00'),
(62, 'GANSONS RADIATORS PVT LTD', 'GANI', '', '', '9820322705', '', '', '', '', '', 'D - 147, TTC Ind. Area,\nMIDC, Shirvane, Nerul, \nNavi Mumbai – 400 706', '', '', 'maharashatra', 'india', '', '2015-02-23 17:39:09', '0000-00-00 00:00:00'),
(63, 'PRAJAPATI INFOMEDIA', 'PRAJAPATI', '', '', '', '', '', '', '', '', 'MUMBAI', '', '', 'maharashatra', 'india', '', '2015-02-23 17:40:50', '0000-00-00 00:00:00'),
(64, 'SUN ALLIANCE ', 'ATMARAM', '', 'info@sunalliance.in', '', '', '', '', '', '', 'International info Tech Park, E-215,\n2nd Floor, Tower No.3,\nVashi Navi Mumbai - 400 705.', '', '', 'maharashatra', 'india', '', '2015-02-26 07:42:50', '0000-00-00 00:00:00'),
(65, 'RX INTUTION', 'RUPESH', 'PANDIT', '', '', '', '', '', '', '', 'Vashi, Navi mumbai', '', '', 'maharashatra', 'india', '', '2015-02-26 07:46:21', '2015-02-26 07:53:29'),
(66, 'GOODWILL PROPERTIES', 'NAMAN', 'MALHOTRA', '', '8655556771', '', '', '', '', '', 'Office No.A/345,\nBalaji Bhavan,Nr.C.B.D Rly.Stn.,\nSctor-11,C.B.D.Belapur,\nNavi Mumbai-400614', '', '', 'maharashatra', 'india', '', '2015-02-26 08:36:26', '0000-00-00 00:00:00'),
(67, 'INSTANCE PHOTO SOLUTION SDN. BHD.', 'BOSCO', '', '', '', '', '', '', '', '', 'Mumbai', '', '', 'maharashatra', 'india', '', '2015-02-26 08:44:32', '0000-00-00 00:00:00'),
(68, 'KALARAJ ACADAMY', 'MJ', 'PATEL', '', '9833428915', '', '', '', '', '', 'Belapure mumbai.', '', '', 'maharashatra', 'india', '', '2015-02-26 08:48:36', '0000-00-00 00:00:00'),
(69, 'RBS LOGISTICS INDIA PVT LTD.', 'RAJDOOT', 'SHINDE', '', '9930464888', '', '', '', '', '', 'Ground Floor, 34-35,\n Agarwal Trade Center, \nSector 11, CBD- Belapur, \nNavi Mumbai- 400614, Mharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-26 08:53:04', '0000-00-00 00:00:00'),
(70, 'EGLE STAR MARINE', 'KAMAL', 'B.', 'ESM.GOA@GMAIL.COM', '8450973055', '', '', '', '', '', 'KARMA HEIGHT BULG, SHOP NO. S5B,\n NEAR GOA, SHIPYARD LTD,\n VADDEM VASCO DA GAMA\n GOA - 403802, MAHARASHTRA', '', '', 'maharashatra', 'india', '', '2015-03-05 07:24:24', '0000-00-00 00:00:00'),
(71, 'MADEA CREATIVE HOUSE', 'PULIN', 'PARIKH', 'info@madea.in', '2265550077', '', '', '', '', '', 'Raj Avenue, Office No.102, Plot G-43 & G-44,\nSector-20, Behind Bhoomi Mall,\nCBD Belapur, Navi Mumbai 400-614, India', '', '', 'maharashatra', 'india', '', '2015-03-05 08:37:06', '0000-00-00 00:00:00'),
(72, 'DEEPTI CATERERS', 'RAKESH', '', '', '9820038072', '', '', '', '', '', 'Ghatkoper', '', '', 'maharashatra', 'india', '', '2015-03-09 05:02:37', '0000-00-00 00:00:00'),
(73, 'MONEY MOVER', 'JAIN', '', '', '9224701725', '', '', '', '', '', 'GHATKOPER', '', '', 'maharashatra', 'india', '', '2015-03-09 05:10:14', '0000-00-00 00:00:00'),
(74, 'TRANS IMPEX SHIPPING INC', 'SANTOSH', '', 'santosh.panda@transimpex.co.in', '9820793681', '', '', '', '', '', 'CBD BELAPUR', '', '', 'maharashatra', 'india', '', '2015-03-11 13:30:50', '0000-00-00 00:00:00'),
(75, 'SHRADHA SHIPPING AGENCY', 'KIRAN', 'NANGARE', '', '8424049294', '', '', '', '', '', '308, Skylark, 3rd floor, Plot no 63, CBD Belapur, Navi Mumbai - 400614.', '', '', 'maharashatra', 'india', '', '2015-03-13 09:41:30', '0000-00-00 00:00:00'),
(76, '', 'GRAHAM', 'WADE', 'graham@email.com', '9252525252', '', '', '', '', '', 'CBD, Navi-Mumbai', '', 'CBD', 'maharashatra', 'india', '', '2015-03-17 07:06:47', '0000-00-00 00:00:00'),
(77, '', 'PAUL', 'POL', 'paul@email.com', '9272727272', '', '', '', '', '', 'CBD, Navi-Mumbai', '', 'CBD', 'maharashatra', 'india', '', '2015-03-17 07:06:47', '0000-00-00 00:00:00'),
(78, 'admin', 'admin', 'admin', 'admin@email.com', '', '', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `personal_note`
--

CREATE TABLE IF NOT EXISTS `personal_note` (
  `personal_note_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `personal_note_title` varchar(220) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `companyid`, `product_title`, `price`, `note`, `created_at`) VALUES
(1, 1, 'website', 10000, '', '2015-03-14 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) NOT NULL,
  `project_title` varchar(220) NOT NULL,
  `lead_id` int(11) DEFAULT NULL,
  `custid` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `project_status` varchar(220) NOT NULL,
  `live_url` varchar(220) NOT NULL,
  `test_url` varchar(220) NOT NULL,
  `apporx_end` date DEFAULT NULL,
  `project_description` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `project1`
--

CREATE TABLE IF NOT EXISTS `project1` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) NOT NULL,
  `project_title` varchar(220) NOT NULL,
  `lead_id` int(11) DEFAULT NULL,
  `custid` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `project_status` varchar(220) NOT NULL,
  `apporx_end` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `project1`
--

INSERT INTO `project1` (`project_id`, `companyid`, `project_title`, `lead_id`, `custid`, `start_date`, `end_date`, `project_status`, `apporx_end`, `created_by`, `created_at`) VALUES
(1, 1, 'website', 1, 5, '2015-03-18', '0000-00-00', '1', '2015-03-18', 2, '2015-03-17 11:46:36'),
(2, 1, 'Online Exam', 1, 10, '2015-03-18', '0000-00-00', '2', '2015-03-18', 2, '2015-03-18 07:41:59');

-- --------------------------------------------------------

--
-- Table structure for table `project_status`
--

CREATE TABLE IF NOT EXISTS `project_status` (
  `project_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_status` varchar(220) NOT NULL,
  `rank` int(1) NOT NULL,
  `project_status_color` varchar(220) NOT NULL,
  PRIMARY KEY (`project_status_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `project_status`
--

INSERT INTO `project_status` (`project_status_id`, `project_status`, `rank`, `project_status_color`) VALUES
(1, 'Open', 1, '#3C3DBC'),
(2, 'Ongoing', 2, '#3CB2BC'),
(3, 'Closed', 3, '#A82020');

-- --------------------------------------------------------

--
-- Table structure for table `project_task`
--

CREATE TABLE IF NOT EXISTS `project_task` (
  `project_task_id` int(12) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `project_task_title` varchar(220) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `project_status_id` int(11) NOT NULL,
  `task_status` int(11) DEFAULT NULL,
  `project_task_priority` varchar(220) NOT NULL,
  `project_task_label` varchar(220) NOT NULL,
  `project_task_description` text NOT NULL,
  `start_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `project_task_progress` smallint(3) NOT NULL COMMENT 'Task completion in percentage  ',
  `project_task_estimate` int(11) NOT NULL COMMENT 'In hours',
  `created_by` int(11) NOT NULL COMMENT 'employee id',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`project_task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_team`
--

CREATE TABLE IF NOT EXISTS `project_team` (
  `project_id` int(10) NOT NULL,
  `emp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`serviceid`, `companyid`, `servicename`, `note`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'WEBSITE DEVELOPMENT', '', '2015-02-18 14:12:10', '0000-00-00 00:00:00', NULL),
(2, 1, 'DOMAIN BOOKING', '', '2015-02-18 14:12:21', '0000-00-00 00:00:00', NULL),
(3, 1, 'EMAIL HOSTING', '', '2015-02-18 14:12:38', '0000-00-00 00:00:00', NULL),
(4, 1, 'SMSAPP RECHARGE', '', '2015-02-18 14:12:53', '0000-00-00 00:00:00', NULL),
(5, 1, '<?PHP IF ( ! DEFINED(''BASEPATH'')) EXIT(''NO DIRECT SCRIPT ACCESS ALLOWED'');\r\n\r\nCLASS INVOICE EXTENDS CI_CONTROLLER {\r\n\r\n	PUBLIC FUNCTION __CONSTRUCT() {\r\n		PARENT::__CONSTRUCT();\r\n		IF($THIS->SESSION->USERDATA(''UID'') == '''') {\r\n			REDIRECT(BASE_URL());\r\n		}\r\n	}\r\n\r\n	FUNCTION CREATE_INVOICE() {\r\n		$DATA[''PAGETITLE'']="CREATE INVOICE";\r\n		$DATA[''TITLE'']="CREATE INVOICE";\r\n		$THIS->LOAD->MODEL(''INVOICE_MODEL'');\r\n		$THIS->LOAD->HELPER(''FORM'');\r\n		$THIS->LOAD->MODEL(''USER_MODEL'');\r\n		$DATA[''CUSTOMER'']=$THIS->USER_MODEL->GET_CUSTOMER();\r\n		$DATA[''TAX'']=$THIS->INVOICE_MODEL->GET_TAX();\r\n		$DATA[''SERVICE'']=$THIS->INVOICE_MODEL->GET_SERVICE();\r\n		$INIDRS=$THIS->INVOICE_MODEL->GET_LAST_INID();\r\n		$DATA[''INID'']=''001'';\r\n		IF(ISSET($INIDRS[0])) {\r\n			$DATA[''INID'']=++$INIDRS[0][''INVOICE_NO''];	\r\n		}\r\n		\r\n		$DATA[''CONTANT'']=$THIS->LOAD->VIEW(''INVOICEADDFORM'',$DATA,TRUE);\r\n		$THIS->LOAD->VIEW(''MASTER'',$DATA);		\r\n	}\r\n	\r\n	FUNCTION EDIT_INVOICE($INID) {\r\n		$DATA[''PAGETITLE'']="EDIT INVOICE";\r\n		$DATA[''TITLE'']="EDIT INVOICE";\r\n		$THIS->LOAD->MODEL(''INVOICE_MODEL'');\r\n		$THIS->LOAD->HELPER(''FORM'');\r\n		$THIS->LOAD->MODEL(''USER_MODEL'');\r\n		$DATA[''CUSTOMER'']=$THIS->USER_MODEL->GET_CUSTOMER();\r\n		$DATA[''SERVICE'']=$THIS->INVOICE_MODEL->GET_SERVICE();\r\n		$DATA[''TAX'']=$THIS->INVOICE_MODEL->GET_TAX();\r\n		$DATA[''EDIT_INVOICE'']=$THIS->INVOICE_MODEL->GET_INVOICE_DETAIL($INID);\r\n		$DATA[''CONTANT'']=$THIS->LOAD->VIEW(''INVOICEADDFORM'',$DATA,TRUE);\r\n		$THIS->LOAD->VIEW(''MASTER'',$DATA);		\r\n	}\r\n	\r\n	FUNCTION SAVE_INVOICE() {\r\n		$SUBMIT=$THIS->INPUT->POST(''SUBMIT'');\r\n		$THIS->LOAD->MODEL(''INVOICE_MODEL'');\r\n		$BACK_URL=$_SERVER[''HTTP_REFERER''];\r\n		\r\n		/* VALIDATION RULES */\r\n		$THIS->LOAD->LIBRARY(''FORM_VALIDATION'');\r\n		$THIS->FORM_VALIDATION->SET_ERROR_DELIMITERS(''<DIV CLASS="ERROR">'', ''</DIV>'');\r\n		$THIS->FORM_VALIDATION->SET_RULES(''CUSTID'', ''CUSTOMER'', ''REQUIRED|INTEGER'');\r\n		$THIS->FORM_VALIDATION->SET_RULES(''INVOICE_NO'', ''INVOICE NO.'', ''REQUIRED'');\r\n		$THIS->FORM_VALIDATION->SET_RULES(''ADVAMOUNT'', ''ADVANCE AMOUNT'', ''NUMERIC'');\r\n		$THIS->FORM_VALIDATION->SET_RULES(''BILL_DATE'', ''BILL DATE'', ''REQUIRED|REGEX_MATCH[/^[0-9]{4}-[0-9]{2}-[0-9]{2}$/]'');\r\n		$PARTICULAR=$THIS->INPUT->POST(''PARTICULAR'');\r\n		$I=1;\r\n		FOREACH($PARTICULAR AS $KEY=>$VAL) {\r\n			$THIS->FORM_VALIDATION->SET_RULES(''QUANTITY[''.$KEY.'']'', ''ITEM ''.$I.'' QUANTITY'', ''INTEGER|GREATER_THAN[0]|REQUIRED'');\r\n			$THIS->FORM_VALIDATION->SET_RULES(''RATE[''.$KEY.'']'', ''ITEM ''.$I.'' RATE'', ''NUMERIC|GREATER_THAN[0]|REQUIRED'');\r\n			$THIS->FORM_VALIDATION->SET_RULES(''AMOUNT[''.$KEY.'']'', ''ITEM ''.$I.'' AMOUNT'', ''NUMERIC|GREATER_THAN[0]|REQUIRED'');\r\n			$I++;\r\n		}\r\n		\r\n		IF ($THIS->FORM_VALIDATION->RUN() == FALSE) {\r\n			SET_MESSAGE(VALIDATION_ERRORS());\r\n			$THIS->SESSION->FLASHDATA(''OLD_DATA'',$THIS->INPUT->POST());\r\n			REDIRECT($BACK_URL);\r\n			RETURN 0;\r\n		}\r\n		\r\n		/* DEFINE VARIABLES */\r\n		$INID=$THIS->INPUT->POST(''INID'');\r\n		$CUSTID=$THIS->INPUT->POST(''CUSTID'');\r\n		$ADVAMOUNT=$THIS->INPUT->POST(''ADVAMOUNT'');\r\n		$INVOICE_NO=$THIS->INPUT->POST(''INVOICE_NO'');\r\n		$BILL_DATE=$THIS->INPUT->POST(''BILL_DATE'');\r\n		$QUANTITY=$THIS->INPUT->POST(''QUANTITY'');\r\n		$RATE=$THIS->INPUT->POST(''RATE'');\r\n		$AMOUNT=$THIS->INPUT->POST(''AMOUNT'');\r\n		$REIMBURSEMENT=$THIS->INPUT->POST(''REIMBURSEMENT'');\r\n		$COMPANYID=$THIS->SESSION->USERDATA(''COMPANYID'');\r\n		$TOTAL_AMOUNT=0;\r\n		$TAX_RATE_ARR=$THIS->INPUT->POST(''TAX_AMOUNT'');\r\n		$TAX_ARRAY=$THIS->INPUT->POST(''TAX'');\r\n		$PAYMENT_TYPE=$THIS->INPUT->POST(''PAYMENT_TYPE'');\r\n		$PAYMENT_AMOUNT=$THIS->INPUT->POST(''PAYMENT_AMOUNT'');\r\n		$DELETED_ITEM=$THIS->INPUT->POST(''DELETED_ITEM'');\r\n		$TAX_ARRAY_COUNT=COUNT($TAX_ARRAY);\r\n		$TAX_AMOUNT_ARRAY=ARRAY();\r\n		$SERVICE_TAX='''';\r\n		$REIMBURSEMENT_AMOUNT=ARRAY();\r\n		$REIMBURSEMENT_TOTAL=0;\r\n		\r\n		/* CALCULATE TOTAL AMOUNT AND REIMBURSEMENT AMOUNT */\r\n		FOREACH($AMOUNT AS $KEY=>$VAL) {\r\n			IF(ISSET($REIMBURSEMENT[$KEY]) && $REIMBURSEMENT[$KEY]!='''') {\r\n				$REIMBURSEMENT_TOTAL+=$VAL;\r\n			}\r\n			ELSE {\r\n				$TOTAL_AMOUNT+=$VAL;\r\n			}\r\n		};\r\n		$CTOTAL_AMOUNT=$TOTAL_AMOUNT;\r\n		\r\n		/* TOTAL AMOUNT AND SERVICE TAX CALCULATION */\r\n		IF($TAX_ARRAY_COUNT > 0) {\r\n			FOREACH($TAX_ARRAY AS $VAL=>$VALUE) {\r\n				IF($SERVICE_TAX=='''') {\r\n					$TAX_DET=$THIS->INVOICE_MODEL->GET_TAX($VAL,"SERVICE TAX");\r\n					$SERVICE_TAX=$TOTAL_AMOUNT*($TAX_RATE_ARR[$VAL]/100);\r\n					$TAX_AMOUNT_ARRAY[$VAL]=ROUND($SERVICE_TAX);\r\n				}\r\n				ELSE {\r\n					$TAX_AMOUNT_ARRAY[$VAL]=ROUND($SERVICE_TAX*($TAX_RATE_ARR[$VAL]/100));\r\n				}\r\n				$CTOTAL_AMOUNT+=$TAX_AMOUNT_ARRAY[$VAL];\r\n			}\r\n		}\r\n\r\n		/* ADD  REIMBURSEMENT AMOUNT TO GRAND TOTAL */\r\n		$CTOTAL_AMOUNT+=ROUND($REIMBURSEMENT_TOTAL);\r\n\r\n		/* START TRANSACTION */\r\n		$THIS->DB->TRANS_BEGIN();\r\n\r\n		/* UPDATE INVOICE */\r\n		IF($INID) {\r\n			/* GET OLD RECORD */\r\n			$RS_INVOICE=$THIS->INVOICE_MODEL->GET_INVOICE(ARRAY(''INID''=>$INID));\r\n\r\n			/*GET PAYMENT OF INVOICE*/\r\n			$THIS->LOAD->MODEL(''PAYMENT_MODEL'');\r\n			$PAYMENTS=$THIS->PAYMENT_MODEL->GET_PAYMENTS(ARRAY(''PAYMENT_RECEIVED.INID''=>$INID));\r\n			IF(COUNT($PAYMENTS) > 0) { \r\n				$TOTAL_PAYMENT=ARRAY_SUM(ARRAY_COLUMN($PAYMENTS,''AMOUNT''));\r\n			}\r\n			IF($TOTAL_PAYMENT > ROUND($CTOTAL_AMOUNT)) {\r\n				SET_MESSAGE("YOU CANNOT REDUCE THE INVOICE TOTAL BELOW THE AMOUNT PAID.<BR/>IF YOU ENTERED A PAYMENT BY MISTAKE, YOU CAN EDIT IT IN YOUR PAYMENT HISTORY.");\r\n				REDIRECT($BACK_URL);\r\n			}\r\n\r\n\r\n			/* DELETE INVOICE ITEMS WHICH IS REMOVED */\r\n			IF($DELETED_ITEM!='''') {\r\n				$DELETED_ITEM=RTRIM($DELETED_ITEM,'','');\r\n				$DELETED_ARRAY=EXPLODE('','', $DELETED_ITEM);\r\n				$THIS->INVOICE_MODEL->DEL_INVOICE_ITEM($DELETED_ARRAY,$INID);\r\n			}\r\n			\r\n			/* UPDATE RECORD OF INVOICE */\r\n			$UPDATED_AT	= DATE(''Y-M-D H:I:S'');\r\n			$IN_DATA=ARRAY(\r\n				''INVOICE_NO'' =>$INVOICE_NO,\r\n				''CUSTID'' =>$CUSTID,\r\n				''COMPANYID''=>$COMPANYID,\r\n				''TOTAL_AMOUNT''=>ROUND($CTOTAL_AMOUNT),\r\n				''BILL_DATE'' =>$BILL_DATE,\r\n				''UPDATED_AT'' =>$UPDATED_AT\r\n			);\r\n			\r\n			$RES=$THIS->INVOICE_MODEL->UPDATE_INVOICE($IN_DATA,$INID);\r\n			$INITID=$THIS->INPUT->POST(''INITID'');\r\n			$INVOICE_ITEMS=$THIS->INVOICE_MODEL->GET_INVOICE_ITEM(FALSE,$INID);\r\n			$ITEM_COUNT=COUNT($INVOICE_ITEMS);\r\n			IF($ITEM_COUNT > 0) {\r\n				$INTIDS=ARRAY_COLUMN($INVOICE_ITEMS,''INITID'');\r\n			}\r\n			\r\n			/* ADD INVOICE ITEMS */\r\n			FOREACH($PARTICULAR AS $I=>$PER) {\r\n				$REIMB=0;\r\n				IF(ISSET($REIMBURSEMENT[$I]) && $REIMBURSEMENT[$I]==''1'') {\r\n					$REIMB=1;\r\n				}\r\n				$PARTDATA=ARRAY(\r\n					''INID''=>$INID,\r\n					''PARTICULAR''=>$PARTICULAR[$I],\r\n					''QUANTITY'' =>$QUANTITY[$I],\r\n					''RATE'' =>$RATE[$I],\r\n					''REIMBURSEMENT''=>$REIMB,\r\n					''AMOUNT'' => ROUND($QUANTITY[$I]*$RATE[$I]),\r\n					''UPDATED_AT'' =>$UPDATED_AT\r\n				);\r\n				IF($ITEM_COUNT < 1) {\r\n					$RES1=$THIS->INVOICE_MODEL->ADD_INVOICEITEM($PARTDATA);\r\n				}\r\n				ELSE {\r\n					IF(IN_ARRAY($I,$INTIDS)) {\r\n						$RES1=$THIS->INVOICE_MODEL->UPDATE_INVOICE_ITEM($PARTDATA,$I);\r\n					}\r\n					ELSE {\r\n						$RES1=$THIS->INVOICE_MODEL->ADD_INVOICEITEM($PARTDATA);\r\n					}\r\n				}\r\n			}\r\n\r\n			/* ADD TAX TO INVOICE ITEM */\r\n			IF($TAX_ARRAY_COUNT > 0) {\r\n				FOREACH($TAX_ARRAY AS $KEY=>$VALUE) {\r\n					IF(STRPOS($KEY,''_'') === FALSE) {\r\n						$VAL=$KEY;\r\n						$TAX_ID=$KEY;\r\n					}\r\n					ELSE {\r\n						$KEY_ARR=EXPLODE(''_'',$KEY);\r\n						/* INVOICE ITEM ID */\r\n						$VAL=$KEY_ARR[0];\r\n						/* TAX ID */\r\n						$TAX_ID=$KEY_ARR[1];\r\n					}\r\n					\r\n					$TAX_DET=$THIS->INVOICE_MODEL->GET_TAX($TAX_ID);\r\n					$TAXDATA=ARRAY(\r\n						''INID''=> $INID,\r\n						''PARTICULAR''=>$TAX_DET[0][''NAME''].'' ''.$TAX_RATE_ARR[$KEY].''%'',\r\n						''QUANTITY'' =>''1'',\r\n						''RATE'' =>$TAX_RATE_ARR[$KEY],\r\n						''TAX_ID''=> $TAX_ID,	\r\n						''AMOUNT'' => ROUND($TAX_AMOUNT_ARRAY[$KEY])\r\n					);\r\n					\r\n					IF(STRPOS($KEY,''_'') === FALSE) {\r\n						$TAXDATA[''CREATED_AT'']=$UPDATED_AT;\r\n						$RES2=$THIS->INVOICE_MODEL->ADD_INVOICEITEM($TAXDATA);\r\n					}\r\n					ELSE {\r\n						$TAXDATA[''UPDATED_AT'']=$UPDATED_AT;\r\n						$RES2=$THIS->INVOICE_MODEL->UPDATE_INVOICE_ITEM($TAXDATA,$VAL);\r\n					}\r\n				}\r\n			}\r\n			\r\n			/* FOR DELETING TAX FROM INVOICE ITEM */\r\n			FOREACH($TAX_RATE_ARR AS $KEY=>$AMOUNT) {\r\n				IF(STRPOS($KEY,''_'') !== FALSE) {\r\n					IF(!ISSET($TAX_ARRAY[$KEY])) {\r\n						$KEY_ARR=EXPLODE(''_'',$KEY);\r\n						$INVOICE_ITEM=$KEY_ARR[0];\r\n						$THIS->DEL_INVOICE_ITEM($INVOICE_ITEM);\r\n					}\r\n				}\r\n			}\r\n			\r\n		}	\r\n		ELSE {\r\n			$CREATED_AT	= DATE(''Y-M-D H:I:S'');	\r\n			$PAYMENT_ENTRY=FALSE;\r\n			$IN_DATA=ARRAY(\r\n				''INVOICE_NO'' =>$INVOICE_NO,\r\n				''COMPANYID''=>$COMPANYID,\r\n				''CUSTID'' =>$CUSTID,\r\n				''TOTAL_AMOUNT'' =>ROUND($CTOTAL_AMOUNT),\r\n				''BILL_DATE'' =>$BILL_DATE,\r\n				''CREATED_AT'' =>$CREATED_AT,\r\n				''PAYMENT_STATUS''=>''DRAFT''\r\n			);\r\n\r\n			/* SET INVOICE STATUS */\r\n			IF($PAYMENT_TYPE!='''' && $PAYMENT_AMOUNT!='''' && IS_NUMERIC($PAYMENT_AMOUNT) && $PAYMENT_AMOUNT > 0) {\r\n				IF($PAYMENT_AMOUNT == $CTOTAL_AMOUNT) {\r\n					$IN_DATA[''PAYMENT_STATUS'']="PAID";\r\n					$PAYMENT_ENTRY=TRUE;\r\n				}\r\n				ELSEIF($PAYMENT_AMOUNT < $CTOTAL_AMOUNT) {\r\n					$IN_DATA[''PAYMENT_STATUS'']="PARTIAL";\r\n					$PAYMENT_ENTRY=TRUE;\r\n				}\r\n				ELSE {\r\n					SET_MESSAGE("PAYMENT AMOUNT CAN NOT GRATETHAN INVOICE TOTAL AMOUNT </LI><LI> PAYMENT ENTRY SKIPPED");\r\n				}\r\n			}\r\n\r\n			$RES=$THIS->INVOICE_MODEL->ADD_INVOICE($IN_DATA);\r\n			$INID=$THIS->DB->INSERT_ID();\r\n			\r\n			/* ADD INVOICE ITEMS TO DATABASE */\r\n			FOREACH($PARTICULAR AS $I=>$VALUES) {\r\n				$REIMB=0;\r\n				IF(ISSET($REIMBURSEMENT[$I]) && $REIMBURSEMENT[$I]==''1'') {\r\n					$REIMB=1;\r\n				}\r\n				\r\n				$PARTDATA=ARRAY(\r\n					''INID''=> $INID,\r\n					''PARTICULAR''=>$PARTICULAR[$I],\r\n					''QUANTITY'' =>$QUANTITY[$I],\r\n					''RATE'' =>$RATE[$I],\r\n					''REIMBURSEMENT''=>$REIMB,\r\n					''AMOUNT'' => ROUND($QUANTITY[$I]*$RATE[$I]),\r\n					''CREATED_AT''=> $CREATED_AT\r\n				);\r\n				$RES1=$THIS->INVOICE_MODEL->ADD_INVOICEITEM($PARTDATA);\r\n			}\r\n			\r\n			IF($TAX_ARRAY_COUNT > 0) {\r\n				FOREACH($TAX_ARRAY AS $VAL=>$VALUE) {\r\n					$TAX_DET=$THIS->INVOICE_MODEL->GET_TAX($VAL);\r\n					$TAXDATA=ARRAY(\r\n						''INID''=> $INID,\r\n						''PARTICULAR''=>$TAX_DET[0][''NAME'']." ".$TAX_RATE_ARR[$VAL]." %",\r\n						''QUANTITY'' =>''1'',\r\n						''RATE'' =>$TAX_RATE_ARR[$VAL],\r\n						''AMOUNT'' => ROUND($TAX_AMOUNT_ARRAY[$VAL]),\r\n						''TAX_ID''=> $VAL,	\r\n						''CREATED_AT''=> $CREATED_AT	\r\n					);\r\n					$RES2=$THIS->INVOICE_MODEL->ADD_INVOICEITEM($TAXDATA);\r\n				}\r\n			}\r\n			\r\n			/* FOR ADVANCE PAYMENT */\r\n			IF($PAYMENT_ENTRY) {\r\n				$REF_NO=$THIS->INPUT->POST(''REF_NO'');\r\n				$PAYMENT_NOTE=$THIS->INPUT->POST(''PAYMENT_NOTE'');\r\n				\r\n				$PAYMENT_DATA=ARRAY(\r\n					''COMPANYID''=>$COMPANYID,\r\n					''INID''=>$INID,\r\n					''PAYMENT_TYPE''=>$PAYMENT_TYPE,\r\n					''REF_NO''=>$REF_NO,\r\n					''AMOUNT''=>$PAYMENT_AMOUNT,\r\n					''DATE''=>$CREATED_AT,\r\n					''NOTE''=>$PAYMENT_NOTE,\r\n					''CREATED_AT''=>$CREATED_AT,\r\n				);\r\n				$THIS->DB->INSERT(''PAYMENT_RECEIVED'',$PAYMENT_DATA);\r\n			}\r\n		}\r\n		\r\n		IF ($THIS->DB->TRANS_STATUS() === FALSE) {\r\n			SET_MESSAGE(''SOMETHING WENT WRONG, PLEASE TRY AGAIN'');\r\n			SET_MESSAGE($THIS->DB->_ERROR_MESSAGE());\r\n		    $THIS->DB->TRANS_ROLLBACK();\r\n			$THIS->SESSION->SET_FLASHDATA(''OLD_DATA'',$THIS->INPUT->POST());\r\n			REDIRECT($BACK_URL);\r\n		}\r\n		ELSE {\r\n		    $THIS->DB->TRANS_COMMIT();\r\n		    $MESSAGE=''INVOICE SAVED SUCCESSFULLY. <A TARGET="_BLANK" HREF="''.BASE_URL().''INVOICE/PRINT_REC/''.$INID.''">CLICK HERE TO PRINT INVOICE</A>'';\r\n			SET_MESSAGE($MESSAGE,''SUCCESS'');\r\n			REDIRECT(BASE_URL()."INVOICE/EDIT_INVOICE/".$INID);\r\n		}\r\n		\r\n	}\r\n	\r\n	FUNCTION ADD_TAXES($TAX=FALSE) {\r\n		$DATA[''PAGETITLE'']="ADD NEW TAX";\r\n		$DATA[''TITLE'']="ADD NEW TAX";\r\n		$THIS->LOAD->MODEL(''INVOICE_MODEL'');\r\n		$THIS->LOAD->HELPER(''FORM'');\r\n		IF($TAX) {\r\n			$DATA[''EDIT_TAX'']=$THIS->INVOICE_MODEL->GET_TAX($TAX);\r\n		}\r\n		$DATA[''TAX'']=$THIS->INVOICE_MODEL->GET_TAX();\r\n		$DATA[''CONTANT'']=$THIS->LOAD->VIEW(''TAXFORM'',$DATA,TRUE);\r\n		$THIS->LOAD->VIEW(''MASTER'',$DATA);	\r\n	}	\r\n\r\n	FUNCTION SAVE_TAXES() {\r\n		$THIS->LOAD->MODEL(''INVOICE_MODEL'');\r\n		$THIS->LOAD->LIBRARY(''FORM_VALIDATION'');\r\n		$THIS->FORM_VALIDATION->SET_ERROR_DELIMITERS(''<DIV CLASS="ERROR">'', ''</DIV>'');\r\n		$THIS->FORM_VALIDATION->SET_RULES(''NAME'', ''TAX PARTICULAR'', ''REQUIRED|MIN_LENGTH[1]|MAX_LENGTH[100]'');\r\n		$THIS->FORM_VALIDATION->SET_RULES(''TAX'', ''TAX'', ''REQUIRED'');\r\n		IF ($THIS->FORM_VALIDATION->RUN() == FALSE) {\r\n			SET_MESSAGE(VALIDATION_ERRORS());\r\n			REDIRECT(BASE_URL().''INVOICE/ADD_TAXES'');\r\n			RETURN 0;\r\n		}	\r\n		ELSE {\r\n			$TAXID=$THIS->INPUT->POST(''TAXID'');\r\n			$NAME = STRTOUPPER($THIS->INPUT->POST(''NAME''));\r\n			$TAX = $THIS->INPUT->POST(''TAX'');\r\n			$NOTE = $THIS->INPUT->POST(''NOTE'');\r\n			$COMPANYID = $THIS->SESSION->USERDATA(''COMPANYID'');\r\n			IF($TAXID) {\r\n				$UPDATED_AT	= DATE(''Y-M-D H:I:S'');\r\n				$LEN=STRLEN($TAX);\r\n				$POS=STRPOS($TAX,''@'');\r\n				IF($POS != $LEN-1) {\r\n					$TAX = $TAX."@";\r\n				}\r\n				$TAX_DATA = ARRAY(\r\n					''NAME''=>$NAME,\r\n					''TAX''=>$TAX,\r\n					''NOTE''=>$NOTE,\r\n					''UPDATED_AT''=>$UPDATED_AT\r\n				);\r\n				$RES=$THIS->INVOICE_MODEL->UPDATE_TAX($TAX_DATA,$TAXID);	\r\n				IF($RES) {\r\n					$THIS->SESSION->SET_FLASHDATA(''SUCCESS'',''TAX EDITED SUCCESSFULLY'');\r\n					REDIRECT(BASE_URL().''INVOICE/ADD_TAXES'');\r\n				}\r\n				ELSE {\r\n					$THIS->SESSION->SET_FLASHDATA(''ERROR'',''SOMTHING WENT WRONG'');\r\n					REDIRECT(BASE_URL().''INVOICE/ADD_TAXES'');\r\n				}				\r\n			}\r\n			ELSE {\r\n				$CREATED_AT	= DATE(''Y-M-D H:I:S'');\r\n				$LEN=STRLEN($TAX);\r\n				$POS=STRPOS($TAX,''@'');\r\n				IF($POS != $LEN-1) {\r\n					$TAX = $TAX."@";\r\n				}\r\n				$TAX_DATA = ARRAY(\r\n					''COMPANYID''=>$COMPANYID,\r\n					''NAME''=>$NAME,\r\n					''TAX''=>$TAX,\r\n					''NOTE''=>$NOTE,\r\n					''CREATED_AT''=>$CREATED_AT\r\n				);		\r\n				$RES=$THIS->INVOICE_MODEL->ADD_TAX($TAX_DATA);	\r\n				IF($RES) {\r\n					$THIS->SESSION->SET_FLASHDATA(''SUCCESS'',''TAX ADDED SUCCESSFULLY'');\r\n					REDIRECT(BASE_URL().''INVOICE/ADD_TAXES'');\r\n				}\r\n				ELSE {\r\n					$THIS->SESSION->SET_FLASHDATA(''ERROR'',''SOMTHING WENT WRONG'');\r\n					REDIRECT(BASE_URL().''INVOICE/ADD_TAXES'');\r\n				}\r\n			}\r\n		}\r\n	}\r\n\r\n	FUNCTION DEL_TAXES() {\r\n		$THIS->LOAD->MODEL(''INVOICE_MODEL'');\r\n		$DEL_ID=$THIS->INPUT->POST(''ID'');\r\n		$TAX_DATA = ARRAY(\r\n			''DELETED_AT''=>DATE(''Y-M-D H:I:S'')		\r\n		);\r\n		\r\n		$DELQUERY = $THIS->INVOICE_MODEL->DEL_TAX($TAX_DATA,$DEL_ID);\r\n		IF($DELQUERY) {\r\n			$RETURN=ARRAY("STATUS"=>''1'',"MESSAGE"=>"TAX DELETED SUCCESSFULLY");\r\n		}\r\n		ELSE {\r\n			$RETURN=ARRAY("STATUS"=>''0'',"MESSAGE"=>"SOMETHING WENT WRONG!!");\r\n		}\r\n		ECHO JSON_ENCODE($RETURN);				\r\n	}\r\n	\r\n	FUNCTION PRINT_REC($INID) {\r\n		$THIS->LOAD->MODEL(''INVOICE_MODEL'');\r\n		$THIS->LOAD->MODEL(''PAYMENT_MODEL'');\r\n		$DATA[''INVOICE'']=$THIS->INVOICE_MODEL->GET_INVOICE_DETAIL($INID);\r\n		IF(COUNT($DATA[''INVOICE'']) > 0 && $INID!='''') {\r\n			$DATA[''PAYMENTS'']=$THIS->PAYMENT_MODEL->GET_PAYMENTS(ARRAY(''INVOICE.INID''=>$INID));\r\n			$DATA[''PAID_AMOUNT'']=0;\r\n			$DATA[''DUE_AMOUNT'']=$DATA[''INVOICE''][0][''TOTAL_AMOUNT''];\r\n			IF(COUNT($DATA[''PAYMENTS'']) > 0 ) {\r\n				$DATA[''PAID_AMOUNT'']=ARRAY_SUM(ARRAY_COLUMN($DATA[''PAYMENTS''],''AMOUNT''));\r\n				$DATA[''DUE_AMOUNT'']-=$DATA[''PAID_AMOUNT''];\r\n			}\r\n			\r\n			$THIS->LOAD->VIEW(''RECEIPT'',$DATA);	\r\n		}\r\n		ELSE {\r\n			SET_MESSAGE("INVALID INVOICE SELECTED");\r\n			REDIRECT(BASE_URL());\r\n		}\r\n	}\r\n\r\n	FUNCTION ADD_SERVICE($SERVICE=FALSE) {\r\n		$DATA[''PAGETITLE'']="ADD NEW SERVICE";\r\n		$DATA[''TITLE'']="ADD NEW SERVICE";\r\n		$THIS->LOAD->MODEL(''INVOICE_MODEL'');\r\n		$THIS->LOAD->HELPER(''FORM'');\r\n		IF($SERVICE) {\r\n			$DATA[''EDIT_SERVICE'']=$THIS->INVOICE_MODEL->GET_SERVICE($SERVICE);\r\n		}\r\n		$DATA[''SERVICE'']=$THIS->INVOICE_MODEL->GET_SERVICE();\r\n		$DATA[''CONTANT'']=$THIS->LOAD->VIEW(''SERVICEADDFORM'',$DATA,TRUE);\r\n		$THIS->LOAD->VIEW(''MASTER'',$DATA);	\r\n	}\r\n\r\n	FUNCTION DEL_SERVICE() {\r\n		$THIS->LOAD->MODEL(''INVOICE_MODEL'');\r\n		$DEL_ID=$THIS->INPUT->POST(''ID'');\r\n		$SERVICE_DATA = ARRAY(\r\n			''DELETED_AT''=>DATE(''Y-M-D H:I:S'')		\r\n		);\r\n		\r\n		$DELQUERY = $THIS->INVOICE_MODEL->DEL_SERVICE($SERVICE_DATA,$DEL_ID);\r\n		IF($DELQUERY) {\r\n			$RETURN=ARRAY("STATUS"=>''1'',"MESSAGE"=>"SERVICE DELETED SUCCESSFULLY");\r\n		}\r\n		ELSE {\r\n			$RETURN=ARRAY("STATUS"=>''0'',"MESSAGE"=>"SOMETHING WENT WRONG!!");\r\n		}\r\n		ECHO JSON_ENCODE($RETURN);				\r\n	}\r\n\r\n	FUNCTION SAVE_SERVICE() {\r\n		$THIS->LOAD->MODEL(''INVOICE_MODEL'');\r\n		$THIS->LOAD->LIBRARY(''FORM_VALIDATION'');\r\n		$THIS->FORM_VALIDATION->SET_ERROR_DELIMITERS(''<DIV CLASS="ERROR">'', ''</DIV>'');\r\n		$THIS->FORM_VALIDATION->SET_RULES(''SERVICENAME'', ''SERVICE NAME'', ''REQUIRED|MIN_LENGTH[1]'');\r\n		IF ($THIS->FORM_VALIDATION->RUN() == FALSE) {\r\n			SET_MESSAGE(VALIDATION_ERRORS());\r\n			REDIRECT(BASE_URL().''INVOICE/ADD_SERVICE'');\r\n			RETURN 0;\r\n		}	\r\n		ELSE {\r\n			$SERVICEID=$THIS->INPUT->POST(''SERVICEID'');\r\n			$SERVICENAME = STRTOUPPER($THIS->INPUT->POST(''SERVICENAME''));\r\n			$NOTE = $THIS->INPUT->POST(''NOTE'');\r\n			$COMPANYID = $THIS->SESSION->USERDATA(''COMPANYID'');\r\n			IF($SERVICEID) {\r\n				$UPDATED_AT	= DATE(''Y-M-D H:I:S'');\r\n				$SERVICE_DATA = ARRAY(\r\n					''SERVICENAME''=>$SERVICENAME,\r\n					''NOTE''=>$NOTE,\r\n					''UPDATED_AT''=>$UPDATED_AT\r\n				);\r\n				$RES=$THIS->INVOICE_MODEL->UPDATE_SERVICE($SERVICE_DATA,$SERVICEID);	\r\n				IF($RES) {\r\n					$THIS->SESSION->SET_FLASHDATA(''SUCCESS'',''SERVICE EDITED SUCCESSFULLY'');\r\n					REDIRECT(BASE_URL().''INVOICE/ADD_SERVICE'');\r\n				}\r\n				ELSE {\r\n					$THIS->SESSION->SET_FLASHDATA(''ERROR'',''SOMTHING WENT WRONG'');\r\n					REDIRECT(BASE_URL().''INVOICE/ADD_SERVICE'');\r\n				}				\r\n			}\r\n			ELSE {\r\n				$CREATED_AT	= DATE(''Y-M-D H:I:S'');\r\n				$SERVICE_DATA = ARRAY(\r\n					''COMPANYID''=>$COMPANYID,\r\n					''SERVICENAME''=>$SERVICENAME,\r\n					''NOTE''=>$NOTE,\r\n					''CREATED_AT''=>$CREATED_AT\r\n				);		\r\n				$RES=$THIS->INVOICE_MODEL->ADD_SERVICE($SERVICE_DATA);	\r\n				IF($RES) {\r\n					$THIS->SESSION->SET_FLASHDATA(''SUCCESS'',''SERVICE ADDED SUCCESSFULLY'');\r\n					REDIRECT(BASE_URL().''INVOICE/ADD_SERVICE'');\r\n				}\r\n				ELSE {\r\n					$THIS->SESSION->SET_FLASHDATA(''ERROR'',''SOMTHING WENT WRONG'');\r\n					REDIRECT(BASE_URL().''INVOICE/ADD_SERVICE'');\r\n				}\r\n			}\r\n		}\r\n	}	\r\n	\r\n	FUNCTION VIEW_INVOICE() {\r\n		$DATA[''TITLE'']="INVOICE DETAILS";\r\n		$THIS->LOAD->MODEL(''DASHBOARD_MODEL'');\r\n		$THIS->LOAD->MODEL(''COMPANY_MODEL'');\r\n		$THIS->LOAD->MODEL(''USER_MODEL'');\r\n		$THIS->LOAD->MODEL(''INVOICE_MODEL'');\r\n		$DATA[''INVOICE'']=$THIS->INVOICE_MODEL->GET_INVOICE();\r\n		$DATA[''CUSTOMER_LIST'']=$THIS->USER_MODEL->GET_CUSTOMER();\r\n		$DATA[''CONTANT'']=$THIS->LOAD->VIEW(''VIEW_INVOICE'',$DATA,TRUE);\r\n		$THIS->LOAD->VIEW(''MASTER'',$DATA);		\r\n	}\r\n	\r\n	FUNCTION SEARCH_INVOICE() {\r\n		$CUSTID=$THIS->INPUT->POST(''CUSTID'');\r\n		$PAYMENT_STATUS=$THIS->INPUT->POST(''PAYMENT_STATUS'');\r\n		$INVOICE_NO=$THIS->INPUT->POST(''INVOICE_NO'');\r\n		$FROM_DATE=$THIS->INPUT->POST(''FROM_DATE'');\r\n		$TO_DATE=$THIS->INPUT->POST(''TO_DATE'');		\r\n		$THIS->LOAD->MODEL(''INVOICE_MODEL'');\r\n		$THIS->LOAD->MODEL(''USER_MODEL'');\r\n\r\n		$FILTER=ARRAY();\r\n\r\n		IF($CUSTID!='''') {\r\n			$FILTER[''INVOICE.CUSTID'']=$CUSTID;\r\n		}\r\n\r\n		IF($PAYMENT_STATUS!='''') {\r\n			IF($PAYMENT_STATUS==''DRAFTED'') {\r\n				$FILTER[''HAVING'']="SUM(PAYMENT_RECEIVED.AMOUNT) IS NULL";	\r\n			}\r\n			ELSEIF($PAYMENT_STATUS==''PARTIAL'') {\r\n				$FILTER[''HAVING'']=''SUM(PAYMENT_RECEIVED.AMOUNT) > 0'';	\r\n				$FILTER[''HAVING'']=''SUM(PAYMENT_RECEIVED.AMOUNT) < INVOICE.TOTAL_AMOUNT'';	\r\n			}\r\n			ELSEIF($PAYMENT_STATUS==''PAID'') {\r\n				$FILTER[''HAVING'']=''SUM(PAYMENT_RECEIVED.AMOUNT) = INVOICE.TOTAL_AMOUNT'';	\r\n			}\r\n		}\r\n\r\n		IF($INVOICE_NO!='''') {\r\n			$FILTER[''INVOICE.INVOICE_NO'']=$INVOICE_NO;\r\n		}\r\n\r\n		IF($FROM_DATE!='''') {\r\n			$FILTER[''INVOICE.BILL_DATE >= '']=$FROM_DATE;\r\n		}\r\n\r\n		IF($TO_DATE!='''') {\r\n			$FILTER[''INVOICE.BILL_DATE <= '']=$TO_DATE;\r\n		}\r\n		$THIS->DB->_PROTECT_IDENTIFIERS=FALSE;\r\n		$DATA[''INVOICE'']=$THIS->INVOICE_MODEL->GET_INVOICE($FILTER);\r\n		$DATA[''CUSTOMER_LIST'']=$THIS->USER_MODEL->GET_CUSTOMER();\r\n		$DATA[''CONTANT'']=$THIS->LOAD->VIEW(''VIEW_INVOICE'',$DATA,TRUE);\r\n		$THIS->LOAD->VIEW(''MASTER'',$DATA);		\r\n	}\r\n\r\n	FUNCTION DEL_INVOICE() {\r\n		$THIS->LOAD->MODEL(''INVOICE_MODEL'');\r\n		$DEL_ID=$THIS->INPUT->POST(''ID'');\r\n		IF(COUNT($DEL_ID) > 0) {\r\n			$DELQUERY = $THIS->INVOICE_MODEL->DEL_INVOICE($DEL_ID);\r\n			IF($DELQUERY) {\r\n				$RETURN=ARRAY("STATUS"=>''1'',"MESSAGE"=>"INVOICE AND INVOICE PAYMENT DELETED SUCCESSFULLY");	\r\n			}\r\n			ELSE {\r\n				$RETURN=ARRAY("STATUS"=>''0'',"MESSAGE"=>"SOMETHING WENT WRONG!!");\r\n			}\r\n			\r\n		}\r\n		ELSE {\r\n			$RETURN=ARRAY("STATUS"=>''0'',"MESSAGE"=>"INVALID INVOICE SELECTED");\r\n		}\r\n		\r\n		ECHO JSON_ENCODE($RETURN);				\r\n	}\r\n}', '', '2015-02-19 08:39:55', '0000-00-00 00:00:00', NULL),
(6, 1, 'WEB DESIGN', '', '2015-03-16 08:08:17', '0000-00-00 00:00:00', NULL);

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
-- Table structure for table `task_label`
--

CREATE TABLE IF NOT EXISTS `task_label` (
  `task_label_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_label` varchar(220) NOT NULL,
  PRIMARY KEY (`task_label_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `task_label`
--

INSERT INTO `task_label` (`task_label_id`, `task_label`) VALUES
(1, 'New Requirement'),
(2, 'Bug Fixing');

-- --------------------------------------------------------

--
-- Table structure for table `task_priority`
--

CREATE TABLE IF NOT EXISTS `task_priority` (
  `task_priority_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_priority` varchar(220) NOT NULL,
  PRIMARY KEY (`task_priority_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `task_priority`
--

INSERT INTO `task_priority` (`task_priority_id`, `task_priority`) VALUES
(1, 'Regular'),
(2, 'Normal'),
(3, 'Urgent');

-- --------------------------------------------------------

--
-- Table structure for table `task_status`
--

CREATE TABLE IF NOT EXISTS `task_status` (
  `task_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_status` varchar(220) NOT NULL,
  `rank` int(1) NOT NULL,
  `task_status_color` varchar(220) NOT NULL,
  PRIMARY KEY (`task_status_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `task_status`
--

INSERT INTO `task_status` (`task_status_id`, `task_status`, `rank`, `task_status_color`) VALUES
(1, 'Open', 1, '#3C3DBC'),
(2, 'Ongoing', 2, '#3CB2BC'),
(3, 'Closed', 3, '#A82020');

-- --------------------------------------------------------

--
-- Table structure for table `tax`
--

CREATE TABLE IF NOT EXISTS `tax` (
  `taxid` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `tax` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`taxid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tax`
--

INSERT INTO `tax` (`taxid`, `companyid`, `name`, `tax`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'SERVICE TAX @', 12, '2015-01-30 09:00:24', '0000-00-00 00:00:00', NULL),
(2, 2, 'EDU. CESS @', 2, '2015-01-30 09:02:25', '0000-00-00 00:00:00', NULL),
(3, 3, 'Sec & Higher Edu Cess @', 1, '2015-01-31 13:47:54', '0000-00-00 00:00:00', NULL),
(4, 2, 'SEC & HIGHER EDU CESS @ ', 1, '2015-02-07 11:48:40', '0000-00-00 00:00:00', NULL);

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
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `companyid`, `people_id`, `password`, `temp`, `email`, `dob`, `note`, `role`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 78, 'e99a18c428cb38d5f260853678922e03', 'abc123', 'admin@email.com', '0000-00-00', '', 'admin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(2, 1, 76, 'e99a18c428cb38d5f260853678922e03', 'abc123', 'graham@email.com', '2015-03-03', '', 'user', '2015-03-17 07:06:47', '0000-00-00 00:00:00', NULL),
(3, 1, 77, 'e99a18c428cb38d5f260853678922e03', 'abc123', 'paul@email.com', '2015-03-03', '', 'employee', '2015-03-17 07:06:47', '0000-00-00 00:00:00', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
