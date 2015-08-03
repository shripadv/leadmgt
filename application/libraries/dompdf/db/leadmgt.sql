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
-- Database: `leadmgt`
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`activity_id`, `activity_owner`, `lead_id`, `project_id`, `activity_title`, `datetime`, `activity_type`, `lead_status`, `project_status`, `comment`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 0, 'demo', '2015-07-07 10:07:23', 'meeting', '6', '', 'demo activity', 2, '2015-07-07 10:07:23', '0000-00-00 00:00:00');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  `invoice_prefix` varchar(100) NOT NULL,
  `terms_condition` text,
  `bank_details` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`companyid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`companyid`, `companyname`, `shortname`, `tag_line`, `owner`, `cemail`, `cmobile`, `ctel`, `pan`, `sertexno`, `caddress`, `clogo`, `establishdate`, `invoice_template`, `invoice_prefix`, `terms_condition`, `bank_details`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'G-ORDINATEUR PVT. LTD.', 'G-ORDINATEUR', '', 'GUNESH', 'info@gordinateur.com', '', '', '', '', 'C-508, Kukreja Center, Sector-11, \r\nCBD Belapur, Navi Mumbai 400614,\r\nMaharashtra, India', 'G-ORDINATEUR PVT. LTD./logo.png', '0000-00-00', '0', '', '', '', '2015-04-10 09:35:09', '2015-07-08 13:14:32', NULL),
(2, 'RON PVT LTD', 'RON PVT LTD', '', 'RON', '', '9876543210', '', '', '', 'CBD, Navi-Mumbai', '', '0000-00-00', '0', '', '', '', '2015-07-14 15:52:30', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `company_modules`
--

CREATE TABLE IF NOT EXISTS `company_modules` (
  `company_modules_id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  PRIMARY KEY (`company_modules_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=57 ;

--
-- Dumping data for table `company_modules`
--

INSERT INTO `company_modules` (`company_modules_id`, `companyid`, `module_id`) VALUES
(51, 1, 1),
(52, 1, 2),
(53, 1, 3),
(54, 1, 4),
(55, 2, 1),
(56, 2, 2);

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=77 ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`custid`, `people_id`, `companyid`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 1, '2015-02-20 12:03:21', '2015-02-20 12:13:24', NULL),
(2, 4, 1, '2015-02-20 12:05:52', '2015-02-26 07:52:03', NULL),
(3, 5, 1, '2015-02-20 12:12:55', '2015-02-20 12:14:54', NULL),
(4, 6, 1, '2015-02-20 12:20:44', '0000-00-00 00:00:00', NULL),
(5, 7, 1, '2015-02-20 12:25:53', '0000-00-00 00:00:00', NULL),
(6, 8, 1, '2015-02-20 12:28:35', '0000-00-00 00:00:00', NULL),
(7, 9, 1, '2015-02-20 12:34:48', '0000-00-00 00:00:00', NULL),
(8, 10, 1, '2015-02-20 12:37:47', '2015-02-20 12:40:12', NULL),
(9, 11, 1, '2015-02-20 12:39:47', '2015-02-21 16:15:48', NULL),
(10, 12, 1, '2015-02-20 12:42:17', '0000-00-00 00:00:00', NULL),
(11, 13, 1, '2015-02-20 12:44:22', '0000-00-00 00:00:00', NULL),
(12, 14, 1, '2015-02-20 12:47:29', '0000-00-00 00:00:00', NULL),
(13, 15, 1, '2015-02-20 12:49:34', '0000-00-00 00:00:00', NULL),
(14, 16, 1, '2015-02-20 12:53:26', '0000-00-00 00:00:00', NULL),
(15, 17, 1, '2015-02-20 12:56:32', '0000-00-00 00:00:00', NULL),
(16, 18, 1, '2015-02-20 12:58:49', '0000-00-00 00:00:00', NULL),
(17, 19, 1, '2015-02-20 13:01:04', '0000-00-00 00:00:00', NULL),
(18, 20, 1, '2015-02-20 13:07:33', '0000-00-00 00:00:00', NULL),
(19, 21, 1, '2015-02-20 13:10:15', '0000-00-00 00:00:00', NULL),
(20, 22, 1, '2015-02-20 13:13:42', '0000-00-00 00:00:00', NULL),
(21, 23, 1, '2015-02-20 13:20:06', '0000-00-00 00:00:00', NULL),
(22, 24, 1, '2015-02-20 13:22:08', '0000-00-00 00:00:00', NULL),
(23, 25, 1, '2015-02-20 13:27:13', '0000-00-00 00:00:00', NULL),
(24, 26, 1, '2015-02-20 13:29:25', '0000-00-00 00:00:00', NULL),
(25, 27, 1, '2015-02-20 13:32:30', '0000-00-00 00:00:00', NULL),
(26, 28, 1, '2015-02-20 13:33:52', '0000-00-00 00:00:00', NULL),
(27, 29, 1, '2015-02-20 13:37:00', '0000-00-00 00:00:00', NULL),
(28, 30, 1, '2015-02-20 13:39:04', '0000-00-00 00:00:00', NULL),
(29, 31, 1, '2015-02-20 13:41:25', '0000-00-00 00:00:00', NULL),
(30, 32, 1, '2015-02-20 13:44:19', '0000-00-00 00:00:00', NULL),
(31, 33, 1, '2015-02-20 13:47:14', '0000-00-00 00:00:00', NULL),
(32, 34, 1, '2015-02-20 13:49:09', '0000-00-00 00:00:00', NULL),
(33, 35, 1, '2015-02-20 13:53:54', '0000-00-00 00:00:00', NULL),
(34, 36, 1, '2015-02-20 13:55:25', '0000-00-00 00:00:00', NULL),
(35, 37, 1, '2015-02-20 13:57:09', '0000-00-00 00:00:00', NULL),
(36, 38, 1, '2015-02-20 13:59:14', '0000-00-00 00:00:00', NULL),
(37, 39, 1, '2015-02-20 14:01:19', '0000-00-00 00:00:00', NULL),
(38, 40, 1, '2015-02-20 14:03:39', '0000-00-00 00:00:00', NULL),
(39, 41, 1, '2015-02-20 14:05:34', '0000-00-00 00:00:00', NULL),
(40, 42, 1, '2015-02-20 14:07:47', '0000-00-00 00:00:00', NULL),
(41, 43, 1, '2015-02-20 14:10:32', '0000-00-00 00:00:00', NULL),
(42, 44, 1, '2015-02-20 14:12:35', '0000-00-00 00:00:00', NULL),
(43, 45, 1, '2015-02-20 14:14:40', '0000-00-00 00:00:00', NULL),
(44, 46, 1, '2015-02-20 14:17:30', '0000-00-00 00:00:00', NULL),
(45, 47, 1, '2015-02-20 14:19:57', '0000-00-00 00:00:00', NULL),
(46, 48, 1, '2015-02-20 14:25:51', '0000-00-00 00:00:00', NULL),
(47, 49, 1, '2015-02-20 14:27:33', '0000-00-00 00:00:00', NULL),
(48, 50, 1, '2015-02-20 14:35:35', '0000-00-00 00:00:00', NULL),
(49, 51, 1, '2015-02-20 14:40:28', '0000-00-00 00:00:00', NULL),
(50, 52, 1, '2015-02-20 14:44:40', '0000-00-00 00:00:00', NULL),
(51, 53, 1, '2015-02-21 07:53:05', '0000-00-00 00:00:00', NULL),
(52, 54, 1, '2015-02-23 16:56:34', '0000-00-00 00:00:00', NULL),
(53, 55, 1, '2015-02-23 16:58:38', '0000-00-00 00:00:00', NULL),
(54, 56, 1, '2015-02-23 17:00:54', '0000-00-00 00:00:00', NULL),
(55, 57, 1, '2015-02-23 17:24:12', '0000-00-00 00:00:00', NULL),
(56, 58, 1, '2015-02-23 17:25:25', '2015-02-27 06:18:07', NULL),
(57, 59, 1, '2015-02-23 17:26:44', '0000-00-00 00:00:00', NULL),
(58, 60, 1, '2015-02-23 17:33:10', '0000-00-00 00:00:00', NULL),
(59, 61, 1, '2015-02-23 17:34:25', '0000-00-00 00:00:00', NULL),
(60, 62, 1, '2015-02-23 17:36:07', '0000-00-00 00:00:00', NULL),
(61, 63, 1, '2015-02-23 17:38:01', '0000-00-00 00:00:00', NULL),
(62, 64, 1, '2015-02-23 17:39:09', '0000-00-00 00:00:00', NULL),
(63, 65, 1, '2015-02-23 17:40:50', '0000-00-00 00:00:00', NULL),
(64, 66, 1, '2015-02-26 07:42:50', '0000-00-00 00:00:00', NULL),
(65, 67, 1, '2015-02-26 07:46:21', '2015-02-26 07:53:29', NULL),
(66, 68, 1, '2015-02-26 08:36:26', '0000-00-00 00:00:00', NULL),
(67, 69, 1, '2015-02-26 08:44:32', '0000-00-00 00:00:00', NULL),
(68, 70, 1, '2015-02-26 08:48:36', '0000-00-00 00:00:00', NULL),
(69, 71, 1, '2015-02-26 08:53:04', '0000-00-00 00:00:00', NULL),
(70, 72, 1, '2015-03-05 07:24:24', '0000-00-00 00:00:00', NULL),
(71, 73, 1, '2015-03-05 08:37:06', '0000-00-00 00:00:00', NULL),
(72, 74, 1, '2015-03-09 05:02:37', '0000-00-00 00:00:00', NULL),
(73, 75, 1, '2015-03-09 05:10:14', '0000-00-00 00:00:00', NULL),
(74, 76, 1, '2015-03-11 13:30:50', '0000-00-00 00:00:00', NULL),
(75, 77, 1, '2015-03-13 09:41:30', '0000-00-00 00:00:00', NULL),
(76, 78, 1, '2015-07-08 08:41:20', '0000-00-00 00:00:00', NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `companyid`, `people_id`, `dob`, `join_date`, `designation`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '0000-00-00', '0000-00-00', 'superadmin', '0000-00-00 00:00:00', NULL),
(2, 1, 2, '2015-04-28', '2015-04-28', 'Director', '2015-04-29 00:00:00', '0000-00-00 00:00:00'),
(3, 2, 79, '0000-00-00', '0000-00-00', '', '2015-07-14 14:36:47', NULL),
(5, 1, 81, '0000-00-00', '0000-00-00', '', '2015-07-15 09:55:35', NULL),
(6, 1, 82, '0000-00-00', '0000-00-00', '', '2015-07-15 13:37:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE IF NOT EXISTS `expenses` (
  `exid` int(10) NOT NULL AUTO_INCREMENT,
  `companyid` int(10) NOT NULL,
  `extid` int(3) DEFAULT NULL,
  `payment_type` enum('Cheque',  'Cash',  'Transfer',  'DD') CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `companyid` int(11) NOT NULL,
  `lead_id` int(11) NOT NULL,
  `file_title` varchar(200) NOT NULL,
  `file_path` varchar(200) NOT NULL,
  `project_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `file_type` varchar(220) NOT NULL,
  `file_size` varchar(220) NOT NULL,
  `upload_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `file`
--

INSERT INTO `file` (`file_id`, `companyid`, `lead_id`, `file_title`, `file_path`, `project_id`, `client_id`, `emp_id`, `file_type`, `file_size`, `upload_by`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 'Demo', 'upload/JOHN NASH/Tulips.jpg', 0, 0, 2, 'jpg', '620888', 2, '2015-07-08 13:17:55', '0000-00-00 00:00:00'),
(2, 1, 1, 'Demo', 'upload/PHONIX VALDIMIR/Tulips.jpg', 0, 0, 0, 'jpg', '620888', 2, '2015-07-08 15:54:45', '0000-00-00 00:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`inid`, `invoice_no`, `companyid`, `custid`, `total_amount`, `advance`, `bill_date`, `payment_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '001', 1, 76, 5000, 0, '2015-07-08', 'partial', '2015-07-08 12:34:41', '0000-00-00 00:00:00', NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `invoice_item`
--

INSERT INTO `invoice_item` (`initid`, `inid`, `particular`, `quantity`, `rate`, `amount`, `tax_id`, `reimbursement`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'WEB DESIGN WITH ADMIN PANEL', 1, 5000, 5000, 0, 0, '2015-07-08 12:34:41', '0000-00-00 00:00:00', NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `lead`
--

INSERT INTO `lead` (`lead_id`, `companyid`, `lead_owner`, `people_id`, `lead_source`, `product`, `lead_status`, `created_at`, `created_by`, `updated_at`) VALUES
(1, 1, 2, 78, '3', 'Web Design', '6', '2015-07-07 08:31:41', 2, '2015-07-07 10:07:23');

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
  `companyid` int(11) NOT NULL,
  `lead_status` varchar(220) NOT NULL,
  `rank` int(11) NOT NULL,
  `status_type` enum('open','close') NOT NULL,
  `color` varchar(220) NOT NULL,
  PRIMARY KEY (`lead_status_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `lead_status`
--

INSERT INTO `lead_status` (`lead_status_id`, `companyid`, `lead_status`, `rank`, `status_type`, `color`) VALUES
(1, 0, 'Converted', 1, 'open', '#FF0000'),
(2, 0, 'follow-up', 2, 'open', '#3CB2BC'),
(3, 0, 'bad info', 3, 'close', '#CF1F1F'),
(4, 0, 'Closed', 4, 'close', '#A82020'),
(5, 0, 'Open', 5, 'open', '#3C3DBC'),
(6, 1, 'Converted', 5, 'open', '#FF0000'),
(7, 1, 'follow-up', 2, 'open', '#3CB2BC'),
(8, 1, 'bad info', 3, 'close', '#CF1F1F'),
(9, 1, 'Closed', 1, 'close', '#A82020'),
(10, 1, 'Open', 4, 'open', '#3C3DBC'),
(11, 2, 'Converted', 1, 'open', '#FF0000'),
(12, 2, 'follow-up', 2, 'open', '#3CB2BC'),
(13, 2, 'bad info', 3, 'close', '#CF1F1F'),
(14, 2, 'Closed', 4, 'close', '#A82020'),
(15, 2, 'Open', 5, 'open', '#3C3DBC');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=145 ;

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
(104, 3, 'john@email.com', '2015-06-17 06:00:00'),
(105, 3, 'john@email.com', '2015-06-17 07:00:00'),
(106, 3, 'john@email.com', '2015-07-02 11:00:00'),
(107, 3, 'john@email.com', '2015-07-03 10:00:00'),
(108, 3, 'john@email.com', '2015-07-03 11:00:00'),
(109, 2, 'john@email.com', '2015-07-03 11:00:00'),
(110, 1, 'info@gordinateur.com ', '2015-07-03 11:00:00'),
(111, 2, 'john@email.com', '2015-07-03 11:00:00'),
(112, 2, 'john@email.com', '2015-07-03 13:00:00'),
(113, 2, 'john@email.com', '2015-07-03 13:00:00'),
(114, 1, 'info@gordinateur.com ', '2015-07-04 06:00:00'),
(115, 2, 'john@email.com', '2015-07-06 06:00:00'),
(116, 1, 'info@gordinateur.com ', '2015-07-06 08:00:00'),
(117, 2, 'john@email.com', '2015-07-07 06:00:00'),
(118, 1, 'info@gordinateur.com ', '2015-07-07 08:00:00'),
(119, 2, 'john@email.com', '2015-07-07 08:00:00'),
(120, 2, 'john@email.com', '2015-07-07 08:00:00'),
(121, 2, 'john@email.com', '2015-07-08 06:00:00'),
(122, 2, 'john@email.com', '2015-07-09 06:00:00'),
(123, 2, 'john@email.com', '2015-07-09 12:00:00'),
(124, 1, 'info@gordinateur.com ', '2015-07-14 10:00:00'),
(125, 2, 'john@email.com', '2015-07-14 10:00:00'),
(126, 1, 'info@gordinateur.com ', '2015-07-14 11:00:00'),
(127, 2, 'john@email.com', '2015-07-14 11:00:00'),
(128, 2, 'john@email.com', '2015-07-14 14:00:00'),
(129, 1, 'info@gordinateur.com ', '2015-07-14 14:00:00'),
(130, 2, 'john@email.com', '2015-07-14 14:00:00'),
(132, 1, 'info@gordinateur.com ', '2015-07-14 15:00:00'),
(133, 1, 'info@gordinateur.com ', '2015-07-14 15:00:00'),
(134, 2, 'john@email.com', '2015-07-15 06:00:00'),
(135, 1, 'info@gordinateur.com ', '2015-07-15 09:00:00'),
(136, 2, 'john@email.com', '2015-07-15 09:00:00'),
(137, 5, 'andrewwill@email.com', '2015-07-15 09:00:00'),
(138, 5, 'andrewwill@email.com', '2015-07-15 11:00:00'),
(139, 5, 'andrewwill@email.com', '2015-07-15 12:00:00'),
(140, 2, 'john@email.com', '2015-07-15 13:00:00'),
(141, 1, 'info@gordinateur.com ', '2015-07-15 13:00:00'),
(142, 2, 'john@email.com', '2015-07-15 13:00:00'),
(143, 2, 'john@email.com', '2015-07-20 11:00:00'),
(144, 2, 'john@email.com', '2015-07-20 12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE IF NOT EXISTS `modules` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(220) NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`module_id`, `module_name`) VALUES
(1, 'lead'),
(2, 'invoice'),
(3, 'expense'),
(4, 'project');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `payment_received`
--

INSERT INTO `payment_received` (`prid`, `companyid`, `inid`, `payment_type`, `ref_no`, `amount`, `date`, `note`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'cash', '', 2400, '2015-07-08', '', '2015-07-08 12:34:41', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_type`
--

CREATE TABLE IF NOT EXISTS `payment_type` (
  `payment_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(220) NOT NULL,
  PRIMARY KEY (`payment_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `payment_type`
--

INSERT INTO `payment_type` (`payment_type_id`, `payment_type`) VALUES
(1, 'Cash'),
(2, 'Cheque'),
(3, 'Transfer'),
(4, 'DD');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=83 ;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`people_id`, `company_name`, `first_name`, `last_name`, `email`, `mobile`, `phone`, `website`, `sec_email`, `industry`, `skype`, `address1`, `address2`, `city`, `state`, `country`, `note`, `created_at`, `updated_at`) VALUES
(1, 'Gordinateur', 'Gunesh', '', 'info@gordinateur.com ', '', '', '', '', 'Software', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'GORDINATEUR', 'JOHN', 'NASH', 'john@email.com', '9262626262', '', '', '', 'Software', '', 'CBD1, Navi-Mumbai', '', 'CBD', 'MAHARASHTRA', 'India', '', '0000-00-00 00:00:00', '2015-07-15 13:34:07'),
(3, 'MEYASA REALTY', 'YAWAR', 'KHAN', 'care@meyasarealty.com', '8268899786', '', 'http://www.meyasarealty.com/', '', '', '', 'A1/34/6, Sector 21\nVashi (Turbhe)\nNavi Mumbai 400705\nMaharashtra, India', '', '', 'maharashatra', 'india', '', '2015-02-20 12:03:21', '2015-02-20 12:13:24'),
(4, 'ARMAAN HR SOLUTION', 'PRAVIN', 'NAIR', '', '9920172567', '', 'http://armaanhrsolutions.com/', '', '', '', 'Office No.50, Ground floor, \nVindhya, Commercial Complex,\n Plot no.1, Sector 11, \nCBD, Belapur 400614, \nMumbai, Maharashtra, India', '', '', 'maharashatra', 'india', '', '2015-02-20 12:05:52', '2015-02-26 07:52:03'),
(5, 'SHREE GRAPHICS', 'SUJIT', 'DAS', 'shgraph474@gmail.com', '8692090909', '', 'http://shreegraphics.co.in/', '', '', '', 'Sai Tej, Shop No. 6,\nPlot No. 1& 3, Sector-19,\nroad no-11,near post office,\nNew Panvel-410 206\nMumbai, Maharashtra, India', '', '', 'maharashatra', 'india', '', '2015-02-20 12:12:55', '2015-02-20 12:14:54'),
(6, 'SHREE TOURS & TRAVELS', 'RANJEET', 'DAS', 'info@shreetravels24.com', '8652286666', '', 'http://www.shreetravels24.com/', '', '', '', 'Sai Tej, Shop no-06, Plot no-1/3, Sec-19, Near post office, New panvel-410206, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 12:20:44', '0000-00-00 00:00:00'),
(7, 'VISHWA ASSOCIATES', 'VISHU', '', 'hr@vishvaassociates.com', '9323040973', '', 'http://vishvaassociates.com/', '', '', '', '304, Chawla Complex, Sector - 15, CBD - Belapur,\n                                    Navi Mumbai - 400614. Maharshtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 12:25:53', '0000-00-00 00:00:00'),
(8, 'VISHVA PROTECH PVT. LTD.', 'VISHU', '', 'info@vishvaprotech.com', '9820229591', '', 'http://www.vishvaprotech.com/', '', '', '', '10/C, 7th Cross, 2nd Main, Basaveshwara Road,\nAkshayanagar(w), Bangalore - 560068, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 12:28:35', '0000-00-00 00:00:00'),
(9, 'KONARK SHIPPING LINES PVT. LTD.', 'SURESH', 'RAMAN', 'info@konarkshipping.in', '9769922670', '', 'http://konarkshipping.in/', '', '', '', '07, 4th Floor, Vindhya Commercial Complex,\nPlot No.1, Sector-11, CBD Belapur-400 614,\nNavi Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 12:34:48', '0000-00-00 00:00:00'),
(10, 'PALLAS SOLUTIONS', 'PRASHAT', 'LALKA', '', '9820527690', '', 'pallassolutions.in', '', '', '', 'A- 204, Kukreja Centre, Plot No-13, Sector-11, CBD Belapur, Navi Mumbai, India-400 614.', '', '', 'maharashatra', 'india', '', '2015-02-20 12:37:47', '2015-02-20 12:40:12'),
(11, 'GLAMRACE PRODUCTIONS', 'PRASHANT', 'LALKA', 'productions@glamrace.com', '9820527690', '', 'http://glamrace.com/', '', '', '', 'A-204, Kukreja Centre,\nSector - 11, CBD Belapur,\nNavi Mumbai\nPin 400614\nMaharashtra,\nIndia.', '', '', 'maharashatra', 'india', '', '2015-02-20 12:39:47', '2015-02-21 16:15:48'),
(12, 'ABB MARINE SERVICES PVT. LTD.', 'CAPT.', 'RAJU', 'info@abbmarineservice.com', '9967213647', '', 'http://www.abbmarineservice.com/', '', '', '', 'A-203, Kukreja Centre, \nSector No:- 11, CBD Belapur, \nNavi Mumbai:- 400614, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 12:42:17', '0000-00-00 00:00:00'),
(13, 'MAHESNDRA S. BHILARE & CO.', 'MAHENDRA', 'BHILARE', 'cabhilarems@gmail.com', '9819437881', '', 'http://bhilareca.com/\n', '', '', '', 'A-101, Kukreja Centre, Plot No-13, Sector-11, CBD Belapur, Navi Mumbai, India-400 614.', '', '', 'maharashatra', 'india', '', '2015-02-20 12:44:22', '0000-00-00 00:00:00'),
(14, 'RAHUL S. BHILARE & CO.', 'RAHUL', 'BHILARE', 'rbhilare11@gmail.com', '9920761045', '', 'http://bhilarecs.com/', '', '', '', 'A-101, Kukreja Centre,Plot No.13, Sector-11, CBD Belapur, Navi Mumbai- 400614, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 12:47:29', '0000-00-00 00:00:00'),
(15, 'DNAV MARINE MANAGEMENT LLC.', 'CAPT.', 'PAWAN', 'info@dnavmarine.com', '9969842729', '', 'http://dnavmarine.com/', '', '', '', 'DNAV Marine Management LLC, 420, Al Attar Mall, Al Karama, Dubai, UAE.', '', '', 'maharashatra', 'india', '', '2015-02-20 12:49:34', '0000-00-00 00:00:00'),
(16, 'GANPATI HOSPITALITY SERVICES PVT. LTD.', 'RAVI', 'KUMAR', 'info@ganpatiship.com', '9819112285', '', 'http://www.ganpatiship.com/', '', '', '', 'C-211 To C-214, Kukreja centre,\n2nd floor, Plot no-13, Sector-11, \nCBD Belapur, Navi Mumbai-400614, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 12:53:26', '0000-00-00 00:00:00'),
(17, 'DIAMOND LOGISTICS', 'MAHESH', 'BANKHALE', 'info@diamondlogistics.in', '9702744687', '', 'http://diamondlogistics.in/', '', '', '', 'Office No. 227/ B,\nSecond Floor, Sai Chamber,\nPlot No. 44, Sector-11,\nCBD Belapur, Navi Mumbai, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 12:56:32', '0000-00-00 00:00:00'),
(18, 'AVS SHIPPING AGENCIES', 'SANTOSH', 'SAWANT', 'info@avsshipping.com', '9870889991', '', 'http://avsshipping.com/', '', '', '', '2, Donald Gomes House, \n      Road No. - 3, \n      Sahar Village,\n      International Air Cargo Road,\n      Andheri ( East ),\n      Mumbai - 400 099, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 12:58:49', '0000-00-00 00:00:00'),
(19, 'BUFFER LOGISTICS (INDIA) PVT. LTD.', 'NADIM', 'KHAN', 'info@bufferlogistics.com', '9833190366', '', 'http://www.bufferlogistics.com/', '', '', '', 'Ideal Trade Center, \nOffice No. 601, 6th Floor,\nPlot No. 64, Scetor - 11, \nCBD-Belapur, Navi Mumbai - 400614, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 13:01:04', '0000-00-00 00:00:00'),
(20, 'K STAR SHIPPING AGENCY PVT. LTD.', 'GANPAT', 'KARDE', 'info@kstarship.com', '9987272221', '', 'http://www.kstarship.com/', '', '', '', '242, Sai Chambers, 2nd Floor,\n       Plot No. 44, Sector 11,\n       CBD Belapur,\n       Navi Mumbai 400 614, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 13:07:33', '0000-00-00 00:00:00'),
(21, 'YES SHIP MARINE TRANSPORT PVT. LTD.', 'CAPT.', 'SUBODH', 'info@yesshipmarine.com', '8879162829', '', 'http://www.yesshipmarine.com/', '', '', '', 'Office no : 1204, Real Tech Park,\nSec -30A, Opp Vashi Station, \nVashi, Navi Mumbai.\nPin Code - 400 703, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 13:10:15', '0000-00-00 00:00:00'),
(22, 'OCEAN GOLD SEAFOODS', 'NASIR', '', 'info@oceangoldseafoods.com', '8652002495', '', 'http://oceangoldseafood.in/', '', '', '', 'A-302, Kukreja Center, \n              Sector-11, CBD Belapur,\n              Navi Mumbai, Maharashtra,\n              India, Pin-400614.', '', '', 'maharashatra', 'india', '', '2015-02-20 13:13:42', '0000-00-00 00:00:00'),
(23, 'J LINK BROADBAND SERVICES', 'J.', 'P.', '', '9321009100', '', 'http://jlinkindia.com/', '', '', '', 'Ambience Court, 1 st Floor, Plot No.2, Sector-19D, Vashi. Navi Mumbai-400705, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 13:20:06', '0000-00-00 00:00:00'),
(24, 'SLIMTECH WELLNESS', 'GURU', '', 'info@slimtechwellness.com', '9773590040', '', 'http://slimtechwellness.com/', '', '', '', 'Safal Park Housing Society, Sector 25,\nOpp. Haware Centurian Mall, \nNerul, Navi Mumbai,\nMaharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 13:22:08', '0000-00-00 00:00:00'),
(25, 'MEGHA CONSTRUCTIONS', 'PATIL', '', 'info@meghaconstruction.com', '9892988246', '', 'http://meghaconstruction.com/', '', '', '', 'Office No.1,Sec 1E,Patil Villa,Near Kalamboli Police Station,Kalamboli, Navi Mumbai\nPin Code-410 218, Mumbai, Maharashtra, India. ', '', '', 'maharashatra', 'india', '', '2015-02-20 13:27:13', '0000-00-00 00:00:00'),
(26, 'JAY LANDSCAPER', 'JAYENDRA', 'PATIL', 'info@jaylandscaper.com', '9967034394', '', 'http://jaylandscaper.com/', '', '', '', 'Shree Nursery, Behind Saraswat Bank, Near Rajiv Gandhi Flyover,\nSec-4, Phase-2, Nerul,\nNavi Mumbai, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 13:29:25', '0000-00-00 00:00:00'),
(27, 'SHUBHANGI ROADLINES', 'PRADIP', 'BHULE', 'info@shubhangiroadlines.com', '9870441371', '', 'http://shubhangiroadlines.com/', '', '', '', 'Mahavir vihar, B-504\nSec-25, Nerul\nNavi Mumbai 400706, Mumbai, Maharashtra, India', '', '', 'maharashatra', 'india', '', '2015-02-20 13:32:30', '0000-00-00 00:00:00'),
(28, 'BIG STREAM', 'PETER', '', 'marketing@bigstream.in', '9768022272', '', 'http://bigstream.in/', '', '', '', 'Kailash Bhavan, Shop No.1, \nPlot No. B67 Sector-23\nNerul, Navi-Mumbai, 400706, Mumbai, Maharashtra, India', '', '', 'maharashatra', 'india', '', '2015-02-20 13:33:52', '0000-00-00 00:00:00'),
(29, 'VIJAYASHRI GRAPHICS', 'VIRENDRA', 'KULKARNI', 'vijayashrigraphics@gmail.com', '9964999948', '', 'http://www.vijayashrigraphics.com/', '', '', '', '#103 Vindhya Complex, \nSec. 11, CBD Belapur \nNavi Mumbai - 410206, Mumbai, Maharashtra, India', '', '', 'maharashatra', 'india', '', '2015-02-20 13:37:00', '0000-00-00 00:00:00'),
(30, 'REMEDY PHARMA', 'ANIL', '', 'info@remedypharma.co.in', '9223592231', '', 'http://remedypharma.co.in/', '', '', '', '1 & 3, Suyash Heights, Plot No. 36,\nSector-18,Kharghar, Navi Mumbai,\nMaharashtra, India-410210', '', '', 'maharashatra', 'india', '', '2015-02-20 13:39:04', '0000-00-00 00:00:00'),
(31, 'JAGRUTI FOUNDATION', 'RAVINDRA', 'SONAVANE', 'Jagrutifoundation@yahoo.in', '9757388421', '', 'http://jagrutifoundationtrust.org/', '', '', '', 'D - 17,  1:6,\nSahyadri CHS. Ltd.,\nSector- 08, Sanpada, \nNavi Mumbai- 400705.\nMaharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 13:41:25', '0000-00-00 00:00:00'),
(32, 'LORVEN INTERNATIONAL PVT. LTD.', 'SANGEETA', 'AGARWAL', 'info@lorveninternational.com', '9223742666', '', 'http://lorveninternational.com/', '', '', '', 'First Floor, Opp Metro Magnet Mall\nL.B.S. Marg, Bhandup West,\nMumbai- 400078, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 13:44:19', '0000-00-00 00:00:00'),
(33, 'LORVEN SPINE MANIPULATION & FITNESS CLINIC', 'DR.', 'MANISH', 'info@lorvenhealthcare.com', '9892269079', '', 'http://www.lorvenhealthcare.com/', '', '', '', 'Lorven House,\nOpp Metro Magnet Mall,LBS Marg,\nBhandup(W), Mumbai-78,Maharashtra, India .', '', '', 'maharashatra', 'india', '', '2015-02-20 13:47:14', '0000-00-00 00:00:00'),
(34, 'SUPREME IN SAFETY', 'RAJU', 'BHISE', 'sales@supremeinsafety.com', '9920470266', '', 'http://supremeinsafety.com/', '', '', '', 'A-25 Naik Nagar, Behind Sangam Hotel, Opposite Moin Masjid, \nSion – 400022, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 13:49:09', '0000-00-00 00:00:00'),
(35, 'PUJNAM', 'HITESH', 'JOSHI', 'info@pujnam.com', '9224628606', '', 'http://pujnam.com/', '', '', '', '407, Chhellavas na Nake, Mahdev vas number 1 ni same, shak market, NAVA VADAJ Ahmedabad 13, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 13:53:54', '0000-00-00 00:00:00'),
(36, 'SAMINAYU INVESTMENT', 'NAYAN', 'BHANUSHALI', 'info@saminayuinvestments.com', '9892612806', '', 'http://saminayuinvestments.com/', '', '', '', 'Satra Plaza, Sector 19/D, Palm Beach Road Vashi, Navi Mumbai-400703, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 13:55:25', '0000-00-00 00:00:00'),
(37, 'SAMINAYU PRODUCTION', 'NAYAN', 'BHANUSHALI', 'info@saminayuproductions.com', '9892612806', '', 'http://saminayuproductions.com/', '', '', '', 'Satra Plaza, Sector 19/D, Palm Beach Road Vashi, Navi Mumbai-400703, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 13:57:09', '0000-00-00 00:00:00'),
(38, 'MAHARASHTRA ARCHERY ASSOCIATIONS', 'POONAM', 'MAHATME', 'info@maharashtraarchery.com', '7666246126', '', 'http://maharashtraarchery.com/', '', '', '', 'C - 31, Industrial Estate Area,\n     Shilangan Road, Saturna,\n     Amravati, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 13:59:14', '0000-00-00 00:00:00'),
(39, 'AGRIM PROPERTIES', 'PANKAJ', 'SHRIVASTAVA', 'info@agrimproperties.com', '9619161130', '', 'http://agrimproperty.com/', '', '', '', 'Green Field Residency, Shop No. 04,, Plot No. 03, Sec -35 I, Kharghar, Navi Mumbai - 410 210, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 14:01:19', '0000-00-00 00:00:00'),
(40, 'CAS & ASSOCIATES', 'SANTOSH', 'AMBEKAR', 'info@casassociates.co.in', '9767330710', '', 'http://casassociates.co.in/Contact.php', '', '', '', 'B/10, Habbib Terrace, Ganesh Gally,\nDr. Ambedkar Road, Lalbaug,\nMumbai - 400 012. India.', '', '', 'maharashatra', 'india', '', '2015-02-20 14:03:39', '0000-00-00 00:00:00'),
(41, 'SOUMIL ENTERPRISES', 'DINESH', 'GUPTA', 'soumilenterprises@gmail.com', '9833858949', '', 'http://soumilenterprises.in/', '', '', '', '001, Build. No. : R-2, Nirlon Complex, \nPlot No. : 257D, Walbhat Road, \nOpposite Sharma Industrial Estate, \nGoregaon(East), Mumbai : 400063, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 14:05:34', '0000-00-00 00:00:00'),
(42, 'NAVIN ENTERPRISES', 'MAHESH', 'SODA', 'info@navienterprises.com', '9321182419', '', 'http://navinenterprises.com/', '', '', '', 'Gala No:26, Azad Nagar,\nCama Estate, Wallbhat Road,\nNear Kusum Masala, Goregaon (E)\nMumbai - 400 063, Maharashtra, India', '', '', 'maharashatra', 'india', '', '2015-02-20 14:07:47', '0000-00-00 00:00:00'),
(43, 'PATH FINDER HR SOLUTIONS LLP.', 'HARI', '', 'hr@pathfinderhr.in', '9619598507', '', 'http://pathfinderhr.in/', '', '', '', 'Pujeet Plaza, Shop No-25 G-Floor,\nSector-11 CBD,\nBelapur 400614, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 14:10:32', '0000-00-00 00:00:00'),
(44, 'EXHIKRAFTZ', 'ASHOK', 'GUPTA', 'info@exhikraftz.in', '9820449669', '', 'http://exhikraftz.in/', '', '', '', 'Office Block. 6, Sai Mangal Apts.,\nSector - 8, Plot No. 18,\nCharkop, Kandivali (West),\nMumbai - 67.\nMaharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 14:12:35', '0000-00-00 00:00:00'),
(45, 'MRG WATCHES', 'MANAMANT', 'RAI', 'info@mrgwatches.com', '9712202616', '', 'http://mrgwatches.com/', '', '', '', 'Office No. 227/ B, CBD Belapur, Navi Mumabi, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 14:14:40', '0000-00-00 00:00:00'),
(46, 'BRIJJKIING PROJECTS', 'BRIJESH', 'KUMAR', 'brijjkiing@gmail.com', '9004608888', '', 'http://brijjkiingprojects.com/', '', '', '', '4, Saiviraj Apartment. Plot C-8, Sector 9\nAiroli, Navi Mumbai, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 14:17:30', '0000-00-00 00:00:00'),
(47, 'MAULI SHIPPING SERVICES', 'MILIND', 'SALVI', 'info@maulishipping.com', '9893077725', '', 'http://maulishipping.com/', '', '', '', 'Gauri Complex, Office No. 31, Ground Floor, Plot No. 19,Next to M.T.N.L Bldg., Sector - 11, C.B.D., Belapur, Navi Mumbai - 400614, Mumbai, Maharashtra, India. ', '', '', 'maharashatra', 'india', '', '2015-02-20 14:19:57', '0000-00-00 00:00:00'),
(48, 'SHREE AAI PRATISHTHAN ', 'AMIT', 'JADHAV', 'aaiprinters11@gmail.com', '9819164482', '', 'http://shreeaaipratishthan.org/', '', '', '', 'Shop No- 4, Yashwant Tower, Sector-1,\nPlot No-1, Palm Beach, Sanpada,\nNavi Mumbai-400 705, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 14:25:51', '0000-00-00 00:00:00'),
(49, 'SHREE AAI PRINTERS', 'AMIT', 'JADHAV', 'aaiprinters11@gmail.com', '9819164482', '', '', '', '', '', 'Shop No- 4, Yashwant Tower, Sector-1,\nPlot No-1, Palm Beach, Sanpada,\nNavi Mumbai-400 705, Mumbai, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 14:27:33', '0000-00-00 00:00:00'),
(50, 'KGN ENTERPRISES', 'ZUBER', 'SHAIKH', 'info@kgnindia.com', '7666609000', '', 'http://kgnindia.com/', '', '', '', 'New Ashirwad Industrial Premises,\nCo - Op. Society Ltd.,\nBuilding No. 5,\nRam Mandir Road,\nGoregaon (West),\nMumbai - 400104, Maharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-20 14:35:35', '0000-00-00 00:00:00'),
(51, 'KRSNA SPA', 'RUDHIR', 'ARORA', 'contact@krsnaspa.com', '', '', 'http://krsnaspa.com/', '', '', '', 'Shop No.1, Himsagar C.H.S. Plot 67 & 68, \nSector 19, Agarwal Corner, Nerul, \nNavi Mumbai -400706, Mumbai, Maharashtra, India \n', '', '', 'maharashatra', 'india', '', '2015-02-20 14:40:28', '0000-00-00 00:00:00'),
(52, 'EDIGI WORLD', 'RAJKUMAR', '', '', '', '', 'http://edigiworldmumbai.com/', '', '', '', 'G 32 A/33a,Centurion Mall,Plot No 88/91,Sector 19 A, Opp HP Petrol Pump, Nerul, Navi Mumbai - 400706, Mumbai, Maharashtra, India', '', '', 'maharashatra', 'india', '', '2015-02-20 14:44:40', '0000-00-00 00:00:00'),
(53, 'SOBEST', 'SACHIN', 'SHEWALE', 'sobestwebest@gmail.com', '9223331111', '', '', '', '', '', 'SANPADA APMC Market', '', '', 'maharashatra', 'india', '', '2015-02-21 07:53:05', '0000-00-00 00:00:00'),
(54, 'ULTRA TECHNOLOGY', 'KULDEEP', '', '', '', '', '', '', '', '', 'DLEHI', '', '', 'maharashatra', 'india', '', '2015-02-23 16:56:34', '0000-00-00 00:00:00'),
(55, 'ATTIS GROUP', 'AMIT', 'C', '', '', '', '', '', '', '', 'MUMBAI', '', '', 'maharashatra', 'india', '', '2015-02-23 16:58:38', '0000-00-00 00:00:00'),
(56, 'SWORDS  LOGISTICS', 'PUNEKAR', '', '', '9321511089', '', '', '', '', '', 'A /147, Balaji Bhavan, \nPLot No.42A, Sec No. 11, \nCBD Belapur,\nNavi Mumbai - 400 614.', '', '', 'maharashatra', 'india', '', '2015-02-23 17:00:54', '0000-00-00 00:00:00'),
(57, 'STAR INDIA GROUP', 'CHANDRAMA', 'RAJBHAR', '', '', '', '', '', '', '', 'Star India Offshore Engineering Pvt. Ltd.\nH212, 2nd Floor, Station Complex, \nCBD Belapur, Navi Mumbai, Maharashtra,\nIndia. Pin-400614', '', '', 'maharashatra', 'india', '', '2015-02-23 17:24:12', '0000-00-00 00:00:00'),
(58, 'SHIRKE LOGISTICS', 'SACHIN', '', '', '', '', '', '', '', '', 'B -208, \n2nd Floor, Kukreja Centre, \nPlot no.13, Sector 11, \nCBD Belapur,\nNavi Mumbai-400614.', '', '', 'maharashatra', 'india', '', '2015-02-23 17:25:25', '2015-02-27 06:18:07'),
(59, 'TORQUE FITNESS', 'SUSHANT', '', '', '', '', '', '', '', '', '2nd floor, \nShiva complex, \nSector - 19, New Panvel, \n410206', '', '', 'maharashatra', 'india', '', '2015-02-23 17:26:44', '0000-00-00 00:00:00'),
(60, 'R F AGRAWAL', 'AGRAWAL', '', '', '', '', '', '', '', '', 'BHANDUP,\nMUMBAI', '', '', 'maharashatra', 'india', '', '2015-02-23 17:33:10', '0000-00-00 00:00:00'),
(61, 'N. K. ENTERPRISE', 'NILESH', '', '', '', '', '', '', '', '', 'MUMBAI', '', '', 'maharashatra', 'india', '', '2015-02-23 17:34:25', '0000-00-00 00:00:00'),
(62, 'ARYA PROPERTIES', 'GAGAN', 'ARYA', '', '9619129264', '', '', '', '', '', '12, Kukreja Estate, \nSector-11, C.B.D., Belapur.\nNavi Mumbai - 400614.', '', '', 'maharashatra', 'india', '', '2015-02-23 17:36:07', '0000-00-00 00:00:00'),
(63, 'VIKON', 'VIKRAM', 'SANGHVI', '', '', '', '', '', '', '', '95, Vindhya Commercial Complex,\nSector 11, CBD Belapur,\nNavi Mumbai, 400614', '', '', 'maharashatra', 'india', '', '2015-02-23 17:38:01', '0000-00-00 00:00:00'),
(64, 'GANSONS RADIATORS PVT LTD', 'GANI', '', '', '9820322705', '', '', '', '', '', 'D - 147, TTC Ind. Area,\nMIDC, Shirvane, Nerul, \nNavi Mumbai – 400 706', '', '', 'maharashatra', 'india', '', '2015-02-23 17:39:09', '0000-00-00 00:00:00'),
(65, 'PRAJAPATI INFOMEDIA', 'PRAJAPATI', '', '', '', '', '', '', '', '', 'MUMBAI', '', '', 'maharashatra', 'india', '', '2015-02-23 17:40:50', '0000-00-00 00:00:00'),
(66, 'SUN ALLIANCE ', 'ATMARAM', '', 'info@sunalliance.in', '', '', '', '', '', '', 'International info Tech Park, E-215,\n2nd Floor, Tower No.3,\nVashi Navi Mumbai - 400 705.', '', '', 'maharashatra', 'india', '', '2015-02-26 07:42:50', '0000-00-00 00:00:00'),
(67, 'RX INTUTION', 'RUPESH', 'PANDIT', '', '', '', '', '', '', '', 'Vashi, Navi mumbai', '', '', 'maharashatra', 'india', '', '2015-02-26 07:46:21', '2015-02-26 07:53:29'),
(68, 'GOODWILL PROPERTIES', 'NAMAN', 'MALHOTRA', '', '8655556771', '', '', '', '', '', 'Office No.A/345,\nBalaji Bhavan,Nr.C.B.D Rly.Stn.,\nSctor-11,C.B.D.Belapur,\nNavi Mumbai-400614', '', '', 'maharashatra', 'india', '', '2015-02-26 08:36:26', '0000-00-00 00:00:00'),
(69, 'INSTANCE PHOTO SOLUTION SDN. BHD.', 'BOSCO', '', '', '', '', '', '', '', '', 'Mumbai', '', '', 'maharashatra', 'india', '', '2015-02-26 08:44:32', '0000-00-00 00:00:00'),
(70, 'KALARAJ ACADAMY', 'MJ', 'PATEL', '', '9833428915', '', '', '', '', '', 'Belapure mumbai.', '', '', 'maharashatra', 'india', '', '2015-02-26 08:48:36', '0000-00-00 00:00:00'),
(71, 'RBS LOGISTICS INDIA PVT LTD.', 'RAJDOOT', 'SHINDE', '', '9930464888', '', '', '', '', '', 'Ground Floor, 34-35,\n Agarwal Trade Center, \nSector 11, CBD- Belapur, \nNavi Mumbai- 400614, Mharashtra, India.', '', '', 'maharashatra', 'india', '', '2015-02-26 08:53:04', '0000-00-00 00:00:00'),
(72, 'EGLE STAR MARINE', 'KAMAL', 'B.', 'ESM.GOA@GMAIL.COM', '8450973055', '', '', '', '', '', 'KARMA HEIGHT BULG, SHOP NO. S5B,\n NEAR GOA, SHIPYARD LTD,\n VADDEM VASCO DA GAMA\n GOA - 403802, MAHARASHTRA', '', '', 'maharashatra', 'india', '', '2015-03-05 07:24:24', '0000-00-00 00:00:00'),
(73, 'MADEA CREATIVE HOUSE', 'PULIN', 'PARIKH', 'info@madea.in', '2265550077', '', '', '', '', '', 'Raj Avenue, Office No.102, Plot G-43 & G-44,\nSector-20, Behind Bhoomi Mall,\nCBD Belapur, Navi Mumbai 400-614, India', '', '', 'maharashatra', 'india', '', '2015-03-05 08:37:06', '0000-00-00 00:00:00'),
(74, 'DEEPTI CATERERS', 'RAKESH', '', '', '9820038072', '', '', '', '', '', 'Ghatkoper', '', '', 'maharashatra', 'india', '', '2015-03-09 05:02:37', '0000-00-00 00:00:00'),
(75, 'MONEY MOVER', 'JAIN', '', '', '9224701725', '', '', '', '', '', 'GHATKOPER', '', '', 'maharashatra', 'india', '', '2015-03-09 05:10:14', '0000-00-00 00:00:00'),
(76, 'TRANS IMPEX SHIPPING INC', 'SANTOSH', '', 'santosh.panda@transimpex.co.in', '9820793681', '', '', '', '', '', 'CBD BELAPUR', '', '', 'maharashatra', 'india', '', '2015-03-11 13:30:50', '0000-00-00 00:00:00'),
(77, 'SHRADHA SHIPPING AGENCY', 'KIRAN', 'NANGARE', '', '8424049294', '', '', '', '', '', '308, Skylark, 3rd floor, Plot no 63, CBD Belapur, Navi Mumbai - 400614.', '', '', 'maharashatra', 'india', '', '2015-03-13 09:41:30', '0000-00-00 00:00:00'),
(78, 'PHONIX LTD.', 'PHONIX', 'VALDIMIR', 'phonix@email.com', '9262626262', '', '', '', '', '', 'CBD, Navi-Mumbai', '', 'CBD', 'MAHARASHTRA', 'India', '0', '2015-07-07 08:31:41', '0000-00-00 00:00:00'),
(79, '', 'WALDO', 'STEVE', 'waldo@email.com', '9272727272', '', '', '', '', '', 'CBD, Navi-Mumbai', '', 'CBD', 'MAHARASHTRA', 'India', '', '2015-07-14 14:36:47', '0000-00-00 00:00:00'),
(80, 'RON PVT LTD', 'ANDREW', 'WILL', 'andrewwill@email.com', '9242424242', '', '', '', '', '', 'CBD, Navi-Mumbai', '', 'CBD', 'MAHARASHTRA', 'India', '', '2015-07-15 09:54:55', '0000-00-00 00:00:00'),
(81, 'RON PVT LTD', 'ANDREW', 'WILL', 'andrewwill@email.com', '9242424242', '', '', '', '', '', 'CBD, Navi-Mumbai', '', 'CBD', 'MAHARASHTRA', 'India', '', '2015-07-15 09:55:35', '0000-00-00 00:00:00'),
(82, 'G-ORDINATEUR', 'PAUL', 'POL', 'paul@email.com', '8989898989', '', '', '', '', '', 'CBD1, Navi-Mumbai', '', 'CBD', 'MAHARASHTRA', 'India', '', '2015-07-15 13:37:01', '2015-07-15 13:51:42');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `companyid`, `product_title`, `price`, `note`, `created_at`) VALUES
(1, 1, 'Web Design', 0, '', '2015-04-28 00:00:00'),
(2, 1, 'Web Design with admin panel', 0, '', '2015-04-28 00:00:00'),
(3, 1, 'SMSAPP', 0, '', '2015-04-28 00:00:00'),
(4, 1, 'Application', 0, '', '2015-04-28 00:00:00'),
(5, 1, 'website with Application', 0, '', '2015-05-01 00:00:00'),
(6, 1, 'e-commerce website', 20000, '', '2015-07-15 07:14:27');

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
  `project_description` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`project_id`, `companyid`, `project_title`, `lead_id`, `custid`, `start_date`, `end_date`, `project_status`, `apporx_end`, `project_description`, `created_by`, `created_at`) VALUES
(1, 1, 'website of PHONIX LTD.', 0, 76, '2015-07-08', '0000-00-00', '8', '2015-07-20', 'Demo Entry', 2, '0000-00-00 00:00:00'),
(2, 1, 'Exam Application', 0, 76, '2015-07-15', '0000-00-00', '8', '2015-07-31', 'demo', 2, '2015-07-15 08:48:15');

-- --------------------------------------------------------

--
-- Table structure for table `project_status`
--

CREATE TABLE IF NOT EXISTS `project_status` (
  `project_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) NOT NULL,
  `project_status` varchar(220) NOT NULL,
  `rank` int(11) NOT NULL,
  `project_completion` int(11) NOT NULL,
  `project_status_color` varchar(220) NOT NULL,
  PRIMARY KEY (`project_status_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `project_status`
--

INSERT INTO `project_status` (`project_status_id`, `companyid`, `project_status`, `rank`, `project_completion`, `project_status_color`) VALUES
(1, 0, 'Inserted', 1, 0, '#39cccc'),
(2, 0, 'In progress', 2, 0, '#00c0ef'),
(3, 0, 'ready to test', 3, 0, '#00a65a'),
(4, 0, 'Buggy', 4, 0, '#f39c12'),
(5, 0, 'tested', 5, 0, '#3c8dbc'),
(6, 0, 'unclear', 6, 0, '#dd4b39'),
(7, 0, 'Complete', 7, 0, '#008d4c'),
(8, 1, 'Inserted', 2, 25, '#39cccc'),
(9, 1, 'In progress', 3, 40, '#00c0ef'),
(10, 1, 'ready to test', 4, 75, '#00a65a'),
(11, 1, 'Buggy', 5, 60, '#f39c12'),
(12, 1, 'tested', 6, 90, '#3c8dbc'),
(13, 1, 'unclear', 1, 10, '#dd4b39'),
(14, 1, 'Complete', 7, 100, '#008d4c');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `project_task`
--

INSERT INTO `project_task` (`project_task_id`, `project_id`, `project_task_title`, `employee_id`, `project_status_id`, `task_status`, `project_task_priority`, `project_task_label`, `project_task_description`, `start_date`, `due_date`, `project_task_progress`, `project_task_estimate`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'demo', 2, 8, 1, 'Normal', 'New Requirement', 'Demo entry', '2015-07-09', '2015-07-10', 0, 8, 2, '2015-07-08 14:57:27', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `project_team`
--

CREATE TABLE IF NOT EXISTS `project_team` (
  `project_id` int(10) NOT NULL,
  `emp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project_team`
--

INSERT INTO `project_team` (`project_id`, `emp_id`) VALUES
(1, 2),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `reminder`
--

CREATE TABLE IF NOT EXISTS `reminder` (
  `reminder_id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) NOT NULL,
  `reminder_title` varchar(220) NOT NULL,
  `reminder_fromdatettime` datetime NOT NULL,
  `reminder_todatettime` datetime NOT NULL,
  `project_id` int(11) NOT NULL,
  `lead_id` int(11) NOT NULL,
  `reminder_detail` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`reminder_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `reminder`
--

INSERT INTO `reminder` (`reminder_id`, `companyid`, `reminder_title`, `reminder_fromdatettime`, `reminder_todatettime`, `project_id`, `lead_id`, `reminder_detail`, `created_by`, `created_at`) VALUES
(1, 1, 'demo', '2015-07-09 10:00:00', '2015-07-09 14:00:00', 1, 0, 'demo', 2, '2015-07-09 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `reminder_to`
--

CREATE TABLE IF NOT EXISTS `reminder_to` (
  `reminder_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reminder_to`
--

INSERT INTO `reminder_to` (`reminder_id`, `emp_id`) VALUES
(1, 2);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`serviceid`, `companyid`, `servicename`, `note`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'WEBSITE DEVELOPMENT', '', '2015-02-18 14:12:10', '0000-00-00 00:00:00', NULL),
(2, 1, 'DOMAIN BOOKING', '', '2015-02-18 14:12:21', '0000-00-00 00:00:00', NULL),
(3, 1, 'EMAIL HOSTING', '', '2015-02-18 14:12:38', '0000-00-00 00:00:00', NULL),
(4, 1, 'SMSAPP RECHARGE', '', '2015-02-18 14:12:53', '0000-00-00 00:00:00', NULL),
(6, 1, 'WEB DESIGN', '', '2015-03-16 08:08:17', '0000-00-00 00:00:00', NULL),
(7, 1, 'WEB DESIGN WITH ADMIN PANEL', '', '2015-07-08 12:29:34', '0000-00-00 00:00:00', NULL);

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
  `note` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`taxid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `companyid`, `people_id`, `password`, `temp`, `email`, `dob`, `note`, `role`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 1, 'e99a18c428cb38d5f260853678922e03', 'abc123', 'admin@email.com', '0000-00-00', '', 'admin', '2015-03-16 00:00:00', '0000-00-00 00:00:00', NULL),
(2, 1, 2, 'e99a18c428cb38d5f260853678922e03', 'abc123', 'john@email.com', '2015-04-10', '', 'user', '2015-04-10 09:45:30', '2015-07-15 13:34:08', NULL),
(3, 2, 79, 'e99a18c428cb38d5f260853678922e03', 'abc123', 'waldo@email.com', '2015-07-24', '', 'user', '2015-07-14 14:36:47', '0000-00-00 00:00:00', NULL),
(5, 1, 81, 'e99a18c428cb38d5f260853678922e03', 'abc123', 'andrewwill@email.com', '2015-07-01', '', 'employee', '2015-07-15 09:55:35', '0000-00-00 00:00:00', NULL),
(6, 1, 82, 'e99a18c428cb38d5f260853678922e03', 'abc123', 'paul@email.com', '2015-07-23', '', 'user', '2015-07-15 13:37:01', '2015-07-15 13:51:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_module`
--

CREATE TABLE IF NOT EXISTS `user_module` (
  `user_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  PRIMARY KEY (`user_module_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=63 ;

--
-- Dumping data for table `user_module`
--

INSERT INTO `user_module` (`user_module_id`, `uid`, `module_id`) VALUES
(51, 2, 1),
(52, 2, 2),
(53, 2, 4),
(54, 3, 1),
(55, 3, 4),
(57, 5, 1),
(58, 5, 4),
(59, 6, 1),
(60, 6, 2),
(61, 6, 3),
(62, 6, 4);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
