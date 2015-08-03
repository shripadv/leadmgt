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
-- Database: `ips`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE IF NOT EXISTS `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `address1` varchar(200) NOT NULL,
  `address2` varchar(200) NOT NULL,
  `city` varchar(200) NOT NULL,
  `landmark` varchar(200) NOT NULL,
  `zip` varchar(50) NOT NULL,
  `zone` varchar(200) NOT NULL,
  `state` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `name`, `address1`, `address2`, `city`, `landmark`, `zip`, `zone`, `state`, `country`) VALUES
(1, '', 'CBD, Navi-Mumbai', '', 'CBD', 'Near ABC', '400000', '', 'Maharashtra', 'India');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(6) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `password` varchar(100) NOT NULL,
  `temp` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `note` text NOT NULL,
  `role` enum('admin','user') NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `enabled` enum('0','1') NOT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `first_name`, `last_name`, `password`, `temp`, `email`, `dob`, `note`, `role`, `created_at`, `updated_at`, `deleted_at`, `enabled`) VALUES
(1, 'admin', '', 'e99a18c428cb38d5f260853678922e03', 'abc123', 'admin@email.com', '1996-02-29', '', 'admin', '2015-05-05 00:00:00', '2015-05-05 09:00:59', NULL, '0'),
(2, 'john', '', 'e99a18c428cb38d5f260853678922e03', 'abc123', 'john@email.com', '2000-02-29', '', 'admin', '2015-05-05 08:58:51', '2015-05-05 10:20:26', NULL, '0');

-- --------------------------------------------------------

--
-- Table structure for table `advertise`
--

CREATE TABLE IF NOT EXISTS `advertise` (
  `adv_id` int(11) NOT NULL AUTO_INCREMENT,
  `adv_title` varchar(220) NOT NULL,
  `adv_path` text NOT NULL,
  `enabled` enum('0','1') NOT NULL COMMENT '0 for disable,1 for enable',
  `rank` int(11) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL,
  `note` text NOT NULL,
  PRIMARY KEY (`adv_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `advertise`
--

INSERT INTO `advertise` (`adv_id`, `adv_title`, `adv_path`, `enabled`, `rank`, `description`, `created_at`, `note`) VALUES
(1, 'Tulip', 'public/img/Slider_add/Tulips.jpg', '1', 1, 'Demo', '2015-07-20 08:05:32', '');

-- --------------------------------------------------------

--
-- Table structure for table `attribute`
--

CREATE TABLE IF NOT EXISTS `attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_title` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `attribute`
--

INSERT INTO `attribute` (`attribute_id`, `attribute_title`, `created_at`) VALUES
(4, 'Color', '2015-07-16 12:05:42'),
(5, 'Size', '2015-07-16 12:06:00'),
(6, 'Height', '2015-07-16 12:06:21');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_item`
--

CREATE TABLE IF NOT EXISTS `attribute_item` (
  `attribute_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) NOT NULL,
  `value` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`attribute_item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `attribute_item`
--

INSERT INTO `attribute_item` (`attribute_item_id`, `attribute_id`, `value`, `created_at`) VALUES
(1, 4, 'red', '0000-00-00 00:00:00'),
(3, 6, '5ft', '2015-07-16 13:56:43'),
(4, 6, '7ft', '2015-07-16 13:56:54');

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE IF NOT EXISTS `banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `image_title` varchar(220) NOT NULL,
  `image_path` text NOT NULL,
  `image_type` varchar(100) NOT NULL,
  `enable` enum('0','1') NOT NULL COMMENT '0 for disable,1 for enable',
  `rank` int(11) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`banner_id`, `image_title`, `image_path`, `image_type`, `enable`, `rank`, `description`, `created_at`) VALUES
(1, 'Slide 1', 'public/img/slider/Slider1.jpg', 'jpg', '1', 1, '', '2015-07-20 08:03:21'),
(2, 'Slide 2', 'public/img/slider/Tulips.jpg', 'jpg', '1', 2, '', '2015-06-01 10:58:29'),
(3, 'Slide 3', 'public/img/slider/Desert.jpg', 'jpg', '1', 3, '', '2015-06-01 10:59:49');

-- --------------------------------------------------------

--
-- Table structure for table `cart_rule`
--

