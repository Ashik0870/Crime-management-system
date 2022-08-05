-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2022 at 05:10 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crime`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcomplaint` ()  SELECT * FROM complaint$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `complaint_id` int(11) NOT NULL,
  `complaint_type` varchar(30) DEFAULT NULL,
  `complaint_desc` varchar(200) NOT NULL,
  `p_id` int(11) DEFAULT NULL,
  `pname` varchar(50) NOT NULL,
  `criminal_id` int(11) DEFAULT NULL,
  `cleared` tinyint(4) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`complaint_id`, `complaint_type`, `complaint_desc`, `p_id`, `pname`, `criminal_id`, `cleared`, `date`) VALUES
(16, 'Theft', 'asdfrfeed', 21, 'Anooj', NULL, 1, '0000-00-00'),
(17, 'Robbery', 'steg', 21, 'Anooj', 10, 1, '2222-02-22'),
(18, 'Robbery', 'band kithkond hoda', 25, 'pc', 5, 1, '0000-00-00'),
(19, 'Driving Under the influence', 'gudeegs', 25, 'pc', 5, 1, '2021-11-11'),
(20, 'Homicide', 'dont know', 25, 'pc', NULL, 0, '2021-02-12');

--
-- Triggers `complaint`
--
DELIMITER $$
CREATE TRIGGER `deletelog` AFTER DELETE ON `complaint` FOR EACH ROW INSERT INTO logs  VALUES(null, old.complaint_id,old.p_id, 'Deleted',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insertlog` AFTER INSERT ON `complaint` FOR EACH ROW INSERT INTO logs  VALUES(null, NEW.complaint_id,NEW.p_id, 'Inserted',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updatelog` AFTER UPDATE ON `complaint` FOR EACH ROW INSERT INTO logs values(null, new.complaint_id,new.p_id,"Updated",now())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `criminal`
--

CREATE TABLE `criminal` (
  `criminal_id` int(11) NOT NULL,
  `crime_type` varchar(50) NOT NULL,
  `criminal_name` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `criminal_add` varchar(50) NOT NULL,
  `criminal_pno` int(11) NOT NULL,
  `file_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `criminal`
--

INSERT INTO `criminal` (`criminal_id`, `crime_type`, `criminal_name`, `age`, `criminal_add`, `criminal_pno`, `file_name`) VALUES
(5, 'Burglary', 'Karthik (alias Blade Bhavani)', 38, 'asdf', 456677654, 'DSC_0007.JPG'),
(6, 'Burglary', 'Nischal (alias hack youtube)', 38, 'asdf', 456677654, 'DSC_0002.JPG'),
(7, 'Driving Under the influence', 'Tejas (alias Beeju)', 23, 'asdf', 12334345, 'DSC_0018.JPG'),
(8, 'Driving Under the influence', 'Manoj (alias Manu)', 23, 'asdf', 12334345, 'DSC_0017.JPG'),
(9, 'Robbery', 'Srinidhi (alias Ksheera Shetty)', 32, 'awsed', 123454321, 'DSC_0009.JPG'),
(10, 'Theft', 'Ravi (alias Kariya)', 32, 'sedrf', 9484, 'DSC_0153.JPG'),
(11, 'Forgery', 'chethu (alias Chuull)', 33, 'mijar', 1234567, 'DSC_0136.JPG'),
(12, 'Forgery', 'Ashik', 22, 'mijar', 12345678, 'DSC_0013.JPG');

-- --------------------------------------------------------

--
-- Table structure for table `c_crime`
--

CREATE TABLE `c_crime` (
  `crime_id` int(11) NOT NULL,
  `crime_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `c_crime`
--

INSERT INTO `c_crime` (`crime_id`, `crime_type`) VALUES
(7, 'Burglary'),
(2, 'Domestic violence'),
(3, 'Driving under the influence'),
(4, 'Forgery'),
(5, 'Homicide'),
(6, 'Kidnapping'),
(1, 'Robbery'),
(8, 'Theft');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `username`, `password`) VALUES
(1, 'Admin', 12345);

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `complaint_id` int(11) NOT NULL,
  `police_id` int(11) NOT NULL,
  `action` varchar(20) NOT NULL,
  `cdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `complaint_id`, `police_id`, `action`, `cdate`) VALUES
(1, 6, 5, 'Inserted', '2022-01-26 05:40:36'),
(2, 5, 5, 'Updated', '2022-01-26 05:43:46'),
(3, 6, 5, 'Deleted', '2022-01-26 05:46:10'),
(4, 3, 1, 'Updated', '2022-01-26 06:45:16'),
(5, 5, 6, 'Updated', '2022-01-26 06:45:22'),
(6, 3, 1, 'Updated', '2022-01-26 06:48:02'),
(7, 7, 0, 'Deleted', '2022-01-26 09:09:47'),
(9, 7, 1, 'Inserted', '2022-01-26 10:20:12'),
(10, 8, 1, 'Inserted', '2022-01-26 10:20:38'),
(11, 9, 1, 'Inserted', '2022-01-26 10:21:06'),
(12, 10, 1, 'Inserted', '2022-01-26 10:21:28'),
(13, 5, 1, 'Updated', '2022-01-26 10:22:31'),
(14, 8, 1, 'Updated', '2022-01-26 10:22:39'),
(15, 7, 1, 'Updated', '2022-01-27 00:45:07'),
(16, 9, 1, 'Updated', '2022-01-27 00:45:48'),
(17, 10, 1, 'Updated', '2022-01-27 00:49:02'),
(18, 7, 1, 'Updated', '2022-01-27 00:55:31'),
(19, 11, 14, 'Inserted', '2022-01-27 02:04:44'),
(20, 12, 14, 'Inserted', '2022-01-27 05:26:57'),
(21, 13, 16, 'Inserted', '2022-01-27 08:41:19'),
(22, 13, 16, 'Updated', '2022-01-27 08:42:07'),
(23, 5, 1, 'Updated', '2022-01-27 08:42:50'),
(24, 5, 1, 'Updated', '2022-01-27 08:43:11'),
(25, 8, 1, 'Updated', '2022-01-27 08:43:31'),
(26, 12, 14, 'Updated', '2022-01-27 09:18:44'),
(27, 11, 14, 'Updated', '2022-01-27 09:18:51'),
(28, 12, 14, 'Updated', '2022-01-27 09:19:15'),
(29, 12, 14, 'Updated', '2022-01-27 09:19:17'),
(30, 11, 16, 'Updated', '2022-01-27 10:20:58'),
(31, 1, 1, 'Deleted', '2022-01-28 21:35:24'),
(32, 2, 13, 'Updated', '2022-01-28 21:35:56'),
(33, 2, 13, 'Deleted', '2022-01-28 21:35:59'),
(34, 3, 1, 'Deleted', '2022-01-28 21:36:02'),
(35, 5, 1, 'Deleted', '2022-01-28 21:36:04'),
(36, 7, 1, 'Deleted', '2022-01-28 21:36:06'),
(37, 8, 1, 'Deleted', '2022-01-28 21:36:07'),
(38, 9, 1, 'Deleted', '2022-01-28 21:36:08'),
(39, 10, 1, 'Deleted', '2022-01-28 21:36:11'),
(40, 11, 13, 'Updated', '2022-01-28 21:36:22'),
(41, 12, 1, 'Updated', '2022-01-28 21:36:33'),
(42, 13, 15, 'Updated', '2022-01-28 21:36:47'),
(43, 11, 13, 'Deleted', '2022-01-28 21:36:52'),
(44, 12, 1, 'Deleted', '2022-01-28 21:36:54'),
(45, 13, 15, 'Deleted', '2022-01-28 21:36:55'),
(46, 15, 1, 'Inserted', '2022-01-28 21:39:13'),
(47, 15, 1, 'Updated', '2022-01-28 21:54:34'),
(48, 16, 21, 'Inserted', '2022-01-29 21:09:08'),
(49, 16, 21, 'Updated', '2022-01-29 21:22:56'),
(50, 17, 21, 'Inserted', '2022-01-29 21:28:00'),
(51, 17, 21, 'Updated', '2022-01-29 21:37:30'),
(52, 17, 21, 'Updated', '2022-01-30 04:20:12'),
(53, 18, 25, 'Inserted', '2022-01-30 09:59:09'),
(54, 19, 25, 'Inserted', '2022-01-30 10:01:47'),
(55, 18, 25, 'Updated', '2022-01-30 10:03:12'),
(56, 18, 25, 'Updated', '2022-01-30 10:13:41'),
(57, 19, 25, 'Updated', '2022-01-30 10:29:12'),
(58, 19, 25, 'Updated', '2022-01-30 10:29:15'),
(59, 20, 25, 'Inserted', '2022-01-30 10:31:36'),
(60, 15, 21, 'Updated', '2022-01-30 10:35:32'),
(61, 15, 21, 'Deleted', '2022-01-30 10:35:37');

-- --------------------------------------------------------

--
-- Table structure for table `logss`
--

CREATE TABLE `logss` (
  `id` int(11) NOT NULL,
  `police_id` int(11) NOT NULL,
  `police_name` varchar(30) NOT NULL,
  `action` varchar(20) NOT NULL,
  `cdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `logss`
--

INSERT INTO `logss` (`id`, `police_id`, `police_name`, `action`, `cdate`) VALUES
(5, 1, 'admin', 'Updated', '2022-01-26 09:52:52'),
(6, 10, 'Anooj', 'Deleted', '2022-01-26 09:59:59'),
(7, 11, 'adminas', 'Deleted', '2022-01-26 10:13:44'),
(8, 12, 'admina', 'Deleted', '2022-01-26 10:14:18'),
(9, 1, 'admin', 'Updated', '2022-01-26 10:19:53'),
(10, 16, 'chul', 'Updated', '2022-01-27 08:40:39'),
(11, 14, 'pc', 'Deleted', '2022-01-27 10:16:03'),
(12, 1, 'admin', 'Updated', '2022-01-27 10:54:41'),
(13, 1, 'admin', 'Updated', '2022-01-27 11:01:01'),
(14, 15, 'chandru', 'Updated', '2022-01-27 11:11:14'),
(15, 17, 'Abhi', 'Deleted', '2022-01-28 02:05:52'),
(16, 1, 'admin', 'Updated', '2022-01-28 02:06:46'),
(17, 16, 'chul', 'Deleted', '2022-01-28 21:05:28'),
(18, 15, 'chandru', 'Updated', '2022-01-29 01:46:29'),
(19, 15, 'chandru', 'Updated', '2022-01-29 01:47:00'),
(20, 20, 'madhu', 'Deleted', '2022-01-29 07:13:55'),
(21, 19, 'ganesh', 'Deleted', '2022-01-29 07:14:00'),
(22, 18, 'Ravi', 'Deleted', '2022-01-29 07:14:02'),
(23, 15, 'chandru', 'Deleted', '2022-01-29 07:14:05'),
(24, 13, 'Anooj', 'Deleted', '2022-01-29 07:14:07'),
(25, 1, 'admin', 'Deleted', '2022-01-29 07:14:10'),
(26, 21, 'anooj', 'Updated', '2022-01-29 11:18:27'),
(27, 21, 'anooj', 'Updated', '2022-01-29 11:21:25'),
(28, 21, 'anooj', 'Updated', '2022-01-29 11:36:38'),
(29, 22, 'shree', 'Updated', '2022-01-29 12:22:54'),
(30, 22, 'shree', 'Deleted', '2022-01-29 12:23:37'),
(31, 21, 'anooj', 'Updated', '2022-01-29 12:24:56'),
(32, 24, 'nis', 'Updated', '2022-01-29 12:37:32'),
(33, 23, 'yt', 'Deleted', '2022-01-30 04:30:41'),
(34, 25, 'pc', 'Updated', '2022-01-30 09:23:24'),
(35, 25, 'poorna chandra', 'Updated', '2022-01-30 09:33:10'),
(36, 25, 'poorna chandra', 'Updated', '2022-01-30 09:37:35'),
(37, 25, 'poorna chandra', 'Updated', '2022-01-30 09:39:57'),
(38, 25, 'poorna chandra', 'Updated', '2022-01-30 09:47:12'),
(39, 25, 'poorna chandra', 'Updated', '2022-01-30 09:48:39'),
(40, 21, 'anooj', 'Updated', '2022-02-07 09:38:49');

-- --------------------------------------------------------

--
-- Table structure for table `u_login`
--

CREATE TABLE `u_login` (
  `u_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `join_date` date NOT NULL,
  `age` int(11) NOT NULL,
  `user_mob` varchar(11) NOT NULL,
  `user_mail` varchar(50) NOT NULL,
  `user_address` varchar(50) NOT NULL,
  `file_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `u_login`
--

INSERT INTO `u_login` (`u_id`, `username`, `password`, `join_date`, `age`, `user_mob`, `user_mail`, `user_address`, `file_name`) VALUES
(21, 'anooj', '12345', '2022-01-03', 32, '98765432', 'q@gmail.com', 'mijar', ''),
(24, 'nis', '12345', '2222-02-22', 23, '233', 'yenne@gmail.com', 'ed', 'image2.jpg'),
(25, 'poorna chandra', 'asdf', '0000-00-00', 32, '1234565432', 'manoharm143pa@gmail.com', 'thodar', ''),
(26, 'Chandru', '12345', '2222-02-22', 23, '2147483647', 'hra72020@cub', 'Malagalu, cheeranakupee', NULL),
(27, 'Takla', '12345', '2222-02-22', 33, '2147483647', 'yenne@gmail.com', 'Malagalu, cheeranakupee', NULL),
(28, 'Shrinidhi', '12345', '2019-05-05', 43, '1234567890', 'yenne@gmail.com', 'awsedr', NULL),
(29, 'chandrushekar', '12345', '2001-03-22', 43, '1234554321', 'hra72020@gmail.com', 'qwerty', NULL);

--
-- Triggers `u_login`
--
DELIMITER $$
CREATE TRIGGER `deletelogss` AFTER DELETE ON `u_login` FOR EACH ROW INSERT INTO logss  VALUES(null, OLD.u_id,OLD.username, 'Deleted',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updatelogss` AFTER UPDATE ON `u_login` FOR EACH ROW INSERT INTO logss  VALUES(null, NEW.u_id,NEW.username, 'Updated',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `victim`
--

CREATE TABLE `victim` (
  `victim_id` int(11) NOT NULL,
  `victim_name` varchar(50) NOT NULL,
  `victim_pno` int(11) NOT NULL,
  `victim_add` varchar(50) NOT NULL,
  `vcomplaint_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `victim`
--

INSERT INTO `victim` (`victim_id`, `victim_name`, `victim_pno`, `victim_add`, `vcomplaint_id`) VALUES
(1, 'Small', 123454321, 'asedsf', NULL),
(2, 'qas', 23, 'ss', NULL),
(3, 'pra', 1234, 'qwse', NULL),
(5, '', 0, '', NULL),
(6, 'manoj', 654321234, 'mijar', NULL),
(7, 'anooj', 123, 'awse', NULL),
(8, 'chinmaya', 12332, 'tets', NULL),
(9, 'muthalik', 123456, 'asedrftg', 16),
(10, 'chandan', 1234231, 'mijar', 17),
(11, 'Manoja', 123454321, 'thodar', 18),
(12, 'abhi', 123, 'thum', 19),
(13, 'abhitakla', 123432, 'Davangere', 20);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`complaint_id`),
  ADD KEY `complaint_type` (`complaint_type`),
  ADD KEY `complaint_ibfk_1` (`p_id`),
  ADD KEY `complaint_ibfk_2` (`criminal_id`);

--
-- Indexes for table `criminal`
--
ALTER TABLE `criminal`
  ADD PRIMARY KEY (`criminal_id`),
  ADD KEY `crime_type` (`crime_type`);

--
-- Indexes for table `c_crime`
--
ALTER TABLE `c_crime`
  ADD PRIMARY KEY (`crime_type`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logss`
--
ALTER TABLE `logss`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `u_login`
--
ALTER TABLE `u_login`
  ADD PRIMARY KEY (`u_id`);

--
-- Indexes for table `victim`
--
ALTER TABLE `victim`
  ADD PRIMARY KEY (`victim_id`),
  ADD KEY `vcomplaint_id` (`vcomplaint_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `complaint_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `criminal`
--
ALTER TABLE `criminal`
  MODIFY `criminal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `logss`
--
ALTER TABLE `logss`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `u_login`
--
ALTER TABLE `u_login`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `victim`
--
ALTER TABLE `victim`
  MODIFY `victim_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `complaint`
--
ALTER TABLE `complaint`
  ADD CONSTRAINT `complaint_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `u_login` (`u_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `complaint_ibfk_2` FOREIGN KEY (`criminal_id`) REFERENCES `criminal` (`criminal_id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `criminal`
--
ALTER TABLE `criminal`
  ADD CONSTRAINT `criminal_ibfk_1` FOREIGN KEY (`crime_type`) REFERENCES `c_crime` (`crime_type`) ON DELETE CASCADE;

--
-- Constraints for table `victim`
--
ALTER TABLE `victim`
  ADD CONSTRAINT `victim_ibfk_1` FOREIGN KEY (`vcomplaint_id`) REFERENCES `complaint` (`complaint_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
