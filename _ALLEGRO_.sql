-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 05, 2013 at 09:38 PM
-- Server version: 5.5.32
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `test_multi_sets`()
    DETERMINISTIC
begin
        select user() as first_col;
        select user() as first_col, now() as second_col;
        select user() as first_col, now() as second_col, now() as third_col;
        end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `cid` varchar(255) NOT NULL,
  `password` char(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` char(10) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cid`, `password`, `name`, `address`, `phone`) VALUES
('limwlisa@gmail.com', 'Cs304UBC!', 'Lisa Li', '5172 Thunderbird Cres', '6047827583'),
('rocky.jj.he@gmail.com', 'Cs304UBC!', 'Rocky He', '5172 Thunderbird Cres', '6047152211'),
('kimberleychen2011@gmail.com', 'Cs304UBC!', 'Kim Chen', '5172 Thunderbird Cres', '6043688182'),
('boyangh@gmail.com', 'Cs304UBC!', 'Bo Hu', '5172 Thunderbird Cres', '7789601622');

-- --------------------------------------------------------

--
-- Table structure for table `has_song`
--

CREATE TABLE IF NOT EXISTS `has_song` (
  `upc` int(12) NOT NULL,
  `song_title` varchar(255) NOT NULL,
  PRIMARY KEY (`upc`,`song_title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `has_song`
--

INSERT INTO `has_song` (`upc`, `song_title`) VALUES
(100001, 'In the End');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `upc` int(12) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `disk_type` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `pub_year` int(4) NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  PRIMARY KEY (`upc`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=100181 ;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`upc`, `title`, `disk_type`, `category`, `company`, `pub_year`, `price`, `stock`) VALUES
(100001, 'Minutes To Midnight', 'CD', 'Rock', 'Warner Bros. Records', 2007, 2000, 100),
(100002, 'The Songs Of R.E.M', 'CD', 'Rock', 'Warner Bros.', 2010, 999, 20),
(100003, 'Drifting Your Majesty', 'CD', 'Rock', 'Caldo Verde Records', 2010, 1999, 50),
(100004, 'Making Mirrors', 'DVD', 'Rock', 'Universal Republic', 2012, 899, 10),
(100005, 'Mutt', 'CD', 'Rock', 'Bloodshot Records', 2012, 799, 100),
(100006, 'Nursing Home', 'CD', 'Rock', 'Merge Records', 2011, 1000, 200),
(100007, 'Time & Eternal', 'CD', 'Rock', 'Facedown Records', 2013, 1, 0),
(100008, 'Sunspotted', 'CD', 'Rock', 'Type', 2010, 1099, 20),
(100009, 'The Lost Children', 'DVD', 'Rock', 'Reprise Records', 2011, 999, 20),
(100010, 'Let’s Cheers To This', 'CD', 'Rock', 'Rise Records', 2011, 999, 80),
(100011, 'Don’t Look Down', 'CD', 'Pop', 'Interscope', 2013, 999, 20),
(100012, 'Ready Or Not', 'CD', 'Pop', 'Hollywood Records', 2012, 599, 0),
(100013, 'All The Little Lights', 'CD', 'Pop', 'Nettwerk', 2013, 1999, 50),
(100014, 'Crazy World', 'CD', 'Pop', 'Columbia', 2012, 999, 10),
(100015, 'No Matter How Far', 'CD', 'Pop', 'eOne', 2013, 799, 100),
(100016, 'Native', 'CD', 'Pop', 'Interscope', 2013, 1000, 200),
(100017, 'Up All Night', 'CD', 'Pop', 'Columbia', 2012, 1, 0),
(100018, 'All That Echoes', 'DVD', 'Pop', 'Reprise Records', 2013, 1099, 20),
(100019, 'The Next Day', 'CD', 'Pop', 'Columbia', 2013, 999, 20),
(100020, 'Night Work', 'DVD', 'Pop', 'Downtown Music', 2010, 999, 80),
(100021, 'I’m Still Livin', 'CD', 'Rap', 'Rap-A-Lot Records', 2006, 999, 20),
(100022, 'Big Syke Daddy', 'CD', 'Rap', 'Rap-A-Lot Records', 2001, 199, 10),
(100023, 'Platinum Underground', 'CD', 'Rap', 'Ultrax', 2005, 999, 0),
(100024, 'Rose', 'CD', 'Rap', 'Remstar Interaction', 2007, 1899, 10),
(100025, 'Not Tonight', 'CD', 'Rap', 'Big Beat', 1997, 799, 10),
(100026, 'Slim Shaddy LP', 'CD', 'Rap', 'Interscope', 2000, 999, 20),
(100027, 'The Documentary', 'CD', 'Rap', 'Interscope', 2004, 999, 20),
(100028, 'Feed The Family', 'CD', 'Country', 'Hillgrass Bluebilly Records', 2010, 1099, 0),
(100029, 'New Mythologies', 'CD', 'Country', 'Sonick Sorcery', 2012, 1099, 10),
(100030, 'Toronto Sunday', 'DVD', 'Country', 'Corwood Industries', 2010, 999, 50),
(100031, 'Gone Away Backward', 'CD', 'Country', 'Bloodshot Records', 2013, 899, 10),
(100032, 'The Lumineers', 'CD', 'Country', 'Dualtone', 2012, 1799, 100),
(100033, 'Far From Refuge', 'CD', 'Instrumental', 'Revive Records', 2007, 1499, 10),
(100034, 'God Is An Astronaut', 'CD', 'Instrumental', 'Revive Records', 2008, 1499, 15),
(100035, 'Opus At The End of Everything', 'CD', 'Instrumental', 'Alphabasic', 2012, 1399, 10),
(100036, 'Soundtrack To A Vacant Life', 'CD', 'Instrumental', 'Alphabasic', 2008, 1499, 10),
(100037, 'Far From Refuge', 'CD', 'Instrumental', 'Revive Records', 2007, 1499, 10),
(100038, 'A Place In The Sun', 'CD', 'Country', 'Curb Records', 1999, 999, 30),
(100039, 'Look At Them Beans', 'CD', 'Country', 'Columbia', 1975, 899, 20),
(100040, 'The Fabulous Johnny Cash', 'CD', 'Country', 'Philips', 1975, 599, 10),
(100041, 'Gunfighter Ballads & Trail Songs', 'CD', 'Country', 'Hallmark Records', 2011, 1499, 50),
(100042, 'Standing Tall', 'CD', 'Country', 'United Artist Records', 1980, 999, 20),
(100050, 'Watermark', 'CD', 'New Age', 'WEA', 1988, 499, 10),
(100049, 'A Day Without Rain', 'CD', 'New Age', 'WEA', 2000, 999, 30),
(100048, 'Happy Songs For Happy People', 'CD', 'Instrumental', 'Matador', 2003, 599, 30),
(100047, 'The Earth Is Not A Cold Place', 'CD', 'Instrumental', 'Bella Union', 2003, 999, 40),
(100046, 'Silent Running', 'DVD', 'Instrumental', 'Dustpunk Records', 2011, 2499, 20),
(100045, 'Tomorrow"s Harvest', 'CD', 'Instrumental', 'Warp Records', 2013, 1299, 50),
(100044, 'Richard D. James Album', 'CD', 'Instrumental', 'Warp Records', 1996, 599, 10),
(100043, 'Geodaddi', 'CD', 'Instrumental', 'Warp Records', 2002, 699, 0),
(100051, 'Tamayura', 'DVD', 'New Age', 'Domo Records', 2012, 1499, 50),
(100052, 'Ninja Scroll', 'CD', 'New Age', 'Domo Records', 2003, 499, 10),
(100053, 'Earthsongs', 'CD', 'New Age', 'Universal', 2004, 899, 30),
(100054, 'La Luna', 'CD', 'New Age', 'EastWest', 2000, 999, 50),
(100055, 'The Cross Of Changes', 'CD', 'New Age', 'Virgin', 1993, 499, 10),
(100056, 'Seven Lives Many Faces', 'CD', 'New Age', 'Virgin', 2008, 899, 25),
(100057, 'Tubular Beats', 'CD', 'New Age', 'Ear Music', 2013, 1999, 80),
(100058, 'Oceanic', 'CD', 'New Age', 'EastWest', 1996, 399, 10),
(100164, 'Hungarian Rhapsodies, Liebestraum, Sonata', 'CD', 'Classical', 'Classic Mania', 2005, 2499, 20),
(100161, 'Symphonies Nos. 4 & 5', 'CD', 'Classical', 'Brilliant Classics', 2007, 1999, 20),
(100159, 'Sonatas Nos. 8 and 10', 'CD', 'Classical', 'RCA Red Seal', 2012, 4499, 50),
(100160, 'Symphony No. 9', 'CD', 'Classical', 'Brilliant Classics', 2007, 2099, 20),
(100163, 'Essential Chopin', 'CD', 'Classical', 'EMI Classics', 2010, 1899, 50),
(100162, 'Der Ring Des Nibelungen', 'DVD', 'Classical', 'C Major Entertainment', 2009, 2999, 30),
(100165, 'The Eight-Stringed Bach', 'CD', 'Classical', 'Accent', 2009, 999, 15),
(100166, 'Sonatas For Cello And Piano', 'CD', 'Classical', 'RCA Red Seal', 1985, 999, 10),
(100167, 'Cello Concerti Nos. 1 and 2', 'CD', 'Classical', 'CBS Masterworks', 1981, 999, 10),
(100168, 'Sonatas For Viola Da Gamba & Harpsichord', 'CD', 'Classical', 'CBS Masterworks', 1983, 999, 10),
(15476, 'hello', 'CD', 'Rock', '274923', 190, 190, 190),
(100179, '', '', '', '', 0, 0, 0),
(100178, '', '', '', '', 0, 0, 0),
(100177, '', '', '', '', 0, 0, 0),
(100176, '', '', '', '', 0, 0, 0),
(100180, 'hello', 'CD', 'Rock', 'fel', 1900, 190, 190);

-- --------------------------------------------------------

--
-- Table structure for table `lead_singer`
--

CREATE TABLE IF NOT EXISTS `lead_singer` (
  `upc` int(12) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`upc`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lead_singer`
--

INSERT INTO `lead_singer` (`upc`, `name`) VALUES
(100001, 'Linkin Park'),
(100002, 'R.E.M'),
(100003, 'Desertshore'),
(100004, 'Gotye'),
(100005, 'Cory Branan'),
(100006, 'Lets Wrestle'),
(100007, 'Colossus'),
(100008, 'Heavy Winged'),
(100009, 'Disturbed'),
(100010, 'Sleeping With Sirens'),
(100011, 'Skyler Grey'),
(100012, 'Bridgit Mendler'),
(100013, 'Passenger'),
(100014, 'Boys Like Girls'),
(100015, 'David Archuleta'),
(100033, 'God Is An Astronaut'),
(100034, 'God Is An Astronaut'),
(100035, 'The Flashbulb'),
(100036, 'The Flashbulb'),
(100037, 'God Is An Astronaut'),
(100038, 'Tim McGraw'),
(100039, 'Johnny Cash'),
(100040, 'Johnny Cash'),
(100041, 'Billie Jo Spears'),
(100042, 'Marty Robbins'),
(100043, 'Boards of Canada'),
(100044, 'Aphex Twin'),
(100045, 'Boards of Canada'),
(100046, '65daysofstatic'),
(100047, 'Explosions In The Sky'),
(100048, 'Mogwai'),
(100049, 'Enya'),
(100050, 'Enya'),
(100051, 'Kitaro'),
(100052, 'Kitaro'),
(100053, 'Secret Garden'),
(100054, 'Sarah Brightman'),
(100055, 'Enigma'),
(100056, 'Enigma'),
(100057, 'Mike Oldfield'),
(100058, 'Vangelis'),
(100159, 'Ludwig van Beethoven'),
(100160, 'Ludwig van Beethoven, Wilhelm Furtwangler'),
(100161, 'Ludwig van Beethoven, Kurt Masur'),
(100162, 'Richard Wagner'),
(100163, 'Frédéric Chopin'),
(100164, 'Franz Liszt'),
(100165, 'Johann Sebastian Bach'),
(100166, 'Johannes Brahms'),
(100167, 'Joseph Haydn'),
(100168, 'Johann Sebastian Bach');

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE IF NOT EXISTS `purchase` (
  `receiptId` int(11) NOT NULL AUTO_INCREMENT,
  `pur_date` datetime DEFAULT NULL,
  `cid` varchar(255) DEFAULT NULL,
  `card_number` char(16) DEFAULT NULL,
  `expiryDate` char(4) DEFAULT NULL,
  `expectedDate` date DEFAULT NULL,
  `deliveredDate` date DEFAULT NULL,
  PRIMARY KEY (`receiptId`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`receiptId`, `pur_date`, `cid`, `card_number`, `expiryDate`, `expectedDate`, `deliveredDate`) VALUES
(1, '2013-08-01 12:08:09', 'boyangh@gmail.com', '1111111111111111', '0815', '2013-08-12', '2013-08-12');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_item`
--

CREATE TABLE IF NOT EXISTS `purchase_item` (
  `receiptId` int(11) NOT NULL,
  `upc` int(12) NOT NULL,
  `quantity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`receiptId`,`upc`),
  KEY `upc` (`upc`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `purchase_item`
--

INSERT INTO `purchase_item` (`receiptId`, `upc`, `quantity`) VALUES
(1, 100001, 10);

-- --------------------------------------------------------

--
-- Table structure for table `returns`
--

CREATE TABLE IF NOT EXISTS `returns` (
  `retid` int(11) NOT NULL AUTO_INCREMENT,
  `ret_date` datetime DEFAULT NULL,
  `receiptId` int(11) NOT NULL,
  PRIMARY KEY (`retid`),
  KEY `receiptId` (`receiptId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `returns`
--

INSERT INTO `returns` (`retid`, `ret_date`, `receiptId`) VALUES
(1, '2013-08-14 08:56:17', 1);

-- --------------------------------------------------------

--
-- Table structure for table `return_item`
--

CREATE TABLE IF NOT EXISTS `return_item` (
  `retid` int(11) NOT NULL,
  `upc` int(12) NOT NULL,
  `quantity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`retid`,`upc`),
  KEY `upc` (`upc`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `return_item`
--

INSERT INTO `return_item` (`retid`, `upc`, `quantity`) VALUES
(1, 100001, 7);

-- --------------------------------------------------------

--
-- Table structure for table `viewcount`
--

CREATE TABLE IF NOT EXISTS `viewcount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `view` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `viewcount`
--

INSERT INTO `viewcount` (`id`, `view`) VALUES
(1, 15),
(2, 3),
(3, 4),
(4, 9);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
