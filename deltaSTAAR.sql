-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2023 at 01:37 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `deltastaar`
--

-- --------------------------------------------------------

--
-- Table structure for table `accomodation`
--

CREATE TABLE `accomodation` (
  `acc_id` int(11) NOT NULL,
  `acc_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `acc_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bldg_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` int(11) DEFAULT NULL,
  `gender` enum('Male','Female','Unisex') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tot_capacity` int(11) DEFAULT NULL,
  `no_of_rooms` int(11) NOT NULL,
  `occupied_rooms` int(11) DEFAULT NULL,
  `available_rooms` int(11) DEFAULT NULL,
  `warden_emp_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `acc_locations`
--

CREATE TABLE `acc_locations` (
  `loc_id` int(11) NOT NULL,
  `location` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Triggers `acc_locations`
--
DELIMITER $$
CREATE TRIGGER `update_bldg_status` BEFORE DELETE ON `acc_locations` FOR EACH ROW BEGIN
      UPDATE accomodation 
      SET accomodation.bldg_status = "Closed" 
      WHERE location = old.loc_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `active_sessions`
--

CREATE TABLE `active_sessions` (
  `emp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `change_tracking_accomodation`
--

CREATE TABLE `change_tracking_accomodation` (
  `id` int(11) NOT NULL,
  `user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` enum('Delete','Update','Insert') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acc_id` int(11) NOT NULL,
  `acc_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `acc_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bldg_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` int(11) DEFAULT NULL,
  `gender` enum('Male','Female','Unisex') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tot_capacity` int(11) DEFAULT NULL,
  `no_of_rooms` int(11) NOT NULL,
  `occupied_rooms` int(11) DEFAULT NULL,
  `available_rooms` int(11) DEFAULT NULL,
  `warden_emp_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `change_tracking_acc_locations`
--

CREATE TABLE `change_tracking_acc_locations` (
  `id` int(11) NOT NULL,
  `user` varchar(255) DEFAULT NULL,
  `type` enum('Delete','Update','Insert') DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `loc_id` int(11) NOT NULL,
  `location` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `change_tracking_complaints`
--

CREATE TABLE `change_tracking_complaints` (
  `id` int(11) NOT NULL,
  `user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` enum('Delete','Update','Insert') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `complaint_id` int(11) NOT NULL,
  `raise_timestamp` timestamp NULL DEFAULT NULL,
  `complaint_type` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tech_pending_timestamp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tech_closure_timestamp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sec_closure_timestamp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warden_closure_timestamp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emp_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acc_id` int(11) DEFAULT NULL,
  `acc_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `change_tracking_complaint_type`
--

CREATE TABLE `change_tracking_complaint_type` (
  `id` int(11) NOT NULL,
  `user` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` enum('Delete','Update','Insert') DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  `complaint_type` varchar(20) DEFAULT NULL,
  `type_description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `change_tracking_employee`
--

CREATE TABLE `change_tracking_employee` (
  `id` int(11) NOT NULL,
  `user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` enum('Delete','Update','Insert') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emp_id` int(11) NOT NULL,
  `emp_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` int(11) NOT NULL,
  `dob` date NOT NULL,
  `contact` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pincode` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  `blood_group` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `aadhaar_number` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` float DEFAULT NULL,
  `room_id` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `change_tracking_employee_dept`
--

CREATE TABLE `change_tracking_employee_dept` (
  `id` int(11) NOT NULL,
  `user` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` enum('Delete','Update','Insert') DEFAULT NULL,
  `dept_id` int(11) NOT NULL,
  `dept_name` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `change_tracking_employee_designation`
--

CREATE TABLE `change_tracking_employee_designation` (
  `id` int(11) NOT NULL,
  `user` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` enum('Delete','Update','Insert') DEFAULT NULL,
  `desig_id` int(11) NOT NULL,
  `designation` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `change_tracking_employee_outing`
--

CREATE TABLE `change_tracking_employee_outing` (
  `id` int(11) NOT NULL,
  `user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` enum('Delete','Update','Insert') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emp_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approval` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `outing_date` date NOT NULL,
  `arrival_date` date DEFAULT NULL,
  `category` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `outing_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `change_tracking_jobs`
--

CREATE TABLE `change_tracking_jobs` (
  `id` int(11) NOT NULL,
  `user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` enum('Delete','Update','Insert') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jobs_id` int(11) NOT NULL,
  `complaint_id` int(11) NOT NULL,
  `technician_id` int(11) NOT NULL,
  `raise_timestamp` date NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `completion_date` date DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warden_emp_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `change_tracking_living_history`
--

CREATE TABLE `change_tracking_living_history` (
  `emp_code` varchar(10) NOT NULL,
  `history` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`history`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `change_tracking_rooms`
--

CREATE TABLE `change_tracking_rooms` (
  `id` int(11) NOT NULL,
  `user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` enum('Delete','Update','Insert') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acc_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `room_no` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_capacity` int(11) NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_room_occupancy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `change_tracking_tankers`
--

CREATE TABLE `change_tracking_tankers` (
  `id` int(11) NOT NULL,
  `user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` enum('Delete','Update','Insert') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanker_id` int(11) NOT NULL,
  `acc_id` int(11) NOT NULL,
  `security_emp_id` int(11) NOT NULL,
  `quality_check` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `bill_no` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` float NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `tanker_timestamp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `change_tracking_vaccination`
--

CREATE TABLE `change_tracking_vaccination` (
  `id` int(11) NOT NULL,
  `user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` enum('Delete','Update','Insert') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vaccination_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `emp_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `date_of_administration` date DEFAULT NULL,
  `location` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_next_dose` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `change_tracking_visitor_log`
--

CREATE TABLE `change_tracking_visitor_log` (
  `id` int(11) NOT NULL,
  `user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` enum('Delete','Update','Insert') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `log_id` int(11) NOT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `security_emp_id` int(11) NOT NULL,
  `acc_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visitor_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicle_no` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visit_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `check_in` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `check_out` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `purpose` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` int(11) NOT NULL,
  `raise_timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tech_pending_timestamp` timestamp NULL DEFAULT NULL,
  `tech_closure_timestamp` timestamp NULL DEFAULT NULL,
  `sec_closure_timestamp` timestamp NULL DEFAULT NULL,
  `warden_closure_timestamp` timestamp NULL DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emp_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acc_id` int(11) DEFAULT NULL,
  `acc_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complaint_type`
--

CREATE TABLE `complaint_type` (
  `type_id` int(11) NOT NULL,
  `complaint_type` varchar(20) DEFAULT NULL,
  `type_description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL,
  `emp_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` int(11) NOT NULL,
  `dob` date NOT NULL,
  `contact` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pincode` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  `blood_group` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `aadhaar_number` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` float DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `role` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_dept`
--

CREATE TABLE `employee_dept` (
  `dept_id` int(11) NOT NULL,
  `dept_name` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `employee_designation`
--

CREATE TABLE `employee_designation` (
  `id` int(11) NOT NULL,
  `designation` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `employee_outing`
--

CREATE TABLE `employee_outing` (
  `emp_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approval` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `outing_date` date NOT NULL,
  `arrival_date` date DEFAULT NULL,
  `category` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `complaint_id` int(11) NOT NULL,
  `technician_id` int(11) DEFAULT NULL,
  `raise_timestamp` date NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tentative_date` date DEFAULT NULL,
  `completion_date` date DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warden_emp_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `last_dose`
-- (See below for the actual view)
--
CREATE TABLE `last_dose` (
`vaccination_id` int(11)
,`emp_id` int(11)
,`category_id` int(11)
,`date_of_administration` date
,`location` varchar(50)
,`date_of_next_dose` date
);

-- --------------------------------------------------------

--
-- Table structure for table `login_credentials`
--

CREATE TABLE `login_credentials` (
  `emp_id` int(11) NOT NULL,
  `pass` varchar(255) NOT NULL DEFAULT '5f4dcc3b5aa765d61d8327deb882cf99'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `login_history`
--

CREATE TABLE `login_history` (
  `emp_id` int(11) DEFAULT NULL,
  `user` text DEFAULT NULL,
  `login_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `logout_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `outing_type`
--

CREATE TABLE `outing_type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rights`
--

CREATE TABLE `rights` (
  `id` int(11) NOT NULL,
  `accomodation` enum('0','1','2','3','5','6','4','7') NOT NULL DEFAULT '0',
  `complaints` enum('0','1','2','3','5','6','4','7') NOT NULL DEFAULT '0',
  `employee_details` enum('0','1','2','3','5','6','4','7') NOT NULL DEFAULT '0',
  `employee_outing` enum('0','1','2','3','5','6','4','7') NOT NULL DEFAULT '0',
  `roles` enum('0','1','2','3','5','6','4','7') NOT NULL DEFAULT '0',
  `rooms` enum('0','1','2','3','5','6','4','7') NOT NULL DEFAULT '0',
  `tankers` enum('0','1','2','3','5','6','4','7') NOT NULL DEFAULT '0',
  `jobs` enum('0','1','2','3','5','6','4','7') NOT NULL DEFAULT '0',
  `vaccination` enum('0','1','2','3','5','6','4','7') NOT NULL DEFAULT '0',
  `vaccination_category` enum('0','1','2','3','5','6','4','7') NOT NULL DEFAULT '0',
  `visitor_log` enum('0','1','2','3','5','6','4','7') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rights` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `acc_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `room_no` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_capacity` int(11) NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_room_occupancy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `security`
--

CREATE TABLE `security` (
  `emp_id` int(11) NOT NULL,
  `acc_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tankers`
--

CREATE TABLE `tankers` (
  `id` int(11) NOT NULL,
  `acc_id` int(11) NOT NULL,
  `security_emp_id` int(11) NOT NULL,
  `quality_check` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `bill_no` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` float NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tanker_vendors`
--

CREATE TABLE `tanker_vendors` (
  `id` int(11) NOT NULL,
  `vname` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `number` varchar(13) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `time_stamp` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `technician`
--

CREATE TABLE `technician` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vaccination`
--

CREATE TABLE `vaccination` (
  `vaccination_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `emp_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `date_of_administration` date DEFAULT NULL,
  `location` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_next_dose` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vaccination_category`
--

CREATE TABLE `vaccination_category` (
  `category_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_log`
--

CREATE TABLE `visitor_log` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `security_emp_id` int(11) NOT NULL,
  `acc_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visitor_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicle_no` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `check_in` timestamp NULL DEFAULT current_timestamp(),
  `check_out` timestamp NULL DEFAULT NULL,
  `purpose` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure for view `last_dose`
--
DROP TABLE IF EXISTS `last_dose`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `last_dose`  AS   (select `v1`.`vaccination_id` AS `vaccination_id`,`v1`.`emp_id` AS `emp_id`,`v1`.`category_id` AS `category_id`,`v1`.`date_of_administration` AS `date_of_administration`,`v1`.`location` AS `location`,`v1`.`date_of_next_dose` AS `date_of_next_dose` from (`vaccination` `v1` left join `vaccination` `v2` on(`v1`.`emp_id` = `v2`.`emp_id` and `v1`.`date_of_administration` < `v2`.`date_of_administration`)) where `v2`.`emp_id` is null)  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accomodation`
--
ALTER TABLE `accomodation`
  ADD PRIMARY KEY (`acc_id`),
  ADD UNIQUE KEY `acc_code` (`acc_code`),
  ADD KEY `accomodation_ibfk_1` (`warden_emp_code`),
  ADD KEY `fk_acc_loc` (`location`);

--
-- Indexes for table `acc_locations`
--
ALTER TABLE `acc_locations`
  ADD PRIMARY KEY (`loc_id`);

--
-- Indexes for table `active_sessions`
--
ALTER TABLE `active_sessions`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `change_tracking_accomodation`
--
ALTER TABLE `change_tracking_accomodation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `login` (`user`);

--
-- Indexes for table `change_tracking_acc_locations`
--
ALTER TABLE `change_tracking_acc_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `login` (`user`);

--
-- Indexes for table `change_tracking_complaints`
--
ALTER TABLE `change_tracking_complaints`
  ADD PRIMARY KEY (`id`),
  ADD KEY `login` (`user`);

--
-- Indexes for table `change_tracking_complaint_type`
--
ALTER TABLE `change_tracking_complaint_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `login` (`user`);

--
-- Indexes for table `change_tracking_employee`
--
ALTER TABLE `change_tracking_employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `change_tracking_employee_dept`
--
ALTER TABLE `change_tracking_employee_dept`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `change_tracking_employee_designation`
--
ALTER TABLE `change_tracking_employee_designation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `change_tracking_employee_outing`
--
ALTER TABLE `change_tracking_employee_outing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `change_tracking_jobs`
--
ALTER TABLE `change_tracking_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `change_tracking_living_history`
--
ALTER TABLE `change_tracking_living_history`
  ADD PRIMARY KEY (`emp_code`);

--
-- Indexes for table `change_tracking_rooms`
--
ALTER TABLE `change_tracking_rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `change_tracking_tankers`
--
ALTER TABLE `change_tracking_tankers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `change_tracking_vaccination`
--
ALTER TABLE `change_tracking_vaccination`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `change_tracking_visitor_log`
--
ALTER TABLE `change_tracking_visitor_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`),
  ADD KEY `emp_code` (`emp_code`),
  ADD KEY `acc_id` (`acc_id`);

--
-- Indexes for table `complaint_type`
--
ALTER TABLE `complaint_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`),
  ADD UNIQUE KEY `emp_code` (`emp_code`),
  ADD KEY `role` (`role`),
  ADD KEY `designation` (`designation`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `fk_emp_dept` (`department`);

--
-- Indexes for table `employee_dept`
--
ALTER TABLE `employee_dept`
  ADD PRIMARY KEY (`dept_id`);

--
-- Indexes for table `employee_designation`
--
ALTER TABLE `employee_designation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_outing`
--
ALTER TABLE `employee_outing`
  ADD KEY `emp_id` (`emp_code`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_ibfk_1` (`complaint_id`),
  ADD KEY `technician_id` (`technician_id`),
  ADD KEY `warden_emp_code` (`warden_emp_code`);

--
-- Indexes for table `login_credentials`
--
ALTER TABLE `login_credentials`
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `login_history`
--
ALTER TABLE `login_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `outing_type`
--
ALTER TABLE `outing_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `rights`
--
ALTER TABLE `rights`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`),
  ADD KEY `rights` (`rights`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `acc_id` (`acc_id`);

--
-- Indexes for table `security`
--
ALTER TABLE `security`
  ADD KEY `acc_id` (`acc_id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `tankers`
--
ALTER TABLE `tankers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `security_emp_id` (`security_emp_id`),
  ADD KEY `acc_id` (`acc_id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `tanker_vendors`
--
ALTER TABLE `tanker_vendors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `technician`
--
ALTER TABLE `technician`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `vaccination`
--
ALTER TABLE `vaccination`
  ADD PRIMARY KEY (`vaccination_id`),
  ADD KEY `emp_id` (`emp_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `vaccination_category`
--
ALTER TABLE `vaccination_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `visitor_log`
--
ALTER TABLE `visitor_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `security_emp_id` (`security_emp_id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accomodation`
--
ALTER TABLE `accomodation`
  MODIFY `acc_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `acc_locations`
--
ALTER TABLE `acc_locations`
  MODIFY `loc_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `change_tracking_accomodation`
--
ALTER TABLE `change_tracking_accomodation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `change_tracking_acc_locations`
--
ALTER TABLE `change_tracking_acc_locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `change_tracking_complaints`
--
ALTER TABLE `change_tracking_complaints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `change_tracking_complaint_type`
--
ALTER TABLE `change_tracking_complaint_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `change_tracking_employee`
--
ALTER TABLE `change_tracking_employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `change_tracking_employee_dept`
--
ALTER TABLE `change_tracking_employee_dept`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `change_tracking_employee_designation`
--
ALTER TABLE `change_tracking_employee_designation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `change_tracking_employee_outing`
--
ALTER TABLE `change_tracking_employee_outing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `change_tracking_jobs`
--
ALTER TABLE `change_tracking_jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `change_tracking_rooms`
--
ALTER TABLE `change_tracking_rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `change_tracking_tankers`
--
ALTER TABLE `change_tracking_tankers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `change_tracking_vaccination`
--
ALTER TABLE `change_tracking_vaccination`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `change_tracking_visitor_log`
--
ALTER TABLE `change_tracking_visitor_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complaint_type`
--
ALTER TABLE `complaint_type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_dept`
--
ALTER TABLE `employee_dept`
  MODIFY `dept_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_designation`
--
ALTER TABLE `employee_designation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_history`
--
ALTER TABLE `login_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `outing_type`
--
ALTER TABLE `outing_type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rights`
--
ALTER TABLE `rights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tankers`
--
ALTER TABLE `tankers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tanker_vendors`
--
ALTER TABLE `tanker_vendors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `technician`
--
ALTER TABLE `technician`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vaccination`
--
ALTER TABLE `vaccination`
  MODIFY `vaccination_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vaccination_category`
--
ALTER TABLE `vaccination_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitor_log`
--
ALTER TABLE `visitor_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`designation`) REFERENCES `employee_designation` (`id`),
  ADD CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`),
  ADD CONSTRAINT `employee_ibfk_4` FOREIGN KEY (`role`) REFERENCES `roles` (`role_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_emp_dept` FOREIGN KEY (`department`) REFERENCES `employee_dept` (`dept_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
