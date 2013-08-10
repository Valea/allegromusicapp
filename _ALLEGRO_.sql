-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 10, 2013 at 10:01 AM
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
(100001, 'In the End'),
(100033, 'By the real-life'),
(100033, 'Global financial crisis'),
(100033, 'Guest stars'),
(100033, 'Pawnee inspired'),
(100033, 'Several'),
(100034, 'Despite the similarities'),
(100034, 'Different tone'),
(100034, 'Mockumentary'),
(100034, 'Slightly'),
(100034, 'Sought to establish'),
(100034, 'Style'),
(100035, 'But apparently'),
(100035, 'It got better'),
(100035, 'Lots better'),
(100035, 'Snooze and a half'),
(100035, 'While I was sleeping'),
(100035, 'Workplace comedy'),
(100036, 'Familiar'),
(100036, 'First season'),
(100036, 'Just about trying'),
(100036, 'Pre-expectations'),
(100036, 'Viewers'),
(100036, 'What we werent'),
(100037, 'Bravery'),
(100037, 'Generosity'),
(100037, 'Goodness'),
(100037, 'Honesty'),
(100037, 'Kindness'),
(100037, 'Simplicity'),
(100038, 'Affection'),
(100038, 'Benevolence'),
(100038, 'Forgivness'),
(100038, 'Gentleness'),
(100038, 'Knowledge'),
(100038, 'Love'),
(100038, 'Magnanimity'),
(100038, 'Unity'),
(100039, 'A red bow'),
(100039, 'First appearance'),
(100039, 'Japanese bobtail cat'),
(100039, 'The character'),
(100039, 'Vinyl coin purse'),
(100040, '$5 billion'),
(100040, 'Aimed'),
(100040, 'Global marketing phenomenon'),
(100040, 'Originally'),
(100040, 'Worth'),
(100041, 'Cinderella'),
(100041, 'Comes to Town'),
(100041, 'Snow White'),
(100041, 'The Big Clock Stopped'),
(100041, 'The Circus'),
(100041, 'The Day'),
(100042, 'Alice in Wonderland'),
(100042, 'Heidi'),
(100042, 'The Dream Thief'),
(100042, 'The Sleeping Princess'),
(100042, 'The Wonderful Sisters'),
(100043, 'Mom Loves Me After All'),
(100043, 'Santas Missing Hat'),
(100043, 'The Magic Apple'),
(100043, 'The Prince in his Dream Castle'),
(100044, 'A Blooming Good Morning'),
(100044, 'A Day Out'),
(100044, 'A Storybook Adventure'),
(100044, 'Kittys Clean Cuisine'),
(100044, 'Underground Kitty'),
(100045, 'A mysterious'),
(100045, 'Destroyed'),
(100045, 'Doctor'),
(100045, 'However'),
(100045, 'Mulder is approached'),
(100045, 'When a government building'),
(100046, 'A resolution'),
(100046, 'Asks Joe'),
(100046, 'Bannans head'),
(100046, 'Not yet heard'),
(100046, 'Seeking'),
(100046, 'The discovery'),
(100047, 'Makeshift east-European'),
(100047, 'Medical team'),
(100047, 'Murdering people'),
(100047, 'Stealing organs'),
(100047, 'The compound'),
(100048, 'Actual questions'),
(100048, 'Involved'),
(100048, 'Just as'),
(100048, 'Morality'),
(100048, 'The Dark Knight'),
(100049, 'Comes off'),
(100049, 'Early seasons'),
(100049, 'From one'),
(100049, 'I Want to Believe'),
(100049, 'If not great'),
(100049, 'Solid'),
(100050, 'A dramatic renewal'),
(100050, 'Experimental medicals'),
(100050, 'Her faith'),
(100050, 'Undergoing'),
(100051, 'All Around Cowboy'),
(100051, 'No Charge'),
(100051, 'Seventeen'),
(100051, 'The Troubadour'),
(100051, 'The Trouble With Never'),
(100052, 'Billy The Kid'),
(100052, 'Freedom Song'),
(100052, 'It Can Wait'),
(100052, 'Running Gun'),
(100052, 'Shepard Of My Heart'),
(100053, 'Fry us and eat us'),
(100053, 'In fricassee'),
(100053, 'Nobody beat us'),
(100053, 'Under the sea'),
(100054, 'Distant Shots'),
(100054, 'Echoes'),
(100054, 'Grace Descending'),
(100054, 'New Years End'),
(100054, 'Post Mortem'),
(100054, 'Terra Firma'),
(100055, 'A girl'),
(100055, 'But when'),
(100055, 'In victory'),
(100055, 'Line up at the door'),
(100055, 'We come home'),
(100055, 'What do we want?'),
(100055, 'Worth fighting for'),
(100056, '1969'),
(100056, 'Cornish Acid'),
(100056, 'Gyroscope'),
(100056, 'Hello Mr. Tree'),
(100056, 'Sunshine'),
(100057, 'Burial Scene'),
(100057, 'Gemini'),
(100057, 'Nothing Is Real'),
(100057, 'Space Theme'),
(100057, 'Yellow Calx'),
(100058, 'Hunted By A Freak'),
(100058, 'Killing All The Flies'),
(100058, 'Memorial'),
(100058, 'Your Hand In Mine'),
(100059, 'Magma'),
(100059, 'On Your Shore'),
(100059, 'Only The Night'),
(100059, 'Wild Child'),
(100060, 'Encounter'),
(100060, 'Fields of Fortune'),
(100060, 'Let There Be Light'),
(100060, 'Scarborough Fair'),
(100060, 'The Dream Of The Dolphin'),
(100061, 'Bon Voyage'),
(100061, 'But somehow'),
(100061, 'Hide my heart'),
(100061, 'I am now'),
(100061, 'I believe in'),
(100061, 'In a world'),
(100062, 'Arabian nights'),
(100062, 'Good ways'),
(100062, 'Hotter than hot'),
(100062, 'In a lot'),
(100062, 'Like Arabian days'),
(100062, 'More often than not'),
(100063, 'Adagio Molto E Cantabile'),
(100063, 'Hilf Mir, Schwester'),
(100063, 'Nr. 8 Allegro Vivace'),
(100063, 'Nr.14'),
(100063, 'Op. 60 Allegro Vivace'),
(100063, 'Op.11'),
(100064, 'A thrilling chase'),
(100064, 'A whole new world'),
(100064, 'A wondrous place'),
(100064, 'For you and me'),
(100064, 'That'),
(100065, 'A sweep'),
(100065, 'As lucky can be'),
(100065, 'Chim chim cher-ee'),
(100065, 'Chim chiminey'),
(100065, 'Is as lucky'),
(100066, 'And send it'),
(100066, 'Fly a kite'),
(100066, 'Let Us go'),
(100066, 'Soaring'),
(100066, 'Up to the highest height'),
(100067, 'Diddle diddle'),
(100067, 'Quite atrocious'),
(100067, 'Something'),
(100067, 'Um diddle'),
(100067, 'Um diddle ay'),
(100068, 'All the voices'),
(100068, 'Blue corn moon'),
(100068, 'Cry'),
(100068, 'Grinning bobcat'),
(100068, 'Heard the wolf'),
(100068, 'Mountains'),
(100068, 'Why he grinned');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=100195 ;

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
(100064, 'Hungarian Rhapsodies, Liebestraum, Sonata', 'CD', 'Classical', 'Classic Mania', 2005, 2499, 20),
(100061, 'Symphonies Nos. 4 & 5', 'CD', 'Classical', 'Brilliant Classics', 2007, 1999, 20),
(100059, 'Sonatas Nos. 8 and 10', 'CD', 'Classical', 'RCA Red Seal', 2012, 4499, 50),
(100060, 'Symphony No. 9', 'CD', 'Classical', 'Brilliant Classics', 2007, 2099, 20),
(100063, 'Essential Chopin', 'CD', 'Classical', 'EMI Classics', 2010, 1899, 50),
(100062, 'Der Ring Des Nibelungen', 'DVD', 'Classical', 'C Major Entertainment', 2009, 2999, 30),
(100065, 'The Eight-Stringed Bach', 'CD', 'Classical', 'Accent', 2009, 999, 15),
(100066, 'Sonatas For Cello And Piano', 'CD', 'Classical', 'RCA Red Seal', 1985, 999, 10),
(100067, 'Cello Concerti Nos. 1 and 2', 'CD', 'Classical', 'CBS Masterworks', 1981, 999, 10),
(100068, 'Sonatas For Viola Da Gamba & Harpsichord', 'CD', 'Classical', 'CBS Masterworks', 1983, 999, 10);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`receiptId`, `pur_date`, `cid`, `card_number`, `expiryDate`, `expectedDate`, `deliveredDate`) VALUES
(1, '2013-08-01 12:08:09', 'boyangh@gmail.com', '1111111111111111', '0815', '2013-08-12', '2013-08-12'),
(2, '2013-08-08 00:00:00', 'limwlisa@gmail.com', '1001200230034004', '0808', '2013-08-15', '2013-08-15'),
(3, '2013-08-08 00:00:00', 'kimberlychen2011@gmail.com', '1000200030004000', '0909', '2013-08-16', '2013-08-16'),
(4, '2013-08-08 00:00:00', 'kimberleychen2011@gmail.com', '1000200030004000', '0909', '2013-08-16', '2013-08-16'),
(5, '2013-08-03 00:00:00', 'rocky.jj.he@gmail.com', '4000300020001000', '1010', '2013-08-10', '2013-08-10'),
(6, '2013-08-08 00:00:00', 'rocky.jj.he@gmail.com', '4000300020001000', '1010', '2013-08-09', '2013-08-13'),
(7, '2013-08-08 00:00:00', 'limwlisa@gmail.com', '1000200030004000', '1010', '2013-08-16', '2013-08-16');

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
(1, 100001, 10),
(2, 100005, 2),
(3, 100015, 5),
(4, 100020, 8),
(5, 100005, 20),
(6, 100003, 1),
(7, 100003, 5);

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