CREATE TABLE IF NOT EXISTS `cart_rule` (
  `cart_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_rule_title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(20) NOT NULL,
  `highlight` enum('0','1') NOT NULL,
  `priority` int(11) NOT NULL,
  `limited_customer` enum('0','1') NOT NULL,
  `selected_customer` varchar(220) NOT NULL,
  `valid_from` datetime NOT NULL,
  `valid_to` datetime NOT NULL,
  `total_available` int(11) NOT NULL,
  `total_available_for_user` int(11) NOT NULL,
  `minimum_amount` int(11) NOT NULL,
  `minimum_amount_currency` enum('1','2') NOT NULL,
  `minimum_amount_tax` enum('0','1') NOT NULL,
  `minimum_amount_shipping` enum('0','1') NOT NULL,
  `product_restriction` enum('0','1') NOT NULL,
  `selected_products` varchar(250) NOT NULL,
  `discount` enum('percent','amount','none') NOT NULL,
  `reduction_percent` int(11) NOT NULL,
  `reduction_amount` int(11) NOT NULL,
  `reduction_currency` enum('1','2') NOT NULL,
  `reduction_tax` enum('0','1') NOT NULL,
  `free_shipping` enum('0','1') NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`cart_rule_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `cart_rule`
--

INSERT INTO `cart_rule` (`cart_rule_id`, `cart_rule_title`, `description`, `code`, `highlight`, `priority`, `limited_customer`, `selected_customer`, `valid_from`, `valid_to`, `total_available`, `total_available_for_user`, `minimum_amount`, `minimum_amount_currency`, `minimum_amount_tax`, `minimum_amount_shipping`, `product_restriction`, `selected_products`, `discount`, `reduction_percent`, `reduction_amount`, `reduction_currency`, `reduction_tax`, `free_shipping`, `created_at`) VALUES
(1, 'offer 3', 'edrfewf', '433fffe', '1', 1, '1', '1', '2015-07-15 00:00:00', '2015-07-29 00:00:00', 460, 2, 50, '1', '0', '0', '1', '1,2', '', 0, 0, '1', '0', '0', '2015-07-20 10:51:36');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_title` varchar(220) NOT NULL,
  `parent_category_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `enabled` enum('0','1') NOT NULL,
  `disply_img` int(11) NOT NULL,
  `note` text NOT NULL,
  `meta_title` varchar(200) NOT NULL,
  `meta_description` varchar(200) NOT NULL,
  `meta_keyword` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_title`, `parent_category_id`, `description`, `enabled`, `disply_img`, `note`, `meta_title`, `meta_description`, `meta_keyword`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'Valentine''s Day', 0, '', '1', 0, '', '', '', '', '2015-06-19 13:23:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Lab2', 0, '', '1', 0, '', '', '', '', '2015-06-19 13:23:30', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Filters', 0, '', '1', 0, '', '', '', '', '2015-06-19 13:23:39', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'Posters', 0, '', '1', 0, '', '', '', '', '2015-06-19 13:23:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'Galleries', 0, '', '1', 0, '', '', '', '', '2015-06-19 13:24:09', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'asdf', 0, 'dfnfn', '1', 35, 'dfhgfdh', 'dfhggd', 'dfhgfghfd', 'dhggfh', '2015-07-16 16:07:01', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'sdsd', 2, 'sdasdada', '1', 36, 'sdasdasd', 'sdasdasd', 'sdadad', 'sdadad', '2015-07-16 16:15:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'newCat2', 3, 'dsfdg fgfdgdfg fgfdg dsfsdfdsf 2', '1', 38, 'fgdfgg 2', 'dfgdgfdg 2', 'dfsfsd 2', 'dfsdf 2', '2015-07-17 07:16:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

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
  `default_currency` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`companyid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`companyid`, `companyname`, `shortname`, `tag_line`, `owner`, `cemail`, `cmobile`, `ctel`, `pan`, `sertexno`, `caddress`, `clogo`, `establishdate`, `invoice_template`, `terms_condition`, `default_currency`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'INSTANT PHOTO SOLUTION', 'IPS', '', 'BOSCO', 'info@ips.com', 9870456231, 0, '', '', 'Office No. 227/ B,\r\nSecond Floor, Sai Chamber,\r\nPlot No. 44, Sector-11,\r\nCBD Belapur, Navi Mumbai.\r\nPin- 400614.', '', '0000-00-00', 0, '', 'RM', '2015-05-27 06:58:01', '2015-07-20 11:38:34', NULL);

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
-- Table structure for table `coupons`
--

