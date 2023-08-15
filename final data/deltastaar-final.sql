-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 15, 2023 at 10:05 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `deltastaar-final`
--

-- --------------------------------------------------------

--
-- Table structure for table `accomodation`
--

CREATE TABLE `accomodation` (
  `acc_id` int(11) NOT NULL,
  `acc_code` varchar(10) NOT NULL,
  `acc_name` varchar(255) NOT NULL,
  `bldg_status` varchar(20) NOT NULL,
  `gender` enum('Male','Female','Unisex') NOT NULL,
  `tot_capacity` int(11) DEFAULT NULL,
  `no_of_rooms` int(11) DEFAULT NULL,
  `occupied_rooms` int(11) DEFAULT NULL,
  `available_rooms` int(11) DEFAULT NULL,
  `warden_emp_code` varchar(10) DEFAULT NULL,
  `owner` varchar(30) DEFAULT NULL,
  `remark` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accomodation`
--

INSERT INTO `accomodation` (`acc_id`, `acc_code`, `acc_name`, `bldg_status`, `gender`, `tot_capacity`, `no_of_rooms`, `occupied_rooms`, `available_rooms`, `warden_emp_code`, `owner`, `remark`) VALUES
(1, 'ACC001', 'Madhuban', 'Active', 'Female', 264, 48, 43, 5, 'EMP001', 'SELF', 'Mixed Staff across Depts.(6)'),
(2, 'ACC002', 'Miramar', 'Active', 'Female', 56, 4, 0, 4, 'EMP001', 'SELF', 'Gaming-DJ'),
(3, 'ACC003', 'Taleigao', 'Active', 'Male', 60, 12, 10, 2, 'EMP001', 'SELF', 'F & B Prod ( DR ), F & B SERV ( DR / KC)'),
(4, 'ACC004', 'Succor', 'Active', 'Female', 90, 36, 8, 28, 'EMP001', 'SELF', 'Gaming DR / DC'),
(5, 'ACC005', 'Porvorim - Boys 1 ( Pandurang Walwaikar)', 'Active', 'Male', 33, 3, 1, 2, 'EMP001', 'SELF', 'F & B SERV ( DJ ), CASHDESK'),
(6, 'ACC006', 'Rosa Maria(Campal) - Chef\'s', 'Active', 'Male', 18, 1, 0, 1, 'EMP001', 'SELF', 'F & B Prod ( DJ )'),
(7, 'ACC007', 'Green Lake View', 'Active', 'Male', 48, 16, 14, 2, 'EMP001', 'SELF', 'F & B Prod ( DR ), F & B Prod ( DC ),F & B Prod ( CK),'),
(8, 'ACC008', 'Reis Magoos Near Masjid', 'Active', 'Male', 54, 7, 6, 1, 'EMP001', 'SELF', 'Gaming DR / Gaming DJ'),
(9, 'ACC009', 'Evolution', 'Active', 'Male', 84, 14, 10, 4, 'EMP001', 'SELF', 'Gaming DR / SECURITY / ADM /IT / HK /FO/Transport'),
(10, 'ACC010', 'OM SAI', 'Active', 'Female', 68, 16, 2, 14, 'EMP001', 'SELF', 'Gaming/CASHDESK/F &B /FO/HK'),
(11, 'ACC011', 'Corlim Acco ( Dhawal Enclave )', 'Active', 'Male', 78, 14, 0, 14, 'EMP001', 'SELF', 'F & B ( IHM & GOA Staff)'),
(12, 'ACC012', 'Zuri - 1 (Opp Church )', 'Active', 'Male', 6, 1, 1, 0, 'EMP001', 'SELF', 'Gaming Zuri,'),
(13, 'ACC013', 'Zuri - 2 ( Besides Church )', 'Active', 'Male', 6, 1, 1, 0, 'EMP001', 'SELF', 'Gaming Zuri,');

-- --------------------------------------------------------

--
-- Table structure for table `active_sessions`
--

CREATE TABLE `active_sessions` (
  `emp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `change_tracking_accomodation`
--

CREATE TABLE `change_tracking_accomodation` (
  `id` int(11) NOT NULL,
  `user` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` enum('Delete','Update','Insert') DEFAULT NULL,
  `acc_id` int(11) NOT NULL,
  `acc_code` varchar(10) NOT NULL,
  `acc_name` varchar(255) NOT NULL,
  `bldg_status` varchar(20) NOT NULL,
  `location` int(11) DEFAULT NULL,
  `gender` enum('Male','Female','Unisex') NOT NULL,
  `tot_capacity` int(11) DEFAULT NULL,
  `no_of_rooms` int(11) NOT NULL,
  `occupied_rooms` int(11) DEFAULT NULL,
  `available_rooms` int(11) DEFAULT NULL,
  `warden_emp_code` varchar(10) DEFAULT NULL,
  `owner` varchar(30) NOT NULL,
  `remark` text DEFAULT NULL
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `change_tracking_complaints`
--

CREATE TABLE `change_tracking_complaints` (
  `id` int(11) NOT NULL,
  `user` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` enum('Delete','Update','Insert') DEFAULT NULL,
  `complaint_id` int(11) NOT NULL,
  `raise_timestamp` timestamp NULL DEFAULT NULL,
  `complaint_type` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `tech_pending_timestamp` varchar(255) DEFAULT NULL,
  `tech_closure_timestamp` varchar(255) DEFAULT NULL,
  `sec_closure_timestamp` varchar(255) DEFAULT NULL,
  `warden_closure_timestamp` varchar(255) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `emp_code` varchar(10) DEFAULT NULL,
  `acc_id` int(11) DEFAULT NULL,
  `acc_code` varchar(10) DEFAULT NULL
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `change_tracking_employee`
--

CREATE TABLE `change_tracking_employee` (
  `id` int(11) NOT NULL,
  `user` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` enum('Delete','Update','Insert') DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `emp_code` varchar(10) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `mname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `designation` int(11) DEFAULT NULL,
  `dob` varchar(15) DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `pincode` varchar(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  `blood_group` varchar(4) DEFAULT NULL,
  `joining_date` varchar(15) DEFAULT NULL,
  `aadhaar_number` varchar(16) DEFAULT NULL,
  `salary` float DEFAULT NULL,
  `room_id` tinytext DEFAULT NULL,
  `role` tinytext DEFAULT NULL
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
  `dept_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `designation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `change_tracking_employee_outing`
--

CREATE TABLE `change_tracking_employee_outing` (
  `id` int(11) NOT NULL,
  `user` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` enum('Delete','Update','Insert') DEFAULT NULL,
  `emp_code` varchar(10) DEFAULT NULL,
  `approval` varchar(4) DEFAULT NULL,
  `outing_date` date NOT NULL,
  `arrival_date` date DEFAULT NULL,
  `category` varchar(225) NOT NULL,
  `outing_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `change_tracking_jobs`
--

CREATE TABLE `change_tracking_jobs` (
  `id` int(11) NOT NULL,
  `user` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` enum('Delete','Update','Insert') DEFAULT NULL,
  `jobs_id` int(11) NOT NULL,
  `complaint_id` int(11) NOT NULL,
  `technician_id` int(11) NOT NULL,
  `raise_timestamp` date NOT NULL,
  `description` text DEFAULT NULL,
  `completion_date` date DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `warden_emp_code` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `change_tracking_living_history`
--

CREATE TABLE `change_tracking_living_history` (
  `emp_code` varchar(10) NOT NULL,
  `history` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `change_tracking_rooms`
--

CREATE TABLE `change_tracking_rooms` (
  `id` int(11) NOT NULL,
  `user` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` enum('Delete','Update','Insert') DEFAULT NULL,
  `acc_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `room_no` varchar(20) NOT NULL,
  `room_capacity` int(11) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `current_room_occupancy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `change_tracking_tankers`
--

CREATE TABLE `change_tracking_tankers` (
  `id` int(11) NOT NULL,
  `user` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` enum('Delete','Update','Insert') DEFAULT NULL,
  `tanker_id` int(11) NOT NULL,
  `acc_id` int(11) NOT NULL,
  `security_emp_id` int(11) NOT NULL,
  `quality_check` enum('Yes','No') NOT NULL,
  `qty` int(11) NOT NULL,
  `bill_no` varchar(10) NOT NULL,
  `amount` float NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `tanker_timestamp` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `change_tracking_vaccination`
--

CREATE TABLE `change_tracking_vaccination` (
  `id` int(11) NOT NULL,
  `user` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` enum('Delete','Update','Insert') DEFAULT NULL,
  `vaccination_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `emp_code` varchar(10) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `date_of_administration` date DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `date_of_next_dose` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `change_tracking_visitor_log`
--

CREATE TABLE `change_tracking_visitor_log` (
  `id` int(11) NOT NULL,
  `user` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` enum('Delete','Update','Insert') DEFAULT NULL,
  `log_id` int(11) NOT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `security_emp_id` int(11) NOT NULL,
  `acc_code` varchar(10) NOT NULL,
  `visitor_name` varchar(20) DEFAULT NULL,
  `vehicle_no` varchar(11) DEFAULT NULL,
  `visit_type` varchar(20) DEFAULT NULL,
  `check_in` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `check_out` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `purpose` varchar(100) NOT NULL,
  `phone_no` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` int(11) NOT NULL,
  `raise_timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` int(11) DEFAULT NULL,
  `description` text NOT NULL,
  `tech_pending_timestamp` timestamp NULL DEFAULT NULL,
  `tech_closure_timestamp` timestamp NULL DEFAULT NULL,
  `sec_closure_timestamp` timestamp NULL DEFAULT NULL,
  `warden_closure_timestamp` timestamp NULL DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `emp_code` varchar(10) DEFAULT NULL,
  `acc_id` int(11) DEFAULT NULL,
  `acc_code` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complaint_type`
--

CREATE TABLE `complaint_type` (
  `type_id` int(11) NOT NULL,
  `complaint_type` varchar(20) DEFAULT NULL,
  `type_description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL,
  `emp_code` varchar(10) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `mname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `designation` int(11) NOT NULL,
  `dob` varchar(15) DEFAULT NULL,
  `contact` varchar(15) NOT NULL,
  `address` varchar(255) NOT NULL,
  `state` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `pincode` varchar(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `department` int(11) NOT NULL,
  `blood_group` varchar(4) DEFAULT NULL,
  `joining_date` varchar(15) DEFAULT NULL,
  `aadhaar_number` varchar(16) DEFAULT NULL,
  `salary` float DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `role` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `emp_code`, `fname`, `mname`, `lname`, `designation`, `dob`, `contact`, `address`, `state`, `country`, `pincode`, `email`, `department`, `blood_group`, `joining_date`, `aadhaar_number`, `salary`, `room_id`, `role`) VALUES
(1, 'EMP001', 'Vadiraj Gururaj Inamdar', NULL, NULL, 62, '2002-04-23', '7083491368', 'Dhavali, Ponda, Goa', 'Goa', 'India', '403401', 'vadirajinamdar6@gmail.com', 18, 'A+', '2023-01-03', '496376636809', 98346, NULL, 5),
(2, 'D01000', 'RUBI CHOWHAI', NULL, NULL, 5, '2004-09-02', '6909422853', 'MUDOI BI .I & II, CHANGLANG, DIYUN, ARUNANCHAL PRADESH-792103     INDIA ARUNANCHAL PRADESH ', 'ARUNACHAL PRADESH', 'INDIA', 'NA', 'chowhair09@gmail.com', 2, 'A+', '2023-04-10', '283408719717', 0, 158, NULL),
(3, 'D01003', 'PHOIBI ENGTIPI', NULL, NULL, 2, '2002-09-09', '8011237676', 'CHANDMARI, LUMDING ROAD, DIPHU, KARBI ANGLONG ASSAM 782460     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'phoibiengtipi@gmail.com', 1, 'O+', '2023-04-10', '509073267717', 0, 158, NULL),
(4, 'H03113', 'PREMIKA MOCHAHARY', NULL, NULL, 2, '2002-04-17', '7099109507', 'VILL BHAIRAGURI, NALKHAMARA, UDALGURI ASSAM 784509     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'premimchri5@gmail.com', 1, 'A+', '2023-04-10', '245321161535', 0, 158, NULL),
(5, 'H03110', 'BANDANA GOGOI', NULL, NULL, 2, '2001-05-06', '9365454243', 'VILL BETONIBAM, GHINAI GAON, DIBRUGARH ASSAM 786621     INDIA ASSAM  ', 'ASSAM', 'INDIA', 'NA', 'gogoibandana486@gmail.com', 1, 'O+', '2023-04-10', '927593652813', 0, 158, NULL),
(6, 'D00998', 'PUBI MAYAKADEL', NULL, NULL, 2, '2005-02-11', '9366681548', 'H.NO.223,NH-29, MEDZIPHEMA TOWN,WARD-09, MEDZIPHEMA HQ,DIMAPUR, NAGALAND-797106     INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'pubikadel@gmail.com', 1, 'B+', '2023-04-10', '857518862209', 0, 159, NULL),
(7, 'H03115', 'NIZARA PATAR', NULL, NULL, 2, '2003-10-13', '6901863020', 'MERUAGAON, HATIHULUNGA, AZARBARI, MORIGAON ASSAM 782105     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'nizarapatar@gmail.com', 1, 'B+', '2023-04-10', '458080581959', 0, 159, NULL),
(8, 'D00997', 'BARNALI KALITA', NULL, NULL, 2, '2002-11-11', '9310058882', 'UJAN TOKRADIA,KAMRUP, ASSAM-781102     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'kbarnali577@gmail.com', 1, 'A+', '2023-04-10', '558014857180', 0, 159, NULL),
(9, 'H03119', 'JITUMONI NARCARY', NULL, NULL, 2, '1997-03-19', '8011512540', 'VILL CHARIPUNIA BOTGURI, UTTAR SALMARA PT I, BONGAIGAON ASSAM 783383     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'jitumoninarzary61@gmail.com', 1, 'A+', '2023-04-12', '302634622056', 0, 160, NULL),
(10, 'H03121', 'SANGITA SINGHA ROY', NULL, NULL, 2, '1999-05-20', '6000324759', 'VILLAGE KAKAIJANA, BONGAIGAON ASSAM 783383     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'sangitaabeli11@gmail.com', 1, 'O+', '2023-04-12', '912484791025', 0, 160, NULL),
(11, 'H03114', 'MIANKSHI BORUAH', NULL, NULL, 2, '1996-08-24', '6001498017', 'BORDUBI KATHAL GURI, BORDUBI REV TOWN, HOOGRIJAN, TINSUKIA ASSAM 786601     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'porunaboruah2@gmail.com', 1, 'B+', '2023-04-10', '984987121878', 0, 160, NULL),
(12, 'D01004', 'JANMONI TAMULI', NULL, NULL, 2, '1998-02-28', '8099169066', 'BOCHAGAON,KAZIRANGA NATIONAL PARK, GOLAGHAT  ASSAM 785609     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'janmonitamuli2546@mail.com', 1, 'B+', '2023-04-11', '829247246434', 0, 161, NULL),
(13, 'H03120', 'KLARISHA TOKPBIPI', NULL, NULL, 2, '1998-10-07', '6003971240', 'VILL HORI TARO GAON, SILDHARAMPUR, DOKMAKA, PHULONI, KARBI ANGLONG ASSAM 782441     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'tokbipiklarisha@gmail.com', 1, 'A+', '2023-04-11', '888320319493', 0, 161, NULL),
(14, 'D01001', 'CHAUHAN', NULL, NULL, 9, '2001-09-03', '6901258798', 'HOUSE NO.26, KHANAPARA,FIRM GATE,GUWAHATI,KHANAPARA,KAMRUP METRO  ASSAM-781022     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'aptechghy@gmail.com', 2, 'AB+', '2023-04-11', '797092419457', 0, 161, NULL),
(15, 'H03173', 'SUCHITA KUMARI DEV', NULL, NULL, 6, '2002-07-06', '9546044789', 'HARAMLOHAR TAMAR, VILL BIRDIH PO HARAMLOHAR RANCHI JHARKHAND 835225     INDIA JHARKHAND ', 'JHARKHAND', 'INDIA', 'NA', 'suchitadev1543@gmail.com', 3, 'O+', '2023-06-26', '442085743627', 0, 164, NULL),
(16, 'V07225', 'SUPRIYA BAGH', NULL, NULL, 9, '2003-04-12', '6207510185', 'S.P.R-1/5,MUSABANI NO-3, EAST SINGHBHUM  JHARKHAND 832104     INDIA JHARKHAND ', 'JHARKHAND', 'INDIA', 'NA', 'royalpriya2001@gmail.com', 2, 'A+', '2023-06-26', '867653450985', 0, 164, NULL),
(17, 'V07226', 'LIPIKA ROHIDAS', NULL, NULL, 2, '2004-01-29', '7008925949', 'VILLAGE JAMERA, BRAJARAJNAGAR, JHARSUGUDA ODISHA 768216     INDIA ODISHA ', 'ODISHA', 'INDIA', 'NA', 'lipilipika47@gmail.com', 1, 'O+', '2023-06-27', '402220794417', 0, 164, NULL),
(18, 'H03054', 'NUNGTIAJUNG', NULL, NULL, 2, '1998-01-02', '7085944204', 'H NO 40, TEYONG MEPU, P O TZUDIKONG, TULI, TSUDIKONG, MOKOKCHUNG NAGALAND 798623     INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'nungtyjung@gmail.com', 1, 'A+', '2023-01-23', '201935404928', 0, 165, NULL),
(19, 'H03053', 'TSUCHOI K', NULL, NULL, 2, '2000-07-22', '8413834292', '128, NOKLAK VILL, NOKLAK, TUENSANG NAGALAND 798626     INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'tsuchoishiu77@gmail.com', 1, 'O+', '2023-01-23', '407188007719', 0, 165, NULL),
(20, 'H03055', 'HOINGAM P KONYAK', NULL, NULL, 2, '2000-08-17', '9862866019', 'JAHJON WARD, NEAR MISSION CENTRE ROAD, MON SADAR NAGALAND 798621     INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'hoingampkonyak9862@gmail.com', 1, 'O+', '2023-01-23', '314437508572', 0, 165, NULL),
(21, 'H03052', 'PUSAM B', NULL, NULL, 5, '1994-05-27', '7085419220', '074, NOKLAK VILLAGE 03, TUESANG NAGALAND 798626     INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'shiupusam@gmail.com', 2, 'B+', '2023-01-23', '815624349496', 0, 165, NULL),
(22, 'V07022', 'ILIHO A AYE', NULL, NULL, 2, '2001-02-16', '8787677918', 'H.NO.51 HOVISE NIULAND DIMAPUR  NAGALAND      INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'ayeality78@gmail.com', 1, 'A+', '2023-01-23', '364986111892', 0, 166, NULL),
(23, 'H03056', 'ELIT I AYE', NULL, NULL, 2, '2003-10-24', '8415084932', 'H NO 105, HOSHEPU VILLAGE, ZUNHEBOTO SADAR NAGALAND 798620     INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'elitayemi@gmail.com', 1, 'O+', '2023-01-23', '376312333894', 0, 166, NULL),
(24, 'H03057', 'LOVI ACHUMI', NULL, NULL, 2, '2003-09-08', '8787567665', 'H NO 92, ZUTOVI VILLAGE, DHANSIPUR, DIMAPUR NAGALAND 797112     INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'loviachumi94@gmail.com', 1, 'A+', '2023-01-23', '567643426488', 0, 166, NULL),
(25, 'H03058', 'ANGUKALI A ASSUMI', NULL, NULL, 4, '2002-01-30', '8729990668', 'H NO 74, PROJECT COLONY, ZUNHEBOTO SADAR NAGALAND 798620     INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'angukaliassumi6@gmail.com', 1, 'A+', '2023-01-23', '575216265524', 0, 166, NULL),
(26, 'V07007', 'SHREEJANA CHETTRI', NULL, NULL, 4, '1995-12-25', '7029477577', 'MUL SAKYONG 1, KHASMAHAL, DARJEELING WEST BENGAL 734311     INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'srijanachettri772@gmail.com', 1, 'B+', '2023-01-18', '980850022266', 0, 167, NULL),
(27, 'V07004', 'NORSHANG BOMZON', NULL, NULL, 2, 'NA', '8768486949', 'MAHENDRA GAON WARD NO 8, MIRIK, DARJEELING WEST BENGAL 734214     INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'norshangbomzon5737@gmail.com', 19, 'AB+', '2023-01-18', '933759771064', 0, 167, NULL),
(28, 'H03048', 'NATIKUNDANG Y', NULL, NULL, 2, '2003-07-15', '9366783060', 'H NO 85, NEAR CHRUCH, HIGH SCHOOL B, TUENSANG NAGALAND 798612     INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'kundangkundang05@gmail.com', 1, 'A+', '2023-01-23', '603869855445', 0, 168, NULL),
(29, 'H03050', 'KEYILEUZEULE', NULL, NULL, 2, '2002-06-15', '9362354195', '131, JALUKIE B, PEREN NAGALAND 797110     INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'keyileuzeuleleuzeu@gmail.com', 1, 'O+', '2023-01-23', '410743231541', 0, 168, NULL),
(30, 'H03051', 'INGAUCHANGLE', NULL, NULL, 5, '1999-12-29', '9366021741', 'P O PEREN, PEREN HQ NAGALAND 797101     INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'ingauchanglezeliang@gmail.com', 2, 'O+', '2023-01-23', '305135583384', 0, 168, NULL),
(31, 'V07021', 'IMSILEMLA M', NULL, NULL, 4, '2002-07-20', '8974659974', 'H.NO.357,HIGH SCHOOL SECTOR TUENSANG TOWN  TUENSANG SADAR  NAGALAND      INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'imsichang7@gmail.com', 1, 'A+', '2023-01-23', '413300056560', 0, 168, NULL),
(32, 'V07010', 'PRERNA TAMANG', NULL, NULL, 4, '2002-09-30', '9883445687', 'AMBEOK TEA GARDEN GORUBATHAN DARJEELING WEST BENGAL 735231     INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'rainiti030@gmail.com', 1, 'O+', '2023-01-18', '685048233244', 0, 169, NULL),
(33, 'V07008', 'SUJANA RAI', NULL, NULL, 4, '2004-06-08', '9679392811', 'UPPER AMBIOK BUSTY PANKHASARI KHASMAHAL FAGU DARJEELING WEST BENGAL 735231      INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'NA', 1, 'A+', '2023-01-18', '485824734499', 0, 169, NULL),
(34, 'V07006', 'ANUSHRA GURUNG', NULL, NULL, 4, '2001-12-28', '9339642250', 'AMBIOK BUSTY GORUBATHAN KUWAPANI BUSTY PANKHASARI KHASMAHAL PAGU DARJEELING WEST BENGAL 735231     INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'anushragurung@gmail.com', 1, 'O+', '2023-01-18', '674456310854', 0, 169, NULL),
(35, 'V07009', 'RAKCHA TAMANG', NULL, NULL, 2, 'NA', '9614696731', '74 DHURA LABDAH DIVISION MANGPU CINCHONA PLANTATION MUNGPOO, RANGLI RANGLIOT, DARJEELING WEST BENGAL 734313     INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'rakcha215tamang@gmail.com', 19, 'B+', '2023-01-18', '227959182626', 0, 169, NULL),
(36, 'GP-961', 'AKUMYANGLA', NULL, NULL, 2, 'NA', '8837289525', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-01-23', 'NA', 0, 171, NULL),
(37, 'GP-960', 'SENTIJUNGLA', NULL, NULL, 2, 'NA', '9366971476', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-01-23', 'NA', 0, 171, NULL),
(38, 'GP-963', 'ALIMENLA', NULL, NULL, 2, 'NA', '9856504011', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-01-23', 'NA', 0, 171, NULL),
(39, 'GP-962', 'MUZAVELU DOZO', NULL, NULL, 2, 'NA', '8414970680', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-01-23', 'NA', 0, 171, NULL),
(40, 'H02810', 'ASHOK JENA', NULL, NULL, 31, '1990-02-26', '9172998162', 'KHADIKABADI JAYRAMPUR BHOGRAI BALESWAR ODISHA 756038     INDIA ODISHA ', 'ODISHA', 'INDIA', 'NA', 'ashookjena731@gmail.com', 8, 'B+', '2020-11-11', '326446140828', 0, 174, NULL),
(41, 'H02046', 'HONE SADANAND GAWAS', NULL, NULL, 40, '1987-10-19', '9021642616', 'H. NO. 11 KUMBHARWADA CHANDEL , PERNEM NORTH GOA GOA     ', 'GOA', 'INDIA', 'NA', 'NA', 8, 'A+', '2013-09-16', '913513169858', 0, 174, NULL),
(42, 'H00641', 'NARAYAN PARIDA', NULL, NULL, 21, '1996-10-07', '8855883600', 'NA', 'NA', 'INDIA', 'NA', 'NA', 8, 'A+', '2022-01-21', '738710589007', 0, 174, NULL),
(43, 'H02696', 'VISHANT TULSHIDAS SAWANT', NULL, NULL, 32, '1999-07-24', '9075246213', '74/2, GAWASWADA SATTARI, KERI NORTH GOA, GOA   403505 INDIA GOA ', 'GOA', 'INDIA', 'NA', 'avishant492@gmail.com', 8, 'B+', '2022-02-22', '268163979120', 0, 174, NULL),
(44, 'H02713', 'DALTON DSOUZA', NULL, NULL, 41, '1983-10-20', '9008900498', '99-1, GOLLJORA, KINNIGOLI, TALIPADY, DAKSHINI KANNADA, KARNATAKA 574150         ', 'KARNATAKA', 'INDIA', 'NA', 'dsouzadalton63@gmail.com', 11, 'B+', '2019-04-16', '875106608818', 0, 174, NULL),
(45, 'V04703', 'NAVIN SUBODH KHADAPKAR', NULL, NULL, 31, '1988-10-27', '8698379729', 'UBHADNADA, NAVABAG VENGURLA, SINDHUDURG MAHARASHTRA    416516   ', 'MAHARASHTRA', 'INDIA', 'NA', 'NA', 8, 'A+', '2022-08-16', '874231584134', 0, 174, NULL),
(46, 'H02867', 'RANJIT SAWANT', NULL, NULL, 32, '1997-11-14', '8208437801', 'H NO 380 AT POST AMBEGAON SAWATACHI WADI TAL SAWANTWADI SINDHUDURG MAHARASHTRA  416510      INDIA MAHARASHTRA ', 'MAHARASHTRA', 'INDIA', 'NA', 'ransawant23@gmail.com', 8, 'B+', '2023-03-27', '684732283453', 0, 174, NULL),
(47, 'H03094', 'NANDAY GAUNKAR', NULL, NULL, 30, '2000-07-22', '9637532492', 'H.NO.151, KHADWAMOL, KALAY, CALEM, SOUTH GOA    403704 INDIA GOA ', 'GOA', 'INDIA', 'NA', 'nandhaygaonkar26@gmail.com', 8, 'A+', '2020-11-11', '385673247747', 0, 174, NULL),
(48, 'H02037', 'THANESHWAR MANSUNATH MIRASHI', NULL, NULL, 32, '1994-01-01', '7030285194', '#1632 SANTISAGAR NIWAS HOUSING BOARD COLONY SANQULIM , NORTH GOA GOA  403505   ', 'GOA', 'INDIA', 'NA', 'NA', 8, 'O+', '2020-11-27', '898080559598', 0, 174, NULL),
(49, 'H02076', 'ALI AHMED LASKAR', NULL, NULL, 32, '1996-02-28', '8766545924', 'UDALI BAZAR, UDALI GAON UDALANI BAZAR NAGAON  ASSAM  782446   ', 'ASSAM', 'INDIA', 'NA', 'NA', 8, 'A+', '2020-11-27', '823013394840', 0, 174, NULL),
(50, 'H02077', 'EKBAL HUSSAIN', NULL, NULL, 34, '1991-10-09', '9101925240', 'SING GAON LANKA, UDALI GAON  NAGAON ASSAM  782446   ', 'ASSAM', 'INDIA', 'NA', 'NA', 8, 'O+', '2018-08-01', '450590562089', 0, 174, NULL),
(51, 'H01649', 'MOHAN SINGH BHUL', NULL, NULL, 32, '1986-04-22', '9067711247', 'NAVDURGA 3 KURKEDI DADEIDHURA     NEPAL  ', 'NEPAL', 'NEPAL', 'NA', 'NA', 8, 'A+', '2021-10-20', '432504632575', 0, 174, NULL),
(52, 'H02594', 'KAUSIKA MOHAKUD', NULL, NULL, 34, '1998-08-01', '8275302188', 'SILPURIA, BADKHIRIPADA BAISINGA, MAYURBHANJ ODISHA   757028   ', 'ODISHA', 'INDIA', 'NA', 'NA', 8, 'O+', '2021-03-26', '894798855829', 0, 174, NULL),
(53, 'H02218', 'AVADHUT DNYANESHWAR DALVI', NULL, NULL, 10, '1997-08-02', '7350685618', '826, BHOJ DALVIWADI HODAWADA SINDHUDURG MAHARASHTRA   416529   ', 'MAHARASHTRA', 'INDIA', 'NA', 'avadhutdalvi87605@gmail.com', 1, 'O+', '2022-02-13', '879619701557', 0, 174, NULL),
(54, 'H03030', 'PIKATO ZHIMO', NULL, NULL, 19, '1987-12-04', '6009053774', 'XUVIHE COLONY, DIMAPUR SADAR, DIMAPUR NAGALAND 797112    797112 INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'pikatozhimo77@gmail.com', 4, 'A+', '2020-12-05', '339688709631', 0, 101, NULL),
(55, 'V05401', 'YOGENDRA KUMAR JHA', NULL, NULL, 11, '2003-02-11', '7898447783', 'BEHIND VANDANA CONVENT SCHOOL VANDANA NAGAR GUNA, MADHYA PRADESH       ', 'MADHYA PRADESH', 'INDIA', 'NA', 'yash_raj2014@yahoo.coM', 4, 'O+', '2022-11-22', '560398993616', 0, 101, NULL),
(56, 'V06827', 'NIBIR RAJ BARUAH', NULL, NULL, 11, '1997-02-11', '9365449084', 'KAMAR GAON, DIBRUGARH ASSAM 786614     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'nibirrajbaruah@gmail.com', 4, 'B+', '2021-10-18', '659615376815', 0, 101, NULL),
(57, 'V05867', 'PRATHAMESH FATU RAWOOL', NULL, NULL, 11, '2003-04-21', '8275580924', '292/1, AMERE PORPSCODEM  PERNEM, NORTH GOA  GOA   403512 INDIA GOA ', 'GOA', 'INDIA', 'NA', 'NA', 4, 'O+', '2022-11-22', '818307461480', 0, 101, NULL),
(58, 'V06826', 'BHABANI GOGOI', NULL, NULL, 11, '1996-07-30', '9678905960', 'KENDUGURI GAON, JEYPORE, NAHARKATIYA, DIBRUGARH ASSAM 786614     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'bhabanigogoi784@gmail.com', 4, 'O+', '2021-12-29', '925856960532', 0, 101, NULL),
(59, 'V06043', 'JAYDAS VILAS KERKAR', NULL, NULL, 11, '1996-06-15', '8390716674', 'TARKARLI, SINDHUDURG, MAHARASHTRA        ', 'MAHARASHTRA', 'INDIA', 'NA', 'jaydask8@gmail.com', 4, 'B+', '2022-01-13', '752276918550', 0, 101, NULL),
(60, 'V06089', 'NINGAPPA NARAYAN RITTI', NULL, NULL, 13, '1999-07-10', '8971194770', 'MANAI , VIRNOLI UTTARA KANNADA KARNATAKA   581363   ', 'KARNATAKA', 'INDIA', 'NA', 'NA', 4, 'A+', '2023-06-27', '827300637166', 0, 101, NULL),
(61, 'V07203', 'JOHN ROHMINGTHANGA', NULL, NULL, 27, '1999-08-25', '7005745994', 'H.NO.7, SECTION III, KAWIZAU,SALEM VENG,LUNGLEL MIZORAM 796701     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'johnfanchun71@gmail.com', 2, 'O+', '2022-11-15', '597298720901', 0, 101, NULL),
(62, 'H02988 ', 'JAHANGIR ALAM', NULL, NULL, 27, '1998-03-15', '8638804370', '066 KATANIGAON PATH NEAR NATUN MASZID KATANIGAON MAJPATHORI NAGAO ASSAM 782003      INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'ja242806@gmail.com', 2, 'O+', '2022-11-29', '395406440215', 0, 102, NULL),
(63, 'D00947', 'MOHD SOHRAB KHAN', NULL, NULL, 39, '2000-03-12', '9971574356', '4/3, F M COLONY, CIVIL LINES, KANPUR UTTAR PRADESH 208001    208001 INDIA UTTAR PRADESH  ', 'UTTAR PRADESH', 'INDIA', 'NA', 'mdsohrabkhan1998@gmail.com', 2, 'B+', '2022-09-27', '255891325724', 0, 102, NULL),
(64, 'H02907', 'T APONGSU SANGLAM', NULL, NULL, 29, '1995-12-28', '8073825291', 'NEAR CHURCH, PBO LONGKHIM, NEW MANGAKHI, TUENSANG, LONGKHIM, NAGALAND 798616     INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'apongsusangtam1999@gmail.com', 2, 'O+', '2018-02-16', '934726014782', 0, 102, NULL),
(65, 'H01556', 'DIPENDRA SINGH KARKI', NULL, NULL, 27, '1997-10-30', '9673520391', 'NA', 'NA', 'INDIA', 'NA', 'NA', 2, 'O+', '2023-04-11', '436782308920', 0, 102, NULL),
(66, 'H03019', 'SHANUR SHAH', NULL, NULL, 63, 'NA', '9763636820', '250,VARCHIWADI,SATELI BHEDSHI,DODAMARG,SINDHUDURG  MAHARASHTRA    416512 INDIA MAHARASHTRA ', 'MAHARASHTRA', 'INDIA', 'NA', 'shanurshah511@gmail.com', 19, 'O+', 'NA', '863579622471', 0, 102, NULL),
(67, 'H02986', 'KORON KONWAR', NULL, NULL, 12, '2001-09-26', '9365528308', '5 NO LINE RUPAI TE 182 WI TINSUKIA ASSAM 786151      INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'koronkumar1@gmail.com', 2, 'A+', '2023-06-13', '224556864883', 0, 102, NULL),
(68, 'H03154', 'DELVAN FREZILAN LUIS', NULL, NULL, 27, '1999-05-20', '9373126700', 'H.NO.24/329, COPELABHAT, DEAO, QUEPEM GOA 403705     INDIA GOA ', 'GOA', 'INDIA', 'NA', 'NA', 2, 'O-', '2022-11-22', '455346530959', 0, 102, NULL),
(69, 'H02996', 'JITU KHARIA', NULL, NULL, 26, '1991-05-04', '8453700722', 'DEAMOOLIE T E, DIAMULI T E, 41 WI, TINSUKIA ASSAM 786151     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'jitukharia405@gmail.com', 2, 'B+', '2015-11-01', '593579957216', 0, 103, NULL),
(70, 'H00895', 'GANESH SINGH', NULL, NULL, 29, '1995-08-30', '8411980544', 'NA', 'NA', 'INDIA', 'NA', 'NA', 2, 'O-', '2016-05-01', '908516019362', 0, 103, NULL),
(71, 'H01040', 'GANESH SINGH SAUD', NULL, NULL, 27, '2001-06-14', '7038976637', 'BHEEMDATT MUNICIPALITY WARD NO-2, KANCHANPUR      NEPAL OTHER ', 'NEPAL', 'INDIA', 'NA', 'NA', 2, 'B+', '2021-11-24', '319322972336', 0, 103, NULL),
(72, 'H02643', 'SADANAND GAWAS', NULL, NULL, 27, '2000-10-30', '7875071006', 'H NO. 160/16, SHANTI NAGAR HONDA, SATTARI NORTH GOA, GOA   403530 INDIA GOA ', 'GOA', 'INDIA', 'NA', 'gawassadanand1406@gmail.com', 2, 'O+', '2022-02-01', '996057031918', 0, 103, NULL),
(73, 'H02708', 'MARUF YASEENALI NADAF', NULL, NULL, 27, '1990-10-01', '7249076450', 'C-79 B, BAHERCHAWADA SAWANTWADI , SINDHUDURG MAHARASHTRA   416510 INDIA GOA ', 'GOA', 'INDIA', 'NA', 'marufnadaf789@gmail.com', 2, 'A+', '2017-06-01', '343127992314', 0, 103, NULL),
(74, 'H01333', 'MAHADEV BHOSALE', NULL, NULL, 27, '2002-11-20', '9579860563', 'H.NO.200 PIRACHI GALLI, PIMPALAGANV GRAM, BHUDARAGAD, KOLHAPUR      INDIA MAHARASHTRA ', 'MAHARASHTRA', 'INDIA', 'NA', 'NA', 2, 'B-', '2022-06-20', '840614088273', 0, 103, NULL),
(75, 'H02800', 'GAJANAN CHAUGULE', NULL, NULL, 29, '1998-08-16', '8431023442', 'CHIKHALE KANAKUMBI BELGAUM  KARNATAKA 590014     INDIA KARNATAKA ', 'KARNATAKA', 'INDIA', 'NA', 'gaja2525@gmail.com', 2, 'O+', '2018-09-03', '698729119498', 0, 103, NULL),
(76, 'H01677', 'DINESH SINGH', NULL, NULL, 27, '2002-10-28', '8007498324', 'KAITHARI, DHOLPUR RAJASTHAN     328027   ', 'RAJASTHAN', 'INDIA', 'NA', 'dineshsingh161998@gmail.com', 2, 'B+', '2022-11-22', '506237034509', 0, 103, NULL),
(77, 'H02994', 'UDAI TANTI', NULL, NULL, 27, '2002-08-11', '6000138579', 'RACHI LINE, TIPUK T E 102 FS(A), TINSUKIA ASSAM 786156     INDIA ASSAM ', 'RAJASTHAN', 'INDIA', 'NA', 'udaitanti143@gmail.com', 2, 'B+', '2023-03-27', '242167724023', 0, 103, NULL),
(78, 'H03093', 'KHRAWKUPAR MUKTIEH', NULL, NULL, 27, '2003-11-13', '7085621826', 'MAWLAI NONGKAR(BLOCK-6 A) LEWRYNGHEP, EAST KHASI HILLS, MAWLAI, MEGHALAYA     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'khrawkuparmuktiehleo@gmail.com', 2, 'B+', '2022-11-22', '693600825669', 0, 103, NULL),
(79, 'H02995', 'BITUPAN CHETIA', NULL, NULL, 27, '2003-01-07', '6900283939', 'DUWANIA GAON, PARBATPUR, DIBRUGARH ASSAM 786623     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'chetiabitupan18@gmail.com', 2, 'B+', '2022-07-19', '560633262528', 0, 103, NULL),
(80, 'H02841', 'MARUTI GAVADE', NULL, NULL, 27, '2000-06-14', '8767664063', 'MAIN ROAD MU KOLIK MHALUNGE  KHALASA,CHANDGAD KOLIK  KOLHAPUR  MAHARASHTRA 416507     INDIA MAHARASHTRA ', 'MAHARASHTRA', 'INDIA', 'NA', 'marutigawade20@gmail.com', 2, 'A+', '2022-09-06', '670530264725', 0, 103, NULL),
(81, 'H02891', 'AKASH GYANDEV KADAM', NULL, NULL, 30, '1988-03-19', '9112198380', 'WAGHOLI,TAL HAVELI,DIST PUNE,  MAHARASHTRA 412207     INDIA MAHARASHTRA ', 'MAHARASHTRA', 'INDIA', 'NA', 'akashkadam9971@gmail.com', 8, 'O+', '2022-07-06', '471991803371', 0, 103, NULL),
(82, 'V06145', 'SUNIL PANDEYA', NULL, NULL, 4, '1999-08-22', '9763230615', 'UTTARBEHADI, 04 DHANGADHI, KAILALI NEPAL      ', 'NEPAL', 'NEPAL', 'NA', 'sunilpandeya1997@gmail.com', 1, 'B+', '2022-08-02', '570748257654', 0, 105, NULL),
(83, 'V06543', 'ABHISHEK RATHORE', NULL, NULL, 3, '1989-07-11', '9340683355', 'S/o Narendra 789, Abhinandan Nagar,Mandsaur,Mandsau,Dist:Mandsaur,Madhya Pradesh      INDIA MADHYA PRADESH ', 'MADHYA PRADESH', 'INDIA', 'NA', 'rathoreabhishek606@gmail.com', 1, 'B+', '2019-05-03', '482816692879', 0, 105, NULL),
(84, 'V04752', 'RISHI RAM SAPKOTA', NULL, NULL, 4, '1999-06-15', '9022963887', 'NAWALPUR, GAINDAKOT NEPAL       ', 'NEPAL', 'NEPAL', 'NA', 'NA', 1, 'O+', '2022-02-16', '595597913358', 0, 105, NULL),
(85, 'V06164', 'AARAN ASHISH SEQUEIRA', NULL, NULL, 4, '2000-10-04', '8431616540', '1-29-2403/2, JPEGEBAO; ROAD BOLOOR VILLAGE, MANGLORE, ASHOKNAGAR DAKSHINA KANNADA, KARNATAKA      ', 'KARNATAKA', 'INDIA', 'NA', 'NA', 1, 'A+', '2022-02-16', '758458636912', 0, 105, NULL),
(86, 'V06158', 'YASHAS S K', NULL, NULL, 1, '1994-06-15', '7204497822', '#4-51(5) ANUGRAHA KUMPANAMAJAL HOUSE PUDU VILLAGE, BANTWAL, FARANGIPET DAKSHINA KANNADA, KARNATAKA   574143   ', 'KARNATAKA', 'INDIA', 'NA', 'yashassk4@gmail.com', 1, 'O+', '2020-11-25', '783806697937', 0, 105, NULL),
(87, 'V05345', 'ANKUSH PATIAL', NULL, NULL, 4, '1991-08-12', '9284338489 ', 'VILLAGE KARLOLI PO KARLOLI TEHSLI GHUMARWIN KARLOLI   174029 INDIA HIMACHAL PRADESH ', 'HIMACHAL PRADESH', 'INDIA', 'NA', 'NA', 1, 'B+', '2023-01-24', '231879844594', 0, 105, NULL),
(88, 'V07019', 'YAGYARAJ HARIDATTA JOSHI', NULL, NULL, 10, '1993-01-17', '9768378370', 'H NO 433 6 B, GROUND FLOOR, SOCCORRO, PORVORIM NORTH GOA GOA 403521     INDIA GOA ', 'GOA', 'INDIA', 'NA', 'joshiyagyaraj46@gmail.com', 1, 'O+', '2023-01-10', '779444320226', 0, 105, NULL),
(89, 'V06989', 'CHETAN SINGH RAWAT', NULL, NULL, 4, '1999-06-02', '8999902153', 'BAITADI DASHARATHCHAND     NEPAL  ', 'NEPAL', 'NEPAL', 'NA', 'chetanrawat420@gmail.com', 1, 'A+', '2022-02-22', '978627961190', 0, 105, NULL),
(90, 'V06174', 'DEEPENDRA UPADHYAY', NULL, NULL, 42, '1981-05-01', '7499712156', '#15, 2ND CROSS, SANJEEVINI NAGAR, MOODALAPALYA, ANJINIYA, TEMPLE, BANGLORE, KARNATAKA  560072        ', 'KARNATAKA', 'INDIA', 'NA', 'deepupadhayay0309@gmail.com', 1, 'B+', '2013-05-08', '603343226275', 0, 106, NULL),
(91, 'H00680', 'ASHOK RAJ JOSHI', NULL, NULL, 4, '1998-01-23', '9850543341', 'NA', 'NA', 'INDIA', 'NA', 'joshias2006@yahoo.com', 1, 'B+', '2022-08-29', '617098791302', 0, 106, NULL),
(92, 'V06635', 'DHIRENDRA CHAUDHRY', NULL, NULL, 2, '1999-07-04', '9763230615', 'H NO 1006/1 VIJAY NAGAR ALTO PORVORIM NORTH GOA GOA 403521      INDIA GOA ', 'GOA', 'INDIA', 'NA', 'chaudharydhirendra573@gmail.com', 1, 'AB+', '2022-11-29', '946796646570', 0, 106, NULL),
(93, 'V06851', 'GOVIND RAJ PANDEY', NULL, NULL, 10, '1994-07-30', '7820890932', 'MELAULI 2 BAITADI NEPAL    NEPAL  ', 'NEPAL', 'NEPAL', 'NA', 'NA', 1, 'B+', '2014-05-15', '608685347893', 0, 106, NULL),
(94, 'D00089', 'PIKESH CHAUDHARY', NULL, NULL, 8, '1989-11-21', '7083868528', 'BHIMDATTA NAGAR, KANCHANPUR, NEPAL      NEPAL  ', 'NEPAL', 'NEPAL', 'NA', 'pikeshchaudharypk@yahoo.com', 1, 'A+', '2016-02-01', '882885979655', 0, 106, NULL),
(95, 'V02894', 'PRATAP SINGH KARKI', NULL, NULL, 43, '1992-12-30', '7264921320', 'NA', 'NA', 'INDIA', 'NA', 'karki-prashant@ymail.com', 1, 'A+', '2013-10-01', '674260660357', 0, 106, NULL),
(96, 'V00847', 'PUSKAR BAHADUR CHAND', NULL, NULL, 4, '1999-03-07', '7083298041', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'B+', '2022-02-17', '648785273324', 0, 106, NULL),
(97, 'V06163', 'KISHORE CHAND', NULL, NULL, 63, 'NA', '8076234966', 'H. NO. 1-7/90, SECTOR -16, ROHINI ROHINI SECTOR 16 , NORTH WEST DELHI DELHI    110085   ', 'DELHI', 'INDIA', 'NA', 'thakurkishor498@gmail.com', 19, 'A+', 'NA', '729175124815', 0, 106, NULL),
(98, 'D00999', 'PRAKASH BAGLARY', NULL, NULL, 4, '1998-08-01', '9864850802', 'DAILANG KHUTI,UDALGURI ASSAM-784509     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'prokashbaglary23@gmail.com', 1, 'A+', '2021-11-17', '720802320062', 0, 107, NULL),
(99, 'V05934', 'NITIN KUMAR', NULL, NULL, 4, '1996-07-31', '8926262660', 'H. NO. 519, MAHENDER GARH ROAD GANESH COLONY, NARNAUL MAHENDRAGARH , HARYANA   123001   ', 'HARYANA', 'INDIA', 'NA', 'official.nitin.ni@gmail.com', 1, 'A+', '2022-03-23', '482016790327', 0, 107, NULL),
(100, 'D00809', 'JUGAL KISHORE SHARMA', NULL, NULL, 3, '1990-07-09', '8299825159', '405/3 SARAI MALI KHA SHOWK LUCKNOW UTTAR PRADESH 226003    INDIA UTTAR PRADESH ', 'UTTAR PRADESH', 'INDIA', 'NA', 'ojugaljd16@gmail.com', 1, 'O', '2022-05-24', '420847818755', 0, 107, NULL),
(101, 'H02779', 'SHIVRAJ SHARNAPPA DEVDURG', NULL, NULL, 4, '2002-04-24', '9324209416', 'R.C.MARG., NEAR SANTOSH GENERAL STORE., ROOM NO.201, SHASTRI NAGAR, VASHINAKA., FCI S.O, FCI, MUMBAI, MAHARASHTRA, 400074     INDIA MAHARASHTRA ', 'MADHYA PRADESH', 'INDIA', 'NA', 'shivraj08@gmail.com', 1, 'A+', '2022-11-22', '657861507033', 0, 107, NULL),
(102, 'V06823', 'SURAJ PANDEY', NULL, NULL, 4, '2000-04-17', '8011774951', 'JOYPUR TOWN, DIBRUGARH ASSAM 786614    786614 INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'sp9778322@gmail.com', 1, 'B-', '2022-11-22', '618404178924', 0, 107, NULL),
(103, 'D00940', 'PALASH TAMULY', NULL, NULL, 4, '1998-08-31', '7896675896', 'TENGAKHAT, ABHOIPURIA, DIBRUGARH ASSAM 786103    786103 INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'palashtamuli7896@gmail.com', 1, 'AB+', '2023-01-31', '311103921652', 0, 107, NULL),
(104, 'H03067', 'RAJA BHOWMICK', NULL, NULL, 4, '1999-04-26', '8918161496', 'NAGARUKHRA KATHALTALAPARA NAGARUKHRA HARINGHATA NADIA WEST BENGAL      INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'rajabhowmick228@gmail.com', 1, 'B+', '2022-08-18', '556146018403', 0, 107, NULL),
(105, 'H02870', 'PRATEEK SARKI', NULL, NULL, 1, '1999-09-20', '8974261079', 'NASPATI GHARI, BARA BAZAR, EAST KHASI HILLS, LEWDUH,  MEGHALAYA 793002     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'theking260499@gmail.com', 1, 'B+', '2021-12-09', '825064236769', 0, 108, NULL),
(106, 'H02654', 'RIWAJ CHHETRI', NULL, NULL, 1, '1997-11-12', '8617085494', 'MISSION HILL  GORUBATHAN, DARJEELING WEST BENGAL   735231 INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'myselfriwaj@gmail.com', 1, 'O+', '2021-12-22', '798825494892', 0, 108, NULL),
(107, 'H02666', 'AAKASH RAI', NULL, NULL, 1, '1995-07-07', '7083370517', 'LOWER LADAM (BENDA) LADAM KHASMAHAL, KAGAY BAZAR DARJEELING , WEST BENGAL   734311   ', 'WEST BENGAL', 'INDIA', 'NA', 'cobeinchamling95@gmail.com', 1, 'B+', '2021-12-17', '676703809414', 0, 108, NULL),
(108, 'H02664', 'DEEP NEWAR', NULL, NULL, 10, '1996-08-11', '8415077217', 'ELECTRICAL COLONY, DIRANG WEST KAMENG ARUNACHAL PRADESH   790101   ', 'ARUNACHAL PRADESH', 'INDIA', 'NA', 'deepnewar1994@gmail.com', 1, 'O+', '2022-02-13', '396087712810', 0, 108, NULL),
(109, 'V06144', 'SUBHAM CHAND', NULL, NULL, 1, '1998-12-08', '9834301911', 'KANCHANPUR  MEHENDRANAGAR     NEPAL  ', 'NEPAL', 'NEPAL', 'NA', 'NA', 1, 'O', '2023-02-14', '897366173156', 0, 108, NULL),
(110, 'H03079', 'AEBISH PAYENG', NULL, NULL, 4, '2004-01-13', '7636045274', 'SONAIMIRI, LOKRA DAFALA GAON, SONITPUR ASSAM 784102     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'aebishpayeng@gmail.com', 1, 'B+', '2023-01-24', '469687893524', 0, 108, NULL),
(111, 'V07015', 'RAKESH SINGH', NULL, NULL, 2, '1998-11-26', '9304238648', 'GRAM POST SONBARSHA,THANA NAWANAGAR,KESATH BUXAR  BIHAR     INDIA BIHAR ', 'BIHAR', 'INDIA', 'NA', 'NA', 1, 'O+', '2023-07-07', '762482600367', 0, 108, NULL),
(112, 'D01043', 'NON TAYENG', NULL, NULL, 4, '2000-01-17', '8257804255', 'E-94, TAPAT, LOWER DIBANG VALLEY ARUNANCHAL PRADESH 792110     INDIA ARUNANCHAL PRADESH ', 'ARUNACHAL PRADESH', 'INDIA', 'NA', 'nontayeng47@gmail.com', 1, 'O+', '2022-07-19', '639085547766', 0, 108, NULL),
(113, 'H02833', 'ROMAL SAWMA', NULL, NULL, 4, '2002-09-19', '8131964111', '122, ZOTLANG, M SECTION, ZOTLANG, CHAMPHAI, MIZORAM 796321     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'NA', 1, 'O+', '2022-12-07', '505812808883', 0, 109, NULL),
(114, 'H03018', 'JOY URAON', NULL, NULL, 4, '1998-10-11', '9749006380', 'SUBHASHPALLY, JAYGAON (CT) JALPAIGURI, JALGAON WEST BENGAL 736182    736182 INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'joyuraon8@gmail.com', 1, 'O+', '2022-09-06', '635478384070', 0, 109, NULL),
(115, 'H02894', 'KARAN DEV BHATT', NULL, NULL, 27, '2002-06-11', '9307388795', 'SECTOR 35, VILLAGE MORNA, NOIDA, GAUTAM BUDDHA NAGAR, UTTAR PRADESH 201301     INDIA UTTAR PRADESH ', 'UTTAR PRADESH', 'INDIA', 'NA', 'sunilbhatt3619@gmail.com', 2, 'B+', '2022-07-19', '224101266338', 0, 109, NULL),
(116, 'H02835', 'ZOREM MAWIA', NULL, NULL, 4, '2001-07-04', '7422949327', 'VENGTHLANG, N KHAWBUNG, CHAMPHAI, MIZORAM 796321     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'NA', 1, 'B+', '2023-01-24', '279971872882', 0, 109, NULL),
(117, 'V07005', 'MAHENDRA THAPA', NULL, NULL, 7, '2001-05-19', '7431920357', 'UPPER KHANI, SLOKBHIR KHASMAHAL, SEOKBIR, DARJEELING WEST BENGAL 734301     INDIA WEST BENGAL  ', 'WEST BENGAL', 'INDIA', 'NA', 'mt2537317@gmail.com', 3, 'O+', '2023-02-07', '428477850963', 0, 109, NULL),
(118, 'H03077', 'ALLAN GEORGE RATNAN', NULL, NULL, 2, '2004-05-15', '7477867251', 'HOMES B-2,HOMES ST.AND GRAIHMS TOPKHANA KALIMPOMG DARJEELING WEST BENGAL      INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'allansundas@007@gmail.com', 1, 'O+', '2023-02-07', '296178843537', 0, 109, NULL),
(119, 'H03074', 'DARPAN RAI', NULL, NULL, 7, '2001-06-23', '8389842990', 'KAMESHI, COMESI FOREST, KALLIMPONG, DARJEELING WEST BENGAL      INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'drai98108@gmail.com', 3, 'B+', '2023-02-07', '806810463593', 0, 109, NULL),
(120, 'H03075', 'NORBU TSHERING LEPCHA', NULL, NULL, 4, '1998-10-17', '9883774679', 'MARTAM PW, MARTAM NAZITAM GUP,UPPER MARTAM EAST SIKKIM  SIKKIM      INDIA SIKKIM ', 'SIKKIM', 'INDIA', 'NA', 'neurotshering10@gmail.com', 1, 'A+', '2023-01-31', '304056658540', 0, 109, NULL),
(121, 'V07023', 'KHEM PROSAD BHUJEL', NULL, NULL, 4, '2003-07-16', '9101047701', 'PASNOI KHUTI MAJBAT UDALGURI  ASSAM     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'NA', 1, 'A+', '2022-08-23', '479311779974', 0, 110, NULL),
(122, 'V06611', 'ANSHUK KR SHARMA', NULL, NULL, 1, '1997-04-10', '6913649224', 'SANTINAGAR, BALADMARI CHAR PT I, GOALPARA ASSAM 783121     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'anshuksharma0@gmail.com', 1, 'O+', '2021-02-25', '259044844375', 0, 107, NULL),
(123, 'V05662', 'ASIT SENAPATI', NULL, NULL, 1, '1994-12-09', '8917635984', 'GAMBHARIA, BAJITPUR BHOGRAI, GAMBHARIA BALESWAR, ODISHA   756085 INDIA ODISHA ', 'ODISHA', 'INDIA', 'NA', 'asitsenapati88@gmail.com', 1, 'B+', '2021-02-26', '803515054221', 0, 110, NULL),
(124, 'V05670', 'SUBHASH DEKA', NULL, NULL, 8, '1992-09-21', '8822865675', '15 NO. NATIONAL HIGHWAY JAAKUAPARA, KALITAPARA DARRANG ASSAM   784145   ', 'ASSAM', 'INDIA', 'NA', 'subhashdeka07@gmail.com', 1, 'B+', '2016-03-16', '361726990614', 0, 110, NULL),
(125, 'H00945', 'SUMIT THAPA', NULL, NULL, 4, '1994-09-12', '8390550698', 'NA', 'NA', 'INDIA', 'NA', 'sumit.thapa7@yahoo.com', 1, 'O+', '2023-06-15', '811767672836', 0, 110, NULL),
(126, 'H03161', 'NAYANANANDA GOHAIN', NULL, NULL, 4, '1999-03-03', '8402807990', '1 NO RAJGHAR PHUTAHULA DIBRUGARH ASSAM 786010     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'nayanananda74@gmail.com', 1, 'O+', '2023-01-04', '383417715039', 0, 110, NULL),
(127, 'H03041', 'SONU SINGH RAWAT', NULL, NULL, 1, '1998-02-24', '7980267941', 'KWARAB, KOSYA KUTOLI, NANITAL UTTARAKHAND 263138     INDIA UTTARAKHAND ', 'UTTARAKHAND', 'INDIA', 'NA', 'sonu7980267941@gmail.com', 1, 'O+', '2023-02-20', '775825834094', 0, 110, NULL),
(128, 'H03082', 'SHIMANTA DAS', NULL, NULL, 63, 'NA', '8135019223', 'JIA GABHARU, NO 4 JHAWANI, SONITPUR, GARUBANDHA ASSAM 784506     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'rdrohitdas84@gmail.com', 19, 'AB+', 'NA', '400432080638', 0, 110, NULL),
(129, 'V06610 ', 'RAJMIN AMIN', NULL, NULL, 4, '2000-02-15', '8811924711', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-01-31', 'NA', 0, 111, NULL),
(130, 'H03069', 'JITENDRA KUMAR', NULL, NULL, 63, 'NA', '8409748490', 'HEMJAPUR CHAND TOLA SHIVKUND THANA DHARAHARA JAMALPUR MUNGER  BIHAR     INDIA BIHAR ', 'BIHAR', 'INDIA', 'NA', 'jitukumar12120@gmail.com', 19, 'O+', 'NA', '693108557327', 0, 111, NULL),
(131, 'V06613 ', 'SANJAY SINGH', NULL, NULL, 4, '1996-01-25', '8011513802', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2021-11-01', 'NA', 0, 111, NULL),
(132, 'V05900', 'ABHISHEK VERMA', NULL, NULL, 2, '1998-07-25', '8503996090', '86, SHIV MANDIR  BANAR JAIPUR RAJASTHAN   303105   ', 'RAJASTHAN', 'INDIA', 'NA', 'abhishekverma2501@gmail.com', 1, 'B+', '2023-04-11', '630181269137', 0, 111, NULL),
(133, 'V07095', 'SAYANTAN JANA', NULL, NULL, 4, '1999-08-23', '8420719307', 'UV-26-03D UDAYAN 1050/1 SURVEY PARK SANTOSHPUR WEST BENGAL 700075     INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'sayantan.985j@gmail.com', 1, 'O+', '2023-01-31', '357582358200', 0, 111, NULL),
(134, 'H03065', 'ARIF HOSSAIN', NULL, NULL, 44, '1984-04-16', '9123674265', 'U 82/2 SLAUGHTER HOUSE LANE BARLALA KOLKATA WEST BENGAL      INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'arhossain0786@gmail.com', 12, 'O+', '2023-04-18', '832484063640', 0, 111, NULL),
(135, 'H02107', 'LALRAMMAWII', NULL, NULL, 1, '2000-02-06', '9077543381', 'C-12, CHITE ROAD NEAR COMMUNITY; HALL, ARMED VENG SOUTH AIZWAL MUNCIPAL COUNCIL   796008  MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'NA', 1, 'A+', '2020-12-08', '860976181953', 0, 1, NULL),
(136, 'V05426', 'LALHMINGCHAWII', NULL, NULL, 1, '1994-05-19', '8794693472', 'C-28/3, SECTION -III ARMED VENG SOUTH, NEAR COMMUNITY HALL AIZAWL MUNICIPAL COUNCIL MIZORAM  796008   ', 'MIZORAM', 'INDIA', 'NA', 'NA', 1, 'O+', '2020-12-08', '592792489191', 0, 1, NULL),
(137, 'V05423', 'F LALCHHANCHHUAHI', NULL, NULL, 2, '2004-03-04', '8413936014', 'HT/65, T SECTION, NEAR BAPTIST CHURCH,  HUNTHAR MUNICIPAL COUNCIL, VAIVAKAWN AIZAWL    796009 INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'achhanifanai739@gmail.com', 1, 'B+', '2020-12-08', '746154705769', 0, 1, NULL),
(138, 'V07309', 'LALHMANGAIHZUALI', NULL, NULL, 2, '1998-03-05', '8794352494', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-07-29', 'NA', 0, 1, NULL),
(139, 'V07174', 'RINGAMPHI RUNGSUNG', NULL, NULL, 2, '1995-06-12', '7406275226', 'TALUI VILLAGE, TOLIOI, UKHRUL, MANIPUR  MANIPUR 795142     INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'ringamphirungsung@gmail.com', 1, 'O+', 'NA', '640399801711', 0, 2, NULL),
(140, 'V07175', 'T S RAIVEINE', NULL, NULL, 3, '1993-03-08', '9663559066', 'H.NO.40, KHABUNG KARONG, SENAPATI MANIPUR     INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'NA', 1, 'O+', 'NA', '803732798198', 0, 2, NULL),
(141, 'V06343', 'LALDUHKIMI', NULL, NULL, 4, '1999-01-29', '8379866169', 'D-87 MUAL VENG SIHPUI TUKHUR DURTLANG AIZWAL 796014 INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'mdralte8@gmail.com', 1, 'O+', '2022-05-17', '521226102308', 0, 2, NULL),
(142, 'V06520', 'RINGMICHON KASOMWOSHI', NULL, NULL, 4, '2003-02-28', '9612719807', 'CHINGAI VILLAGE, CHINGAI, UKHRUL, MANIPUR 795142     INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'ringmichonkasomwo@gmail.com', 1, 'A+', '2022-07-15', '326909900414', 0, 2, NULL),
(143, 'V06275', 'PEMYA LUNGLO', NULL, NULL, 5, '2001-09-08', '9863628969', 'RAMVA URKHUL DISTRICT MANIPUR  MIZORAM 795142   795142  MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'pemyalunglo@gmail.com', 2, 'A+', '2022-07-17', '650936664564', 0, 2, NULL),
(144, 'H02840', 'MANJITA CHETTRY', NULL, NULL, 1, '1999-12-15', '7005765219', 'HOUSE NO 89, HENGBUNG, SENAPATI, MANIPUR 795129     INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'manjitachettri14@gmail.com', 1, 'B+', '2022-07-18', '904224247542', 0, 2, NULL),
(145, 'D00427', 'KAVINI K AWOMI', NULL, NULL, 1, '1993-10-18', '9366806556', 'H. NO. 540, MODEL COLONY PURANABAZAR A  DIMAPUR NAGALAND  797116   ', 'NAGALAND', 'INDIA', 'NA', 'NA', 1, 'B+', '2021-11-27', '909737978493', 0, 3, NULL),
(146, 'D00428', 'IMOTILA JAMIR', NULL, NULL, 1, '1997-03-16', '8858925870', 'H. NO. 402, ARTANG WARD MOKOKCHUNG (MC) MOKOKCHUNG NAGALAND  798601   ', 'NAGALAND', 'INDIA', 'NA', 'NA', 1, 'A+', 'NA', '710803053897', 0, 3, NULL),
(147, 'D00437', 'AKUMSENLA', NULL, NULL, 2, '1999-07-18', '9612223632', 'H NO. 317, WARD 7 CHUMUKEDIMA DIMAPUR NAGALAND  797103   ', 'NAGALAND', 'INDIA', 'NA', 'www.akumsenla950@gmail.com', 1, 'O+', '2021-08-31', '956811308903', 0, 3, NULL),
(148, 'V07194', 'PRETTY SANGMA', NULL, NULL, 6, '2002-12-16', '8471912812', 'GOHAL KONA, KAMRUP, ASSAM ASSAM 781123     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'prettyharfrin666@icloud.com', 3, 'B+', '2023-06-12', '608313700172', 0, 3, NULL),
(149, 'V06591', 'AMANISHA DAS', NULL, NULL, 4, '2004-02-09', '7099355383', 'MANGALDAI GAON, DARRANG, ASSAM 784125     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'ankitada349@gmail.com', 1, 'B+', '2022-08-18', '966302849911', 0, 3, NULL),
(150, 'V06903', 'MRIGAKHI BORAH', NULL, NULL, 4, '2001-12-05', '6001546960', 'MORANGIAL GAON JORHAT ASSAM     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'mrigakhiborah2004@gmail.com', 1, 'A+', '2022-12-05', '957611288285', 0, 4, NULL),
(151, 'V06899', 'SABINA THAPA', NULL, NULL, 4, '2002-03-25', '6909018921', 'TAPHOU NEPALI PART I ,NAGA SENAPATI  MANIPUR     INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'magarsabina693@gmail.com', 1, 'AB+', '2022-12-22', '472809634509', 0, 4, NULL),
(152, 'V06286', 'LALDUHSAKI', NULL, NULL, 4, '2003-04-27', '8415099696', 'Y-4/3, CHHINGA VENG, NEARYMA PRESBYTERIAN CHURCH, Y-SECTION, AIZAWL MUNCIPAL COUNCIL, AIZAWL, AIZAWL, MIZORAM 796001   796001 INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'clussid02@gmail.com', 1, 'B+', '2022-04-21', '600264795250', 0, 4, NULL),
(153, 'V06287', 'SUPRIYA PUN', NULL, NULL, 4, '2002-06-02', '6909288346', 'B-95, CSECTION, ICFAI ROAD DURTLANG NORTH AIZWAL BAWNGKAWN MIZORAM    INDIA  ', 'MIZORAM', 'INDIA', 'NA', 'maliksupriya61@gmail.com', 1, 'A+', '2022-04-21', '480905041379', 0, 4, NULL),
(154, 'V06905', 'SIMRAN BHUMIJ', NULL, NULL, 4, '2000-02-19', '9101860460', 'HATIALI SIDING GRANT DIBRUGARH ASSAM     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'simranbhumij44@gmail.com', 1, 'A+', '2022-12-05', '878701370070', 0, 4, NULL),
(155, 'D00922', 'VANLALREMTLUANGI', NULL, NULL, 1, '1991-10-19', '9366189559', 'VENGHLUI, CHAMRING, AIZAWL, AIBAWK MIZORAM 796190     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'mamipachuau202@gmail.com', 1, 'B+', '2023-01-31', '815520761645', 0, 4, NULL),
(156, 'H03152', 'GRACE LALZAWMLIANI', NULL, NULL, 3, '1995-12-14', '7038054557', 'D/CH-38 A, DINTHAR, AIZAWL MUNCIPAL COUNCIL, AIZAWL MIZORAM 796009     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'gchhakchhuak@ymail.com', 1, 'O+', '2023-06-03', '885935439746', 0, 5, NULL),
(157, 'H01498', 'R C LALRUATFELI', NULL, NULL, 3, '1999-12-12', '8767083147', 'C/O SALEMTHARI, H NO. 11, VENGLAI, NEAR PRESBYTERIAN CHURCH , SERCHHIP, MIZORAM        ', 'MIZORAM', 'INDIA', 'NA', 'NA', 1, 'AB+', 'NA', '275666760422', 0, 5, NULL),
(158, 'V04301', 'VANLALNGHAKI', NULL, NULL, 4, '1998-10-16', '9774309752', 'E-17, E BAIL 5 NA, NEAR KM HIGH SCHOOL, DAWNPUI VENGTHAR, AIZAWL , MIZORAM      796009   ', 'MIZORAM', 'INDIA', 'NA', 'NA', 1, 'O+', '2021-01-23', '372214260864', 0, 5, NULL),
(159, 'H02069', 'LALZAMLOVI PAUTU', NULL, NULL, 1, '1992-01-29', '7005540036', '66, CHHIM VENG NEAR UPC, VAIRENGTE KOLASIB MIZORAM  796101 INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'maryzcepautu@gmail.com', 1, 'O', '2021-09-06', '321064590979', 0, 5, NULL),
(160, 'V06630', 'REMTLUANGPUII', NULL, NULL, 4, '1997-02-07', '7030375742', 'VENGCHUNG, NEAR GOVT MIDDLE SCHOOL, SERCHHIP, MIZORAM 796181     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'remiralte956@gmail.com', 1, 'O+', '2022-08-18', '280134956611', 0, 5, NULL),
(161, 'V07032', 'VANLALREMRUATI (ENETH)', NULL, NULL, 3, '1995-04-11', '7000420614', 'SAIHATLANGKAEN I, SAIHA  MIZORAM 796901     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'vanlalremruatieneth@gmail.com', 1, 'A+', '2023-01-24', '732352334326', 0, 7, NULL),
(162, 'V04302', 'VANLALHRIATPUII', NULL, NULL, 4, '2000-05-06', '8837408676', 'B - 127, VENGPUI, NEAR COMMUNITY HALL, DARLAWN , AIZAWL, MIZORAM      796111   ', 'MIZORAM', 'INDIA', 'NA', 'NA', 1, 'A+', '2019-08-26', '273064736768', 0, 7, NULL),
(163, 'H02882', 'REBECCA LALDUHKIMI', NULL, NULL, 7, '2001-11-26', '9862978991', '11 SECTOR-E SAIRANG ELECTRIC VENG NEAR YMA HALL,SAIRANG AIZAWL MIZORAM 796410      INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'rebeccalalduhkimi@gmail.com', 3, 'O+', '2022-08-18', '267198226759', 0, 7, NULL),
(164, 'V07298', 'CHRISTINA PRIYA SAHA', NULL, NULL, 3, '1997-05-12', '7044649153', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-07-24', 'NA', 0, 7, NULL),
(165, 'V03896', 'LALRINMAWII', NULL, NULL, 1, '1995-10-01', '8669897346', 'E-078, SECTION E , ELECTRIC VENG, SAIRANG, AIZAWL,       INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'NA', 1, 'A+', '2019-12-08', '566255516870', 0, 7, NULL),
(166, 'V04440', 'MALSAWMPUII HMAR', NULL, NULL, 3, '1997-07-12', '8415883099', 'KHAMPAILUNG, SERCHHIP DIST, AIZWAL, MIZORAM, NEAR HIGH SCHOOL        ', 'MIZORAM', 'INDIA', 'NA', 'sawmpuiihmax10@gmail.com', 1, 'A+', '2021-06-01', '807362910307', 0, 8, NULL),
(167, 'V04300', 'LILYPARMAWII', NULL, NULL, 3, '1989-10-13', '8257966784', 'C-258, SECTION - III, NEAR PLAY GROUND, ARMED VENG, AIZAWL,MIZORAM     796001   ', 'MIZORAM', 'INDIA', 'NA', 'NA', 1, 'O+', '2019-08-26', '389207082832', 0, 8, NULL),
(168, 'V03714', 'RUTHI RAMENGMAWII', NULL, NULL, 1, '1992-03-16', '7218860161', 'LV-A37(a), RAMTHAR, NEAR R C KHUMA ROAD, LEITAN. TIANGNUAM    AIZWAL  INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'NA', 1, 'B+', '2019-12-08', '213047596203', 0, 8, NULL),
(169, 'V04415', 'KUZHOPOLU CHIZO', NULL, NULL, 1, '1995-12-19', '7721832795', 'PO - PHEK, MISSION COMPOUND PHEK SADAR NAGALAND   797108   ', 'NAGALAND', 'INDIA', 'NA', 'kchizo17@gmail.com', 1, 'O+', '2021-02-19', '333766747357', 0, 8, NULL),
(170, 'V04438', 'R LALHUMHIMI', NULL, NULL, 1, '1997-01-28', '9370758507', 'A 712, SECTION 2 NEAR TURNNING POINT AIZWAL, VENGLAI MIZORAM  79607   ', 'MIZORAM', 'INDIA', 'NA', 'NA', 1, 'O+', '2021-03-20', '575325969212', 0, 8, NULL),
(171, 'V04437', 'LALRUATFELI', NULL, NULL, 1, '1994-05-14', '8575162003', 'N -44 A, NEUVA SECTION MUABAWK ROAD, BUNGKAWN AIZWAL MUNICIPAL COUNCIL MIZORAM  796001   ', 'MIZORAM', 'INDIA', 'NA', 'NA', 1, 'O+', '2019-12-08', '459864934589', 0, 8, NULL),
(172, 'V04471', 'KANCHUILA LEISAN', NULL, NULL, 1, '1996-12-27', '7264947088', 'SEIKHOR , UKHRUL  CENTRAL SUB - DIVISION  MANIPUR    795142   ', 'MANIPUR', 'INDIA', 'NA', 'kanchuilamercy@gmail.com', 1, 'O+', 'NA', '512766001936', 0, 9, NULL),
(173, 'V04565', 'WONKHUIMI LEISAN', NULL, NULL, 1, '1993-06-03', '8390138837', 'SEIKHOR , UKHRUL MANIPUR    795142   ', 'MANIPUR', 'INDIA', 'NA', 'leisanwomkhuimi@gmail.com', 1, 'O+', 'NA', '744835011570', 0, 9, NULL),
(174, 'D00620', 'WATIASENLA', NULL, NULL, 8, '1986-06-07', '8787450725', 'ALONGMEN,  MOKOKCHUNG TOWN NAGALAND   798601   ', 'NAGALAND', 'INDIA', 'NA', 'NA', 1, 'AB+', '2019-12-07', '727940983093', 0, 9, NULL),
(175, 'H00927', 'SARUNA PRADHAN', NULL, NULL, 1, '1993-11-26', '7076331236', 'NA', 'NA', 'INDIA', 'NA', 'sarunapradhan756@gmail.com', 1, 'O+', '2021-04-24', '411102462130', 0, 9, NULL),
(176, 'D00825', 'C LALZIRMAWII', NULL, NULL, 1, '1997-06-01', '9362629347', 'H.NO.343 RAMHLUN SOUTH 1 AIZWAL MUNCIPAL COUNCIL AIZWAL MIZORAM 796012    INDIA  ', 'MIZORAM', 'INDIA', 'NA', 'lalzirmawiic@gmail.com', 1, 'AB+', '2022-04-13', '751828491112', 0, 9, NULL),
(177, 'V07287', 'SAGARIKA RANA', NULL, NULL, 4, '2000-08-02', '8200384745', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-07-07', 'NA', 0, 9, NULL),
(178, 'H02884', 'MALSAWMDAWNGZUALI', NULL, NULL, 4, '2002-02-28', '8415029667', 'F-66/I JAMPLAZ STREET LOWER CHANMARI AIZAWL,MINICIPAL COUNCIL AIZAWL MIZORAM796007      INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'malsawmdawngzuali5@gmail.com', 1, 'O+', '2022-08-20', '722811518539', 0, 10, NULL),
(179, 'H03003 ', 'MALSAWMKIMI', NULL, NULL, 3, '1994-08-11', '7005483987', 'CNBF 7C CHALTLANG, SALVATION ARMY BIAK IN MUAL, AIZAWL MUNCIPAL COUNCIL, AIZAWL MIZORAM 796012     INDIA MIZORAM  ', 'MIZORAM', 'INDIA', 'NA', 'kimanastasio28@gmail.com', 1, 'A+', '2022-11-21', '806671368797', 0, 10, NULL),
(180, 'V03270', 'RAMENGMAWII FANAI', NULL, NULL, 4, '1997-07-13', '7720125698', 'NEW SAIHA EAST-II, VILL SAIHA     796901 India MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'NA', 1, 'A+', 'NA', '210504808330', 0, 10, NULL),
(181, 'D00921', 'REBECCA LALPIANFELI', NULL, NULL, 2, '2000-01-02', '7479026728', 'S MAUBUANG, AIZAWL, AIBAWK MIZORAM 796190     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'chenkualrebecca13@gmail.com', 1, 'O+', '2022-08-04', '925022707532', 0, 10, NULL),
(182, 'H03150', 'KAUSHILLA TAMANG', NULL, NULL, 7, '2000-09-18', '6296093199', 'SURUK KHASMAHAL, KALIMPONG, DARJEELING WEST BENGAL 734301     INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'sellytamang223499@gmail.com', 3, 'O+', '2022-06-17', '404296858037', 0, 11, NULL),
(183, 'H03192', 'SUSU HANGMA SUBBA', NULL, NULL, 3, '1998-03-27', '9064437748', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-07-10', 'NA', 0, 11, NULL),
(184, 'V05235', 'SANDHYA SUBBA', NULL, NULL, 4, '1997-10-23', '8372602697', 'RIDNAG PW TIMBURBONG GPU WEST SIKKIM   737121   ', 'WEST SIKKIM', 'INDIA', 'NA', 'sndhsubba@gmail.com', 1, 'O+', 'NA', '590890761056', 0, 11, NULL),
(185, 'V06391', 'NANDIKA PRADHAN', NULL, NULL, 4, '1997-05-13', '9862493103', 'UPPER MAWPREM, NEAR SHIV MANDIR, UPPER MAWPREM, SHILLONG (MB), EAST KHASI HILLS, LEWDUH, MEGHALAYA 793002     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'nandikapradhan10@gmail.com', 1, 'A+', '2022-05-28', '765604913712', 0, 11, NULL),
(186, 'V05880', 'PUSPA MANGER', NULL, NULL, 6, '1998-04-08', '8101956821', 'KOPIBARI-SYARI PW, SYARI ROAD LAGAMTHANG KOPIBARI SYARI TATHANGCHEN SYARI GPU , TADONG, EAST SIKKIM   737102   ', 'EAST SIKKIM', 'INDIA', 'NA', 'puspamanger0@gmail.com', 3, 'A+', '2021-10-26', '481401142074', 0, 11, NULL),
(187, 'H02949', 'NIKITA TAMANG', NULL, NULL, 8, '1997-02-07', '8001801943', 'BAGH DHARA ROAD NEAR SAI MANDIR SACHOOL LOWER SADHU DHARA KALIMPONG-I DARJEELING WEST BENGAL 734301     INDIA WEST BENGAL  ', 'WEST BENGAL', 'INDIA', 'NA', 'tamangnikita889@gmail.com', 1, 'A+', '2022-09-26', '514257228600', 0, 12, NULL),
(188, 'V03190', 'LALLAWMZUALI', NULL, NULL, 4, '1997-08-27', '7887933350', 'KEIFANG, VENGHLUN, TWAI      INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'NA', 1, 'A+', '2022-09-26', '686188713767', 0, 12, NULL),
(189, 'H03147', 'LALTLEIPUII', NULL, NULL, 8, '1994-04-01', '9774373920', 'ITI VENG,AIZAWL MUNICIPAL COUNCIL,AIZAWL MIZORAM    796001 INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'NA', 1, 'O+', '2023-05-30', '994153909626', 0, 12, NULL),
(190, 'V05043', 'M W THINGMILA', NULL, NULL, 5, '2000-07-07', '9284822034', 'T. CHANHONG VILLAGE, UKHRUL MANIPUR, PIN-795142        ', 'MANIPUR', 'INDIA', 'NA', 'NA', 2, 'A+', 'NA', '576506049773', 0, 12, NULL),
(191, 'H03001', 'ANISHA MINZ', NULL, NULL, 8, '1994-03-03', '7645918697', 'HOUSE NO 554 MIDDLE LANE DANGRATOLI FATIMA NAGAR RANCHI GPO RANCHI JHARKHAND 834001     INDIA JHARKHAND  ', 'JHARKHAND', 'INDIA', 'NA', 'anishaminz0707@gmail.com', 1, 'B+', '2023-02-12', '445272872695', 0, 12, NULL),
(192, 'V03187', 'RINGAMLA HUNGYO', NULL, NULL, 2, '1999-01-28', '9373456414', 'IRONG TANGKHUL, SENAPATI      INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'NA', 1, 'O+', 'NA', '580657770963', 0, 13, NULL),
(193, 'V07271', 'RINKHAR NGASHANGVA', NULL, NULL, 8, '1992-12-17', '9378154596', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-07-07', 'NA', 0, 13, NULL),
(194, 'V03189', 'M WORCHUIRIN', NULL, NULL, 9, '1996-05-20', '9767097894', 'TOTA VILLAVE, SOMDAL UKHRUL,      India MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'NA', 2, 'O+', 'NA', '863536097123', 0, 13, NULL),
(195, 'V03974', 'LUCY LALRINHLUI', NULL, NULL, 9, '1993-11-06', '8459378211', 'V SECTION, KAWNMAWI, N CHHIPPUI, MAMMIT, MIZORAM        ', 'MIZORAM', 'INDIA', 'NA', 'NA', 2, 'A+', '2019-12-10', '990017738047', 0, 13, NULL),
(196, 'V03984', 'LALDINTHARI', NULL, NULL, 9, '1997-01-13', '7972795268', 'V SECTION, N KHAWBUNG, CHAMPHAI, MIZORAM        ', 'MIZORAM', 'INDIA', 'NA', 'NA', 2, 'A+', '2019-11-23', '804965973290', 0, 13, NULL),
(197, 'V03986', 'Lalengmawii', NULL, NULL, 4, '2001-11-09', '8729870719', 'H NO. 134, NEAR COMMUNITY HALL, NORTH KHAWBUNG, CHAMPHAI, MIZORAM        ', 'MIZORAM', 'INDIA', 'NA', 'NA', 1, 'A+', '2019-11-23', '401609957650', 0, 13, NULL),
(198, 'V06935', 'MEENUKA CHHETRI', NULL, NULL, 4, '2001-11-09', '8367815995', 'TAKLING KHASMAHAL RANGLI, RANGILOT, DARJEELING WEST BENGAL     INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'meenukachhetri40@gmail.com', 1, 'A+', '2022-12-13', '817864219526', 0, 14, NULL),
(199, 'D00962 ', 'MEENU CHHETRI', NULL, NULL, 2, '1998-08-10', '8793866749', 'TAKLING BUSTY KHASMAHAL RANGLI RANGLIOT DARJEELING WEST BENGAL 734312     INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'chhetrimeenu40@gmail.com', 1, 'A+', '2022-12-13', '762771930034', 0, 14, NULL),
(200, 'V07257', 'CHONGAMLA ANGKANG', NULL, NULL, 10, '1992-03-14', '9233102620', 'LUNGPHU, UKHRUL MANIPUR 795145     INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'achongam@gmail.com', 1, 'A+', '2023-07-10', '283728296027', 0, 14, NULL),
(201, 'V01832', 'BABITA SUBBA', NULL, NULL, 4, '2000-03-25', '9604431136', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'B+', '2021-09-29', '650236806031', 0, 14, NULL),
(202, 'V06283', 'VI ZAIREMPUII', NULL, NULL, 4, '2001-05-05', '6909285712', 'DCH-199, SECTION-CH, TRANSPORT MUAL, DINTHAR, AIZAWL MUNCIPAL COUNCIL, AIZAWL, MIZORAM 796001   796001 INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'NA', 1, 'B+', '2022-04-22', '384567137500', 0, 14, NULL);
INSERT INTO `employee` (`emp_id`, `emp_code`, `fname`, `mname`, `lname`, `designation`, `dob`, `contact`, `address`, `state`, `country`, `pincode`, `email`, `department`, `blood_group`, `joining_date`, `aadhaar_number`, `salary`, `room_id`, `role`) VALUES
(203, 'V06282', 'VANLALTHATLUANGI', NULL, NULL, 11, '1998-10-16', '7629871275', 'D/CH-233(A), CH SECTION, DAM PHEI, DINTHAR, AIZAWL MUNCIPAL COUNCIL, VAIVAKAWN, AIZAWL, TLANGNUAM, MIZORAM 796009    INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'NA', 4, 'A+', '2022-04-22', '630843015759', 0, 14, NULL),
(204, 'V07097', 'LALTHANGPUII', NULL, NULL, 9, '1996-06-28', '9774819385', '114, VENGSANG,VAWMBAL ROAD, CHAMPHAI  MIZORAM 796321     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'colneytpi7@gmail.com', 2, 'A+', '2023-04-11', '754465894405', 0, 15, NULL),
(205, 'V04207', 'C HMINGTHANSANGI', NULL, NULL, 2, '2001-02-24', '9862240461', 'H. NO. 47, VENGLAI, NEAR VETY QUARTER, ZOBAWK, LUNGLEI, MIZORAM     796701   ', 'MIZORAM', 'INDIA', 'NA', 'NA', 1, 'AB+', '2019-12-10', '556827586634', 0, 15, NULL),
(206, 'D01053', 'LAL FAKZUALI', NULL, NULL, 2, '2002-07-09', '7629840458', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-07-18', 'NA', 0, 15, NULL),
(207, 'D01052 ', 'VANLAL NGAIHSAKI', NULL, NULL, 2, '2000-09-16', '8731889913', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-07-18', 'NA', 0, 15, NULL),
(208, 'D01055 ', 'NGUR THANPUII', NULL, NULL, 1, '1999-09-20', '8732874445', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-07-18', 'NA', 0, 15, NULL),
(209, 'V04798', 'LALRINSANGI', NULL, NULL, 1, '1996-09-12', '7627980323', '80(2), LUNGLAWN  LUNGLEI PO, LUNGLEI MIZORAM   796701   ', 'MIZORAM', 'INDIA', 'NA', 'NA', 1, 'O+', '2021-02-25', '749726694082', 0, 16, NULL),
(210, 'V06026', 'LALROZAMI', NULL, NULL, 1, '1999-11-06', '9612066572', 'V-95, SSA ROAD, NEAR SSA OFFICE KAHRAWT , CHAMPHAI MIZORAM    796321   ', 'MIZORAM', 'INDIA', 'NA', 'lalrozamirenthlei457@gmail.com', 1, 'O+', '2021-12-24', '319648925094', 0, 16, NULL),
(211, 'V04784', 'K LALRUATDIKI', NULL, NULL, 2, '2004-11-11', '9366004800', 'D-71, SECTION1, TUIKUAL NORTH  AIZWAL MUNCIPAL COUNCIL AIZWAL, MIZORAM   796001   ', 'MIZORAM', 'INDIA', 'NA', 'ruatdikikhiangte6145@gmail.com', 1, 'A+', '2021-02-25', '301541643129', 0, 16, NULL),
(212, 'D01054', 'C VANLALHMUAKI', NULL, NULL, 3, '1997-01-28', '9362880337', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-07-18', 'NA', 0, 16, NULL),
(213, 'V03876', 'GOSPEL ROHLUPUII', NULL, NULL, 4, '2002-04-23', '9284051935', 'Y-46, Y SECTION, VENGTHLANG, AIZAWL, VAIVAKAWN,       INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'NA', 1, 'AB+', 'NA', '599846658436', 0, 16, NULL),
(214, 'V06764', 'REBECCA LALHMANGAIHZUALI', NULL, NULL, 4, '1998-10-05', '6909494656', 'NO 95, J F LALDAILOVA SECTION, VENGTHAR, ZEMABAWK, AIZAWL MIZORAM 796017     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'mizobeki08@gmail.com', 1, 'A+', '2022-10-31', '800066851428', 0, 16, NULL),
(215, 'V05991', 'MZ MAYAMI', NULL, NULL, 5, '1999-08-20', '8731998596', 'HAOPHUNGTANG, NGAINGA VILLAGE NGAIMU, UKHRUL MANIPUR   795142 INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'ayanaomz@gmail.com', 2, 'O+', '2021-12-14', '748309441749', 0, 17, NULL),
(216, 'D00780', 'VIJAYALAXMI KHARATH', NULL, NULL, 12, '2001-03-02', '9150465161', '4TH CROSS SHIVAJI NAGAR YALLAKKI SHATTER COLONY DHARWAD  580002 INDIA KARNATAKA ', 'KARNATAKA', 'INDIA', 'NA', 'vijayalaxmikarath@gmail.com', 2, '0', '2021-12-16', '953329402801', 0, 17, NULL),
(217, 'H03165', 'NISHA RAI', NULL, NULL, 2, '2000-08-24', '8257986939', '53, NEAR LADY HYDARI PARK, PINE MOUNT AREA, SHILLONG, EAST KHASI HILLS, SHILLONG GPO MEGHALAYA 793001     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'NA', 1, 'AB+', '2022-06-19', '232805409760', 0, 17, NULL),
(218, 'D01028', 'DAPHILATYNGKAI', NULL, NULL, 2, '1997-11-20', '8787399401', '72 MAIRANG MISSION, MAWTHUNG, MAIRANG, WEST KHASI HILLS MEGHALAYA 793120     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'daphimawlong24@gmail.com', 1, 'AB+', '2022-06-19', '733474545991', 0, 17, NULL),
(219, 'D01027', 'LARISA GATPHOH', NULL, NULL, 4, '1997-06-10', '6909165788', '124, NEAR PRESBYTERIAN CHURCH, LUMMAWRIE, LAITUMKHRAH, EAST KHASI HILLS MEGHALAYA 793003     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'gatphohlarisa@gmail.com', 1, 'B+', '2022-06-17', '605470059671', 0, 17, NULL),
(220, 'H02636', 'PHOIBI LALFELI', NULL, NULL, 1, '1998-10-22', '9863234653', 'HERMON CHILDREN HOME LEITAN , TLANGNUAM (PART), AIZAWL DURTLANG, MIZORAM   796025   ', 'MIZORAM', 'INDIA', 'NA', 'NA', 1, 'O+', 'NA', '317734882917', 0, 18, NULL),
(221, 'H02106', 'LALHMINGMAWII', NULL, NULL, 4, '1996-06-05', '9862322858', 'CHILDREN HERMON CHILDREN HOME, LEITAN  TLANGNUAM(PART), AIZAWL  DURTLANG , MIZORAM  796025   ', 'MIZORAM', 'INDIA', 'NA', 'NA', 1, 'O+', '2022-12-08', '505745971566', 0, 18, NULL),
(222, 'V06622', 'VANLALDUHSAKI', NULL, NULL, 7, '1996-04-10', '8413860635', 'COLLEGE VENG NEAR GOVT COLLEGE SECTION -1 LUNGLEI MIZORAM 796701      INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'duhsaki196@gmail.com', 3, 'O+', '2022-08-17', '659652099344', 0, 18, NULL),
(223, 'H03193', 'ROSMIKA CHETTRI', NULL, NULL, 1, '1995-05-23', '8371091428', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-07-10', 'NA', 0, 18, NULL),
(224, 'V07301', 'T LALTHANHLUI', NULL, NULL, 3, '1996-02-04', '9774489541', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-07-24', 'NA', 0, 18, NULL),
(225, 'V07302', 'MARINA LALTANPUII', NULL, NULL, 2, '2004-10-13', '9284540278', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-07-24', 'NA', 0, 18, NULL),
(226, 'D01031', 'ISHAMEKA LAMIN', NULL, NULL, 4, '1996-12-22', '8794772403', '087, BLOCK B, ARBUTHNOT ROAD, NONGRIMMAW, LAITUMKHRAH, EAST KHASI HILLS MEGHALAYA 793003     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'ishamekalamin@gmail.com', 1, 'B+', '2022-06-17', '468265960108', 0, 19, NULL),
(227, 'V05892', 'YETSESHE. L. YIMCHUNGER', NULL, NULL, 4, '2002-09-09', '7085836784', 'HNO. 01, NEAR CHURCH, PUNGRO KIPHIRE, NAGALAND       ', 'NAGALAND', 'INDIA', 'NA', 'yetseshequinker@gmail.com', 1, 'O+', '2021-10-28', '835222124722', 0, 19, NULL),
(228, 'V05891', 'GRACE EZUNG', NULL, NULL, 4, '1999-07-22', '9366759775', 'MOKOKCHUNG COMPOUND MOKOKCHUNG  NAGALAND   798601   ', 'NAGALAND', 'INDIA', 'NA', 'graceezung805@gmail.com', 1, 'O+', '2021-10-28', '627077682966', 0, 19, NULL),
(229, 'V05923', 'JATAV POONAM PADAMSINGH', NULL, NULL, 4, '1997-10-02', '7066472576', 'H NO. 6ILL/3, BAMANWADA KARASWADA, NEAR PETROL PUMP MAPUSA, NORTH GOA      ', 'GOA', 'INDIA', 'NA', 'poonam22071999@gmail.com', 1, 'AB+', '2021-11-11', '909189595416', 0, 19, NULL),
(230, 'V05887', 'MUGHAKALI', NULL, NULL, 4, '2000-12-03', '8415043733', 'BPO ALICHEN 1ST GATE ALICHEN, MOKOKCHUNG NAGALAND      ', 'NAGALAND', 'INDIA', 'NA', 'aienaghali782@gmail.com', 1, 'B+', '2021-10-28', '547611082774', 0, 20, NULL),
(231, 'V06413', 'RINRIN ZIMIK', NULL, NULL, 2, '2003-03-01', '6009889920', 'RAMVA/LAMBUI VILLAGE LAMBUI UKHRUL MANIPUR - 795145     INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'rinrinzimik3@gmail.com', 1, 'B+', '2022-06-08', '901632253915', 0, 20, NULL),
(232, 'D01044 ', 'MINGAM ETE', NULL, NULL, 2, '1999-06-06', '7038054557', 'BENE, WEST SIANG, ALONG,  ARUNANCHAL PRADESH 791001     INDIA ARUNANCHAL PRADESH ', 'ARUNACHAL PRADESH', 'INDIA', 'NA', 'mingamete2003@gmail.com', 1, 'O+', '2023-07-04', '200262826536', 0, 20, NULL),
(233, 'D01046', 'GARGI PAYENG', NULL, NULL, 2, '1998-01-01', '9101770734', '169/A, CENTRAL GOTANAGAR, MALIGAON, MLG RLY HQS, KAMRUP METRO ASSAM 781011     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'payenggargi66@gmail.com', 1, 'O+', '2023-07-04', '384469795470', 0, 20, NULL),
(234, 'D01045 ', 'SALMETCHI MARAK', NULL, NULL, 4, '1999-08-31', '7005039677', '107, BALACHANDA, BALACHANDA-I(GARO), WEST GARO HILLS MEGALAYA 794104     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'salmamarak70@gmail.com', 1, 'AB+', '2023-07-04', '375142019220', 0, 20, NULL),
(235, 'V05911', 'PREETY MARAK', NULL, NULL, 4, '1999-01-08', '9862567186', 'H NO. 337, NEAR GOVT HIGH SCHOOL DHANSIRIPAR, NAGALAND       ', 'NAGALAND', 'INDIA', 'NA', 'hannahmarak77@gmail.com', 1, 'A+', '2021-10-30', '442970396929', 0, 21, NULL),
(236, 'V05908', 'VINOLI CHISHI', NULL, NULL, 4, '1995-10-10', '8448418447', 'H NO. 118, RIVER BELT COLONY NEAR DON BOSCO HR SEC SCHOOL DIMAPUR SADAR, NAGALAND      ', 'NAGALAND', 'INDIA', 'NA', 'vinolichishir@gmail.com', 1, 'A+', '2021-10-30', '592493438504', 0, 21, NULL),
(237, 'V07070', 'FELINA VANLALZAHAWMI', NULL, NULL, 4, '2002-07-19', '9767743160', 'H NO 221, CHAWNGTE P, LAWNGTLAI MIZORAM 796891     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'vanlalzahawmifelina@gmail.com', 1, 'A+', '2023-03-27', '915687143569', 0, 21, NULL),
(238, 'V05904', 'A MERENYANGLA IMSONG', NULL, NULL, 4, '2001-12-19', '7085507624', 'TULIYONG WARD, TULI MOKOKCHUNG  NAGALAND   798618   ', 'NAGALAND', 'INDIA', 'NA', 'NA', 1, 'O+', '2021-10-30', '510375403195', 0, 21, NULL),
(239, 'V05930', 'LALHMINGMAWII', NULL, NULL, 4, '1995-04-16', '8131960170', 'Y-155A, Y-SECTION RAMHLUN SOUTH NEAR BAPTIST CHURCH AIZWAL, MIZORAM     ', 'MIZORAM', 'INDIA', 'NA', 'NA', 1, 'B+', '2021-11-06', '463943719481', 0, 22, NULL),
(240, 'H02635', 'H LALENGMAWII', NULL, NULL, 5, '1997-09-18', '6009256907', 'C-2/17, SECTION 4, NEAR MICE SCHOOL TUIKUAL, NORTH TLANGNUAM AIZWAL , MIZORAM      ', 'MIZORAM', 'INDIA', 'NA', 'NA', 2, 'O+', 'NA', '312556092724', 0, 22, NULL),
(241, 'V07120', 'KARISHMA KIRO', NULL, NULL, 4, '2001-10-13', '8102390129', 'RN-255, BEHIND LIC OFFICE, ROHRABANDH, SINDRI, DHANBAD JHARKHAND 828122     INDIA JHARKHAND  ', 'JHARKHAND', 'INDIA', 'NA', 'karishmakiro18@gmail.com', 1, 'O+', '2023-04-29', '563787893070', 0, 22, NULL),
(242, 'H02633', 'LALRAMPANI', NULL, NULL, 17, 'NA', '7640844479', 'A1(B), 18(B), MUAL VENG CHALTLANG, AIZAWL MUNICIPAL COUNCIL AIZAWL , MIZORAM   796012   ', 'MIZORAM', 'INDIA', 'NA', 'plalrampani@gmail.com', 19, 'A+', 'NA', '387037132550', 0, 22, NULL),
(243, 'V05917', 'BORNALI BHAKTIARY', NULL, NULL, 4, '2000-05-25', '8399057441', 'RUPAISIDING, DOOM DOOMA TINSUKIA, ASSAM       ', 'ASSAM', 'INDIA', 'NA', 'bornallibhaktiary123@gmail.com', 1, 'A+', '2021-10-31', '454791632202', 0, 23, NULL),
(244, 'V05915', 'REKHA CHETRY', NULL, NULL, 4, '2001-03-01', '8133958198', 'SANTIPUR, OWGURI GAON TINSUKIA, ASSAM       ', 'ASSAM', 'INDIA', 'NA', 'rekhachetry7575@gmail.com', 1, 'A+', '2021-10-31', '487553638896', 0, 23, NULL),
(245, 'V05916', 'CHAYANIKA DUTTA', NULL, NULL, 4, '1998-03-31', '7086749210', 'NAHARKATIA, LENGHARJAN NAHARKATIYA, DIBUGARH ASSAM   786610   ', 'ASSAM', 'INDIA', 'NA', 'chnkdutta@gmail.com', 1, 'AB+', '2021-10-31', '966644458606', 0, 23, NULL),
(246, 'V05914', 'PUSHPANJOLI KOYA', NULL, NULL, 2, '1998-11-21', '9957106687', 'DALANG, LINE PART BAGHJAN RUPAI, 38/32WIA RUPBON, TINSUKIA ASSAM     ', 'ASSAM', 'INDIA', 'NA', 'koyapushpanjoli@gmail.com', 1, 'B+', '2021-10-31', '521936192647', 0, 23, NULL),
(247, 'V07100', 'LINDA LALSAWIMAWII', NULL, NULL, 2, '1999-05-04', '7640938983', 'MUALUI,CHHINGCHHIP, SERCHHIP MIZORAM     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'lindaduhawmi96@gmail.com', 1, 'B+', '2023-04-11', '340312676534', 0, 24, NULL),
(248, 'V07099', 'LALHMANGAIHSANGI', NULL, NULL, 4, '1996-07-27', '9862827840', 'SDO QUATER, WEST PHAILENG, MAMMIT,  MIZORAM     796431 MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'hmangaihsangi199@gmail.com', 1, 'O+', '2023-04-11', '889192928976', 0, 24, NULL),
(249, 'H02978', 'ROSSY TAMANG', NULL, NULL, 4, '2001-08-19', '8927255218', 'MARTAM NAZITAM CHUZA NEAR WATER GARDEN CHUBA MIDDLE CAMP EAST SIKKIM SIKKIM 737135     INDIA SIKKIM ', 'SIKKIM', 'INDIA', 'NA', 'NA', 1, 'B+', '2022-11-03', '484198813941', 0, 24, NULL),
(250, 'V06395', 'R. VANLALDINSANGI', NULL, NULL, 4, '1994-09-24', '7620042765', 'C-65, CHAWNGBAWLA SECTION, NEAR AGANWADI - l, RAMHLUN VENGTAHR, AIZAWL MUNCIPAL COUNCIL, AIZAWL, MIZORAM - 796012     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'ginacolney@gmail.com', 1, 'O+', '2022-05-28', '584535508340', 0, 24, NULL),
(251, 'D00660', 'CHENGNYU A KONYAK', NULL, NULL, 4, '1998-09-01', '8414093814', 'VILLAGE YONGKHAO PO TOBU DIST MON UPPER HIGH SCHOOL   INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'chengngu@gmail.com', 1, 'A+', '2021-02-02', '826726281977', 0, 25, NULL),
(252, 'V05604', 'T DUMPILILA SANGTAM', NULL, NULL, 5, '2003-05-07', '9383188021', 'H/NO 110,MKG ROAD B.P.O-LONGKHIM RONGNA SECTOR,LONGKHIM, TUESNSANG,NAGALAND  798616 INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'placement.ithm@gmail.com', 2, 'O+', '2021-02-02', '992969426581', 0, 25, NULL),
(253, 'V06740', 'WANLARIGKI PYNGROPE', NULL, NULL, 5, '2003-05-07', '7085398547', 'UMMULONG, WEST JAINTIA HILLS MEGHALAYA 793151     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'wanlangkipyngrope@gmail.com', 2, 'O+', '2022-10-15', '935554497262', 0, 25, NULL),
(254, 'V06736', 'EBHAMI PYNGROPE', NULL, NULL, 5, '2003-01-27', '7005264639', 'UMMULONG, WEST JAINTIA HILLS MEGHALAYA 793151     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'pyngropeebhami@gmail.com', 2, 'O+', '2022-10-15', '815875434669', 0, 25, NULL),
(255, 'V06743', 'DASHI SHANONGKYNRIH', NULL, NULL, 11, '2000-01-15', '8729886937', '90 LAITLUM SMIT EAST KHASI HILLS MEGHALAYA 793015     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'dashishanongkynrih123@gmail.com', 4, 'AB+', '2022-10-15', '557568789867', 0, 25, NULL),
(256, 'V06580', 'IBAHUN KHARTHANGMAW', NULL, NULL, 13, '1994-07-03', '9362236509', '359 UMISIER EAST KHSI QHILLS MEGHALAYA 793221      INDIA MEGHALAYA  ', 'MEGHALAYA', 'INDIA', 'NA', 'ibahunkharthangmaw21@gmail.com', 4, 'B+', '2022-08-14', '467416114287', 0, 25, NULL),
(257, 'V07176', 'ALI KONYAK', NULL, NULL, 63, 'NA', '9862557157', 'H/NO-249 C, WARD-20, UNITED COLONY, NAGARJAN, DIMAPUR NAGALAND 797112     INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'linakonyak03@gmail.com', 19, 'O+', '2023-06-05', '476912226497', 0, 26, NULL),
(258, 'GP-975', 'SONU GURUNG', NULL, NULL, 4, '2003-02-23', '9883473317', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-05-26', 'NA', 0, 26, NULL),
(259, 'H02933', 'NEHA RAI', NULL, NULL, 4, '2001-05-26', '8670088237', 'TAKLING BUSTY KHASMAHAL DARJEELING WEST BENGAL 734312     INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'raineyha84@gmail.com', 1, 'O+', '2022-09-26', '946372302366', 0, 26, NULL),
(260, 'V07143', 'KAVITA PAWAR', NULL, NULL, 4, '2003-11-19', '8530502056', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-07-11', 'NA', 0, 26, NULL),
(261, 'H02930', 'RIKITA RAI', NULL, NULL, 4, '2003-12-06', '9083896554', 'UPPER SALIMBONG BUSTY BONG KHASMAHAL KALIMPONG DARJEELING WEST BENGAL 734301     INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'rikitarai354@gmail.com', 1, 'A+', '2022-09-26', '401465065429', 0, 26, NULL),
(262, 'H02929', 'LYANGRIP LEPCHA', NULL, NULL, 4, '1998-08-22', '9933167297', 'LOWER POCHOK BUSTY GIT DUBLING KHASMAHAL GITDUBLING DARJEELING WEST BENGAL 734314     INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'lepchalyangrip485@gmail.com', 1, 'O+', '2022-09-26', '955254902332', 0, 26, NULL),
(263, 'V05394', 'TEMSUKALA', NULL, NULL, 14, '1993-12-16', '9112758082', 'TULI,TULIYONG WARD TULI MOKOKCHUNG NAGALAND     ', 'NAGALAND', 'INDIA', 'NA', 'temsukala22@gmail.com', 2, 'A+', '2021-06-02', '478128560121', 0, 27, NULL),
(264, 'H02079', 'LIMATULA AO', NULL, NULL, 15, '1997-06-22', '8575707174', 'VIOLA COLONY, WARD - 23 DIMAPUR MC NAGALAND   797112   ', 'NAGALAND', 'INDIA', 'NA', 'NA', 5, 'A+', '2022-11-27', '741429952904', 0, 27, NULL),
(265, 'V05393', 'TIASOLA', NULL, NULL, 5, '2002-01-17', '9089986973', 'TONGDENTSUYONG WARD MOKOKCHUNG TOWN MOKOKCHUNG NAGALAND  798601   ', 'NAGALAND', 'INDIA', 'NA', 'tiasoimchen9@gmail.com', 2, 'A+', 'NA', '860364866381', 0, 27, NULL),
(266, 'V06735', 'RIBAKMEN KAARUMNUID', NULL, NULL, 11, '1997-11-08', '9366981494', 'NEAR MERCY CHILD SCHOOL, DONGSUROK, THANGSNING, EAST KHASI HILLS MEGHALAYA 793015     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'kharumnuidribakmen@gmail.com', 4, 'B+', '2022-10-15', '477610526526', 0, 27, NULL),
(267, 'V05981', 'NIKITA SURESH ZATYE', NULL, NULL, 4, '1999-11-24', '8412939823', 'H. NO. 113/2, LAGARBAG WADDA TORXEM., NORTH GOA GOA   403512 INDIA GOA ', 'GOA', 'INDIA', 'NA', 'zatye.nikita97@gmail.com', 1, 'A+', '2021-12-10', '580334434116', 0, 28, NULL),
(268, 'D00641', 'ZITSALA A SANGTAM', NULL, NULL, 6, '2002-01-22', '7085987750', 'H NO. 54,  SIGNAL ANGAMI VILLAGE SIGNAL ANGAMI DIMAPUR  797117 INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'zizijingz33@gmail.com', 3, 'A+', '2021-02-02', '828675773457', 0, 28, NULL),
(269, 'V06933', 'LISHMITA DSOUZA', NULL, NULL, 5, '1990-08-13', '6363530453', 'H.NO.2-24,ANGLAKODI HOUSE, PERUVAI POST DAKSHINA KANNADA-574260     INDIA KARNATAKA ', 'KARNATAKA', 'INDIA', 'NA', 'lishmithadsouza22@gmail.com', 2, 'B+', '2022-12-17', '403799905179', 0, 28, NULL),
(270, 'D00976', 'OLINDA GOMES', NULL, NULL, 4, '2001-02-07', '9623525704', 'H NO 496 B, CHRISTIANWADA, KARIWADE, SINDHUDURG MAHARASHTRA 416510     INDIA MAHARASHTRA ', 'MAHARASHTRA', 'INDIA', 'NA', 'olindagomes167@gmail.com', 1, 'A+', '2023-01-11', '600229214823', 0, 28, NULL),
(271, 'D00653', 'NILIMA MANDAL', NULL, NULL, 4, '1995-05-27', '7005769559', 'H.NO.18 NEAR POLICE STATION LANDMARK COLONY PWD COLONY DIMAPUR    NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'mandalnilima50gmail.com', 1, 'B+', '2021-02-02', '564148478624', 0, 28, NULL),
(272, 'D00703', 'SANTOSHI PANDIT', NULL, NULL, 11, '2001-04-07', '8329717107', 'H. NO. 78, CHINCHWADA CHIMBEL , NORTH GOA GOA   403006   ', 'GOA', 'INDIA', 'NA', 'NA', 4, 'B+', '2022-03-28', '868451526714', 0, 28, NULL),
(273, 'D00942', 'PEARL SHAINY DESOUZA', NULL, NULL, 11, '2001-11-13', '9886141206', '4 32 FAISAL NAGAR NEAR MASJID BAJAL NANTHOOR MANGLORE DAKSHINA KANNADA KARNATAKA 575007     INDIA KARNATAKA ', 'KARNATAKA', 'INDIA', 'NA', 'pearlshinydsouza@gmail.com', 4, 'A+', '2022-11-16', '247249336666', 0, 29, NULL),
(274, 'H03009', 'GAIL SALDANHA', NULL, NULL, 12, '1998-05-11', '8197785130', 'H.NO.4-116,NAVAJYOTHINAGAR NEAR MOSQUE ARKULA FARANGIPET  MANGLORE DAKSHINA KANNADA KARNATAKA    574143 INDIA KARNATAKA ', 'KARNATAKA', 'INDIA', 'NA', 'gailsaldanha2@gmail.com', 2, 'B+', '2022-11-25', '870760643829', 0, 29, NULL),
(275, 'D01049', 'ARPITA DUTTA', NULL, NULL, 16, '2003-01-14', '8240231324', 'NA', 'NA', 'INDIA', 'NA', 'NA', 6, 'NA', '2023-07-11', 'NA', 0, 29, NULL),
(276, 'V07286', 'POUSHALI NASKAR', NULL, NULL, 3, '1988-09-30', '6289507172', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-07-18', 'NA', 0, 30, NULL),
(277, 'V03713', 'BAWITLUNG LALTHIAMUANI', NULL, NULL, 4, '1998-08-17', '8787883831', 'B-160, T-SECTION COMPLEX ROAD RAMHLUN VENGLAI, AIZWAL MUNICIPAL COUNCIL    796012 INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'NA', 1, 'O+', 'NA', '630786652830', 0, 30, NULL),
(278, 'D00654', 'RAZUNGOLU', NULL, NULL, 4, '2003-03-09', '9077846376', 'PO CHOZUBA CHOZUBA HQ PHEK NAGALAND  797104  NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'angkookie20@gmail.com', 1, 'A+', '2021-02-02', '302301543192', 0, 30, NULL),
(279, 'V07043', 'N ADAHA KHRASI', NULL, NULL, 4, '2002-07-25', '9863218021', 'MAKHAN KHULLEN, MARAM, SENAPATI MANIPUR 795015     INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'adahakhrasi9@gmail.com', 1, 'A+', '2023-02-10', '635279695242', 0, 30, NULL),
(280, 'V07044', 'DAILU KAINE', NULL, NULL, 4, '2000-06-01', '9863242604', 'MAKHAN CENTRE, MARAM, SENAPATI MANIPUR 795015     INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'kainikhrasikhrasi@gmail.com', 1, 'O+', '2023-02-10', '582674732926', 0, 30, NULL),
(281, 'V07052', 'LENSILI', NULL, NULL, 17, '2001-07-04', '9665039426', 'VONGTSUVONG VILLAGE, PUNGRO HQ, KIPHIRE NAGALAND 798611     INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'lensilileejongs@gmail.com', 1, 'O+', '2023-03-04', '774261269528', 0, 30, NULL),
(282, 'V06950', 'MELITA MONTEIRO', NULL, NULL, 18, '1982-11-08', '7483891225', 'JAVALI, CHICKMAGALUR KARNATAKA 577122     INDIA KARNATAKA ', 'KARNATAKA', 'INDIA', 'NA', 'jasminemelita5656@gmail.com', 4, 'AB+', '2022-12-23', '902226632728', 0, 31, NULL),
(283, 'V03242', 'SHELITO ACHUMI', NULL, NULL, 19, '1992-02-04', '9604512560', 'H.NP.218, WARD 1, CHUMUKEDIMA, DIMAPUR, NAGALAND, 797103      INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'NA', 4, 'O+', 'NA', '529616724926', 0, 31, NULL),
(284, 'V03772', 'LALREMSANGI', NULL, NULL, 11, '1998-05-01', '9856475085', '161, RAMHLUN SOUTH  III,  AIZAWL,       INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'lalremsangihmar4@gmail.com', 4, 'B+', 'NA', '885144765348', 0, 31, NULL),
(285, 'V06699', 'SENTHA NONGBRI', NULL, NULL, 2, '2002-02-11', '8257870351', 'NEAR SON & COMPANY MAWLAI UMJAIUR BLOCK - 1 MAWLAI EAST KHASI HILLS PHUDMAWRI MEGHALAYA 793008     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'nongbrilyngdohsentha@gmail.com', 1, 'O+', '2022-09-25', '352587235358', 0, 31, NULL),
(286, 'D01030', 'ARATI KUMARI MISHRA', NULL, NULL, 20, '1997-09-04', '9395071501', 'FANCY BAZAR, LOG HINDI HIGH SCHOOL, RAILWAY GATE NO 3, PANBAZAR, KAMRUP METRO ASSAM 781001     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'arti.mishra217@gmail.com', 7, 'B+', '2023-06-21', '336384674874', 0, 31, NULL),
(287, 'V07148', 'VENIKA COSTA', NULL, NULL, 3, '1996-05-06', '7507927040', 'H NO B-180, MAPA PANCHAWADI, PONCHAVADI, NORTH GOA GOA 403706     INDIA GOA ', 'GOA', 'INDIA', 'NA', 'venikacosta@gmail.com', 1, 'A+', '2022-05-06', '242992781218', 0, 31, NULL),
(288, 'V03626', 'LALMUANSANGPUII', NULL, NULL, 4, '1997-02-10', '8921528598', 'H NO. 158, COLLEGE VENG SOUTH, LAWNGTLAI     796891 INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'NA', 1, 'A+', '2021-01-16', '689429664698', 0, 32, NULL),
(289, 'D00599', 'HANTONA GOGOI', NULL, NULL, 4, '1998-06-24', '7628087399', 'H.NO. 108, BLOCK 21 NAHARBARI VILLAGE  NAHARBARI VILLAGE  NAGALAND  797115   ', 'NAGALAND', 'INDIA', 'NA', 'hantonagogoi123@gmail.com', 1, 'AB+', '2021-12-08', '652479219002', 0, 32, NULL),
(290, 'V06483', 'MELODY HMANGAIHSANGI', NULL, NULL, 11, '2000-02-05', '8787525793', 'C 52, T SECTION, NEAR KB TUIKHUR, SARON VENG, AIZAWL MUNCIPAL COUNCIL, AIZAWL, MIZORAM 796001     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'melodyhringngen76@gmail.com', 4, 'O+', '2022-07-05', '621221384184', 0, 32, NULL),
(291, 'V05862', 'KHANYOPHY M S', NULL, NULL, 4, '1992-09-07', '8414993648', 'CHOITHAR VILLAGE URKHUL DISTRACT MANIPUR   795142 INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'mashangvakhanyophy@gmail.com', 1, '0', '2021-10-13', '886216055912', 0, 33, NULL),
(292, 'D00735', 'TERESA M SANGMA', NULL, NULL, 1, '1996-12-13', '9365277176', 'DARKA, KACHARIPARA PT-1 GOALPARA ASSAM - 783120   783120 INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'sangmateresa05@gmail.com', 1, 'B+', '2021-04-18', '421462303282', 0, 33, NULL),
(293, 'H02627', 'PRIYA MUNDA', NULL, NULL, 18, '1999-01-20', '8638908155', 'DIRING BAGAN KAZIRANGA NATIONAL PARK GOLAGHAT , ASSAM   785609   ', 'ASSAM', 'INDIA', 'NA', 'priyamunda31@gmail.com', 4, 'B+', '2021-11-29', '983514228287', 0, 33, NULL),
(294, 'V03773', 'REBEK LALMAWIZUALI', NULL, NULL, 4, '2000-01-01', '9607027497', 'FIELD VENG, THENZAWL, NEAR BAPTIST CHURCH, SERCHHIP THENZAWL, MIZORAM        ', 'MIZORAM', 'INDIA', 'NA', 'NA', 1, 'O+', '2022-03-13', '396870653954', 0, 33, NULL),
(295, 'V06318', 'SHAILY PANDEY', NULL, NULL, 21, '2002-07-10', '7250347727', 'H. NO. 110, NEAR LAL KRISHNA SONAMATI SCHOOL BAJRANG SANGH ROAD GOLA  GOLA, RAMGARH, JHARKHAND   829110   ', 'JHARKHAND', 'INDIA', 'NA', 'shailypandey7488@gmail.com', 8, 'AB+', '2022-05-08', '893382508189', 0, 33, NULL),
(296, 'V07293', 'BHAGYASHREE', NULL, NULL, 22, '1984-12-20', '8999198014', 'NA', 'NA', 'INDIA', 'NA', 'NA', 9, 'NA', '2023-07-20', 'NA', 0, 33, NULL),
(297, 'V00646', 'SWATI KAMBLE', NULL, NULL, 23, '1983-08-16', '9011938457', 'NA', 'NA', 'INDIA', 'NA', 'NA', 9, 'A+', 'NA', '713755904311', 0, 34, NULL),
(298, 'V02089', 'SHANTU KAMBLE', NULL, NULL, 1, '1994-12-31', '8806663518', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'O+', 'NA', '297693097831', 0, 34, NULL),
(299, 'V05380', 'SHANCHOBENI N ODYUO', NULL, NULL, 4, '1996-10-09', '7628945689', 'B.P.O RANGAPAHAR, SENJUM VILLAGE, DIMAPUR SADAR, NAGALAND  797112 INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'NA', 1, 'O+', '2021-11-27', '445575080658', 0, 35, NULL),
(300, 'V05534', 'CHANCHIBENI T EZUNG', NULL, NULL, 17, '2000-07-10', '7085745027', 'H NO. 58-B WALFORD COLONY DIMAPUR, NAGALAND   797112 INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'NA', 7, 'O+', 'NA', '700680168003', 0, 35, NULL),
(301, 'V05959', 'AKSHATA DNYANESHWAR GAWAS', NULL, NULL, 17, '1999-08-13', '7829241364', 'OLD STAFF QTRS R NO.19, BANGUR NAGAR DANDELI VTC - DANDELI (RURAL) UTTAR KANNADA 581325 INDIA KARNATAKA ', 'KARNATAKA', 'INDIA', 'NA', 'gawasa468@gmail.com', 7, '0', '2021-11-26', '690898992599', 0, 35, NULL),
(302, 'V05960', 'ASHWINI GOVIND GAWAS', NULL, NULL, 4, '2001-11-20', '9148260873', 'ROOM NO.475 BANGUR NAGAR NEW STAFF QTRS DANDELI (RURAL) UTTAR KANNADA 581325 INDIA KARNATAKA ', 'KARNATAKA', 'INDIA', 'NA', 'ashwinigawas13@gmail.com', 1, '0', '2021-11-26', '576454919343', 0, 35, NULL),
(303, 'D00952', 'RENJANO EZUNG', NULL, NULL, 11, '1999-01-01', '6009097670', 'H NO 26, NEAR GOVT FISHERY WOKHA, TSUMANG A, WOKHA SADAR NAGALAND 797111    797111 INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'renjano23@gmail.com', 4, 'O+', '2022-12-01', '285480034826', 0, 35, NULL),
(304, 'V05939', 'KOMAL KUMARI', NULL, NULL, 24, '1986-09-25', '6205439152', 'SOUYOG, KRISHNAPURI ROAD NO 12, RANCHI, JHARKHAND       ', 'JHARKHAND', 'INDIA', 'NA', 'komal.singh111513112@gmail.com', 10, 'O+', '2021-11-13', '729581387230', 0, 35, NULL),
(305, 'DS0222', 'RINPI NADA', NULL, NULL, 7, '1997-09-24', '7745034076', 'NA', 'JHARKHAND', 'INDIA', 'NA', 'NA', 3, 'A+', 'NA', '546760491132', 0, 36, NULL),
(306, 'H03146', 'SONALI NAIK', NULL, NULL, 7, '1999-09-08', '9686955230', '#1506, GABITWADA, MAJALI, KARWAR , UTTAR KANNADA KARNATAKA 581345     INDIA KARNATAKA ', 'NA', 'INDIA', 'NA', 'snaik9511@gmail.com', 3, 'A+', '2023-05-29', '590738357935', 0, 36, NULL),
(307, 'H03166', 'APSANA LALAMASAK SHEKH', NULL, NULL, 4, '2000-03-27', '9322144416', '68, PILLIEM, BHUMIKA NAGAR, DARBANDORA, SOUTH GOA GOA 403406     INDIA GOA ', 'KARNATAKA', 'INDIA', 'NA', 'apsanashe118@gmail.com', 1, 'AB+', '2023-07-04', '576346788771', 0, 36, NULL),
(308, 'V06573', 'AMINA BEGUM', NULL, NULL, 4, '2000-02-27', '8099098360', 'VILL MENIPUR PT I, SILDUBI, CACHAR ASSAM 788112     788112 ASSAM ', 'GOA', 'INDIA', 'NA', 'ammuskyh296@gmail.com', 1, 'O+', '2022-08-11', '494782748145', 0, 37, NULL),
(309, 'V06568', 'LAISHRAM MEMNAOBI', NULL, NULL, 4, '1996-09-10', '9612741142', 'KANGLATONGBI BAZAR BOARD SEKMAI IMPHAL WEST LAMSHANG SUB DIV MANIPUR 795136     INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'NA', 1, 'A+', '2022-08-11', '359009066027', 0, 37, NULL),
(310, 'V06567', 'KRISHATINA  PEGU', NULL, NULL, 4, '2004-09-05', '8811956853', 'VILL KEKURI MIRI GAON PS DHEMAJI JAIDHAL,TINIGHARIA ASSAM 787057      INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'pegukrishtina11@gmail.com', 1, 'B+', '2022-08-11', '843695649592', 0, 37, NULL),
(311, 'V06872', 'BHAGYASHREE PANDA', NULL, NULL, 4, '2003-02-25', '8099809228', 'DAFALAKATA, PABHOI, BISWANATH ASSAM 784174    784174 INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'bhagyashreepanda0005@gmail.com', 1, 'A-', '2022-11-24', '822277287201', 0, 37, NULL),
(312, 'V06569', 'ROSHNI DEVI', NULL, NULL, 4, '2000-04-21', '8876414781', '24 PATARKUCHI MANIPURI MANDIR BASISTHA KAMRUP,METRO ASSAM 781029      INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'howremroseie1230@gmail.com', 1, 'AB+', '2022-08-11', '594153266696', 0, 37, NULL),
(313, 'V06574', 'Z N WILUBUILIU', NULL, NULL, 4, '1998-05-18', '9612321831', 'CHATON I TAMEI TAMENGLONG NORTH SUB DIV MANIPUR 795125      INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'NA', 1, 'O+', '2022-08-11', '216553105436', 0, 37, NULL),
(314, 'V06562', 'NISHA SINGH', NULL, NULL, 4, '2003-01-25', '9774446957', '28 NEAR GURUDWARA MES GORALINE LUMSOHRA SHILLONG LAITUMKHRAH EAST KHASI HILLS, MEGHALAYA 793003     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'nishusingh1235678@gmail.com', 1, 'B+', '2022-08-10', '340986161664', 0, 38, NULL),
(315, 'V06561', 'RITA LALRAMFEL', NULL, NULL, 4, '2002-02-21', '9366916949', 'VALPAKOT VILLAGE CHURACHANDPUR SUB DIVISION, MANIPUR, DIST:CHURACHANDPUR,MANIPUR,795128     795128 INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'jotefeli@gmail.com', 1, 'O+', '2022-08-10', '949016562541', 0, 38, NULL),
(316, 'V06563', 'EVANICA MAWLONG', NULL, NULL, 11, '2000-08-01', '9362704035', 'LAWSOHTUN NEAR ST JOHN BOSCO SCHOOL LAWSOHTUN BLOCK-2 EAST KHASI HILLS MEGHALAYA 793004      INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'evanicalmawlong@gmail.com', 4, 'A+', '2022-08-10', '629831372814', 0, 38, NULL),
(317, 'V06560', 'FAIRDASHISHA LAWAI', NULL, NULL, 4, '2001-02-14', '6009894287', 'PURIANG NIUR, NEAR PLAY GROUND, PURIANG NIUR, NIUR, EAST KHASI HILLS, MAWRYNGKNENG, MEGHALAYA 793021     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'fairdalawai@gmail.com', 1, 'B+', '2022-08-10', '420146652598', 0, 38, NULL),
(318, 'V06581', 'EVALAHUN GATPHOH', NULL, NULL, 4, '2000-10-19', '7622025625', '124, BEHIND R K DISPENSARY, LUMMAWRIE, LAITUMKHRAH, EAST KHASI HILLS, MEGHALAYA 793003     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'evagatphoh@gmail.com', 1, 'B+', '2022-08-14', '670899334421', 0, 38, NULL),
(319, 'V06582', 'ZENOVIA RYMBAI', NULL, NULL, 4, '1999-08-24', '9402188948', 'BELOW J J CABLE, NON GRIM HILLS, LAITUMKHRAH, EAST KHASI HILLS, MEGHALAYA 793003     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'zee.rymbai@gmail.com', 1, 'A+', '2022-08-14', '542908757410', 0, 38, NULL),
(320, 'H02789', 'LALREMPUII', NULL, NULL, 4, '2000-07-25', '7641012719', '102, VENGLUN, NEAR U.P.C CHURCH, LUNGPHO, SERCHHIP, MIZORAM - 796181     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'rpchhangte24@gmail.com', 1, 'O+', '2022-06-03', '259323103102', 0, 39, NULL),
(321, 'H02790', 'LALTHLAMUANI', NULL, NULL, 4, '2002-06-05', '6009413154', 'BAZAR VENG, NEAR COLLEGE, NEW SERCHHIP, SERCHHIP, MIZORAM 796181     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'lalthlamuanithlatei95@gmail.com', 1, 'B+', '2022-06-03', '995746495259', 0, 39, NULL),
(322, 'H02787', 'REMRUATSANGI', NULL, NULL, 4, '1997-12-03', '8413932799', '9, SAITUAL ROAD, NEAR SERICULTURE, CHAWNGBAWLA SECTION, PHULLEN, AIZAWL, MIZORAM - 796261     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'remruatsangiralte7@gmail.com', 1, 'A+', '2022-06-03', '877645057471', 0, 39, NULL),
(323, 'H02792', 'JULIET ZOREMSANGI', NULL, NULL, 4, '1999-04-02', '8794779928', 'H.NO-21, MISSION VENG, NEAR PRESBYTERIAN CHURCH, BUHCHANGPHAI, KOLASIB, BILKHAWTHLIR, MIZORAM 796091     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'NA', 1, 'A+', '2022-06-03', '582941839517', 0, 39, NULL),
(324, 'H02788', 'MARY LALTHANPUII', NULL, NULL, 4, '2000-07-17', '7641006654', 'B-78, N-SECTION, NEAR P/S, ZONUAM, AIZAWL,, ZONUAM, MIZORAM, - 796009     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'marysky066@gmail.com', 1, 'A+', '2022-06-03', '656726810227', 0, 39, NULL),
(325, 'H03005 ', 'RAMCHANSANGI', NULL, NULL, 4, '2002-06-04', '8794763580', 'REST HOUSE MUALLIANPUI S VANLAIPHAI, HNAHTHIAL, LUNGLEI MIZORAM 796571    796571 INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'NA', 1, 'O+', '2022-11-21', '403228864733', 0, 39, NULL),
(326, 'V06550', 'VANLALHRIATHLUI', NULL, NULL, 4, '2000-04-30', '9962987475', 'KHAWHAI CHAMPHA MIZORAM  796310      INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'hriathluiv@gmail.com', 1, 'O+', '2022-08-04', '776086935798', 0, 40, NULL),
(327, 'V06486', 'PC LALNUNENGI', NULL, NULL, 4, '2004-03-18', '7005747440', 'TA/57 TSECTION HMARVENG BAWNGKAWN AIZAWL MUNICIPAL  MIZORAM 796014     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'jaycepachuau@gmail.com', 1, 'B+', '2022-07-05', '583450331402', 0, 40, NULL),
(328, 'V06549', 'VANLALHMUANMAWII', NULL, NULL, 4, '2003-11-29', '8119942423', 'H NO 55 NEAR PHC KHAWHAI CHAMPHAI MIZORAM 796310      INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'lalhmunmawiit@gmail.com', 1, '0', '2022-08-04', '344333130941', 0, 40, NULL),
(329, 'V06552', 'LALCHHANTLUANGI', NULL, NULL, 4, '2003-09-17', '6909495739', 'C 51, SEC T, NEAR YMA HALL, MODEL VENG, KULIKAWN, AIZAWL, MIZORAM 796005     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'chhantluangi94@gmail.com', 1, 'O+', '2022-08-04', '690989824370', 0, 40, NULL),
(330, 'D01042', 'BETTY LALCHHUANPUII', NULL, NULL, 4, '1998-01-03', '9905281548', 'H.NO.244, NEAR UPC(MZ) PASTOR QUATERS,KHAWHAI VENGLAI, CHAMPHAI MIZORAM 796310     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'bettychhuak02@gmail.com', 1, 'O+', '2023-06-16', '898860671651', 0, 40, NULL),
(331, 'V06571', 'ANKITA DAS', NULL, NULL, 4, '1999-12-13', '8473890542', 'NEAR SARUSAJAI SATGAON, BELTOLA, BASISTHA, KAMRUP METRO, ASSAM 781029     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'ankitadas123.guria@gmail.com', 1, 'B+', '2022-08-11', '758120018208', 0, 41, NULL),
(332, 'V06575', 'SHUBHA DEVI', NULL, NULL, 4, '2003-10-27', '7002376484', 'STREET MILON NAGAR LANDMARK PARIJAT PATH WARD NO 10 VILLAGE NORTH LAKHIMPUR SIDT LAKHIMPUR NORH LAKHIMPUR ASSAM 787001    INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'devisubha111@gmail.com', 1, 'A+', '2022-08-11', '925778469423', 0, 41, NULL),
(333, 'V06572', 'ALICIA PYRTUH', NULL, NULL, 4, '2002-09-04', '9774810016', 'MOODYMMAI, WEST JAINTIA HILLS, MEGHALAYA 793151     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'aliciapyrtuh1@gmail.com', 1, 'B+', '2022-08-11', '670281662441', 0, 41, NULL),
(334, 'V06643', 'HIYASMITA DAS', NULL, NULL, 4, '2003-07-27', '6001079952', 'PUB KHAGRABARI BAKSA ASSSAM 781327      INDIA ASSAM ', 'MEGHALAYA', 'INDIA', 'NA', 'hiyasmita2021@gmail.com', 1, 'B+', '2022-08-25', '339715573403', 0, 41, NULL),
(335, 'V06644', 'RAKHEE SANGMA', NULL, NULL, 4, '2004-08-01', '8099899131', 'UKIUM NO 1 KAMRUP ASSAM 781124      INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'rakheesangma188@gmail.com', 1, 'B+', '2022-08-25', '765016801409', 0, 41, NULL),
(336, 'V06866', 'PARIMITA DEKA', NULL, NULL, 4, '2002-05-20', '8453559332', 'DEOCHUNGA, GORESWAR, KAMRUP ASSAM 781364    781364 INDIA ASSAM  ', 'ASSAM', 'INDIA', 'NA', 'parimitadeka8@gmail.com', 1, 'A+', '2022-11-24', '581162173083', 0, 41, NULL),
(337, 'V06601 ', 'KIMTUNG SANCHONG', NULL, NULL, 4, '2001-07-29', '8794314092', 'CHANGLANG CIRCLE, CHANGLANG,  ARUNACHAL PRADESH 792120     INDIA ARUNACHAL PRADESH ', 'ARUNACHAL PRADESH', 'INDIA', 'NA', 'sanchongkimtung@gmail.com', 1, 'O+', '2022-08-18', '921950067616', 0, 42, NULL),
(338, 'V06602', 'RUNI DAS', NULL, NULL, 4, '2002-11-10', '9366505250', '153, C SECTOR, NEAR GANDHI MARKET, C SECTOR, ITANAGAR, PAPUM PARE ARUNACHAL PRADESH 791111     INDIA ARUNACHAL PRADESH ', 'ARUNACHAL PRADESH', 'INDIA', 'NA', 'runidas22@gmail.com', 1, 'O+', '2022-08-18', '700279592054', 0, 42, NULL),
(339, 'V06598', 'BHAGYASHREE BURAGOHAIN', NULL, NULL, 4, '2002-11-10', '6001390332', '1 NO CHIRINGHULA, CHIRING HULA NO 1, CHRINGHULA, DIBRUGARH EAST, DIBRUGARH, ASSAM 786010     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'bhagyashreeburagohain966@gmail.com', 1, 'O+', '2022-08-18', '637309482800', 0, 42, NULL),
(340, 'V06599', 'JOYSHREE BURAGOHAIN', NULL, NULL, 4, '2002-05-02', '9954095516', '1 NO CHIRINGHULA, CHIRING HULA NO 1, CHRINGHULA, DIBRUGARH EAST, DIBRUGARH, ASSAM 786010     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'joyshreeburagohain470@gmail.com', 1, 'O+', '2022-08-18', '940630380813', 0, 42, NULL),
(341, 'V06600 ', 'NEEHA DEVI', NULL, NULL, 4, '2002-11-19', '8011791173', 'RENGBENG, GARUBANDA MIKIR GAON, RENG BENG GRANT, KAMPUR, NAGAON ASSAM 782427     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'nickibasty@gmail.com', 1, 'B+', '2022-08-18', '708113123403', 0, 42, NULL),
(342, 'V06597', 'ARUNJYOTI SAIKIA', NULL, NULL, 25, '2003-06-12', '8822470258', 'VILLAGE BARKATHANI, DHALPUR, LAKHIMPUR, ASSAM 784165     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'arunimasaikia832@gmail.com', 7, 'A+', '2022-08-18', '257156259217', 0, 42, NULL),
(343, 'V07282', 'ISHANI DAS', NULL, NULL, 25, '2001-09-29', '7326959659', 'NA', 'NA', 'INDIA', 'NA', 'NA', 7, 'NA', '2023-07-12', 'NA', 0, 43, NULL),
(344, 'V07224', 'PALAK KUMARI', NULL, NULL, 4, '2003-06-26', '7070466828', 'NATHPUR, WARD NO.-01, NARPATGANJ, ARARIA BIHAR 854335     INDIA BIHAR ', 'BIHAR', 'INDIA', 'NA', 'impalaksingh29@gmail.com', 1, 'B+', '2023-06-28', '497435647739', 0, 43, NULL),
(345, 'V06489', 'LALRINAWMI', NULL, NULL, 4, '1997-08-28', '8257095924', 'C-33 HMAR VENG V-SECTION KEPRAN AIZAWL MIZORAM  796017     796017 INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'fanailalrinawmi3@gmail.com', 1, 'O+', '2022-07-05', '687369626264', 0, 44, NULL),
(346, 'V06475', 'MARRY LALNUNSANGI', NULL, NULL, 4, '1999-03-23', '7005446507', 'CNB/J-16 CHALTLANG LILY VENG LAIPUITHANG AIZAWL MIZORAM     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'teteiviego97@gmail.com', 1, 'A+', '2022-07-05', '503260570730', 0, 44, NULL),
(347, 'V06016', 'HMINGTHANSANGI', NULL, NULL, 4, '2003-10-11', '8729881847', '140, CHHIMTHLER KELSIH, AIZWAL MIZORAM      ', 'MIZORAM', 'INDIA', 'NA', 'NA', 1, 'O+', '2021-12-20', '570827692639', 0, 44, NULL),
(348, 'D00868', 'LALRAMHMACHHUANI', NULL, NULL, 1, '1997-04-30', '9863644547', '91, ZALEN VENG, NEAR BUS STATION, VAIRENGTE, MIZORAM 796101     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'taeyee0@gmail.com', 1, 'B+', '2022-07-07', '760744378376', 0, 44, NULL),
(349, 'V06141', 'K LALRINPUII', NULL, NULL, 4, '2000-05-29', '9359018564', '25(3), CHANMARI , NEAR BCM CHANMARI BELKHAI, LUNGLEI, MIZORAM,        ', 'MIZORAM', 'INDIA', 'NA', 'marnielalrinpuii@gmail.com', 1, 'O+', '2022-02-12', '816739520975', 0, 44, NULL),
(350, 'V06150', 'JYOTIREKHA SONOWAL', NULL, NULL, 4, '1995-10-27', '7086134453', 'NAKHATIA SONOWAL GAON MATHAWANI, NAHARKATIYA DIBRUGARH, ASSAM 786610      ', 'ASSAM', 'INDIA', 'NA', 'jyotirekhasonowal2000@gmail.com', 1, 'O+', '2022-02-05', '208270136942', 0, 45, NULL),
(351, 'V06256', 'RIYA BARICK', NULL, NULL, 4, '2002-01-10', '9681441301', 'BISHPARA NO2 BISHPARA NAYASARAI, HOOGHLY 712513    INDIA  ', 'WEST BENGAL', 'INDIA', 'NA', 'riyabarick2@gmail.com', 1, '0', '2022-04-18', '813726990659', 0, 45, NULL),
(352, 'V06151', 'SOKHINA BEGUM', NULL, NULL, 5, '2002-11-21', '8638152908', 'BORABHAIPURIA, ABHOIPURIA DIBRUGARH  ASSAM  786103      ', 'ASSAM', 'INDIA', 'NA', 'jurikhan3@gmail.com', 2, 'A+', '2022-02-05', '583184032129', 0, 45, NULL),
(353, 'V06738', 'CANDINA MARY MARBANIANG', NULL, NULL, 5, '2003-06-19', '6009471567', 'NEAR CHRUCH OF GOD, MAWNGAP MAWKHARSHIING, EAST KHASI HILLS MEGHALAYA 793121     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'candymarbaniang@gmail.com', 2, 'AB+', '2022-10-15', '597968857929', 0, 45, NULL),
(354, 'V06744', 'LARIHUN MARBANIANG', NULL, NULL, 5, '2001-11-07', '9101851398', 'MAWLAI, MAWLALI, EAST KHASI HILLS MEGHALAYA 793017     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'larihun@gmail.com', 2, 'A+', '2022-10-15', '799729227697', 0, 45, NULL),
(355, 'V06737', 'HASSADELA SURONG', NULL, NULL, 13, '2003-04-03', '9612181637', 'NEAR MERCYCHILD UPPER PRIMARY SCHOOL, DONG SUROK, THANGSNING, EAST KHASI HILLS MEGHALAYA 793015     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'hassadelasurong07@gmail.com', 4, 'A+', '2022-10-15', '746978295052', 0, 45, NULL),
(356, 'V07205', 'RAKMI R SHIMRAY', NULL, NULL, 6, '2003-11-06', '6009321211', 'SOMDAL VILLAGE, UKHRUL  MANIPUR 795144     INDIA MANIPUR  ', 'MANIPUR', 'INDIA', 'NA', 'rakmishimray5@gmail.com', 3, 'O+', '2023-06-27', '592915766666', 0, 46, NULL),
(357, 'H03181', 'ACHAL JUGAKAR', NULL, NULL, 4, '1999-12-06', '9606771514', '398, GOTEGALI KARWAR, UTTARA KANNADA KARNATAKA 581317     INDIA KARNATAKA ', 'KARNATAKA', 'INDIA', 'NA', 'aachaljugakar@gmail.com', 1, 'AB+', '2023-07-10', '882915556723', 0, 46, NULL),
(358, 'V06171', 'LALNUNHIMI', NULL, NULL, 4, '1998-10-09', '8794578482', '491, VENGTHAR,  NEAR ELECTRIC SDO OFFICE ELUNGDAR, MIZORAM 796370   796370   ', 'MIZORAM', 'INDIA', 'NA', 'anbucndi@gmail.com', 1, 'O+', '2022-02-15', '753434293490', 0, 46, NULL),
(359, 'V06149', 'MILLI MAHATO', NULL, NULL, 4, '1999-07-27', '9707317726', 'CHABUA C WARD CHABUA, DIBRUGARH ASSAM 786184      ', 'ASSAM', 'INDIA', 'NA', 'milimahto814@gmail.com', 1, 'A+', '2022-02-05', '540733950285', 0, 46, NULL),
(360, 'V06170', 'LALNUNTHARI', NULL, NULL, 4, '1997-08-12', '9383009703', 'CEN 001, KAHRAWT NEAR LM SCHOOL, CHAMPHAI MIZORAM  796321      ', 'MIZORAM', 'INDIA', 'NA', 'lalnuntharijuly27@gmail.com', 1, 'B+', '2022-02-15', '745508189540', 0, 46, NULL),
(361, 'H02853', 'ROSANGKIMI', NULL, NULL, 7, '2004-02-08', '8787326959', 'Centenary Road, Kawn Veng, Bikhawthlir, Kolasib, Mizoram 796091     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'rosankmikilelhchhun@gmail.com', 3, 'B+', '2021-10-30', '808091156565', 0, 46, NULL),
(362, 'V07292', 'SAMRUDHI KAVLEKAR ', NULL, NULL, 2, '2003-10-02', '8010637688', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-07-24', 'NA', 0, 47, NULL),
(363, 'V07255', 'CHASA MARAK', NULL, NULL, 4, '2001-06-10', '9863362003', '165, MODYNAGAR, DANAKGRE, WEST GARO HILLS,  MEGHALAYA 794101     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'chiasamarak949@gmail.com', 1, 'AB+', '2023-07-06', '655294775225', 0, 47, NULL),
(364, 'H02934', 'PRABHA LAMA', NULL, NULL, 8, '1992-10-11', '7501495321', 'DB LINE LANKAPARA TEAGARDEN LANKAPARAHAT JALPAIGURI WEST BENGAL 735228     INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'prabhalama954@gmail.com', 1, 'B+', '2022-09-26', '261240134602', 0, 47, NULL),
(365, 'H02959', 'SOMITA RAI', NULL, NULL, 8, '1989-12-02', '9635608353', '28, PARBING, LUING PERBING, RANKA, EAST SIKKIM, SIKKIM        ', 'SIKKIM', 'INDIA', 'NA', 'NA', 1, 'A+', '2022-09-24', '208037043219', 0, 47, NULL),
(366, 'H02960', 'DIKI SHERPA SR', NULL, NULL, 4, '2000-02-04', '8116385893', 'H NO.93, UPPER LINGTAM, SUB - RANGOLI DIST EAST SIKKIM      INDIA SIKKIM ', 'SIKKIM', 'INDIA', 'NA', 'NA', 1, 'A+', '2022-09-24', '943585687254', 0, 47, NULL),
(367, 'V06264', 'RENBENY OVUNG ITHM', NULL, NULL, 4, '1996-07-08', '8575821170', 'H.NO. 37/ WARD 2 CHUMUKEDIMA, DIMAPUR NAGALAND 797103    INDIA NAGALAND  ', 'NAGALAND', 'INDIA', 'NA', 'ovungrenren7@gmail.com', 1, 'O+', '2022-04-11', '256390976687', 0, 47, NULL),
(368, 'V06586', 'PRATISHA SYNREM', NULL, NULL, 2, '2003-05-18', '9612532468', 'UMPLING DONGSHANENG SHILLONG, RYNJAH, EAST KHASI HILLS, MEGHALAYA 793006     INDIA MEGHALAYA ', 'NAGALAND', 'INDIA', 'NA', 'pratishasynrem@gmail.com', 1, 'O+', '2022-08-16', '775159538938', 0, 48, NULL),
(369, 'V07256', 'R S PAMREIHOR', NULL, NULL, 4, '2000-01-03', '8731890821', 'LILOMTANG, NGAINGA(NGAIMU), VILLAGE, NGAIMU, UKHRUL,  MANIPUR 795142     INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'NA', 1, 'A+', '2023-07-07', '730983912527', 0, 48, NULL),
(370, 'V06331', 'LALSANGKIMI', NULL, NULL, 4, '2000-02-02', '8787712685', '104 FIELD VENG NEAR ICI CHURCH VAJRENGTE, VAIRENGTE KOLASIB MIZORAM  796101 MIZORAM 796101   ', 'MIZORAM', 'INDIA', 'NA', 'ksang9299@gmail.com', 1, 'O+', '2022-05-06', '322453243702', 0, 48, NULL),
(371, 'V06330', 'C LALREMSIAMI', NULL, NULL, 4, '2004-01-27', '8794045415', '113 KHUANGPULLAM KOLASIB MIZORAM 796081   796081 INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'remsiamichhunthang@gmail.com', 1, 'O+', '2022-05-06', '285289283874', 0, 48, NULL),
(372, 'V06327', 'C MALSAWMZUALI', NULL, NULL, 4, '1999-05-25', '9863038311', '15 H.NO.15(1) PROJECT VENG CONVENT ROAD BUILUM, KOLASIB MIZORAM   INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'sawmichhangte600@gmail.com', 1, '0', '2022-05-06', '220245647033', 0, 48, NULL),
(373, 'V06329', 'ESTHER LALNUNPUII', NULL, NULL, 8, '1997-03-22', '8974396937', 'H NO.138 RAMTLER NEW YMA HALL SECTION B, LUNGLAI  796701   796701  MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'estherlalnunpuii055@gmail.com', 1, 'B+', '2022-05-06', '721325593261', 0, 48, NULL),
(374, 'V07104', 'GIRIDHARI BEURA', NULL, NULL, 45, '1997-03-23', '9776255439', 'KUSUPANGI, CUTTACK ODISHA 754007     INDIA ODISHA  ', 'ODISHA', 'INDIA', 'NA', 'NA', 12, 'A+', '2023-04-17', '567195533448', 0, 114, NULL),
(375, 'H02621', 'JAGANNATH NAIK', NULL, NULL, 45, '1975-07-22', '9405303348', 'DALVIWADI, MORGAON DODAMARG, SINDHUDURG MAHARASHTRA   416511   ', 'MAHARASHTRA', 'INDIA', 'NA', 'jaganathnaik1398@gmail.com', 12, 'O+', '2022-10-07', '293530836709', 0, 114, NULL),
(376, 'H02745', 'KESHAV R AMBIG', NULL, NULL, 46, '1980-09-01', '9822103540', 'HONNAVAR KOLAGADDE KHARWA UTTARA KANNADA KHARWA KARNATAKA 581361     INDIA KARNATAKA ', 'KARNATAKA', 'INDIA', 'NA', 'NA', 8, 'A+', '2022-10-29', '923582198809', 0, 114, NULL),
(377, 'V02479', 'NAGESH KHARWAT', NULL, NULL, 46, '1983-01-26', '9404939743', 'NA', 'NA', 'INDIA', 'NA', 'NA', 8, 'O+', '2022-10-10', '526447823221', 0, 115, NULL),
(378, 'V04392', 'SANJIV GAWAS', NULL, NULL, 31, '1969-08-14', '7620252616', 'NEAR SATERI TEMPLE, ZARME SATTARI MAUZI, NORTH GOA GOA   403506   ', 'GOA', 'INDIA', 'NA', 'NA', 8, 'B+', '2022-10-10', '521911171265', 0, 115, NULL),
(379, 'H02129', 'YAMBIR BASHEL', NULL, NULL, 32, '1999-11-28', '9763938689', 'BIRROT GABIS WARD NO 5 PALPA LUMBENI NEPAL     NEPAL  ', 'NEPAL', 'NEPAL', 'NA', 'bashelyambir@gmail.com', 8, 'AB+', '2022-10-17', '632664835489', 0, 115, NULL),
(380, 'V07172', 'NAKUL PATIL', NULL, NULL, 47, '2001-10-01', '7720901027', 'MAIN ROAD, CHANDGAD, SATAWANE, KOLHAPUR, MAHARASHTRA MAHARASHTRA    416509 INDIA MAHARASHTRA ', 'MAHARASHTRA', 'INDIA', 'NA', 'nakulpatil2811@gmail.com', 11, 'O', '2023-05-31', '247660616580', 0, 116, NULL),
(381, 'V06242', 'SWAPNIL KACHANKAR', NULL, NULL, 44, '1999-11-12', '9112626256', 'KARAPEWADI MANEWADI PATAN , SATARA MAHARASHTRA  SATARA 415103 INDIA MAHARASHTRA ', 'MAHARASHTRA', 'INDIA', 'NA', 'swapniloct2001@gmail.com', 12, 'O+', '2023-07-01', '292572319170', 0, 116, NULL),
(382, 'V07266', 'SHUBHAM RAWOOL', NULL, NULL, 21, '2001-09-28', '8263820421', 'H.NO.228,RAWOOLWADI, KUDASE, DODAMARG SINDHUDURG MAHARASHTRA 416512     INDIA MAHARASHTRA ', 'MAHARASHTRA', 'INDIA', 'NA', 'rawoolshubhu125@gmail.com', 8, 'A+', '2023-07-11', '907011107190', 0, 116, NULL),
(383, 'V06990', 'BHUSHAN RAWOOL', NULL, NULL, 21, '2000-05-10', '8459270379', '922 VASUSEWADI, DEULLWADA, NERUR, TARF HAVELI   SINDHUDURG MAHARASHTRA 416525     INDIA MAHARASHTRA ', 'MAHARASHTRA', 'INDIA', 'NA', 'bhushanrawool2001@gmail.com', 8, 'O+', '2023-01-09', '442496622211', 0, 117, NULL),
(384, 'V06991', 'HARSHAD BHALEKAR', NULL, NULL, 21, '1999-02-17', '9168510334', '537, MOBAR, DEVBAG, MALWAN SINDHUDURG MAHARASHTRA     INDIA MAHARASHTRA ', 'MAHARASHTRA', 'INDIA', 'NA', 'harshadbhalekar105@gmail.com', 8, 'A+', '2023-01-09', '316786136950', 0, 117, NULL),
(385, 'D00986', 'MOIN KHAN', NULL, NULL, 29, '2000-09-11', '7019065215', 'H NO 262, KHAREWADA, NEAR TILAK MAINDAN, VASCO DA GAMA, SOUTH GOA GOA 403802     INDIA GOA ', 'GOA', 'INDIA', 'NA', 'mrzaankhan07@gmail.com', 2, 'A+', '2023-03-03', '795610510116', 0, 117, NULL),
(386, 'H03195', 'HAMID REZA', NULL, NULL, 29, '2003-08-07', '9128679425', 'NA', 'NA', 'INDIA', 'NA', 'NA', 2, 'NA', '2023-07-11', 'NA', 0, 118, NULL),
(387, 'V07280 ', 'MANISH KUMAR SINGH', NULL, NULL, 34, '1995-03-10', '9572671623', 'NA', 'NA', 'INDIA', 'NA', 'NA', 8, 'NA', '2023-07-12', 'NA', 0, 118, NULL),
(388, 'V06090', 'RAKESH KUMAR', NULL, NULL, 31, '1996-01-04', '7837187799', 'PO RAGAON , BARAKOT RAIGHAON , CHAMPAWAT UTTARAKHAND   262527   ', 'UTTARAKHAND', 'INDIA', 'NA', 'NA', 8, 'B+', '2022-10-17', '552722926017', 0, 119, NULL),
(389, 'V04342', 'SANILAL SAROJ', NULL, NULL, 29, '2001-10-20', '8408997752', 'BONDEL, CALEM, SOUTH GOA , GOA     403704 INDIA GOA ', 'GOA', 'INDIA', 'NA', 'sanisaroj07@gmail.com', 2, 'B+', '2022-10-24', '497289061448', 0, 119, NULL),
(390, 'H03196', 'KRISHNANDAN SAH', NULL, NULL, 29, '2002-03-28', '8340506204', 'NA', 'NA', 'INDIA', 'NA', 'NA', 2, 'NA', '2023-07-12', 'NA', 0, 120, NULL),
(391, 'H03194', 'AHMED HAMZAH', NULL, NULL, 29, '2001-09-25', '7003378781', 'NA', 'NA', 'INDIA', 'NA', 'NA', 2, 'NA', '2023-07-12', 'NA', 0, 120, NULL),
(392, 'V07281', 'ARYAN PARDHI', NULL, NULL, 21, '2000-10-20', '7620668532', 'NA', 'NA', 'INDIA', 'NA', 'NA', 8, 'NA', '2023-07-12', 'NA', 0, 120, NULL),
(393, 'V06996', 'HEMANTH GOWDA', NULL, NULL, 21, '2001-07-09', '6361219233', '01 NERNAHALLI KOLAR HUTHUR POST KARNATAKA 563101     INDIA KARNATAKA ', 'KARNATAKA', 'INDIA', 'NA', 'hemanthpop456@gmail.com', 8, 'B+', '2023-01-17', '299155772829', 0, 121, NULL),
(394, 'H03046', 'WINSTON DSOUZA', NULL, NULL, 21, '2001-10-18', '8431049600', 'REVANNA GOWDA COMPOUND RAMESHWARA NAGAR CHIKMAGALUR KARNATAKA 577101     INDIA KARNATAKA ', 'KARNATAKA', 'INDIA', 'NA', 'dsouzaw1543@gmail.com', 8, 'A+', '2023-01-17', '851858644765', 0, 121, NULL),
(395, 'H03045', 'PREETHAM DSOUZA', NULL, NULL, 48, '1980-04-20', '9380679206', 'HOUSE NO 4 11 1 SHANTHI NAGARA HOUSE NAGRI POST BANTWALA TALUK SAJIPAMUDA DAKSHINA KANNADA KARNATAKA 574231     INDIA KARNATAKA ', 'KARNATAKA', 'INDIA', 'NA', 'preethamdsouza68@gmail.com', 13, 'B+', '2023-01-17', '716578442703', 0, 121, NULL),
(396, 'V04676', 'ARUN GAWAS', NULL, NULL, 48, '1997-04-15', '7057652152', '309,  SHIRANGE SINDHUDURG, DODAMARG MAHARASHTRA   416512   ', 'MAHARASHTRA', 'INDIA', 'NA', 'NA', 13, 'B+', '2022-10-14', '728412809308', 0, 122, NULL),
(397, 'H02676', 'MO VASIM', NULL, NULL, 31, '1995-07-15', '9175563519', '22,HANDIYA POST MITTUPUR BALIEPUR,MITTUPUR AZAMGARGH UTTAR PRADESH  224166 INDIA UTTAR PRADESH ', 'UTTAR PRADESH', 'INDIA', 'NA', 'NA', 8, 'B+', '2022-10-14', '914365644077', 0, 122, NULL),
(398, 'V05581', 'RAKESH KHUNTIA', NULL, NULL, 30, '1987-05-25', '8260753607', 'SAKERI , GARJANI NAYAGARH  ODISHA   752081   ', 'ODISHA', 'INDIA', 'NA', 'chefrakesh54@gmail.com', 8, 'O+', '2022-10-14', '597968076010', 0, 122, NULL),
(399, 'V04308', 'MIHIR KUMAR SI', NULL, NULL, 31, '1975-10-08', '9337322718', 'FANIA, MAYURBHANJ, SULIAPADA, ORISSA     757084   ', 'ORISSA', 'INDIA', 'NA', 'NA', 8, 'A+', '2022-10-23', '886005059083', 0, 123, NULL),
(400, 'V06615', 'VIJAY SINGH', NULL, NULL, 34, '1991-08-11', '9165934085', 'SILKANI DOGI TEHRI GARHWAL  UTTARAKHAND 249192     INDIA UTTARAKHAND ', 'UTTARAKHAND', 'INDIA', 'NA', 'vijaysinghkainturavsk@gmail.com', 8, 'B+', '2022-10-17', '694049621355', 0, 123, NULL),
(401, 'V02192', 'SUMIT SINGH', NULL, NULL, 30, '1988-01-31', '7768098438', 'NA', 'NA', 'INDIA', 'NA', 'NA', 8, 'NA', '2022-05-04', '426007322812', 0, 123, NULL),
(402, 'VDP267', 'AMIR ALI', NULL, NULL, 30, '1992-04-12', '9370096275', 'NA', 'NA', 'INDIA', 'NA', 'NA', 8, 'A+', '2022-10-22', '343483882673', 0, 124, NULL);
INSERT INTO `employee` (`emp_id`, `emp_code`, `fname`, `mname`, `lname`, `designation`, `dob`, `contact`, `address`, `state`, `country`, `pincode`, `email`, `department`, `blood_group`, `joining_date`, `aadhaar_number`, `salary`, `room_id`, `role`) VALUES
(403, 'V06975', 'ANIL KUMAR', NULL, NULL, 41, '1999-06-22', '8958761043', 'H.NO.25/3, MAHEDAA, KATKHET, TEHRI GARHWAL UTTARAKHAND 249151     INDIA UTTARAKHAND ', 'UTTARAKHAND', 'INDIA', 'NA', 'anilchandkumai313215@gmail.com', 11, 'A+', '2023-01-07', '347894051584', 0, 124, NULL),
(404, 'V05954', 'KULDEEP TIGGA', NULL, NULL, 49, '1998-11-03', '6266456418', 'MAAKN NO. 96, WARD NO. 11 NEWAR , RAIGARH CHHATTISGARH   496116 INDIA  ', 'CHHATTISGARH', 'INDIA', 'NA', 'NA', 11, 'B+', '2023-07-11', '528303100771', 0, 124, NULL),
(405, 'H02608', 'TEJAS SATISH PARADHI', NULL, NULL, 21, '1997-10-21', '9119457659', 'JOLAKWADI, MANGAON KUDAL , SINDHUDURG MAHARASHTRA   416519   ', 'MAHARASHTRA', 'INDIA', 'NA', 'NA', 8, 'A+', '2022-10-18', '209394977710', 0, 125, NULL),
(406, 'V06691', 'DHANESH WALAVLKAR', NULL, NULL, 32, '2001-04-23', '7030189981', 'ST FRANCIS WADDO COLVALE BARDEZ  GOA 403513     INDIA GOA ', 'GOA', 'INDIA', 'NA', 'walvalkardhanesh@gmail.com', 8, 'B+', '2022-09-29', '371804367599', 0, 125, NULL),
(407, 'V05970', 'AAVES HANIF KHAN', NULL, NULL, 34, '1997-03-03', '9765701277', 'H NO.C WARD RAJGURU MARG NEAR BISMILA SHAH DARGA BAHERCHAWADA SAWANTWADI  416510 INDIA MAHARASHTRA ', 'MAHARASHTRA', 'INDIA', 'NA', 'aaveskhan110@gmail.com', 8, '0', '2022-10-23', '843264617067', 0, 125, NULL),
(408, 'V04523', 'ARUN SHIRAM', NULL, NULL, 50, '2001-04-19', '9325397128', 'B/284, SECTOR -16 RAURKELA (its) SUNDARGARH ODISHA  769003   ', 'ODISHA', 'INDIA', 'NA', 'arunsen020@gmail.com', 11, 'A+', '2022-10-14', '846186928079', 0, 126, NULL),
(409, 'H03000', 'RAJARAM APA MARATHE', NULL, NULL, 30, '1985-05-10', '7350563784', 'KUMBHAR GALU, MANDKULI, KUDAL, SINDHUDURG MAHARASHTRA 416520     INDIA MAHARASHTRA  ', 'MAHARASHTRA', 'INDIA', 'NA', 'NA', 8, 'O+', '2022-11-25', '290409064823', 0, 126, NULL),
(410, 'V06416', 'VISHANT DEEPAK', NULL, NULL, 33, '1994-03-10', '9075775328', 'KEVIJ PARK RO- 13/14 E WARD, MAHAVEER GARDEN, MAHAVEER COLLEGE ROAD,, NAGALA PARK, KOLHAPUR, MAHARASHTRA - 416003     INDIA MAHARASHTRA ', 'MAHARASHTRA', 'INDIA', 'NA', 'vishantdipkar@gmail.com', 8, 'O+', '2022-10-23', '825790992945', 0, 126, NULL),
(411, 'V04674', 'SONURAM VISHWAKARAMA', NULL, NULL, 31, '1992-07-20', '9970465337', 'H. NO. 13 KAMAJULA, LOHAGHAT RAIGHAON, CHAMPAWAT UTTARAKHAND   262527   ', 'UTTARAKHAND', 'INDIA', 'NA', 'NA', 8, 'AB+', '2021-10-22', '713157979723', 0, 127, NULL),
(412, 'H01820', 'SAJAN SADASHIV SAKPAL', NULL, NULL, 32, '1998-04-15', '8788650164', 'H.NO. 83, SADEWADI POSARE BK. RATNAGIRI MAHARASHTRA  415718   ', 'MAHARASHTRA', 'INDIA', 'NA', 'sajansakpal77@gmail.com', 8, 'A+', '2021-10-22', '476818796857', 0, 127, NULL),
(413, 'V06215', 'KARTIK KUMAR', NULL, NULL, 30, '2000-07-02', '8219535951', 'V.P.O DHAMANDRI  DIST & TEH - UNA  HIMACHAL PRADESH   174303 INDIA  ', 'HIMACHAL PRADESH', 'INDIA', 'NA', 'karthikkumar6875@gmail.com', 8, 'O+', '2022-03-23', '412893520617', 0, 127, NULL),
(414, 'V05971', 'KAMLESH BAVKAR', NULL, NULL, 30, '1998-04-09', '8291801105', '6, SONU PRAKASH BUILDING MIDC ROAD, CHOLEGAON, THAKURLI - EAST KALYAN, TILAKNAGAR, THANE - MAHARASHTRA   421201 INDIA MAHARASHTRA ', 'MAHARASHTRA', 'INDIA', 'NA', 'bavkar.kamlesh6@gmail.com', 8, 'AB+', '2022-12-19', '666724801471', 0, 128, NULL),
(415, 'V06027', 'SHIVRAM VINAYAK NAIK', NULL, NULL, 30, '1993-08-13', '7588478055', '1166, GHOGALWADI , NERURPAR NERUR TARF HAVELI, DEULWADA SINDHUDURG, MAHARASHTRA   416525   ', 'MAHARASHTRA', 'INDIA', 'NA', 'NA', 8, 'A+', '2022-10-23', '250770097455', 0, 128, NULL),
(416, 'V07149', 'SARVESH NAIK', NULL, NULL, 30, '1996-10-12', '9420763809', 'MALACHI RAI, KERAVADE K NARUR, MAHADEVACHE KERVADE, SINDHUDURG, KUDAL MAHARASHTRA 416519     INDIA MAHARASHTRA ', 'MAHARASHTRA', 'INDIA', 'NA', 'sarveshnaik545@gmail.com', 8, 'A+', '2023-05-15', '566151767459', 0, 128, NULL),
(417, 'V05564', 'RITESH KUMBHAR', NULL, NULL, 41, '1982-01-14', '7620839274', '#182, TQ - JOIDA (SUPA) VTC ASU, PO ASU SUPA, UTTAR KANNADA KARNATAKA  581129 INDIA GOA ', 'KARNATAKA', 'INDIA', 'NA', 'ritesh.kumbhar@gmail.com', 8, 'O+', '2022-10-17', '817605056538', 0, 129, NULL),
(418, 'D00283', 'RAJU KUMAR CHANDRA', NULL, NULL, 44, '1994-09-16', '9657380096', 'H NO. 0021/018 DHALCHARA, PART 1 BORKHOLA, SILCHAR JARAILTOLA, CACHAR, ASSAM  788127   ', 'ASSAM', 'INDIA', 'NA', 'NA', 12, 'O+', '2022-10-17', '972564530273', 0, 129, NULL),
(419, 'H03096', 'AKASH CHOWKULKAR', NULL, NULL, 51, '1995-07-05', '7262971191', 'QUERIM, SANQUELIM BORTH GOA GOA     INDIA GOA ', 'GOA', 'INDIA', 'NA', 'gawasakash67@gmail.com', 9, 'A+', '2023-05-08', '872876488768', 0, 129, NULL),
(420, 'V06087', 'ABHISHEK CHAUHAN', NULL, NULL, 52, '1998-07-03', '7066672721', 'S/O DASHRATH CHAUHAN,  AMBREPUR, ,  AZAMGARH, UTTAR PRADESH      ', 'UTTAR PRADESH', 'INDIA', 'NA', 'abhishekchauhanazm@gmail.com', 14, 'B+', '2021-01-27', '622820911768', 0, 144, NULL),
(421, 'V05624', 'PURNANK CHANDRAHAS BHAGAT', NULL, NULL, 53, '1996-04-22', '8999191824', 'H. NO. 140, BHAGATWADA NAG-PALOLEM CANACONA  SOUTH GOA   403702 INDIA GOA ', 'GOA', 'INDIA', 'NA', 'purnankbhagat243@gmail.com', 3, 'A+', '2021-02-19', '386080233855', 0, 144, NULL),
(422, 'D00589', 'LITO JEREMI RODRIGUES', NULL, NULL, 6, '1998-05-06', '7483139234', '#407, HINDUWADA MALLAPUR, KARWAR UTTAR KANNADA KARNATAKA  KARNATAKA   ', 'KARNATAKA', 'INDIA', 'NA', 'litorodrigues96@gmail.com', 3, 'A+', '2021-01-07', '725084895454', 0, 144, NULL),
(423, 'V06651', 'BYNRAPLANG G SHULLAI', NULL, NULL, 6, '2000-04-10', '8794870464', '112, LOWER MAWPREM SNGITHAIANG, SHILLONG MB,,EAST KHASI HILLS, MEGHALAYA 793002      MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'gideonshullai6@gmail.com', 3, 'O+', '2022-08-31', '964864933656', 0, 144, NULL),
(424, 'V05962', 'AIJAZ A SHAIKH', NULL, NULL, 6, '2002-09-11', '7406990991', 'HOUSE NO.97 5TH CROSS RAZA COLONY ANAM NAGAR BELGAVI CITY KARNATAKA 590016 INDIA KARNATAKA ', 'KARNATAKA', 'INDIA', 'NA', 'shaikhzainuu@gmail.com', 3, 'O', '2021-12-10', '212281436381', 0, 144, NULL),
(425, 'V06894', 'JOSHUA SINGH', NULL, NULL, 29, '2001-08-09', '7522994679', 'CHIBITABICHIA PT IX,CACHAR ASSAM     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'joshuameitei79@gmail.com', 2, 'A+', '2023-06-05', '642461206691', 0, 144, NULL),
(426, 'H03172', 'ABHIJEET DUBEY', NULL, NULL, 29, '1999-08-08', '6291432939', 'DAKSHIN NALDANGA, NEAR SITALA MANDIR, HOOGHLY WEST BENGAL 712123     INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'abhijeetdubey415@gmail.com', 2, 'B+', '2023-06-28', '390587294420', 0, 145, NULL),
(427, 'V07278', 'KUNAL KRISHNA KASHYAP', NULL, NULL, 29, '2000-11-12', '7352193130', 'NA', 'NA', 'INDIA', 'NA', 'NA', 2, 'NA', '2023-07-12', 'NA', 0, 145, NULL),
(428, 'V07230', 'ADARSH KANT MISHRA', NULL, NULL, 29, '2003-07-09', '9868410198', '85,STREET NO.1, SHALIMAR VILLAGE, INDL AREA, SHALIMAR BAGH, NORTH WEST DELHI DELHI 110088     INDIA DELHI  ', 'DELHI', 'INDIA', 'NA', 'miidadarsh2000@gmail.com', 2, 'B+', '2023-06-27', '570141707004', 0, 145, NULL),
(429, 'H03171', 'ANIKET THAPA', NULL, NULL, 29, '2000-10-18', '8004113124', 'DULPEX 5, ASHOK VIHAR, ASHOK NAGAR, ALLAHABAD UTTAR PRADESH 211001     INDIA UTTAR PRADESH ', 'UTTAR PRADESH', 'INDIA', 'NA', 'aniketthap@gmail.com', 2, 'A+', '2023-06-27', '846876497995', 0, 145, NULL),
(430, 'V07233', 'RAJAN KUMAR', NULL, NULL, 29, '2002-07-28', '7033287413', 'CHAINPUR DHAKA, EAST CHAMPARAN BIHAR 845418     INDIA BIHAR ', 'BIHAR', 'INDIA', 'NA', 'rajankumar11raj@gmail.com', 2, 'B+', '2023-06-27', '483454834133', 0, 145, NULL),
(431, 'V07235', 'VISHAL KUMAR', NULL, NULL, 29, '2002-02-28', '8340701208', 'M V COLLEGE CHARITRAVAN, BUXAR BIHAR 802101     INDIA BIHAR ', 'BIHAR', 'INDIA', 'NA', 'vishalbxr88@gmail.com', 2, 'O+', '2023-06-27', '426296212101', 0, 145, NULL),
(432, 'V07305', 'ANKIT ROY', NULL, NULL, 29, '1998-03-28', '7903256785', 'NA', 'NA', 'INDIA', 'NA', 'NA', 2, 'NA', '2023-07-25', 'NA', 0, 146, NULL),
(433, 'V07231', 'SHUBHAM PRABHAKAR', NULL, NULL, 29, '2000-11-07', '8102497528', '156, BHUIYADIH, PO AGRICO, JAMSHEDPUR, PURBI SINGHBUM JHARKHAND 831009     INDIA JHARKHAND  ', 'JHARKHAND', 'INDIA', 'NA', 'subhamkumargolu35@gmail.com', 2, 'B+', '2023-06-28', '433908378419', 0, 146, NULL),
(434, 'V07232', 'DEEPAK KUMAR', NULL, NULL, 29, '2002-04-17', '6299662528', 'HETTANPUR, SAMASTIPUR, BIHAR 848504     INDIA BIHAR ', 'BIHAR', 'INDIA', 'NA', 'deepak91ku@gmail.com', 2, 'B+', '2023-06-28', '532488986038', 0, 146, NULL),
(435, 'V07228', 'DIVESH KUMAR', NULL, NULL, 29, '2002-05-11', '8969938328', 'GRAM SIMRA PO TARAJORA PS JAMA DUMKA JHARKHAND 814146     INDIA JHARKHAND ', 'JHARKHAND', 'INDIA', 'NA', 'divesh1y2@gmail.com', 2, 'A+', '2023-06-28', '425676275814', 0, 146, NULL),
(436, 'H03168', 'RITIK GUPTA', NULL, NULL, 29, '2002-09-21', '7462900555', 'VILL KARAHI KHURD P S BASANTPUR, SIWAN BIHAR 841406     INDIA BIHAR ', 'BIHAR', 'INDIA', 'NA', 'rg174967@gmail.com', 2, 'B+', '2023-06-28', '468657233923', 0, 146, NULL),
(437, 'H03174', 'SHUBHAM KUMAR', NULL, NULL, 2, '1998-04-01', '8210700373', 'GADIYANI, WARD NO 05, MADHUBANI BIHAR 847211     INDIA BIHAR ', 'BIHAR', 'INDIA', 'NA', 'kumaraarav8541@gmail.com', 1, 'B+', '2023-06-28', '725329254973', 0, 146, NULL),
(438, 'V07129', 'NINGCHANGMI', NULL, NULL, 2, '1999-03-26', '7638901581', 'SHINGKAP VILLAGE, PHUNGYAR, UKHRUL MANIPUR 795145     INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'ningchangmikashung1998@gmail.com', 1, 'O+', '2021-05-02', '303665335333', 0, 147, NULL),
(439, 'V07133', 'THANMUNG VASHAI', NULL, NULL, 4, '1999-02-08', '9366645876', 'PHARUNG VILLAGE, UKHRUL MANIPUR 795142     INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'thanmungzimik@gmail.com', 1, 'A+', '2023-05-01', '520566053637', 0, 147, NULL),
(440, 'V05769', 'CHINAONGAM KASAR', NULL, NULL, 2, '1997-12-26', '9366927843', 'NUNGSHONG, KHULLEN UKHRUL, MANIPUR 795142       ', 'MANIPUR', 'INDIA', 'NA', 'messikasar@gmail.com', 1, 'B+', '2021-09-27', '525586503750', 0, 147, NULL),
(441, 'V06926', 'NARENDRA SINGH KARKI', NULL, NULL, 4, '1999-03-02', '9370304037', 'BHEEMDATT 15 KANCHANPUR, NEPAL     NEPAL  ', 'NEPAL', 'NEPAL', 'NA', 'NA', 1, 'AB+', '2022-12-13', '499966465317', 0, 147, NULL),
(442, 'V06262', 'LALTHLAMUANA', NULL, NULL, 29, '2000-03-02', '8413012844', 'V-29, V SECTION, NEAR KAWNVENG MAUBAWK AIZAWL 796005     INDIA  ', 'MIZORAM', 'INDIA', 'NA', 'mtatc25@gmail.com', 2, 'O', '2022-04-17', '748537870231', 0, 147, NULL),
(443, 'V07308 ', 'AJAY PAL', NULL, NULL, 4, '2003-06-18', '9082789799', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-07-25', 'NA', 0, 148, NULL),
(444, 'V06639', 'PLABAN MEDHI', NULL, NULL, 29, '1999-06-18', '7896989885', 'BELOGURI GAON KARBI ANGLONG ASSAM 782481      INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'plabanmedhi936@gmail.com', 2, 'O+', '2022-08-25', '356384632263', 0, 148, NULL),
(445, 'V07307 ', 'ASHWINI KUMAR', NULL, NULL, 2, '1996-07-21', '9472170785', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-07-25', 'NA', 0, 148, NULL),
(446, 'V07140', 'DEEP BISWAS', NULL, NULL, 4, '1994-05-17', '7003868855', 'THAKUR NAGAR PALLI, P O NAYAPARA, BARASAT, NORTH 24 PARGANAS WEST BENGAL 700125     INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'deep.biswas8967@gmail.com', 1, 'B+', '2023-05-08', '466541398527', 0, 148, NULL),
(447, 'V05992', 'MIDDYA MD MOSARAF HOSSAIN', NULL, NULL, 54, '2002-06-03', '9609192908', 'KAIGRAM. BARDDHAMAN WEST BENGAL    713145 INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'mosaramiddya3@gmail.com', 6, 'B+', '2021-12-15', '637933504229', 0, 148, NULL),
(448, 'V07061', 'MEHABUB SAYYAD', NULL, NULL, 4, '2000-11-27', '9632779863', 'TASHILDAR GALLI, RANAKUNDE, SANTIBASTWAD, HUKKERI, BELGAVI KARNATAKA 590014     INDIA KARNATAKA ', 'KARNATAKA', 'INDIA', 'NA', 'mehabubsayyad10@gmail.com', 1, 'B+', '2023-03-25', '398831204995', 0, 148, NULL),
(449, 'V06938 ', 'RUSSEL DSOUZA', NULL, NULL, 2, '2001-02-21', '7899908533', '#5-121 KRISHNA BETTU, SANKALAKARIYA, MUNDKURU, KARKALA UDUPI KARNATAKA 576121     INDIA KARNATAKA ', 'KARNATAKA', 'INDIA', 'NA', 'Russeldsouza384@gmail.com', 1, 'B+', '2022-12-19', '583740720828', 0, 149, NULL),
(450, 'V06936', 'SHARON KUNJOMON', NULL, NULL, 2, '2001-01-12', '7907164437', 'VADAKKUMKARA HOUSE KARIKKOTTAKARI, KOOMANTHODE, P O, AYYANKUNNU, KANNUR, KOOMANTHODE KERALA-670704     INDIA KERALA  ', 'KERALA', 'INDIA', 'NA', 'sharonkunjumon2001@gmail.com', 1, 'O+', '2022-12-19', '248644126228', 0, 149, NULL),
(451, 'V06937', 'DANIEL A', NULL, NULL, 55, '1998-06-01', '9972490246', 'MASIDI ROAD, UPPAILI, INDAVARA PORT, CHIKKAMAGLURU KARNATAKA 577101     INDIA KARNATAKA ', 'KARNATAKA', 'INDIA', 'NA', 'danielballer143@gmail.com', 15, 'B+', '2022-12-19', '579783444398', 0, 149, NULL),
(452, 'V06694', 'ASIT THOKDAR', NULL, NULL, 4, '2002-01-22', '9136365960', 'NAODAPARA BHANDARIA CHANDRAOARA MALDA CHANCHAL II  WEST BENGAL 732121     INDIA WEST BENGAL  ', 'WEST BENGAL', 'INDIA', 'NA', 'asitthokdar1998@gmail.com', 1, 'AB+', '2022-09-23', '272195907631', 0, 149, NULL),
(453, 'H02941', 'ABISHEK GURUNG', NULL, NULL, 4, '2002-08-25', '7318911425', 'DAKBANGLOW LANKAPARA TEAGARDEN LANKAPARAHAT ALIPURDUAR WEST BENGAL 735228       INDIA WEST BENGAL  ', 'WEST BENGAL', 'INDIA', 'NA', 'abishekgurung77901@gmail.com', 1, 'O+', '2022-09-26', '770338255142', 0, 149, NULL),
(454, 'H02924', 'MARKUS SUNAR', NULL, NULL, 56, '1984-12-09', '7029643162', 'MARTAM NAZITAM NEAR ST JOSEPH SCHOOL MARTAM UPPER MARTAM GANGTOK EAST SIKKIM SIKKIM 737135     INDIA SIKKIM ', 'SIKKIM', 'INDIA', 'NA', 'NA', 16, 'A+', '2022-09-26', '658801213845', 0, 149, NULL),
(455, 'V02864', 'LAWOO NHANU KADAM', NULL, NULL, 57, '1971-05-20', '8007041129', 'NA', 'NA', 'INDIA', 'NA', 'NA', 16, 'NA', '2021-02-12', '485953434042', 0, 150, NULL),
(456, 'H01721', 'SATYAVAN DESSAI', NULL, NULL, 58, '1996-01-05', '8317296062', 'H. NO. 15  NEAR TIMBLO DRYDOCK GAV WADA, XELVONA , CURCHOREM SOUTH GOA  403706   ', 'GOA', 'INDIA', 'NA', 'satyavan426@gmail.com', 16, 'O+', '2021-03-11', '296276602901', 0, 150, NULL),
(457, 'D00834', 'SANJAY KUMAR', NULL, NULL, 57, '1989-07-21', '8295630966', 'H.NO.368 KICHHANA KAITHAI HARYANA 136027  136027   ', 'HARYANA', 'INDIA', 'NA', 'sanjaykabaddi55@gmail.com', 16, 'O+', '2022-05-16', '388977365949', 0, 150, NULL),
(458, 'V04591', 'AKHIL HENSUWAH', NULL, NULL, 57, '1980-07-01', '7620775887', 'AKAACHILIASAMIYA , NO.1 NALBARI DHEMAJI  ASSAM - 787059   787059   ', 'ASSAM', 'INDIA', 'NA', 'akhilhensuwah908@gmail.com', 16, 'O+', '2022-05-19', '723234917186', 0, 150, NULL),
(459, 'H00964', 'KRISHNA PRASAD KHAREL', NULL, NULL, 4, '2000-08-08', '9765664257', 'NO.4, DONGER GAON, SUAGPUR, KAMRUP ASSAM        ', 'ASSAM', 'INDIA', 'NA', 'NA', 1, 'O+', '2022-04-03', '944051599312', 0, 150, NULL),
(460, 'V06614 ', 'BABU DAS', NULL, NULL, 4, '1999-01-13', '9954956672', 'H NO 238 LAHARIJAN NATUN BOSTI DIPHU KARBI ANGLONG ASSAM 782480     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'babu21221das@gmail.com', 1, 'O+', '2022-08-18', '838562918922', 0, 150, NULL),
(461, 'H02927', 'BIBEK SARKI', NULL, NULL, 11, '2000-05-04', '8389983074', 'DR GRAHAMS HOMES B1, KHASHMAHAL KALIMPONG TOPKHANA, WEST BENGAL 734316     INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'bibeksarki992@gmail.com', 4, 'A+', '2022-09-26', '443499893765', 0, 151, NULL),
(462, 'D00914', 'SUK TSHERING LEPCHA', NULL, NULL, 11, '2002-02-25', '8768574469', 'DABAIPANI LINGSEY LINGSAY KHASMAHAL LAVA KALIMPONG II DARJEELING WEST BENGAL 734319     INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'suktsheringlepcha46@gmail.com', 4, 'O+', '2022-09-26', '790345872501', 0, 151, NULL),
(463, 'D00912', 'YOGESH LAKRA', NULL, NULL, 11, '2002-03-16', '6294175346', '10 NO LINE, PANIGHATTA T.E, PANIGHATA, DARJEELING, WEST BENGAL 734423     INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'yogeshlakra444@gmail.com', 4, 'B+', '2022-09-26', '715377733232', 0, 151, NULL),
(464, 'D00915', 'DIPAN CHHETRI', NULL, NULL, 29, '2000-12-02', '9832155458', 'LOWER PUBUNG GORUBATHAN KHASMAHAL DARJEELING FAGU WEST BENGAL 735231     INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'dipanchhetri000@gmail.com', 2, 'A+', '2022-09-26', '930219475599', 0, 151, NULL),
(465, 'V07277', 'KRISHNA MOHAN SINGH', NULL, NULL, 4, '2003-03-10', '7070879512', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-07-12', 'NA', 0, 151, NULL),
(466, 'V06895', 'CHARANGA MARING', NULL, NULL, 6, '2000-12-26', '6909571537', 'LAMLONG KHULLEN CHANDEL PALLEL  MANIPUR    795135 INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'menaicharanga77@gmail.com', 3, 'B+', '2023-03-21', '319796234605', 0, 151, NULL),
(467, 'D00960', 'PRAJWAL DEVADIGA', NULL, NULL, 59, '1996-07-09', '9380061298', '7 167, ANUGRAHA HARJADDU KUKKUNDOOR KARKALA UDUPI KARNATAKA 576117     INDIA KARNATAKA ', 'KARNATAKA', 'INDIA', 'NA', 'prajwaldevadiga974352@gmail.com', 17, 'A+', '2022-12-17', '721278609509', 0, 152, NULL),
(468, 'V07150', 'SACHIN', NULL, NULL, 4, '2003-09-09', '7892851481', '3 11 901 1, DOOMAPPA COMPOUND NAIGARA LANE BIKARNAIKATTE KULSHEKAR MANGALORE DAKSHINA KANNADA KARNATAKA 575005     INDIA KARNATAKA ', 'KARNATAKA', 'INDIA', 'NA', 'sachinsalian69@gmail.com', 1, 'O+', '2023-05-16', '810559576690', 0, 152, NULL),
(469, 'H02881', 'LALREMSANGA', NULL, NULL, 4, '1998-12-20', '8414005123', 'CHAWLHHMUN AIZAWL MUNICIPAL  COUNCIL MIZORAM 796009      INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'lalremsanga09chicken@gmail.com', 1, 'B+', '2022-08-18', '768477021572', 0, 152, NULL),
(470, 'V06653', 'BISWAJIT SINGH', NULL, NULL, 4, '2003-04-01', '8479951364', '82, SATYA SADHAN DHAR LANE, LILUAH, BALLY,MUNCIPALITY, HAORA,  WEST BENGAL 711204     INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'bs4440208@gmail.com', 1, 'O+', '2022-09-03', '876431437229', 0, 152, NULL),
(471, 'V06640', 'DEVESH RANAJN', NULL, NULL, 4, '2000-07-07', '8638176672', 'TEACHERS QUARTER VIVEKANANDA KENDRA VIDYALAYA,NEC, BARAGOLAI MARGHERITA, BORGOLAI GAON NO 1,,TINSUKIA, ASSAM 786181     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'NA', 1, 'O+', '2022-08-25', '928310316691', 0, 152, NULL),
(472, 'V06861 ', 'MEBANSHAN JYNDIANG', NULL, NULL, 60, '1995-01-26', '7085263953', 'TIEHSAW, WEST KHASI HILLS, NONGSTOIN MEGHALAYA 793119    793119 INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'meban07shan@gmail.com', 15, 'O+', '2022-11-24', '600955777354', 0, 152, NULL),
(473, 'V03671', 'LAXMAN VISHNU KUMBHAR', NULL, NULL, 2, '2001-02-03', '9834858105', '1632, KUMBHARTEMB, TULAS SINDHUDURG    416515 INDIA MAHARASHTRA  ', 'MAHARASHTRA', 'INDIA', 'NA', 'NA', 1, 'A+', '2021-01-07', '455946214215', 0, 153, NULL),
(474, 'H03111', 'AJIT RAI', NULL, NULL, 12, '2002-11-19', '8822398741', 'NO 1 HERHERI, BIL GAON, BARPATHAR, SARUPATHAR, GOLAGHAT ASSAM 785602     INDIA ASSAM  ', 'ASSAM', 'INDIA', 'NA', 'moiyaarai777@gmail.com', 2, 'A+', '2023-04-10', '982660942297', 0, 153, NULL),
(475, 'D01005', 'ABHIJIT KALITA', NULL, NULL, 55, '1996-05-27', '8638453478', 'HOUSE NO.207/A, RAILWAY COLONY,NEAR MALIGAON GATE, NO-4, KAMRUP METRO ASSAM 781011     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'abhijitkalita765@gmail.com', 15, 'B+', '2023-04-10', '248186585893', 0, 153, NULL),
(476, 'H02896', 'AMIRUL ISLAM', NULL, NULL, 29, '2000-02-18', '9579889325', '177 DOBOKA PATHAR COLLEGE ROAD NEAR FIRUJA L P,SCHOOL NAGAON ASSAM,782440      INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'islamamirul196162@gmail.com', 2, 'B+', '2022-10-17', '753710712231', 0, 153, NULL),
(477, 'V07306 ', 'MANISHEKHAR KUMAR', NULL, NULL, 29, '2000-12-21', '7677851942', 'NA', 'NA', 'INDIA', 'NA', 'NA', 2, 'NA', '2023-07-23', 'NA', 0, 153, NULL),
(478, 'V07279', 'AYUSH RAJ', NULL, NULL, 4, '2001-01-19', '6206846936', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-07-12', 'NA', 0, 153, NULL),
(479, 'V06792', 'ROKTIM GOGOI', NULL, NULL, 4, '1997-11-03', '8822318975', 'DIMORUGURI, DUWARA GAON, SIBSAGAR ASSAM 785674     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'rocktim72@gmail.com', 1, 'B+', '2022-11-12', '563369425747', 0, 154, NULL),
(480, 'H02985 ', 'BIKASH SUBBA', NULL, NULL, 4, '2000-07-10', '9365029957', 'SILONY NAGA GAON BORHAT NEAR SHIV MANDIR CHILONI NAGA SIBSAGARASSAM 785693      INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'bikashsubha783@gmail.com', 1, 'A+', '2022-11-13', '716497867457', 0, 154, NULL),
(481, 'D00938', 'RUPAM BURAGOHAIN', NULL, NULL, 4, '2000-07-25', '8638343459', 'CHIRING HULA DIBRUGARH ASSAM 786010      INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'rupam604604@gmail.com', 1, 'O+', '2022-11-14', '303635703654', 0, 154, NULL),
(482, 'V06799', 'DILWAR HUSSAIN', NULL, NULL, 4, '2003-06-24', '6900781052', 'NO 5 GORESWAR, KAMRUP ASSAM 781366     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'dilmahmudalaamin645@gmail.com', 1, 'O+', '2022-11-15', '241454324686', 0, 154, NULL),
(483, 'V06813', 'PRIYANSHU BARUAH', NULL, NULL, 4, '2003-09-03', '6001502708', 'BORDOLOI NAGAR, TINSUKIA ASSAM 786125     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'priyanshubaruah20v@gmail.com', 1, 'B+', '2022-11-17', '320805195659', 0, 154, NULL),
(484, 'H03002', 'T LALRINCHHANA', NULL, NULL, 4, '2002-12-20', '9863694562', 'V 53 A, V SECTION, NEAR MICE SCHOOL, VENGHLUI, AIZAWL MUNCIPAL COUNCIL, AIZAWL MIZORAM 796001    796001 INDIA MIZORAM  ', 'MIZORAM', 'INDIA', 'NA', 'nxglasss@gmail.com', 1, 'A+', '2022-11-21', '450310298338', 0, 155, NULL),
(485, 'V06871 ', 'CHINMOY HAZARIKA', NULL, NULL, 4, '2000-12-12', '9869486045', 'CHUKAFA PATHA, SATGAON, PANJABARI, KAMRUP METRO ASSAM 781037     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'chinmoyhazarika75@gmail.com', 1, 'A+', '2022-11-24', '642246763946', 0, 155, NULL),
(486, 'V06340', 'ZOREMTLUANGA COLNEY', NULL, NULL, 4, '1999-07-03', '6009887227', 'N9-6 BAWNGKAWN, AIZAWAL MUNCIPAL COUNCIL AIZWAL MIZORAM    INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'NA', 1, 'O', '2022-05-13', '321411795151', 0, 155, NULL),
(487, 'V06393', 'K LALNUPUNIA', NULL, NULL, 27, '2003-08-11', '9077547082', 'H/NO - 8 / 2, KHUANGCHERA SECTION, HIGH SCHOOL VENG, BETHLEHEM VENGTHLANG, BETHLEHEM, AIZAWL, BETHLEHEM, MIZORAM, - 796008     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'nunpuia2019@gmail.com', 2, 'A+', '2022-05-28', '742972361196', 0, 155, NULL),
(488, 'V06876', 'H NANDAMONI SINGH', NULL, NULL, 27, '2000-06-26', '7099105032', 'PIPAL PUHURI NO.1 NAGAON ASSAM     782446 GOA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'snabin091@gmail.com', 2, 'A+', '2022-11-24', '469013801588', 0, 155, NULL),
(489, 'D01008', 'NITUL PATHAK', NULL, NULL, 4, '2002-01-01', '9365006353', 'VILL CHAKRASHILA PART 2, PO BOTGURI, DARKINAMARI, BONGAIGAON ASSAM 783383     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'NA', 1, 'A+', '2023-04-12', '238957013558', 0, 156, NULL),
(490, 'V06877 ', 'MAMUD NAJIR ALI', NULL, NULL, 27, '1998-06-13', '8133062465', 'KHATANIAPARA, JOGIPARA, DARRANG ASSAM 784146    784146 INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'mamudnajirali@gmail.com', 2, 'A+', '2022-11-26', '963619057106', 0, 156, NULL),
(491, 'V06908', 'BIPIN GUWALA', NULL, NULL, 27, '1997-04-27', '8134072575', 'DIKOM DIBRUGARH DIKOM  ASSAM     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'bipingowalla98@gmail.com', 2, 'B+', '2022-12-05', '437360400073', 0, 156, NULL),
(492, 'V06907 ', 'PRAKASH EKKA', NULL, NULL, 61, '2002-08-25', '8011693405', 'TIPUK T.E.101 TINSUKIA  ASSAM    786156 INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'ekkaprakash44@gmail.com', 1, 'A+', '2022-12-05', '578341482444', 0, 156, NULL),
(493, 'V06913', 'BHARATH RAJ', NULL, NULL, 27, '1996-08-12', '7022118932', 'H.NO.1-6/6, THILAK NAGARA, AMBLAMOGARU MANGLORE KARNATAKA     INDIA KARNATAKA ', 'KARNATAKA', 'INDIA', 'NA', 'bharathpoojary184@gmail.com', 2, 'A+', '2022-12-10', '663137775090', 0, 156, NULL),
(494, 'V06916', 'MEKHRIETO VULPRU', NULL, NULL, 27, '1994-02-17', '8787556391', 'HIGH SCHOOL ROAD , NEAR GOVT HIGH SCHOOL COLONY KOHIMA SADAR NAGALAND 797001     INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'khribu08@gmail.com', 2, 'O', '2022-12-08', '881689505613', 0, 157, NULL),
(495, 'V06931', 'MULEO TUNYI', NULL, NULL, 27, '2002-03-18', '8787705460', 'KIKRUMA, P O PFUTSERO, KIKRUMA VILLAGE, PHEK NAGALAND 797107    797107 INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'muleotunyi9@gmail.com', 2, 'A+', '2022-12-10', '624785734768', 0, 157, NULL),
(496, 'V07020', 'LANUSANEN WALLING', NULL, NULL, 2, '2001-08-31', '6009769658', 'MOKOKCHUNG AMENYONG KHENSA  NAGALAND      INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'isanen8@gmail.com', 1, 'O+', '2023-01-23', '399725783706', 0, 157, NULL),
(497, 'V07122', 'H VANHLIMPUIA', NULL, NULL, 1, '1996-09-04', '8730967218', 'VH/K6-3, K-SECTION, VENGHNUAI, NEAR PRESBYTERIAN CHURCH, KULIKAWN, AIZAWL MIZORAM 796005     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'puiavirgoprince31@gmail.com', 1, 'B+', '2023-05-03', '950982525784', 0, 157, NULL),
(498, 'V07191', 'SAGOLSEM SURESHKUMAR SINGH', NULL, NULL, 2, '2000-06-26', '7005852026', 'LANGTHABAL MANTRIKHONG, AWANG LEIKAI, IMPHAL WEST  MANIPUR 795003     INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'blackopsgulit@gmail.com', 1, 'O+', '2023-06-13', '944677948440', 0, 157, NULL),
(499, 'H03106', 'MHABEMO MURRY', NULL, NULL, 27, '2002-11-15', '7085867419', 'BPO BAGHTY, BAGHTY HQ, WOKHA NAGALAND 797111     INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'mhabemomurry7@gmail.com', 2, 'A+', '2023-04-06', '242191755440', 0, 157, NULL),
(500, 'D00630', 'ECHUNGBENI ODYUO', NULL, NULL, 1, '1998-03-15', '8794230138', 'H NO. 715 , LOWER AG COLONY KOHIMA SADAR KOHIMA, NAGALAND   797001   ', 'NAGALAND', 'INDIA', 'NA', 'echungbeniodyuo@gmail.com', 1, 'O+', '2021-01-22', '938526773555', 0, 65, NULL),
(501, 'D00432', 'KENYUSALE TEP', NULL, NULL, 4, '1998-07-13', '9862493720', 'NEAR BETHESDA  HR SEC SCHOOL DIMAPUR, NAGALAND   797112   ', 'NAGALAND', 'INDIA', 'NA', 'kenyusale@gmail.com', 1, 'A+', '2021-01-22', '384580115527', 0, 65, NULL),
(502, 'D00631', 'MHASINUO TALIE', NULL, NULL, 4, '1998-12-21', '8837098984', 'KACHARIGAON VILLAGE  DIMAPUR SADAR  DIMAPUR, NAGALAND   797112   ', 'NAGALAND', 'INDIA', 'NA', 'NA', 1, 'O+', '2021-01-22', '933433434547', 0, 65, NULL),
(503, 'H02850', 'AHANA THARU', NULL, NULL, 4, '2000-07-20', '9975302380', 'NEAR VASCO SPORTS CLUB, NON MON DEMPO BHATT, VASCO DA GAMA, SOUTH GOA GOA 403802     INDIA GOA ', 'GOA', 'INDIA', 'NA', 'hayatrajbancy@gmail.com', 1, 'AB+', '2022-11-08', '472002892768', 0, 66, NULL),
(504, 'H02832', 'LALREMSANGZUALI', NULL, NULL, 4, '1996-08-05', '7640091868', 'HOUSE NO E 105, NEAR CHAMPHAI HIGH SCHOOL, VENGTHALNG NORTH, CHAMPHAI, MIZORAM 796321     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'teihmarzote@gmail.com', 1, 'A+', '2022-07-14', '399553754976', 0, 66, NULL),
(505, 'H02839', 'LALLAWMSANGI', NULL, NULL, 4, '1999-08-16', '8798042818', 'HOUSE NO 22, NEAR MIDDLE SCHOOL, NEW HRUAIKAWN, HRUAIKAWN (NEW), CHAMPHAI, MIZORAM 796321     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'NA', 1, 'AB-', '2022-07-14', '266300914480', 0, 66, NULL),
(506, 'D00609', 'SANGITA SANGMA', NULL, NULL, 4, '2003-08-13', '9101942927', 'BENGNABIL, BOKAJAN KARBI, ANALONG ASSAM      ', 'ASSAM', 'INDIA', 'NA', 'NA', 1, 'O+', '2022-05-05', '996359284915', 0, 67, NULL),
(507, 'V06873', 'NANDITA METYA', NULL, NULL, 4, '2002-11-09', '6026717973', 'BHOMORAGURI, KALLABHOMORA, TEZPUR, SONITPUR ASSAM 784027     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'NA', 1, 'B+', '2022-11-24', '260974607470', 0, 67, NULL),
(508, 'V06791 ', 'ANGANA GOGOI', NULL, NULL, 4, '2004-02-10', '8011106428', '1 NO GHURANIA, DIBRUGARH ASSAM 786610     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'anganagogoi623@gmail.com', 1, 'A+', '2022-11-12', '203326568906', 0, 68, NULL),
(509, 'D00939', 'JAHNABI SWARGARI', NULL, NULL, 2, '1997-12-07', '9678588216', 'TIOKRAJABARI SONARI CHARAIDEO ASSAM 785690       INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'jahnobiswargari6@gmail.com', 1, 'A+', '2022-11-12', '423730954062', 0, 68, NULL),
(510, 'GP-713', 'LAXMI GIRI', NULL, NULL, 4, '2000-12-31', '9529160587', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2022-04-24', 'NA', 0, 70, NULL),
(511, 'H02981 ', 'BARSHA BHATTARAI', NULL, NULL, 4, '1999-10-16', '9678066818', 'BHUTANKHUTI BAKSA ASSAM 781372      INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'barsabhattarai2@gmail.com', 1, 'B+', '2022-11-12', '861419119046', 0, 71, NULL),
(512, 'D00932', 'NABINA SUBBA', NULL, NULL, 38, '2000-03-09', '6003662800', 'CHAUKLKARA NIKSHI BASKA ASSAM 781372      INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'nabinasubba23@gmail.com', 7, 'A+', '2022-11-12', '653575620471', 0, 71, NULL),
(513, 'V06859', 'ANJU BRAHMA', NULL, NULL, 4, '2002-10-24', '9678154390', 'AMINKATA, KOKRAJHAR ASSAM 783337    783337 INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'brahmaanju347@gmail.com', 1, 'A+', '2022-11-24', '750370764373', 0, 72, NULL),
(514, 'V06621', 'WONNGAMLA SHANGH', NULL, NULL, 2, '2004-02-20', '8019699662', 'HUISHU VILLAGE, HUISHU, UKHRUL, POII MANIPUR 795142     INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'wonngamshatsang@gmail.com', 1, 'AB+', '2022-08-26', '223729255742', 0, 72, NULL),
(515, 'D00910', 'SONIYA THAKURI', NULL, NULL, 5, '2003-01-27', '9883499359', 'LOWER NOK DARA GIT BEONG KHASMAHAL GITDUBLING -LIDARJEELING WEST BENGAL 734314      INDIA WEST BENGAL  ', 'WEST BENGAL', 'INDIA', 'NA', 'thankurisoniya208@gmail.com', 2, 'A+', '2022-09-26', '396683491853', 0, 84, NULL),
(516, 'D00634', 'IMNASENLA', NULL, NULL, 4, '1997-08-27', '6909249181', 'H NO. 420,  OLD SHOWUBA VILLAGE SHOUBA, DIMAPUR NAGALAND     ', 'NAGALAND', 'INDIA', 'NA', 'NA', 1, 'O+', '2021-01-12', '762831188527', 0, 74, NULL),
(517, 'V05566', 'IMTISENLA AIER', NULL, NULL, 4, '1998-03-17', '8413832108', 'H. NO. 53, F KHEL  DIPHUPAR VILLAGE DIMAPUR NAGALAND  797115 INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'imtisenaier77@gmail.com', 1, 'AB+', '2021-01-12', '381545645890', 0, 74, NULL),
(518, 'D00610', 'NGAUZULE', NULL, NULL, 11, '2002-07-20', '8413832108', 'H . NO. 116, WARD 03,  UNB NAGA COLONY, DIMAPUR SADAR , NAGALAND   797112   ', 'NAGALAND', 'INDIA', 'NA', 'NA', 4, 'AB+', 'NA', '556711200179', 0, 74, NULL),
(519, 'D00911', 'RAKHI LIMBU', NULL, NULL, 63, 'NA', '9749145782', 'LOWER DUNGRA BUSTY, DUNGRA KHASMAHAL, KALIMPONG, WEST BENGAL 734301     INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'limburakhi7@gmail.com', 19, 'AB+', '2022-09-26', '747884446816', 0, 75, NULL),
(520, 'V06812', 'BINTESWORI OAD', NULL, NULL, 3, '1995-09-15', '8798732660', 'BELDANGI 5 KANCHANPUR, NEPAL     NEPAL  ', 'NEPAL', 'NEPL', 'NA', 'angelritu5454@gmail.com', 1, 'A+', '2017-08-19', '590281480252', 0, 76, NULL),
(521, 'V03821', 'R LALRAMNGAIHI', NULL, NULL, 3, '1991-05-04', '7218442340', 'MV - 87, SECTION  I, NEAR CENTENARY CHURCH , MISSION VENG, AIZAWL MUNICIPAL COUNCIL , KULIKAWN, MIZORAM        ', 'MIZORAM', 'INDIA', 'NA', 'NA', 1, 'A+', '2017-08-19', '365866362144', 0, 77, NULL),
(522, 'V03806', 'ROLUAHPUII RALTE', NULL, NULL, 1, '1998-03-11', '7005050785', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'A+', '2022-11-17', '406275899340', 0, 77, NULL),
(523, 'V06809', 'KUAMRI SHRESTHA', NULL, NULL, 1, '1993-04-19', '8798213883', 'MELUNG 6 DOLAKHA, NEPAL   DOLAKHA  NEPAL  ', 'NEPAL', 'NEPAL', 'NA', 'kumaristha93@gmail.com', 1, 'B+', '2022-11-17', '839026405305', 0, 78, NULL),
(524, 'V06811', 'SAJANA MAHARJAN', NULL, NULL, 1, '1997-11-05', '977 9843449344', 'MANAMAIJU 4 KATHMANDU, NEPAL   KATHMANDU  NEPAL  ', 'NEPAL', 'NEPAL', 'NA', 'maharjansazana@gmail.com', 1, 'B+', '2018-12-24', '228616609504', 0, 78, NULL),
(525, 'D00326', 'R ZONUNMAWII', NULL, NULL, 4, '2000-02-23', '7498699205', '64, NORTH SECTION NEAR MIDDLE SCHOOL CHHIPPHIR, LUNGLEI MIZORAM  796701   ', 'MIZORAM', 'INDIA', 'NA', 'zonuniralte73@gmail.com', 1, 'A+', '2022-02-22', '966541023295', 0, 79, NULL),
(526, 'H02711', 'SANJANA PARMAR', NULL, NULL, 4, '2003-02-18', '7903212085', 'VILLAGE BELAHI, LACHHI PS MINAPUR, BELAHI LACHHI MUZAFFARPUR   843128 INDIA BIHAR ', 'BIHAR', 'INDIA', 'NA', 'sanjanaparmar79032@gmail.com', 1, 'B-', '2022-11-29', '654655358102', 0, 79, NULL),
(527, 'V06858', 'MOMPI GOGOI', NULL, NULL, 4, '1999-08-08', '7002106314', 'GOGAMUKH CHARIALI GOGAMUKH GOAN(MIRI) DHEMAJI    787034 INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'gogoimompi80@gmail.com', 1, 'B+', '2022-09-06', '350183913077', 0, 80, NULL),
(528, 'V06650', 'CATHLEEN RAPSANG', NULL, NULL, 4, '2001-09-18', '8794638075', 'NEAR SPRING OF LIFE SCHOOL MAWLAI NONGLUM BLOCK-1 LEWRYNGHEP MAWKYNREW EAST KHASI HILLS MEGHALAYA 793017      INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'rapsangcathleen@gmail.com', 1, 'O+', '2022-09-06', '345429843058', 0, 81, NULL),
(529, 'V06648', 'WANPHERLIN BUHPHANG', NULL, NULL, 63, 'NA', '9362170879', 'BELOW GLAKYN SCHOOL POHKSEN WEST-I RYNJAH EAST KHASI HILLS MEGHALAYA 793006      INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'christinabuhphang@gmail.com', 19, 'B+', '2022-08-31', '325949956618', 0, 81, NULL),
(530, 'V06788 ', 'RAJASHREE SONOWAL', NULL, NULL, 5, '2002-06-29', '9678841135', 'TIPUK TE ASSAMIYA BALIJAN, RUPAI 233 231 NLR, RUPAISIDING, DOOM DOOMA, TINSUKIA ASSAM 786153     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'borahrajashree60@gmail.com', 2, 'O+', '2022-11-12', '334610282182', 0, 82, NULL),
(531, 'H02950', 'PRAGYA RAI', NULL, NULL, 11, '2002-12-01', '9732134717', 'VIRKUNA LOPCHU TEA GARDEN DARJEELING WEST BENGAL 734213      INDIA WEST BENGAL  ', 'WEST BENGAL', 'INDIA', 'NA', 'pragyarai561@gmail.com', 4, 'A+', '2022-09-26', '396394963983', 0, 83, NULL),
(532, 'D00909', 'PRAMITA TAMANG', NULL, NULL, 5, '1998-03-01', '8670268072', 'D B LINE LANKAPARA HAT LANKAPARA TEAGARDEN JALPAIGURI LANKAPARAHAT WEST BENGAL 735228      INDIA WEST BENGAL  ', 'WEST BENGAL', 'INDIA', 'NA', 'pramitatamang1@gmail.com', 2, 'A+', '2022-09-26', '504652460698', 0, 83, NULL),
(533, 'D00934 ', 'NIKITA BARAL', NULL, NULL, 11, '2004-02-13', '7637899596', ' BHUTANKHUL DIHIRA BASKA BAKSA ASSAM 781372      INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'baraln942@gmail.com', 4, 'O+', '2022-11-12', '346544886412', 0, 84, NULL),
(534, 'H02943', 'ONGKIT LEPCHA', NULL, NULL, 5, '2003-03-10', '9883751547', 'LOWER BEONG GIT DUBLING KHASMAHAL DARJEELING WEST BENGAL 734314      INDIA WEST BENGAL  ', 'WEST BENGAL', 'INDIA', 'NA', 'longkitlepcha@gmail.com', 2, 'O+', '2022-09-26', '732937902884', 0, 85, NULL),
(535, 'H02942', 'ROJINA PRADHAN', NULL, NULL, 2, '2001-01-17', '8967530326', '15 NUMBER LINE HOPE TEA GARDEN JALPAIGURI WEST BENGAL 735225      INDIA WEST BENGAL  ', 'WEST BENGAL', 'INDIA', 'NA', 'rajpradhan9933788457@gmail.com', 1, 'A+', '2022-09-26', '925204051137', 0, 85, NULL),
(536, 'V06865', 'THANGME MOMIN', NULL, NULL, 4, '2001-09-02', '8822980984', 'GAROPARA, RANGJULI ASSAM 783130    783130 INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'thangmemomin@gmail.com', 1, 'B+', '2022-11-24', '725954971286', 0, 86, NULL),
(537, 'V06875', 'LEIJA CH MARAK', NULL, NULL, 2, 'NA', '7629085735', '14, RINGGI SONGGITAL, TURA, WEST GARO HILLS MEGHALAYA 794001    794001 INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'lejiamarak05241@gmail.com', 1, 'O+', '2022-11-23', '713656501393', 0, 86, NULL),
(538, 'V06798', 'JARNA DAS', NULL, NULL, 2, 'NA', '8133894905', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2022-11-12', 'NA', 0, 87, NULL),
(539, 'D00936', 'KAJAL SONOWAL', NULL, NULL, 2, 'NA', '8134034942', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2022-11-12', 'NA', 0, 87, NULL),
(540, 'V06804', 'DIPA KARMAKAR', NULL, NULL, 5, '1999-05-07', '9394411864', 'SAMDANG 1 NO LINE, SAMDANG T E 241/239 NLR, TINSUKIA  ASSAM 786190     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'babukarmakar930@gmail.com', 2, 'B+', '2022-11-12', '214364984574', 0, 92, NULL),
(541, 'D00933 ', 'MONALISA DEVI', NULL, NULL, 12, 'NA', '9366997385', 'TATI PATHAR DIBRUGARH ASSAM 786614      INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'monalishadevi1999@gmail.com', 2, 'AB+', '2022-11-12', '770560537632', 0, 92, NULL),
(542, 'V06805 ', 'KAJAL SARKAR', NULL, NULL, 4, '2001-01-03', '8638707753', 'GUIJAN GAON, TINSUKIA  ASSAM 786147     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'kajalsarkar306@gmail.com', 1, 'B+', '2022-11-12', '840615832007', 0, 93, NULL),
(543, 'V06803 ', 'MEGHA PANDEY', NULL, NULL, 4, '2000-12-07', '9864777272', 'TINSUKIA ASSAM 786125     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'meghapandey9864@gmail.com', 1, 'A+', '2022-11-12', '936833916347', 0, 93, NULL),
(544, 'H02983', 'FARHINAZ SAIKIA', NULL, NULL, 4, '2000-12-02', '8474841570', 'BORBIL NO 2 DIGBOI MARGHERITA TINSUKIA ASSAM 786171      INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'farhinazsahin@gmail.com', 1, 'A+', '2022-11-12', '771457918258', 0, 94, NULL),
(545, 'D00937 ', 'SNEHA PANDEY', NULL, NULL, 4, '2000-12-31', '8822346429', 'BANHBARI GAON TINSUKIA ASSAM 786125      INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'snehapandey9102@gmail.com', 1, 'A+', '2022-11-12', '215186198013', 0, 94, NULL),
(546, 'D00941', 'PRIYANKA LAKRA', NULL, NULL, 2, '2003-05-07', '6901707380', 'SHILGRANT, HILGRANT GAON, DIBRUGARH ASSAM 786621     INDIA ASSAM  ', 'ASSAM', 'INDIA', 'NA', 'pranjallakra143@gmail.com', 1, 'O+', '2022-11-17', '384371421768', 0, 95, NULL),
(547, 'V06821', 'HIMASHREE BARUAH', NULL, NULL, 4, '2000-12-30', '9864215268', 'MOUDUMONI, CHARAIDEO ASSAM 785673    785673 INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'himaksiboruah255@gmail.com', 1, 'B+', '2022-11-17', '824188698691', 0, 96, NULL),
(548, 'V06820', 'SUMI BARUAH', NULL, NULL, 4, '2000-01-03', '9854268780', 'RAJAKHAT GAON, NIZ LAHOAL, DIBRUGARH ASSAM 786010    786010 INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'sumibaruah264@gmail.com', 1, 'O+', '2022-11-17', '502315601169', 0, 96, NULL),
(549, 'V06822', 'ANAJALI UPADHAY', NULL, NULL, 2, '1998-04-18', '8099720470', 'S R LOHIA ROAD, TINSUKIA ASSAM 786125    786125 INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'uanjali078@gmail.com', 1, 'A+', '2022-11-17', '991324464269', 0, 97, NULL),
(550, 'V06590', 'ROBISHA SOHIONG', NULL, NULL, 4, '2000-11-05', '9362911731', '61, MAWTNENG, RI BHOI,  MEGHALAYA 793103     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'rubi98sohiong@gmail.com', 1, 'B+', '2022-08-18', '516266908488', 0, 97, NULL),
(551, 'H02992', 'MANJU TAMANG', NULL, NULL, 4, '1999-01-01', '6901437296', 'BHUTANKHUTI, BAKSA ASSAM 781372    781372 INDIA ASSAM  ', 'ASSAM', 'INDIA', 'NA', 'lamamanju928@gmail.com', 1, 'A+', '2022-11-17', '770071901271', 0, 98, NULL),
(552, 'V06816', 'SANGITA TAMANG', NULL, NULL, 11, '2001-11-05', '3945017020', 'BHUTANKHUTI, BAKSA ASSAM 781372     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'tamangsangita609@gmail.com', 4, 'B+', '2022-11-17', '825062593608', 0, 98, NULL),
(553, 'V06825', 'JOSODA PRADHAN', NULL, NULL, 4, '2000-11-30', '8134956957', 'NEAR 14 NO LINE, NAMRUP TE, NAMRUP CHAH BAGICHA RLY, DIBRUGARH ASSAM 786621    786621 INDIA ASSAM  ', 'ASSAM', 'INDIA', 'NA', 'josodapradhan958@gmail.com', 1, 'O+', '2022-11-17', '229187915830', 0, 99, NULL),
(554, 'H02993', 'SIKHAMONI DEOGHARIA', NULL, NULL, 2, '2004-01-10', '6003601107', 'DANGORI KUMAR, BORHAT, CHARAIDEO ASSAM 785693     INDIA ASSAM  ', 'ASSAM', 'INDIA', 'NA', 'shikhadeogharias@gmail.com', 1, 'O+', '2022-11-17', '267813864977', 0, 99, NULL),
(555, 'V06870', 'THUNUJA BASUMATARY', NULL, NULL, 2, '2002-05-01', '6297043959', 'KAISOGURI JHARBARI SERFANGURI GOSAIGAON KOKRAJHAR ASSAM    783346 INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'thunujabasumatary55@gmail.com', 1, 'B+', '2022-11-24', '462160129725', 0, 100, NULL),
(556, 'V06883', 'TENYBIMCHISA SANGMA', NULL, NULL, 2, '2000-12-25', '9383336356', 'H.NO.15,THAPA RANGDENG,NORTH GARO HILLS MEGHALAYA    794108 INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'tenybimchisasangma@gmail.com', 1, 'B+', '2022-11-24', '805628155832', 0, 100, NULL),
(557, 'V06867', 'ESTHER MAGH', NULL, NULL, 11, '1998-04-06', '8730036353', 'KOHIMA VILLAGE L KHEL KOHMA      797003 INDIA NAGALAND ', 'MEGHALAYA', 'INDIA', 'NA', 'easthermagh@gmail.com', 4, 'B+', '2022-11-24', '261476799877', 0, 100, NULL),
(558, 'V07180', 'RISTON FERNANDES', NULL, NULL, 12, '2003-09-01', '9604827066', 'H.NO.267, HOLDEM, SINQUELIM, NAVELIM GOA 403707     INDIA GOA ', 'GOA', 'INDIA', 'NA', 'ristonfdes15@gmail.com', 2, 'O+', '2023-06-13', '257667284179', 0, 130, NULL),
(559, 'V07195', 'SHUBHAM SHASHIKANT SHIVADEKAR', NULL, NULL, 12, '2003-09-11', '8261858560', 'H NO 444 NAWAWADDA COLLEM SOUTH GOA GOA 403410     INDIA GOA ', 'GOA', 'INDIA', 'NA', 'shubhamshivdekar7@gmail.com', 2, 'O-', '2023-06-27', '246851110987', 0, 130, NULL),
(560, 'V07214', 'SABASTIAN D’COSTA', NULL, NULL, 4, '2003-03-13', '9307699042', 'H NO 103, THORLEMOL, KALAY, SANGUEM, SOUTH GOA GOA 403704     INDIA GOA ', 'GOA', 'INDIA', 'NA', 'sabastiandcosta11@gmail.com', 1, 'A+', '2022-08-02', '775738216780', 0, 130, NULL),
(561, 'V06531', 'ANKIT ORAON', NULL, NULL, 4, '1994-02-18', '8767968453', 'SARAIDIH BASIA KONBIR GUMLA  JHARKHAND 835229      INDIA JHARKHAND  ', 'JHARKHAND', 'INDIA', 'NA', 'NA', 1, 'B+', '2023-07-11', '273160930817', 0, 130, NULL),
(562, 'V07270', 'ZOSANGLIANA', NULL, NULL, 4, '2001-12-09', '8147881022', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-06-13', 'NA', 0, 131, NULL),
(563, 'V07192', 'BIBEK SHRESHTA', NULL, NULL, 29, '1999-08-17', '7054913297', 'C/O TIL RAJ SHRESTHA, PORVORIM, SANGOLDA GOA 403511     INDIA GOA ', 'GOA', 'INDIA', 'NA', 'kingbaek25@gmail.com', 2, 'A+', '2023-07-17', '612991845881', 0, 131, NULL),
(564, 'V07284', 'SONU K MANDAL', NULL, NULL, 29, '1999-02-05', '7564018096', 'NA', 'NA', 'INDIA', 'NA', 'NA', 2, 'NA', '2022-07-19', 'NA', 0, 132, NULL),
(565, 'H02844', 'PRAKASH JOSHI', NULL, NULL, 29, '1996-05-25', '9315180156', '169 4TH MAIN KUVEMPU ROAD, B CHANNASANDRA BANGLORE NORTH, KALYANANAGAR, BENGALURU, KARNATAKA 560043     INDIA KARNATAKA ', 'KARNATAKA', 'INDIA', 'NA', 'soliderprakash20@gmail.com', 2, 'B+', '2023-07-31', '607028550230', 0, 132, NULL),
(566, 'V07313', 'PRASHANT KUMAR', NULL, NULL, 4, '2002-03-12', '9473005869', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2022-07-12', 'NA', 0, 132, NULL),
(567, 'D00870', 'JOSHUA LALNUNPUIA', NULL, NULL, 4, '1999-06-11', '9378199762', 'U59/B, SC VANAPA, NEAR RECRATION CENTER, LAIPUITLANG, AIZAWL, RAMHLUN, MIZORAM 796012     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'joshuachhakchhuak8@gmail.com', 1, 'O+', '2022-07-07', '446115318411', 0, 113, NULL),
(568, 'V06485', 'HENRY LUNGTIAWIA', NULL, NULL, 4, '2000-03-30', '8259882881', 'CNB-E-21 SETION -II NEAR GUEST HOUSE,CHALTLANG AIZAWL MIZORAM,Dist:Aizawl,Mizoram,796012      INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'lungtiawia81@gmail.com', 1, 'B+', '2022-07-05', '895737655461', 0, 113, NULL),
(569, 'V06484', 'JOSEPH LALENGKIMA', NULL, NULL, 4, '2004-03-12', '9774152612', 'C-13 A-2 BELOW HIGH SCHOOL CHALTLANG NORTH AIZAWL,MIZORAM,Dist:Aizawl,Mizoram,796001      INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'thejosslife@gmail.com', 1, 'O+', '2022-07-05', '909435870833', 0, 113, NULL),
(570, 'V06874', 'MULUGSA MOCHAHARY', NULL, NULL, 4, '2000-12-07', '8822553385', 'UTTAR GOLBERA, NIZDAFELI, TAMULPUR, BAKSA ASSAM 781367     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'mulugsamochahary@gmail.com', 1, 'B+', '2022-11-24', '983164517952', 0, 113, NULL),
(571, 'V06862', 'KARBUK PEGU', NULL, NULL, 4, '2001-06-22', '6900267339', 'JIADHAL KULAPATHAR, JIADHAL MIRI PATHAAR, DHEMAJI ASSAM 787057    787057 INDIA ASSAM  ', 'ASSAM', 'INDIA', 'NA', 'sidhartpegu@gmail.com', 1, 'A+', '2022-11-24', '425799373883', 0, 113, NULL),
(572, 'V06425', 'ABHIJEET SARKAR', NULL, NULL, 3, '1996-04-29', '7397954479', ' STATION ROAD, MAL JALAPIGURI WEST BENGAL 735221      INDIA WEST BENGAL  ', 'WEST BENGAL', 'INDIA', 'NA', 'SARKARABHIJEET789@GMAIL.COM', 1, 'O+', '2023-04-11', '779180828314', 0, 113, NULL),
(573, 'V03853', 'LALRAMLIANA PC', NULL, NULL, 4, '2003-03-28', '9612128428', 'SIHPHIR VENGHLUN II, AIZWAL , MIZORAM        ', 'MIZORAM', 'INDIA', 'NA', 'NA', 1, 'O', '2021-09-01', '581975602127', 0, 112, NULL),
(574, 'V06878', 'NABAKRISHNA GOGOI', NULL, NULL, 4, '2004-04-07', '6001006101', 'NARAYANPUR DHEMAGARH NO.2 LAKHIMPUR      784165 INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'nabakrishna6001@gmail.com', 1, 'A+', '2022-11-26', '747618504732', 0, 112, NULL),
(575, 'V06869', 'RUBUL DAS', NULL, NULL, 4, '1995-10-10', '7086773011', 'H.NO.14 AHENGRABARI NIZARAPAR PATH HEMRUP METRO     781036 INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'Rubuldas2004@gmail.com', 1, 'B+', '2022-11-23', '880596199356', 0, 112, NULL),
(576, 'V06767', 'MUKESH MISHRA', NULL, NULL, 4, '1999-01-23', '9034856009', 'MAHAVIR PARK GALI N 3, HOUSE NO 468 23, BAHADURGARH, JHAJJAR HARYANA 124507     INDIA HARYANA ', 'HARYANA', 'INDIA', 'NA', 'mm919175@gmail.com', 1, 'O', '2022-10-31', '308367054604', 0, 112, NULL),
(577, 'V06587', 'IGNASIUS STEVE ASUSTIN LALOO', NULL, NULL, 4, '1999-06-15', '7630085757', '65, ASHON LANE, OPP. MODERN SCHOOL, PDENGSHNONG LOWER MAWPREM, SHILLONG MB, EAST KHASI HILLS, LEWDUH, MEGHALAYA 793002     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'austinlaloo020@gmail.com', 1, 'B+', '2022-08-16', '919778371937', 0, 112, NULL),
(578, 'V06900', 'KAILASH SAIN', NULL, NULL, 2, '2001-01-08', '9119370623', 'LOONCHH CHURU  RAJASTHAN     INDIA RAJASTHAN ', 'RAJASTHAN', 'INDIA', 'NA', 'kspecialy11@gmail.com', 1, 'O', '2022-12-15', '681062273557', 0, 112, NULL),
(579, 'V01961', 'GAUTAM SINGH BIST', NULL, NULL, 26, '1993-05-05', '7038281750', 'NA', 'NA', 'INDIA', 'NA', 'NA', 2, 'B+', '2014-05-15', '655029567680', 0, 53, NULL),
(580, 'V01965', 'SANTOSH BAHADUR CHAND', NULL, NULL, 27, '1995-11-11', '7038292854', 'NA', 'NA', 'INDIA', 'NA', 'NA', 2, 'O+', '2022-08-23', '728353981547', 0, 53, NULL),
(581, 'V06632', 'KUMAM MANOJ SINGH', NULL, NULL, 28, '1978-08-25', '9089537054', 'MOIRANG TUREBAN LEIKAI WARD NO 4 BISHNUPUR MOIRANG MANIPUR 795133      INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'tyxingsonyangel@gmail.com', 2, 'AB+', '2013-09-16', '297414227182', 0, 53, NULL),
(582, 'V00455', 'SHASHIKANT N GHADI', NULL, NULL, 29, '2000-02-10', '9552075823', 'NA', 'NA', 'INDIA', 'NA', 'sashigawas25@gmail.com', 2, 'O+', '2018-07-02', '395504029709', 0, 53, NULL),
(583, 'V04404', 'SANDEEP SHANIYAR HARIKANTH', NULL, NULL, 30, '1997-10-10', '9148735169', 'GALIGID SHRISTANKERI, BHATKAL, BAILUR UTTAR KANNADA KARNATAKA   581350   ', 'KARNATAKA', 'INDIA', 'NA', 'NA', 8, 'A+', '2021-01-18', '721735282259', 0, 53, NULL),
(584, 'D00621', 'BHARAT GURKHA', NULL, NULL, 31, '1996-07-09', '7709490546', 'H.NO.41 VALLAB COLONY NEAR MAHADEV MANDIR MAKARPURA, VADODARA    GOA ', 'GOA', 'INDIA', 'NA', 'bs9731765@gmail.com', 8, 'AB+', '2018-06-01', '987818079917', 0, 54, NULL),
(585, 'V04372', 'GAURAV RAWAT', NULL, NULL, 32, '1989-07-29', '7906994707 ', '64/2, PADIYA PATHIYANA, TEHRI GARHWAL UTTARAKHAND   249131   ', 'UTTARAKHAND', 'INDIA', 'NA', 'NA', 8, 'A+', '2019-04-02', '647282589468', 0, 54, NULL),
(586, 'V04681', 'ASHISH MOHAN KELUSKAR', NULL, NULL, 33, '1978-08-29', '9923309638', 'UBHADANDA , NEVABAG VENGURLA SINDHUDURG MAHARASHTRA  416516   ', 'MAHARASHTRA', 'INDIA', 'NA', 'NA', 8, 'O+', '2016-01-16', '885556746725', 0, 54, NULL),
(587, 'D00065', 'YAM BAHADUR KHAMCHA', NULL, NULL, 34, '1998-12-06', '8999628929', 'G.V.S., SATAKHANI WARD NO. 7, SURKHET NEPAL              ', 'SURKHET', 'INDIA', 'NA', 'NA', 8, 'B+', '2022-09-13', '408289460380', 0, 54, NULL),
(588, 'V06664', 'KRISHNA GAWAS', NULL, NULL, 32, '1999-05-10', '9158705627', '100 KOPARDEM SATTARI COMPORDEM VALPOI NORTH GOA GOA 403506     INDIA GOA  ', 'GOA', 'INDIA', 'NA', '8698576121kr@gmail.com', 8, 'O+', '2023-07-11', '501969118703', 0, 54, NULL),
(589, 'V07273', 'ANUJ SINGH', NULL, NULL, 34, '1995-07-26', '9754106621', 'NA', 'NA', 'INDIA', 'NA', 'NA', 8, 'NA', '2019-04-16', 'NA', 0, 55, NULL),
(590, 'V04708', 'PRAVEEN GUNDU KASKER', NULL, NULL, 30, '2003-01-13', '7507085808', 'H NO. 308, KARAPUR TISK, SANQUELIM NORTH GOA, GOA   403505   ', 'GOA', 'INDIA', 'NA', 'praveenkasker26@gmail.com', 8, 'O+', '2022-05-19', '904506093697', 0, 55, NULL),
(591, 'V06346', 'MD FARHAN', NULL, NULL, 35, '1980-07-12', '7428523164', 'WARD 7 VILLAGE - REORHA POST - REHORA DARBANGA BIHAR 847302 INDIA BIHAR ', 'BIHAR', 'INDIA', 'NA', 'asaifkhangtf@gmail.com', 8, 'O-', '2018-04-16', '643154049451', 0, 55, NULL),
(592, 'V04317', 'ALEX PAIS', NULL, NULL, 36, '1988-06-01', '7019258273', '#107, PEDAMALE, SARIPALLA, NEERMARGA, KARNATAKA     575029   ', 'KARNATAKA', 'INDIA', 'NA', 'NA', 8, 'B+', '2012-03-01', '752421764480', 0, 55, NULL),
(593, 'V02886', 'VILAS HARI PATIL', NULL, NULL, 32, '1996-06-29', '9158022803', 'NA', 'NA', 'INDIA', 'NA', 'NA', 8, 'NA', '2022-09-27', '622454475741', 0, 55, NULL),
(594, 'V06695', 'ROHIT MEHTA', NULL, NULL, 31, '1990-01-24', '9456529602', '24 MALLI MERTHI MALLI MIRTHI PITHORAGARH  UTTARAKHAND 262550     INDIA UTTARAKHAND ', 'UTTARAKHAND', 'INDIA', 'NA', 'rohitmehta1008@gmail.com', 8, 'O+', '2017-11-01', '774591339146', 0, 56, NULL),
(595, 'V03936', 'ALAM GIR', NULL, NULL, 34, '1995-04-15', '8208733109', 'S/O MD. HALIM, TOLA-BALAVAPAR, KAWAKOL, NAWADA, BIHAR        ', 'BIHAR', 'INDIA', 'NA', 'NA', 8, 'O+', '2021-01-14', '401123299475', 0, 56, NULL),
(596, 'V05500', 'NAVIN SINGH', NULL, NULL, 21, '2001-02-02', '9021316386', '194, BOKTA BHANDARI GOAN, RAJWAR PITHORAGARH UTTARAKHAND  262552   ', 'UTTARAKHAND', 'INDIA', 'NA', 'navinmangla22@gmail.com', 8, 'B+', '2022-02-22', '624245206207', 0, 56, NULL),
(597, 'V06180', 'JEVIN GLEN LOBO', NULL, NULL, 27, '2000-11-19', '9535535815', '#3-25/1, BADDUR HOUSE, BANTWAL TALUK, MERAMAJALU, DAKSHINA KANNADA, KARNATAKA 574143        ', 'KARNATAKA', 'INDIA', 'NA', 'jevinlobo02@gmail.com', 2, 'O+', '2022-02-22', '678973413079', 0, 56, NULL),
(598, 'V06179', 'JAIDEEP', NULL, NULL, 34, '1997-05-23', '9482398698', '1-132, DARKHAS HOUSE, GUNDYADKA, ATTUR NORTH POST, KARKALA, NITTE, KARNATAKA 576117        ', 'KARNATAKA', 'INDIA', 'NA', 'jaideepgdk@gmail.com', 8, 'O+', '2018-01-16', '870067687651', 0, 56, NULL),
(599, 'V04132', 'LAXMAN SINGH', NULL, NULL, 21, '1999-06-29', '7057686397', 'BHILANG, KANDAR GAON MALLA, GHUTTU , KANDAR GAON, TEHRI GARHWAL GHANSALI, UTTARAKHAND     249155   ', 'UTTARAKHAND', 'INDIA', 'NA', 'NA', 8, 'A+', '2022-07-19', '916819097983', 0, 57, NULL),
(600, 'D00880', 'ANAND KUMAR', NULL, NULL, 32, '1998-11-10', '9740627706', 'PADANUR INDI VIJAYAPURA  KARNATAKA 566211     INDIA KARNATAKA ', 'KARNATAKA', 'INDIA', 'NA', 'NA', 8, 'B+', '2021-03-26', '697271460198', 0, 57, NULL);
INSERT INTO `employee` (`emp_id`, `emp_code`, `fname`, `mname`, `lname`, `designation`, `dob`, `contact`, `address`, `state`, `country`, `pincode`, `email`, `department`, `blood_group`, `joining_date`, `aadhaar_number`, `salary`, `room_id`, `role`) VALUES
(601, 'V05721', 'PRATHAMESH VISHNU DALVI', NULL, NULL, 31, '1991-07-01', '72620805599', '826, BHOJ DALVIWADI HODAWADA SINDHUDURG MAHARASHTRA   416529   ', 'MAHARASHTRA', 'INDIA', 'NA', 'prathameshd10111998@gmail.com', 8, 'B+', '2020-12-22', '205768240658', 0, 57, NULL),
(602, 'D00607', 'MANOJ RAM', NULL, NULL, 21, '1999-12-09', '9718635891 ', 'H NO. 129, GALI NO 7 SARPANCH KA BARA, NEAR LAKHI PUBLIC SCHOOL MANDAWALI, FAZALPUR EAST DELHI, DELHI 110092   INDIA DELHI ', 'DELHI', 'INDIA', 'NA', 'manojsweety93@gmail.com', 8, 'O+', '2023-01-31', '542483297784', 0, 57, NULL),
(603, 'V07029', 'MANOSH CASTELINO', NULL, NULL, 27, '1994-12-19', '8660263159', '#12-108/13 ANUGRAHA CASTELINO COLONY PADAVU MANGLORE MANGLORE     INDIA MANGLORE ', 'KARNATAKA', 'INDIA', 'NA', 'manoshcastelino@gmail.com', 2, 'B+', '2022-04-05', '444446689369', 0, 57, NULL),
(604, 'D00818', 'BISHAL PAL', NULL, NULL, 29, '1998-04-22', '8436671482', 'HATIBAJAN, JIANJ VTC JIAGANJ PO DEBIPUR DIST MURSHIDABAD  742123 INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'bishalpal920@gmail.com', 2, 'B+', '2020-11-20', '261876213871', 0, 58, NULL),
(605, 'D00586', 'SHIVAM MISHRA', NULL, NULL, 26, '1988-07-20', '6306830288', 'SONAI, AUTA ALLAHABAD MEJA, UTTAR PRADESH   212303   ', 'UTTAR PRADESH', 'INDIA', 'NA', 'NA', 2, 'O+', '2016-08-16', '952139751923', 0, 58, NULL),
(606, 'V03246', 'PARDEEP KUMAR', NULL, NULL, 37, '1995-01-22', '9158688136', 'VPO - SER, TENSIL - JHANDUTTA, DIST - BILASPUR      INDIA HIMACHAL PRADESH ', 'HIMACHAL PRADESH', 'INDIA', 'NA', 'NA', 2, 'B+', '2021-01-05', '843420118432', 0, 58, NULL),
(607, 'D00612', 'AKSHAY KUMAR SINGH', NULL, NULL, 27, '1996-10-11', '6001454673', 'SITAPAR, PATILAR WEST CHAMPARAN BIHAR   845101   ', 'BIHAR', 'INDIA', 'NA', 'aki22singh@gmail.com', 2, 'A+', '2022-04-07', '308339205231', 0, 58, NULL),
(608, 'D00821', 'SOHAN SAHA', NULL, NULL, 29, '1997-06-07', '7602745204', 'VELLADANGA SAMBHU NAGAR COLONY PO + PS-JIAGANJ DIST - MURSHIDABAD WEST BENGAL  742123 INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'sohansaha80@gmail.com', 2, '0', '2018-03-01', '213698569564', 0, 59, NULL),
(609, 'V04234', 'DEENANATH KUMAR', NULL, NULL, 29, '1996-06-20', '9284103631', 'H.NO. 16, BIHIYA, GRAM BIHIYA THANA HUNTERGANJ, BIHIYA SARCHACHIA, CHATRA, JHARKHAND     825403   ', 'JHARKHAND', 'INDIA', 'NA', 'deenanathazd0@gmail.com', 2, 'O+', '2018-03-01', '553626259151', 0, 59, NULL),
(610, 'V04226', 'DIBYA RANJAN NAYAK', NULL, NULL, 29, '1994-02-11', '9284828279', 'KATARA, MARDOL, JAGATSINGHPUR, ODISHA     754106   ', 'ODISHA', 'INDIA', 'NA', 'dibyananjannayak23@gmail.com', 2, 'B+', '2017-12-01', '538457603731', 0, 59, NULL),
(611, 'V04028', 'PRABIR MANDAL', NULL, NULL, 27, '1988-04-27', '7076499159', 'RATANPUR , NADIA, KISHOREPUR NADIA, WEST BENGAL        ', 'WEST BENGAL', 'INDIA', 'NA', 'NA', 2, 'B+', '2018-11-16', '931826221463', 0, 59, NULL),
(612, 'V04571', 'ANUGRAH DANG', NULL, NULL, 27, '2001-05-13', '9561157881', 'KAHUPANI BAGETOLI JAMPANI , SIMDEGA JHARKHAND   835226   ', 'JHARKHAND', 'INDIA', 'NA', 'NA', 2, 'B+', '2022-11-22', '261796182986', 0, 59, NULL),
(613, 'V06815', 'TOPON DHARDUMIA', NULL, NULL, 12, '1998-11-25', '6901922057', 'KAWAIMARI GAON, DIBRUGARH ASSAM 786621    786621 INDIA ASSAM  ', 'ASSAM', 'INDIA', 'NA', 'dhadumiatapan@gmail.com', 2, 'B+', '2023-05-30', '425067620488', 0, 60, NULL),
(614, 'V07170', 'BHRAMHARSHI ADURKAR', NULL, NULL, 27, '1998-06-08', '9082890646', 'BHATI, VELANESHWAR, RATNAGIRI MAHARASHTRA    415729 INDIA MAHARASHTRA ', 'MAHARASHTRA', 'INDIA', 'NA', 'bhramharshiadurkar121@gmail.com', 2, 'A+', '2022-11-29', '654510115631', 0, 60, NULL),
(615, 'V06855', 'MD ZABBAR HUSAIN', NULL, NULL, 27, '2001-05-15', '8766874641', 'NURI CHANDAULI NOORI     232106 INDIA UTTAR PRADESH ', 'UTTAR PRADESH', 'INDIA', 'NA', 'NA', 2, 'O+', '2022-11-29', '504299880722', 0, 60, NULL),
(616, 'V06881', 'DARSHAN JNANESHWAR ARYA', NULL, NULL, 27, '2002-09-11', '7619672798', '#25, AZADNAGAR HALIYAL DANDELI  KARNATAKA 581325    581325 UTTAR KANNADA KARNATAKA ', 'KARNATAKA', 'INDIA', 'NA', 'aryadarshu04@gmail.com', 2, 'AB+', '2022-11-15', '385623854979', 0, 60, NULL),
(617, 'V06790', 'KULDIP HANDIQUE', NULL, NULL, 27, '2000-11-18', '9365825654', 'NO 1 KONWAR GAON, DUWARA GAON, SIBSAGAR ASSAM 785674     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'kuldiphandique7896@gmail.com', 2, 'A+', '2022-11-15', '286010598035', 0, 61, NULL),
(618, 'V06789', 'MANASH KONWAR', NULL, NULL, 63, 'NA', '8135863247', '1 NO KONWAR GAON, MOUT GAON, SIBSAGAR ASSAM 785686     INDIA ASSAM  ', 'ASSAM', 'INDIA', 'NA', 'manashprotimkonwar17@gmail.com', 19, 'A+', 'NA', '508215155894', 0, 61, NULL),
(619, 'V06794 ', 'RWNGWSHAR SWARGIARY', NULL, NULL, 27, '2002-11-23', '7002599419', 'NA', 'NA', 'INDIA', 'NA', 'NA', 2, 'NA', '2022-11-15', 'NA', 0, 61, NULL),
(620, 'V06787', 'TANJIRUL ISLAM', NULL, NULL, 27, '1997-11-18', '7002599419', 'HARIPUR KARAIKHOWA, KHARMUZA, GOALPARA ASSAM 783101     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'tanjiruli226@gmail.com', 2, 'AB+', '2022-12-07', '752810622834', 0, 61, NULL),
(621, 'V06910', 'RAJIB BHUMIJ', NULL, NULL, 27, '1997-12-12', '8486131088', 'DIKOM DIBRUGARH DIKOM       INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'rajibbhumij187@gmail.com', 2, '0', '2022-10-03', '535001392316', 0, 61, NULL),
(622, 'V06705', 'BHAICHUNG LEPCHA', NULL, NULL, 27, '2000-12-04', '8509240265', 'LINGDEM PW LINGTHEM LINGDEM GPU LINGDEM NORTH SIKKIM SIKKIM 737116     INDIA SIKKIM ', 'SIKKIM', 'INDIA', 'NA', 'lepchabhaichung730@gmail.com', 2, 'B+', '2022-10-03', '990704007927', 0, 62, NULL),
(623, 'V06706', 'BISHU HANG SUBBA', NULL, NULL, 27, '1998-10-06', '8327629008', 'UPPER M G MARG MW BELOW ICICI BANK NEW MARKET GANGTOK MUNICIPAL CORPORATION GANGTOK PVT ESTATE EAST SIKKIM SIKKIM 737101     INDIA SIKKIM ', 'SIKKIM', 'INDIA', 'NA', 'bishuhang123@gmail.com', 2, 'O+', '2023-06-13', '916400920384', 0, 62, NULL),
(624, 'D01026', 'RYAN QUADRAS', NULL, NULL, 27, '2000-12-16', '8433831596', '404, OM NAV JEEVAN SOCIETY, DATAR COLONY, ASHOK NAGAR, BHANDUP EAST, MUMBAI MAHARASHTRA 400042     INDIA MAHARASHTRA ', 'MAHARASHTRA', 'INDIA', 'NA', 'ryanquadras1998@gmail.com', 2, 'O+', '2022-11-29', '373589754258', 0, 62, NULL),
(625, 'V06879', 'CHRISTOPHER MOMIN', NULL, NULL, 27, '2002-07-15', '8787629301', '41 KARONGGRE WEST GARO HILLS  MEGHALAYA 794103    794103 INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'christophermomin905@gmail.com', 2, 'B+', '2022-10-18', '269187706971', 0, 62, NULL),
(626, 'V06741', 'PYNTNGENLANG KHYLLAIT', NULL, NULL, 27, '2001-01-27', '6033091535', 'LUMSHYIAP, PYTHORMUKHRAH, EAST KHASI HILLS, SHILLONG GPO, MEGHALAYA 793001     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'pyntngenkhyllait786@gmail.com', 2, 'O+', '2022-09-27', '830315360308', 0, 62, NULL),
(627, 'V06676', 'JOYSON MICHAEL FERNANDES', NULL, NULL, 27, '2001-06-04', '9359379650', '1460 INSULI BILEWADI SAWANTWADI SINDHUDURG  MAHARASHTRA 416510     INDIA MAHARASHTRA ', 'MAHARASHTRA', 'INDIA', 'NA', 'fernandesjoyson27@gmail.com', 2, 'A+', '2022-12-14', '762824259320', 0, 63, NULL),
(628, 'V06917', 'LOHIT RATHOD', NULL, NULL, 27, '2000-09-18', '7620040178', 'JALASHANKAMAGAR ADVISOMAPUR GADAG KARNATAKA 582103     INDIA KARNATAKA ', 'KARNATAKA', 'INDIA', 'NA', 'NA', 2, 'B+', '2022-08-02', '629844949956', 0, 63, NULL),
(629, 'V06530', 'SHANKAR KANDALKAR', NULL, NULL, 27, '1998-08-19', '9923736424', 'BAJARPETH KASAL SINDHURURG  MAHARASHTRA 416603     INDIA MAHARASHTRA ', 'MAHARASHTRA', 'INDIA', 'NA', 'aadeshkandalkar8341@gmail.com', 2, 'A+', '2022-09-06', '627350820084', 0, 63, NULL),
(630, 'V06652', 'RAPHAEL NONGKHLAW', NULL, NULL, 27, '2001-08-01', '9077206384', '140 NEAR BASIC SCHOOL LUMIABLOT NONGTHYMMAI,SHILLONG, EAST KHASI HILLS, MEGHALAYA 793014     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'rraphaelnongkhlaw@gmail.com', 2, 'AB+', '2023-04-11', '282565328740', 0, 63, NULL),
(631, 'V07092', 'JEEVAN FERNANDES', NULL, NULL, 29, '1997-02-02', '9740765435', '# 3-47 B 1 KETHIKAL THIRUVALI VAMANJOOR DAKSHINA KANNADA KARNATAKA 575028     INDIA KARNATAKA ', 'KARNATAKA', 'INDIA', 'NA', 'jeevandeston716@gmail.com', 2, 'A+', '2023-07-03', '626276141648', 0, 63, NULL),
(632, 'V07229', 'PRAKASH KUMAR', NULL, NULL, 29, '2002-12-25', '9875431075', '13/14 HASTINGS JUTE MILL SECURITY QTR RISHRA WEST BENGAL 712248     INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'prakashsingh020297@gmail.com', 2, 'O+', '2023-07-03', '970987658783', 0, 64, NULL),
(633, 'H03167', 'RISHI RAJ', NULL, NULL, 29, '2001-02-24', '8789436233', 'CHINTAMANICHAK, THANA MOKAMA, WARD NO 21, MOKAMEH, PATNA BIHAR 803302     INDIA BIHAR ', 'BIHAR', 'INDIA', 'NA', 'rajrishi1225@gmail.com', 2, 'B+', '2023-07-03', '626395985917', 0, 64, NULL),
(634, 'H03169', 'SACHIN KUMAR', NULL, NULL, 29, '2001-03-10', '7278288976', '5/D GHOLESHAPUR RAILWAY COLONY BEHALA S.O KOLKATA WEST BENGAL 700034     INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'mesachin537@gmail.com', 2, 'AB-', '2023-07-03', '821467132619', 0, 64, NULL),
(635, 'H03170', 'SHUBHAM KUMAR', NULL, NULL, 29, '2002-06-02', '7643024139', 'PAHARPUR, KARHATIA BUZURG, VAISHALI BIHAR 844122     INDIA BIHAR ', 'BIHAR', 'INDIA', 'NA', 'rajputsshubham2001@gmail.com', 2, 'B+', '2023-07-03', '410688763465', 0, 64, NULL),
(636, 'V07227', 'ABHISHEK KUMAR', NULL, NULL, 4, '1997-08-22', '7781920879', 'WARD 6, VILL, POST BHANASAPATTI, RAMPUR SAIDPUR RUNI, SITAMARHI BIHAR 843328     INDIA BIHAR ', 'BIHAR', 'INDIA', 'NA', 'singhabhishekk949@gmail.com', 1, 'O+', '2021-01-26', '344155283587', 0, 64, NULL),
(637, 'H00993', 'KS PHILATHING', NULL, NULL, 4, '1997-10-12', '7264905574', 'RAMVA, UKHRUL      INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'NA', 1, 'O+', '2022-08-02', '202060253665', 0, 49, NULL),
(638, 'H02852', 'THANGAMLA A TAMANG', NULL, NULL, 3, '1997-01-12', '7637636093', 'CHAMU VILLAGE KAMJONG CHASSAD UKHRUL MANIPUR      INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'thanthantamang12@gmail.com', 1, 'A+', '2017-07-01', '822850646507', 0, 49, NULL),
(639, 'H01360', 'M KONGYAOTHEI', NULL, NULL, 1, '1999-12-26', '9561318060', 'NGAINGA VILLAGE, NGAIMU UKHRUL,       INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'NA', 1, 'O+', '2018-12-12', '573631045132', 0, 49, NULL),
(640, 'D00319', 'RUTHI LALREMSANGI', NULL, NULL, 4, '1995-02-22', '8638484045', 'A 112 , NEUVA SECTION NEAR THEIHAI TUIKHUR RAMTHAR , EDENTHAR AIZAWL - MIZORAM  796007   ', 'MIZORAM', 'INDIA', 'NA', 'NA', 1, 'A+', '2022-10-22', '321416760989', 0, 49, NULL),
(641, 'D00923', 'MELODY MALSAWMTLUANGI', NULL, NULL, 4, '2000-12-20', '7263822605', 'HUNTHAR COMPANY PENG, HUNTHAR, AIZAWL MIZORAM 796009     INDIA MIZORAM  ', 'MIZORAM', 'INDIA', 'NA', 'melodymalsawmtluangi@gmail.com', 1, 'B+', '2021-11-16', '257456140072', 0, 49, NULL),
(642, 'H02628', 'MEREBENI HUMTSOE', NULL, NULL, 4, '1997-12-07', '9077391671', 'THIZAMA, 4TH NAP BATT THIZA, KOHIMA, NAGALAND       ', 'NAGALAND', 'INDIA', 'NA', 'humtsoemerebeni@gmail.com', 1, 'A+', '2022-09-06', '929725722447', 0, 49, NULL),
(643, 'H02895', 'RUOKUOVINUO MEMEI', NULL, NULL, 2, '1996-02-23', '7630003142', 'NAGA HOSPITAL COLONY, KOHIMA SADAR, KOHIMA, NAGALAND 797001       ', 'NAGALAND', 'INDIA', 'NA', 'hana3000.keditsu@gmail.com', 1, 'O+', '2023-04-18', '242144093092', 0, 49, NULL),
(644, 'H03117', 'RANREILA RAINGAM', NULL, NULL, 2, '1996-11-13', '8132824792', 'RAINGAM, PHADANG, UKHRUL, SOMDAL MANIPUR 795144     INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'rainamranrei@gmail.com', 1, 'O+', '2023-04-18', '746629412795', 0, 50, NULL),
(645, 'H03118', 'MAYORI RAINAM', NULL, NULL, 2, '2002-04-26', '6009244212', 'PHADANG VILLAGE, UKHRUL MANIPUR 7951444     INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'mayorirainam123@gmail.com', 1, 'O+', '2023-04-22', '659180783306', 0, 50, NULL),
(646, 'H03124', 'SOYA SAYAI', NULL, NULL, 3, '1994-04-01', '7085798663', 'RAMVA LAMBUI VILLAGE, UKHRUL MANIPUR 795145     INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'sayaisoya@gmail.com', 1, 'O+', '2019-04-06', '310953038312', 0, 50, NULL),
(647, 'H01798', 'L A KHAYAILA', NULL, NULL, 4, '2000-11-09', '7391919787', 'SEIKHOR VILLAGE UKHRUL, MANIPUR    795142   ', 'MANIPUR', 'INDIA', 'NA', 'NA', 1, 'A+', '2022-12-14', '626112851956', 0, 50, NULL),
(648, 'H03022', 'ALICIA THUER', NULL, NULL, 2, '1995-12-12', '8794283103', 'H NO 009, MOLLEN PHEK NAGALAND 797114    797114 INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'aliciathueralice@gmail.com', 1, 'O+', '2023-04-06', '808579354137', 0, 50, NULL),
(649, 'H03105', 'BENDANGINLA', NULL, NULL, 2, '1996-07-02', '7085467171', 'H NO 511, NH 02, NEAR POST OFFICE, ARJUKONG WARD, TSUDIKONG (13TH MILE TULI PAPER MILL), MOKOKCHUNG, PAPER NAGAR NAGALAND 798623     INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'aienjanger@gmail.com', 1, 'O+', '2023-04-06', '814364245723', 0, 50, NULL),
(650, 'H03104', 'O SURATSALA', NULL, NULL, 4, '2001-05-04', '8798319302', 'H NO 307, DUNCAN BOSTI, NEAR FUN BOWLING, DIMAPUR SADAR, DIMAPUR NAGALAND 797112     INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'asujings8@gmail.com', 1, 'B+', '2022-12-14', '941122029449', 0, 50, NULL),
(651, 'H03024', 'MARLEMLA JAMIR', NULL, NULL, 63, 'NA', '6009946312', 'P O DIMAPUR, WARD 3, DIMAPUR MC, DIMAPUR  NAGALAND 797112     INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'alemlemjamir@gmail.com', 19, 'B+', 'NA', '767481699462', 0, 50, NULL),
(652, 'GP-659', 'SHELIKA SUMI', NULL, NULL, 1, '2000-05-30', '7005103635', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2018-11-01', 'NA', 0, 51, NULL),
(653, 'D00306', 'ESTHER LALBEISEII', NULL, NULL, 1, '1995-11-05', '7499726205', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'O+', '2019-02-11', '372283149970', 0, 51, NULL),
(654, 'H01769', 'JENET LALLAWMAWMI', NULL, NULL, 4, '1999-02-11', '9531969302', 'FB-22, FALKLAND ZEMABAWK, AIZWAL MIZORAM   796017   ', 'MIZORAM', 'INDIA', 'NA', 'NA', 1, 'A+', '2021-02-04', '494994883493', 0, 51, NULL),
(655, 'D00650', 'KIKRUKHRIENUO METHA', NULL, NULL, 1, '2001-08-06', '8729812050', 'P. O. CHUMUKIDIMA  SOVIMA VILLAGE  DIMAPUR  NAGALAND  797103   ', 'NAGALAND', 'INDIA', 'NA', 'akhrienuometha1212@gmail.com', 1, 'A+', '2023-01-18', '527397501916', 0, 51, NULL),
(656, 'H03047', 'EVANGELYNE LALCHHANCHHUAHI', NULL, NULL, 4, '1998-04-30', '9077321768', 'L V C 49, NEAR PRESBYTERIAN CHURCH, LEITAN RAMTHAR, DURTIANG, AIZWAL MIZORAM 796014     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'evangelynezote2001@gmail.com', 1, 'O+', '2022-09-06', '537362222171', 0, 51, NULL),
(657, 'H02890', 'EMILDA LALMUANPUII', NULL, NULL, 4, '1999-09-28', '8794575894', '140, DAM VENG, T SECTION, TLANGNUAM, AIZAWL, MIZORAM 796015     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'emildaralte7@gmail.com', 1, 'A+', '2022-08-23', '768340323853', 0, 51, NULL),
(658, 'H02872', 'MARIA LALAWMPUII', NULL, NULL, 4, '1999-07-16', '8787534326', 'NEAR SOCIETY NO-1 HORTOKI KOLASIB MIZORAM 796070      INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'rokhummaria@gmail.com', 1, 'B+', '2022-08-23', '255261282462', 0, 51, NULL),
(659, 'H02873', 'C ZONUNPUII', NULL, NULL, 4, '2000-06-06', '6009725629', 'DAM VENG, KHUANGCHERA SECTION SIHPHIR, AIZAWL MIZORAM 796036    INDIA MIZORAM  ', 'MIZORAM', 'INDIA', 'NA', 'zoinuni866@gmail.com', 1, 'A+', '2022-07-19', '658110586271', 0, 51, NULL),
(660, 'H02843', 'CHAWNGHMINGTHANGI', NULL, NULL, 63, 'NA', '7630011212', 'T-199 , T - SECTION,MVI OFFICE , EDENTHAR, Mizoram      INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'cmami9144@gmail.com', 19, 'B+', 'NA', '250421834989', 0, 51, NULL),
(661, 'GP-981', 'ASMA SHAIKH', NULL, NULL, 13, '1998-01-27', '9373096131', 'NA', 'NA', 'INDIA', 'NA', 'NA', 4, 'NA', '2022-12-14', 'NA', 0, 52, NULL),
(662, 'H03028', 'NGAPBAN KONYAK', NULL, NULL, 4, '1999-03-03', '8974229769', 'H NO 18, GONJONG COLONY, PO MON, LONGSHEN TOWN, MON NAGALAND 798621     INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'ngapbanwangsu27@gmail.com', 1, 'O+', '2022-12-14', '688485874656', 0, 52, NULL),
(663, 'H03021', 'MHONBENI EZUNG', NULL, NULL, 2, '2004-03-23', '9863255421', 'NEW RESERVE PHESAMA, KOHIMA SADAR, KOHIMA NAGALAND 797001     INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'kikzezmhonbeni@gmail.com', 1, 'B+', '2022-12-14', '559895988450', 0, 52, NULL),
(664, 'H03026', 'ROSELA SANGTAM', NULL, NULL, 4, '2003-05-28', '7085376853', '307, NEAR FUN BOWLING, DUNCAN BOSTI, DIMAPUR SADAR, DIMAPUR NAGALAND 797112     INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'roselastm2004@gmail.com', 1, 'O-', '2022-12-14', '482951878006', 0, 52, NULL),
(665, 'H03023', 'SUIYIPEULE', NULL, NULL, 1, '1997-07-10', '8131927685', 'P O PEREN, OLD PEREN, KOHIMA NAGALAND 797101     INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'suiyipeulezeliang@gmail.com', 1, 'B+', '2019-02-13', '774043294924', 0, 52, NULL),
(666, 'H01773', 'H ZOTHANSANGI', NULL, NULL, 26, '1989-11-09', '9077249731', 'P/E VENG, NEAR LFCS SERCHHIP, MIZORAM    796181   ', 'MIZORAM', 'INDIA', 'NA', 'NA', 2, 'A+', '2014-05-15', '998645797237', 0, 52, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_dept`
--

CREATE TABLE `employee_dept` (
  `dept_id` int(11) NOT NULL,
  `dept_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_dept`
--

INSERT INTO `employee_dept` (`dept_id`, `dept_name`) VALUES
(1, 'CASINO GAMING'),
(2, 'FOOD & BEVERAGE SERVICE'),
(3, 'FRONT OFFICE'),
(4, 'CASH DESK'),
(5, 'DELTIN SELECT'),
(6, 'CUSTOMER EXPERIENCE AND SERVICE'),
(7, 'VIP SERVICES'),
(8, 'FOOD & BEVERAGE PRODUCTION'),
(9, 'ADMINISTRATION'),
(10, 'SPA'),
(11, 'KST'),
(12, 'ENGINEERING'),
(13, 'TRANSPORT'),
(14, 'IT'),
(15, 'HOUSEKEEPING'),
(16, 'SECURITY'),
(17, 'BUSINESS DEVELOPMENT'),
(18, 'IT - ADMINS'),
(19, 'NA');

-- --------------------------------------------------------

--
-- Table structure for table `employee_designation`
--

CREATE TABLE `employee_designation` (
  `id` int(11) NOT NULL,
  `designation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_designation`
--

INSERT INTO `employee_designation` (`id`, `designation`) VALUES
(1, 'SENIOR DEALER'),
(2, 'TRAINEE DEALER'),
(3, 'DEALER INSPECTOR'),
(4, 'DEALER'),
(5, 'STEWARDESS'),
(6, 'FRONT OFFICE ASSOCIATE'),
(7, 'TRAINEE FRONT OFFICE ASSOCIATE'),
(8, 'INSPECTOR'),
(9, 'SENIOR STEWARDESS'),
(10, 'SENIOR INSPECTOR'),
(11, 'CASHIER'),
(12, 'OJT'),
(13, 'TRAINEE CASHIER'),
(14, 'TRAINEE CAPTAIN'),
(15, 'SENIOR DELTIN SELECT ASSOCIATE'),
(16, 'TRAINEE WE CARE'),
(17, 'TRAINEE'),
(18, 'CASHIER SUPERVISOR'),
(19, 'SENIOR CASHIER'),
(20, 'TRAINEE CONCEIRGE'),
(21, 'COMMI III'),
(22, 'ADMINISTRATION EXECUTIVE'),
(23, 'SENIOR ADMINISTRATION EXECUTIVE'),
(24, 'SPA EXECUTIVE'),
(25, 'VIP SERVICES ASSOCIATE'),
(26, 'CAPTAIN'),
(27, 'STEWARD'),
(28, 'SENIOR CAPTAIN'),
(29, 'SENIOR STEWARD'),
(30, 'COMMI I'),
(31, 'CDP'),
(32, 'COMMI II'),
(33, 'SENIOR CDP'),
(34, 'DCDP'),
(35, 'SENIOR KST SUPERVISOR'),
(36, 'KST EXECUTIVE'),
(37, 'SENIOR BARTENDER'),
(38, 'TRAINEE VIP ASSOCIATE'),
(39, 'BARTENDER'),
(40, 'SENIOR SOUS CHEF'),
(41, 'KST SUPERVISOR'),
(42, 'PIT MANAGER'),
(43, 'ASSISTANT PIT MANAGER'),
(44, 'ENGINEERING ASSOCIATE'),
(45, 'ENGINEERING ASSOCIATE - ELECTRICAL'),
(46, 'JUNIOR SOUS CHEF'),
(47, 'TRAINEE KST SUPERVISOR'),
(48, 'DRIVER'),
(49, 'KITCHEN STEWARDING SUPERVISOR'),
(50, 'KITCHEN STEWARD'),
(51, 'ENGINEERING ASSOCIATE ELECTRICAL'),
(52, 'JUNIOR IT EXECUTIVE'),
(53, 'SENIOR FRONT OFFICE ASSOCIATE'),
(54, 'SENIOR ASSOCIATE WE CARE'),
(55, 'HOUSEKEEPING ATTENDANT'),
(56, 'FLOOR SUPERVISOR'),
(57, 'SENIOR SECURITY SUPERVISOR'),
(58, 'SENIOR FLOOR SUPERVISOR'),
(59, 'BUSINESS DEVELOPMENT ASSOCIATE'),
(60, 'SENIOR HOUSEKEEPING ATTENDANT'),
(61, 'TRAINEE SLOT TECHNICIAN'),
(62, 'SUPERADMIN'),
(63, 'NA');

-- --------------------------------------------------------

--
-- Table structure for table `employee_outing`
--

CREATE TABLE `employee_outing` (
  `emp_code` varchar(10) DEFAULT NULL,
  `approval` enum('Yes','No') DEFAULT NULL,
  `outing_date` date NOT NULL,
  `arrival_date` date DEFAULT NULL,
  `category` varchar(225) NOT NULL,
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
  `description` text DEFAULT NULL,
  `tentative_date` date DEFAULT NULL,
  `completion_date` date DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `warden_emp_code` varchar(10) DEFAULT NULL
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_credentials`
--

INSERT INTO `login_credentials` (`emp_id`, `pass`) VALUES
(1, '5f4dcc3b5aa765d61d8327deb882cf99');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_history`
--

INSERT INTO `login_history` (`emp_id`, `user`, `login_time`, `logout_time`, `id`) VALUES
(2, 'VADIRAJ INAMDAR', '2023-08-08 11:16:24', '2023-08-08 11:54:03', 1),
(1, 'Vadiraj Inamdar', '2023-08-08 11:54:14', '2023-08-09 03:42:40', 2),
(1, 'Vadiraj Inamdar', '2023-08-09 15:05:40', '2023-08-09 15:05:40', 3),
(1, 'Vadiraj Inamdar', '2023-08-10 04:45:48', '2023-08-10 07:11:32', 4),
(1, '', '2023-08-10 18:41:17', '2023-08-10 18:41:17', 5),
(1, '', '2023-08-11 03:22:39', '2023-08-11 03:22:39', 6),
(1, '', '2023-08-11 03:56:01', '2023-08-11 04:20:27', 7),
(1, '', '2023-08-11 04:20:39', '2023-08-11 04:20:53', 8),
(1, '', '2023-08-11 04:21:00', '2023-08-11 04:21:05', 9),
(1, '', '2023-08-11 04:22:51', '2023-08-11 04:22:51', 10),
(1, 'Vadiraj Gururaj Inamdar', '2023-08-12 16:54:10', '2023-08-12 16:54:10', 11),
(1, 'Vadiraj Gururaj Inamdar', '2023-08-12 17:06:36', '2023-08-12 17:06:42', 12),
(1, 'Vadiraj Gururaj Inamdar', '2023-08-14 05:52:37', '2023-08-14 05:52:37', 13),
(1, 'Vadiraj Gururaj Inamdar', '2023-08-14 06:34:54', '2023-08-14 06:34:54', 14),
(1, 'Vadiraj Gururaj Inamdar', '2023-08-14 08:38:36', '2023-08-14 08:38:36', 15);

-- --------------------------------------------------------

--
-- Table structure for table `outing_type`
--

CREATE TABLE `outing_type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rights`
--

INSERT INTO `rights` (`id`, `accomodation`, `complaints`, `employee_details`, `employee_outing`, `roles`, `rooms`, `tankers`, `jobs`, `vaccination`, `vaccination_category`, `visitor_log`) VALUES
(5, '7', '7', '7', '7', '7', '7', '7', '7', '7', '7', '7');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(20) NOT NULL,
  `rights` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`, `rights`) VALUES
(5, 'SUPER ADMIN', 5);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `acc_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `room_no` varchar(20) NOT NULL,
  `room_capacity` int(11) NOT NULL,
  `status` varchar(10) DEFAULT 'ACTIVE',
  `current_room_occupancy` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`acc_id`, `id`, `room_no`, `room_capacity`, `status`, `current_room_occupancy`) VALUES
(1, 1, 'AF1', 6, 'ACTIVE', 4),
(1, 2, 'AF2', 6, 'ACTIVE', 6),
(1, 3, 'AG1', 6, 'ACTIVE', 5),
(1, 4, 'AG2', 6, 'ACTIVE', 6),
(1, 5, 'AS1', 6, 'ACTIVE', 5),
(1, 6, 'AS2', 6, 'ACTIVE', 0),
(1, 7, 'BF1', 6, 'ACTIVE', 5),
(1, 8, 'BF2', 6, 'ACTIVE', 6),
(1, 9, 'BG1', 6, 'ACTIVE', 6),
(1, 10, 'BG2', 6, 'ACTIVE', 4),
(1, 11, 'BS1', 6, 'ACTIVE', 5),
(1, 12, 'BS2', 6, 'ACTIVE', 5),
(1, 13, 'CF1', 6, 'ACTIVE', 6),
(1, 14, 'CF2', 6, 'ACTIVE', 6),
(1, 15, 'CG1', 6, 'ACTIVE', 5),
(1, 16, 'CG2', 6, 'ACTIVE', 6),
(1, 17, 'CS1', 5, 'ACTIVE', 5),
(1, 18, 'CS2', 6, 'ACTIVE', 6),
(1, 19, 'DG1', 6, 'ACTIVE', 4),
(1, 20, 'DG2', 6, 'ACTIVE', 5),
(1, 21, 'DF1', 4, 'ACTIVE', 4),
(1, 22, 'DF2', 5, 'ACTIVE', 5),
(1, 23, 'DS1', 6, 'ACTIVE', 4),
(1, 24, 'DS2', 6, 'ACTIVE', 4),
(1, 25, 'EF1', 6, 'ACTIVE', 6),
(1, 26, 'EF2', 6, 'ACTIVE', 6),
(1, 27, 'EG1', 6, 'ACTIVE', 4),
(1, 28, 'EG2', 6, 'ACTIVE', 6),
(1, 29, 'ES1', 3, 'ACTIVE', 3),
(1, 30, 'ES2', 6, 'ACTIVE', 6),
(1, 31, 'FF1', 6, 'ACTIVE', 6),
(1, 32, 'FF2', 3, 'ACTIVE', 3),
(1, 33, 'FG1', 6, 'ACTIVE', 6),
(1, 34, 'FG2', 2, 'ACTIVE', 2),
(1, 35, 'FS1', 6, 'ACTIVE', 6),
(1, 36, 'FS2', 3, 'ACTIVE', 3),
(1, 37, 'GF1', 6, 'ACTIVE', 6),
(1, 38, 'GF2', 6, 'ACTIVE', 6),
(1, 39, 'GG1', 6, 'ACTIVE', 6),
(1, 40, 'GG2', 5, 'ACTIVE', 5),
(1, 41, 'GS1', 6, 'ACTIVE', 6),
(1, 42, 'GS2', 6, 'ACTIVE', 6),
(1, 43, 'HS1', 2, 'ACTIVE', 2),
(1, 44, 'HS2', 4, 'ACTIVE', 4),
(1, 45, 'HF1', 6, 'ACTIVE', 6),
(1, 46, 'HF2', 6, 'ACTIVE', 6),
(1, 47, 'HG1', 6, 'ACTIVE', 6),
(1, 48, 'HG2', 6, 'ACTIVE', 6),
(2, 49, 'F1', 14, 'ACTIVE', 7),
(2, 50, 'F2', 14, 'ACTIVE', 8),
(2, 51, 'G1', 14, 'ACTIVE', 9),
(2, 52, 'G2', 14, 'ACTIVE', 6),
(3, 53, '21', 5, 'ACTIVE', 5),
(3, 54, '22', 5, 'ACTIVE', 5),
(3, 55, '23', 5, 'ACTIVE', 5),
(3, 56, '31', 5, 'ACTIVE', 5),
(3, 57, '34', 5, 'ACTIVE', 5),
(3, 58, '41', 5, 'ACTIVE', 4),
(3, 59, '42', 5, 'ACTIVE', 5),
(3, 60, '51', 5, 'ACTIVE', 4),
(3, 61, '52', 5, 'ACTIVE', 5),
(3, 62, '53', 5, 'ACTIVE', 5),
(3, 63, '54', 5, 'ACTIVE', 5),
(3, 64, '55', 5, 'ACTIVE', 5),
(4, 65, 'A', 3, 'ACTIVE', 3),
(4, 66, 'A1', 3, 'ACTIVE', 3),
(4, 67, 'B', 3, 'ACTIVE', 2),
(4, 68, 'B2', 3, 'ACTIVE', 2),
(4, 69, 'C', 3, 'ACTIVE', 0),
(4, 70, 'C3', 3, 'ACTIVE', 1),
(4, 71, 'D', 3, 'ACTIVE', 2),
(4, 72, 'D4', 3, 'ACTIVE', 2),
(4, 73, 'E', 1, 'ACTIVE', 0),
(4, 74, 'E5', 3, 'ACTIVE', 3),
(4, 75, 'F', 3, 'ACTIVE', 1),
(4, 76, 'F6', 1, 'ACTIVE', 1),
(4, 77, 'G', 3, 'ACTIVE', 2),
(4, 78, 'G7', 3, 'ACTIVE', 2),
(4, 79, 'H', 3, 'ACTIVE', 2),
(4, 80, 'H8', 1, 'ACTIVE', 1),
(4, 81, 'I', 3, 'ACTIVE', 2),
(4, 82, 'J', 1, 'ACTIVE', 1),
(4, 83, 'K', 3, 'ACTIVE', 2),
(4, 84, 'L', 3, 'ACTIVE', 2),
(4, 85, 'M', 3, 'ACTIVE', 2),
(4, 86, 'N', 3, 'ACTIVE', 2),
(4, 87, 'O', 3, 'ACTIVE', 2),
(4, 88, 'P', 1, 'ACTIVE', 0),
(4, 89, 'Q', 1, 'ACTIVE', 0),
(4, 90, 'R', 1, 'ACTIVE', 0),
(4, 91, 'S', 1, 'ACTIVE', 0),
(4, 92, 'T', 3, 'ACTIVE', 2),
(4, 93, 'U', 3, 'ACTIVE', 2),
(4, 94, 'V', 3, 'ACTIVE', 2),
(4, 95, 'W', 1, 'ACTIVE', 1),
(4, 96, 'X', 3, 'ACTIVE', 2),
(4, 97, 'Y', 3, 'ACTIVE', 2),
(4, 98, 'Y1', 3, 'ACTIVE', 2),
(4, 99, 'Z', 3, 'ACTIVE', 2),
(4, 100, 'Z2', 3, 'ACTIVE', 3),
(5, 101, 'F1', 10, 'ACTIVE', 8),
(5, 102, 'F2', 10, 'ACTIVE', 7),
(5, 103, 'G1', 13, 'ACTIVE', 13),
(6, 104, '1', 18, 'ACTIVE', 14),
(8, 105, '101', 8, 'ACTIVE', 8),
(8, 106, '102', 8, 'ACTIVE', 8),
(8, 107, '201', 8, 'ACTIVE', 8),
(8, 108, '202', 8, 'ACTIVE', 8),
(8, 109, '301', 8, 'ACTIVE', 8),
(8, 110, '302', 7, 'ACTIVE', 7),
(8, 111, '001', 7, 'ACTIVE', 6),
(13, 112, '1', 6, 'ACTIVE', 6),
(12, 113, '1', 6, 'ACTIVE', 6),
(7, 114, '1', 3, 'ACTIVE', 3),
(7, 115, '2', 3, 'ACTIVE', 3),
(7, 116, '3', 3, 'ACTIVE', 3),
(7, 117, '4', 3, 'ACTIVE', 3),
(7, 118, '5', 3, 'ACTIVE', 2),
(7, 119, '6', 3, 'ACTIVE', 2),
(7, 120, '7', 3, 'ACTIVE', 3),
(7, 121, '8', 3, 'ACTIVE', 3),
(7, 122, '9', 3, 'ACTIVE', 3),
(7, 123, '10', 3, 'ACTIVE', 3),
(7, 124, '11', 3, 'ACTIVE', 3),
(7, 125, '12', 3, 'ACTIVE', 3),
(7, 126, '13', 3, 'ACTIVE', 3),
(7, 127, '14', 3, 'ACTIVE', 3),
(7, 128, '15', 3, 'ACTIVE', 3),
(7, 129, '16', 3, 'ACTIVE', 3),
(11, 130, 'UG1', 6, 'ACTIVE', 4),
(11, 131, 'UG2', 6, 'ACTIVE', 2),
(11, 132, 'F1', 6, 'ACTIVE', 3),
(11, 133, 'F2', 6, 'ACTIVE', 0),
(11, 134, 'F3', 6, 'ACTIVE', 0),
(11, 135, 'F4', 6, 'ACTIVE', 0),
(11, 136, 'S1', 6, 'ACTIVE', 0),
(11, 137, 'S2', 6, 'ACTIVE', 0),
(11, 138, 'S3', 5, 'ACTIVE', 0),
(11, 139, 'S4', 5, 'ACTIVE', 0),
(11, 140, 'T1', 5, 'ACTIVE', 0),
(11, 141, 'T2', 5, 'ACTIVE', 0),
(11, 142, 'T3', 5, 'ACTIVE', 0),
(11, 143, 'T4', 5, 'ACTIVE', 0),
(9, 144, '101', 6, 'ACTIVE', 6),
(9, 145, '102', 6, 'ACTIVE', 6),
(9, 146, '103', 6, 'ACTIVE', 6),
(9, 147, '104', 6, 'ACTIVE', 5),
(9, 148, '201', 6, 'ACTIVE', 6),
(9, 149, '202', 6, 'ACTIVE', 6),
(9, 150, '203', 6, 'ACTIVE', 6),
(9, 151, '204', 6, 'ACTIVE', 6),
(9, 152, '301', 6, 'ACTIVE', 6),
(9, 153, '302', 6, 'ACTIVE', 6),
(9, 154, '303', 6, 'ACTIVE', 5),
(9, 155, '304', 6, 'ACTIVE', 5),
(9, 156, 'UG1', 6, 'ACTIVE', 5),
(9, 157, 'UG2', 6, 'ACTIVE', 6),
(10, 158, '101', 5, 'ACTIVE', 4),
(10, 159, '102', 4, 'ACTIVE', 3),
(10, 160, '103', 4, 'ACTIVE', 3),
(10, 161, '104', 4, 'ACTIVE', 3),
(10, 162, '105', 4, 'ACTIVE', 0),
(10, 163, '106', 4, 'ACTIVE', 0),
(10, 164, '107', 4, 'ACTIVE', 3),
(10, 165, '201', 5, 'ACTIVE', 4),
(10, 166, '202', 5, 'ACTIVE', 4),
(10, 167, '203', 4, 'ACTIVE', 2),
(10, 168, '204', 5, 'ACTIVE', 4),
(10, 169, '205', 4, 'ACTIVE', 4),
(10, 170, '206', 4, 'ACTIVE', 0),
(10, 171, '207', 4, 'ACTIVE', 4),
(10, 172, '208', 4, 'ACTIVE', 0),
(10, 173, '209', 4, 'ACTIVE', 0);

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
  `quality_check` enum('Yes','No') NOT NULL,
  `qty` int(11) NOT NULL,
  `bill_no` varchar(10) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `technician`
--

CREATE TABLE `technician` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_files`
--

CREATE TABLE `tmp_files` (
  `file_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vaccination`
--

CREATE TABLE `vaccination` (
  `vaccination_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `emp_code` varchar(10) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `date_of_administration` date DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `date_of_next_dose` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vaccination`
--

INSERT INTO `vaccination` (`vaccination_id`, `emp_id`, `emp_code`, `category_id`, `date_of_administration`, `location`, `date_of_next_dose`) VALUES
(1, 637, 'H00993', 1, '2021-06-06', 'Miramar', NULL),
(2, 638, 'H02852', 1, '2021-10-18', 'Miramar', NULL),
(3, 639, 'H01360', 1, '2021-06-06', 'Miramar', NULL),
(4, 640, 'D00319', 1, '2021-07-20', 'Succor', NULL),
(5, 642, 'H02628', 1, '2021-06-16', 'Madhuban', NULL),
(6, 644, 'H03117', 1, '2021-10-13', 'Miramar', NULL),
(7, 645, 'H03118', 1, '2021-10-13', 'Miramar', NULL),
(8, 646, 'H03124', 1, '2022-06-28', 'Miramar', NULL),
(9, 647, 'H01798', 1, '2021-07-23', 'Miramar', NULL),
(10, 648, 'H03022', 1, '2021-07-15', 'Miramar', NULL),
(11, 649, 'H03105', 1, '2021-06-18', 'Miramar', NULL),
(12, 650, 'H03104', 1, '2022-11-10', 'Miramar', NULL),
(13, 651, 'H03024', 1, '2021-06-02', 'Miramar', NULL),
(14, 652, 'GP 659', 1, '2021-06-16', 'Miramar', NULL),
(15, 653, 'D00306', 1, '2021-06-06', 'Miramar', NULL),
(16, 654, 'H01769', 1, '2021-06-06', 'Miramar', NULL),
(17, 655, 'D00650', 1, '2021-06-06', 'Madhuban', NULL),
(18, 657, 'H02890', 1, '2021-05-28', 'Miramar', NULL),
(19, 660, 'H02843', 1, '2021-06-08', 'Madhuban', NULL),
(20, 661, 'GP 981', 1, '2021-06-18', 'Madhuban', NULL),
(21, 662, 'H03028', 1, '2021-07-02', 'Miramar', NULL),
(22, 663, 'H03021', 1, '2021-06-05', 'Miramar', NULL),
(23, 664, 'H03026', 1, '2022-01-17', 'Miramar', NULL),
(24, 665, 'H03023', 1, '2021-07-11', 'Miramar', NULL),
(25, 666, 'H01773', 1, '2021-07-27', 'Miramar', NULL),
(26, 579, 'V01961', 1, '2021-06-06', 'Taleigao', NULL),
(27, 581, 'V06632', 1, '2021-06-09', 'TALEIGAO', NULL),
(28, 582, 'V00455', 1, '2021-05-27', 'Taleigao', NULL),
(29, 583, 'V04404', 1, '2021-06-21', 'Taleigao', NULL),
(30, 584, 'D00621', 1, '2021-06-08', 'TALEIGAO', NULL),
(31, 585, 'V04372', 1, '2021-05-18', 'Taleigao', NULL),
(32, 586, 'V04681', 1, '2021-06-15', 'Taleigao', NULL),
(33, 587, 'D00065', 1, '2021-06-06', 'Taleigao', NULL),
(34, 588, 'V06664', 1, '2021-06-08', 'TALEIGAO', NULL),
(35, 589, 'V07273', 1, '2021-09-11', 'TALEIGAO', NULL),
(36, 590, 'V04708', 1, '2021-06-08', 'Taleigao', NULL),
(37, 591, 'V06346 ', 1, '2021-06-25', 'Taleigao', NULL),
(38, 592, 'V04317', 1, '2021-08-13', 'Taleigao', NULL),
(39, 593, 'V02886', 1, '2021-06-06', 'Taleigao', NULL),
(40, 594, ' V06695', 1, '2021-07-23', 'Taleigao', NULL),
(41, 595, 'V03936', 1, '2021-06-08', 'Taleigao', NULL),
(42, 596, 'V05500', 1, '2021-07-10', 'Taleigao', NULL),
(43, 597, 'V06180', 1, '2021-07-02', 'Taleigao', NULL),
(44, 598, 'V06179', 1, '2021-07-12', 'Taleigao', NULL),
(45, 599, 'V04132', 1, '2021-06-25', 'Taleigao', NULL),
(46, 601, 'V05721', 1, '2021-08-08', 'Taleigao', NULL),
(47, 602, 'D00607', 1, '2021-06-06', 'Taleigao', NULL),
(48, 603, 'V07029', 1, '2021-07-02', 'Green Lake View', NULL),
(49, 604, 'D00818', 1, '2021-05-28', 'Taleigao', NULL),
(50, 605, 'D00586', 1, '2021-06-06', 'Taleigao', NULL),
(51, 606, 'V03246', 1, '2021-06-26', 'Taleigao', NULL),
(52, 607, 'D00612', 1, '2021-06-06', 'Taleigao', NULL),
(53, 608, 'D00821', 1, '2021-06-22', 'Taleigao', NULL),
(54, 609, 'V04234', 1, '2021-06-06', 'Taleigao', NULL),
(55, 610, 'V04226', 1, '2021-06-06', 'Taleigao', NULL),
(56, 611, 'V04028', 1, '2021-06-06', 'Taleigao', NULL),
(57, 612, 'V04571', 1, '2021-06-06', 'Taleigao', NULL),
(58, 613, 'V06815', 1, '2021-06-23', 'TALEIGAO', NULL),
(59, 614, 'V07170', 1, '2021-11-20', 'TALEIGAO', NULL),
(60, 615, 'V06855', 1, '2021-07-05', 'TALEIGAO', NULL),
(61, 616, 'V06881', 1, '2021-06-07', 'TALEIGAO', NULL),
(62, 617, 'V06790', 1, '2021-07-29', 'Taleigao', NULL),
(63, 618, 'V06789', 1, '2021-07-25', 'Taleigao', NULL),
(64, 620, 'V06787', 1, '2021-10-11', 'Taleigao', NULL),
(65, 621, ' V06910', 1, '2021-07-27', 'TALEIGAO', NULL),
(66, 622, 'V06705', 1, '2021-06-16', 'Taleigao', NULL),
(67, 623, 'V06706', 1, '2021-06-16', 'Taleigao', NULL),
(68, 624, 'D01026', 1, '2021-08-23', 'TALEIGAO', NULL),
(69, 625, 'V06879', 1, '2021-06-19', 'TALEIGAO', NULL),
(70, 626, 'V06741', 1, '2021-08-11', 'Taleigao', NULL),
(71, 627, 'V06676', 1, '2021-08-03', 'Taleigao', NULL),
(72, 628, 'V06917', 1, '2021-06-09', 'TALEIGAO', NULL),
(73, 629, 'V06530', 1, '2021-06-23', 'Green Lake View', NULL),
(74, 630, 'V06652', 1, '2021-08-03', 'Walwaikar', NULL),
(75, 631, 'V07092', 1, '2021-07-02', 'TALEIGAO', NULL),
(76, 632, ' V07229', 1, '2021-05-28', 'TALEIGAO', NULL),
(77, 633, ' H03167', 1, '2021-06-04', 'TALEIGAO', NULL),
(78, 634, ' H03169', 1, '2021-06-10', 'TALEIGAO', NULL),
(79, 635, ' H03170', 1, '2021-05-23', 'TALEIGAO', NULL),
(80, 636, ' V07227', 1, '2021-06-04', 'TALEIGAO', NULL),
(81, 567, ' D00870', 1, '2021-06-16', 'Masjid', NULL),
(82, 568, 'V06485', 1, '2021-06-23', 'Masjid', NULL),
(83, 569, 'V06484', 1, '2021-09-06', 'Masjid', NULL),
(84, 570, 'V06874', 1, '2022-02-03', 'Evolution', NULL),
(85, 571, 'V06862', 1, '2021-11-24', 'Evolution', NULL),
(86, 573, 'V03853', 1, '2021-08-09', 'Masjid', NULL),
(87, 576, 'V06767', 1, '2021-07-23', 'Masjid', NULL),
(88, 577, 'V06587', 1, '2021-06-12', 'Masjid', NULL),
(89, 578, 'V06900', 1, '2021-08-05', 'Evolution', NULL),
(90, 558, 'V07180', 1, '2021-08-29', 'Corlim', NULL),
(91, 559, 'V07195', 1, '2021-06-15', 'Corlim', NULL),
(92, 560, 'V07214', 1, '2021-09-17', 'Corlim', NULL),
(93, 561, 'V06531', 1, '2021-09-17', 'Corlim', NULL),
(94, 562, 'V07270', 1, '2021-08-20', 'Corlim', NULL),
(95, 563, 'V07192', 1, '2021-07-30', 'Corlim', NULL),
(96, 564, 'V07284', 1, '2021-07-26', 'Corlim', NULL),
(97, 565, 'H02844', 1, '2021-06-22', 'Corlim', NULL),
(98, 566, 'V07313', 1, '2021-11-13', 'Corlim', NULL),
(99, 500, 'D00630', 1, '2021-06-06', 'Succor', NULL),
(100, 501, 'D00432', 1, '2021-06-20', 'Succor', NULL),
(101, 502, 'D00631', 1, '2021-06-06', 'Succor', NULL),
(102, 503, 'H02850', 1, '2022-02-05', 'Succor', NULL),
(103, 504, 'H02832', 1, '2022-10-22', 'Succor', NULL),
(104, 505, 'H02839', 1, '2022-01-19', 'Succor', NULL),
(105, 506, 'D00609', 1, '2021-06-06', 'Madhuban', NULL),
(106, 507, 'V06873', 1, '2021-05-07', 'SUCCOUR', NULL),
(107, 508, 'V06791 ', 1, '2021-08-26', 'Succor', NULL),
(108, 509, 'D00939', 1, '2021-11-29', 'Succor', NULL),
(109, 510, 'GP 713', 1, '2022-04-09', 'Succor', NULL),
(110, 511, 'H02981 ', 1, '2021-07-21', 'Succor', NULL),
(111, 512, 'D00932', 1, '2021-09-13', 'Succor', NULL),
(112, 514, 'V06621', 1, '2021-07-26', 'Succor', NULL),
(113, 515, 'D00910', 1, '2022-01-05', 'Succor', NULL),
(114, 516, 'D00634', 1, '2021-06-06', 'Succor', NULL),
(115, 517, 'V05566', 1, '2021-06-06', 'Succor', NULL),
(116, 518, 'D00610', 1, '2021-06-06', 'Succor', NULL),
(117, 519, 'D00911', 1, '2021-06-05', 'Succor', NULL),
(118, 520, 'V06812', 1, '2021-10-21', 'Succor', NULL),
(119, 521, 'V03821', 1, '2021-06-06', 'Madhuban', NULL),
(120, 522, 'V03806', 1, '2021-06-06', 'Madhuban', NULL),
(121, 523, 'V06809', 1, '2021-08-21', 'Succor', NULL),
(122, 524, 'V06811', 1, '2021-07-22', 'Succor', NULL),
(123, 525, 'D00326', 1, '2021-06-06', 'Miramar', NULL),
(124, 526, 'H02711', 1, '2021-06-13', 'Succor', NULL),
(125, 528, 'V06650', 1, '2021-07-21', 'Madhuban', NULL),
(126, 529, 'V06648', 1, '2021-06-30', 'Succor', NULL),
(127, 530, 'V06788 ', 1, '2021-06-11', 'Succor', NULL),
(128, 531, 'H02950', 1, '2021-08-11', 'Succor', NULL),
(129, 532, 'D00909', 1, '2021-09-13', 'Succor', NULL),
(130, 533, 'D00934 ', 1, '2021-08-12', 'Succor', NULL),
(131, 534, 'H02943', 1, '2021-09-08', 'Succor', NULL),
(132, 535, 'H02942', 1, '2021-09-02', 'Succor', NULL),
(133, 536, 'V06865', 1, '2021-08-09', 'SUCCOUR', NULL),
(134, 537, 'V06875', 1, '2021-06-28', 'SUCCOUR', NULL),
(135, 538, ' V06798', 1, '2021-11-25', 'Succor', NULL),
(136, 539, ' D00936', 1, '2021-08-16', 'Succor', NULL),
(137, 540, 'V06804', 1, '2021-06-16', 'Succor', NULL),
(138, 541, 'D00933 ', 1, '2021-08-25', 'Succor', NULL),
(139, 542, 'V06805 ', 1, '2021-11-30', 'Succor', NULL),
(140, 543, 'V06803 ', 1, '2021-08-24', 'Succor', NULL),
(141, 544, 'H02983', 1, '2021-06-12', 'Succor', NULL),
(142, 545, 'D00937 ', 1, '2021-08-24', 'Succor', NULL),
(143, 546, 'D00941', 1, '2021-12-05', 'SUCCOUR', NULL),
(144, 547, 'V06821', 1, '2021-12-25', 'SUCCOUR', NULL),
(145, 548, 'V06820', 1, '2021-09-06', 'SUCCOUR', NULL),
(146, 549, 'V06822', 1, '2021-06-11', 'SUCCOUR', NULL),
(147, 550, 'V06590', 1, '2021-11-18', 'Succor', NULL),
(148, 551, 'H02992', 1, '2021-07-03', 'SUCCOUR', NULL),
(149, 552, 'V06816', 1, '2021-07-19', 'SUCCOUR', NULL),
(150, 553, 'V06825', 1, '2021-06-28', 'SUCCOUR', NULL),
(151, 554, 'H02993', 1, '2021-07-17', 'SUCCOUR', NULL),
(152, 555, 'V06870', 1, '2022-02-01', 'SUCCOUR', NULL),
(153, 556, 'V06883', 1, '2021-07-15', 'SUCCOUR', NULL),
(154, 557, 'V06867', 1, '2021-09-16', 'SUCCOUR', NULL),
(155, 421, 'V05624', 1, '2021-07-21', 'Walwaikar', NULL),
(156, 422, 'D00589', 1, '2021-06-04', 'Walwaikar', NULL),
(157, 423, 'V06651', 1, '2021-05-29', 'Walwaikar', NULL),
(158, 424, 'V05962', 1, '2021-08-14', 'Walwaikar', NULL),
(159, 425, 'V06894', 1, '2021-08-05', 'EVOLUTION', NULL),
(160, 426, ' H03172', 1, '2021-07-26', 'EVOLUTION', NULL),
(161, 428, ' V07230', 1, '2021-05-21', 'EVOLUTION', NULL),
(162, 429, ' H03171', 1, '2021-07-12', 'EVOLUTION', NULL),
(163, 430, ' V07233', 1, '2021-05-13', 'EVOLUTION', NULL),
(164, 431, ' V07235', 1, '2021-06-19', 'EVOLUTION', NULL),
(165, 432, 'V07305', 1, '2023-06-28', 'EVOLUTION', NULL),
(166, 433, ' V07231', 1, '2021-08-06', 'EVOLUTION', NULL),
(167, 434, ' V07232', 1, '2021-06-09', 'EVOLUTION', NULL),
(168, 435, ' V07228', 1, '2021-06-20', 'EVOLUTION', NULL),
(169, 436, ' H03168', 1, '2021-08-18', 'EVOLUTION', NULL),
(170, 437, ' H03174', 1, '2021-05-15', 'EVOLUTION', NULL),
(171, 438, 'V07129', 1, '2022-08-18', 'Evolution', NULL),
(172, 439, 'V07133', 1, '2021-12-15', 'Evolution', NULL),
(173, 440, 'V05769', 1, '2021-06-18', 'Green Lake View', NULL),
(174, 441, 'V06926', 1, '2021-06-14', 'Evolution', NULL),
(175, 442, 'V06262', 1, '2021-06-16', 'Green Lake View', NULL),
(176, 443, 'V07308 ', 1, '2021-07-17', 'EVOLUTION', NULL),
(177, 444, 'V06639', 1, '2021-05-18', 'Evolution', NULL),
(178, 445, 'V07307 ', 1, '2021-05-20', 'EVOLUTION', NULL),
(179, 446, 'V07140', 1, '2021-06-25', 'Evolution', NULL),
(180, 447, 'V05992', 1, '2021-06-16', 'Green Lake View', NULL),
(181, 448, 'V07061', 1, '2021-08-31', 'EVOLUTION', NULL),
(182, 449, 'V06938 ', 1, '2021-07-06', 'Green Lake View', NULL),
(183, 451, 'V06937', 1, '2021-07-02', 'Green Lake View', NULL),
(184, 452, 'V06694', 1, '2021-08-21', 'Walwaikar', NULL),
(185, 453, 'H02941', 1, '2021-08-30', 'Evolution', NULL),
(186, 454, 'H02924', 1, '2021-06-26', 'Evolution', NULL),
(187, 455, 'V02864', 1, '2021-06-05', 'Walwaikar', NULL),
(188, 456, 'H01721', 1, '2021-07-04', 'Walwaikar', NULL),
(189, 457, 'D00834', 1, '2021-07-02', 'Walwaikar', NULL),
(190, 458, 'V04591', 1, '2021-06-15', 'Walwaikar', NULL),
(191, 459, 'H00964', 1, '2021-06-27', 'Walwaikar', NULL),
(192, 460, 'V06614 ', 1, '2021-06-28', 'Masjid', NULL),
(193, 461, 'H02927', 1, '2021-06-26', 'Evolution', NULL),
(194, 462, 'D00914', 1, '2021-07-16', 'Evolution', NULL),
(195, 463, 'D00912', 1, '2021-08-13', 'Evolution', NULL),
(196, 464, 'D00915', 1, '2021-09-15', 'Evolution', NULL),
(197, 466, 'V06895', 1, '2022-04-04', 'EVOLUTION', NULL),
(198, 467, 'D00960', 1, '2021-07-03', 'EVOLUTION', NULL),
(199, 468, 'V07150', 1, '2021-06-22', 'EVOLUTION', NULL),
(200, 469, 'H02881', 1, '2022-01-24', 'Green Lake View', NULL),
(201, 470, 'V06653', 1, '2021-08-23', 'Green Lake View', NULL),
(202, 471, 'V06640', 1, '2021-08-05', 'Evolution', NULL),
(203, 473, 'V03671', 1, '2021-06-08', 'Walwaikar', NULL),
(204, 474, 'H03111', 1, '2021-08-02', 'Evolution', NULL),
(205, 475, 'D01005', 1, '2021-08-10', 'Evolution', NULL),
(206, 476, 'H02896', 1, '2021-06-23', 'Evolution', NULL),
(207, 477, 'V07306 ', 1, '2021-07-26', 'EVOLUTION', NULL),
(208, 479, 'V06792', 1, '2021-08-19', 'Evolution', NULL),
(209, 480, 'H02985 ', 1, '2021-06-30', 'Evolution', NULL),
(210, 481, 'D00938', 1, '2021-08-17', 'Evolution', NULL),
(211, 482, 'V06799', 1, '2021-08-13', 'Evolution', NULL),
(212, 483, 'V06813', 1, '2021-07-31', 'EVOLUTION', NULL),
(213, 484, 'H03002', 1, '2021-07-25', 'Masjid', NULL),
(214, 486, 'V06340', 1, '2021-05-31', 'Green Lake View', NULL),
(215, 487, 'V06393', 1, '2021-06-07', 'Green Lake View', NULL),
(216, 488, 'V06876', 1, '2021-09-07', 'Evolution', NULL),
(217, 489, 'D01008', 1, '2021-05-23', 'Evolution', NULL),
(218, 491, 'V06908', 1, '2021-08-09', 'Evolution', NULL),
(219, 492, 'V06907 ', 1, '2021-08-10', 'Evolution', NULL),
(220, 493, 'V06913', 1, '2021-07-07', 'Evolution', NULL),
(221, 494, 'V06916', 1, '2021-06-14', 'EVOLUTION', NULL),
(222, 495, 'V06931', 1, '2021-10-09', 'EVOLUTION', NULL),
(223, 496, 'V07020', 1, '2021-06-17', 'Evolution', NULL),
(224, 497, 'V07122', 1, '2021-08-18', 'Evolution', NULL),
(225, 498, 'V07191', 1, '2021-06-13', 'EVOLUTION', NULL),
(226, 499, 'H03106', 1, '2021-06-16', 'EVOLUTION', NULL),
(227, 374, 'V07104', 1, '2021-08-08', 'Green Lake View', NULL),
(228, 375, 'H02621', 1, '2021-07-13', 'Green Lake View', NULL),
(229, 376, 'H02745', 1, '2021-08-02', 'Green Lake View', NULL),
(230, 377, 'V02479', 1, '2021-06-08', 'Green Lake View', NULL),
(231, 378, 'V04392', 1, '2021-08-30', 'Green Lake View', NULL),
(232, 379, 'H02129', 1, '2021-05-27', 'Green Lake View', NULL),
(233, 380, 'V07172', 1, '2021-09-16', 'Green Lake View', NULL),
(234, 381, 'V06242', 1, '2021-06-07', 'Green Lake View', NULL),
(235, 382, 'V07266', 1, '2021-05-07', 'Green Lake View', NULL),
(236, 383, 'V06990', 1, '2021-07-07', 'Green Lake View', NULL),
(237, 384, 'V06991', 1, '2021-08-02', 'Green Lake View', NULL),
(238, 385, 'D00986', 1, '2021-07-05', 'Green Lake View', NULL),
(239, 386, 'H03195', 1, '2021-07-02', 'Green Lake View', NULL),
(240, 387, 'V07280 ', 1, '2021-07-03', 'Green Lake View', NULL),
(241, 388, 'V06090', 1, '2021-06-19', 'Green Lake View', NULL),
(242, 389, 'V04342', 1, '2021-06-08', 'Green Lake View', NULL),
(243, 390, 'H03196', 1, '2021-05-16', 'Green Lake View', NULL),
(244, 391, 'H03194', 1, '2021-07-19', 'Green Lake View', NULL),
(245, 392, ' V07281', 1, '2021-05-07', 'Green Lake View', NULL),
(246, 393, 'V06996', 1, '2021-07-03', 'Green Lake View', NULL),
(247, 394, 'H03046', 1, '2021-07-02', 'Green Lake View', NULL),
(248, 395, 'H03045', 1, '2021-07-02', 'Green Lake View', NULL),
(249, 396, 'V04676', 1, '2021-06-08', 'Green Lake View', NULL),
(250, 397, 'H02676', 1, '2021-06-08', 'Green Lake View', NULL),
(251, 398, 'V05581', 1, '2021-06-08', 'Green Lake View', NULL),
(252, 399, 'V04308', 1, '2021-06-06', 'RMJ', NULL),
(253, 400, 'V06615', 1, '2021-04-03', 'Green Lake View', NULL),
(254, 402, 'VDP267', 1, '2021-06-06', 'RMJ', NULL),
(255, 403, 'V06975', 1, '2021-10-01', 'Green Lake View', NULL),
(256, 404, 'V05954', 1, '2021-06-16', 'Green Lake View', NULL),
(257, 405, 'H02608', 1, '2021-07-30', 'Green Lake View', NULL),
(258, 406, 'V06691', 1, '2021-11-11', 'Green Lake View', NULL),
(259, 407, 'V05970', 1, '2021-09-28', 'Green Lake View', NULL),
(260, 408, 'V04523', 1, '2021-06-06', 'RMJ', NULL),
(261, 409, 'H03000', 1, '2021-08-24', 'Green Lake View', NULL),
(262, 410, 'V06416', 1, '2021-06-13', 'Green Lake View', NULL),
(263, 411, 'V04674', 1, '2021-06-06', 'Taleigao', NULL),
(264, 412, 'H01820', 1, '2021-06-06', 'Taleigao', NULL),
(265, 413, 'V06215', 1, '2021-06-28', 'Taleigao', NULL),
(266, 414, 'V05971', 1, '2021-05-06', 'Green Lake View', NULL),
(267, 415, 'V06027', 1, '2021-07-27', 'Green Lake View', NULL),
(268, 416, 'V07149', 1, '2021-09-27', 'Green Lake View', NULL),
(269, 417, 'V05564', 1, '2021-06-06', 'RMJ', NULL),
(270, 418, 'D00283', 1, '2021-06-08', 'Green Lake View', NULL),
(271, 419, 'H03096', 1, '2021-06-21', 'Green Lake View', NULL),
(272, 135, 'H02107', 1, '2021-06-20', 'Madhuban', NULL),
(273, 136, 'V05426', 1, '2021-06-06', 'Madhuban', NULL),
(274, 137, 'V05423', 1, '2021-06-20', 'Madhuban', NULL),
(275, 138, 'V07309', 1, '2022-02-09', 'Madhuban', NULL),
(276, 139, 'V07174', 1, '2021-07-16', 'Madhuban', NULL),
(277, 140, 'V07175', 1, '2021-07-27', 'Madhuban', NULL),
(278, 142, 'V06520', 1, '2021-07-23', 'Madhuban', NULL),
(279, 143, 'V06275', 1, '2021-07-25', 'Succor', NULL),
(280, 144, 'H02840', 1, '2021-06-28', 'Madhuban', NULL),
(281, 145, 'D00427', 1, '2021-06-08', 'Madhuban', NULL),
(282, 146, 'D00428', 1, '2021-06-06', 'Madhuban', NULL),
(283, 147, 'D00437', 1, '2021-06-06', 'Madhuban', NULL),
(284, 148, 'V07194', 1, '2021-07-26', 'Madhuban', NULL),
(285, 149, 'V06591', 1, '2021-07-03', 'Madhuban', NULL),
(286, 151, 'V06899', 1, '2021-07-12', 'Madhuban', NULL),
(287, 152, 'V06286', 1, '2021-06-17', 'Madhuban', NULL),
(288, 153, 'V06287', 1, '2021-06-16', 'Madhuban', NULL),
(289, 155, 'D00922', 1, '2021-06-13', 'Madhuban', NULL),
(290, 156, 'H03152', 1, '2021-08-12', 'Madhuban', NULL),
(291, 157, 'H01498', 1, '2021-06-06', 'Madhuban', NULL),
(292, 158, 'V04301', 1, '2021-06-06', 'Madhuban', NULL),
(293, 159, 'H02069', 1, '2021-07-26', 'Madhuban', NULL),
(294, 162, 'V04302', 1, '2021-06-06', 'Madhuban', NULL),
(295, 163, 'H02882', 1, '2021-06-28', 'Madhuban', NULL),
(296, 164, 'V07298', 1, '2021-09-13', 'Madhuban', NULL),
(297, 165, 'V03896', 1, '2021-07-02', 'Madhuban', NULL),
(298, 166, 'V04440', 1, '2021-07-05', 'Madhuban', NULL),
(299, 167, 'V04300', 1, '2021-06-06', 'Madhuban', NULL),
(300, 168, 'V03714', 1, '2021-08-08', 'Madhuban', NULL),
(301, 169, 'V04415', 1, '2021-06-06', 'Madhuban', NULL),
(302, 170, 'V04438', 1, '2021-06-06', 'Madhuban', NULL),
(303, 171, 'V04437', 1, '2021-07-05', 'Madhuban', NULL),
(304, 172, 'V04471', 1, '2021-06-06', 'Madhuban', NULL),
(305, 173, 'V04565', 1, '2021-06-06', 'Madhuban', NULL),
(306, 174, 'D00620', 1, '2021-06-06', 'Madhuban', NULL),
(307, 175, 'H00927', 1, '2021-08-02', 'Madhuban', NULL),
(308, 176, 'D00825', 1, '2021-06-22', 'Madhuban', NULL),
(309, 178, 'H02884', 1, '2021-01-22', 'Madhuban', NULL),
(310, 179, 'H03003 ', 1, '2021-07-01', 'Madhuban', NULL),
(311, 180, 'V03270', 1, '2021-06-06', 'Madhuban', NULL),
(312, 181, 'D00921', 1, '2021-05-27', 'Madhuban', NULL),
(313, 182, 'H03150', 1, '2021-07-02', 'Madhuban', NULL),
(314, 183, 'H03192', 1, '2021-06-29', 'Madhuban', NULL),
(315, 184, 'V05235', 1, '2021-07-12', 'Madhuban', NULL),
(316, 185, 'V06391', 1, '2021-06-13', 'Madhuban', NULL),
(317, 187, 'H02949', 1, '2021-07-07', 'Madhuban', NULL),
(318, 188, 'V03190', 1, '2021-07-05', 'Madhuban', NULL),
(319, 189, 'H03147', 1, '2022-09-02', 'Madhuban', NULL),
(320, 190, 'V05043', 1, '2021-06-25', 'Madhuban', NULL),
(321, 191, 'H03001', 1, '2021-08-07', 'Madhuban', NULL),
(322, 192, 'V03187', 1, '2021-06-24', 'Madhuban', NULL),
(323, 193, 'V07271', 1, '2022-01-19', 'Madhuban', NULL),
(324, 194, 'V03189', 1, '2021-06-28', 'Madhuban', NULL),
(325, 195, 'V03974', 1, '2021-06-06', 'Madhuban', NULL),
(326, 196, 'V03984', 1, '2021-06-06', 'Madhuban', NULL),
(327, 197, 'V03986', 1, '2021-06-06', 'Madhuban', NULL),
(328, 198, 'V06935', 1, '2021-06-13', 'Madhuban', NULL),
(329, 199, 'D00962 ', 1, '2021-06-13', 'Madhuban', NULL),
(330, 200, 'V07257', 1, '2021-11-10', 'Madhuban', NULL),
(331, 201, 'V01832', 1, '2021-06-06', 'Madhuban', NULL),
(332, 202, 'V06283', 1, '2021-06-28', 'Madhuban', NULL),
(333, 203, 'V06282', 1, '2021-06-28', 'Madhuban', NULL),
(334, 204, 'V07097', 1, '2021-06-16', 'Madhuban', NULL),
(335, 205, 'V04207', 1, '2021-07-23', 'Madhuban', NULL),
(336, 206, 'D01053', 1, '2021-06-25', 'Madhuban', NULL),
(337, 207, 'D01052 ', 1, '2021-07-01', 'Madhuban', NULL),
(338, 208, 'D01055 ', 1, '2021-07-01', 'Madhuban', NULL),
(339, 209, 'V04798', 1, '2021-06-06', 'Madhuban', NULL),
(340, 210, 'V06026', 1, '2021-06-16', 'Madhuban', NULL),
(341, 211, 'V04784', 1, '2021-07-12', 'Madhuban', NULL),
(342, 212, 'D01054', 1, '2022-05-18', 'Madhuban', NULL),
(343, 213, 'V03876', 1, '2021-06-06', 'Madhuban', NULL),
(344, 214, 'V06764', 1, '2021-06-16', 'Madhuban', NULL),
(345, 215, 'V05991', 1, '2021-08-28', 'Madhuban', NULL),
(346, 216, 'D00780', 1, '2021-07-22', 'Madhuban', NULL),
(347, 217, ' H03165', 1, '2021-06-21', 'Madhuban', NULL),
(348, 219, 'D01027', 1, '2021-07-03', 'Madhuban', NULL),
(349, 220, 'H02636', 1, '2021-07-02', 'Madhuban', NULL),
(350, 221, 'H02106', 1, '2021-07-05', 'Madhuban', NULL),
(351, 223, 'H03193', 1, '2021-06-19', 'Madhuban', NULL),
(352, 224, 'V07301', 1, '2021-06-14', 'Madhuban', NULL),
(353, 225, 'V07302', 1, '2021-06-14', 'Madhuban', NULL),
(354, 226, 'D01031', 1, '2022-01-27', 'Madhuban', NULL),
(355, 227, 'V05892', 1, '2021-05-31', 'Madhuban', NULL),
(356, 228, 'V05891', 1, '2021-07-06', 'Madhuban', NULL),
(357, 230, 'V05887', 1, '2021-06-25', 'Madhuban', NULL),
(358, 231, 'V06413', 1, '2022-03-10', 'Madhuban', NULL),
(359, 232, 'D01044 ', 1, '2021-07-12', 'Madhuban', NULL),
(360, 233, 'D01046', 1, '2021-05-22', 'Madhuban', NULL),
(361, 234, 'D01045 ', 1, '2021-07-06', 'Madhuban', NULL),
(362, 235, 'V05911', 1, '2021-06-07', 'Madhuban', NULL),
(363, 236, 'V05908', 1, '2021-10-27', 'Madhuban', NULL),
(364, 237, 'V07070', 1, '2021-06-06', 'Madhuban', NULL),
(365, 238, 'V05904', 1, '2021-07-20', 'Madhuban', NULL),
(366, 239, 'V05930', 1, '2021-06-08', 'Madhuban', NULL),
(367, 240, 'H02635', 1, '2021-06-18', 'Madhuban', NULL),
(368, 241, 'V07120', 1, '2021-08-07', 'Madhuban', NULL),
(369, 242, 'H02633', 1, '2021-06-22', 'Madhuban', NULL),
(370, 243, 'V05917', 1, '2021-06-19', 'Madhuban', NULL),
(371, 244, 'V05915', 1, '2021-06-11', 'Madhuban', NULL),
(372, 245, 'V05916', 1, '2021-06-06', 'Madhuban', NULL),
(373, 246, 'V05914', 1, '2021-06-21', 'Madhuban', NULL),
(374, 247, 'V07100', 1, '2021-06-23', 'Madhuban', NULL),
(375, 248, 'V07099', 1, '2021-06-21', 'Madhuban', NULL),
(376, 249, 'H02978', 1, '2021-07-26', 'Madhuban', NULL),
(377, 250, 'V06395', 1, '2021-06-16', 'Madhuban', NULL),
(378, 251, 'D00660', 1, '2021-06-06', 'Madhuban', NULL),
(379, 252, 'V05604', 1, '2021-08-10', 'Madhuban', NULL),
(380, 253, 'V06740', 1, '2021-07-27', 'Madhuban', NULL),
(381, 254, 'V06736', 1, '2021-07-27', 'Madhuban', NULL),
(382, 255, 'V06743', 1, '2022-07-22', 'Madhuban', NULL),
(383, 257, 'V07176', 1, '2021-06-23', 'Madhuban', NULL),
(384, 258, 'GP 975', 1, '2021-06-19', 'Madhuban', NULL),
(385, 259, 'H02933', 1, '2021-07-31', 'Madhuban', NULL),
(386, 261, 'H02930', 1, '2022-01-07', 'Madhuban', NULL),
(387, 262, 'H02929', 1, '2022-01-06', 'Madhuban', NULL),
(388, 263, 'V05394', 1, '2021-06-06', 'Madhuban', NULL),
(389, 264, 'H02079', 1, '2021-06-06', 'Madhuban', NULL),
(390, 265, 'V05393', 1, '2021-07-08', 'Madhuban', NULL),
(391, 266, 'V06735', 1, '2022-03-17', 'Madhuban', NULL),
(392, 267, 'V05981', 1, '2021-06-16', 'Madhuban', NULL),
(393, 268, 'D00641', 1, '2021-06-06', 'Madhuban', NULL),
(394, 269, 'V06933', 1, '2021-07-03', 'Madhuban', NULL),
(395, 270, 'D00976', 1, '2021-11-23', 'Madhuban', NULL),
(396, 271, 'D00653', 1, '2021-06-06', 'Madhuban', NULL),
(397, 272, 'D00703', 1, '2021-06-06', 'Madhuban', NULL),
(398, 273, 'D00942', 1, '2021-07-02', 'Succor', NULL),
(399, 275, ' D01049', 1, '2021-09-08', 'Madhuban', NULL),
(400, 276, 'V07286', 1, '2021-08-05', 'Madhuban', NULL),
(401, 277, 'V03713', 1, '2021-06-06', 'Madhuban', NULL),
(402, 278, 'D00654', 1, '2021-07-23', 'Madhuban', NULL),
(403, 279, 'V07043', 1, '2022-03-07', 'Madhuban', NULL),
(404, 280, 'V07044', 1, '2022-03-07', 'Madhuban', NULL),
(405, 281, 'V07052', 1, '2021-07-02', 'Madhuban', NULL),
(406, 282, 'V06950', 1, '2021-07-27', 'Madhuban', NULL),
(407, 283, 'V03242', 1, '2021-06-03', 'Madhuban', NULL),
(408, 284, 'V03772', 1, '2021-06-03', 'Madhuban', NULL),
(409, 285, 'V06699', 1, '2021-07-19', 'Madhuban', NULL),
(410, 286, 'D01030', 1, '2021-06-03', 'Madhuban', NULL),
(411, 287, 'V07148', 1, '2021-07-10', 'Madhuban', NULL),
(412, 288, 'V03626', 1, '2021-08-03', 'Madhuban', NULL),
(413, 289, 'D00599', 1, '2021-07-05', 'Madhuban', NULL),
(414, 290, 'V06483', 1, '2021-07-10', 'Madhuban', NULL),
(415, 291, 'V05862', 1, '2021-07-12', 'Madhuban', NULL),
(416, 292, 'D00735', 1, '2021-06-06', 'Madhuban', NULL),
(417, 295, 'V06318', 1, '2021-06-16', 'Madhuban', NULL),
(418, 296, 'V07293', 1, '2021-06-28', 'Madhuban', NULL),
(419, 297, 'V00646', 1, '2021-06-06', 'Madhuban', NULL),
(420, 298, 'V02089', 1, '2021-06-06', 'Madhuban', NULL),
(421, 299, 'V05380', 1, '2021-06-06', 'Madhuban', NULL),
(422, 300, 'V05534', 1, '2021-07-20', 'Madhuban', NULL),
(423, 301, 'V05959', 1, '2021-07-03', 'Madhuban', NULL),
(424, 302, 'V05960', 1, '2021-06-28', 'Madhuban', NULL),
(425, 303, 'D00952', 1, '2022-01-21', 'Madhuban', NULL),
(426, 304, 'V05939', 1, '2021-06-29', 'Madhuban', NULL),
(427, 305, 'DS0222', 1, '2021-06-16', 'Madhuban', NULL),
(428, 306, 'H03146', 1, '2021-08-16', 'Madhuban', NULL),
(429, 307, 'H03166', 1, '2021-07-28', 'Madhuban', NULL),
(430, 308, 'V06573', 1, '2021-09-21', 'Madhuban', NULL),
(431, 309, 'V06568', 1, '2021-07-07', 'Madhuban', NULL),
(432, 310, 'V06567', 1, '2021-08-09', 'Madhuban', NULL),
(433, 312, 'V06569', 1, '2022-01-18', 'Madhuban', NULL),
(434, 314, 'V06562', 1, '2021-06-11', 'Madhuban', NULL),
(435, 315, 'V06561', 1, '2021-06-22', 'Madhuban', NULL),
(436, 316, 'V06563', 1, '2021-06-17', 'Madhuban', NULL),
(437, 317, 'V06560', 1, '2021-06-21', 'Madhuban', NULL),
(438, 318, ' V06581', 1, '2021-08-28', 'Madhuban', NULL),
(439, 321, 'H02790', 1, '2021-06-14', 'Madhuban', NULL),
(440, 322, 'H02787', 1, '2021-06-23', 'Madhuban', NULL),
(441, 323, 'H02792', 1, '2021-06-18', 'Madhuban', NULL),
(442, 324, 'H02788', 1, '2021-06-14', 'Madhuban', NULL),
(443, 325, 'H03005 ', 1, '2021-06-17', 'Madhuban', NULL),
(444, 326, 'V06550', 1, '2021-06-16', 'Madhuban', NULL),
(445, 327, 'V06486', 1, '2021-06-14', 'Madhuban', NULL),
(446, 328, 'V06549', 1, '2022-01-12', 'Madhuban', NULL),
(447, 329, 'V06552', 1, '2021-06-17', 'Madhuban', NULL),
(448, 331, 'V06571', 1, '2021-12-03', 'Madhuban', NULL),
(449, 332, 'V06575', 1, '2021-08-09', 'Madhuban', NULL),
(450, 333, 'V06572', 1, '2022-01-18', 'Madhuban', NULL),
(451, 334, 'V06643', 1, '2021-05-12', 'Madhuban', NULL),
(452, 335, 'V06644', 1, '2021-08-09', 'Madhuban', NULL),
(453, 337, 'V06601 ', 1, '2021-07-02', 'Madhuban', NULL),
(454, 339, ' V06598', 1, '2021-08-17', 'Madhuban', NULL),
(455, 340, ' V06599', 1, '2021-08-17', 'Madhuban', NULL),
(456, 341, 'V06600 ', 1, '2021-07-05', 'Madhuban', NULL),
(457, 342, 'V06597', 1, '2021-06-24', 'Madhuban', NULL),
(458, 343, ' V07282', 1, '2021-06-28', 'OM SAI', NULL),
(459, 344, ' V07224', 1, '2021-05-12', 'OM SAI', NULL),
(460, 345, 'V06489', 1, '2021-07-22', 'Madhuban', NULL),
(461, 346, 'V06475', 1, '2021-06-15', 'Madhuban', NULL),
(462, 347, 'V06016', 1, '2021-06-22', 'Madhuban', NULL),
(463, 350, 'V06150', 1, '2021-06-21', 'Madhuban', NULL),
(464, 351, 'V06256', 1, '2021-07-14', 'Madhuban', NULL),
(465, 352, 'V06151', 1, '2021-08-23', 'Madhuban', NULL),
(466, 353, 'V06738', 1, '2021-12-14', 'Madhuban', NULL),
(467, 354, 'V06744', 1, '2022-07-22', 'Madhuban', NULL),
(468, 355, 'V06737', 1, '2022-03-17', 'Madhuban', NULL),
(469, 356, 'V07205', 1, '2021-05-28', 'Madhuban', NULL),
(470, 358, 'V06171', 1, '2021-05-29', 'Madhuban', NULL),
(471, 359, 'V06149', 1, '2021-05-24', 'Madhuban', NULL),
(472, 360, 'V06170', 1, '2021-05-17', 'Madhuban', NULL),
(473, 361, 'H02853', 1, '2021-10-25', 'Madhuban', NULL),
(474, 362, 'V07292', 1, '2022-01-06', 'Madhuban', NULL),
(475, 363, 'V07255', 1, '2021-11-05', 'Madhuban', NULL),
(476, 364, 'H02934', 1, '2021-08-11', 'Madhuban', NULL),
(477, 365, 'H02959', 1, '2021-08-09', 'Madhuban', NULL),
(478, 366, 'H02960', 1, '2021-08-09', 'Madhuban', NULL),
(479, 367, 'V06264', 1, '2021-12-30', 'Madhuban', NULL),
(480, 368, 'V06586', 1, '2021-06-18', 'Madhuban', NULL),
(481, 369, 'V07256', 1, '2021-08-01', 'Madhuban', NULL),
(482, 370, 'V06331', 1, '2021-06-22', 'Madhuban', NULL),
(483, 371, 'V06330', 1, '2021-06-18', 'Madhuban', NULL),
(484, 372, 'V06327', 1, '2022-01-10', 'Madhuban', NULL),
(485, 373, 'V06329', 1, '2021-06-19', 'Madhuban', NULL),
(486, 83, 'V06543', 1, '2021-10-21', 'Masjid', NULL),
(487, 84, 'V04752', 1, '2021-06-06', 'Masjid', NULL),
(488, 85, 'V06164', 1, '2021-09-24', 'Masjid', NULL),
(489, 86, 'V06158', 1, '2021-05-28', 'Masjid', NULL),
(490, 87, 'V05345', 1, '2021-06-23', 'Masjid', NULL),
(491, 88, 'V07019', 1, '2022-03-24', 'Masjid', NULL),
(492, 90, 'V06174', 1, '2021-07-31', 'Masjid', NULL),
(493, 91, 'H00680', 1, '2021-06-06', 'Masjid', NULL),
(494, 94, 'D00089', 1, '2021-07-31', 'Masjid', NULL),
(495, 95, 'V02894', 1, '2021-06-06', 'Masjid', NULL),
(496, 96, 'V00847', 1, '2021-07-30', 'Masjid', NULL),
(497, 97, 'V06163', 1, '2021-09-17', 'Masjid', NULL),
(498, 98, 'D00999', 1, '2021-11-29', 'Evolution', NULL),
(499, 99, 'V05934', 1, '2021-06-14', 'GReen Lake View', NULL),
(500, 100, 'D00809', 1, '2021-08-28', 'Green Lake View', NULL),
(501, 101, 'H02779', 1, '2021-07-12', 'Green Lake View', NULL),
(502, 102, 'V06823', 1, '2021-06-18', 'EVOLUTION', NULL),
(503, 103, 'D00940', 1, '2021-05-30', 'EVOLUTION', NULL),
(504, 104, 'H03067', 1, '2021-11-22', 'Masjid', NULL),
(505, 106, 'H02654', 1, '2021-08-02', 'Masjid', NULL),
(506, 107, 'H02666', 1, '2021-06-17', 'Masjid', NULL),
(507, 108, 'H02664', 1, '2021-07-26', 'Masjid', NULL),
(508, 109, 'V06144', 1, '2021-06-13', 'Masjid', NULL),
(509, 110, 'H03079', 1, '2021-06-13', 'Masjid', NULL),
(510, 111, 'V07015', 1, '2021-08-05', 'Masjid', NULL),
(511, 112, 'D01043 ', 1, '2021-06-28', 'Evolution', NULL),
(512, 113, 'H02833', 1, '2021-07-01', 'Masjid', NULL),
(513, 114, 'H03018 ', 1, '2021-09-21', 'Masjid', NULL),
(514, 115, 'H02894', 1, '2021-06-17', 'Masjid', NULL),
(515, 116, 'H02835', 1, '2021-06-29', 'Masjid', NULL),
(516, 117, 'V07005', 1, '2021-08-04', 'Masjid', NULL),
(517, 118, 'H03077', 1, '2022-12-29', 'Masjid', NULL),
(518, 119, 'H03074', 1, '2022-01-04', 'Masjid', NULL),
(519, 120, 'H03075', 1, '2021-06-26', 'Masjid', NULL),
(520, 121, 'V07023', 1, '2021-07-06', 'Masjid', NULL),
(521, 123, 'V05662', 1, '2021-06-06', 'Masjid', NULL),
(522, 124, 'V05670', 1, '2021-06-18', 'Masjid', NULL),
(523, 125, 'H00945', 1, '2021-06-06', 'Masjid', NULL),
(524, 126, 'H03161', 1, '2021-06-14', 'Masjid', NULL),
(525, 127, 'H03041', 1, '2021-06-21', 'Masjid', NULL),
(526, 128, 'H03082', 1, '2021-06-13', 'Masjid', NULL),
(527, 129, 'V06610 ', 1, '2021-09-17', 'Masjid', NULL),
(528, 130, 'H03069', 1, '2021-10-18', 'Masjid', NULL),
(529, 131, 'V06613 ', 1, '2021-08-05', 'Masjid', NULL),
(530, 132, 'V05900', 1, '2021-05-15', 'Green Lake View', NULL),
(531, 134, 'H03065', 1, '2021-08-19', 'Masjid', NULL),
(532, 54, 'H03030', 1, '2021-07-26', 'Walwaikar', NULL),
(533, 55, 'V05401', 1, '2021-06-03', 'Walwaikar', NULL),
(534, 56, 'V06827', 1, '2021-07-01', 'CHANDRABHAGA', NULL),
(535, 57, 'V05867', 1, '2021-07-02', 'Walwaikar', NULL),
(536, 58, 'V06826', 1, '2021-09-07', 'CHANDRABHAGA', NULL),
(537, 59, 'V06043', 1, '2021-07-25', 'Walwaikar', NULL),
(538, 60, 'V06089', 1, '2021-06-21', 'Walwaikar', NULL),
(539, 61, 'V07203', 1, '2021-06-08', 'Walwaikar', NULL),
(540, 62, 'H02988 ', 1, '2021-05-30', 'Walwaikar', NULL),
(541, 63, 'D00947', 1, '2021-11-27', 'Walwaikar', NULL),
(542, 64, 'H02907', 1, '2021-07-02', 'Green Lake View', NULL),
(543, 65, 'H01556', 1, '2021-06-06', 'Walwaikar', NULL),
(544, 66, 'H03019', 1, '2021-09-24', 'Walwaikar', NULL),
(545, 67, 'H02986', 1, '2021-06-16', 'Walwaikar', NULL),
(546, 68, 'H03154', 1, '2021-07-08', 'Walwaikar', NULL),
(547, 69, 'H02996', 1, '2021-10-10', 'CHANDRABHAGA', NULL),
(548, 70, 'H00895', 1, '2021-06-25', 'Walwaikar', NULL),
(549, 71, 'H01040', 1, '2021-09-24', 'Walwaikar', NULL),
(550, 72, 'H02643', 1, '2021-07-16', 'Walwaikar', NULL),
(551, 73, 'H02708', 1, '2021-09-18', 'Walwaikar', NULL),
(552, 74, 'H01333', 1, '2021-06-29', 'Walwaikar', NULL),
(553, 75, 'H02800', 1, '2021-09-18', 'Walwaikar', NULL),
(554, 76, 'H01677', 1, '2021-05-31', 'Walwaikar', NULL),
(555, 77, 'H02994', 1, '2021-07-02', 'CHANDRABHAGA', NULL),
(556, 78, 'H03093', 1, '2021-06-12', 'Walwaikar', NULL),
(557, 79, 'H02995', 1, '2021-07-24', 'CHANDRABHAGA', NULL),
(558, 80, 'H02841', 1, '2021-12-03', 'Walwaikar', NULL),
(559, 81, 'H02891', 1, '2021-08-21', 'Walwaikar', NULL),
(560, 41, 'H02046', 1, '2021-06-06', 'Campal', NULL),
(561, 42, 'H00641', 1, '2021-06-24', 'Campal', NULL),
(562, 43, 'H02696', 1, '2021-06-30', 'Campal', NULL),
(563, 44, 'H02713', 1, '2021-07-02', 'Campal', NULL),
(564, 45, 'V04703', 1, '2021-06-28', 'Campal', NULL),
(565, 46, 'H02867', 1, '2021-06-17', 'CAMPAL', NULL),
(566, 47, 'H03094', 1, '2021-06-15', 'CAMPAL', NULL),
(567, 48, 'H02037', 1, '2021-06-06', 'Campal', NULL),
(568, 49, 'H02076', 1, '2021-06-06', 'Campal', NULL),
(569, 50, 'H02077', 1, '2021-06-06', 'Campal', NULL),
(570, 51, 'H01649', 1, '2021-06-06', 'Campal', NULL),
(571, 52, 'H02594', 1, '2021-07-09', 'Campal', NULL),
(572, 53, 'H02218', 1, '2021-08-08', 'Campal', NULL),
(573, 2, 'D01000', 1, '2021-07-07', 'OM SAI', NULL),
(574, 3, 'D01003', 1, '2021-08-13', 'OM SAI', NULL),
(575, 4, 'H03113', 1, '2021-08-13', 'OM SAI', NULL),
(576, 5, 'H03110', 1, '2021-08-05', 'OM SAI', NULL),
(577, 6, 'D00998', 1, '2021-06-23', 'OM SAI', NULL),
(578, 7, 'H03115', 1, '2022-01-07', 'OM SAI', NULL),
(579, 8, 'D00997', 1, '2022-01-11', 'OM SAI', NULL),
(580, 9, 'H03119', 1, '2021-08-05', 'OM SAI', NULL),
(581, 10, 'H03121', 1, '2021-06-21', 'OM SAI', NULL),
(582, 11, 'H03114', 1, '2021-05-25', 'OM SAI', NULL),
(583, 12, 'D01004', 1, '2021-07-06', 'OM SAI', NULL),
(584, 13, 'H03120', 1, '2021-11-13', 'OM SAI', NULL),
(585, 14, 'D01001', 1, '2021-10-06', 'OM SAI', NULL),
(586, 15, ' H03173', 1, '2021-08-17', 'OM SAI', NULL),
(587, 16, ' V07225', 1, '2021-06-20', 'OM SAI', NULL),
(588, 17, ' V07226', 1, '2021-05-27', 'OM SAI', NULL),
(589, 18, 'H03054', 1, '2022-02-11', 'OM SAI', NULL),
(590, 19, 'H03053', 1, '2021-11-08', 'OM SAI', NULL),
(591, 20, 'H03055', 1, '2021-07-14', 'OM SAI', NULL),
(592, 21, 'H03052', 1, '2021-06-29', 'OM SAI', NULL),
(593, 22, 'V07022', 1, '2022-08-12', 'OM SAI', NULL),
(594, 23, 'H03056', 1, '2021-06-11', 'OM SAI', NULL),
(595, 24, 'H03057', 1, '2021-10-27', 'OM SAI', NULL),
(596, 25, 'H03058', 1, '2022-02-07', 'OM SAI', NULL),
(597, 26, 'V07007', 1, '2021-06-22', 'OM SAI', NULL),
(598, 27, 'V07004', 1, '2021-08-26', 'OM SAI', NULL),
(599, 28, 'H03048', 1, '2022-08-26', 'OM SAI', NULL),
(600, 29, 'H03050', 1, '2022-01-18', 'OM SAI', NULL),
(601, 30, 'H03051', 1, '2022-01-17', 'OM SAI', NULL),
(602, 31, 'V07021', 1, '2021-06-25', 'OM SAI', NULL),
(603, 32, 'V07010', 1, '2021-08-09', 'OM SAI', NULL),
(604, 33, 'V07008', 1, '2022-08-04', 'OM SAI', NULL),
(605, 34, 'V07006', 1, '2022-01-02', 'OM SAI', NULL),
(606, 35, 'V07009', 1, '2021-08-22', 'OM SAI', NULL),
(607, 637, 'H00993', 2, '2021-08-29', 'Miramar', NULL),
(608, 638, 'H02852', 2, '2021-12-09', 'Miramar', NULL),
(609, 639, 'H01360', 2, '2021-08-29', 'Miramar', NULL),
(610, 640, 'D00319', 2, '2021-10-12', 'Succor', NULL),
(611, 642, 'H02628', 2, '2021-10-06', 'Madhuban', NULL),
(612, 644, 'H03117', 2, '2022-01-20', 'Miramar', NULL),
(613, 645, 'H03118', 2, '2022-01-20', 'Miramar', NULL),
(614, 646, 'H03124', 2, '2022-09-20', 'Miramar', NULL),
(615, 647, 'H01798', 2, '2021-10-15', 'Miramar', NULL),
(616, 648, 'H03022', 2, '2022-01-10', 'Miramar', NULL),
(617, 649, 'H03105', 2, '2021-10-08', 'Miramar', NULL),
(618, 650, 'H03104', 2, '2023-03-25', 'Miramar', NULL),
(619, 651, 'H03024', 2, '2021-10-04', 'Miramar', NULL),
(620, 652, 'GP 659', 2, '2021-09-15', 'Miramar', NULL),
(621, 653, 'D00306', 2, '2021-08-29', 'Miramar', NULL),
(622, 654, 'H01769', 2, '2021-08-29', 'Miramar', NULL),
(623, 655, 'D00650', 2, '2021-08-29', 'Madhuban', NULL),
(624, 657, 'H02890', 2, '2021-08-28', 'Miramar', NULL),
(625, 660, 'H02843', 2, '2021-09-08', 'Madhuban', NULL),
(626, 661, 'GP 981', 2, '2021-09-09', 'Madhuban', NULL),
(627, 662, 'H03028', 2, '2021-09-24', 'Miramar', NULL),
(628, 663, 'H03021', 2, '2021-10-13', 'Miramar', NULL),
(629, 664, 'H03026', 2, '2022-04-18', 'Miramar', NULL),
(630, 665, 'H03023', 2, '2021-10-05', 'Miramar', NULL),
(631, 666, 'H01773', 2, '2021-10-19', 'Miramar', NULL),
(632, 579, 'V01961', 2, '2021-08-31', 'Taleigao', NULL),
(633, 581, 'V06632', 2, '2021-09-02', 'TALEIGAO', NULL),
(634, 582, 'V00455', 2, '2021-08-20', 'Taleigao', NULL),
(635, 583, 'V04404', 2, '2021-09-20', 'Taleigao', NULL),
(636, 584, 'D00621', 2, '2021-09-02', 'TALEIGAO', NULL),
(637, 585, 'V04372', 2, '2021-06-29', 'Taleigao', NULL),
(638, 586, 'V04681', 2, '2021-09-20', 'Taleigao', NULL),
(639, 587, 'D00065', 2, '2021-08-29', 'Taleigao', NULL),
(640, 588, 'V06664', 2, '2021-09-01', 'TALEIGAO', NULL),
(641, 589, 'V07273', 2, '2022-01-07', 'TALEIGAO', NULL),
(642, 590, 'V04708', 2, '2021-09-01', 'Taleigao', NULL),
(643, 591, 'V06346 ', 2, '2021-12-29', 'Taleigao', NULL),
(644, 592, 'V04317', 2, '2021-11-06', 'Taleigao', NULL),
(645, 593, 'V02886', 2, '2021-08-29', 'Taleigao', NULL),
(646, 594, ' V06695', 2, '2021-12-07', 'Taleigao', NULL),
(647, 595, 'V03936', 2, '2021-09-07', 'Taleigao', NULL),
(648, 596, 'V05500', 2, '2021-10-02', 'Taleigao', NULL),
(649, 597, 'V06180', 2, '2021-11-09', 'Taleigao', NULL),
(650, 598, 'V06179', 2, '2021-10-07', 'Taleigao', NULL),
(651, 599, 'V04132', 2, '2021-09-20', 'Taleigao', NULL),
(652, 601, 'V05721', 2, '2021-10-31', 'Taleigao', NULL),
(653, 602, 'D00607', 2, '2021-08-29', 'Taleigao', NULL),
(654, 603, 'V07029', 2, '2021-09-25', 'Green Lake View', NULL),
(655, 604, 'D00818', 2, '2021-08-28', 'Taleigao', NULL),
(656, 605, 'D00586', 2, '2021-08-30', 'Taleigao', NULL),
(657, 606, 'V03246', 2, '2021-09-20', 'Taleigao', NULL),
(658, 607, 'D00612', 2, '2021-08-31', 'Taleigao', NULL),
(659, 608, 'D00821', 2, '2021-10-05', 'Taleigao', NULL),
(660, 609, 'V04234', 2, '2021-08-29', 'Taleigao', NULL),
(661, 610, 'V04226', 2, '2021-08-29', 'Taleigao', NULL),
(662, 611, 'V04028', 2, '2021-08-29', 'Taleigao', NULL),
(663, 612, 'V04571', 2, '2021-08-29', 'Taleigao', NULL),
(664, 613, 'V06815', 2, '2021-09-17', 'TALEIGAO', NULL),
(665, 614, 'V07170', 2, '2022-04-01', 'TALEIGAO', NULL),
(666, 615, 'V06855', 2, '2021-11-28', 'TALEIGAO', NULL),
(667, 616, 'V06881', 2, '2021-09-17', 'TALEIGAO', NULL),
(668, 617, 'V06790', 2, '2021-10-29', 'Taleigao', NULL),
(669, 618, 'V06789', 2, '2021-10-26', 'Taleigao', NULL),
(670, 620, 'V06787', 2, '2022-01-05', 'Taleigao', NULL),
(671, 621, ' V06910', 2, '2021-10-19', 'TALEIGAO', NULL),
(672, 622, 'V06705', 2, '2021-09-13', 'Taleigao', NULL),
(673, 623, 'V06706', 2, '2021-09-14', 'Taleigao', NULL),
(674, 624, 'D01026', 2, '2021-11-16', 'TALEIGAO', NULL),
(675, 625, 'V06879', 2, '2021-09-13', 'TALEIGAO', NULL),
(676, 626, 'V06741', 2, '2021-11-20', 'Taleigao', NULL),
(677, 627, 'V06676', 2, '2021-11-01', 'Taleigao', NULL),
(678, 628, 'V06917', 2, '2021-11-24', 'TALEIGAO', NULL),
(679, 629, 'V06530', 2, '2021-09-22', 'Green Lake View', NULL),
(680, 630, 'V06652', 2, '2022-08-17', 'Walwaikar', NULL),
(681, 631, 'V07092', 2, '2021-09-25', 'TALEIGAO', NULL),
(682, 632, ' V07229', 2, '2021-08-22', 'TALEIGAO', NULL),
(683, 633, ' H03167', 2, '2021-08-27', 'TALEIGAO', NULL),
(684, 634, ' H03169', 2, '2021-09-18', 'TALEIGAO', NULL),
(685, 635, ' H03170', 2, '2021-08-18', 'TALEIGAO', NULL),
(686, 636, ' V07227', 2, '2021-09-21', 'TALEIGAO', NULL),
(687, 567, ' D00870', 2, '2021-11-17', 'Masjid', NULL),
(688, 568, 'V06485', 2, '2021-09-15', 'Masjid', NULL),
(689, 569, 'V06484', 2, '2022-06-21', 'Masjid', NULL),
(690, 570, 'V06874', 2, '2022-03-11', 'Evolution', NULL),
(691, 571, 'V06862', 2, '2022-01-09', 'Evolution', NULL),
(692, 573, 'V03853', 2, '2021-11-01', 'Masjid', NULL),
(693, 576, 'V06767', 2, '2021-10-26', 'Masjid', NULL),
(694, 577, 'V06587', 2, '2021-09-06', 'Masjid', NULL),
(695, 578, 'V06900', 2, '2021-11-08', 'Evolution', NULL),
(696, 558, 'V07180', 2, '2023-05-29', 'Corlim', NULL),
(697, 559, 'V07195', 2, '2021-10-06', 'Corlim', NULL),
(698, 560, 'V07214', 2, '2021-11-11', 'Corlim', NULL),
(699, 561, 'V06531', 2, '2022-01-06', 'Corlim', NULL),
(700, 562, 'V07270', 2, '2022-01-31', 'Corlim', NULL),
(701, 563, 'V07192', 2, '2021-03-20', 'Corlim', NULL),
(702, 564, 'V07284', 2, '2021-11-13', 'Corlim', NULL),
(703, 565, 'H02844', 2, '2021-09-23', 'Corlim', NULL),
(704, 566, 'V07313', 2, '2022-02-26', 'Corlim', NULL),
(705, 500, 'D00630', 2, '2021-09-13', 'Succor', NULL),
(706, 501, 'D00432', 2, '2021-09-12', 'Succor', NULL),
(707, 502, 'D00631', 2, '2021-08-29', 'Succor', NULL),
(708, 503, 'H02850', 2, '2022-07-13', 'Succor', NULL),
(709, 504, 'H02832', 2, '2022-07-05', 'Succor', NULL),
(710, 505, 'H02839', 2, '2022-04-26', 'Succor', NULL),
(711, 506, 'D00609', 2, '2021-08-29', 'Madhuban', NULL),
(712, 507, 'V06873', 2, '2021-07-13', 'SUCCOUR', NULL),
(713, 508, 'V06791 ', 2, '2021-12-22', 'Succor', NULL),
(714, 509, 'D00939', 2, '2022-08-22', 'Succor', NULL),
(715, 510, 'GP 713', 2, '2022-07-02', 'Succor', NULL),
(716, 511, 'H02981 ', 2, '2021-10-11', 'Succor', NULL),
(717, 512, 'D00932', 2, '2021-12-06', 'Succor', NULL),
(718, 514, 'V06621', 2, '2021-09-30', 'Succor', NULL),
(719, 515, 'D00910', 2, '2022-03-05', 'Succor', NULL),
(720, 516, 'D00634', 2, '2021-08-29', 'Succor', NULL),
(721, 517, 'V05566', 2, '2021-08-29', 'Succor', NULL),
(722, 518, 'D00610', 2, '2021-08-29', 'Succor', NULL),
(723, 519, 'D00911', 2, '2021-07-05', 'Succor', NULL),
(724, 521, 'V03821', 2, '2021-08-30', 'Madhuban', NULL),
(725, 522, 'V03806', 2, '2021-08-30', 'Madhuban', NULL),
(726, 523, 'V06809', 2, '2021-09-21', 'Succor', NULL),
(727, 525, 'D00326', 2, '2021-08-30', 'Miramar', NULL),
(728, 526, 'H02711', 2, '2021-09-06', 'Succor', NULL),
(729, 528, 'V06650', 2, '2021-10-20', 'Madhuban', NULL),
(730, 529, 'V06648', 2, '2021-09-29', 'Succor', NULL),
(731, 530, 'V06788 ', 2, '2021-09-03', 'Succor', NULL),
(732, 531, 'H02950', 2, '2021-11-03', 'Succor', NULL),
(733, 532, 'D00909', 2, '2021-12-07', 'Succor', NULL),
(734, 533, 'D00934 ', 2, '2021-11-22', 'Succor', NULL),
(735, 534, 'H02943', 2, '2021-12-23', 'Succor', NULL),
(736, 535, 'H02942', 2, '2021-12-07', 'Succor', NULL),
(737, 536, 'V06865', 2, '2021-12-02', 'SUCCOUR', NULL),
(738, 537, 'V06875', 2, '2021-09-27', 'SUCCOUR', NULL),
(739, 538, ' V06798', 2, '2022-01-14', 'Succor', NULL),
(740, 539, ' D00936', 2, '2022-01-18', 'Succor', NULL),
(741, 540, 'V06804', 2, '2021-09-09', 'Succor', NULL),
(742, 541, 'D00933 ', 2, '2021-11-22', 'Succor', NULL),
(743, 542, 'V06805 ', 2, '2022-03-03', 'Succor', NULL),
(744, 543, 'V06803 ', 2, '2021-11-29', 'Succor', NULL),
(745, 544, 'H02983', 2, '2021-09-13', 'Succor', NULL),
(746, 545, 'D00937 ', 2, '2021-11-29', 'Succor', NULL),
(747, 546, 'D00941', 2, '2022-03-04', 'SUCCOUR', NULL),
(748, 547, 'V06821', 2, '2022-01-27', 'SUCCOUR', NULL),
(749, 548, 'V06820', 2, '2021-12-07', 'SUCCOUR', NULL),
(750, 549, 'V06822', 2, '2021-09-17', 'SUCCOUR', NULL),
(751, 550, 'V06590', 2, '2022-02-10', 'Succor', NULL),
(752, 551, 'H02992', 2, '2021-09-25', 'SUCCOUR', NULL),
(753, 552, 'V06816', 2, '2021-10-11', 'SUCCOUR', NULL),
(754, 553, 'V06825', 2, '2021-09-22', 'SUCCOUR', NULL),
(755, 554, 'H02993', 2, '2022-10-29', 'SUCCOUR', NULL),
(756, 555, 'V06870', 2, '2022-03-09', 'SUCCOUR', NULL),
(757, 556, 'V06883', 2, '2021-10-09', 'SUCCOUR', NULL),
(758, 557, 'V06867', 2, '2022-01-14', 'SUCCOUR', NULL),
(759, 421, 'V05624', 2, '2021-10-14', 'Walwaikar', NULL),
(760, 422, 'D00589', 2, '2021-08-27', 'Walwaikar', NULL),
(761, 423, 'V06651', 2, '2021-08-21', 'Walwaikar', NULL),
(762, 424, 'V05962', 2, '2021-11-19', 'Walwaikar', NULL),
(763, 425, 'V06894', 2, '2021-10-12', 'EVOLUTION', NULL),
(764, 426, ' H03172', 2, '2022-01-07', 'EVOLUTION', NULL),
(765, 428, ' V07230', 2, '2021-09-09', 'EVOLUTION', NULL),
(766, 429, ' H03171', 2, '2021-11-30', 'EVOLUTION', NULL),
(767, 430, ' V07233', 2, '2021-08-06', 'EVOLUTION', NULL),
(768, 431, ' V07235', 2, '2021-10-13', 'EVOLUTION', NULL),
(769, 432, 'V07305', 2, '2023-07-21', 'EVOLUTION', NULL),
(770, 433, ' V07231', 2, '2021-09-03', 'EVOLUTION', NULL),
(771, 434, ' V07232', 2, '2022-01-15', 'EVOLUTION', NULL),
(772, 435, ' V07228', 2, '2021-09-17', 'EVOLUTION', NULL),
(773, 436, ' H03168', 2, '2021-11-16', 'EVOLUTION', NULL),
(774, 437, ' H03174', 2, '2021-08-26', 'EVOLUTION', NULL),
(775, 438, 'V07129', 2, '2022-11-25', 'Evolution', NULL),
(776, 439, 'V07133', 2, '2022-08-16', 'Evolution', NULL),
(777, 440, 'V05769', 2, '2021-09-13', 'Green Lake View', NULL),
(778, 441, 'V06926', 2, '2021-09-18', 'Evolution', NULL),
(779, 442, 'V06262', 2, '2022-04-18', 'Green Lake View', NULL),
(780, 443, 'V07308 ', 2, '2021-10-23', 'EVOLUTION', NULL),
(781, 444, 'V06639', 2, '2021-08-23', 'Evolution', NULL),
(782, 445, 'V07307 ', 2, '2021-06-19', 'EVOLUTION', NULL),
(783, 446, 'V07140', 2, '2021-09-22', 'Evolution', NULL),
(784, 447, 'V05992', 2, '2021-09-09', 'Green Lake View', NULL),
(785, 448, 'V07061', 2, '2021-12-18', 'EVOLUTION', NULL),
(786, 449, 'V06938 ', 2, '2021-09-29', 'Green Lake View', NULL),
(787, 452, 'V06694', 2, '2021-11-15', 'Walwaikar', NULL),
(788, 453, 'H02941', 2, '2021-11-27', 'Evolution', NULL),
(789, 454, 'H02924', 2, '2021-09-22', 'Evolution', NULL),
(790, 455, 'V02864', 2, '2021-08-28', 'Walwaikar', NULL),
(791, 456, 'H01721', 2, '2021-09-27', 'Walwaikar', NULL),
(792, 457, 'D00834', 2, '2021-10-05', 'Walwaikar', NULL),
(793, 458, 'V04591', 2, '2021-09-07', 'Walwaikar', NULL),
(794, 459, 'H00964', 2, '2021-09-19', 'Walwaikar', NULL),
(795, 460, 'V06614 ', 2, '2021-10-06', 'Masjid', NULL),
(796, 461, 'H02927', 2, '2021-07-24', 'Evolution', NULL),
(797, 462, 'D00914', 2, '2021-10-19', 'Evolution', NULL),
(798, 463, 'D00912', 2, '2021-12-06', 'Evolution', NULL),
(799, 464, 'D00915', 2, '2022-12-14', 'Evolution', NULL),
(800, 466, 'V06895', 2, '2022-07-21', 'EVOLUTION', NULL),
(801, 467, 'D00960', 2, '2021-09-25', 'EVOLUTION', NULL),
(802, 468, 'V07150', 2, '2021-10-02', 'EVOLUTION', NULL),
(803, 469, 'H02881', 2, '2022-07-02', 'Green Lake View', NULL),
(804, 470, 'V06653', 2, '2021-11-17', 'Green Lake View', NULL),
(805, 471, 'V06640', 2, '2021-11-06', 'Evolution', NULL),
(806, 473, 'V03671', 2, '2021-09-20', 'Walwaikar', NULL),
(807, 474, 'H03111', 2, '2021-10-28', 'Evolution', NULL),
(808, 475, 'D01005', 2, '2021-11-30', 'Evolution', NULL),
(809, 476, 'H02896', 2, '2022-01-10', 'Evolution', NULL),
(810, 477, 'V07306 ', 2, '2021-12-01', 'EVOLUTION', NULL),
(811, 479, 'V06792', 2, '2021-11-26', 'Evolution', NULL),
(812, 480, 'H02985 ', 2, '2021-10-04', 'Evolution', NULL),
(813, 481, 'D00938', 2, '2022-01-05', 'Evolution', NULL),
(814, 482, 'V06799', 2, '2022-08-22', 'Evolution', NULL),
(815, 483, 'V06813', 2, '2021-10-28', 'EVOLUTION', NULL),
(816, 484, 'H03002', 2, '2021-09-17', 'Masjid', NULL),
(817, 486, 'V06340', 2, '2021-08-30', 'Green Lake View', NULL),
(818, 487, 'V06393', 2, '2021-09-01', 'Green Lake View', NULL),
(819, 488, 'V06876', 2, '2022-02-03', 'Evolution', NULL),
(820, 489, 'D01008', 2, '2021-09-11', 'Evolution', NULL),
(821, 491, 'V06908', 2, '2021-11-01', 'Evolution', NULL),
(822, 492, 'V06907 ', 2, '2021-11-08', 'Evolution', NULL),
(823, 493, 'V06913', 2, '2021-11-16', 'Evolution', NULL),
(824, 494, 'V06916', 2, '2021-09-17', 'EVOLUTION', NULL),
(825, 495, 'V06931', 2, '2022-12-05', 'EVOLUTION', NULL),
(826, 496, 'V07020', 2, '2021-09-09', 'Evolution', NULL),
(827, 497, 'V07122', 2, '2021-09-20', 'Evolution', NULL),
(828, 498, 'V07191', 2, '2021-09-25', 'EVOLUTION', NULL),
(829, 499, 'H03106', 2, '2021-09-29', 'EVOLUTION', NULL),
(830, 374, 'V07104', 2, '2021-10-31', 'Green Lake View', NULL),
(831, 375, 'H02621', 2, '2021-11-06', 'Green Lake View', NULL),
(832, 376, 'H02745', 2, '2021-10-26', 'Green Lake View', NULL),
(833, 377, 'V02479', 2, '2021-08-31', 'Green Lake View', NULL),
(834, 378, 'V04392', 2, '2021-11-30', 'Green Lake View', NULL),
(835, 379, 'H02129', 2, '2021-08-19', 'Green Lake View', NULL),
(836, 380, 'V07172', 2, '2021-12-11', 'Green Lake View', NULL),
(837, 381, 'V06242', 2, '2021-09-01', 'Green Lake View', NULL),
(838, 382, 'V07266', 2, '2021-06-07', 'Green Lake View', NULL),
(839, 383, 'V06990', 2, '2021-09-30', 'Green Lake View', NULL),
(840, 384, 'V06991', 2, '2021-09-17', 'Green Lake View', NULL),
(841, 385, 'D00986', 2, '2021-10-04', 'Green Lake View', NULL),
(842, 386, 'H03195', 2, '2021-10-17', 'Green Lake View', NULL),
(843, 387, 'V07280 ', 2, '2021-10-06', 'Green Lake View', NULL),
(844, 388, 'V06090', 2, '2021-09-15', 'Green Lake View', NULL),
(845, 389, 'V04342', 2, '2021-08-31', 'Green Lake View', NULL),
(846, 390, 'H03196', 2, '2021-08-31', 'Green Lake View', NULL),
(847, 391, 'H03194', 2, '2021-10-05', 'Green Lake View', NULL),
(848, 392, ' V07281', 2, '2021-10-03', 'Green Lake View', NULL),
(849, 393, 'V06996', 2, '2021-09-25', 'Green Lake View', NULL),
(850, 394, 'H03046', 2, '2021-09-25', 'Green Lake View', NULL),
(851, 395, 'H03045', 2, '2021-09-25', 'Green Lake View', NULL),
(852, 396, 'V04676', 2, '2021-08-31', 'Green Lake View', NULL),
(853, 397, 'H02676', 2, '2021-08-31', 'Green Lake View', NULL),
(854, 398, 'V05581', 2, '2021-08-31', 'Green Lake View', NULL),
(855, 399, 'V04308', 2, '2021-08-29', 'RMJ', NULL),
(856, 400, 'V06615', 2, '2021-04-30', 'Green Lake View', NULL),
(857, 402, 'VDP267', 2, '2021-08-29', 'RMJ', NULL),
(858, 403, 'V06975', 2, '2022-01-27', 'Green Lake View', NULL),
(859, 404, 'V05954', 2, '2021-11-10', 'Green Lake View', NULL),
(860, 405, 'H02608', 2, '2021-09-17', 'Green Lake View', NULL),
(861, 406, 'V06691', 2, '2022-06-22', 'Green Lake View', NULL),
(862, 407, 'V05970', 2, '2021-12-23', 'Green Lake View', NULL),
(863, 408, 'V04523', 2, '2021-08-29', 'RMJ', NULL),
(864, 409, 'H03000', 2, '2021-12-03', 'Green Lake View', NULL),
(865, 410, 'V06416', 2, '2021-09-06', 'Green Lake View', NULL),
(866, 411, 'V04674', 2, '2021-08-29', 'Taleigao', NULL),
(867, 412, 'H01820', 2, '2021-08-30', 'Taleigao', NULL),
(868, 413, 'V06215', 2, '2021-11-13', 'Taleigao', NULL),
(869, 414, 'V05971', 2, '2021-08-04', 'Green Lake View', NULL),
(870, 415, 'V06027', 2, '2021-10-20', 'Green Lake View', NULL),
(871, 416, 'V07149', 2, '2022-01-20', 'Green Lake View', NULL),
(872, 417, 'V05564', 2, '2021-08-30', 'RMJ', NULL),
(873, 418, 'D00283', 2, '2021-08-31', 'Green Lake View', NULL),
(874, 419, 'H03096', 2, '2021-10-07', 'Green Lake View', NULL),
(875, 135, 'H02107', 2, '2021-09-12', 'Madhuban', NULL),
(876, 136, 'V05426', 2, '2021-08-29', 'Madhuban', NULL),
(877, 137, 'V05423', 2, '2021-09-12', 'Madhuban', NULL),
(878, 138, 'V07309', 2, '2022-04-26', 'Madhuban', NULL),
(879, 139, 'V07174', 2, '2021-11-08', 'Madhuban', NULL),
(880, 140, 'V07175', 2, '2021-11-16', 'Madhuban', NULL),
(881, 142, 'V06520', 2, '2021-10-29', 'Madhuban', NULL),
(882, 143, 'V06275', 2, '2022-04-12', 'Succor', NULL),
(883, 144, 'H02840', 2, '2021-08-14', 'Madhuban', NULL),
(884, 145, 'D00427', 2, '2021-08-31', 'Madhuban', NULL),
(885, 146, 'D00428', 2, '2021-08-29', 'Madhuban', NULL),
(886, 147, 'D00437', 2, '2021-08-29', 'Madhuban', NULL),
(887, 148, 'V07194', 2, '2021-10-27', 'Madhuban', NULL),
(888, 149, 'V06591', 2, '2021-12-22', 'Madhuban', NULL),
(889, 151, 'V06899', 2, '2021-10-02', 'Madhuban', NULL),
(890, 152, 'V06286', 2, '2021-09-15', 'Madhuban', NULL),
(891, 153, 'V06287', 2, '2021-09-08', 'Madhuban', NULL),
(892, 155, 'D00922', 2, '2021-09-06', 'Madhuban', NULL),
(893, 156, 'H03152', 2, '2021-11-30', 'Madhuban', NULL),
(894, 157, 'H01498', 2, '2021-08-29', 'Madhuban', NULL),
(895, 158, 'V04301', 2, '2021-08-29', 'Madhuban', NULL),
(896, 159, 'H02069', 2, '2021-10-19', 'Madhuban', NULL),
(897, 162, 'V04302', 2, '2021-08-29', 'Madhuban', NULL),
(898, 163, 'H02882', 2, '2021-10-27', 'Madhuban', NULL),
(899, 164, 'V07298', 2, '2022-01-03', 'Madhuban', NULL),
(900, 165, 'V03896', 2, '2021-09-24', 'Madhuban', NULL),
(901, 166, 'V04440', 2, '2021-09-27', 'Madhuban', NULL);
INSERT INTO `vaccination` (`vaccination_id`, `emp_id`, `emp_code`, `category_id`, `date_of_administration`, `location`, `date_of_next_dose`) VALUES
(902, 167, 'V04300', 2, '2021-08-29', 'Madhuban', NULL),
(903, 168, 'V03714', 2, '2021-10-31', 'Madhuban', NULL),
(904, 169, 'V04415', 2, '2021-08-29', 'Madhuban', NULL),
(905, 170, 'V04438', 2, '2021-08-29', 'Madhuban', NULL),
(906, 171, 'V04437', 2, '2021-09-27', 'Madhuban', NULL),
(907, 172, 'V04471', 2, '2021-08-29', 'Madhuban', NULL),
(908, 173, 'V04565', 2, '2021-08-29', 'Madhuban', NULL),
(909, 174, 'D00620', 2, '2021-08-29', 'Madhuban', NULL),
(910, 175, 'H00927', 2, '2021-10-26', 'Madhuban', NULL),
(911, 176, 'D00825', 2, '2022-01-05', 'Madhuban', NULL),
(912, 178, 'H02884', 2, '2021-09-14', 'Madhuban', NULL),
(913, 179, 'H03003 ', 2, '2021-11-09', 'Madhuban', NULL),
(914, 180, 'V03270', 2, '2021-08-29', 'Madhuban', NULL),
(915, 181, 'D00921', 2, '2021-09-16', 'Madhuban', NULL),
(916, 182, 'H03150', 2, '2021-12-22', 'Madhuban', NULL),
(917, 183, 'H03192', 2, '2021-09-21', 'Madhuban', NULL),
(918, 184, 'V05235', 2, '2021-10-04', 'Madhuban', NULL),
(919, 185, 'V06391', 2, '2021-09-08', 'Madhuban', NULL),
(920, 188, 'V03190', 2, '2021-09-27', 'Madhuban', NULL),
(921, 189, 'H03147', 2, '2022-11-25', 'Madhuban', NULL),
(922, 190, 'V05043', 2, '2021-09-17', 'Madhuban', NULL),
(923, 191, 'H03001', 2, '2021-10-22', 'Madhuban', NULL),
(924, 192, 'V03187', 2, '2021-09-16', 'Madhuban', NULL),
(925, 193, 'V07271', 2, '2022-05-11', 'Madhuban', NULL),
(926, 194, 'V03189', 2, '2021-09-20', 'Madhuban', NULL),
(927, 195, 'V03974', 2, '2021-08-29', 'Madhuban', NULL),
(928, 196, 'V03984', 2, '2021-08-29', 'Madhuban', NULL),
(929, 197, 'V03986', 2, '2021-08-29', 'Madhuban', NULL),
(930, 198, 'V06935', 2, '2021-09-06', 'Madhuban', NULL),
(931, 199, 'D00962 ', 2, '2021-09-06', 'Madhuban', NULL),
(932, 200, 'V07257', 2, '2022-05-02', 'Madhuban', NULL),
(933, 201, 'V01832', 2, '2021-08-30', 'Madhuban', NULL),
(934, 202, 'V06283', 2, '2021-09-23', 'Madhuban', NULL),
(935, 203, 'V06282', 2, '2021-09-23', 'Madhuban', NULL),
(936, 204, 'V07097', 2, '2021-09-09', 'Madhuban', NULL),
(937, 205, 'V04207', 2, '2021-10-15', 'Madhuban', NULL),
(938, 206, 'D01053', 2, '2021-11-09', 'Madhuban', NULL),
(939, 207, 'D01052 ', 2, '2021-09-28', 'Madhuban', NULL),
(940, 208, 'D01055 ', 2, '2021-09-28', 'Madhuban', NULL),
(941, 209, 'V04798', 2, '2021-08-29', 'Madhuban', NULL),
(942, 210, 'V06026', 2, '2021-09-14', 'Madhuban', NULL),
(943, 211, 'V04784', 2, '2021-10-04', 'Madhuban', NULL),
(944, 212, 'D01054', 2, '2022-09-27', 'Madhuban', NULL),
(945, 213, 'V03876', 2, '2021-08-29', 'Madhuban', NULL),
(946, 214, 'V06764', 2, '2021-09-09', 'Madhuban', NULL),
(947, 215, 'V05991', 2, '2021-11-20', 'Madhuban', NULL),
(948, 216, 'D00780', 2, '2021-10-20', 'Madhuban', NULL),
(949, 217, ' H03165', 2, '2021-11-15', 'Madhuban', NULL),
(950, 219, 'D01027', 2, '2021-09-25', 'Madhuban', NULL),
(951, 220, 'H02636', 2, '2021-09-24', 'Madhuban', NULL),
(952, 221, 'H02106', 2, '2021-09-27', 'Madhuban', NULL),
(953, 223, 'H03193', 2, '2021-09-14', 'Madhuban', NULL),
(954, 224, 'V07301', 2, '2021-09-13', 'Madhuban', NULL),
(955, 225, 'V07302', 2, '2021-09-13', 'Madhuban', NULL),
(956, 226, 'D01031', 2, '2022-04-07', 'Madhuban', NULL),
(957, 227, 'V05892', 2, '2021-08-30', 'Madhuban', NULL),
(958, 228, 'V05891', 2, '2021-09-27', 'Madhuban', NULL),
(959, 230, 'V05887', 2, '2021-09-24', 'Madhuban', NULL),
(960, 231, 'V06413', 2, '2022-04-29', 'Madhuban', NULL),
(961, 232, 'D01044 ', 2, '2023-01-13', 'Madhuban', NULL),
(962, 233, 'D01046', 2, '2021-08-28', 'Madhuban', NULL),
(963, 234, 'D01045 ', 2, '2021-10-20', 'Madhuban', NULL),
(964, 235, 'V05911', 2, '2021-09-20', 'Madhuban', NULL),
(965, 236, 'V05908', 2, '2022-01-27', 'Madhuban', NULL),
(966, 237, 'V07070', 2, '2021-08-29', 'Madhuban', NULL),
(967, 238, 'V05904', 2, '2021-10-14', 'Madhuban', NULL),
(968, 239, 'V05930', 2, '2021-09-02', 'Madhuban', NULL),
(969, 240, 'H02635', 2, '2021-09-22', 'Madhuban', NULL),
(970, 241, 'V07120', 2, '2021-11-15', 'Madhuban', NULL),
(971, 242, 'H02633', 2, '2021-09-15', 'Madhuban', NULL),
(972, 243, 'V05917', 2, '2021-09-23', 'Madhuban', NULL),
(973, 244, 'V05915', 2, '2021-09-03', 'Madhuban', NULL),
(974, 245, 'V05916', 2, '2021-09-01', 'Madhuban', NULL),
(975, 246, 'V05914', 2, '2021-09-19', 'Madhuban', NULL),
(976, 247, 'V07100', 2, '2021-10-08', 'Madhuban', NULL),
(977, 248, 'V07099', 2, '2021-10-25', 'Madhuban', NULL),
(978, 249, 'H02978', 2, '2021-11-03', 'Madhuban', NULL),
(979, 250, 'V06395', 2, '2021-09-15', 'Madhuban', NULL),
(980, 251, 'D00660', 2, '2021-08-29', 'Madhuban', NULL),
(981, 252, 'V05604', 2, '2021-11-02', 'Madhuban', NULL),
(982, 253, 'V06740', 2, '2021-09-15', 'Madhuban', NULL),
(983, 254, 'V06736', 2, '2021-12-23', 'Madhuban', NULL),
(984, 255, 'V06743', 2, '2022-09-29', 'Madhuban', NULL),
(985, 257, 'V07176', 2, '2021-09-17', 'Madhuban', NULL),
(986, 258, 'GP 975', 2, '2021-09-14', 'Madhuban', NULL),
(987, 259, 'H02933', 2, '2021-10-25', 'Madhuban', NULL),
(988, 261, 'H02930', 2, '2022-03-21', 'Madhuban', NULL),
(989, 262, 'H02929', 2, '2022-02-17', 'Madhuban', NULL),
(990, 263, 'V05394', 2, '2021-08-29', 'Madhuban', NULL),
(991, 264, 'H02079', 2, '2021-08-29', 'Madhuban', NULL),
(992, 265, 'V05393', 2, '2021-09-30', 'Madhuban', NULL),
(993, 266, 'V06735', 2, '2022-09-01', 'Madhuban', NULL),
(994, 267, 'V05981', 2, '2021-10-25', 'Madhuban', NULL),
(995, 268, 'D00641', 2, '2021-08-29', 'Madhuban', NULL),
(996, 269, 'V06933', 2, '2021-09-25', 'Madhuban', NULL),
(997, 270, 'D00976', 2, '2022-03-31', 'Madhuban', NULL),
(998, 271, 'D00653', 2, '2021-08-29', 'Madhuban', NULL),
(999, 272, 'D00703', 2, '2021-08-31', 'Madhuban', NULL),
(1000, 273, 'D00942', 2, '2021-09-25', 'Succor', NULL),
(1001, 275, ' D01049', 2, '2021-12-27', 'Madhuban', NULL),
(1002, 276, 'V07286', 2, '2021-10-30', 'Madhuban', NULL),
(1003, 277, 'V03713', 2, '2021-08-29', 'Madhuban', NULL),
(1004, 278, 'D00654', 2, '2021-10-15', 'Madhuban', NULL),
(1005, 279, 'V07043', 2, '2023-02-01', 'Madhuban', NULL),
(1006, 280, 'V07044', 2, '2023-02-01', 'Madhuban', NULL),
(1007, 281, 'V07052', 2, '2021-11-16', 'Madhuban', NULL),
(1008, 282, 'V06950', 2, '2021-11-15', 'Madhuban', NULL),
(1009, 283, 'V03242', 2, '2021-08-26', 'Madhuban', NULL),
(1010, 284, 'V03772', 2, '2021-08-26', 'Madhuban', NULL),
(1011, 285, 'V06699', 2, '2022-05-26', 'Madhuban', NULL),
(1012, 286, 'D01030', 2, '2021-08-26', 'Madhuban', NULL),
(1013, 287, 'V07148', 2, '2021-12-20', 'Madhuban', NULL),
(1014, 288, 'V03626', 2, '2021-10-26', 'Madhuban', NULL),
(1015, 289, 'D00599', 2, '2021-09-27', 'Madhuban', NULL),
(1016, 290, 'V06483', 2, '2021-10-12', 'Madhuban', NULL),
(1017, 291, 'V05862', 2, '2021-10-13', 'Madhuban', NULL),
(1018, 292, 'D00735', 2, '2021-08-29', 'Madhuban', NULL),
(1019, 295, 'V06318', 2, '2021-09-19', 'Madhuban', NULL),
(1020, 296, 'V07293', 2, '2021-09-23', 'Madhuban', NULL),
(1021, 297, 'V00646', 2, '2021-08-29', 'Madhuban', NULL),
(1022, 298, 'V02089', 2, '2021-08-29', 'Madhuban', NULL),
(1023, 299, 'V05380', 2, '2021-08-29', 'Madhuban', NULL),
(1024, 300, 'V05534', 2, '2021-10-12', 'Madhuban', NULL),
(1025, 301, 'V05959', 2, '2021-10-04', 'Madhuban', NULL),
(1026, 302, 'V05960', 2, '2021-09-24', 'Madhuban', NULL),
(1027, 303, 'D00952', 2, '2022-04-25', 'Madhuban', NULL),
(1028, 304, 'V05939', 2, '2021-10-05', 'Madhuban', NULL),
(1029, 305, 'DS0222', 2, '2021-09-09', 'Madhuban', NULL),
(1030, 306, 'H03146', 2, '2022-01-18', 'Madhuban', NULL),
(1031, 307, 'H03166', 2, '2021-11-07', 'Madhuban', NULL),
(1032, 308, 'V06573', 2, '2022-01-21', 'Madhuban', NULL),
(1033, 309, 'V06568', 2, '2022-01-21', 'Madhuban', NULL),
(1034, 310, 'V06567', 2, '2021-11-23', 'Madhuban', NULL),
(1035, 312, 'V06569', 2, '2022-08-05', 'Madhuban', NULL),
(1036, 314, 'V06562', 2, '2021-09-06', 'Madhuban', NULL),
(1037, 315, 'V06561', 2, '2021-09-14', 'Madhuban', NULL),
(1038, 316, 'V06563', 2, '2021-09-16', 'Madhuban', NULL),
(1039, 317, 'V06560', 2, '2021-09-16', 'Madhuban', NULL),
(1040, 318, ' V06581', 2, '2021-11-29', 'Madhuban', NULL),
(1041, 321, 'H02790', 2, '2021-09-17', 'Madhuban', NULL),
(1042, 322, 'H02787', 2, '2021-12-08', 'Madhuban', NULL),
(1043, 323, 'H02792', 2, '2021-09-10', 'Madhuban', NULL),
(1044, 324, 'H02788', 2, '2021-09-17', 'Madhuban', NULL),
(1045, 325, 'H03005 ', 2, '2021-09-29', 'Madhuban', NULL),
(1046, 326, 'V06550', 2, '2021-09-20', 'Madhuban', NULL),
(1047, 327, 'V06486', 2, '2021-09-09', 'Madhuban', NULL),
(1048, 328, 'V06549', 2, '2022-07-13', 'Madhuban', NULL),
(1049, 329, 'V06552', 2, '2021-09-09', 'Madhuban', NULL),
(1050, 331, 'V06571', 2, '2022-02-25', 'Madhuban', NULL),
(1051, 332, 'V06575', 2, '2021-12-06', 'Madhuban', NULL),
(1052, 333, 'V06572', 2, '2022-08-05', 'Madhuban', NULL),
(1053, 334, 'V06643', 2, '2021-06-18', 'Madhuban', NULL),
(1054, 335, 'V06644', 2, '2022-01-17', 'Madhuban', NULL),
(1055, 337, 'V06601 ', 2, '2021-12-07', 'Madhuban', NULL),
(1056, 339, ' V06598', 2, '2021-11-22', 'Madhuban', NULL),
(1057, 340, ' V06599', 2, '2021-11-22', 'Madhuban', NULL),
(1058, 341, 'V06600 ', 2, '2021-10-02', 'Madhuban', NULL),
(1059, 342, 'V06597', 2, '2021-09-20', 'Madhuban', NULL),
(1060, 343, ' V07282', 2, '2021-07-26', 'OM SAI', NULL),
(1061, 344, ' V07224', 2, '2021-08-14', 'OM SAI', NULL),
(1062, 345, 'V06489', 2, '2022-01-14', 'Madhuban', NULL),
(1063, 346, 'V06475', 2, '2022-06-20', 'Madhuban', NULL),
(1064, 347, 'V06016', 2, '2021-09-15', 'Madhuban', NULL),
(1065, 350, 'V06150', 2, '2021-09-17', 'Madhuban', NULL),
(1066, 351, 'V06256', 2, '2021-12-25', 'Madhuban', NULL),
(1067, 352, 'V06151', 2, '2021-11-20', 'Madhuban', NULL),
(1068, 353, 'V06738', 2, '2022-03-09', 'Madhuban', NULL),
(1069, 354, 'V06744', 2, '2022-09-29', 'Madhuban', NULL),
(1070, 355, 'V06737', 2, '2022-08-23', 'Madhuban', NULL),
(1071, 356, 'V07205', 2, '2021-11-26', 'Madhuban', NULL),
(1072, 358, 'V06171', 2, '2021-08-27', 'Madhuban', NULL),
(1073, 359, 'V06149', 2, '2021-08-24', 'Madhuban', NULL),
(1074, 360, 'V06170', 2, '2021-08-10', 'Madhuban', NULL),
(1075, 361, 'H02853', 2, '2022-01-25', 'Madhuban', NULL),
(1076, 362, 'V07292', 2, '2022-02-03', 'Madhuban', NULL),
(1077, 363, 'V07255', 2, '2022-02-07', 'Madhuban', NULL),
(1078, 364, 'H02934', 2, '2021-11-23', 'Madhuban', NULL),
(1079, 365, 'H02959', 2, '2021-11-09', 'Madhuban', NULL),
(1080, 366, 'H02960', 2, '2021-11-10', 'Madhuban', NULL),
(1081, 367, 'V06264', 2, '2022-03-31', 'Madhuban', NULL),
(1082, 368, 'V06586', 2, '2021-09-17', 'Madhuban', NULL),
(1083, 369, 'V07256', 2, '2022-02-24', 'Madhuban', NULL),
(1084, 370, 'V06331', 2, '2021-09-24', 'Madhuban', NULL),
(1085, 371, 'V06330', 2, '2021-09-23', 'Madhuban', NULL),
(1086, 372, 'V06327', 2, '2022-04-26', 'Madhuban', NULL),
(1087, 373, 'V06329', 2, '2021-09-11', 'Madhuban', NULL),
(1088, 82, 'V06145', 2, '2021-08-15', 'Masjid', NULL),
(1089, 83, 'V06543', 2, '2022-08-01', 'Masjid', NULL),
(1090, 84, 'V04752', 2, '2021-08-29', 'Masjid', NULL),
(1091, 85, 'V06164', 2, '2022-01-05', 'Masjid', NULL),
(1092, 86, 'V06158', 2, '2021-08-20', 'Masjid', NULL),
(1093, 87, 'V05345', 2, '2021-09-16', 'Masjid', NULL),
(1094, 88, 'V07019', 2, '2022-05-29', 'Masjid', NULL),
(1095, 89, 'V06989', 2, '2021-08-07', 'Masjid', NULL),
(1096, 91, 'H00680', 2, '2021-08-29', 'Masjid', NULL),
(1097, 92, 'V06635', 2, '2022-06-09', 'Masjid', NULL),
(1098, 93, 'V06851', 2, '2022-01-12', 'Masjid', NULL),
(1099, 94, 'D00089', 2, '2021-10-24', 'Masjid', NULL),
(1100, 95, 'V02894', 2, '2021-09-01', 'Masjid', NULL),
(1101, 96, 'V00847', 2, '2021-10-24', 'Masjid', NULL),
(1102, 97, 'V06163', 2, '2021-12-30', 'Masjid', NULL),
(1103, 98, 'D00999', 2, '2022-01-17', 'Evolution', NULL),
(1104, 99, 'V05934', 2, '2021-09-13', 'GReen Lake View', NULL),
(1105, 100, 'D00809', 2, '2021-10-22', 'Green Lake View', NULL),
(1106, 101, 'H02779', 2, '2021-08-10', 'Green Lake View', NULL),
(1107, 102, 'V06823', 2, '2021-09-14', 'EVOLUTION', NULL),
(1108, 103, 'D00940', 2, '2021-08-28', 'EVOLUTION', NULL),
(1109, 104, 'H03067', 2, '2022-09-09', 'Masjid', NULL),
(1110, 106, 'H02654', 2, '2021-11-06', 'Masjid', NULL),
(1111, 107, 'H02666', 2, '2021-09-09', 'Masjid', NULL),
(1112, 108, 'H02664', 2, '2021-10-30', 'Masjid', NULL),
(1113, 109, 'V06144', 2, '2021-09-22', 'Masjid', NULL),
(1114, 110, 'H03079', 2, '2021-09-05', 'Masjid', NULL),
(1115, 111, 'V07015', 2, '2022-11-22', 'Masjid', NULL),
(1116, 112, 'D01043 ', 2, '2021-11-22', 'Evolution', NULL),
(1117, 113, 'H02833', 2, '2021-10-04', 'Masjid', NULL),
(1118, 114, 'H03018 ', 2, '2021-12-14', 'Masjid', NULL),
(1119, 115, 'H02894', 2, '2021-09-16', 'Masjid', NULL),
(1120, 116, 'H02835', 2, '2021-09-24', 'Masjid', NULL),
(1121, 117, 'V07005', 2, '2021-10-28', 'Masjid', NULL),
(1122, 118, 'H03077', 2, '2023-01-30', 'Masjid', NULL),
(1123, 119, 'H03074', 2, '2022-02-02', 'Masjid', NULL),
(1124, 120, 'H03075', 2, '2021-09-22', 'Masjid', NULL),
(1125, 121, 'V07023', 2, '2021-10-21', 'Masjid', NULL),
(1126, 123, 'V05662', 2, '2021-08-29', 'Masjid', NULL),
(1127, 124, 'V05670', 2, '2021-09-12', 'Masjid', NULL),
(1128, 125, 'H00945', 2, '2021-08-29', 'Masjid', NULL),
(1129, 126, 'H03161', 2, '2021-09-23', 'Masjid', NULL),
(1130, 127, 'H03041', 2, '2022-01-28', 'Masjid', NULL),
(1131, 128, 'H03082', 2, '2021-09-05', 'Masjid', NULL),
(1132, 129, 'V06610 ', 2, '2021-12-20', 'Masjid', NULL),
(1133, 130, 'H03069', 2, '2022-06-06', 'Masjid', NULL),
(1134, 131, 'V06613 ', 2, '2021-12-01', 'Masjid', NULL),
(1135, 132, 'V05900', 2, '2021-09-24', 'Green Lake View', NULL),
(1136, 134, 'H03065', 2, '2021-11-22', 'Masjid', NULL),
(1137, 54, 'H03030', 2, '2022-11-18', 'Walwaikar', NULL),
(1138, 55, 'V05401', 2, '2021-09-01', 'Walwaikar', NULL),
(1139, 56, 'V06827', 2, '2021-09-23', 'CHANDRABHAGA', NULL),
(1140, 57, 'V05867', 2, '2021-10-10', 'Walwaikar', NULL),
(1141, 58, 'V06826', 2, '2021-12-13', 'CHANDRABHAGA', NULL),
(1142, 59, 'V06043', 2, '2021-11-11', 'Walwaikar', NULL),
(1143, 60, 'V06089', 2, '2021-09-14', 'Walwaikar', NULL),
(1144, 61, 'V07203', 2, '2021-08-31', 'Walwaikar', NULL),
(1145, 62, 'H02988 ', 2, '2021-08-20', 'Walwaikar', NULL),
(1146, 63, 'D00947', 2, '2022-05-20', 'Walwaikar', NULL),
(1147, 64, 'H02907', 2, '2021-10-08', 'Green Lake View', NULL),
(1148, 65, 'H01556', 2, '2021-09-25', 'Walwaikar', NULL),
(1149, 66, 'H03019', 2, '2021-12-18', 'Walwaikar', NULL),
(1150, 67, 'H02986', 2, '2021-09-09', 'Walwaikar', NULL),
(1151, 68, 'H03154', 2, '2021-11-06', 'Walwaikar', NULL),
(1152, 69, 'H02996', 2, '2022-01-22', 'CHANDRABHAGA', NULL),
(1153, 70, 'H00895', 2, '2021-09-17', 'Walwaikar', NULL),
(1154, 71, 'H01040', 2, '2021-11-15', 'Walwaikar', NULL),
(1155, 72, 'H02643', 2, '2021-10-23', 'Walwaikar', NULL),
(1156, 73, 'H02708', 2, '2021-12-31', 'Walwaikar', NULL),
(1157, 74, 'H01333', 2, '2021-09-27', 'Walwaikar', NULL),
(1158, 75, 'H02800', 2, '2022-02-10', 'Walwaikar', NULL),
(1159, 76, 'H01677', 2, '2021-08-01', 'Walwaikar', NULL),
(1160, 77, 'H02994', 2, '2021-10-20', 'CHANDRABHAGA', NULL),
(1161, 78, 'H03093', 2, '2021-10-01', 'Walwaikar', NULL),
(1162, 79, 'H02995', 2, '2021-06-12', 'CHANDRABHAGA', NULL),
(1163, 80, 'H02841', 2, '2022-06-27', 'Walwaikar', NULL),
(1164, 81, 'H02891', 2, '2021-10-13', 'Walwaikar', NULL),
(1165, 41, 'H02046', 2, '2021-08-30', 'Campal', NULL),
(1166, 42, 'H00641', 2, '2021-10-08', 'Campal', NULL),
(1167, 43, 'H02696', 2, '2021-10-01', 'Campal', NULL),
(1168, 44, 'H02713', 2, '2021-09-28', 'Campal', NULL),
(1169, 45, 'V04703', 2, '2021-09-20', 'Campal', NULL),
(1170, 46, 'H02867', 2, '2021-09-09', 'CAMPAL', NULL),
(1171, 47, 'H03094', 2, '2021-09-16', 'CAMPAL', NULL),
(1172, 48, 'H02037', 2, '2021-08-29', 'Campal', NULL),
(1173, 49, 'H02076', 2, '2021-08-29', 'Campal', NULL),
(1174, 50, 'H02077', 2, '2021-08-29', 'Campal', NULL),
(1175, 51, 'H01649', 2, '2021-08-29', 'Campal', NULL),
(1176, 52, 'H02594', 2, '2021-10-02', 'Campal', NULL),
(1177, 53, 'H02218', 2, '2021-10-31', 'Campal', NULL),
(1178, 2, 'D01000', 2, '2021-10-07', 'OM SAI', NULL),
(1179, 3, 'D01003', 2, '2021-12-07', 'OM SAI', NULL),
(1180, 4, 'H03113', 2, '2021-12-07', 'OM SAI', NULL),
(1181, 5, 'H03110', 2, '2021-11-11', 'OM SAI', NULL),
(1182, 6, 'D00998', 2, '2021-09-18', 'OM SAI', NULL),
(1183, 7, 'H03115', 2, '2022-05-18', 'OM SAI', NULL),
(1184, 8, 'D00997', 2, '2022-02-14', 'OM SAI', NULL),
(1185, 9, 'H03119', 2, '2022-08-08', 'OM SAI', NULL),
(1186, 10, 'H03121', 2, '2021-10-02', 'OM SAI', NULL),
(1187, 11, 'H03114', 2, '2021-09-03', 'OM SAI', NULL),
(1188, 12, 'D01004', 2, '2021-10-28', 'OM SAI', NULL),
(1189, 13, 'H03120', 2, '2022-12-05', 'OM SAI', NULL),
(1190, 14, 'D01001', 2, '2022-01-05', 'OM SAI', NULL),
(1191, 15, ' H03173', 2, '2021-11-13', 'OM SAI', NULL),
(1192, 16, ' V07225', 2, '2021-10-10', 'OM SAI', NULL),
(1193, 17, ' V07226', 2, '2021-09-04', 'OM SAI', NULL),
(1194, 18, 'H03054', 2, '2022-08-26', 'OM SAI', NULL),
(1195, 19, 'H03053', 2, '2022-08-26', 'OM SAI', NULL),
(1196, 20, 'H03055', 2, '2021-11-03', 'OM SAI', NULL),
(1197, 21, 'H03052', 2, '2022-08-26', 'OM SAI', NULL),
(1198, 22, 'V07022', 2, '2023-01-25', 'OM SAI', NULL),
(1199, 23, 'H03056', 2, '2021-10-08', 'OM SAI', NULL),
(1200, 24, 'H03057', 2, '2022-08-26', 'OM SAI', NULL),
(1201, 25, 'H03058', 2, '2022-10-29', 'OM SAI', NULL),
(1202, 26, 'V07007', 2, '2021-10-05', 'OM SAI', NULL),
(1203, 27, 'V07004', 2, '2021-11-24', 'OM SAI', NULL),
(1204, 28, 'H03048', 2, '2023-01-25', 'OM SAI', NULL),
(1205, 29, 'H03050', 2, '2022-06-07', 'OM SAI', NULL),
(1206, 30, 'H03051', 2, '2022-02-22', 'OM SAI', NULL),
(1207, 31, 'V07021', 2, '2021-10-06', 'OM SAI', NULL),
(1208, 32, 'V07010', 2, '2021-11-03', 'OM SAI', NULL),
(1209, 33, 'V07008', 2, '2022-10-18', 'OM SAI', NULL),
(1210, 34, 'V07006', 2, '2022-02-02', 'OM SAI', NULL),
(1211, 35, 'V07009', 2, '2021-11-15', 'OM SAI', NULL),
(1212, 584, 'D00621', 3, '2022-07-06', 'TALEIGAO', NULL),
(1213, 613, 'V06815', 3, '2022-11-05', 'TALEIGAO', NULL),
(1214, 616, 'V06881', 3, '2022-07-21', 'TALEIGAO', NULL),
(1215, 617, 'V06790', 3, '2022-11-04', 'Taleigao', NULL),
(1216, 618, 'V06789', 3, '2022-11-02', 'Taleigao', NULL),
(1217, 620, 'V06787', 3, '2022-11-04', 'Taleigao', NULL),
(1218, 577, 'V06587', 3, '2022-07-26', 'Masjid', NULL),
(1219, 511, 'H02981 ', 3, '2022-07-21', 'Succor', NULL),
(1220, 512, 'D00932', 3, '2022-10-29', 'Succor', NULL),
(1221, 530, 'V06788 ', 3, '2022-11-04', 'Succor', NULL),
(1222, 533, 'D00934 ', 3, '2022-07-21', 'Succor', NULL),
(1223, 538, ' V06798', 3, '2022-11-02', 'Succor', NULL),
(1224, 539, ' D00936', 3, '2022-11-02', 'Succor', NULL),
(1225, 540, 'V06804', 3, '2022-07-21', 'Succor', NULL),
(1226, 541, 'D00933 ', 3, '2022-07-16', 'Succor', NULL),
(1227, 542, 'V06805 ', 3, '2022-11-02', 'Succor', NULL),
(1228, 543, 'V06803 ', 3, '2022-10-29', 'Succor', NULL),
(1229, 544, 'H02983', 3, '2022-11-02', 'Succor', NULL),
(1230, 545, 'D00937 ', 3, '2022-10-29', 'Succor', NULL),
(1231, 546, 'D00941', 3, '2022-11-08', 'SUCCOUR', NULL),
(1232, 547, 'V06821', 3, '2022-11-03', 'SUCCOUR', NULL),
(1233, 548, 'V06820', 3, '2021-11-01', 'SUCCOUR', NULL),
(1234, 549, 'V06822', 3, '2022-11-07', 'SUCCOUR', NULL),
(1235, 551, 'H02992', 3, '2022-11-02', 'SUCCOUR', NULL),
(1236, 552, 'V06816', 3, '2022-11-02', 'SUCCOUR', NULL),
(1237, 553, 'V06825', 3, '2022-11-07', 'SUCCOUR', NULL),
(1238, 554, 'H02993', 3, '2022-11-02', 'SUCCOUR', NULL),
(1239, 430, ' V07233', 3, '2022-05-08', 'EVOLUTION', NULL),
(1240, 435, ' V07228', 3, '2022-07-26', 'EVOLUTION', NULL),
(1241, 446, 'V07140', 3, '2022-08-16', 'Evolution', NULL),
(1242, 449, 'V06938 ', 3, '2022-11-29', 'Green Lake View', NULL),
(1243, 479, 'V06792', 3, '2022-11-04', 'Evolution', NULL),
(1244, 480, 'H02985 ', 3, '2022-11-02', 'Evolution', NULL),
(1245, 481, 'D00938', 3, '2022-11-02', 'Evolution', NULL),
(1246, 483, 'V06813', 3, '2022-10-31', 'EVOLUTION', NULL),
(1247, 376, 'H02745', 3, '2022-07-13', 'Green Lake View', NULL),
(1248, 379, 'H02129', 3, '2022-07-05', 'Green Lake View', NULL),
(1249, 387, 'V07280 ', 3, '2022-07-29', 'Green Lake View', NULL),
(1250, 389, 'V04342', 3, '2022-07-06', 'Green Lake View', NULL),
(1251, 391, 'H03194', 3, '2021-07-25', 'Green Lake View', NULL),
(1252, 396, 'V04676', 3, '2022-07-06', 'Green Lake View', NULL),
(1253, 398, 'V05581', 3, '2022-07-05', 'Green Lake View', NULL),
(1254, 410, 'V06416', 3, '2021-07-06', 'Green Lake View', NULL),
(1255, 144, 'H02840', 3, '2022-07-11', 'Madhuban', NULL),
(1256, 207, 'D01052 ', 3, '2022-09-02', 'Madhuban', NULL),
(1257, 214, 'V06764', 3, '2022-08-05', 'Madhuban', NULL),
(1258, 233, 'D01046', 3, '2022-08-10', 'Madhuban', NULL),
(1259, 249, 'H02978', 3, '2022-09-03', 'Madhuban', NULL),
(1260, 286, 'D01030', 3, '2022-08-14', 'Madhuban', NULL),
(1261, 309, 'V06568', 3, '2022-08-01', 'Madhuban', NULL),
(1262, 317, 'V06560', 3, '2022-08-04', 'Madhuban', NULL),
(1263, 335, 'V06644', 3, '2022-07-26', 'Madhuban', NULL),
(1264, 343, ' V07282', 3, '2022-04-28', 'OM SAI', NULL),
(1265, 364, 'H02934', 3, '2022-07-19', 'Madhuban', NULL),
(1266, 365, 'H02959', 3, '2021-07-25', 'Madhuban', NULL),
(1267, 366, 'H02960', 3, '2022-07-27', 'Madhuban', NULL),
(1268, 102, 'V06823', 3, '2022-11-07', 'EVOLUTION', NULL),
(1269, 103, 'D00940', 3, '2022-11-04', 'EVOLUTION', NULL),
(1270, 121, 'V07023', 3, '2023-01-21', 'Masjid', NULL),
(1271, 126, 'H03161', 3, '2022-08-06', 'Masjid', NULL),
(1272, 56, 'V06827', 3, '2022-11-08', 'CHANDRABHAGA', NULL),
(1273, 58, 'V06826', 3, '2022-11-08', 'CHANDRABHAGA', NULL),
(1274, 62, 'H02988 ', 3, '2022-10-29', 'Walwaikar', NULL),
(1275, 67, 'H02986', 3, '2022-07-21', 'Walwaikar', NULL),
(1276, 79, 'H02995', 3, '2022-11-11', 'CHANDRABHAGA', NULL),
(1277, 14, 'D01001', 3, '2022-08-06', 'OM SAI', NULL),
(1278, 15, ' H03173', 3, '2022-08-14', 'OM SAI', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vaccination_category`
--

CREATE TABLE `vaccination_category` (
  `category_name` varchar(20) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vaccination_category`
--

INSERT INTO `vaccination_category` (`category_name`, `category_id`) VALUES
('First Jab', 1),
('Second Jab', 2),
('Third Jab', 3);

-- --------------------------------------------------------

--
-- Table structure for table `visitor_log`
--

CREATE TABLE `visitor_log` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `security_emp_id` int(11) NOT NULL,
  `acc_code` varchar(10) NOT NULL,
  `visitor_name` varchar(20) DEFAULT NULL,
  `vehicle_no` varchar(11) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `check_in` timestamp NULL DEFAULT current_timestamp(),
  `check_out` timestamp NULL DEFAULT NULL,
  `purpose` varchar(100) NOT NULL,
  `phone_no` varchar(11) NOT NULL
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
  ADD KEY `accomodation_ibfk_1` (`warden_emp_code`);

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
  MODIFY `acc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=667;

--
-- AUTO_INCREMENT for table `employee_dept`
--
ALTER TABLE `employee_dept`
  MODIFY `dept_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `employee_designation`
--
ALTER TABLE `employee_designation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_history`
--
ALTER TABLE `login_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `outing_type`
--
ALTER TABLE `outing_type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rights`
--
ALTER TABLE `rights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

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
  MODIFY `vaccination_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1279;

--
-- AUTO_INCREMENT for table `vaccination_category`
--
ALTER TABLE `vaccination_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
