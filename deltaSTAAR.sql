-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2023 at 10:48 AM
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
  `bldg_status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('Male','Female','Unisex') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tot_capacity` int(11) NOT NULL,
  `no_of_rooms` int(11) NOT NULL,
  `occupied_rooms` int(11) DEFAULT NULL,
  `available_rooms` int(11) DEFAULT NULL,
  `owner` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warden_emp_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accomodation`
--

INSERT INTO `accomodation` (`acc_id`, `acc_code`, `acc_name`, `bldg_status`, `location`, `gender`, `tot_capacity`, `no_of_rooms`, `occupied_rooms`, `available_rooms`, `owner`, `remark`, `warden_emp_code`) VALUES
(1, 'XYZ23', 'Madhuban', 'Active', 'Taleigao', 'Unisex', 12, 3, 0, 0, 'Deltastaar', 'Accommodation for all staff', 'ABCD0987'),
(2, 'PQR09', 'Mandovi', 'Temporaril', 'Panaji', 'Male', 6, 2, 0, 0, 'Deltastaar', 'Accommodation for male staff', 'ABCD1234'),
(3, 'LMN56', 'Porvorim', 'Temporaril', 'Porvorim', 'Female', 4, 1, 0, 0, 'Deltastaar', 'Accommodation for female staff', 'ABCD1234'),
(4, 'ABC123', 'Mapusa', 'Active', 'Mapusa', 'Unisex', 0, 0, 0, 0, 'Deltastaar', 'Accommodation for all staff', 'ABCD0987');

-- --------------------------------------------------------

--
-- Table structure for table `audits`
--

CREATE TABLE `audits` (
  `login_id` int(11) NOT NULL,
  `table_affected` varchar(255) NOT NULL,
  `changes` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` int(11) NOT NULL,
  `raise_timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tech_closure_timestamp` timestamp NULL DEFAULT NULL,
  `sec_closure_timestamp` timestamp NULL DEFAULT NULL,
  `warden_closure_timestamp` timestamp NULL DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emp_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`id`, `raise_timestamp`, `type`, `description`, `tech_closure_timestamp`, `sec_closure_timestamp`, `warden_closure_timestamp`, `remarks`, `emp_code`) VALUES
(1, '2023-01-04 18:19:39', 1, 'light off', NULL, '2023-01-04 18:19:39', '2023-01-04 18:19:39', NULL, 'ABCD1234'),
(2, '2023-01-05 19:24:10', 2, 'sink overflow', NULL, '2023-01-05 19:24:10', '2023-01-05 19:24:10', NULL, 'ABCD1234');

-- --------------------------------------------------------

--
-- Table structure for table `complaint_type`
--

CREATE TABLE `complaint_type` (
  `id` int(11) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `complaint_type`
--

INSERT INTO `complaint_type` (`id`, `type`, `description`) VALUES
(1, 'Electrical', 'Anything related to electrical work and appliances'),
(2, 'Plumbing', 'Anything related to water supply and plumbing'),
(3, 'Carpentry', 'Anything related to furniture and woodwork'),
(4, 'Other', 'Any other complain ');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `primary_contact` varchar(13) NOT NULL,
  `secondary_contact` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `emp_id`, `primary_contact`, `secondary_contact`) VALUES
