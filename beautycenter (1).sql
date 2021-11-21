-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 20, 2021 at 01:57 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `beautycenter`
--

-- --------------------------------------------------------

--
-- Table structure for table `centers`
--

DROP TABLE IF EXISTS `centers`;
CREATE TABLE IF NOT EXISTS `centers` (
  `CenterID` int(11) NOT NULL AUTO_INCREMENT,
  `CenterName` varchar(800) NOT NULL,
  PRIMARY KEY (`CenterID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `centers`
--

INSERT INTO `centers` (`CenterID`, `CenterName`) VALUES
(1, 'Lady beauty centre'),
(2, 'my beauty centre');

-- --------------------------------------------------------

--
-- Table structure for table `centerservices`
--

DROP TABLE IF EXISTS `centerservices`;
CREATE TABLE IF NOT EXISTS `centerservices` (
  `CSID` int(11) NOT NULL AUTO_INCREMENT,
  `CenterID` int(11) NOT NULL,
  `ServiceID` int(11) NOT NULL,
  PRIMARY KEY (`CSID`),
  KEY `CenterID` (`CenterID`),
  KEY `ServiceID` (`ServiceID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `centerservices`
--

INSERT INTO `centerservices` (`CSID`, `CenterID`, `ServiceID`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `ReservationID` int(11) NOT NULL AUTO_INCREMENT,
  `CSID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  PRIMARY KEY (`ReservationID`),
  KEY `CSID` (`CSID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`ReservationID`, `CSID`, `UserID`) VALUES
(4, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `ServiceID` int(11) NOT NULL AUTO_INCREMENT,
  `ServiceName` varchar(800) NOT NULL,
  `Description` varchar(800) NOT NULL,
  `Price` int(11) NOT NULL,
  PRIMARY KEY (`ServiceID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`ServiceID`, `ServiceName`, `Description`, `Price`) VALUES
(1, 'hair cut', 'hair cut', 100),
(2, 'make up', 'make up', 120);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(800) NOT NULL,
  `email` varchar(800) NOT NULL,
  `Password` varchar(800) NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `FullName`, `email`, `Password`) VALUES
(1, 'test', 'test@test.com', '123');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `centerservices`
--
ALTER TABLE `centerservices`
  ADD CONSTRAINT `centerservices_ibfk_1` FOREIGN KEY (`CenterID`) REFERENCES `centers` (`CenterID`),
  ADD CONSTRAINT `centerservices_ibfk_2` FOREIGN KEY (`ServiceID`) REFERENCES `services` (`ServiceID`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`CSID`) REFERENCES `centerservices` (`CSID`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
