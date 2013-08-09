-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 07, 2013 at 03:31 AM
-- Server version: 5.5.31
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
(100001, 'Bleed It Out'),
(100001, 'Given Up'),
(100001, 'Hands Held High'),
(100001, 'In Between'),
(100001, 'In Pieces'),
(100001, 'In the End'),
(100001, 'Leave Out All The Rest'),
(100001, 'No More Sorrow'),
(100001, 'Shadow of the Day'),
(100001, 'The Little Things Give You Away'),
(100001, 'Valentines Day'),
(100001, 'Wake'),
(100001, 'What Ive Done'),
(100002, 'At My Most Beautiful'),
(100002, 'Electrolite'),
(100002, 'Everybody Hurts'),
(100002, 'Fall On Me'),
(100002, 'Imitation Of Life'),
(100002, 'Leaving New York'),
(100002, 'Losing My Religion'),
(100002, 'Man On The Moon'),
(100002, 'Radio Free Europe'),
(100002, 'Rockville'),
(100002, 'So. Central Rain'),
(100002, 'Stand'),
(100002, 'Strange Currencies'),
(100002, 'Supernatural Superserious'),
(100002, 'The End Of The World As We Know It '),
(100002, 'The Great Beyond'),
(100002, 'The One I Love'),
(100002, 'What''s The Frequency, Kenneth'),
(100003, 'Beautiful Descent'),
(100003, 'Black Mirror Water'),
(100003, 'Darkhan'),
(100003, 'Deep Forest Echoes'),
(100003, 'Drifting Your Majesty'),
(100003, 'Gwynnedd'),
(100003, 'Jordan Heavyhand'),
(100003, 'Koko'),
(100003, 'Maurice In Reflection'),
(100003, 'Mojave Mirage'),
(100003, 'Plataea'),
(100003, 'Right Favor'),
(100003, 'Sixteen Drawers'),
(100003, 'The Town Alight'),
(100004, 'Bronte'),
(100004, 'Don''t Worry, We''ll Be Watching You'),
(100004, 'Easy Way Out'),
(100004, 'Eyes Wide Open'),
(100004, 'Giving Me A Chance'),
(100004, 'I Feel Better'),
(100004, 'In Your Light'),
(100004, 'Making Mirrors'),
(100004, 'Save Me'),
(100004, 'Smoke And Mirrors'),
(100004, 'Somebody That I Used To Know'),
(100004, 'State Of The Art'),
(100005, 'Bad Man'),
(100005, 'Darken My Door'),
(100005, 'Hold Me Down'),
(100005, 'Jericho'),
(100005, 'Lily'),
(100005, 'Survivor Blues'),
(100005, 'Survivor Blues (The After Hours)'),
(100005, 'The Corner'),
(100005, 'The Freefall'),
(100005, 'The Snowman'),
(100005, 'There There, Little Heartbreaker'),
(100005, 'Yesterday (Circa Summer 80 Somethin)'),
(100006, 'Bad Mammaries'),
(100006, 'Dear John'),
(100006, 'For My Mother'),
(100006, 'Getting Rest'),
(100006, 'I Am Useful'),
(100006, 'I Forgot'),
(100006, 'I Will Not Give In'),
(100006, 'I''m So Lazy'),
(100006, 'If I Keep On Loving You'),
(100006, 'In Dreams Part II'),
(100006, 'In The Suburbs'),
(100006, 'There''s A Rockstar In My Room'),
(100007, 'Bereavement'),
(100007, 'Counterfeit Kingdoms'),
(100007, 'Dirge'),
(100007, 'Pentecost'),
(100007, 'Superficial Saviour'),
(100007, 'Time'),
(100007, 'Transgressor'),
(100008, 'Counterfeit Kingdoms'),
(100008, 'Dirge'),
(100008, 'Pentecost'),
(100008, 'Superficial Saviour'),
(100008, 'Time'),
(100009, ' Pandas in the wild'),
(100009, 'eat other grasses'),
(100009, 'even meat in the'),
(100009, 'form of birds'),
(100009, 'or'),
(100009, 'rodents or carrion'),
(100009, 'wild tubers'),
(100009, 'will occasionally'),
(100010, '239 pandas'),
(100010, 'A 2007'),
(100010, 'and another 27 outside'),
(100010, 'inside China'),
(100010, 'living in captivity'),
(100010, 'report shows'),
(100010, 'the country'),
(100011, 'and round face'),
(100011, 'are adaptations'),
(100011, 'its large'),
(100011, 'panda most distinctive features'),
(100011, 'size'),
(100011, 'to its bamboo diets'),
(100011, 'Two of the'),
(100012, '25'),
(100012, 'and Fargesia rufa'),
(100012, 'any of'),
(100012, 'bamboo'),
(100012, 'dracocephala'),
(100012, 'eat'),
(100012, 'Fargesia'),
(100012, 'Pandas'),
(100012, 'species in the wild'),
(100013, 'another zouyu'),
(100013, 'captured zouyu'),
(100013, 'During the reign'),
(100013, 'early 15th century'),
(100013, 'legendary righteous animal'),
(100013, 'qilin'),
(100013, 'relative from Kaifeng'),
(100013, 'sent'),
(100013, 'sighted in Shandong'),
(100013, 'sincere monarch'),
(100013, 'the rule of a benevolent'),
(100013, 'Yongle Emperor'),
(100013, 'Zouyu'),
(100014, 'American Japanese'),
(100014, 'giant pandas'),
(100014, 'Loans'),
(100015, 'aspiring writer'),
(100015, 'Brooklyn'),
(100015, 'cut her off financially'),
(100015, 'Hannah Horvath'),
(100015, 'her midtwenties'),
(100015, 'living in Greenpoint'),
(100015, 'She'),
(100016, 'Along with Jessa'),
(100016, 'At the start'),
(100016, 'Best friend'),
(100016, 'Charlie and Elijah'),
(100016, 'Hannah'),
(100016, 'Marnie Michaels'),
(100016, 'Marnie was a classmate'),
(100016, 'Roommate'),
(100016, 'Season 1'),
(100017, 'Charlie'),
(100017, 'College boyfriend'),
(100017, 'During majority'),
(100017, 'End relationship'),
(100017, 'First season'),
(100017, 'Marnie struggles'),
(100017, 'Serious art gallery assistant'),
(100017, 'She is responsible'),
(100017, 'Whether or not'),
(100018, 'Another girlfriend'),
(100018, 'Broke up'),
(100018, 'Charlie already'),
(100018, 'Discovers'),
(100018, 'Feel depressed and unsure'),
(100018, 'Herself'),
(100018, 'Marnie'),
(100018, 'Only two weeks'),
(100019, 'Bohemian'),
(100019, 'Newly back to New York City'),
(100019, 'Nolita'),
(100019, 'Roommates with Shoshanna'),
(100019, 'Unpredictable world-traveler'),
(100020, '21 years old'),
(100020, 'Avid fan'),
(100020, 'Innocent American'),
(100020, 'Jessa bubbly'),
(100020, 'Math major at New York University'),
(100020, 'Sex & the City'),
(100020, 'Shoshanna'),
(100021, 'Actor'),
(100021, 'Adam'),
(100021, 'Aloof lover'),
(100021, 'Hannah'),
(100021, 'His apartment'),
(100021, 'Part-time carpenter'),
(100021, 'Their relationship'),
(100022, 'Breaks up with her'),
(100022, 'Move in'),
(100022, 'Respond'),
(100022, 'Says he loves her'),
(100022, 'Season one finale'),
(100023, 'Accidentally smokes crack at a rave'),
(100023, 'After Jessa wedding'),
(100023, 'Develops feelings for her'),
(100023, 'Loses virginity with Ray '),
(100023, 'Take care of Shoshanna'),
(100024, 'Charlie take her back'),
(100024, 'Difficulty'),
(100024, 'Hard Being Easy'),
(100024, 'Marnie attempts suicide'),
(100024, 'Revealed'),
(100025, 'Discovery'),
(100025, 'Entries in Hannah journal'),
(100025, 'Marijuana brownies'),
(100025, 'Needy and Desperate'),
(100025, 'Reaction'),
(100026, 'First appearance'),
(100026, 'Friendlier terms'),
(100026, 'Gigs'),
(100026, 'Questionable Goods'),
(100026, 'Surprise wedding'),
(100026, 'Two-person band'),
(100027, '29 reviews'),
(100027, '87'),
(100027, 'Aggregator website'),
(100027, 'Metacritic'),
(100027, 'On the review'),
(100027, 'The website'),
(100027, 'Universal acclaim'),
(100028, '2012 SXSW Festival'),
(100028, 'Girls'),
(100028, 'Goodman'),
(100028, 'In recent memory'),
(100028, 'No-missed-steps series'),
(100028, 'One of the most original'),
(100028, 'Spot-on'),
(100028, 'The Hollywood Reporter'),
(100028, 'Three episodes'),
(100029, 'A television program'),
(100029, 'Characters'),
(100029, 'Children of wealthy famous'),
(100029, 'Gawker John Cook'),
(100029, 'Girls'),
(100029, 'Positive reviews'),
(100029, 'Several critics'),
(100030, '1998'),
(100030, 'Dunham'),
(100030, 'Girls reflection'),
(100030, 'Gossip Girl'),
(100030, 'Population'),
(100030, 'Sex and the City'),
(100030, 'Sex and the City 2'),
(100030, 'Teens'),
(100030, 'Upper East Side'),
(100031, 'Apatow'),
(100031, 'Executive producer'),
(100031, 'Head writer'),
(100031, 'Jennifer Konner'),
(100031, 'Showrunners'),
(100032, 'Geminola'),
(100032, 'New York area'),
(100032, 'Season one'),
(100032, 'Vintage boutique'),
(100032, 'Vintage stores'),
(100032, 'Wedding dress');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=100038 ;

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
(100037, 'Far From Refuge', 'CD', 'Instrumental', 'Revive Records', 2007, 1499, 10);

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
(100016, 'One Republic'),
(100017, 'One Direction'),
(100018, 'Josh Groban'),
(100019, 'David Bowie'),
(100020, 'Scissor Sisters'),
(100021, 'Z-Ro'),
(100022, 'Big Skye'),
(100023, 'Vanilla Ice'),
(100024, 'Bran Van'),
(100025, 'Lil Kim'),
(100026, 'Eminem'),
(100027, 'Game'),
(100028, 'Paul James'),
(100029, 'C.O.T.A'),
(100030, 'Jandek'),
(100031, 'Robbie Fulks'),
(100032, 'The Lumineers');

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
-- Table structure for table `viewCount`
--

CREATE TABLE IF NOT EXISTS `viewCount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `view` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `viewCount`
--

INSERT INTO `viewCount` (`id`, `view`) VALUES
(1, 15),
(2, 3),
(3, 4),
(4, 9);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