(1, 2, '9527014907', '9423060461');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL,
  `emp_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fname` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mname` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lname` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` int(11) NOT NULL,
  `dob` date NOT NULL,
  `contact` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pincode` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blood_group` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `aadhaar_number` int(11) DEFAULT NULL,
  `salary` float DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `role` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `emp_code`, `fname`, `mname`, `lname`, `designation`, `dob`, `contact`, `address`, `state`, `country`, `pincode`, `email`, `blood_group`, `department`, `joining_date`, `aadhaar_number`, `salary`, `room_id`, `role`) VALUES
(2, 'ABCD1234', 'Chinmay', 'Umesh', 'Joshi', 3, '2002-07-05', '9527014907', 'Flat RT6, Fonseca Arcade co-op housing society,Ponda ', 'Goa', 'India', 403401, 'chinmayujoshi@gmail.com', 'O+', 'IT', '2022-07-15', 1234567890, 80000, 6, 1),
(3, 'ABCD1235', 'XYZ', 'U', 'PQR', 2, '2002-07-05', '+919527014907', 'Goa', 'Goa', 'India', 403401, 'chinmay@gmail.com', 'AB+', 'it', '2002-07-05', 1234, 50000, 6, 8),
(7, 'ABCD1236', 'XYZ', 'u', 'PQR', 2, '2023-01-18', '+919527014907', 'Panjim Goa', 'goa', 'america', 123123, 'chinmayjoshi5702@gmail.com', 'B+', 'it', '2023-02-11', 1234567890, 5000000, 6, 8),
(8, 'ABCD0987', 'Varad', 'M', 'Kelkar', 3, '2002-07-02', '8806607659', 'Fatorda', 'Goa', 'India', 403602, 'varad@kelkar', 'A-', 'COMP', '2022-09-23', 2147483647, 80000, 7, 1),
(19, 'WXYZ0072', 'Charlie', 'H', 'Harper', 1, '1997-04-25', '1234567890', 'Malibu', 'California', 'USA', 445673, 'test@dummy', 'O+', 'HR', '2022-12-16', 12345678, 80000, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee_designation`
--

CREATE TABLE `employee_designation` (
  `id` int(11) NOT NULL,
  `designation` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_designation`
--

INSERT INTO `employee_designation` (`id`, `designation`) VALUES
(1, 'Manager'),
(2, 'Team Lead'),
(3, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `employee_outing`
--

CREATE TABLE `employee_outing` (
  `emp_id` int(11) NOT NULL,
  `approval` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `outing_date` date NOT NULL,
  `arrival_date` date NOT NULL,
  `category` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `complaint_id` int(11) NOT NULL,
  `technician_id` int(11) NOT NULL,
  `raise_timestamp` date NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `completion_date` date DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warden_emp_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `complaint_id`, `technician_id`, `raise_timestamp`, `description`, `completion_date`, `remarks`, `warden_emp_code`) VALUES
(15, 1, 1, '2023-01-05', 'zcas', '2023-01-08', 'asda', 'ABCD1234');

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

--
-- Dumping data for table `login_credentials`
--

INSERT INTO `login_credentials` (`emp_id`, `pass`) VALUES
(2, '5f4dcc3b5aa765d61d8327deb882cf99'),
(8, '0444c32ebf0b36d55d38afd22ad00ecd'),
(19, '5f4dcc3b5aa765d61d8327deb882cf99'),
(7, '5f4dcc3b5aa765d61d8327deb882cf99');

-- --------------------------------------------------------

--
-- Table structure for table `login_history`
--

CREATE TABLE `login_history` (
  `emp_id` int(11) NOT NULL,
  `login_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `logout_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login_history`
--

INSERT INTO `login_history` (`emp_id`, `login_time`, `logout_time`, `id`) VALUES
(2, '2022-12-22 07:58:01', '2022-12-22 07:58:01', 1),
(2, '2022-12-27 04:55:10', '2022-12-27 04:55:10', 2),
(2, '2022-12-29 18:50:01', '2022-12-29 18:50:01', 3),
(2, '2022-12-29 20:04:45', '2022-12-29 20:04:45', 4),
(2, '2022-12-30 06:23:32', '2022-12-30 06:23:32', 5),
(2, '2022-12-30 06:35:57', '2022-12-30 06:35:57', 6),
(2, '2022-12-31 13:46:10', '2022-12-31 13:46:10', 7),
(2, '2023-01-01 12:30:11', '2023-01-01 12:30:11', 8),
(2, '2023-01-02 11:18:24', '2023-01-02 11:18:24', 9),
(2, '2023-01-06 17:03:30', '2023-01-06 17:03:30', 10),
(2, '2023-01-06 19:09:45', '2023-01-06 19:09:45', 11),
(2, '2023-01-07 03:34:59', '2023-01-07 03:34:59', 12),
(8, '2023-01-07 03:35:45', '2023-01-07 03:35:45', 13),
(8, '2023-01-07 04:31:30', '2023-01-07 04:31:30', 14),
(8, '2023-01-07 06:40:37', '2023-01-07 06:40:37', 15),
(8, '2023-01-07 07:54:16', '2023-01-07 07:54:16', 16),
(8, '2023-01-07 08:31:13', '2023-01-07 08:31:13', 17),
(8, '2023-01-07 09:33:44', '2023-01-07 09:33:44', 18),
(19, '2023-01-07 09:34:40', '2023-01-07 09:34:40', 19),
(7, '2023-01-07 09:35:23', '2023-01-07 09:35:23', 20),
(8, '2023-01-07 09:35:30', '2023-01-07 09:35:30', 21);

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

--
-- Dumping data for table `rights`
--

INSERT INTO `rights` (`id`, `accomodation`, `complaints`, `employee_details`, `employee_outing`, `roles`, `rooms`, `tankers`, `jobs`, `vaccination`, `vaccination_category`, `visitor_log`) VALUES
(1, '7', '7', '7', '7', '7', '7', '7', '7', '7', '7', '7'),
(7, '1', '1', '1', '1', '0', '1', '1', '1', '1', '0', '1');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rights` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`, `rights`) VALUES
(1, 'Super Admin', 1),
(8, 'Test', 7);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `acc_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `room_no` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_capacity` int(11) NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `current_room_occupancy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`acc_id`, `id`, `room_no`, `room_capacity`, `status`, `current_room_occupancy`) VALUES
(1, 3, '102', 4, '', 0),
(1, 4, '103', 4, '', 0),
(2, 5, '202', 1, 'Occupied', 1),
(1, 6, '104', 4, 'Occupied', 4),
(2, 7, '204', 1, 'Occupied', 1),
(3, 8, '408', 4, '', 0);

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
  `bill_no` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tankers`
