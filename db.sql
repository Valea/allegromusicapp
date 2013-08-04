
-- phpMyAdmin SQL Dump
-- version 2.11.11.3
-- http://www.phpmyadmin.net
--
-- Host: 50.63.237.72
-- Generation Time: Aug 04, 2013 at 04:37 PM
-- Server version: 5.0.96
-- PHP Version: 5.1.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `allegromusicapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cid` varchar(255) NOT NULL,
  `password` char(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) default NULL,
  `phone` char(10) default NULL,
  PRIMARY KEY  (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` VALUES('limwlisa@gmail.com', 'Cs304UBC!', 'Lisa Li', '5172 Thunderbird Cres', '6047827583');
INSERT INTO `customer` VALUES('rocky.jj.he@gmail.com', 'Cs304UBC!', 'Rocky He', '5172 Thunderbird Cres', '6047152211');
INSERT INTO `customer` VALUES('kimberleychen2011@gmail.com', 'Cs304UBC!', 'Kim Chen', '5172 Thunderbird Cres', '6043688182');
INSERT INTO `customer` VALUES('boyangh@gmail.com', 'Cs304UBC!', 'Bo Hu', '5172 Thunderbird Cres', '7789601622');

-- --------------------------------------------------------

--
-- Table structure for table `has_song`
--

CREATE TABLE `has_song` (
  `upc` int(12) NOT NULL,
  `song_title` varchar(255) NOT NULL,
  PRIMARY KEY  (`upc`,`song_title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `has_song`
--

INSERT INTO `has_song` VALUES(100001, 'In the End');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `upc` int(12) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL,
  `disk_type` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `company` varchar(255) default NULL,
  `pub_year` int(4) NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  PRIMARY KEY  (`upc`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=100038 ;

--
-- Dumping data for table `item`
--

INSERT INTO `item` VALUES(100001, 'Minutes To Midnight', 'CD', 'Rock', 'Warner Bros. Records', 2007, 2000, 100);
INSERT INTO `item` VALUES(100002, 'The Songs Of R.E.M', 'CD', 'Rock', 'Warner Bros.', 2010, 999, 20);
INSERT INTO `item` VALUES(100003, 'Drifting Your Majesty', 'CD', 'Rock', 'Caldo Verde Records', 2010, 1999, 50);
INSERT INTO `item` VALUES(100004, 'Making Mirrors', 'DVD', 'Rock', 'Universal Republic', 2012, 899, 10);
INSERT INTO `item` VALUES(100005, 'Mutt', 'CD', 'Rock', 'Bloodshot Records', 2012, 799, 100);
INSERT INTO `item` VALUES(100006, 'Nursing Home', 'CD', 'Rock', 'Merge Records', 2011, 1000, 200);
INSERT INTO `item` VALUES(100007, 'Time & Eternal', 'CD', 'Rock', 'Facedown Records', 2013, 1, 0);
INSERT INTO `item` VALUES(100008, 'Sunspotted', 'CD', 'Rock', 'Type', 2010, 1099, 20);
INSERT INTO `item` VALUES(100009, 'The Lost Children', 'DVD', 'Rock', 'Reprise Records', 2011, 999, 20);
INSERT INTO `item` VALUES(100010, 'Let’s Cheers To This', 'CD', 'Rock', 'Rise Records', 2011, 999, 80);
INSERT INTO `item` VALUES(100011, 'Don’t Look Down', 'CD', 'Pop', 'Interscope', 2013, 999, 20);
INSERT INTO `item` VALUES(100012, 'Ready Or Not', 'CD', 'Pop', 'Hollywood Records', 2012, 599, 0);
INSERT INTO `item` VALUES(100013, 'All The Little Lights', 'CD', 'Pop', 'Nettwerk', 2013, 1999, 50);
INSERT INTO `item` VALUES(100014, 'Crazy World', 'CD', 'Pop', 'Columbia', 2012, 999, 10);
INSERT INTO `item` VALUES(100015, 'No Matter How Far', 'CD', 'Pop', 'eOne', 2013, 799, 100);
INSERT INTO `item` VALUES(100016, 'Native', 'CD', 'Pop', 'Interscope', 2013, 1000, 200);
INSERT INTO `item` VALUES(100017, 'Up All Night', 'CD', 'Pop', 'Columbia', 2012, 1, 0);
INSERT INTO `item` VALUES(100018, 'All That Echoes', 'DVD', 'Pop', 'Reprise Records', 2013, 1099, 20);
INSERT INTO `item` VALUES(100019, 'The Next Day', 'CD', 'Pop', 'Columbia', 2013, 999, 20);
INSERT INTO `item` VALUES(100020, 'Night Work', 'DVD', 'Pop', 'Downtown Music', 2010, 999, 80);
INSERT INTO `item` VALUES(100021, 'I’m Still Livin', 'CD', 'Rap', 'Rap-A-Lot Records', 2006, 999, 20);
INSERT INTO `item` VALUES(100022, 'Big Syke Daddy', 'CD', 'Rap', 'Rap-A-Lot Records', 2001, 199, 10);
INSERT INTO `item` VALUES(100023, 'Platinum Underground', 'CD', 'Rap', 'Ultrax', 2005, 999, 0);
INSERT INTO `item` VALUES(100024, 'Rose', 'CD', 'Rap', 'Remstar Interaction', 2007, 1899, 10);
INSERT INTO `item` VALUES(100025, 'Not Tonight', 'CD', 'Rap', 'Big Beat', 1997, 799, 10);
INSERT INTO `item` VALUES(100026, 'Slim Shaddy LP', 'CD', 'Rap', 'Interscope', 2000, 999, 20);
INSERT INTO `item` VALUES(100027, 'The Documentary', 'CD', 'Rap', 'Interscope', 2004, 999, 20);
INSERT INTO `item` VALUES(100028, 'Feed The Family', 'CD', 'Country', 'Hillgrass Bluebilly Records', 2010, 1099, 0);
INSERT INTO `item` VALUES(100029, 'New Mythologies', 'CD', 'Country', 'Sonick Sorcery', 2012, 1099, 10);
INSERT INTO `item` VALUES(100030, 'Toronto Sunday', 'DVD', 'Country', 'Corwood Industries', 2010, 999, 50);
INSERT INTO `item` VALUES(100031, 'Gone Away Backward', 'CD', 'Country', 'Bloodshot Records', 2013, 899, 10);
INSERT INTO `item` VALUES(100032, 'The Lumineers', 'CD', 'Country', 'Dualtone', 2012, 1799, 100);
INSERT INTO `item` VALUES(100033, 'Far From Refuge', 'CD', 'Instrumental', 'Revive Records', 2007, 1499, 10);
INSERT INTO `item` VALUES(100034, 'God Is An Astronaut', 'CD', 'Instrumental', 'Revive Records', 2008, 1499, 15);
INSERT INTO `item` VALUES(100035, 'Opus At The End of Everything', 'CD', 'Instrumental', 'Alphabasic', 2012, 1399, 10);
INSERT INTO `item` VALUES(100036, 'Soundtrack To A Vacant Life', 'CD', 'Instrumental', 'Alphabasic', 2008, 1499, 10);
INSERT INTO `item` VALUES(100037, 'Far From Refuge', 'CD', 'Instrumental', 'Revive Records', 2007, 1499, 10);

-- --------------------------------------------------------

--
-- Table structure for table `lead_singer`
--

CREATE TABLE `lead_singer` (
  `upc` int(12) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`upc`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lead_singer`
--

INSERT INTO `lead_singer` VALUES(100001, 'Linkin Park');
INSERT INTO `lead_singer` VALUES(100002, 'R.E.M');
INSERT INTO `lead_singer` VALUES(100003, 'Desertshore');
INSERT INTO `lead_singer` VALUES(100004, 'Gotye');
INSERT INTO `lead_singer` VALUES(100005, 'Cory Branan');
INSERT INTO `lead_singer` VALUES(100006, 'Lets Wrestle');
INSERT INTO `lead_singer` VALUES(100007, 'Colossus');
INSERT INTO `lead_singer` VALUES(100008, 'Heavy Winged');
INSERT INTO `lead_singer` VALUES(100009, 'Disturbed');
INSERT INTO `lead_singer` VALUES(100010, 'Sleeping With Sirens');
INSERT INTO `lead_singer` VALUES(100011, 'Skyler Grey');
INSERT INTO `lead_singer` VALUES(100012, 'Bridgit Mendler');
INSERT INTO `lead_singer` VALUES(100013, 'Passenger');
INSERT INTO `lead_singer` VALUES(100014, 'Boys Like Girls');
INSERT INTO `lead_singer` VALUES(100015, 'David Archuleta');

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `receiptId` int(11) NOT NULL auto_increment,
  `pur_date` datetime default NULL,
  `cid` varchar(255) default NULL,
  `card_number` char(16) default NULL,
  `expiryDate` char(4) default NULL,
  `expectedDate` date default NULL,
  `deliveredDate` date default NULL,
  PRIMARY KEY  (`receiptId`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` VALUES(1, '2013-08-01 12:08:09', 'boyangh@gmail.com', '1111111111111111', '0815', '2013-08-12', '2013-08-12');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_item`
--

CREATE TABLE `purchase_item` (
  `receiptId` int(11) NOT NULL,
  `upc` int(12) NOT NULL,
  `quantity` smallint(6) default NULL,
  PRIMARY KEY  (`receiptId`,`upc`),
  KEY `upc` (`upc`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `purchase_item`
--

INSERT INTO `purchase_item` VALUES(1, 100001, 10);

-- --------------------------------------------------------

--
-- Table structure for table `returns`
--

CREATE TABLE `returns` (
  `retid` int(11) NOT NULL auto_increment,
  `ret_date` datetime default NULL,
  `receiptId` int(11) NOT NULL,
  PRIMARY KEY  (`retid`),
  KEY `receiptId` (`receiptId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `returns`
--

INSERT INTO `returns` VALUES(1, '2013-08-14 08:56:17', 1);

-- --------------------------------------------------------

--
-- Table structure for table `return_item`
--

CREATE TABLE `return_item` (
  `retid` int(11) NOT NULL,
  `upc` int(12) NOT NULL,
  `quantity` smallint(6) default NULL,
  PRIMARY KEY  (`retid`,`upc`),
  KEY `upc` (`upc`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `return_item`
--

INSERT INTO `return_item` VALUES(1, 100001, 7);

-- --------------------------------------------------------

--
-- Table structure for table `viewCount`
--

CREATE TABLE `viewCount` (
  `id` int(11) NOT NULL auto_increment,
  `view` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `viewCount`
--

INSERT INTO `viewCount` VALUES(1, 15);
INSERT INTO `viewCount` VALUES(2, 3);
INSERT INTO `viewCount` VALUES(3, 4);
INSERT INTO `viewCount` VALUES(4, 9);
