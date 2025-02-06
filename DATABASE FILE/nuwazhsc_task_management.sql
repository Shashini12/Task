-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 30, 2025 at 03:48 AM
-- Server version: 10.6.20-MariaDB-cll-lve-log
-- PHP Version: 8.3.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nuwazhsc_task_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance_info`
--

CREATE TABLE `attendance_info` (
  `aten_id` int(20) NOT NULL,
  `atn_user_id` int(20) NOT NULL,
  `in_time` varchar(200) DEFAULT NULL,
  `out_time` varchar(150) DEFAULT NULL,
  `total_duration` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `attendance_info`
--

INSERT INTO `attendance_info` (`aten_id`, `atn_user_id`, `in_time`, `out_time`, `total_duration`) VALUES
(43, 1, '05-08-2024 15:02:12', NULL, NULL),
(44, 30, '13-08-2024 08:18:30', '16-08-2024 16:05:18', '07:46:48'),
(45, 45, '13-08-2024 08:55:10', '13-08-2024 08:55:16', '00:00:06'),
(46, 34, '13-08-2024 11:20:26', '31-12-2024 16:07:36', '04:47:10'),
(48, 28, '14-08-2024 09:57:56', '14-08-2024 16:14:33', '06:16:37'),
(49, 35, '14-08-2024 10:04:47', '14-08-2024 16:40:22', '06:35:35'),
(50, 32, '14-08-2024 10:05:18', '15-08-2024 16:29:16', '06:23:58'),
(51, 28, '15-08-2024 10:05:34', '23-08-2024 11:27:01', '01:21:27'),
(52, 35, '16-08-2024 09:09:32', '16-08-2024 16:38:25', '07:28:53'),
(53, 32, '16-08-2024 09:09:59', '16-08-2024 16:39:03', '07:29:04'),
(54, 41, '17-08-2024 09:39:34', '17-08-2024 09:39:45', '00:00:11'),
(55, 45, '20-08-2024 16:19:36', '20-08-2024 16:19:40', '00:00:04'),
(56, 28, '23-08-2024 11:27:05', '28-08-2024 14:27:53', '03:00:48'),
(57, 47, '23-08-2024 12:12:40', '23-08-2024 12:12:47', '00:00:07'),
(58, 41, '02-09-2024 09:20:07', NULL, NULL),
(59, 40, '07-09-2024 07:02:07', '07-09-2024 07:02:23', '00:00:16'),
(62, 42, '06-10-2024 19:16:47', '29-01-2025 09:58:25', '14:41:38'),
(68, 42, '29-01-2025 09:58:33', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `task_info`
--

CREATE TABLE `task_info` (
  `task_id` int(50) NOT NULL,
  `t_title` varchar(120) NOT NULL,
  `t_description` text DEFAULT NULL,
  `t_start_time` varchar(100) DEFAULT NULL,
  `t_end_time` varchar(100) DEFAULT NULL,
  `t_user_id` int(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0 = incomplete, 1 = In progress, 2 = complete'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `task_info`
--

INSERT INTO `task_info` (`task_id`, `t_title`, `t_description`, `t_start_time`, `t_end_time`, `t_user_id`, `status`) VALUES
(104, 'complete configuration of e library', '', '2025-01-27 12:00', '2025-01-31 12:00', 45, 1),
(105, 'a code manual for MSDFAR', 'Start today', '2025-01-28 12:00', '2025-02-15 12:00', 33, 1),
(106, 'Arrange training for all district users of msdfar', 'Discussed with Ms Thilini', '2025-01-27 12:00', '2025-01-29 12:00', 35, 1),
(107, 'update district wize statistics in the web site', 'need to update the number of bots, fishermen, etc acoording to the details available in mSDFAR', '2025-01-28 12:00', '2025-01-30 12:00', 36, 2),
(108, 'need to send a formal letter with DG signature on the issues of second screen', '', '2025-01-28 12:00', '2025-01-29 12:00', 37, 0),
(109, 'QA the leave system with Buddika and apsara', '', '2025-01-27 12:00', '2025-01-31 12:00', 38, 0),
(110, 'VMS eke file list ekak hadanna', 'Photo copy gasema, lipi ragena yama', '2025-01-28 08:00', '2025-01-29 16:15', 39, 0),
(111, 'Update the roster duties regularly', '', '2025-01-01 12:00', '', 40, 0),
(112, 'Update the roster duties regularly', '', '2025-01-01 12:00', '', 41, 0),
(113, 'Update the roster duties regularly', 'Send the Report to the Hish Sea unit\r\nCheck the Border Crossing Vessels and send the investigation Unit\r\nCheck DDistress Vessels\r\nCheck the fuel and Test run the Generator.', '2025-01-28 08:45', '2025-01-29 09:00', 42, 1),
(114, 'Update the roster duties regularly', '', '2025-01-01 12:00', '', 53, 0),
(115, 'Update the roster duties regularly', '', '2025-01-01 12:00', '', 55, 0),
(116, 'prepare a letter to Director development on MEA training', '', '2025-01-27 12:00', '2025-01-28 12:00', 54, 2),
(117, 'update the inquiry system to add monthly summery', 'Completed integrate monthly summary of Inquiry system.', '2025-01-27 12:00', '2025-01-30 12:00', 45, 2),
(118, 'complete the special licenses system', '', '2025-01-15 12:00', '2025-02-07 12:00', 47, 0),
(119, 'update the OT system', '', '2025-01-27 12:00', '2025-02-03 12:00', 51, 1),
(120, 'complete the leave system', '', '2025-01-27 12:00', '2025-01-15 12:00', 51, 1),
(121, 'compete the leave system', '', '2025-01-27 12:00', '2025-01-15 12:00', 52, 1),
(122, 'absorb all development knowledge of online departure system', '', '2025-01-27 12:00', '2025-01-21 12:00', 52, 1),
(123, 'උපදෙස් සබැදිය (link not working)', 'ඔබ දියගො-ගර්සියා (BIOT) මුහුදු කලාපය හරහා ගමන් කිරීමට අදහස් කරන්නේ නම් අනිවාර්යයෙන් පහත උපදෙස් අනුව අනිවාර්යයෙන් කටයුතු කල යුතුය.\r\nඋපදෙස් සබැදිය (link not working)', '2025-01-28 12:00', '2025-01-28 12:00', 52, 2),
(124, 'උපදෙස් සබැදිය (link not working) in departure system interface', 'Get the details from Mr.Niroshana and publish the page and done', '2025-01-28 12:00', '2025-01-28 12:00', 33, 2),
(63, 'Monthly progress report on MSDFAR to Dr Steve', 'August report sent\r\nSeptember report sent', '2024-09-10 12:00', '2024-09-12 12:00', 30, 1),
(98, 'Action plan for IT division', 'prepare and submit to DGs approval with my signature', '2025-01-01 12:00', '2025-01-29 12:00', 48, 0),
(99, 'user Mannual for all related activities in MSDFAR', '', '2025-01-01 12:00', '2025-02-07 12:00', 49, 0),
(100, 'Tab list', 'Finalize the tab user list \r\ninclude all users in the tab whatapp group', '2025-01-27 12:00', '2025-01-31 12:00', 28, 1),
(101, 'compete cloud migration', '', '2025-01-01 12:00', '2025-01-31 12:00', 30, 1),
(102, 'complete configuration of e library', 'Working on it with Chamara', '2025-01-01 12:00', '2025-01-31 12:00', 31, 1),
(103, 'division eke task board eka update karanna', '', '2025-01-27 12:00', '2025-01-30 12:00', 32, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `user_id` int(20) NOT NULL,
  `fullname` varchar(120) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `temp_password` varchar(100) DEFAULT NULL,
  `user_role` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`user_id`, `fullname`, `username`, `email`, `password`, `temp_password`, `user_role`) VALUES
(1, 'Admin', 'Nuwan', 'nuwan.dfar@gmail.com', 'b21766768ab4fe441c7986f7b64c4d3e', NULL, 1),
(29, 'Suneth Ranatunga', 'Suneth', 'sunethranatunga@gmail.com', 'dc56942a9018dd1d9243ec0ebfe4e0c6', '', 2),
(28, 'Sithara Jayaweera', 'Sithara', 'sithara.dfar@gmail.com', '8fa836175e81f535462662300b0f77b7', '', 2),
(30, 'Vimukthi Udith', 'Vimukthi', 'vimukthi.dfar@gmail.com', '426c471048bfdd4f4007da98b92ccac5', '', 2),
(31, 'Arjuna Mendis', 'Arjuna', 'namendis84@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', '', 2),
(32, 'Chathura Maduranga', 'Chathura', 'kadchathuramaduranga@gmail.com', '3817157c9127b4cdb7a8d690ee72d874', '', 2),
(33, 'Vishwa Boteju', 'Vishwa', 'dfar.icto@gmail.com', '5e05f47d9408a87fa8d9616d41ce4ec7', '', 2),
(34, 'Madhuwanthi Thathsarani', 'Madhuwanthi', 'madhuwanthi.dfar@gmail.com', 'e807f1fcf82d132f9bb018ca6738a19f', '', 2),
(35, 'Dinusha Madushani', 'Dinusha', 'dinusha.dfar@gmail.com', 'f18224a1adfb7b3dbff668c9b655a35a', '', 2),
(36, 'Nuwanthika Jayasinghe', 'Nuwanthika', 'nuwanthika.dfar@gmail.com', 'b1ac656a0aa5f37216e4e30d34d866a6', '', 2),
(37, 'Niluka Priyadarshani', 'Niluka', 'niluka@gmail.com', '974aeb0715c77e444aaa774096412437', '', 2),
(38, 'Amali Dissanayake', 'Amali', 'amali@gmail.com', 'c693f0a6ec59eef67b0537b955884d08', '', 2),
(39, 'Savani Suwimali', 'Savani', 'savani@gmail.com', '40f4964016e2ca2a1458899d023d8c6c', '', 2),
(40, 'Roster_Lalantha Rathnayaka', 'Lalantha', 'lalantha@gmail.com', 'f7237b56e62554535de61b1e2ecd1439', '', 2),
(41, 'Roster_Geeth Prasantha', 'Geeth', 'geeth@gmail.com', '2b57d61fa2a528f49b28ce634cf5ac95', '', 2),
(42, 'Roster_Chameera Perera', 'Chameera', 'chameera@gmail.com', '86ddcb9089d8672d26ef21e8111fa143', '', 2),
(54, 'Warunika R S', 'Warunika', 'ruwanpathiranashashini1@gmail.com', '5f6fe38a22a9579a13e9d9d8152f35b6', '', 2),
(44, 'Sasini', 'Sasini', 'sasinistela@gmail.com', 'd884fd2b7048b2b3f3892d0d43ec4c63', '', 2),
(45, 'Chamara', 'Chamara', 'chamarabandara983@gmail.com', '0a8cfb741521f7e1ffae0b5363973b28', '', 2),
(47, 'Kulunu Vidanage', 'kulunu', 'kulunuvidanage@gmail.com', '7ac3f9bf4d0d98d35214668f507239d3', '', 2),
(48, 'Thilini Nawagamuwa', 'Thilini', 'thilininawagamuwa@gmail.com', 'a449d2a440ef65523a36546e2776042d', '', 2),
(49, 'Dinushika Liyanage', 'Dinushika', 'liyanagedinushika@gmail.com', 'b39541bafa656b6391d2668755e042f2', '', 2),
(51, 'Buddhika Ayeshani', 'Buddhika', 'buddika.dfar@gmail.com', '3fe1133a03c957b87abe60153affd34d', '', 2),
(52, 'P.A.N.N. Apsara', 'Nishadi', 'nishadi.dfar@gmail.com', 'bfca24079a4fcf8c9180bcc147ec9774', '', 2),
(53, 'Roster_P.G.S. Sanjeewa', 'Sanjeewa', 'sanjeewa.dfar@gmail.com', '71f7ffb9efce7335def4a1f8718369f7', '3979489', 2),
(55, 'Roster_D.R.Weerakoon', 'Dulitha', 'dulithaweerakoon@gmail.com', '6ee8f97d501cc79d04bd90ccfe6d18a0', '', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance_info`
--
ALTER TABLE `attendance_info`
  ADD PRIMARY KEY (`aten_id`);

--
-- Indexes for table `task_info`
--
ALTER TABLE `task_info`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance_info`
--
ALTER TABLE `attendance_info`
  MODIFY `aten_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `task_info`
--
ALTER TABLE `task_info`
  MODIFY `task_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `user_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