--

INSERT INTO `tankers` (`id`, `acc_id`, `security_emp_id`, `quality_check`, `qty`, `bill_no`, `vendor_id`, `timestamp`) VALUES
(2, 1, 2, 'Yes', 2456, 12334, 1, '2022-12-22 10:06:03');

-- --------------------------------------------------------

--
-- Table structure for table `tanker_vendors`
--

CREATE TABLE `tanker_vendors` (
  `id` int(11) NOT NULL,
  `vname` varchar(20) DEFAULT NULL,
  `company_name` varchar(20) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tanker_vendors`
--

INSERT INTO `tanker_vendors` (`id`, `vname`, `company_name`, `number`, `address`) VALUES
(1, 'ABCD', 'abc water works', 12345678, 'goa');

-- --------------------------------------------------------

--
-- Table structure for table `technician`
--

CREATE TABLE `technician` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `technician`
--

INSERT INTO `technician` (`id`, `emp_id`, `role`) VALUES
(1, 3, 'Electrician');

-- --------------------------------------------------------

--
-- Table structure for table `vaccination`
--

CREATE TABLE `vaccination` (
  `vaccination_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `date_of_administration` date DEFAULT NULL,
  `location` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_next_dose` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vaccination`
--

INSERT INTO `vaccination` (`vaccination_id`, `emp_id`, `category_id`, `date_of_administration`, `location`, `date_of_next_dose`) VALUES
(1, 2, 1, '2022-01-01', 'goa', '2022-02-01'),
(2, 2, 2, '2022-02-09', 'goa', '2022-04-01'),
(3, 3, 1, '2023-01-01', 'goa', '2023-02-01'),
(4, 3, 2, '2023-02-16', 'goa', '2023-03-18'),
(5, 8, 1, '2022-06-15', 'Margao', '2022-09-14'),
(6, 8, 1, '2022-06-15', 'Margao', '2022-09-14');

-- --------------------------------------------------------

--
-- Table structure for table `vaccination_category`
--

CREATE TABLE `vaccination_category` (
  `category_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vaccination_category`
--

INSERT INTO `vaccination_category` (`category_name`, `category_id`) VALUES
('First Dose', 1),
('Second dose', 2),
('Third dose', 3);

-- --------------------------------------------------------

--
-- Table structure for table `visitor_log`
--

CREATE TABLE `visitor_log` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `security_emp_id` int(11) NOT NULL,
  `visitor_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicle_no` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `check_in` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `check_out` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `purpose` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `visitor_log`
--

INSERT INTO `visitor_log` (`id`, `emp_id`, `security_emp_id`, `visitor_name`, `vehicle_no`, `type`, `check_in`, `check_out`, `purpose`, `phone_no`) VALUES
(1, 2, 2, 'Chinmay', '4879', NULL, '2022-12-31 13:28:29', '2022-12-31 13:28:29', 'something', '9527014907');

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
  ADD KEY `accomodation_ibfk_1` (`warden_emp_code`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emp_code` (`emp_code`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `complaint_type`
--
ALTER TABLE `complaint_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`),
  ADD UNIQUE KEY `emp_code` (`emp_code`),
  ADD KEY `role` (`role`),
  ADD KEY `designation` (`designation`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `employee_designation`
--
ALTER TABLE `employee_designation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_outing`
--
ALTER TABLE `employee_outing`
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_ibfk_1` (`complaint_id`),
  ADD KEY `jobs_ibfk_2` (`technician_id`),
  ADD KEY `jobs_ibfk_3` (`warden_emp_code`);

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
  ADD KEY `emp_id` (`emp_id`),
  ADD KEY `acc_id` (`acc_id`);

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
  ADD KEY `emp_id` (`emp_id`),
  ADD KEY `security_emp_id` (`security_emp_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accomodation`
--
ALTER TABLE `accomodation`
  MODIFY `acc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `complaint_type`
--
ALTER TABLE `complaint_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `employee_designation`
--
ALTER TABLE `employee_designation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `login_history`
--
ALTER TABLE `login_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `rights`
--
ALTER TABLE `rights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tankers`
--
ALTER TABLE `tankers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tanker_vendors`
--
ALTER TABLE `tanker_vendors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `technician`
--
ALTER TABLE `technician`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vaccination`
--
ALTER TABLE `vaccination`
  MODIFY `vaccination_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `vaccination_category`
--
ALTER TABLE `vaccination_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `visitor_log`
--
ALTER TABLE `visitor_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accomodation`
--
ALTER TABLE `accomodation`
  ADD CONSTRAINT `accomodation_ibfk_1` FOREIGN KEY (`warden_emp_code`) REFERENCES `employee` (`emp_code`);

--
-- Constraints for table `complaints`
--
ALTER TABLE `complaints`
  ADD CONSTRAINT `complaints_ibfk_1` FOREIGN KEY (`emp_code`) REFERENCES `employee` (`emp_code`),
  ADD CONSTRAINT `complaints_ibfk_2` FOREIGN KEY (`type`) REFERENCES `complaint_type` (`id`);

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`role`) REFERENCES `roles` (`role_id`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`designation`) REFERENCES `employee_designation` (`id`),
  ADD CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- Constraints for table `employee_outing`
--
ALTER TABLE `employee_outing`
  ADD CONSTRAINT `employee_outing_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`);

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `jobs_ibfk_1` FOREIGN KEY (`complaint_id`) REFERENCES `complaints` (`id`),
  ADD CONSTRAINT `jobs_ibfk_2` FOREIGN KEY (`technician_id`) REFERENCES `technician` (`id`),
  ADD CONSTRAINT `jobs_ibfk_3` FOREIGN KEY (`warden_emp_code`) REFERENCES `employee` (`emp_code`);

--
-- Constraints for table `login_credentials`
--
ALTER TABLE `login_credentials`
  ADD CONSTRAINT `login_credentials_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`);

--
-- Constraints for table `login_history`
--
ALTER TABLE `login_history`
  ADD CONSTRAINT `login_history_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`);

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`rights`) REFERENCES `rights` (`id`);

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`acc_id`) REFERENCES `accomodation` (`acc_id`);

--
-- Constraints for table `security`
--
ALTER TABLE `security`
  ADD CONSTRAINT `security_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`),
  ADD CONSTRAINT `security_ibfk_2` FOREIGN KEY (`acc_id`) REFERENCES `accomodation` (`acc_id`);

--
-- Constraints for table `technician`
--
ALTER TABLE `technician`
  ADD CONSTRAINT `technician_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
