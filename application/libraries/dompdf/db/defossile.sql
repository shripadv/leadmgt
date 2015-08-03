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
-- Database: `defossile`
--

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
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`branch_id`, `company_id`, `branch_title`, `branch_code`, `contact_person`, `branch_tel_no`, `branch_address1`, `branch_address2`, `branch_email`, `city`, `branch_pincode`, `state`, `contact_mobile`, `invoice_prefix`, `created_at`) VALUES
(1, 1, 'CBD', 'CBD1', 'John', '', 'Shop No-29,PlotNo-54', 'Sector-15, Navi-mumbai', '', 'CBD', 400614, 'MAHARASHTRA', '2227571112', 'CA', '0000-00-00 00:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `company_name`, `company_address1`, `company_address2`, `city`, `pin_no`, `company_telephone`, `company_email`, `company_website`, `mobile`, `state`, `country`, `company_logo`, `note`) VALUES
(1, 'DEFOSSILE JEANS INDIA PVT LTD.', 'Shop No-29,PlotNo-54', 'Sector-15,', 'CBD, Navi-mumbai', 400614, '2227571112', 'info@defossile.com', 'www.defossile.com', '2227571112', 'MAHARASHTRA', 'India', '', '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `company_id`, `first_name`, `middle_name`, `last_name`, `customer_mobile`, `customer_email`, `customer_gender`, `customer_dob`, `marital_status`, `anniversary_date`, `address1`, `address2`, `city`, `pincode`, `state`, `created_at`, `updated_at`, `note`) VALUES
(1, 1, 'PAUL', 'CONOR', 'POL', '8989898989', 'paul@email.com', 'male', '2000-02-29', 'married', '2015-03-11', 'CBD, Navi-Mumbai', '', 'CBD', '400000', 'MAHARASHTRA', '2015-03-10 16:57:39', '2015-03-30 14:49:12', ''),
(2, 1, 'ALBERT', '', 'D', '9242424242', 'albert@email.com', 'male', NULL, 'unmarried', NULL, 'CBD, Navi-Mumbai', '', 'CBD', '400000', 'MAHARASHTRA', '2015-04-18 17:29:09', NULL, '');

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
(1, 1064, 1064, '2015-04-21 13:20:28'),
(2, 3610, 3610, '2015-05-04 17:42:52');

-- --------------------------------------------------------

--
-- Table structure for table `customer_transactions`
--

CREATE TABLE IF NOT EXISTS `customer_transactions` (
  `transaction_id` int(6) NOT NULL AUTO_INCREMENT,
  `customer_id` int(6) NOT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `customer_transactions`
--

INSERT INTO `customer_transactions` (`transaction_id`, `customer_id`, `sales_id`, `membership_id`, `particular`, `transction_type`, `ref_no`, `payment_type`, `amount`, `note`, `created_at`, `created_by`) VALUES
(1, 1, 1, 0, 'Sales receipt of no. 1', 'sales_receipt', 'sales_id1', 'Cash', 1064, NULL, '2015-04-21 13:20:28', 2),
(2, 2, 2, 0, 'Sales receipt of no. 2', 'sales_receipt', 'sales_id2', 'Cash', 1510, NULL, '2015-04-22 13:05:33', 2),
(3, 2, 3, 0, 'Sales receipt of no. 3', 'sales_receipt', 'sales_id3', 'Cash', 950, NULL, '2015-04-25 15:46:48', 2),
(4, 2, 4, 0, 'Sales receipt of no. 4', 'sales_receipt', 'sales_id4', 'Card', 1150, NULL, '2015-05-04 17:42:52', 2);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=61 ;

--
-- Dumping data for table `login_history`
--

INSERT INTO `login_history` (`login_id`, `users_id`, `username`, `datetime`) VALUES
(40, 2, 'john', '2015-04-18 14:00:00'),
(41, 2, 'john', '2015-04-18 15:00:00'),
(42, 2, 'john', '2015-04-18 16:00:00'),
(43, 2, 'john', '2015-04-20 10:00:00'),
(44, 2, 'john', '2015-04-21 10:00:00'),
(45, 2, 'john', '2015-04-21 15:00:00'),
(46, 2, 'john', '2015-04-21 18:00:00'),
(47, 2, 'john', '2015-04-22 10:00:00'),
(48, 2, 'john', '2015-04-22 12:00:00'),
(49, 2, 'john', '2015-04-22 17:00:00'),
(50, 2, 'john', '2015-04-22 18:00:00'),
(51, 2, 'john', '2015-04-23 15:00:00'),
(52, 2, 'john', '2015-04-25 15:00:00'),
(53, 2, 'john', '2015-04-25 16:00:00'),
(54, 2, 'john', '2015-04-25 16:00:00'),
(55, 2, 'john', '2015-05-04 12:00:00'),
(56, 2, 'john', '2015-05-04 14:00:00'),
(57, 2, 'john', '2015-05-04 14:00:00'),
(58, 2, 'john', '2015-05-04 16:00:00'),
(59, 2, 'john', '2015-05-04 19:00:00'),
(60, 2, 'john', '2015-05-08 10:00:00');

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
(1, 'Cash', 'Cash'),
(2, 'Card', '');

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
  `size` int(11) NOT NULL DEFAULT '0',
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `company_id`, `product_category_id`, `product_subcategory_id`, `product_title`, `product_code`, `product_barcode`, `product_cost`, `product_price`, `size`, `order_level`, `measure_unit`, `volume`, `volume_unit`, `ava_volume`, `service_product`, `sell_product`, `product_note`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'COTTON SHIRT FULL SLEEVE', 'PCS001', '001950', 950, 950, 0, 10, 'PCS', 0, 'PCS', 0, 0, 1, '', '2015-04-21 10:57:27', NULL),
(2, 1, 1, 1, 'COTTON T-SHIRT', '', '002560', 560, 560, 0, 10, 'PCS', 0, 'PCS', 0, 0, 1, '', '2015-04-21 14:00:06', NULL),
(3, 1, 1, 2, 'DENIM BLUE FULL SLEEVE', 'DNS1', '0031150', 1150, 1150, 0, 10, 'PCS', 0, 'PCS', 0, 0, 1, '', '2015-05-04 17:41:19', NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`product_category_id`, `company_id`, `product_category_code`, `product_category_title`, `product_category_note`) VALUES
(1, 1, 'Shr1', 'SHIRT', '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `product_subcategory`
--

INSERT INTO `product_subcategory` (`product_subcategory_id`, `product_category_id`, `product_subcategory_code`, `product_subcategory_title`, `product_subcategory_note`) VALUES
(1, 1, 'Cshr1', 'COTTON', ''),
(2, 1, 'DN', 'DENIM', '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`purchase_id`, `company_id`, `branch_id`, `vender_id`, `amount`, `invoice_number`, `invoice_date`, `created_at`, `created_by`, `updated_at`) VALUES
(1, 1, 1, NULL, 9500, '', '2015-04-21', '2015-04-21 12:10:00', 2, '0000-00-00 00:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `purchase_item`
--

INSERT INTO `purchase_item` (`purchase_item_id`, `purchase_id`, `product_id`, `quantity`, `rate`, `selling_price`, `total_amount`, `old_stock`, `new_stock`) VALUES
(1, 1, 1, 10, 950, 950, 9500, 100, 110);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  `discount_rate` int(6) DEFAULT '0',
  `discount_amount` int(6) DEFAULT '0',
  `final_amount` int(6) NOT NULL,
  `tax` varchar(10) NOT NULL,
  `tax_amount` int(11) DEFAULT NULL,
  `payment_status` varchar(220) DEFAULT NULL,
  `payment_type` enum('Cash','Card') NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL COMMENT 'user id',
  PRIMARY KEY (`sales_id`),
  KEY `sales_FKIndex2` (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sales_id`, `company_id`, `branch_id`, `customer_id`, `appointment_id`, `invoice_number`, `total_amount`, `discount_rate`, `discount_amount`, `final_amount`, `tax`, `tax_amount`, `payment_status`, `payment_type`, `created_at`, `created_by`) VALUES
(1, 1, 1, 1, 0, 'CA001', 950, 0, 0, 1064, '', 114, 'Paid', 'Cash', '2015-04-21 13:20:28', 2),
(2, 1, 1, 2, 0, 'CA002', 1510, 0, 0, 1510, '', 0, 'Paid', 'Cash', '2015-04-22 13:05:33', 2),
(3, 1, 1, 2, 0, 'CA003', 950, 0, 0, 950, '', 0, 'Paid', 'Cash', '2015-04-25 15:46:48', 2),
(4, 1, 1, 2, 0, 'CR001', 1150, 0, 0, 1150, '', 0, 'PAID', 'Card', '2015-05-04 17:42:52', 2);

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
  `price` int(6) DEFAULT NULL,
  `quantity` int(6) DEFAULT NULL,
  `discount_rate` int(2) NOT NULL,
  `discount_amount` double NOT NULL,
  `amount` int(6) DEFAULT NULL,
  PRIMARY KEY (`sales_item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `sales_item`
--

INSERT INTO `sales_item` (`sales_item_id`, `sales_id`, `company_id`, `product_id`, `services_id`, `price`, `quantity`, `discount_rate`, `discount_amount`, `amount`) VALUES
(1, 1, 1, 1, 0, 950, 1, 0, 0, 950),
(2, 2, 1, 1, 0, 950, 1, 0, 0, 950),
(3, 2, 1, 2, 0, 560, 1, 0, 0, 560),
(4, 3, 1, 1, 0, 950, 1, 0, 0, 950),
(5, 4, 1, 3, 0, 1150, 1, 0, 0, 1150);

-- --------------------------------------------------------

--
-- Table structure for table `sales_return`
--

CREATE TABLE IF NOT EXISTS `sales_return` (
  `sales_return_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `total_amount` double NOT NULL,
  `taxamount` int(11) DEFAULT NULL,
  `discount_rate` int(11) NOT NULL DEFAULT '0',
  `discount_amount` int(11) NOT NULL DEFAULT '0',
  `final_amount` double NOT NULL,
  `invoice_number` varchar(220) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`sales_return_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sales_return`
--

INSERT INTO `sales_return` (`sales_return_id`, `company_id`, `branch_id`, `sales_id`, `total_amount`, `taxamount`, `discount_rate`, `discount_amount`, `final_amount`, `invoice_number`, `created_at`, `updated_at`, `created_by`) VALUES
(1, 1, 1, 1, 950, 114, 0, 0, 1064, 'CA001', '2015-04-22 18:02:09', '0000-00-00 00:00:00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `sales_return_item`
--

CREATE TABLE IF NOT EXISTS `sales_return_item` (
  `sales_return_item_id` int(6) NOT NULL AUTO_INCREMENT,
  `sales_return_id` int(6) NOT NULL,
  `sales_id` int(6) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(6) DEFAULT NULL,
  `rate` int(6) DEFAULT NULL,
  `selling_price` double DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `discount_rate` int(11) DEFAULT '0',
  `discount_amount` int(11) DEFAULT '0',
  `old_stock` int(11) DEFAULT '0',
  `new_stock` int(11) DEFAULT '0',
  PRIMARY KEY (`sales_return_item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sales_return_item`
--

INSERT INTO `sales_return_item` (`sales_return_item_id`, `sales_return_id`, `sales_id`, `product_id`, `quantity`, `rate`, `selling_price`, `total_amount`, `discount_rate`, `discount_amount`, `old_stock`, `new_stock`) VALUES
(1, 1, 1, 1, 1, 950, 950, 950, 0, 0, 108, 109);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sales_tax`
--

INSERT INTO `sales_tax` (`sales_tax_id`, `tax_id`, `sales_id`, `tax_rate`, `tax_amount`) VALUES
(1, 1, 1, 12, 114);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`stock_id`, `company_id`, `branch_id`, `product_id`, `stock`, `volumn_stock`) VALUES
(1, 1, 1, 1, 108, 0),
(2, 1, 1, 2, 99, 0),
(3, 1, 1, 3, 99, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tax`
--

INSERT INTO `tax` (`tax_id`, `company_id`, `tax_title`, `rate`, `enable`, `product_based`, `service_based`, `note`) VALUES
(1, 1, 'SERVICE TAX @', 12, 1, 1, 1, '');

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
  `mobile` varchar(220) DEFAULT NULL,
  `password` varchar(220) DEFAULT NULL,
  `temp_pass` varchar(220) DEFAULT NULL,
  `role` varchar(220) DEFAULT NULL,
  `remember_token` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`users_id`, `company_id`, `branch_id`, `name`, `username`, `mobile`, `password`, `temp_pass`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 0, 0, 'RON WILL', 'admin', '8879331463', 'e99a18c428cb38d5f260853678922e03', 'abc123', 'admin', '', '2015-03-09 11:06:29', '2015-03-09 11:22:34'),
(2, 1, 0, 'John Nash', 'john', '8879331463', 'e99a18c428cb38d5f260853678922e03', 'abc123', 'manager', '', '2015-03-09 11:06:29', '2015-03-24 14:32:06');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `variable`
--

INSERT INTO `variable` (`variable_id`, `company_id`, `key`, `value`) VALUES
(1, 1, 'secure_sms', ''),
(2, 1, 'sales_sms', 'Hi |*name*|, Thank you for paying Rs. |*amount*|. Visit Again.\n\nRegards\nAURA THE HOLISTIC SPA'),
(3, 1, 'secure_app_key', 'ayujbbn@**7');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