CREATE TABLE IF NOT EXISTS `coupons` (
  `coupons_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `code` varchar(50) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `mini_amount` int(11) NOT NULL,
  `total_available` int(11) NOT NULL,
  `total_available_user` int(11) NOT NULL,
  `apply_on` enum('all','Product bases') NOT NULL,
  `free_shipping` enum('yes','no') NOT NULL,
  `discount_type` enum('percentage','amount','none') NOT NULL,
  `discount_rate` int(11) NOT NULL,
  PRIMARY KEY (`coupons_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `coupons_product`
--

CREATE TABLE IF NOT EXISTS `coupons_product` (
  `coupons_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupons_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupons_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `email_subscribe` enum('yes','no') NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `company` varchar(200) NOT NULL,
  `default_billing_address` int(11) NOT NULL,
  `default_shipping_address` int(11) NOT NULL,
  `ship_to_bill_address` enum('yes','no') NOT NULL,
  `password` varchar(200) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `confirmed` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE IF NOT EXISTS `file` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `file_title` varchar(220) NOT NULL,
  `file_path` varchar(220) NOT NULL,
  `file_type` varchar(220) NOT NULL,
  `file_size` varchar(220) NOT NULL,
  `upload_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `file`
--

INSERT INTO `file` (`file_id`, `users_id`, `file_title`, `file_path`, `file_type`, `file_size`, `upload_by`, `created_at`, `updated_at`) VALUES
(1, 2, 'Penguins.jpg', 'upload/john/Penguins.jpg', 'jpg', '777835', 2, '2015-06-04 09:52:39', '0000-00-00 00:00:00'),
(2, 2, 'Penguins.jpg', 'upload/john/Penguins.jpg', 'jpg', '777835', 2, '2015-06-04 11:50:37', '0000-00-00 00:00:00'),
(3, 2, 'Penguins.jpg', 'upload/john/Penguins.jpg', 'jpg', '777835', 2, '2015-06-05 07:00:26', '0000-00-00 00:00:00'),
(4, 2, 'Penguins.jpg', 'upload/john/Penguins.jpg', 'jpg', '777835', 2, '2015-06-05 14:11:40', '0000-00-00 00:00:00'),
(5, 2, 'Tulips.jpg', 'upload/john/Tulips.png', 'png', '620888', 2, '2015-06-05 14:14:27', '0000-00-00 00:00:00'),
(6, 2, 'Tulips.png', 'upload/john/1434710543432c20db.png', 'png', '1378465', 2, '2015-06-19 12:42:23', '0000-00-00 00:00:00'),
(7, 2, 'Frame__23_.png', 'upload/john/14347105858b9cf6d6.png', 'png', '1654126', 2, '2015-06-19 12:43:05', '0000-00-00 00:00:00'),
(8, 2, 'Frame__23_.png', 'upload/john/1434710898f432a3a6.png', 'png', '1654126', 2, '2015-06-19 12:48:18', '0000-00-00 00:00:00'),
(9, 2, 'Frame__23_.png', 'upload/john/14347109861819e63d.png', 'png', '1654126', 2, '2015-06-19 12:49:46', '0000-00-00 00:00:00'),
(10, 2, 'Frame__23_.png', 'upload/john/1434711736a64506af.png', 'png', '1654126', 2, '2015-06-19 13:02:16', '0000-00-00 00:00:00'),
(11, 1, 'Frame__23_.png', 'upload/admin/14347144151f358981.png', 'png', '1654126', 1, '2015-06-19 13:46:55', '0000-00-00 00:00:00'),
(12, 1, 'frame_22.png', 'upload/admin/143472158532d90508.png', 'png', '1143545', 1, '2015-06-19 15:53:57', '0000-00-00 00:00:00'),
(13, 1, 'Frame__23_.png', 'upload/admin/143756818097e7b7810715.png', 'png', '1654126', 1, '2015-07-22 14:29:40', '0000-00-00 00:00:00'),
(14, 1, 'Frame__23_.png', 'upload/admin/1437568371f757bc670715.png', 'png', '1654126', 1, '2015-07-22 14:32:51', '0000-00-00 00:00:00'),
(15, 1, '143756837622357653.png', 'upload/admin/143756837622357653.png', 'png', '1918569', 1, '2015-07-22 15:06:45', '0000-00-00 00:00:00'),
(16, 0, 'Koala.png', 'upload/user/14375711180f0e48e0.png', 'png', '1719413', 0, '2015-07-22 15:18:38', '0000-00-00 00:00:00'),
(17, 0, '14375711184519b4c0.png', 'upload/user/14375711184519b4c0.png', 'png', '1985057', 0, '2015-07-22 15:18:39', '0000-00-00 00:00:00'),
(18, 0, 'Koala.png', 'upload/user/14375712575879d113.png', 'png', '1719413', 0, '2015-07-22 15:20:57', '0000-00-00 00:00:00'),
(19, 0, '143757125780fc72ce.png', 'upload/user/143757125780fc72ce.png', 'png', '1985057', 0, '2015-07-22 15:20:58', '0000-00-00 00:00:00'),
(20, 1, 'Desert.jpg', 'upload/admin/1437631451763d6c8923072015.jpg', 'jpg', '845941', 1, '2015-07-23 08:04:11', '0000-00-00 00:00:00'),
(21, 1, 'Jellyfish.jpg', 'upload/admin/14376314510b0d63d323072015.jpg', 'jpg', '775702', 1, '2015-07-23 08:04:11', '0000-00-00 00:00:00'),
(22, 1, 'Hydrangeas.jpg', 'upload/admin/1437631451c12a6e7c23072015.jpg', 'jpg', '595284', 1, '2015-07-23 08:04:11', '0000-00-00 00:00:00'),
(23, 1, 'Lighthouse.jpg', 'upload/admin/14376314519953d43823072015.jpg', 'jpg', '561276', 1, '2015-07-23 08:04:11', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `font`
--

CREATE TABLE IF NOT EXISTS `font` (
  `font_id` int(11) NOT NULL AUTO_INCREMENT,
  `font_title` varchar(220) NOT NULL,
  `font_path` text NOT NULL,
  PRIMARY KEY (`font_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `font`
--

INSERT INTO `font` (`font_id`, `font_title`, `font_path`) VALUES
(1, 'Arial', ''),
(2, 'Arial Bold', ''),
(3, 'Arial Black', ''),
(4, 'Andale Mono', ''),
(5, 'Comic Sans MS', ''),
(6, 'Courier New', ''),
(7, 'Georgia', ''),
(8, 'Impact', ''),
(9, 'Lucida Console', ''),
(10, 'Marlett', ''),
(11, 'Times New Roman', ''),
(12, 'Times New Roman Bold', ''),
(13, 'Times New Roman Italic', ''),
(14, 'Tahoma', ''),
(15, 'Trebuchet MS', ''),
(16, 'Verdana', ''),
(17, 'Sans-serif', ''),
(18, 'Times', ''),
(19, 'Symbol', ''),
(20, 'Webdings', '');

-- --------------------------------------------------------

--
-- Table structure for table `login_history`
--

CREATE TABLE IF NOT EXISTS `login_history` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `name` varchar(220) NOT NULL,
  `email` varchar(220) NOT NULL,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `login_history`
--

INSERT INTO `login_history` (`login_id`, `users_id`, `name`, `email`, `datetime`) VALUES
(1, 1, 'PAUL POL', 'paul@email.com', '2015-06-20 09:00:00'),
(2, 1, 'PAUL POL', 'paul@email.com', '2015-06-20 09:00:00'),
(3, 1, 'PAUL POL', 'paul@email.com', '2015-06-20 09:00:00'),
(4, 1, 'PAUL POL', 'paul@email.com', '2015-06-22 06:00:00'),
(5, 1, 'PAUL POL', 'paul@email.com', '2015-06-22 08:00:00'),
(6, 1, 'PAUL POL', 'paul@email.com', '2015-06-22 11:00:00'),
(7, 1, 'admin', 'admin@email.com', '2015-06-22 11:00:00'),
(8, 1, 'PAUL POL', 'paul@email.com', '2015-06-22 13:00:00'),
(9, 1, 'admin', 'admin@email.com', '2015-06-22 16:00:00'),
(10, 1, 'PAUL POL', 'paul@email.com', '2015-06-22 16:00:00'),
(11, 1, 'PAUL POL', 'paul@email.com', '2015-06-22 17:00:00'),
(12, 1, 'admin', 'admin@email.com', '2015-06-22 17:00:00'),
(13, 1, 'PAUL POL', 'paul@email.com', '2015-06-23 07:00:00'),
(14, 1, 'admin', 'admin@email.com', '2015-06-23 07:00:00'),
(15, 1, 'PAUL POL', 'paul@email.com', '2015-06-23 08:00:00'),
(16, 1, 'PAUL POL', 'paul@email.com', '2015-07-13 13:00:00'),
(17, 1, 'PAUL POL', 'paul@email.com', '2015-07-15 12:00:00'),
(18, 1, 'admin', 'admin@email.com', '2015-07-15 12:00:00'),
(19, 2, 'Pawan Korade', 'pawan.korade@gmail.com', '2015-07-16 07:00:00'),
(20, 1, 'admin', 'admin@email.com', '2015-07-16 07:00:00'),
(21, 1, 'admin', 'admin@email.com', '2015-07-16 16:00:00'),
(22, 1, 'admin', 'admin@email.com', '2015-07-17 06:00:00'),
(23, 1, 'PAUL POL', 'paul@email.com', '2015-07-17 14:00:00'),
(24, 1, 'admin', 'admin@email.com', '2015-07-17 14:00:00'),
(25, 1, 'admin', 'admin@email.com', '2015-07-20 06:00:00'),
(26, 1, 'PAUL POL', 'paul@email.com', '2015-07-20 12:00:00'),
(27, 1, 'admin', 'admin@email.com', '2015-07-21 06:00:00'),
(28, 1, 'admin', 'admin@email.com', '2015-07-22 07:00:00'),
(29, 1, 'admin', 'admin@email.com', '2015-07-22 09:00:00'),
(30, 1, 'admin', 'admin@email.com', '2015-07-23 06:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_title` varchar(220) NOT NULL,
  `order_id` int(11) NOT NULL,
  `depth_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menu_id`, `menu_title`, `order_id`, `depth_id`, `parent_id`, `description`) VALUES
(1, 'Print Quality', 1, 0, 0, ''),
(2, 'ADDRESS LABELS1', 1, 1, 1, ''),
(3, 'Personalised Gifts1', 2, 1, 1, ''),
(4, 'Print Effects1', 4, 0, 0, ''),
(5, 'Print Effects2', 1, 1, 4, ''),
(6, 'Personalised Gifts2', 1, 2, 5, ''),
(7, 'ADDRESS LABELS2', 1, 3, 6, ''),
(8, 'Print Quality2', 1, 4, 7, '');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_number` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `ordered_on` datetime NOT NULL,
  `shipped_on` datetime NOT NULL,
  `tax` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `coupon_discount` int(11) NOT NULL,
  `shipping` varchar(200) NOT NULL,
  `shipping_notes` varchar(200) NOT NULL,
  `shipping_method` varchar(200) NOT NULL,
  `notes` text NOT NULL,
  `payment_info` varchar(200) NOT NULL COMMENT 'specific note for payment',
  `referral` varchar(200) NOT NULL,
  `billing_address_id` int(11) NOT NULL,
  `ship_company` varchar(200) NOT NULL,
  `shipping_address_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`order_id`, `order_number`, `customer_id`, `status`, `ordered_on`, `shipped_on`, `tax`, `total`, `subtotal`, `coupon_discount`, `shipping`, `shipping_notes`, `shipping_method`, `notes`, `payment_info`, `referral`, `billing_address_id`, `ship_company`, `shipping_address_id`) VALUES
(1, 11101, 1, 'Shipped', '2015-07-20 00:00:00', '2015-07-20 00:00:00', 14, 100, 114, 0, '', '', '', '', '', '', 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `orderitem`
--

CREATE TABLE IF NOT EXISTS `orderitem` (
  `order_item_id` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orderitem_background`
--

CREATE TABLE IF NOT EXISTS `orderitem_background` (
  `Order_item_background_id` int(11) NOT NULL AUTO_INCREMENT,
  `Order_item` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  PRIMARY KEY (`Order_item_background_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `orderitem_backgrounditem`
--

CREATE TABLE IF NOT EXISTS `orderitem_backgrounditem` (
  `OrderItem_backgroundItem_id` int(11) NOT NULL AUTO_INCREMENT,
  `OrderItem_background_id` int(11) NOT NULL,
  `item_type` varchar(200) NOT NULL,
  `item_title` varchar(200) NOT NULL,
  `item_data` varchar(200) NOT NULL,
  PRIMARY KEY (`OrderItem_backgroundItem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `order_discount`
--

CREATE TABLE IF NOT EXISTS `order_discount` (
  `order_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `discount_type` int(11) NOT NULL,
  `discount_rate` int(11) NOT NULL,
  `discount_amount` int(11) NOT NULL,
  PRIMARY KEY (`order_discount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `reference_code` varchar(100) NOT NULL,
  `enabled` enum('0','1') NOT NULL,
  `availability` enum('In stock','Out of stock') NOT NULL,
  `order_qty_type` enum('Any','Limited') NOT NULL,
  `order_qty_list` varchar(200) NOT NULL,
  `note` varchar(200) NOT NULL,
  `short_description` varchar(250) NOT NULL,
  `long_description` text NOT NULL,
  `preview_Background` enum('yes','no') NOT NULL,
  `price` double NOT NULL,
  `tax_id` int(11) NOT NULL,
  `seo_meta_title` varchar(200) NOT NULL,
  `seo_meta_desc` varchar(200) NOT NULL,
  `free_shipping` enum('0','1') NOT NULL,
  `weight` int(11) NOT NULL,
  `package_width` int(11) NOT NULL,
  `package_height` int(11) NOT NULL,
  `package_depth` int(11) NOT NULL,
  `disply_img` int(11) NOT NULL,
  `bundle_product` enum('yes','no') NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `title`, `reference_code`, `enabled`, `availability`, `order_qty_type`, `order_qty_list`, `note`, `short_description`, `long_description`, `preview_Background`, `price`, `tax_id`, `seo_meta_title`, `seo_meta_desc`, `free_shipping`, `weight`, `package_width`, `package_height`, `package_depth`, `disply_img`, `bundle_product`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'image1', 'demo_1', '1', 'In stock', 'Any', '', 'Demo', 'Demo', 'Demo', 'no', 590, 1, '', '', '1', 0, 0, 0, 0, 12, 'no', '2015-07-17 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'image2', 'demo_2', '1', 'In stock', 'Any', '', '', '', '', 'no', 650, 1, '', '', '1', 0, 0, 0, 0, 14, 'no', '2015-07-22 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'poster1', 'aaa', '1', 'In stock', 'Any', '', '', '', '', 'yes', 1250, 1, '', '', '1', 0, 0, 0, 0, 0, 'no', '2015-07-23 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `product_background`
--

CREATE TABLE IF NOT EXISTS `product_background` (
  `product_background_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  PRIMARY KEY (`product_background_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `product_background`
--

INSERT INTO `product_background` (`product_background_id`, `product_id`, `file_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 14, '2015-07-22 18:38:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `product_backgrounditem`
--

CREATE TABLE IF NOT EXISTS `product_backgrounditem` (
  `product_backgroundItem_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_background_id` int(11) NOT NULL,
  `product_item_type` varchar(200) NOT NULL,
  `product_item_title` varchar(200) NOT NULL,
  `product_item_data` varchar(200) NOT NULL,
  PRIMARY KEY (`product_backgroundItem_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `product_backgrounditem`
--

INSERT INTO `product_backgrounditem` (`product_backgroundItem_id`, `product_background_id`, `product_item_type`, `product_item_title`, `product_item_data`) VALUES
(1, 1, 'image', 'Image 1', '{"x":158,"y":150,"width":577,"height":411,"rotate":0,"type":"image","layer_name":"Image 1","id":1,"active_back":""}');

-- --------------------------------------------------------

--
-- Table structure for table `product_bundleitem`
--

CREATE TABLE IF NOT EXISTS `product_bundleitem` (
  `bundle_Item_Id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_product_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  PRIMARY KEY (`bundle_Item_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE IF NOT EXISTS `product_category` (
  `product_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  PRIMARY KEY (`product_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=54 ;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`product_category_id`, `category_id`, `product_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(50, 6, 1, '2015-07-17 13:07:10', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 7, 1, '2015-07-17 13:07:10', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 6, 2, '2015-07-22 14:13:47', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 6, 3, '2015-07-23 08:04:11', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `product_image`
--

CREATE TABLE IF NOT EXISTS `product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `default` enum('0','1') NOT NULL,
  PRIMARY KEY (`product_image_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `product_image`
--

INSERT INTO `product_image` (`product_image_id`, `product_id`, `file_id`, `default`) VALUES
(1, 3, 20, '0'),
(2, 3, 21, '1'),
(3, 3, 22, '0'),
(4, 3, 23, '0');

-- --------------------------------------------------------

--
-- Table structure for table `product_item`
--

CREATE TABLE IF NOT EXISTS `product_item` (
  `product_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `product_item_type` varchar(20) NOT NULL,
  `product_item_title` varchar(220) NOT NULL,
  `product_item_data` text NOT NULL,
  PRIMARY KEY (`product_item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=52 ;

--
-- Dumping data for table `product_item`
--

INSERT INTO `product_item` (`product_item_id`, `product_id`, `product_item_type`, `product_item_title`, `product_item_data`) VALUES
(50, 1, 'image', 'Image 1', '{"x":390,"y":90,"width":420,"height":578,"rotate":0,"type":"image","layer_name":"Image 1","id":51}'),
(51, 1, 'image', 'Image 1', '{"x":390,"y":90,"width":420,"height":578,"rotate":0,"type":"image","layer_name":"Image 1","id":51}');

-- --------------------------------------------------------

--
-- Table structure for table `product_price`
--

CREATE TABLE IF NOT EXISTS `product_price` (
  `product_price_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `operation` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`product_price_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `product_price`
--

INSERT INTO `product_price` (`product_price_id`, `product_id`, `operation`, `amount`, `price`) VALUES
(1, 1, 'increment', 15, 575);

-- --------------------------------------------------------

--
-- Table structure for table `product_price_attribute`
--

CREATE TABLE IF NOT EXISTS `product_price_attribute` (
  `price_attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_price_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `attribute_item_id` int(11) NOT NULL,
  PRIMARY KEY (`price_attribute_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `product_price_attribute`
--

INSERT INTO `product_price_attribute` (`price_attribute_id`, `product_price_id`, `attribute_id`, `attribute_item_id`) VALUES
(1, 1, 4, 1),
(2, 1, 6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `sample_product`
--

CREATE TABLE IF NOT EXISTS `sample_product` (
  `sample_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  PRIMARY KEY (`sample_product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sample_product`
--

INSERT INTO `sample_product` (`sample_product_id`, `product_id`, `file_id`) VALUES
(1, 1, 12),
(2, 2, 15);

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE IF NOT EXISTS `state` (
  `StateID` int(11) NOT NULL AUTO_INCREMENT,
  `countryid` int(11) NOT NULL,
  `StateName` varchar(50) NOT NULL,
  PRIMARY KEY (`StateID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`StateID`, `countryid`, `StateName`) VALUES
(1, 99, 'ANDHRA PRADESH'),
(2, 99, 'ASSAM'),
(3, 99, 'ARUNACHAL PRADESH'),
(4, 99, 'GUJRAT'),
(5, 99, 'BIHAR'),
(6, 99, 'HARYANA'),
(7, 99, 'HIMACHAL PRADESH'),
(8, 99, 'JAMMU & KASHMIR'),
(9, 99, 'KARNATAKA'),
(10, 99, 'KERALA'),
(11, 99, 'MADHYA PRADESH'),
(12, 99, 'MAHARASHTRA'),
(13, 99, 'MANIPUR'),
(14, 99, 'MEGHALAYA'),
(15, 99, 'MIZORAM'),
(16, 99, 'NAGALAND'),
(17, 99, 'ORISSA'),
(18, 99, 'PUNJAB'),
(19, 99, 'RAJASTHAN'),
(20, 99, 'SIKKIM'),
(21, 99, 'TAMIL NADU'),
(22, 99, 'TRIPURA'),
(23, 99, 'UTTAR PRADESH'),
(24, 99, 'WEST BENGAL'),
(25, 99, 'DELHI'),
(26, 99, 'GOA'),
(27, 99, 'PONDICHERY'),
(28, 99, 'LAKSHDWEEP'),
(29, 99, 'DAMAN & DIU'),
(30, 99, 'DADRA & NAGAR'),
(31, 99, 'CHANDIGARH'),
(32, 99, 'ANDAMAN & NICOBAR'),
(33, 99, 'UTTARANCHAL'),
(34, 99, 'JHARKHAND'),
(35, 99, 'CHATTISGARH');

-- --------------------------------------------------------

--
-- Table structure for table `tax`
--

CREATE TABLE IF NOT EXISTS `tax` (
  `tax_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_title` varchar(220) NOT NULL,
  `tax_rate` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`tax_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tax`
--

INSERT INTO `tax` (`tax_id`, `tax_title`, `tax_rate`, `created_at`, `updated_at`) VALUES
(1, 'SERVICE TAX', 14, '2015-07-17 00:00:00', '2015-07-20 08:50:06');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `users_id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(220) NOT NULL,
  `password` varchar(100) NOT NULL,
  `temp` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` bigint(11) NOT NULL,
  `note` text NOT NULL,
  `role` enum('admin','user') NOT NULL,
  `address_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`users_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`users_id`, `name`, `password`, `temp`, `email`, `mobile`, `note`, `role`, `address_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'PAUL POL', 'e99a18c428cb38d5f260853678922e03', 'abc123', 'paul@email.com', 8989898989, '', 'user', 0, '2015-06-20 09:00:20', NULL, NULL),
(2, 'Pawan Korade', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'pawan.korade@gmail.com', 7276811757, '', 'user', 0, '2015-07-16 07:19:19', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_image`
--

CREATE TABLE IF NOT EXISTS `user_image` (
  `user_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `user_product_id` int(11) NOT NULL,
  PRIMARY KEY (`user_image_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `user_image`
--

INSERT INTO `user_image` (`user_image_id`, `users_id`, `file_id`, `user_product_id`) VALUES
(1, 1, 17, 1),
(3, 1, 19, 3),
(4, 1, 21, 4),
(5, 1, 23, 5),
(6, 1, 25, 6),
(7, 1, 30, 7),
(8, 0, 32, 8),
(9, 0, 34, 9),
(10, 0, 17, 10),
(11, 0, 19, 11);

-- --------------------------------------------------------

--
-- Table structure for table `user_product`
--

CREATE TABLE IF NOT EXISTS `user_product` (
  `user_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_title` varchar(220) NOT NULL,
  `category_id` int(11) NOT NULL,
  `effect_type` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `enable` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 for disable, 1 for enable',
  `file_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `user_product`
--

INSERT INTO `user_product` (`user_product_id`, `product_title`, `category_id`, `effect_type`, `description`, `enable`, `file_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Image Frame', 6, 'frame', 'Demo Poster', '1', 17, 0, '0000-00-00 00:00:00', NULL),
(3, 'Image Frame', 6, 'frame', 'Demo Poster', '1', 19, 0, '0000-00-00 00:00:00', NULL),
(4, 'Image Frame', 6, 'frame', 'Demo Poster', '1', 21, 0, '0000-00-00 00:00:00', NULL),
(5, 'Image Frame', 6, 'frame', 'Demo Poster', '1', 23, 0, '0000-00-00 00:00:00', NULL),
(6, 'Image Frame', 6, 'frame', 'Demo Poster', '1', 25, 0, '0000-00-00 00:00:00', NULL),
(7, 'Image Frame', 6, 'frame', 'Demo Poster', '1', 30, 0, '0000-00-00 00:00:00', NULL),
(8, 'Image Frame', 6, 'frame', 'Demo Poster', '1', 32, 0, '0000-00-00 00:00:00', NULL),
(9, 'Image Frame', 6, 'frame', 'Demo Poster', '1', 34, 0, '2015-07-15 12:05:45', NULL),
(10, 'image2', 6, '', '', '1', 17, 0, '2015-07-22 15:18:39', NULL),
(11, 'image2', 6, '', '', '1', 19, 0, '2015-07-22 15:20:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_product_item`
--

CREATE TABLE IF NOT EXISTS `user_product_item` (
  `user_product_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_product_id` int(11) NOT NULL,
  `product_item_type` varchar(20) NOT NULL,
  `product_item_title` varchar(220) NOT NULL,
  `product_item_data` text NOT NULL,
  PRIMARY KEY (`user_product_item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `user_product_item`
--

INSERT INTO `user_product_item` (`user_product_item_id`, `user_product_id`, `product_item_type`, `product_item_title`, `product_item_data`) VALUES
(1, 1, 'image', 'Image 1', '{"x":390,"y":90,"width":420,"height":578,"rotate":0,"type":"image","layer_name":"Image 1","id":2}'),
(3, 3, 'image', 'Image 1', '{"x":390,"y":90,"width":420,"height":578,"rotate":0,"type":"image","layer_name":"Image 1","id":3}'),
(4, 4, 'image', 'Image 1', '{"x":390,"y":90,"width":420,"height":578,"rotate":0,"type":"image","layer_name":"Image 1","id":4}'),
(5, 5, 'image', 'Image 1', '{"x":390,"y":90,"width":420,"height":578,"rotate":0,"type":"image","layer_name":"Image 1","id":5}'),
(6, 6, 'image', 'Image 1', '{"x":390,"y":90,"width":420,"height":578,"rotate":0,"type":"image","layer_name":"Image 1","id":6}'),
(7, 7, 'image', 'Image 1', '{"x":390,"y":90,"width":420,"height":578,"rotate":0,"type":"image","layer_name":"Image 1","id":7}'),
(8, 8, 'image', 'Image 1', '{"x":390,"y":90,"width":420,"height":578,"rotate":0,"type":"image","layer_name":"Image 1","id":8}'),
(9, 9, 'image', 'Image 1', '{"x":390,"y":90,"width":420,"height":578,"rotate":0,"type":"image","layer_name":"Image 1","id":9}'),
(10, 10, 'image', 'Image 1', '{"x":158,"y":150,"width":577,"height":411,"rotate":0,"type":"image","layer_name":"Image 1","id":10,"active_back":""}'),
(11, 11, 'image', 'Image 1', '{"x":158,"y":150,"width":577,"height":411,"rotate":0,"type":"image","layer_name":"Image 1","id":11,"active_back":""}');

-- --------------------------------------------------------

--
-- Table structure for table `variable`
--

CREATE TABLE IF NOT EXISTS `variable` (
  `variable_id` int(11) NOT NULL AUTO_INCREMENT,
  `variable_title` varchar(220) NOT NULL,
  `variable_value` varchar(220) NOT NULL,
  PRIMARY KEY (`variable_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `variable`
--

INSERT INTO `variable` (`variable_id`, `variable_title`, `variable_value`) VALUES
(1, 'default_image', 'upload/default/Penguins.jpg'),
(2, 'default_image', 'upload/default/Penguins.jpg'),
(3, 'no_img_set', 'public/img/noimage.jpg');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
