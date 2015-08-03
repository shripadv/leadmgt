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
-- Database: `finance`
--

-- --------------------------------------------------------

--
-- Table structure for table `borrower`
--

CREATE TABLE IF NOT EXISTS `borrower` (
  `borrower_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(50) NOT NULL,
  `mobile` bigint(11) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `drivinglic` varchar(25) NOT NULL,
  `adharno` varchar(25) NOT NULL,
  `note` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`borrower_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `borrower`
--

INSERT INTO `borrower` (`borrower_id`, `firstname`, `lastname`, `dob`, `address`, `city`, `mobile`, `phone`, `gender`, `email`, `drivinglic`, `adharno`, `note`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'JOHN', 'NASH', '2000-02-29', 'CBD, Navimumbai', 'CBD', 8989898989, 22, 'male', 'john@email.com', '12345678', '12345678', '0', '2014-12-26 10:36:06', '2015-01-20 12:22:19', NULL),
(2, 'PAUL', 'POL', '2004-02-29', 'Navi-mumbai', 'CBD', 7878787878, 0, 'male', 'paul@email.com', '12345678', '', '', '2014-12-30 11:34:46', '0000-00-00 00:00:00', NULL),
(3, 'CONOR', 'SMITH', '0000-00-00', 'C-508, Kukreja Center, Sector-11, \r\nCBD Belapur, Navi Mumbai 400614,\r\nMaharashtra, India', 'CBD', 9242424242, 9242424242, 'male', 'conor@email.com', '', '', '0', '2015-07-23 09:14:05', '2015-07-23 09:24:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `installment`
--

CREATE TABLE IF NOT EXISTS `installment` (
  `insta_id` int(11) NOT NULL AUTO_INCREMENT,
  `loan_id` int(11) NOT NULL,
  `borrower_id` int(11) NOT NULL,
  `pay_amount` double NOT NULL,
  `paid_amount` double NOT NULL,
  `paid_date` date NOT NULL,
  `payoff` int(11) NOT NULL,
  `note` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`insta_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `installment`
--

INSERT INTO `installment` (`insta_id`, `loan_id`, `borrower_id`, `pay_amount`, `paid_amount`, `paid_date`, `payoff`, `note`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 2959, 2959, '2014-12-20', 0, '', '2015-02-20 12:50:23', '0000-00-00 00:00:00', NULL),
(2, 2, 2, 7134, 8000, '2014-12-30', 0, '', '2014-12-30 12:31:49', '0000-00-00 00:00:00', NULL),
(3, 1, 1, 2959, 2959, '2015-01-20', 0, '', '2015-01-20 12:50:23', '0000-00-00 00:00:00', NULL),
(4, 2, 2, 7134, 7134, '2015-01-30', 0, '', '2014-12-30 12:31:49', '0000-00-00 00:00:00', NULL),
(5, 3, 3, 986, 986, '2015-07-23', 0, '', '2015-07-23 09:58:24', '0000-00-00 00:00:00', NULL);

--
-- Triggers `installment`
--
DROP TRIGGER IF EXISTS `AI_loan_txn`;
DELIMITER //
CREATE TRIGGER `AI_loan_txn` AFTER INSERT ON `installment`
 FOR EACH ROW BEGIN
	DECLARE pay_amount DOUBLE(8,2) DEFAULT 0;
	DECLARE paid_amount DOUBLE(8,2) DEFAULT 0;
	DECLARE loan_amount DOUBLE(8,2) DEFAULT 0;
	DECLARE final_amount DOUBLE(8,2) DEFAULT 0;
	DECLARE user_amount DOUBLE(8,2) DEFAULT 0;
	DECLARE payoff VARCHAR(25);
	
	select amount from loan where `loan_id`=NEW.loan_id
	into loan_amount;	
	
	SET pay_amount=NEW.pay_amount;
	SET paid_amount=NEW.paid_amount;

	IF(pay_amount > paid_amount) THEN
		SET payoff="Installment";
		SET final_amount=loan_amount+(pay_amount-paid_amount);
		
		INSERT INTO `loan_transaction`(`loan_id`, `borrower_id`, `insta_id`, `amount`, `final_amount`, `loan_amount`, `reason`) VALUES (NEW.loan_id,NEW.borrower_id,NEW.insta_id,NEW.paid_amount,final_amount,loan_amount,payoff);
	
	ELSEIF(pay_amount <= paid_amount) THEN
		SET user_amount=pay_amount;

		IF(user_amount = paid_amount  && NEW.payoff = "1") THEN
			SET payoff="Payoff";
			SET final_amount=0;
		ELSE
			SET payoff="Installment";
			SET final_amount=loan_amount-(paid_amount-pay_amount);
	    END IF;
		IF(payoff = "Payoff") THEN
		INSERT INTO `loan_transaction`(`loan_id`, `borrower_id`, `insta_id`, `amount`, `final_amount`, `loan_amount`, `reason`) VALUES (NEW.loan_id,NEW.borrower_id,NEW.insta_id,NEW.paid_amount,final_amount,loan_amount,payoff);
		update loan set `status`=0 where loan_id = NEW.loan_id; 		
		ELSE
		INSERT INTO `loan_transaction`(`loan_id`, `borrower_id`, `insta_id`, `amount`, `final_amount`, `loan_amount`, `reason`) VALUES (NEW.loan_id,NEW.borrower_id,NEW.insta_id,NEW.paid_amount,final_amount,loan_amount,payoff);
		END IF;
	END IF;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE IF NOT EXISTS `loan` (
  `loan_id` int(11) NOT NULL AUTO_INCREMENT,
  `borrower_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `rate` float NOT NULL,
  `start_date` date NOT NULL,
  `payoff_date` date NOT NULL,
  `installment_duration` int(11) NOT NULL,
  `duration_in_month` int(11) NOT NULL,
  `note` text NOT NULL,
  `status` varchar(10) NOT NULL,
  `loanname` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`loan_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`loan_id`, `borrower_id`, `amount`, `rate`, `start_date`, `payoff_date`, `installment_duration`, `duration_in_month`, `note`, `status`, `loanname`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 25000, 12, '2014-12-20', '2015-02-20', 30, 2, 'demo', '1', '25000 for 12% on Dec - 2014', '2015-01-10 10:15:12', '0000-00-00 00:00:00', NULL),
(2, 2, 50000, 14, '2014-12-30', '2015-03-30', 30, 3, '', '1', '50000 for 14% on Dec - 2014', '2015-01-10 10:35:31', '0000-00-00 00:00:00', NULL),
(3, 3, 10000, 10, '2015-07-23', '2015-08-23', 30, 1, '', '1', '10000 for 10% on Jul - 2015', '2015-07-23 08:16:54', '0000-00-00 00:00:00', NULL),
(4, 3, 15000, 10, '2015-07-23', '2015-08-23', 30, 1, '', '1', '15000 for 10% on Jul - 2015', '2015-07-23 07:40:50', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `loan_transaction`
--

CREATE TABLE IF NOT EXISTS `loan_transaction` (
  `lt_id` int(11) NOT NULL AUTO_INCREMENT,
  `loan_id` int(11) NOT NULL,
  `borrower_id` int(11) NOT NULL,
  `insta_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `final_amount` double NOT NULL,
  `loan_amount` double NOT NULL,
  `reason` varchar(100) NOT NULL,
  PRIMARY KEY (`lt_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `loan_transaction`
--

INSERT INTO `loan_transaction` (`lt_id`, `loan_id`, `borrower_id`, `insta_id`, `amount`, `final_amount`, `loan_amount`, `reason`) VALUES
(1, 1, 1, 1, 2959, 25000, 25000, 'Installment'),
(2, 2, 2, 2, 8000, 49134, 50000, 'Installment'),
(3, 1, 1, 3, 2959, 25000, 25000, 'Installment'),
(4, 2, 2, 4, 7134, 49134, 50000, 'Installment'),
(5, 3, 3, 5, 986, 10000, 10000, 'Installment');

-- --------------------------------------------------------

--
-- Table structure for table `login_history`
--

CREATE TABLE IF NOT EXISTS `login_history` (
  `uid` int(11) NOT NULL,
  `login_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_history`
--

INSERT INTO `login_history` (`uid`, `login_date`) VALUES
(1, '2014-12-26 14:53:22'),
(1, '2014-12-27 09:50:39'),
(1, '2015-01-20 16:44:27'),
(1, '2015-01-20 16:45:21'),
(1, '2014-12-30 09:56:43'),
(1, '2015-01-30 11:37:19'),
(1, '2015-01-30 11:37:26'),
(1, '2015-02-26 11:42:27'),
(1, '2015-02-19 11:48:04'),
(1, '2014-12-30 11:48:26'),
(1, '2014-12-30 15:58:36'),
(1, '2015-01-30 17:28:11'),
(1, '2015-02-28 17:32:01'),
(1, '2015-02-28 17:32:20'),
(1, '2015-02-28 17:32:25'),
(1, '2015-02-16 18:18:17'),
(1, '2015-02-20 18:19:16'),
(1, '2014-12-30 18:23:57'),
(1, '2014-12-31 18:52:42'),
(1, '2015-01-06 11:17:18'),
(1, '2015-01-06 11:33:21'),
(1, '2015-01-06 14:53:14'),
(1, '2015-01-10 15:43:09'),
(1, '2015-01-10 15:52:52'),
(1, '2015-02-09 16:44:17'),
(1, '2015-07-23 12:39:42');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `name`, `username`, `password`) VALUES
(1, 'abc', 'abc@email.com', 'abc123');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
