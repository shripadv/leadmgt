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
-- Database: `dms`
--

-- --------------------------------------------------------

--
-- Table structure for table `dms_documents`
--

CREATE TABLE IF NOT EXISTS `dms_documents` (
  `document_id` int(9) NOT NULL AUTO_INCREMENT COMMENT 'file id',
  `owner_id` int(11) NOT NULL COMMENT 'user id of file owner',
  `parent_folder_id` int(11) NOT NULL,
  `file_title` varchar(220) NOT NULL COMMENT 'name given at the time of uploading',
  `description` longtext COMMENT 'Description for file',
  `keywords` varchar(220) NOT NULL,
  `shareable` int(1) NOT NULL COMMENT 'can share with anyone with link',
  `default_access` tinyint(4) NOT NULL DEFAULT '0',
  `inherited_access` tinyint(1) NOT NULL DEFAULT '1',
  `locked` tinyint(1) NOT NULL,
  `created_by` mediumint(9) NOT NULL DEFAULT '0' COMMENT 'File creator',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`document_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `dms_documents`
--

INSERT INTO `dms_documents` (`document_id`, `owner_id`, `parent_folder_id`, `file_title`, `description`, `keywords`, `shareable`, `default_access`, `inherited_access`, `locked`, `created_by`, `created_at`) VALUES
(1, 1, 1, 'Koala', '', 'ANIMALS', 0, 0, 1, 0, 1, '2015-04-09 13:00:00'),
(2, 3, 4, 'Light House', '', '', 0, 0, 1, 0, 1, '2015-04-09 12:32:27'),
(4, 3, 3, 'FISH', '', 'animal', 0, 0, 1, 0, 3, '2015-04-10 09:14:20'),
(5, 1, 1, 'dsfds', 'sadas', 'animal', 0, 0, 1, 0, 1, '2015-04-10 09:58:23'),
(6, 1, 6, 'Desert', '', '', 0, 0, 1, 0, 1, '2015-04-13 10:57:39');

-- --------------------------------------------------------

--
-- Table structure for table `dms_document_files`
--

CREATE TABLE IF NOT EXISTS `dms_document_files` (
  `document_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` int(11) NOT NULL,
  `file_name` varchar(220) NOT NULL,
  `real_path` varchar(220) NOT NULL COMMENT 'Relative path of folder of file',
  `id_path` varchar(220) NOT NULL COMMENT 'File path by ids',
  `file_size` double NOT NULL COMMENT 'File size in KB',
  `file_mimetype` varchar(220) NOT NULL,
  `file_extension` varchar(220) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'Version updator',
  `file_version` varchar(220) NOT NULL,
  `file_comment` text NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`document_file_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `dms_document_files`
--

INSERT INTO `dms_document_files` (`document_file_id`, `document_id`, `file_name`, `real_path`, `id_path`, `file_size`, `file_mimetype`, `file_extension`, `user_id`, `file_version`, `file_comment`, `created_at`) VALUES
(1, 1, 'Koala.jpg', 'dms_root/', '1/', 322, '', 'jpg', 1, '1', '', '2015-04-09 13:00:00'),
(2, 2, 'Lighthouse.jpg', 'dms_root/Albert/images/', '1/3/4/', 561276, 'jpg', 'jpg', 1, '1', '', '2015-04-09 12:32:27'),
(4, 4, 'Jellyfish.jpg', 'dms_root/Albert/', '1/3/', 775702, 'jpg', 'jpg', 3, '1', '', '2015-04-10 09:14:20'),
(5, 5, 'Client805030.xlsx', 'dms_root/', '1/', 20259, 'xlsx', 'xlsx', 1, '1', 'sadas', '2015-04-10 09:58:23'),
(6, 6, 'Desert.jpg', 'dms_root/Albert/images/img/', '1/3/4/6/', 845941, 'jpg', 'jpg', 1, '1', '', '2015-04-13 10:57:39');

-- --------------------------------------------------------

--
-- Table structure for table `dms_folders`
--

CREATE TABLE IF NOT EXISTS `dms_folders` (
  `folder_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_folder_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL COMMENT 'owner of folder',
  `folder_name` varchar(220) NOT NULL,
  `description` text NOT NULL,
  `inherited_access` tinyint(1) NOT NULL DEFAULT '1',
  `default_access` tinyint(4) NOT NULL DEFAULT '0',
  `real_path` varchar(220) NOT NULL COMMENT 'real folder path',
  `id_path` varchar(220) NOT NULL COMMENT 'Path to folder by folders ids',
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`folder_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `dms_folders`
--

INSERT INTO `dms_folders` (`folder_id`, `parent_folder_id`, `owner_id`, `folder_name`, `description`, `inherited_access`, `default_access`, `real_path`, `id_path`, `created_by`, `created_at`) VALUES
(1, 1, 1, 'dms_root', '', 1, 4, '', '', 1, '2015-04-08 14:00:00'),
(2, 1, 2, 'RONimg', '', 1, 0, 'RONimg/', '2/', 1, '2015-04-08 13:59:05'),
(3, 1, 3, 'Albert', '', 1, 3, 'Albert/', '3/', 1, '2015-04-08 16:12:07'),
(4, 3, 3, 'images', '', 1, 3, 'Albert/images/', '3/4/', 1, '2015-04-09 07:59:30'),
(5, 3, 3, 'docs', '', 1, 3, 'Albert/docs/', '3/5/', 1, '2015-04-09 09:34:59'),
(6, 4, 1, 'img', '', 1, 3, 'Albert/images/img/', '3/4/6/', 1, '2015-04-09 15:47:00');

-- --------------------------------------------------------

--
-- Table structure for table `dms_users`
--

CREATE TABLE IF NOT EXISTS `dms_users` (
  `users_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(220) NOT NULL,
  `last_name` varchar(220) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `username` varchar(220) NOT NULL,
  `password` varchar(220) NOT NULL,
  `temp_pwd` varchar(220) NOT NULL,
  `email` varchar(80) NOT NULL,
  `comment` text NOT NULL,
  `role` enum('admin','user') NOT NULL,
  `disabled` tinyint(4) DEFAULT NULL,
  `quota` double DEFAULT NULL COMMENT 'Allowed disk space in KB',
  `home_folder` int(11) NOT NULL COMMENT 'folder id',
  `parent_user` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `dms_users`
--

INSERT INTO `dms_users` (`users_id`, `first_name`, `last_name`, `mobile`, `username`, `password`, `temp_pwd`, `email`, `comment`, `role`, `disabled`, `quota`, `home_folder`, `parent_user`, `created_at`, `updated_at`) VALUES
(1, 'John', 'Nash', '8989898989', 'john', 'e99a18c428cb38d5f260853678922e03', 'abc123', 'admin@email.com', '', 'admin', 0, 0, 1, 1, '2015-04-08 13:00:00', '0000-00-00 00:00:00'),
(2, 'RON', 'WILL', '9272727272', 'ron', 'e99a18c428cb38d5f260853678922e03', 'abc123', 'ron@email.com', '', 'user', 0, NULL, 2, 1, '2015-04-08 13:59:05', '2015-04-08 15:51:35'),
(3, 'ALBERT', 'D', '9242424242', 'albert', 'e99a18c428cb38d5f260853678922e03', 'abc123', 'albert@email.com', '', 'user', 0, NULL, 3, 1, '2015-04-08 16:12:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `document_category`
--

CREATE TABLE IF NOT EXISTS `document_category` (
  `document_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`document_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `document_category`
--

INSERT INTO `document_category` (`document_category_id`, `document_id`, `category_id`) VALUES
(1, 1, 2),
(2, 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `dsm_access_log`
--

CREATE TABLE IF NOT EXISTS `dsm_access_log` (
  `document_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `action` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dsm_access_log`
--

INSERT INTO `dsm_access_log` (`document_id`, `user_id`, `action`, `created_at`) VALUES
(2, 1, 'View', '2015-04-13 07:09:22'),
(2, 1, 'View', '2015-04-13 07:10:24'),
(3, 1, 'View', '2015-04-13 10:29:38'),
(6, 1, 'View', '2015-04-13 10:59:51');

-- --------------------------------------------------------

--
-- Table structure for table `dsm_category`
--

CREATE TABLE IF NOT EXISTS `dsm_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT 'Owner of category',
  `category_title` varchar(220) NOT NULL,
  `note` text NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `dsm_category`
--

INSERT INTO `dsm_category` (`category_id`, `user_id`, `category_title`, `note`, `created_at`) VALUES
(1, 1, 'EXCEL DOC', 'Excel sheet', '2015-04-10 14:26:23'),
(2, 1, 'JPG', '', '2015-04-10 16:06:32');

-- --------------------------------------------------------

--
-- Table structure for table `dsm_documentfolder_category`
--

CREATE TABLE IF NOT EXISTS `dsm_documentfolder_category` (
  `document_id` int(11) DEFAULT NULL,
  `folder_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dsm_favorite_document`
--

CREATE TABLE IF NOT EXISTS `dsm_favorite_document` (
  `document_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  UNIQUE KEY `document_id` (`document_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dsm_folderdocument_access`
--

CREATE TABLE IF NOT EXISTS `dsm_folderdocument_access` (
  `document_id` int(11) DEFAULT NULL,
  `folder_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `mode` enum('0','1','2','3','4') NOT NULL COMMENT '0-No access,1-Read,2-read write,3-read write share,4-all permission'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='access management for folder and document other than inherited access ';

-- --------------------------------------------------------

--
-- Table structure for table `dsm_group`
--

CREATE TABLE IF NOT EXISTS `dsm_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT 'owner of group',
  `group_name` varchar(220) NOT NULL,
  `note` text NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `user_id` (`user_id`,`group_name`),
  UNIQUE KEY `user_id_2` (`user_id`,`group_name`),
  UNIQUE KEY `user_id_3` (`user_id`,`group_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `dsm_group`
--

INSERT INTO `dsm_group` (`group_id`, `user_id`, `group_name`, `note`, `created_at`) VALUES
(1, 1, 'IMAGES', '', '2015-04-10 12:11:09'),
(2, 1, 'docs', '', '2015-04-10 14:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `dsm_group_members`
--

CREATE TABLE IF NOT EXISTS `dsm_group_members` (
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`group_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dsm_group_members`
--

INSERT INTO `dsm_group_members` (`group_id`, `user_id`, `created_at`) VALUES
(1, 2, '2015-04-10 15:00:00'),
(2, 2, '2015-04-10 15:43:00'),
(2, 3, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `dsm_keywords`
--

CREATE TABLE IF NOT EXISTS `dsm_keywords` (
  `keyword_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT 'Owner of keyword',
  `keyword` varchar(220) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`keyword_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `dsm_keywords`
--

INSERT INTO `dsm_keywords` (`keyword_id`, `user_id`, `keyword`, `created_at`) VALUES
(1, 3, 'animal', '2015-04-09 15:00:00'),
(2, 1, 'ANIMALS', '2015-04-10 13:54:20'),
(3, 1, 'WILD', '2015-04-13 08:55:28');

-- --------------------------------------------------------

--
-- Table structure for table `dsm_shared_documents`
--

CREATE TABLE IF NOT EXISTS `dsm_shared_documents` (
  `shared_document_id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` int(11) NOT NULL,
  `token` int(11) NOT NULL,
  `expire_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `shared_by` int(11) NOT NULL,
  PRIMARY KEY (`shared_document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dsm_user_permission`
--

CREATE TABLE IF NOT EXISTS `dsm_user_permission` (
  `user_id` int(11) NOT NULL,
  `user_permissionlist_id` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dsm_user_permission`
--

INSERT INTO `dsm_user_permission` (`user_id`, `user_permissionlist_id`) VALUES
(2, 1),
(3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dsm_user_permissionlist`
--

CREATE TABLE IF NOT EXISTS `dsm_user_permissionlist` (
  `user_permissionlist_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `title` varchar(220) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`user_permissionlist_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `dsm_user_permissionlist`
--

INSERT INTO `dsm_user_permissionlist` (`user_permissionlist_id`, `title`, `description`) VALUES
(1, 'User Creation', 'can user create user'),
(2, 'User creation Permission', 'Can user assign create user permission to its child users'),
(3, 'Document Category', 'can user create document category?');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
