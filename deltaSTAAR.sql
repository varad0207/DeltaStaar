-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 08, 2023 at 05:06 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

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
  `acc_name` varchar(20) NOT NULL,
  `bldg_status` varchar(20) NOT NULL,
  `location` int(11) DEFAULT NULL,
  `gender` enum('Male','Female','Unisex') NOT NULL,
  `tot_capacity` int(11) DEFAULT NULL,
  `no_of_rooms` int(11) NOT NULL,
  `occupied_rooms` int(11) DEFAULT NULL,
  `available_rooms` int(11) DEFAULT NULL,
  `warden_emp_code` varchar(10) DEFAULT NULL,
  `owner` varchar(20) NOT NULL,
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
  `emp_id` int(11) NOT NULL,
  `emp_code` varchar(10) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `mname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `designation` int(11) NOT NULL,
  `dob` date NOT NULL,
  `contact` varchar(13) DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  `state` varchar(10) NOT NULL,
  `country` varchar(10) NOT NULL,
  `pincode` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  `blood_group` varchar(4) DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
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
  `dept_name` varchar(25) DEFAULT NULL
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
  `designation` varchar(50) DEFAULT NULL
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
  `department` int(11) DEFAULT NULL,
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
(1, 'EMP001', 'Vadiraj', 'Gururaj', 'Inamdar', 62, '2002-04-23', '7083491368', 'Dhavali, Ponda, Goa', 'Goa', 'India', '403401', 'vadirajinamdar6@gmail.com', 18, 'A+', '2023-01-03', '496376636809', 98346, NULL, 5),
(2, 'D01000', 'RUBI', '', 'CHOWHAI', 5, '2004-09-02', '6909422853', 'MUDOI BI .I & II, CHANGLANG, DIYUN, ARUNANCHAL PRADESH-792103     INDIA ARUNANCHAL PRADESH ', 'ARUNACHAL PRADESH', 'INDIA', 'NA', 'chowhair09@gmail.com', 2, 'A+', '2023-04-10', '283408719717', 0, 158, NULL),
(3, 'D01003', 'PHOIBI', '', 'ENGTIPI', 2, '2002-09-09', '8011237676', 'CHANDMARI, LUMDING ROAD, DIPHU, KARBI ANGLONG ASSAM 782460     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'phoibiengtipi@gmail.com', 1, 'O+', '2023-04-10', '509073267717', 0, 158, NULL),
(4, 'H03113', 'PREMIKA', '', 'MOCHAHARY', 2, '2002-04-17', '7099109507', 'VILL BHAIRAGURI, NALKHAMARA, UDALGURI ASSAM 784509     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'premimchri5@gmail.com', 1, 'A+', '2023-04-10', '245321161535', 0, 158, NULL),
(5, 'H03110', 'BANDANA', '', 'GOGOI', 2, '2001-05-06', '9365454243', 'VILL BETONIBAM, GHINAI GAON, DIBRUGARH ASSAM 786621     INDIA ASSAM  ', 'ASSAM', 'INDIA', 'NA', 'gogoibandana486@gmail.com', 1, 'O+', '2023-04-10', '927593652813', 0, 158, NULL),
(6, 'D00998', 'PUBI', '', 'MAYAKADEL', 2, '2005-02-11', '9366681548', 'H.NO.223,NH-29, MEDZIPHEMA TOWN,WARD-09, MEDZIPHEMA HQ,DIMAPUR, NAGALAND-797106     INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'pubikadel@gmail.com', 1, 'B+', '2023-04-10', '857518862209', 0, 159, NULL),
(7, 'H03115', 'NIZARA', '', 'PATAR', 2, '2003-10-13', '6901863020', 'MERUAGAON, HATIHULUNGA, AZARBARI, MORIGAON ASSAM 782105     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'nizarapatar@gmail.com', 1, 'B+', '2023-04-10', '458080581959', 0, 159, NULL),
(8, 'D00997', 'BARNALI', '', 'KALITA', 2, '2002-11-11', '9310058882', 'UJAN TOKRADIA,KAMRUP, ASSAM-781102     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'kbarnali577@gmail.com', 1, 'A+', '2023-04-10', '558014857180', 0, 159, NULL),
(9, 'H03119', 'JITUMONI', '', 'NARCARY', 2, '1997-03-19', '8011512540', 'VILL CHARIPUNIA BOTGURI, UTTAR SALMARA PT I, BONGAIGAON ASSAM 783383     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'jitumoninarzary61@gmail.com', 1, 'A+', '2023-04-12', '302634622056', 0, 160, NULL),
(10, 'H03121', 'SANGITA', 'SINGHA', 'ROY', 2, '1999-05-20', '6000324759', 'VILLAGE KAKAIJANA, BONGAIGAON ASSAM 783383     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'sangitaabeli11@gmail.com', 1, 'O+', '2023-04-12', '912484791025', 0, 160, NULL),
(11, 'H03114', 'MIANKSHI', '', 'BORUAH', 2, '1996-08-24', '6001498017', 'BORDUBI KATHAL GURI, BORDUBI REV TOWN, HOOGRIJAN, TINSUKIA ASSAM 786601     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'porunaboruah2@gmail.com', 1, 'B+', '2023-04-10', '984987121878', 0, 160, NULL),
(12, 'D01004', 'JANMONI', '', 'TAMULI', 2, '1998-02-28', '8099169066', 'BOCHAGAON,KAZIRANGA NATIONAL PARK, GOLAGHAT  ASSAM 785609     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'janmonitamuli2546@mail.com', 1, 'B+', '2023-04-11', '829247246434', 0, 161, NULL),
(13, 'H03120', 'KLARISHA', '', 'TOKPBIPI', 2, '1998-10-07', '6003971240', 'VILL HORI TARO GAON, SILDHARAMPUR, DOKMAKA, PHULONI, KARBI ANGLONG ASSAM 782441     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'tokbipiklarisha@gmail.com', 1, 'A+', '2023-04-11', '888320319493', 0, 161, NULL),
(14, 'D01001', '', '', 'CHAUHAN', 9, '2001-09-03', '6901258798', 'HOUSE NO.26, KHANAPARA,FIRM GATE,GUWAHATI,KHANAPARA,KAMRUP METRO  ASSAM-781022     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'aptechghy@gmail.com', 2, 'AB+', '2023-04-11', '797092419457', 0, 161, NULL),
(15, ' H03173', 'SUCHITA', 'KUMARI', 'DEV', 6, '2002-07-06', '9546044789', 'HARAMLOHAR TAMAR, VILL BIRDIH PO HARAMLOHAR RANCHI JHARKHAND 835225     INDIA JHARKHAND ', 'JHARKHAND', 'INDIA', 'NA', 'suchitadev1543@gmail.com', 3, 'O+', '2023-06-26', '442085743627', 0, 164, NULL),
(16, ' V07225', 'SUPRIYA', '', 'BAGH', 9, '2003-04-12', '6207510185', 'S.P.R-1/5,MUSABANI NO-3, EAST SINGHBHUM  JHARKHAND 832104     INDIA JHARKHAND ', 'JHARKHAND', 'INDIA', 'NA', 'royalpriya2001@gmail.com', 2, 'A+', '2023-06-26', '867653450985', 0, 164, NULL),
(17, ' V07226', 'LIPIKA', '', 'ROHIDAS', 2, '2004-01-29', '7008925949', 'VILLAGE JAMERA, BRAJARAJNAGAR, JHARSUGUDA ODISHA 768216     INDIA ODISHA ', 'ODISHA', 'INDIA', 'NA', 'lipilipika47@gmail.com', 1, 'O+', '2023-06-27', '402220794417', 0, 164, NULL),
(18, 'H03054', 'NUNGTIAJUNG', '', '', 2, '1998-01-02', '7085944204', 'H NO 40, TEYONG MEPU, P O TZUDIKONG, TULI, TSUDIKONG, MOKOKCHUNG NAGALAND 798623     INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'nungtyjung@gmail.com', 1, 'A+', '2023-01-23', '201935404928', 0, 165, NULL),
(19, 'H03053', 'TSUCHOI', '', 'K', 2, '2000-07-22', '8413834292', '128, NOKLAK VILL, NOKLAK, TUENSANG NAGALAND 798626     INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'tsuchoishiu77@gmail.com', 1, 'O+', '2023-01-23', '407188007719', 0, 165, NULL),
(20, 'H03055', 'HOINGAM', 'P', 'KONYAK', 2, '2000-08-17', '9862866019', 'JAHJON WARD, NEAR MISSION CENTRE ROAD, MON SADAR NAGALAND 798621     INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'hoingampkonyak9862@gmail.com', 1, 'O+', '2023-01-23', '314437508572', 0, 165, NULL),
(21, 'H03052', 'PUSAM', '', 'B', 5, '1994-05-27', '7085419220', '074, NOKLAK VILLAGE 03, TUESANG NAGALAND 798626     INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'shiupusam@gmail.com', 2, 'B+', '2023-01-23', '815624349496', 0, 165, NULL),
(22, 'V07022', 'ILIHO', 'A', 'AYE', 2, '2001-02-16', '8787677918', 'H.NO.51 HOVISE NIULAND DIMAPUR  NAGALAND      INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'ayeality78@gmail.com', 1, 'A+', '2023-01-23', '364986111892', 0, 166, NULL),
(23, 'H03056', 'ELIT', 'I', 'AYE', 2, '2003-10-24', '8415084932', 'H NO 105, HOSHEPU VILLAGE, ZUNHEBOTO SADAR NAGALAND 798620     INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'elitayemi@gmail.com', 1, 'O+', '2023-01-23', '376312333894', 0, 166, NULL),
(24, 'H03057', 'LOVI', '', 'ACHUMI', 2, '2003-09-08', '8787567665', 'H NO 92, ZUTOVI VILLAGE, DHANSIPUR, DIMAPUR NAGALAND 797112     INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'loviachumi94@gmail.com', 1, 'A+', '2023-01-23', '567643426488', 0, 166, NULL),
(25, 'H03058', 'ANGUKALI', 'A', 'ASSUMI', 4, '2002-01-30', '8729990668', 'H NO 74, PROJECT COLONY, ZUNHEBOTO SADAR NAGALAND 798620     INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'angukaliassumi6@gmail.com', 1, 'A+', '2023-01-23', '575216265524', 0, 166, NULL),
(26, 'V07007', 'SHREEJANA', '', 'CHETTRI', 4, '1995-12-25', '7029477577', 'MUL SAKYONG 1, KHASMAHAL, DARJEELING WEST BENGAL 734311     INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'srijanachettri772@gmail.com', 1, 'B+', '2023-01-18', '980850022266', 0, 167, NULL),
(27, 'V07004', 'NORSHANG', '', 'BOMZON', 2, 'NA', '8768486949', 'MAHENDRA GAON WARD NO 8, MIRIK, DARJEELING WEST BENGAL 734214     INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'norshangbomzon5737@gmail.com', 19, 'AB+', '2023-01-18', '933759771064', 0, 167, NULL),
(28, 'H03048', 'NATIKUNDANG', '', 'Y', 2, '2003-07-15', '9366783060', 'H NO 85, NEAR CHRUCH, HIGH SCHOOL B, TUENSANG NAGALAND 798612     INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'kundangkundang05@gmail.com', 1, 'A+', '2023-01-23', '603869855445', 0, 168, NULL),
(29, 'H03050', 'KEYILEUZEULE', '', '', 2, '2002-06-15', '9362354195', '131, JALUKIE B, PEREN NAGALAND 797110     INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'keyileuzeuleleuzeu@gmail.com', 1, 'O+', '2023-01-23', '410743231541', 0, 168, NULL),
(30, 'H03051', 'INGAUCHANGLE', '', '', 5, '1999-12-29', '9366021741', 'P O PEREN, PEREN HQ NAGALAND 797101     INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'ingauchanglezeliang@gmail.com', 2, 'O+', '2023-01-23', '305135583384', 0, 168, NULL),
(31, 'V07021', 'IMSILEMLA', '', 'M', 4, '2002-07-20', '8974659974', 'H.NO.357,HIGH SCHOOL SECTOR TUENSANG TOWN  TUENSANG SADAR  NAGALAND      INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'imsichang7@gmail.com', 1, 'A+', '2023-01-23', '413300056560', 0, 168, NULL),
(32, 'V07010', 'PRERNA', '', 'TAMANG', 4, '2002-09-30', '9883445687', 'AMBEOK TEA GARDEN GORUBATHAN DARJEELING WEST BENGAL 735231     INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'rainiti030@gmail.com', 1, 'O+', '2023-01-18', '685048233244', 0, 169, NULL),
(33, 'V07008', 'SUJANA', '', 'RAI', 4, '2004-06-08', '9679392811', 'UPPER AMBIOK BUSTY PANKHASARI KHASMAHAL FAGU DARJEELING WEST BENGAL 735231      INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', '', 1, 'A+', '2023-01-18', '485824734499', 0, 169, NULL),
(34, 'V07006', 'ANUSHRA', '', 'GURUNG', 4, '2001-12-28', '9339642250', 'AMBIOK BUSTY GORUBATHAN KUWAPANI BUSTY PANKHASARI KHASMAHAL PAGU DARJEELING WEST BENGAL 735231     INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'anushragurung@gmail.com', 1, 'O+', '2023-01-18', '674456310854', 0, 169, NULL),
(35, 'V07009', 'RAKCHA', '', 'TAMANG', 2, 'NA', '9614696731', '74 DHURA LABDAH DIVISION MANGPU CINCHONA PLANTATION MUNGPOO, RANGLI RANGLIOT, DARJEELING WEST BENGAL 734313     INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'rakcha215tamang@gmail.com', 19, 'B+', '2023-01-18', '227959182626', 0, 169, NULL),
(36, 'GP-961', 'AKUMYANGLA', '', '', 2, 'NA', '8837289525', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-01-23', 'NA', 0, 171, NULL),
(37, 'GP-960', 'SENTIJUNGLA', '', '', 2, 'NA', '9366971476', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-01-23', 'NA', 0, 171, NULL),
(38, 'GP-963', 'ALIMENLA', '', '', 2, 'NA', '9856504011', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-01-23', 'NA', 0, 171, NULL),
(39, 'GP-962', 'MUZAVELU', '', 'DOZO', 2, 'NA', '8414970680', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-01-23', 'NA', 0, 171, NULL),
(40, 'H02810', 'ASHOK', '', 'JENA', 31, '1990-02-26', '9172998162', 'KHADIKABADI JAYRAMPUR BHOGRAI BALESWAR ODISHA 756038     INDIA ODISHA ', 'ODISHA', 'INDIA', 'NA', 'ashookjena731@gmail.com', 8, 'B+', '2020-11-11', '326446140828', 0, 174, NULL),
(41, 'H02046', 'HONE', '', 'SADANAND GAWAS', 40, '1987-10-19', '9021642616', 'H. NO. 11 KUMBHARWADA CHANDEL , PERNEM NORTH GOA GOA     ', 'GOA', 'INDIA', 'NA', 'NA', 8, 'A+', '2013-09-16', '913513169858', 0, 174, NULL),
(42, 'H00641', 'NARAYAN', '', 'PARIDA', 21, '1996-10-07', '8855883600', 'NA', 'NA', 'INDIA', 'NA', 'NA', 8, 'A+', '2022-01-21', '738710589007', 0, 174, NULL),
(43, 'H02696', 'VISHANT', '', 'TULSHIDAS SAWANT', 32, '1999-07-24', '9075246213', '74/2, GAWASWADA SATTARI, KERI NORTH GOA, GOA   403505 INDIA GOA ', 'GOA', 'INDIA', 'NA', 'avishant492@gmail.com', 8, 'B+', '2022-02-22', '268163979120', 0, 174, NULL),
(44, 'H02713', 'DALTON', '', 'DSOUZA', 41, '1983-10-20', '9008900498', '99-1, GOLLJORA, KINNIGOLI, TALIPADY, DAKSHINI KANNADA, KARNATAKA 574150         ', 'KARNATAKA', 'INDIA', 'NA', 'dsouzadalton63@gmail.com', 11, 'B+', '2019-04-16', '875106608818', 0, 174, NULL),
(45, 'V04703', 'NAVIN', '', 'SUBODH KHADAPKAR', 31, '1988-10-27', '8698379729', 'UBHADNADA, NAVABAG VENGURLA, SINDHUDURG MAHARASHTRA    416516   ', 'MAHARASHTRA', 'INDIA', 'NA', 'NA', 8, 'A+', '2022-08-16', '874231584134', 0, 174, NULL),
(46, 'H02867', 'RANJIT', '', 'SAWANT', 32, '1997-11-14', '8208437801', 'H NO 380 AT POST AMBEGAON SAWATACHI WADI TAL SAWANTWADI SINDHUDURG MAHARASHTRA  416510      INDIA MAHARASHTRA ', 'MAHARASHTRA', 'INDIA', 'NA', 'ransawant23@gmail.com', 8, 'B+', '2023-03-27', '684732283453', 0, 174, NULL),
(47, 'H03094', 'NANDAY', '', 'GAUNKAR', 30, '2000-07-22', '9637532492', 'H.NO.151, KHADWAMOL, KALAY, CALEM, SOUTH GOA    403704 INDIA GOA ', 'GOA', 'INDIA', 'NA', 'nandhaygaonkar26@gmail.com', 8, 'A+', '2020-11-11', '385673247747', 0, 174, NULL),
(48, 'H02037', 'THANESHWAR', '', 'MANSUNATH MIRASHI', 32, '1994-01-01', '7030285194', '#1632 SANTISAGAR NIWAS HOUSING BOARD COLONY SANQULIM , NORTH GOA GOA  403505   ', 'GOA', 'INDIA', 'NA', 'NA', 8, 'O+', '2020-11-27', '898080559598', 0, 174, NULL),
(49, 'H02076', 'ALI', '', 'AHMED LASKAR', 32, '1996-02-28', '8766545924', 'UDALI BAZAR, UDALI GAON UDALANI BAZAR NAGAON  ASSAM  782446   ', 'ASSAM', 'INDIA', 'NA', 'NA', 8, 'A+', '2020-11-27', '823013394840', 0, 174, NULL),
(50, 'H02077', 'EKBAL', '', 'HUSSAIN', 34, '1991-10-09', '9101925240', 'SING GAON LANKA, UDALI GAON  NAGAON ASSAM  782446   ', 'ASSAM', 'INDIA', 'NA', 'NA', 8, 'O+', '2018-08-01', '450590562089', 0, 174, NULL),
(51, 'H01649', 'MOHAN', '', 'SINGH BHUL', 32, '1986-04-22', '9067711247', 'NAVDURGA 3 KURKEDI DADEIDHURA     NEPAL  ', 'NEPAL', 'NEPAL', 'NA', 'NA', 8, 'A+', '2021-10-20', '432504632575', 0, 174, NULL),
(52, 'H02594', 'KAUSIKA', '', 'MOHAKUD', 34, '1998-08-01', '8275302188', 'SILPURIA, BADKHIRIPADA BAISINGA, MAYURBHANJ ODISHA   757028   ', 'ODISHA', 'INDIA', 'NA', 'NA', 8, 'O+', '2021-03-26', '894798855829', 0, 174, NULL),
(53, 'H02218', 'AVADHUT', '', 'DNYANESHWAR DALVI', 10, '1997-08-02', '7350685618', '826, BHOJ DALVIWADI HODAWADA SINDHUDURG MAHARASHTRA   416529   ', 'MAHARASHTRA', 'INDIA', 'NA', 'avadhutdalvi87605@gmail.com', 1, 'O+', '2022-02-13', '879619701557', 0, 174, NULL),
(54, 'H03030', 'PIKATO', '', 'ZHIMO', 19, '1987-12-04', '6009053774', 'XUVIHE COLONY, DIMAPUR SADAR, DIMAPUR NAGALAND 797112    797112 INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'pikatozhimo77@gmail.com', 4, 'A+', '2020-12-05', '339688709631', 0, 101, NULL),
(55, 'V05401', 'YOGENDRA', '', 'KUMAR JHA', 11, '2003-02-11', '7898447783', 'BEHIND VANDANA CONVENT SCHOOL VANDANA NAGAR GUNA, MADHYA PRADESH       ', 'MADHYA PRADESH', 'INDIA', 'NA', 'yash_raj2014@yahoo.coM', 4, 'O+', '2022-11-22', '560398993616', 0, 101, NULL),
(56, 'V06827', 'NIBIR', '', 'RAJ BARUAH', 11, '1997-02-11', '9365449084', 'KAMAR GAON, DIBRUGARH ASSAM 786614     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'nibirrajbaruah@gmail.com', 4, 'B+', '2021-10-18', '659615376815', 0, 101, NULL),
(57, 'V05867', 'PRATHAMESH', '', 'FATU RAWOOL', 11, '2003-04-21', '8275580924', '292/1, AMERE PORPSCODEM  PERNEM, NORTH GOA  GOA   403512 INDIA GOA ', 'GOA', 'INDIA', 'NA', 'NA', 4, 'O+', '2022-11-22', '818307461480', 0, 101, NULL),
(58, 'V06826', 'BHABANI', '', 'GOGOI', 11, '1996-07-30', '9678905960', 'KENDUGURI GAON, JEYPORE, NAHARKATIYA, DIBRUGARH ASSAM 786614     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'bhabanigogoi784@gmail.com', 4, 'O+', '2021-12-29', '925856960532', 0, 101, NULL),
(59, 'V06043', 'JAYDAS', '', 'VILAS KERKAR', 11, '1996-06-15', '8390716674', 'TARKARLI, SINDHUDURG, MAHARASHTRA        ', 'MAHARASHTRA', 'INDIA', 'NA', 'jaydask8@gmail.com', 4, 'B+', '2022-01-13', '752276918550', 0, 101, NULL),
(60, 'V06089', 'NINGAPPA', '', 'NARAYAN RITTI', 13, '1999-07-10', '8971194770', 'MANAI , VIRNOLI UTTARA KANNADA KARNATAKA   581363   ', 'KARNATAKA', 'INDIA', 'NA', 'NA', 4, 'A+', '2023-06-27', '827300637166', 0, 101, NULL),
(61, 'V07203', 'JOHN', '', 'ROHMINGTHANGA', 27, '1999-08-25', '7005745994', 'H.NO.7, SECTION III, KAWIZAU,SALEM VENG,LUNGLEL MIZORAM 796701     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'johnfanchun71@gmail.com', 2, 'O+', '2022-11-15', '597298720901', 0, 101, NULL),
(62, 'H02988 ', 'JAHANGIR', '', 'ALAM', 27, '1998-03-15', '8638804370', '066 KATANIGAON PATH NEAR NATUN MASZID KATANIGAON MAJPATHORI NAGAO ASSAM 782003      INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'ja242806@gmail.com', 2, 'O+', '2022-11-29', '395406440215', 0, 102, NULL),
(63, 'D00947', 'MOHD', '', 'SOHRAB KHAN', 39, '2000-03-12', '9971574356', '4/3, F M COLONY, CIVIL LINES, KANPUR UTTAR PRADESH 208001    208001 INDIA UTTAR PRADESH  ', 'UTTAR PRADESH', 'INDIA', 'NA', 'mdsohrabkhan1998@gmail.com', 2, 'B+', '2022-09-27', '255891325724', 0, 102, NULL),
(64, 'H02907', 'T', '', 'APONGSU SANGLAM', 29, '1995-12-28', '8073825291', 'NEAR CHURCH, PBO LONGKHIM, NEW MANGAKHI, TUENSANG, LONGKHIM, NAGALAND 798616     INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'apongsusangtam1999@gmail.com', 2, 'O+', '2018-02-16', '934726014782', 0, 102, NULL),
(65, 'H01556', 'DIPENDRA', '', 'SINGH KARKI', 27, '1997-10-30', '9673520391', 'NA', 'NA', 'INDIA', 'NA', 'NA', 2, 'O+', '2023-04-11', '436782308920', 0, 102, NULL),
(66, 'H03019', 'SHANUR', '', 'SHAH', 63, 'NA', '9763636820', '250,VARCHIWADI,SATELI BHEDSHI,DODAMARG,SINDHUDURG  MAHARASHTRA    416512 INDIA MAHARASHTRA ', 'MAHARASHTRA', 'INDIA', 'NA', 'shanurshah511@gmail.com', 19, 'O+', 'NA', '863579622471', 0, 102, NULL),
(67, 'H02986', 'KORON', '', 'KONWAR', 12, '2001-09-26', '9365528308', '5 NO LINE RUPAI TE 182 WI TINSUKIA ASSAM 786151      INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'koronkumar1@gmail.com', 2, 'A+', '2023-06-13', '224556864883', 0, 102, NULL),
(68, 'H03154', 'DELVAN', '', 'FREZILAN LUIS', 27, '1999-05-20', '9373126700', 'H.NO.24/329, COPELABHAT, DEAO, QUEPEM GOA 403705     INDIA GOA ', 'GOA', 'INDIA', 'NA', 'NA', 2, 'O-', '2022-11-22', '455346530959', 0, 102, NULL),
(69, 'H02996', 'JITU', '', 'KHARIA', 26, '1991-05-04', '8453700722', 'DEAMOOLIE T E, DIAMULI T E, 41 WI, TINSUKIA ASSAM 786151     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'jitukharia405@gmail.com', 2, 'B+', '2015-11-01', '593579957216', 0, 103, NULL),
(70, 'H00895', 'GANESH', '', 'SINGH', 29, '1995-08-30', '8411980544', 'NA', 'NA', 'INDIA', 'NA', 'NA', 2, 'O-', '2016-05-01', '908516019362', 0, 103, NULL),
(71, 'H01040', 'GANESH', '', 'SINGH SAUD', 27, '2001-06-14', '7038976637', 'BHEEMDATT MUNICIPALITY WARD NO-2, KANCHANPUR      NEPAL OTHER ', 'NEPAL', 'INDIA', 'NA', 'NA', 2, 'B+', '2021-11-24', '319322972336', 0, 103, NULL),
(72, 'H02643', 'SADANAND', '', 'GAWAS', 27, '2000-10-30', '7875071006', 'H NO. 160/16, SHANTI NAGAR HONDA, SATTARI NORTH GOA, GOA   403530 INDIA GOA ', 'GOA', 'INDIA', 'NA', 'gawassadanand1406@gmail.com', 2, 'O+', '2022-02-01', '996057031918', 0, 103, NULL),
(73, 'H02708', 'MARUF', '', 'YASEENALI NADAF', 27, '1990-10-01', '7249076450', 'C-79 B, BAHERCHAWADA SAWANTWADI , SINDHUDURG MAHARASHTRA   416510 INDIA GOA ', 'GOA', 'INDIA', 'NA', 'marufnadaf789@gmail.com', 2, 'A+', '2017-06-01', '343127992314', 0, 103, NULL),
(74, 'H01333', 'MAHADEV', '', 'BHOSALE', 27, '2002-11-20', '9579860563', 'H.NO.200 PIRACHI GALLI, PIMPALAGANV GRAM, BHUDARAGAD, KOLHAPUR      INDIA MAHARASHTRA ', 'MAHARASHTRA', 'INDIA', 'NA', 'NA', 2, 'B-', '2022-06-20', '840614088273', 0, 103, NULL),
(75, 'H02800', 'GAJANAN', '', 'CHAUGULE', 29, '1998-08-16', '8431023442', 'CHIKHALE KANAKUMBI BELGAUM  KARNATAKA 590014     INDIA KARNATAKA ', 'KARNATAKA', 'INDIA', 'NA', 'gaja2525@gmail.com', 2, 'O+', '2018-09-03', '698729119498', 0, 103, NULL),
(76, 'H01677', 'DINESH', '', 'SINGH', 27, '2002-10-28', '8007498324', 'KAITHARI, DHOLPUR RAJASTHAN     328027   ', 'RAJASTHAN', 'INDIA', 'NA', 'dineshsingh161998@gmail.com', 2, 'B+', '2022-11-22', '506237034509', 0, 103, NULL),
(77, 'H02994', 'UDAI', '', 'TANTI', 27, '2002-08-11', '6000138579', 'RACHI LINE, TIPUK T E 102 FS(A), TINSUKIA ASSAM 786156     INDIA ASSAM ', 'RAJASTHAN', 'INDIA', 'NA', 'udaitanti143@gmail.com', 2, 'B+', '2023-03-27', '242167724023', 0, 103, NULL),
(78, 'H03093', 'KHRAWKUPAR', '', 'MUKTIEH', 27, '2003-11-13', '7085621826', 'MAWLAI NONGKAR(BLOCK-6 A) LEWRYNGHEP, EAST KHASI HILLS, MAWLAI, MEGHALAYA     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'khrawkuparmuktiehleo@gmail.com', 2, 'B+', '2022-11-22', '693600825669', 0, 103, NULL),
(79, 'H02995', 'BITUPAN', '', 'CHETIA', 27, '2003-01-07', '6900283939', 'DUWANIA GAON, PARBATPUR, DIBRUGARH ASSAM 786623     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'chetiabitupan18@gmail.com', 2, 'B+', '2022-07-19', '560633262528', 0, 103, NULL),
(80, 'H02841', 'MARUTI', '', 'GAVADE', 27, '2000-06-14', '8767664063', 'MAIN ROAD MU KOLIK MHALUNGE  KHALASA,CHANDGAD KOLIK  KOLHAPUR  MAHARASHTRA 416507     INDIA MAHARASHTRA ', 'MAHARASHTRA', 'INDIA', 'NA', 'marutigawade20@gmail.com', 2, 'A+', '2022-09-06', '670530264725', 0, 103, NULL),
(81, 'H02891', 'AKASH', '', 'GYANDEV KADAM', 30, '1988-03-19', '9112198380', 'WAGHOLI,TAL HAVELI,DIST PUNE,  MAHARASHTRA 412207     INDIA MAHARASHTRA ', 'MAHARASHTRA', 'INDIA', 'NA', 'akashkadam9971@gmail.com', 8, 'O+', '2022-07-06', '471991803371', 0, 103, NULL),
(82, 'V06145', 'SUNIL', '', 'PANDEYA', 4, '1999-08-22', '9763230615', 'UTTARBEHADI, 04 DHANGADHI, KAILALI NEPAL      ', 'NEPAL', 'NEPAL', '', 'sunilpandeya1997@gmail.com', 1, 'B+', '2022-08-02', '570748257654', 0, 105, NULL),
(83, 'V06543', 'ABHISHEK', '', 'RATHORE', 3, '1989-07-11', '9340683355', 'S/o Narendra 789, Abhinandan Nagar,Mandsaur,Mandsau,Dist:Mandsaur,Madhya Pradesh      INDIA MADHYA PRADESH ', 'MADHYA PRADESH', 'INDIA', '', 'rathoreabhishek606@gmail.com', 1, 'B+', '2019-05-03', '482816692879', 0, 105, NULL),
(84, 'V04752', 'RISHI', 'RAM', 'SAPKOTA', 4, '1999-06-15', '9022963887', 'NAWALPUR, GAINDAKOT NEPAL       ', 'NEPAL', 'NEPAL', '', 'NA', 1, 'O+', '2022-02-16', '595597913358', 0, 105, NULL),
(85, 'V06164', 'AARAN', 'ASHISH', 'SEQUEIRA', 4, '2000-10-04', '8431616540', '1-29-2403/2, JPEGEBAO; ROAD BOLOOR VILLAGE, MANGLORE, ASHOKNAGAR DAKSHINA KANNADA, KARNATAKA      ', 'KARNATAKA', 'INDIA', '', 'NA', 1, 'A+', '2022-02-16', '758458636912', 0, 105, NULL),
(86, 'V06158', 'YASHAS', 'S', 'K', 1, '1994-06-15', '7204497822', '#4-51(5) ANUGRAHA KUMPANAMAJAL HOUSE PUDU VILLAGE, BANTWAL, FARANGIPET DAKSHINA KANNADA, KARNATAKA   574143   ', 'KARNATAKA', 'INDIA', '', 'yashassk4@gmail.com', 1, 'O+', '2020-11-25', '783806697937', 0, 105, NULL),
(87, 'V05345', 'ANKUSH', '', 'PATIAL', 4, '1991-08-12', '9284338489 ', 'VILLAGE KARLOLI PO KARLOLI TEHSLI GHUMARWIN KARLOLI   174029 INDIA HIMACHAL PRADESH ', 'HIMACHAL PRADESH', 'INDIA', '', 'NA', 1, 'B+', '2023-01-24', '231879844594', 0, 105, NULL),
(88, 'V07019', 'YAGYARAJ', 'HARIDATTA', 'JOSHI', 10, '1993-01-17', '9768378370', 'H NO 433 6 B, GROUND FLOOR, SOCCORRO, PORVORIM NORTH GOA GOA 403521     INDIA GOA ', 'GOA', 'INDIA', '', 'joshiyagyaraj46@gmail.com', 1, 'O+', '2023-01-10', '779444320226', 0, 105, NULL),
(89, 'V06989', 'CHETAN', 'SINGH', 'RAWAT', 4, '1999-06-02', '8999902153', 'BAITADI DASHARATHCHAND     NEPAL  ', 'NEPAL', 'NEPAL', '', 'chetanrawat420@gmail.com', 1, 'A+', '2022-02-22', '978627961190', 0, 105, NULL),
(90, 'V06174', 'DEEPENDRA', '', 'UPADHYAY', 42, '1981-05-01', '7499712156', '#15, 2ND CROSS, SANJEEVINI NAGAR, MOODALAPALYA, ANJINIYA, TEMPLE, BANGLORE, KARNATAKA  560072        ', 'KARNATAKA', 'INDIA', '', 'deepupadhayay0309@gmail.com', 1, 'B+', '2013-05-08', '603343226275', 0, 106, NULL),
(91, 'H00680', 'ASHOK', 'RAJ', 'JOSHI', 4, '1998-01-23', '9850543341', 'NA', 'NA', 'INDIA', '', 'joshias2006@yahoo.com', 1, 'B+', '2022-08-29', '617098791302', 0, 106, NULL),
(92, 'V06635', 'DHIRENDRA', '', 'CHAUDHRY', 2, '1999-07-04', '9763230615', 'H NO 1006/1 VIJAY NAGAR ALTO PORVORIM NORTH GOA GOA 403521      INDIA GOA ', 'GOA', 'INDIA', '', 'chaudharydhirendra573@gmail.com', 1, 'AB+', '2022-11-29', '946796646570', 0, 106, NULL),
(93, 'V06851', 'GOVIND', 'RAJ', 'PANDEY', 10, '1994-07-30', '7820890932', 'MELAULI 2 BAITADI NEPAL    NEPAL  ', 'NEPAL', 'NEPAL', '', 'NA', 1, 'B+', '2014-05-15', '608685347893', 0, 106, NULL),
(94, 'D00089', 'PIKESH', '', 'CHAUDHARY', 8, '1989-11-21', '7083868528', 'BHIMDATTA NAGAR, KANCHANPUR, NEPAL      NEPAL  ', 'NEPAL', 'NEPAL', '', 'pikeshchaudharypk@yahoo.com', 1, 'A+', '2016-02-01', '882885979655', 0, 106, NULL),
(95, 'V02894', 'PRATAP', 'SINGH', 'KARKI', 43, '1992-12-30', '7264921320', '        ', 'NA', 'INDIA', '', 'karki-prashant@ymail.com', 1, 'A+', '2013-10-01', '674260660357', 0, 106, NULL),
(96, 'V00847', 'PUSKAR', 'BAHADUR', 'CHAND', 4, '1999-03-07', '7083298041', '        ', 'NA', 'INDIA', '', 'NA', 1, 'B+', '2022-02-17', '648785273324', 0, 106, NULL),
(97, 'V06163', 'KISHORE', '', 'CHAND', 63, 'NA', '8076234966', 'H. NO. 1-7/90, SECTOR -16, ROHINI ROHINI SECTOR 16 , NORTH WEST DELHI DELHI    110085   ', 'DELHI', 'INDIA', '', 'thakurkishor498@gmail.com', 19, 'A+', 'NA', '729175124815', 0, 106, NULL),
(98, 'D00999', 'PRAKASH', '', 'BAGLARY', 4, '1998-08-01', '9864850802', 'DAILANG KHUTI,UDALGURI ASSAM-784509     INDIA ASSAM ', 'ASSAM', 'INDIA', '', 'prokashbaglary23@gmail.com', 1, 'A+', '2021-11-17', '720802320062', 0, 107, NULL),
(99, 'V05934', 'NITIN', '', 'KUMAR', 4, '1996-07-31', '8926262660', 'H. NO. 519, MAHENDER GARH ROAD GANESH COLONY, NARNAUL MAHENDRAGARH , HARYANA   123001   ', 'HARYANA', 'INDIA', '', 'official.nitin.ni@gmail.com', 1, 'A+', '2022-03-23', '482016790327', 0, 107, NULL),
(100, 'D00809', 'JUGAL', 'KISHORE', 'SHARMA', 3, '1990-07-09', '8299825159', '405/3 SARAI MALI KHA SHOWK LUCKNOW UTTAR PRADESH 226003    INDIA UTTAR PRADESH ', 'UTTAR PRADESH', 'INDIA', '', 'ojugaljd16@gmail.com', 1, 'O', '2022-05-24', '420847818755', 0, 107, NULL),
(101, 'H02779', 'SHIVRAJ', 'SHARNAPPA', 'DEVDURG', 4, '2002-04-24', '9324209416', 'R.C.MARG., NEAR SANTOSH GENERAL STORE., ROOM NO.201, SHASTRI NAGAR, VASHINAKA., FCI S.O, FCI, MUMBAI, MAHARASHTRA, 400074     INDIA MAHARASHTRA ', 'MADHYA PRADESH', 'INDIA', '', 'shivraj08@gmail.com', 1, 'A+', '2022-11-22', '657861507033', 0, 107, NULL),
(102, 'V06823', 'SURAJ', '', 'PANDEY', 4, '2000-04-17', '8011774951', 'JOYPUR TOWN, DIBRUGARH ASSAM 786614    786614 INDIA ASSAM ', 'ASSAM', 'INDIA', '', 'sp9778322@gmail.com', 1, 'B-', '2022-11-22', '618404178924', 0, 107, NULL),
(103, 'D00940', 'PALASH', '', 'TAMULY', 4, '1998-08-31', '7896675896', 'TENGAKHAT, ABHOIPURIA, DIBRUGARH ASSAM 786103    786103 INDIA ASSAM ', 'ASSAM', 'INDIA', '', 'palashtamuli7896@gmail.com', 1, 'AB+', '2023-01-31', '311103921652', 0, 107, NULL),
(104, 'H03067', 'RAJA', '', 'BHOWMICK', 4, '1999-04-26', '8918161496', 'NAGARUKHRA KATHALTALAPARA NAGARUKHRA HARINGHATA NADIA WEST BENGAL      INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', '', 'rajabhowmick228@gmail.com', 1, 'B+', '2022-08-18', '556146018403', 0, 107, NULL),
(105, 'H02870', 'PRATEEK', '', 'SARKI', 1, '1999-09-20', '8974261079', 'NASPATI GHARI, BARA BAZAR, EAST KHASI HILLS, LEWDUH,  MEGHALAYA 793002     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', '', 'theking260499@gmail.com', 1, 'B+', '2021-12-09', '825064236769', 0, 108, NULL),
(106, 'H02654', 'RIWAJ', '', 'CHHETRI', 1, '1997-11-12', '8617085494', 'MISSION HILL  GORUBATHAN, DARJEELING WEST BENGAL   735231 INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', '', 'myselfriwaj@gmail.com', 1, 'O+', '2021-12-22', '798825494892', 0, 108, NULL),
(107, 'H02666', 'AAKASH', '', 'RAI', 1, '1995-07-07', '7083370517', 'LOWER LADAM (BENDA) LADAM KHASMAHAL, KAGAY BAZAR DARJEELING , WEST BENGAL   734311   ', 'WEST BENGAL', 'INDIA', '', 'cobeinchamling95@gmail.com', 1, 'B+', '2021-12-17', '676703809414', 0, 108, NULL),
(108, 'H02664', 'DEEP', '', 'NEWAR', 10, '1996-08-11', '8415077217', 'ELECTRICAL COLONY, DIRANG WEST KAMENG ARUNACHAL PRADESH   790101   ', 'ARUNACHAL PRADESH', 'INDIA', '', 'deepnewar1994@gmail.com', 1, 'O+', '2022-02-13', '396087712810', 0, 108, NULL),
(109, 'V06144', 'SUBHAM', '', 'CHAND', 1, '1998-12-08', '9834301911', 'KANCHANPUR  MEHENDRANAGAR     NEPAL  ', 'NEPAL', 'NEPAL', '', 'NA', 1, 'O', '2023-02-14', '897366173156', 0, 108, NULL),
(110, 'H03079', 'AEBISH', '', 'PAYENG', 4, '2004-01-13', '7636045274', 'SONAIMIRI, LOKRA DAFALA GAON, SONITPUR ASSAM 784102     INDIA ASSAM ', 'ASSAM', 'INDIA', '', 'aebishpayeng@gmail.com', 1, 'B+', '2023-01-24', '469687893524', 0, 108, NULL),
(111, 'V07015', 'RAKESH', '', 'SINGH', 2, '1998-11-26', '9304238648', 'GRAM POST SONBARSHA,THANA NAWANAGAR,KESATH BUXAR  BIHAR     INDIA BIHAR ', 'BIHAR', 'INDIA', '', 'NA', 1, 'O+', '2023-07-07', '762482600367', 0, 108, NULL),
(112, 'D01043 ', 'NON', '', 'TAYENG', 4, '2000-01-17', '8257804255', 'E-94, TAPAT, LOWER DIBANG VALLEY ARUNANCHAL PRADESH 792110     INDIA ARUNANCHAL PRADESH ', 'ARUNACHAL PRADESH', 'INDIA', '', 'nontayeng47@gmail.com', 1, 'O+', '2022-07-19', '639085547766', 0, 108, NULL),
(113, 'H02833', 'ROMAL', '', 'SAWMA', 4, '2002-09-19', '8131964111', '122, ZOTLANG, M SECTION, ZOTLANG, CHAMPHAI, MIZORAM 796321     INDIA MIZORAM ', 'MIZORAM', 'INDIA', '', 'NA', 1, 'O+', '2022-12-07', '505812808883', 0, 109, NULL),
(114, 'H03018 ', 'JOY', '', 'URAON', 4, '1998-10-11', '9749006380', 'SUBHASHPALLY, JAYGAON (CT) JALPAIGURI, JALGAON WEST BENGAL 736182    736182 INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', '', 'joyuraon8@gmail.com', 1, 'O+', '2022-09-06', '635478384070', 0, 109, NULL),
(115, 'H02894', 'KARAN', 'DEV', 'BHATT', 27, '2002-06-11', '9307388795', 'SECTOR 35, VILLAGE MORNA, NOIDA, GAUTAM BUDDHA NAGAR, UTTAR PRADESH 201301     INDIA UTTAR PRADESH ', 'UTTAR PRADESH', 'INDIA', '', 'sunilbhatt3619@gmail.com', 2, 'B+', '2022-07-19', '224101266338', 0, 109, NULL),
(116, 'H02835', 'ZOREM', '', 'MAWIA', 4, '2001-07-04', '7422949327', 'VENGTHLANG, N KHAWBUNG, CHAMPHAI, MIZORAM 796321     INDIA MIZORAM ', 'MIZORAM', 'INDIA', '', 'NA', 1, 'B+', '2023-01-24', '279971872882', 0, 109, NULL),
(117, 'V07005', 'MAHENDRA', '', 'THAPA', 7, '2001-05-19', '7431920357', 'UPPER KHANI, SLOKBHIR KHASMAHAL, SEOKBIR, DARJEELING WEST BENGAL 734301     INDIA WEST BENGAL  ', 'WEST BENGAL', 'INDIA', '', 'mt2537317@gmail.com', 3, 'O+', '2023-02-07', '428477850963', 0, 109, NULL),
(118, 'H03077', 'ALLAN', 'GEORGE', 'RATNAN', 2, '2004-05-15', '7477867251', 'HOMES B-2,HOMES ST.AND GRAIHMS TOPKHANA KALIMPOMG DARJEELING WEST BENGAL      INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', '', 'allansundas@007@gmail.com', 1, 'O+', '2023-02-07', '296178843537', 0, 109, NULL),
(119, 'H03074', 'DARPAN', '', 'RAI', 7, '2001-06-23', '8389842990', 'KAMESHI, COMESI FOREST, KALLIMPONG, DARJEELING WEST BENGAL      INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', '', 'drai98108@gmail.com', 3, 'B+', '2023-02-07', '806810463593', 0, 109, NULL),
(120, 'H03075', 'NORBU', 'TSHERING', 'LEPCHA', 4, '1998-10-17', '9883774679', 'MARTAM PW, MARTAM NAZITAM GUP,UPPER MARTAM EAST SIKKIM  SIKKIM      INDIA SIKKIM ', 'SIKKIM', 'INDIA', '', 'neurotshering10@gmail.com', 1, 'A+', '2023-01-31', '304056658540', 0, 109, NULL),
(121, 'V07023', 'KHEM', 'PROSAD', 'BHUJEL', 4, '2003-07-16', '9101047701', 'PASNOI KHUTI MAJBAT UDALGURI  ASSAM     INDIA ASSAM ', 'ASSAM', 'INDIA', '', 'NA', 1, 'A+', '2022-08-23', '479311779974', 0, 110, NULL),
(122, 'V06611', 'ANSHUK', 'KR', 'SHARMA', 1, '1997-04-10', '6913649224', 'SANTINAGAR, BALADMARI CHAR PT I, GOALPARA ASSAM 783121     INDIA ASSAM ', 'ASSAM', 'INDIA', '', 'anshuksharma0@gmail.com', 1, 'O+', '2021-02-25', '259044844375', 0, 107, NULL),
(123, 'V05662', 'ASIT', '', 'SENAPATI', 1, '1994-12-09', '8917635984', 'GAMBHARIA, BAJITPUR BHOGRAI, GAMBHARIA BALESWAR, ODISHA   756085 INDIA ODISHA ', 'ODISHA', 'INDIA', '', 'asitsenapati88@gmail.com', 1, 'B+', '2021-02-26', '803515054221', 0, 110, NULL),
(124, 'V05670', 'SUBHASH', '', 'DEKA', 8, '1992-09-21', '8822865675', '15 NO. NATIONAL HIGHWAY JAAKUAPARA, KALITAPARA DARRANG ASSAM   784145   ', 'ASSAM', 'INDIA', '', 'subhashdeka07@gmail.com', 1, 'B+', '2016-03-16', '361726990614', 0, 110, NULL),
(125, 'H00945', 'SUMIT', '', 'THAPA', 4, '1994-09-12', '8390550698', 'NA', 'NA', 'INDIA', '', 'sumit.thapa7@yahoo.com', 1, 'O+', '2023-06-15', '811767672836', 0, 110, NULL),
(126, 'H03161', 'NAYANANANDA', '', 'GOHAIN', 4, '1999-03-03', '8402807990', '1 NO RAJGHAR PHUTAHULA DIBRUGARH ASSAM 786010     INDIA ASSAM ', 'ASSAM', 'INDIA', '', 'nayanananda74@gmail.com', 1, 'O+', '2023-01-04', '383417715039', 0, 110, NULL),
(127, 'H03041', 'SONU', 'SINGH', 'RAWAT', 1, '1998-02-24', '7980267941', 'KWARAB, KOSYA KUTOLI, NANITAL UTTARAKHAND 263138     INDIA UTTARAKHAND ', 'UTTARAKHAND', 'INDIA', '', 'sonu7980267941@gmail.com', 1, 'O+', '2023-02-20', '775825834094', 0, 110, NULL),
(128, 'H03082', 'SHIMANTA', '', 'DAS', 63, 'NA', '8135019223', 'JIA GABHARU, NO 4 JHAWANI, SONITPUR, GARUBANDHA ASSAM 784506     INDIA ASSAM ', 'ASSAM', 'INDIA', '', 'rdrohitdas84@gmail.com', 19, 'AB+', 'NA', '400432080638', 0, 110, NULL),
(129, 'V06610 ', 'RAJMIN', '', 'AMIN', 4, '2000-02-15', '8811924711', 'NA', 'NA', 'INDIA', '', 'NA', 1, 'NA', '2023-01-31', 'NA', 0, 111, NULL),
(130, 'H03069', 'JITENDRA', '', 'KUMAR', 63, 'NA', '8409748490', 'HEMJAPUR CHAND TOLA SHIVKUND THANA DHARAHARA JAMALPUR MUNGER  BIHAR     INDIA BIHAR ', 'BIHAR', 'INDIA', '', 'jitukumar12120@gmail.com', 19, 'O+', 'NA', '693108557327', 0, 111, NULL),
(131, 'V06613 ', 'SANJAY', '', 'SINGH', 4, '1996-01-25', '8011513802', 'NA', 'NA', 'INDIA', '', 'NA', 1, 'NA', '2021-11-01', 'NA', 0, 111, NULL),
(132, 'V05900', 'ABHISHEK', '', 'VERMA', 2, '1998-07-25', '8503996090', '86, SHIV MANDIR  BANAR JAIPUR RAJASTHAN   303105   ', 'RAJASTHAN', 'INDIA', '', 'abhishekverma2501@gmail.com', 1, 'B+', '2023-04-11', '630181269137', 0, 111, NULL),
(133, ' V07095', 'SAYANTAN', '', 'JANA', 4, '1999-08-23', '8420719307', 'UV-26-03D UDAYAN 1050/1 SURVEY PARK SANTOSHPUR WEST BENGAL 700075     INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', '', 'sayantan.985j@gmail.com', 1, 'O+', '2023-01-31', '357582358200', 0, 111, NULL),
(134, 'H03065', 'ARIF', '', 'HOSSAIN', 44, '1984-04-16', '9123674265', 'U 82/2 SLAUGHTER HOUSE LANE BARLALA KOLKATA WEST BENGAL      INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', '', 'arhossain0786@gmail.com', 12, 'O+', '2023-04-18', '832484063640', 0, 111, NULL),
(135, 'H02107', 'LALRAMMAWII', '', '', 1, '2000-02-06', '9077543381', 'C-12, CHITE ROAD NEAR COMMUNITY; HALL, ARMED VENG SOUTH AIZWAL MUNCIPAL COUNCIL   796008  MIZORAM ', 'MIZORAM', 'INDIA', 'NA', '', 1, 'A+', '2020-12-08', '860976181953', 0, 1, NULL),
(136, 'V05426', 'LALHMINGCHAWII', '', '', 1, '1994-05-19', '8794693472', 'C-28/3, SECTION -III ARMED VENG SOUTH, NEAR COMMUNITY HALL AIZAWL MUNICIPAL COUNCIL MIZORAM  796008   ', 'MIZORAM', 'INDIA', 'NA', '', 1, 'O+', '2020-12-08', '592792489191', 0, 1, NULL),
(137, 'V05423', 'F', '', 'LALCHHANCHHUAHI', 2, '2004-03-04', '8413936014', 'HT/65, T SECTION, NEAR BAPTIST CHURCH,  HUNTHAR MUNICIPAL COUNCIL, VAIVAKAWN AIZAWL    796009 INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'achhanifanai739@gmail.com', 1, 'B+', '2020-12-08', '746154705769', 0, 1, NULL),
(138, 'V07309', 'LALHMANGAIHZUALI', '', '', 2, '1998-03-05', '8794352494', '', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-07-29', 'NA', 0, 1, NULL),
(139, 'V07174', 'RINGAMPHI', '', 'RUNGSUNG', 2, '1995-06-12', '7406275226', 'TALUI VILLAGE, TOLIOI, UKHRUL, MANIPUR  MANIPUR 795142     INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'ringamphirungsung@gmail.com', 1, 'O+', '', '640399801711', 0, 2, NULL),
(140, 'V07175', 'T', '', 'S RAIVEINE', 3, '1993-03-08', '9663559066', 'H.NO.40, KHABUNG KARONG, SENAPATI MANIPUR     INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', '', 1, 'O+', '', '803732798198', 0, 2, NULL),
(141, 'V06343', 'LALDUHKIMI', '', '', 4, '1999-01-29', '8379866169', 'D-87 MUAL VENG SIHPUI TUKHUR DURTLANG AIZWAL 796014 INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'mdralte8@gmail.com', 1, 'O+', '2022-05-17', '521226102308', 0, 2, NULL),
(142, 'V06520', 'RINGMICHON', '', 'KASOMWOSHI', 4, '2003-02-28', '9612719807', 'CHINGAI VILLAGE, CHINGAI, UKHRUL, MANIPUR 795142     INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'ringmichonkasomwo@gmail.com', 1, 'A+', '2022-07-15', '326909900414', 0, 2, NULL),
(143, 'V06275', 'PEMYA', '', 'LUNGLO', 5, '2001-09-08', '9863628969', 'RAMVA URKHUL DISTRICT MANIPUR  MIZORAM 795142   795142  MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'pemyalunglo@gmail.com', 2, 'A+', '2022-07-17', '650936664564', 0, 2, NULL),
(144, 'H02840', 'MANJITA', '', 'CHETTRY', 1, '1999-12-15', '7005765219', 'HOUSE NO 89, HENGBUNG, SENAPATI, MANIPUR 795129     INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'manjitachettri14@gmail.com', 1, 'B+', '2022-07-18', '904224247542', 0, 2, NULL),
(145, 'D00427', 'KAVINI', '', 'K AWOMI', 1, '1993-10-18', '9366806556', 'H. NO. 540, MODEL COLONY PURANABAZAR A  DIMAPUR NAGALAND  797116   ', 'NAGALAND', 'INDIA', 'NA', '', 1, 'B+', '2021-11-27', '909737978493', 0, 3, NULL),
(146, 'D00428', 'IMOTILA', '', 'JAMIR', 1, '1997-03-16', '8858925870', 'H. NO. 402, ARTANG WARD MOKOKCHUNG (MC) MOKOKCHUNG NAGALAND  798601   ', 'NAGALAND', 'INDIA', 'NA', '', 1, 'A+', '', '710803053897', 0, 3, NULL),
(147, 'D00437', 'AKUMSENLA', '', '', 2, '1999-07-18', '9612223632', 'H NO. 317, WARD 7 CHUMUKEDIMA DIMAPUR NAGALAND  797103   ', 'NAGALAND', 'INDIA', 'NA', 'www.akumsenla950@gmail.com', 1, 'O+', '2021-08-31', '956811308903', 0, 3, NULL),
(148, 'V07194', 'PRETTY', '', 'SANGMA', 6, '2002-12-16', '8471912812', 'GOHAL KONA, KAMRUP, ASSAM ASSAM 781123     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'prettyharfrin666@icloud.com', 3, 'B+', '2023-06-12', '608313700172', 0, 3, NULL),
(149, 'V06591', 'AMANISHA', '', 'DAS', 4, '2004-02-09', '7099355383', 'MANGALDAI GAON, DARRANG, ASSAM 784125     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'ankitada349@gmail.com', 1, 'B+', '2022-08-18', '966302849911', 0, 3, NULL),
(150, 'V06903', 'MRIGAKHI', '', 'BORAH', 4, '2001-12-05', '6001546960', 'MORANGIAL GAON JORHAT ASSAM     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'mrigakhiborah2004@gmail.com', 1, 'A+', '2022-12-05', '957611288285', 0, 4, NULL),
(151, 'V06899', 'SABINA', '', 'THAPA', 4, '2002-03-25', '6909018921', 'TAPHOU NEPALI PART I ,NAGA SENAPATI  MANIPUR     INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'magarsabina693@gmail.com', 1, 'AB+', '2022-12-22', '472809634509', 0, 4, NULL),
(152, 'V06286', 'LALDUHSAKI', '', '', 4, '2003-04-27', '8415099696', 'Y-4/3, CHHINGA VENG, NEARYMA PRESBYTERIAN CHURCH, Y-SECTION, AIZAWL MUNCIPAL COUNCIL, AIZAWL, AIZAWL, MIZORAM 796001   796001 INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'clussid02@gmail.com', 1, 'B+', '2022-04-21', '600264795250', 0, 4, NULL),
(153, 'V06287', 'SUPRIYA', '', 'PUN', 4, '2002-06-02', '6909288346', 'B-95, CSECTION, ICFAI ROAD DURTLANG NORTH AIZWAL BAWNGKAWN MIZORAM    INDIA  ', 'MIZORAM', 'INDIA', 'NA', 'maliksupriya61@gmail.com', 1, 'A+', '2022-04-21', '480905041379', 0, 4, NULL),
(154, 'V06905', 'SIMRAN', '', 'BHUMIJ', 4, '2000-02-19', '9101860460', 'HATIALI SIDING GRANT DIBRUGARH ASSAM     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'simranbhumij44@gmail.com', 1, 'A+', '2022-12-05', '878701370070', 0, 4, NULL),
(155, 'D00922', 'VANLALREMTLUANGI', '', '', 1, '1991-10-19', '9366189559', 'VENGHLUI, CHAMRING, AIZAWL, AIBAWK MIZORAM 796190     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'mamipachuau202@gmail.com', 1, 'B+', '2023-01-31', '815520761645', 0, 4, NULL),
(156, 'H03152', 'GRACE', '', 'LALZAWMLIANI', 3, '1995-12-14', '7038054557', 'D/CH-38 A, DINTHAR, AIZAWL MUNCIPAL COUNCIL, AIZAWL MIZORAM 796009     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'gchhakchhuak@ymail.com', 1, 'O+', '2023-06-03', '885935439746', 0, 5, NULL),
(157, 'H01498', 'R', '', 'C LALRUATFELI', 3, '1999-12-12', '8767083147', 'C/O SALEMTHARI, H NO. 11, VENGLAI, NEAR PRESBYTERIAN CHURCH , SERCHHIP, MIZORAM        ', 'MIZORAM', 'INDIA', 'NA', '', 1, 'AB+', '', '275666760422', 0, 5, NULL),
(158, 'V04301', 'VANLALNGHAKI', '', '', 4, '1998-10-16', '9774309752', 'E-17, E BAIL 5 NA, NEAR KM HIGH SCHOOL, DAWNPUI VENGTHAR, AIZAWL , MIZORAM      796009   ', 'MIZORAM', 'INDIA', 'NA', '', 1, 'O+', '2021-01-23', '372214260864', 0, 5, NULL),
(159, 'H02069', 'LALZAMLOVI', '', 'PAUTU', 1, '1992-01-29', '7005540036', '66, CHHIM VENG NEAR UPC, VAIRENGTE KOLASIB MIZORAM  796101 INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'maryzcepautu@gmail.com', 1, 'O', '2021-09-06', '321064590979', 0, 5, NULL),
(160, 'V06630', 'REMTLUANGPUII', '', '', 4, '1997-02-07', '7030375742', 'VENGCHUNG, NEAR GOVT MIDDLE SCHOOL, SERCHHIP, MIZORAM 796181     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'remiralte956@gmail.com', 1, 'O+', '2022-08-18', '280134956611', 0, 5, NULL),
(161, 'V07032', 'VANLALREMRUATI', '', '(ENETH)', 3, '1995-04-11', '7000420614', 'SAIHATLANGKAEN I, SAIHA  MIZORAM 796901     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'vanlalremruatieneth@gmail.com', 1, 'A+', '2023-01-24', '732352334326', 0, 7, NULL),
(162, 'V04302', 'VANLALHRIATPUII', '', '', 4, '2000-05-06', '8837408676', 'B - 127, VENGPUI, NEAR COMMUNITY HALL, DARLAWN , AIZAWL, MIZORAM      796111   ', 'MIZORAM', 'INDIA', 'NA', '', 1, 'A+', '2019-08-26', '273064736768', 0, 7, NULL),
(163, 'H02882', 'REBECCA', '', 'LALDUHKIMI', 7, '2001-11-26', '9862978991', '11 SECTOR-E SAIRANG ELECTRIC VENG NEAR YMA HALL,SAIRANG AIZAWL MIZORAM 796410      INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'rebeccalalduhkimi@gmail.com', 3, 'O+', '2022-08-18', '267198226759', 0, 7, NULL),
(164, 'V07298', 'CHRISTINA', '', 'PRIYA SAHA', 3, '1997-05-12', '7044649153', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-07-24', 'NA', 0, 7, NULL),
(165, 'V03896', 'LALRINMAWII', '', '', 1, '1995-10-01', '8669897346', 'E-078, SECTION E , ELECTRIC VENG, SAIRANG, AIZAWL,       INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', '', 1, 'A+', '2019-12-08', '566255516870', 0, 7, NULL),
(166, 'V04440', 'MALSAWMPUII', '', 'HMAR', 3, '1997-07-12', '8415883099', 'KHAMPAILUNG, SERCHHIP DIST, AIZWAL, MIZORAM, NEAR HIGH SCHOOL        ', 'MIZORAM', 'INDIA', 'NA', 'sawmpuiihmax10@gmail.com', 1, 'A+', '2021-06-01', '807362910307', 0, 8, NULL),
(167, 'V04300', 'LILYPARMAWII', '', '', 3, '1989-10-13', '8257966784', 'C-258, SECTION - III, NEAR PLAY GROUND, ARMED VENG, AIZAWL,MIZORAM     796001   ', 'MIZORAM', 'INDIA', 'NA', '', 1, 'O+', '2019-08-26', '389207082832', 0, 8, NULL),
(168, 'V03714', 'RUTHI', '', 'RAMENGMAWII', 1, '1992-03-16', '7218860161', 'LV-A37(a), RAMTHAR, NEAR R C KHUMA ROAD, LEITAN. TIANGNUAM    AIZWAL  INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', '', 1, 'B+', '2019-12-08', '213047596203', 0, 8, NULL),
(169, 'V04415', 'KUZHOPOLU', '', 'CHIZO', 1, '1995-12-19', '7721832795', 'PO - PHEK, MISSION COMPOUND PHEK SADAR NAGALAND   797108   ', 'NAGALAND', 'INDIA', 'NA', 'kchizo17@gmail.com', 1, 'O+', '2021-02-19', '333766747357', 0, 8, NULL),
(170, 'V04438', 'R', '', 'LALHUMHIMI', 1, '1997-01-28', '9370758507', 'A 712, SECTION 2 NEAR TURNNING POINT AIZWAL, VENGLAI MIZORAM  79607   ', 'MIZORAM', 'INDIA', 'NA', '', 1, 'O+', '2021-03-20', '575325969212', 0, 8, NULL),
(171, 'V04437', 'LALRUATFELI', '', '', 1, '1994-05-14', '8575162003', 'N -44 A, NEUVA SECTION MUABAWK ROAD, BUNGKAWN AIZWAL MUNICIPAL COUNCIL MIZORAM  796001   ', 'MIZORAM', 'INDIA', 'NA', '', 1, 'O+', '2019-12-08', '459864934589', 0, 8, NULL),
(172, 'V04471', 'KANCHUILA', '', 'LEISAN', 1, '1996-12-27', '7264947088', 'SEIKHOR , UKHRUL  CENTRAL SUB - DIVISION  MANIPUR    795142   ', 'MANIPUR', 'INDIA', 'NA', 'kanchuilamercy@gmail.com', 1, 'O+', '', '512766001936', 0, 9, NULL),
(173, 'V04565', 'WONKHUIMI', '', 'LEISAN', 1, '1993-06-03', '8390138837', 'SEIKHOR , UKHRUL MANIPUR    795142   ', 'MANIPUR', 'INDIA', 'NA', 'leisanwomkhuimi@gmail.com', 1, 'O+', '', '744835011570', 0, 9, NULL),
(174, 'D00620', 'WATIASENLA', '', '', 8, '1986-06-07', '8787450725', 'ALONGMEN,  MOKOKCHUNG TOWN NAGALAND   798601   ', 'NAGALAND', 'INDIA', 'NA', '', 1, 'AB+', '2019-12-07', '727940983093', 0, 9, NULL),
(175, 'H00927', 'SARUNA', '', 'PRADHAN', 1, '1993-11-26', '7076331236', '        ', 'NA', 'INDIA', 'NA', 'sarunapradhan756@gmail.com', 1, 'O+', '2021-04-24', '411102462130', 0, 9, NULL),
(176, 'D00825', 'C', '', 'LALZIRMAWII', 1, '1997-06-01', '9362629347', 'H.NO.343 RAMHLUN SOUTH 1 AIZWAL MUNCIPAL COUNCIL AIZWAL MIZORAM 796012    INDIA  ', 'MIZORAM', 'INDIA', 'NA', 'lalzirmawiic@gmail.com', 1, 'AB+', '2022-04-13', '751828491112', 0, 9, NULL),
(177, 'V07287', 'SAGARIKA', '', 'RANA', 4, '2000-08-02', '8200384745', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-07-07', 'NA', 0, 9, NULL),
(178, 'H02884', 'MALSAWMDAWNGZUALI', '', '', 4, '2002-02-28', '8415029667', 'F-66/I JAMPLAZ STREET LOWER CHANMARI AIZAWL,MINICIPAL COUNCIL AIZAWL MIZORAM796007      INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'malsawmdawngzuali5@gmail.com', 1, 'O+', '2022-08-20', '722811518539', 0, 10, NULL),
(179, 'H03003 ', 'MALSAWMKIMI', '', '', 3, '1994-08-11', '7005483987', 'CNBF 7C CHALTLANG, SALVATION ARMY BIAK IN MUAL, AIZAWL MUNCIPAL COUNCIL, AIZAWL MIZORAM 796012     INDIA MIZORAM  ', 'MIZORAM', 'INDIA', 'NA', 'kimanastasio28@gmail.com', 1, 'A+', '2022-11-21', '806671368797', 0, 10, NULL),
(180, 'V03270', 'RAMENGMAWII', '', 'FANAI', 4, '1997-07-13', '7720125698', 'NEW SAIHA EAST-II, VILL SAIHA     796901 India MIZORAM ', 'MIZORAM', 'INDIA', 'NA', '', 1, 'A+', '', '210504808330', 0, 10, NULL),
(181, 'D00921', 'REBECCA LALPIANFELI', '', '', 2, '2000-01-02', '7479026728', 'S MAUBUANG, AIZAWL, AIBAWK MIZORAM 796190     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'chenkualrebecca13@gmail.com', 1, 'O+', '2022-08-04', '925022707532', 0, 10, NULL),
(182, 'H03150', 'KAUSHILLA', '', 'TAMANG', 7, '2000-09-18', '6296093199', 'SURUK KHASMAHAL, KALIMPONG, DARJEELING WEST BENGAL 734301     INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'sellytamang223499@gmail.com', 3, 'O+', '2022-06-17', '404296858037', 0, 11, NULL),
(183, 'H03192', 'SUSU', '', 'HANGMA SUBBA', 3, '1998-03-27', '9064437748', 'NA', '', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-07-10', 'NA', 0, 11, NULL),
(184, 'V05235', 'SANDHYA', '', 'SUBBA', 4, '1997-10-23', '8372602697', 'RIDNAG PW TIMBURBONG GPU WEST SIKKIM   737121   ', 'WEST SIKKIM', 'INDIA', 'NA', 'sndhsubba@gmail.com', 1, 'O+', '', '590890761056', 0, 11, NULL),
(185, 'V06391', 'NANDIKA', '', 'PRADHAN', 4, '1997-05-13', '9862493103', 'UPPER MAWPREM, NEAR SHIV MANDIR, UPPER MAWPREM, SHILLONG (MB), EAST KHASI HILLS, LEWDUH, MEGHALAYA 793002     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'nandikapradhan10@gmail.com', 1, 'A+', '2022-05-28', '765604913712', 0, 11, NULL),
(186, 'V05880', 'PUSPA', '', 'MANGER', 6, '1998-04-08', '8101956821', 'KOPIBARI-SYARI PW, SYARI ROAD LAGAMTHANG KOPIBARI SYARI TATHANGCHEN SYARI GPU , TADONG, EAST SIKKIM   737102   ', 'EAST SIKKIM', 'INDIA', 'NA', 'puspamanger0@gmail.com', 3, 'A+', '2021-10-26', '481401142074', 0, 11, NULL),
(187, 'H02949', 'NIKITA', '', 'TAMANG', 8, '1997-02-07', '8001801943', 'BAGH DHARA ROAD NEAR SAI MANDIR SACHOOL LOWER SADHU DHARA KALIMPONG-I DARJEELING WEST BENGAL 734301     INDIA WEST BENGAL  ', 'WEST BENGAL', 'INDIA', 'NA', 'tamangnikita889@gmail.com', 1, 'A+', '2022-09-26', '514257228600', 0, 12, NULL),
(188, 'V03190', 'LALLAWMZUALI', '', '', 4, '1997-08-27', '7887933350', 'KEIFANG, VENGHLUN, TWAI      INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', '', 1, 'A+', '2022-09-26', '686188713767', 0, 12, NULL),
(189, 'H03147', 'LALTLEIPUII', '', '', 8, '1994-04-01', '9774373920', 'ITI VENG,AIZAWL MUNICIPAL COUNCIL,AIZAWL MIZORAM    796001 INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', '', 1, 'O+', '2023-05-30', '994153909626', 0, 12, NULL),
(190, 'V05043', 'M', '', 'W THINGMILA', 5, '2000-07-07', '9284822034', 'T. CHANHONG VILLAGE, UKHRUL MANIPUR, PIN-795142        ', 'MANIPUR', 'INDIA', 'NA', '', 2, 'A+', '', '576506049773', 0, 12, NULL),
(191, 'H03001', 'ANISHA', '', 'MINZ', 8, '1994-03-03', '7645918697', 'HOUSE NO 554 MIDDLE LANE DANGRATOLI FATIMA NAGAR RANCHI GPO RANCHI JHARKHAND 834001     INDIA JHARKHAND  ', 'JHARKHAND', 'INDIA', 'NA', 'anishaminz0707@gmail.com', 1, 'B+', '2023-02-12', '445272872695', 0, 12, NULL),
(192, 'V03187', 'RINGAMLA', '', 'HUNGYO', 2, '1999-01-28', '9373456414', 'IRONG TANGKHUL, SENAPATI      INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', '', 1, 'O+', '', '580657770963', 0, 13, NULL),
(193, 'V07271', 'RINKHAR', '', 'NGASHANGVA', 8, '1992-12-17', '9378154596', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-07-07', 'NA', 0, 13, NULL),
(194, 'V03189', 'M', '', 'WORCHUIRIN', 9, '1996-05-20', '9767097894', 'TOTA VILLAVE, SOMDAL UKHRUL,      India MANIPUR ', 'MANIPUR', 'INDIA', 'NA', '', 2, 'O+', '', '863536097123', 0, 13, NULL),
(195, 'V03974', 'LUCY', '', 'LALRINHLUI', 9, '1993-11-06', '8459378211', 'V SECTION, KAWNMAWI, N CHHIPPUI, MAMMIT, MIZORAM        ', 'MIZORAM', 'INDIA', 'NA', '', 2, 'A+', '2019-12-10', '990017738047', 0, 13, NULL),
(196, 'V03984', 'LALDINTHARI', '', '', 9, '1997-01-13', '7972795268', 'V SECTION, N KHAWBUNG, CHAMPHAI, MIZORAM        ', 'MIZORAM', 'INDIA', 'NA', '', 2, 'A+', '2019-11-23', '804965973290', 0, 13, NULL),
(197, 'V03986', 'Lalengmawii', '', '', 4, '2001-11-09', '8729870719', 'H NO. 134, NEAR COMMUNITY HALL, NORTH KHAWBUNG, CHAMPHAI, MIZORAM        ', 'MIZORAM', 'INDIA', 'NA', '', 1, 'A+', '2019-11-23', '401609957650', 0, 13, NULL),
(198, 'V06935', 'MEENUKA', '', 'CHHETRI', 4, '2001-11-09', '8367815995', 'TAKLING KHASMAHAL RANGLI, RANGILOT, DARJEELING WEST BENGAL     INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'meenukachhetri40@gmail.com', 1, 'A+', '2022-12-13', '817864219526', 0, 14, NULL),
(199, 'D00962 ', 'MEENU', '', 'CHHETRI', 2, '1998-08-10', '8793866749', 'TAKLING BUSTY KHASMAHAL RANGLI RANGLIOT DARJEELING WEST BENGAL 734312     INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'chhetrimeenu40@gmail.com', 1, 'A+', '2022-12-13', '762771930034', 0, 14, NULL),
(200, 'V07257', 'CHONGAMLA', '', 'ANGKANG', 10, '1992-03-14', '9233102620', 'LUNGPHU, UKHRUL MANIPUR 795145     INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'achongam@gmail.com', 1, 'A+', '2023-07-10', '283728296027', 0, 14, NULL),
(201, 'V01832', 'BABITA', '', 'SUBBA', 4, '2000-03-25', '9604431136', '        ', 'NA', 'INDIA', 'NA', '', 1, 'B+', '2021-09-29', '650236806031', 0, 14, NULL),
(202, 'V06283', 'VI', '', 'ZAIREMPUII', 4, '2001-05-05', '6909285712', 'DCH-199, SECTION-CH, TRANSPORT MUAL, DINTHAR, AIZAWL MUNCIPAL COUNCIL, AIZAWL, MIZORAM 796001   796001 INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', '', 1, 'B+', '2022-04-22', '384567137500', 0, 14, NULL),
(203, 'V06282', 'VANLALTHATLUANGI', '', '', 11, '1998-10-16', '7629871275', 'D/CH-233(A), CH SECTION, DAM PHEI, DINTHAR, AIZAWL MUNCIPAL COUNCIL, VAIVAKAWN, AIZAWL, TLANGNUAM, MIZORAM 796009    INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', '', 4, 'A+', '2022-04-22', '630843015759', 0, 14, NULL),
(204, 'V07097', 'LALTHANGPUII', '', '', 9, '1996-06-28', '9774819385', '114, VENGSANG,VAWMBAL ROAD, CHAMPHAI  MIZORAM 796321     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'colneytpi7@gmail.com', 2, 'A+', '2023-04-11', '754465894405', 0, 15, NULL),
(205, 'V04207', 'C', '', 'HMINGTHANSANGI', 2, '2001-02-24', '9862240461', 'H. NO. 47, VENGLAI, NEAR VETY QUARTER, ZOBAWK, LUNGLEI, MIZORAM     796701   ', 'MIZORAM', 'INDIA', 'NA', '', 1, 'AB+', '2019-12-10', '556827586634', 0, 15, NULL),
(206, 'D01053', 'LAL', '', 'FAKZUALI', 2, '2002-07-09', '7629840458', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-07-18', 'NA', 0, 15, NULL),
(207, 'D01052 ', 'VANLAL', '', 'NGAIHSAKI', 2, '2000-09-16', '8731889913', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-07-18', 'NA', 0, 15, NULL);
INSERT INTO `employee` (`emp_id`, `emp_code`, `fname`, `mname`, `lname`, `designation`, `dob`, `contact`, `address`, `state`, `country`, `pincode`, `email`, `department`, `blood_group`, `joining_date`, `aadhaar_number`, `salary`, `room_id`, `role`) VALUES
(208, 'D01055 ', 'NGUR', '', 'THANPUII', 1, '1999-09-20', '8732874445', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-07-18', 'NA', 0, 15, NULL),
(209, 'V04798', 'LALRINSANGI', '', '', 1, '1996-09-12', '7627980323', '80(2), LUNGLAWN  LUNGLEI PO, LUNGLEI MIZORAM   796701   ', 'MIZORAM', 'INDIA', 'NA', '', 1, 'O+', '2021-02-25', '749726694082', 0, 16, NULL),
(210, 'V06026', 'LALROZAMI', '', '', 1, '1999-11-06', '9612066572', 'V-95, SSA ROAD, NEAR SSA OFFICE KAHRAWT , CHAMPHAI MIZORAM    796321   ', 'MIZORAM', 'INDIA', 'NA', 'lalrozamirenthlei457@gmail.com', 1, 'O+', '2021-12-24', '319648925094', 0, 16, NULL),
(211, 'V04784', 'K', '', 'LALRUATDIKI', 2, '2004-11-11', '9366004800', 'D-71, SECTION1, TUIKUAL NORTH  AIZWAL MUNCIPAL COUNCIL AIZWAL, MIZORAM   796001   ', 'MIZORAM', 'INDIA', 'NA', 'ruatdikikhiangte6145@gmail.com', 1, 'A+', '2021-02-25', '301541643129', 0, 16, NULL),
(212, 'D01054', 'C', '', 'VANLALHMUAKI', 3, '1997-01-28', '9362880337', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-07-18', 'NA', 0, 16, NULL),
(213, 'V03876', 'GOSPEL', '', 'ROHLUPUII', 4, '2002-04-23', '9284051935', 'Y-46, Y SECTION, VENGTHLANG, AIZAWL, VAIVAKAWN,       INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', '', 1, 'AB+', '', '599846658436', 0, 16, NULL),
(214, 'V06764', 'REBECCA', '', 'LALHMANGAIHZUALI', 4, '1998-10-05', '6909494656', 'NO 95, J F LALDAILOVA SECTION, VENGTHAR, ZEMABAWK, AIZAWL MIZORAM 796017     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'mizobeki08@gmail.com', 1, 'A+', '2022-10-31', '800066851428', 0, 16, NULL),
(215, 'V05991', 'MZ', '', 'MAYAMI', 5, '1999-08-20', '8731998596', 'HAOPHUNGTANG, NGAINGA VILLAGE NGAIMU, UKHRUL MANIPUR   795142 INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'ayanaomz@gmail.com', 2, 'O+', '2021-12-14', '748309441749', 0, 17, NULL),
(216, 'D00780', 'VIJAYALAXMI', '', 'KHARATH', 12, '2001-03-02', '9150465161', '4TH CROSS SHIVAJI NAGAR YALLAKKI SHATTER COLONY DHARWAD  580002 INDIA KARNATAKA ', 'KARNATAKA', 'INDIA', 'NA', 'vijayalaxmikarath@gmail.com', 2, '0', '2021-12-16', '953329402801', 0, 17, NULL),
(217, ' H03165', 'NISHA', '', 'RAI', 2, '2000-08-24', '8257986939', '53, NEAR LADY HYDARI PARK, PINE MOUNT AREA, SHILLONG, EAST KHASI HILLS, SHILLONG GPO MEGHALAYA 793001     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', '', 1, 'AB+', '2022-06-19', '232805409760', 0, 17, NULL),
(218, 'D01028', 'DAPHILATYNGKAI', '', '', 2, '1997-11-20', '8787399401', '72 MAIRANG MISSION, MAWTHUNG, MAIRANG, WEST KHASI HILLS MEGHALAYA 793120     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'daphimawlong24@gmail.com', 1, 'AB+', '2022-06-19', '733474545991', 0, 17, NULL),
(219, 'D01027', 'LARISA', '', 'GATPHOH', 4, '1997-06-10', '6909165788', '124, NEAR PRESBYTERIAN CHURCH, LUMMAWRIE, LAITUMKHRAH, EAST KHASI HILLS MEGHALAYA 793003     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'gatphohlarisa@gmail.com', 1, 'B+', '2022-06-17', '605470059671', 0, 17, NULL),
(220, 'H02636', 'PHOIBI', '', 'LALFELI', 1, '1998-10-22', '9863234653', 'HERMON CHILDREN HOME LEITAN , TLANGNUAM (PART), AIZAWL DURTLANG, MIZORAM   796025   ', 'MIZORAM', 'INDIA', 'NA', '', 1, 'O+', '', '317734882917', 0, 18, NULL),
(221, 'H02106', 'LALHMINGMAWII', '', '', 4, '1996-06-05', '9862322858', 'CHILDREN HERMON CHILDREN HOME, LEITAN  TLANGNUAM(PART), AIZAWL  DURTLANG , MIZORAM  796025   ', 'MIZORAM', 'INDIA', 'NA', '', 1, 'O+', '2022-12-08', '505745971566', 0, 18, NULL),
(222, 'V06622', 'VANLALDUHSAKI', '', '', 7, '1996-04-10', '8413860635', 'COLLEGE VENG NEAR GOVT COLLEGE SECTION -1 LUNGLEI MIZORAM 796701      INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'duhsaki196@gmail.com', 3, 'O+', '2022-08-17', '659652099344', 0, 18, NULL),
(223, 'H03193', 'ROSMIKA', '', 'CHETTRI', 1, '1995-05-23', '8371091428', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-07-10', 'NA', 0, 18, NULL),
(224, 'V07301', 'T', '', 'LALTHANHLUI', 3, '1996-02-04', '9774489541', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-07-24', 'NA', 0, 18, NULL),
(225, 'V07302', 'MARINA', '', 'LALTANPUII', 2, '2004-10-13', '9284540278', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-07-24', 'NA', 0, 18, NULL),
(226, 'D01031', 'ISHAMEKA', '', 'LAMIN ', 4, '1996-12-22', '8794772403', '087, BLOCK B, ARBUTHNOT ROAD, NONGRIMMAW, LAITUMKHRAH, EAST KHASI HILLS MEGHALAYA 793003     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'ishamekalamin@gmail.com', 1, 'B+', '2022-06-17', '468265960108', 0, 19, NULL),
(227, 'V05892', 'YETSESHE.', '', 'L. YIMCHUNGER', 4, '2002-09-09', '7085836784', 'HNO. 01, NEAR CHURCH, PUNGRO KIPHIRE, NAGALAND       ', 'NAGALAND', 'INDIA', 'NA', 'yetseshequinker@gmail.com', 1, 'O+', '2021-10-28', '835222124722', 0, 19, NULL),
(228, 'V05891', 'GRACE', '', 'EZUNG', 4, '1999-07-22', '9366759775', 'MOKOKCHUNG COMPOUND MOKOKCHUNG  NAGALAND   798601   ', 'NAGALAND', 'INDIA', 'NA', 'graceezung805@gmail.com', 1, 'O+', '2021-10-28', '627077682966', 0, 19, NULL),
(229, 'V05923', 'JATAV', '', 'POONAM PADAMSINGH', 4, '1997-10-02', '7066472576', 'H NO. 6ILL/3, BAMANWADA KARASWADA, NEAR PETROL PUMP MAPUSA, NORTH GOA      ', 'GOA', 'INDIA', 'NA', 'poonam22071999@gmail.com', 1, 'AB+', '2021-11-11', '909189595416', 0, 19, NULL),
(230, 'V05887', 'MUGHAKALI', '', '', 4, '2000-12-03', '8415043733', 'BPO ALICHEN 1ST GATE ALICHEN, MOKOKCHUNG NAGALAND      ', 'NAGALAND', 'INDIA', 'NA', 'aienaghali782@gmail.com', 1, 'B+', '2021-10-28', '547611082774', 0, 20, NULL),
(231, 'V06413', 'RINRIN', '', 'ZIMIK', 2, '2003-03-01', '6009889920', 'RAMVA/LAMBUI VILLAGE LAMBUI UKHRUL MANIPUR - 795145     INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'rinrinzimik3@gmail.com', 1, 'B+', '2022-06-08', '901632253915', 0, 20, NULL),
(232, 'D01044 ', 'MINGAM', '', 'ETE', 2, '1999-06-06', '7038054557', 'BENE, WEST SIANG, ALONG,  ARUNANCHAL PRADESH 791001     INDIA ARUNANCHAL PRADESH ', 'ARUNACHAL PRADESH', 'INDIA', 'NA', 'mingamete2003@gmail.com', 1, 'O+', '2023-07-04', '200262826536', 0, 20, NULL),
(233, 'D01046', 'GARGI', '', 'PAYENG', 2, '1998-01-01', '9101770734', '169/A, CENTRAL GOTANAGAR, MALIGAON, MLG RLY HQS, KAMRUP METRO ASSAM 781011     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'payenggargi66@gmail.com', 1, 'O+', '2023-07-04', '384469795470', 0, 20, NULL),
(234, 'D01045 ', 'SALMETCHI', '', 'MARAK', 4, '1999-08-31', '7005039677', '107, BALACHANDA, BALACHANDA-I(GARO), WEST GARO HILLS MEGALAYA 794104     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'salmamarak70@gmail.com', 1, 'AB+', '2023-07-04', '375142019220', 0, 20, NULL),
(235, 'V05911', 'PREETY', '', 'MARAK', 4, '1999-01-08', '9862567186', 'H NO. 337, NEAR GOVT HIGH SCHOOL DHANSIRIPAR, NAGALAND       ', 'NAGALAND', 'INDIA', 'NA', 'hannahmarak77@gmail.com', 1, 'A+', '2021-10-30', '442970396929', 0, 21, NULL),
(236, 'V05908', 'VINOLI', '', 'CHISHI', 4, '1995-10-10', '8448418447', 'H NO. 118, RIVER BELT COLONY NEAR DON BOSCO HR SEC SCHOOL DIMAPUR SADAR, NAGALAND      ', 'NAGALAND', 'INDIA', 'NA', 'vinolichishir@gmail.com', 1, 'A+', '2021-10-30', '592493438504', 0, 21, NULL),
(237, 'V07070', 'FELINA', '', 'VANLALZAHAWMI ', 4, '2002-07-19', '9767743160', 'H NO 221, CHAWNGTE P, LAWNGTLAI MIZORAM 796891     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'vanlalzahawmifelina@gmail.com', 1, 'A+', '2023-03-27', '915687143569', 0, 21, NULL),
(238, 'V05904', 'A', '', 'MERENYANGLA IMSONG', 4, '2001-12-19', '7085507624', 'TULIYONG WARD, TULI MOKOKCHUNG  NAGALAND   798618   ', 'NAGALAND', 'INDIA', 'NA', '', 1, 'O+', '2021-10-30', '510375403195', 0, 21, NULL),
(239, 'V05930', 'LALHMINGMAWII', '', '', 4, '1995-04-16', '8131960170', 'Y-155A, Y-SECTION RAMHLUN SOUTH NEAR BAPTIST CHURCH AIZWAL, MIZORAM     ', 'MIZORAM', 'INDIA', 'NA', '', 1, 'B+', '2021-11-06', '463943719481', 0, 22, NULL),
(240, 'H02635', 'H', '', 'LALENGMAWII', 5, '1997-09-18', '6009256907', 'C-2/17, SECTION 4, NEAR MICE SCHOOL TUIKUAL, NORTH TLANGNUAM AIZWAL , MIZORAM      ', 'MIZORAM', 'INDIA', 'NA', '', 2, 'O+', '', '312556092724', 0, 22, NULL),
(241, 'V07120', 'KARISHMA', '', 'KIRO ', 4, '2001-10-13', '8102390129', 'RN-255, BEHIND LIC OFFICE, ROHRABANDH, SINDRI, DHANBAD JHARKHAND 828122     INDIA JHARKHAND  ', 'JHARKHAND', 'INDIA', 'NA', 'karishmakiro18@gmail.com', 1, 'O+', '2023-04-29', '563787893070', 0, 22, NULL),
(242, 'H02633', 'LALRAMPANI', '', '', 17, 'NA', '7640844479', 'A1(B), 18(B), MUAL VENG CHALTLANG, AIZAWL MUNICIPAL COUNCIL AIZAWL , MIZORAM   796012   ', 'MIZORAM', 'INDIA', 'NA', 'plalrampani@gmail.com', 19, 'A+', '', '387037132550', 0, 22, NULL),
(243, 'V05917', 'BORNALI', '', 'BHAKTIARY', 4, '2000-05-25', '8399057441', 'RUPAISIDING, DOOM DOOMA TINSUKIA, ASSAM       ', 'ASSAM', 'INDIA', 'NA', 'bornallibhaktiary123@gmail.com', 1, 'A+', '2021-10-31', '454791632202', 0, 23, NULL),
(244, 'V05915', 'REKHA', '', 'CHETRY', 4, '2001-03-01', '8133958198', 'SANTIPUR, OWGURI GAON TINSUKIA, ASSAM       ', 'ASSAM', 'INDIA', 'NA', 'rekhachetry7575@gmail.com', 1, 'A+', '2021-10-31', '487553638896', 0, 23, NULL),
(245, 'V05916', 'CHAYANIKA', '', 'DUTTA', 4, '1998-03-31', '7086749210', 'NAHARKATIA, LENGHARJAN NAHARKATIYA, DIBUGARH ASSAM   786610   ', 'ASSAM', 'INDIA', 'NA', 'chnkdutta@gmail.com', 1, 'AB+', '2021-10-31', '966644458606', 0, 23, NULL),
(246, 'V05914', 'PUSHPANJOLI', '', 'KOYA', 2, '1998-11-21', '9957106687', 'DALANG, LINE PART BAGHJAN RUPAI, 38/32WIA RUPBON, TINSUKIA ASSAM     ', 'ASSAM', 'INDIA', 'NA', 'koyapushpanjoli@gmail.com', 1, 'B+', '2021-10-31', '521936192647', 0, 23, NULL),
(247, 'V07100', 'LINDA', '', 'LALSAWIMAWII', 2, '1999-05-04', '7640938983', 'MUALUI,CHHINGCHHIP, SERCHHIP MIZORAM     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'lindaduhawmi96@gmail.com', 1, 'B+', '2023-04-11', '340312676534', 0, 24, NULL),
(248, 'V07099', 'LALHMANGAIHSANGI', '', '', 4, '1996-07-27', '9862827840', 'SDO QUATER, WEST PHAILENG, MAMMIT,  MIZORAM     796431 MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'hmangaihsangi199@gmail.com', 1, 'O+', '2023-04-11', '889192928976', 0, 24, NULL),
(249, 'H02978', 'ROSSY', '', 'TAMANG', 4, '2001-08-19', '8927255218', 'MARTAM NAZITAM CHUZA NEAR WATER GARDEN CHUBA MIDDLE CAMP EAST SIKKIM SIKKIM 737135     INDIA SIKKIM ', 'SIKKIM', 'INDIA', 'NA', '', 1, 'B+', '2022-11-03', '484198813941', 0, 24, NULL),
(250, 'V06395', 'R.', '', 'VANLALDINSANGI', 4, '1994-09-24', '7620042765', 'C-65, CHAWNGBAWLA SECTION, NEAR AGANWADI - l, RAMHLUN VENGTAHR, AIZAWL MUNCIPAL COUNCIL, AIZAWL, MIZORAM - 796012     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'ginacolney@gmail.com', 1, 'O+', '2022-05-28', '584535508340', 0, 24, NULL),
(251, 'D00660', 'CHENGNYU', '', 'A KONYAK', 4, '1998-09-01', '8414093814', 'VILLAGE YONGKHAO PO TOBU DIST MON UPPER HIGH SCHOOL   INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'chengngu@gmail.com', 1, 'A+', '2021-02-02', '826726281977', 0, 25, NULL),
(252, 'V05604', 'T', '', 'DUMPILILA SANGTAM', 5, '2003-05-07', '9383188021', 'H/NO 110,MKG ROAD B.P.O-LONGKHIM RONGNA SECTOR,LONGKHIM, TUESNSANG,NAGALAND  798616 INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'placement.ithm@gmail.com', 2, 'O+', '2021-02-02', '992969426581', 0, 25, NULL),
(253, 'V06740', 'WANLARIGKI', '', 'PYNGROPE', 5, '2003-05-07', '7085398547', 'UMMULONG, WEST JAINTIA HILLS MEGHALAYA 793151     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'wanlangkipyngrope@gmail.com', 2, 'O+', '2022-10-15', '935554497262', 0, 25, NULL),
(254, 'V06736', 'EBHAMI', '', 'PYNGROPE', 5, '2003-01-27', '7005264639', 'UMMULONG, WEST JAINTIA HILLS MEGHALAYA 793151     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'pyngropeebhami@gmail.com', 2, 'O+', '2022-10-15', '815875434669', 0, 25, NULL),
(255, 'V06743', 'DASHI', '', 'SHANONGKYNRIH', 11, '2000-01-15', '8729886937', '90 LAITLUM SMIT EAST KHASI HILLS MEGHALAYA 793015     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'dashishanongkynrih123@gmail.com', 4, 'AB+', '2022-10-15', '557568789867', 0, 25, NULL),
(256, 'V06580', 'IBAHUN', '', 'KHARTHANGMAW', 13, '1994-07-03', '9362236509', '359 UMISIER EAST KHSI QHILLS MEGHALAYA 793221      INDIA MEGHALAYA  ', 'MEGHALAYA', 'INDIA', 'NA', 'ibahunkharthangmaw21@gmail.com', 4, 'B+', '2022-08-14', '467416114287', 0, 25, NULL),
(257, 'V07176', 'ALI', '', 'KONYAK', 63, 'NA', '9862557157', 'H/NO-249 C, WARD-20, UNITED COLONY, NAGARJAN, DIMAPUR NAGALAND 797112     INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'linakonyak03@gmail.com', 19, 'O+', '2023-06-05', '476912226497', 0, 26, NULL),
(258, 'GP 975', 'SONU', '', 'GURUNG', 4, '2003-02-23', '9883473317', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-05-26', 'NA', 0, 26, NULL),
(259, 'H02933', 'NEHA', '', 'RAI', 4, '2001-05-26', '8670088237', 'TAKLING BUSTY KHASMAHAL DARJEELING WEST BENGAL 734312     INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'raineyha84@gmail.com', 1, 'O+', '2022-09-26', '946372302366', 0, 26, NULL),
(260, 'V07143', 'KAVITA', '', 'PAWAR', 4, '2003-11-19', '8530502056', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-07-11', 'NA', 0, 26, NULL),
(261, 'H02930', 'RIKITA', '', 'RAI', 4, '2003-12-06', '9083896554', 'UPPER SALIMBONG BUSTY BONG KHASMAHAL KALIMPONG DARJEELING WEST BENGAL 734301     INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'rikitarai354@gmail.com', 1, 'A+', '2022-09-26', '401465065429', 0, 26, NULL),
(262, 'H02929', 'LYANGRIP', '', 'LEPCHA', 4, '1998-08-22', '9933167297', 'LOWER POCHOK BUSTY GIT DUBLING KHASMAHAL GITDUBLING DARJEELING WEST BENGAL 734314     INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'lepchalyangrip485@gmail.com', 1, 'O+', '2022-09-26', '955254902332', 0, 26, NULL),
(263, 'V05394', 'TEMSUKALA', '', '', 14, '1993-12-16', '9112758082', 'TULI,TULIYONG WARD TULI MOKOKCHUNG NAGALAND     ', 'NAGALAND', 'INDIA', 'NA', 'temsukala22@gmail.com', 2, 'A+', '2021-06-02', '478128560121', 0, 27, NULL),
(264, 'H02079', 'LIMATULA', '', 'AO', 15, '1997-06-22', '8575707174', 'VIOLA COLONY, WARD - 23 DIMAPUR MC NAGALAND   797112   ', 'NAGALAND', 'INDIA', 'NA', '', 5, 'A+', '2022-11-27', '741429952904', 0, 27, NULL),
(265, 'V05393', 'TIASOLA', '', '', 5, '2002-01-17', '9089986973', 'TONGDENTSUYONG WARD MOKOKCHUNG TOWN MOKOKCHUNG NAGALAND  798601   ', 'NAGALAND', 'INDIA', 'NA', 'tiasoimchen9@gmail.com', 2, 'A+', '', '860364866381', 0, 27, NULL),
(266, 'V06735', 'RIBAKMEN', '', 'KAARUMNUID', 11, '1997-11-08', '9366981494', 'NEAR MERCY CHILD SCHOOL, DONGSUROK, THANGSNING, EAST KHASI HILLS MEGHALAYA 793015     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'kharumnuidribakmen@gmail.com', 4, 'B+', '2022-10-15', '477610526526', 0, 27, NULL),
(267, 'V05981', 'NIKITA', '', 'SURESH ZATYE', 4, '1999-11-24', '8412939823', 'H. NO. 113/2, LAGARBAG WADDA TORXEM., NORTH GOA GOA   403512 INDIA GOA ', 'GOA', 'INDIA', 'NA', 'zatye.nikita97@gmail.com', 1, 'A+', '2021-12-10', '580334434116', 0, 28, NULL),
(268, 'D00641', 'ZITSALA', '', 'A SANGTAM', 6, '2002-01-22', '7085987750', 'H NO. 54,  SIGNAL ANGAMI VILLAGE SIGNAL ANGAMI DIMAPUR  797117 INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'zizijingz33@gmail.com', 3, 'A+', '2021-02-02', '828675773457', 0, 28, NULL),
(269, 'V06933', 'LISHMITA', '', 'DSOUZA', 5, '1990-08-13', '6363530453', 'H.NO.2-24,ANGLAKODI HOUSE, PERUVAI POST DAKSHINA KANNADA-574260     INDIA KARNATAKA ', 'KARNATAKA', 'INDIA', 'NA', 'lishmithadsouza22@gmail.com', 2, 'B+', '2022-12-17', '403799905179', 0, 28, NULL),
(270, 'D00976', 'OLINDA', '', 'GOMES', 4, '2001-02-07', '9623525704', 'H NO 496 B, CHRISTIANWADA, KARIWADE, SINDHUDURG MAHARASHTRA 416510     INDIA MAHARASHTRA ', 'MAHARASHTRA', 'INDIA', 'NA', 'olindagomes167@gmail.com', 1, 'A+', '2023-01-11', '600229214823', 0, 28, NULL),
(271, 'D00653', 'NILIMA', '', 'MANDAL', 4, '1995-05-27', '7005769559', 'H.NO.18 NEAR POLICE STATION LANDMARK COLONY PWD COLONY DIMAPUR    NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'mandalnilima50gmail.com', 1, 'B+', '2021-02-02', '564148478624', 0, 28, NULL),
(272, 'D00703', 'SANTOSHI', '', 'PANDIT', 11, '2001-04-07', '8329717107', 'H. NO. 78, CHINCHWADA CHIMBEL , NORTH GOA GOA   403006   ', 'GOA', 'INDIA', 'NA', '', 4, 'B+', '2022-03-28', '868451526714', 0, 28, NULL),
(273, 'D00942', 'PEARL', '', 'SHAINY DESOUZA', 11, '2001-11-13', '9886141206', '4 32 FAISAL NAGAR NEAR MASJID BAJAL NANTHOOR MANGLORE DAKSHINA KANNADA KARNATAKA 575007     INDIA KARNATAKA ', 'KARNATAKA', 'INDIA', 'NA', 'pearlshinydsouza@gmail.com', 4, 'A+', '2022-11-16', '247249336666', 0, 29, NULL),
(274, 'H03009', 'GAIL', '', 'SALDANHA', 12, '1998-05-11', '8197785130', 'H.NO.4-116,NAVAJYOTHINAGAR NEAR MOSQUE ARKULA FARANGIPET  MANGLORE DAKSHINA KANNADA KARNATAKA    574143 INDIA KARNATAKA ', 'KARNATAKA', 'INDIA', 'NA', 'gailsaldanha2@gmail.com', 2, 'B+', '2022-11-25', '870760643829', 0, 29, NULL),
(275, ' D01049', 'ARPITA', '', 'DUTTA', 16, '2003-01-14', '8240231324', 'NA', 'NA', 'INDIA', 'NA', 'NA', 6, 'NA', '2023-07-11', 'NA', 0, 29, NULL),
(276, 'V07286', 'POUSHALI', '', 'NASKAR ', 3, '1988-09-30', '6289507172', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-07-18', 'NA', 0, 30, NULL),
(277, 'V03713', 'BAWITLUNG', '', 'LALTHIAMUANI', 4, '1998-08-17', '8787883831', 'B-160, T-SECTION COMPLEX ROAD RAMHLUN VENGLAI, AIZWAL MUNICIPAL COUNCIL    796012 INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', '', 1, 'O+', '', '630786652830', 0, 30, NULL),
(278, 'D00654', 'RAZUNGOLU', '', '', 4, '2003-03-09', '9077846376', 'PO CHOZUBA CHOZUBA HQ PHEK NAGALAND  797104  NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'angkookie20@gmail.com', 1, 'A+', '2021-02-02', '302301543192', 0, 30, NULL),
(279, 'V07043', 'N', '', 'ADAHA KHRASI', 4, '2002-07-25', '9863218021', 'MAKHAN KHULLEN, MARAM, SENAPATI MANIPUR 795015     INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'adahakhrasi9@gmail.com', 1, 'A+', '2023-02-10', '635279695242', 0, 30, NULL),
(280, 'V07044', 'DAILU', '', 'KAINE', 4, '2000-06-01', '9863242604', 'MAKHAN CENTRE, MARAM, SENAPATI MANIPUR 795015     INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'kainikhrasikhrasi@gmail.com', 1, 'O+', '2023-02-10', '582674732926', 0, 30, NULL),
(281, 'V07052', 'LENSILI', '', '', 17, '2001-07-04', '9665039426', 'VONGTSUVONG VILLAGE, PUNGRO HQ, KIPHIRE NAGALAND 798611     INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'lensilileejongs@gmail.com', 1, 'O+', '2023-03-04', '774261269528', 0, 30, NULL),
(282, 'V06950', 'MELITA', '', 'MONTEIRO', 18, '1982-11-08', '7483891225', 'JAVALI, CHICKMAGALUR KARNATAKA 577122     INDIA KARNATAKA ', 'KARNATAKA', 'INDIA', 'NA', 'jasminemelita5656@gmail.com', 4, 'AB+', '2022-12-23', '902226632728', 0, 31, NULL),
(283, 'V03242', 'SHELITO', '', 'ACHUMI', 19, '1992-02-04', '9604512560', 'H.NP.218, WARD 1, CHUMUKEDIMA, DIMAPUR, NAGALAND, 797103      INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', '', 4, 'O+', '', '529616724926', 0, 31, NULL),
(284, 'V03772', 'LALREMSANGI', '', '', 11, '1998-05-01', '9856475085', '161, RAMHLUN SOUTH  III,  AIZAWL,       INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'lalremsangihmar4@gmail.com', 4, 'B+', '', '885144765348', 0, 31, NULL),
(285, 'V06699', 'SENTHA', '', 'NONGBRI', 2, '2002-02-11', '8257870351', 'NEAR SON & COMPANY MAWLAI UMJAIUR BLOCK - 1 MAWLAI EAST KHASI HILLS PHUDMAWRI MEGHALAYA 793008     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'nongbrilyngdohsentha@gmail.com', 1, 'O+', '2022-09-25', '352587235358', 0, 31, NULL),
(286, 'D01030', 'ARATI', '', 'KUMARI MISHRA', 20, '1997-09-04', '9395071501', 'FANCY BAZAR, LOG HINDI HIGH SCHOOL, RAILWAY GATE NO 3, PANBAZAR, KAMRUP METRO ASSAM 781001     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'arti.mishra217@gmail.com', 7, 'B+', '2023-06-21', '336384674874', 0, 31, NULL),
(287, 'V07148', 'VENIKA', '', 'COSTA', 3, '1996-05-06', '7507927040', 'H NO B-180, MAPA PANCHAWADI, PONCHAVADI, NORTH GOA GOA 403706     INDIA GOA ', 'GOA', 'INDIA', 'NA', 'venikacosta@gmail.com', 1, 'A+', '2022-05-06', '242992781218', 0, 31, NULL),
(288, 'V03626', 'LALMUANSANGPUII', '', '', 4, '1997-02-10', '8921528598', 'H NO. 158, COLLEGE VENG SOUTH, LAWNGTLAI     796891 INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', '', 1, 'A+', '2021-01-16', '689429664698', 0, 32, NULL),
(289, 'D00599', 'HANTONA', '', 'GOGOI', 4, '1998-06-24', '7628087399', 'H.NO. 108, BLOCK 21 NAHARBARI VILLAGE  NAHARBARI VILLAGE  NAGALAND  797115   ', 'NAGALAND', 'INDIA', 'NA', 'hantonagogoi123@gmail.com', 1, 'AB+', '2021-12-08', '652479219002', 0, 32, NULL),
(290, 'V06483', 'MELODY', '', 'HMANGAIHSANGI', 11, '2000-02-05', '8787525793', 'C 52, T SECTION, NEAR KB TUIKHUR, SARON VENG, AIZAWL MUNCIPAL COUNCIL, AIZAWL, MIZORAM 796001     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'melodyhringngen76@gmail.com', 4, 'O+', '2022-07-05', '621221384184', 0, 32, NULL),
(291, 'V05862', 'KHANYOPHY', '', 'M S', 4, '1992-09-07', '8414993648', 'CHOITHAR VILLAGE URKHUL DISTRACT MANIPUR   795142 INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'mashangvakhanyophy@gmail.com', 1, '0', '2021-10-13', '886216055912', 0, 33, NULL),
(292, 'D00735', 'TERESA', '', 'M SANGMA', 1, '1996-12-13', '9365277176', 'DARKA, KACHARIPARA PT-1 GOALPARA ASSAM - 783120   783120 INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'sangmateresa05@gmail.com', 1, 'B+', '2021-04-18', '421462303282', 0, 33, NULL),
(293, 'H02627', 'PRIYA', '', 'MUNDA', 18, '1999-01-20', '8638908155', 'DIRING BAGAN KAZIRANGA NATIONAL PARK GOLAGHAT , ASSAM   785609   ', 'ASSAM', 'INDIA', 'NA', 'priyamunda31@gmail.com', 4, 'B+', '2021-11-29', '983514228287', 0, 33, NULL),
(294, 'V03773', 'REBEK', '', 'LALMAWIZUALI', 4, '2000-01-01', '9607027497', 'FIELD VENG, THENZAWL, NEAR BAPTIST CHURCH, SERCHHIP THENZAWL, MIZORAM        ', 'MIZORAM', 'INDIA', 'NA', '', 1, 'O+', '2022-03-13', '396870653954', 0, 33, NULL),
(295, 'V06318', 'SHAILY', '', 'PANDEY', 21, '2002-07-10', '7250347727', 'H. NO. 110, NEAR LAL KRISHNA SONAMATI SCHOOL BAJRANG SANGH ROAD GOLA  GOLA, RAMGARH, JHARKHAND   829110   ', 'JHARKHAND', 'INDIA', 'NA', 'shailypandey7488@gmail.com', 8, 'AB+', '2022-05-08', '893382508189', 0, 33, NULL),
(296, 'V07293', 'BHAGYASHREE', '', '', 22, '1984-12-20', '8999198014', 'NA', 'NA', 'INDIA', 'NA', 'NA', 9, 'NA', '2023-07-20', 'NA', 0, 33, NULL),
(297, 'V00646', 'SWATI', '', 'KAMBLE', 23, '1983-08-16', '9011938457', 'NA', 'NA', 'INDIA', 'NA', '', 9, 'A+', '', '713755904311', 0, 34, NULL),
(298, 'V02089', 'SHANTU', '', 'KAMBLE', 1, '1994-12-31', '8806663518', 'NA', 'NA', 'INDIA', 'NA', '', 1, 'O+', '', '297693097831', 0, 34, NULL),
(299, 'V05380', 'SHANCHOBENI', '', 'N ODYUO', 4, '1996-10-09', ' 7628945689', 'B.P.O RANGAPAHAR, SENJUM VILLAGE, DIMAPUR SADAR, NAGALAND  797112 INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', '', 1, 'O+', '2021-11-27', '445575080658', 0, 35, NULL),
(300, 'V05534', 'CHANCHIBENI', '', 'T EZUNG', 17, '2000-07-10', '7085745027', 'H NO. 58-B WALFORD COLONY DIMAPUR, NAGALAND   797112 INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', '', 7, 'O+', '', '700680168003', 0, 35, NULL),
(301, 'V05959', 'AKSHATA', '', 'DNYANESHWAR GAWAS', 17, '1999-08-13', '7829241364', 'OLD STAFF QTRS R NO.19, BANGUR NAGAR DANDELI VTC - DANDELI (RURAL) UTTAR KANNADA 581325 INDIA KARNATAKA ', 'KARNATAKA', 'INDIA', 'NA', 'gawasa468@gmail.com', 7, '0', '2021-11-26', '690898992599', 0, 35, NULL),
(302, 'V05960', 'ASHWINI', '', 'GOVIND GAWAS', 4, '2001-11-20', '9148260873', 'ROOM NO.475 BANGUR NAGAR NEW STAFF QTRS DANDELI (RURAL) UTTAR KANNADA 581325 INDIA KARNATAKA ', 'KARNATAKA', 'INDIA', 'NA', 'ashwinigawas13@gmail.com', 1, '0', '2021-11-26', '576454919343', 0, 35, NULL),
(303, 'D00952', 'RENJANO', '', 'EZUNG', 11, '1999-01-01', '6009097670', 'H NO 26, NEAR GOVT FISHERY WOKHA, TSUMANG A, WOKHA SADAR NAGALAND 797111    797111 INDIA NAGALAND ', 'NAGALAND', 'INDIA', 'NA', 'renjano23@gmail.com', 4, 'O+', '2022-12-01', '285480034826', 0, 35, NULL),
(304, 'V05939', 'KOMAL', '', 'KUMARI', 24, '1986-09-25', '6205439152', 'SOUYOG, KRISHNAPURI ROAD NO 12, RANCHI, JHARKHAND       ', 'JHARKHAND', 'INDIA', 'NA', 'komal.singh111513112@gmail.com', 10, 'O+', '2021-11-13', '729581387230', 0, 35, NULL),
(305, 'DS0222', 'RINPI', '', 'NADA', 7, '1997-09-24', '7745034076', 'NA', 'JHARKHAND', 'INDIA', 'NA', '', 3, 'A+', '', '546760491132', 0, 36, NULL),
(306, 'H03146', 'SONALI', '', 'NAIK', 7, '1999-09-08', '9686955230', '#1506, GABITWADA, MAJALI, KARWAR , UTTAR KANNADA KARNATAKA 581345     INDIA KARNATAKA ', 'NA', 'INDIA', 'NA', 'snaik9511@gmail.com', 3, 'A+', '2023-05-29', '590738357935', 0, 36, NULL),
(307, 'H03166', 'APSANA', '', 'LALAMASAK SHEKH', 4, '2000-03-27', '9322144416', '68, PILLIEM, BHUMIKA NAGAR, DARBANDORA, SOUTH GOA GOA 403406     INDIA GOA ', 'KARNATAKA', 'INDIA', 'NA', 'apsanashe118@gmail.com', 1, 'AB+', '2023-07-04', '576346788771', 0, 36, NULL),
(308, 'V06573', 'AMINA', '', 'BEGUM', 4, '2000-02-27', '8099098360', 'VILL MENIPUR PT I, SILDUBI, CACHAR ASSAM 788112     788112 ASSAM ', 'GOA', 'INDIA', 'NA', 'ammuskyh296@gmail.com', 1, 'O+', '2022-08-11', '494782748145', 0, 37, NULL),
(309, 'V06568', 'LAISHRAM', '', 'MEMNAOBI', 4, '1996-09-10', '9612741142', 'KANGLATONGBI BAZAR BOARD SEKMAI IMPHAL WEST LAMSHANG SUB DIV MANIPUR 795136     INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', '', 1, 'A+', '2022-08-11', '359009066027', 0, 37, NULL),
(310, 'V06567', 'KRISHATINA ', '', 'PEGU', 4, '2004-09-05', '8811956853', 'VILL KEKURI MIRI GAON PS DHEMAJI JAIDHAL,TINIGHARIA ASSAM 787057      INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'pegukrishtina11@gmail.com', 1, 'B+', '2022-08-11', '843695649592', 0, 37, NULL),
(311, 'V06872', 'BHAGYASHREE', '', 'PANDA', 4, '2003-02-25', '8099809228', 'DAFALAKATA, PABHOI, BISWANATH ASSAM 784174    784174 INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'bhagyashreepanda0005@gmail.com', 1, 'A-', '2022-11-24', '822277287201', 0, 37, NULL),
(312, 'V06569', 'ROSHNI', '', 'DEVI', 4, '2000-04-21', '8876414781', '24 PATARKUCHI MANIPURI MANDIR BASISTHA KAMRUP,METRO ASSAM 781029      INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'howremroseie1230@gmail.com', 1, 'AB+', '2022-08-11', '594153266696', 0, 37, NULL),
(313, 'V06574', 'Z', '', 'N WILUBUILIU', 4, '1998-05-18', '9612321831', 'CHATON I TAMEI TAMENGLONG NORTH SUB DIV MANIPUR 795125      INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', '', 1, 'O+', '2022-08-11', '216553105436', 0, 37, NULL),
(314, 'V06562', 'NISHA', '', 'SINGH ', 4, '2003-01-25', '9774446957', '28 NEAR GURUDWARA MES GORALINE LUMSOHRA SHILLONG LAITUMKHRAH EAST KHASI HILLS, MEGHALAYA 793003     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'nishusingh1235678@gmail.com', 1, 'B+', '2022-08-10', '340986161664', 0, 38, NULL),
(315, 'V06561', 'RITA', '', 'LALRAMFEL', 4, '2002-02-21', '9366916949', 'VALPAKOT VILLAGE CHURACHANDPUR SUB DIVISION, MANIPUR, DIST:CHURACHANDPUR,MANIPUR,795128     795128 INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', 'jotefeli@gmail.com', 1, 'O+', '2022-08-10', '949016562541', 0, 38, NULL),
(316, 'V06563', 'EVANICA', '', 'MAWLONG', 11, '2000-08-01', '9362704035', 'LAWSOHTUN NEAR ST JOHN BOSCO SCHOOL LAWSOHTUN BLOCK-2 EAST KHASI HILLS MEGHALAYA 793004      INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'evanicalmawlong@gmail.com', 4, 'A+', '2022-08-10', '629831372814', 0, 38, NULL),
(317, 'V06560', 'FAIRDASHISHA', '', 'LAWAI', 4, '2001-02-14', '6009894287', 'PURIANG NIUR, NEAR PLAY GROUND, PURIANG NIUR, NIUR, EAST KHASI HILLS, MAWRYNGKNENG, MEGHALAYA 793021     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'fairdalawai@gmail.com', 1, 'B+', '2022-08-10', '420146652598', 0, 38, NULL),
(318, ' V06581', 'EVALAHUN', '', 'GATPHOH', 4, '2000-10-19', '7622025625', '124, BEHIND R K DISPENSARY, LUMMAWRIE, LAITUMKHRAH, EAST KHASI HILLS, MEGHALAYA 793003     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'evagatphoh@gmail.com', 1, 'B+', '2022-08-14', '670899334421', 0, 38, NULL),
(319, ' V06582', 'ZENOVIA', '', 'RYMBAI', 4, '1999-08-24', '9402188948', 'BELOW J J CABLE, NON GRIM HILLS, LAITUMKHRAH, EAST KHASI HILLS, MEGHALAYA 793003     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'zee.rymbai@gmail.com', 1, 'A+', '2022-08-14', '542908757410', 0, 38, NULL),
(320, 'H02789', 'LALREMPUII', '', '', 4, '2000-07-25', '7641012719', '102, VENGLUN, NEAR U.P.C CHURCH, LUNGPHO, SERCHHIP, MIZORAM - 796181     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'rpchhangte24@gmail.com', 1, 'O+', '2022-06-03', '259323103102', 0, 39, NULL),
(321, 'H02790', 'LALTHLAMUANI', '', '', 4, '2002-06-05', '6009413154', 'BAZAR VENG, NEAR COLLEGE, NEW SERCHHIP, SERCHHIP, MIZORAM 796181     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'lalthlamuanithlatei95@gmail.com', 1, 'B+', '2022-06-03', '995746495259', 0, 39, NULL),
(322, 'H02787', 'REMRUATSANGI', '', '', 4, '1997-12-03', '8413932799', '9, SAITUAL ROAD, NEAR SERICULTURE, CHAWNGBAWLA SECTION, PHULLEN, AIZAWL, MIZORAM - 796261     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'remruatsangiralte7@gmail.com', 1, 'A+', '2022-06-03', '877645057471', 0, 39, NULL),
(323, 'H02792', 'JULIET', '', 'ZOREMSANGI', 4, '1999-04-02', '8794779928', 'H.NO-21, MISSION VENG, NEAR PRESBYTERIAN CHURCH, BUHCHANGPHAI, KOLASIB, BILKHAWTHLIR, MIZORAM 796091     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', '', 1, 'A+', '2022-06-03', '582941839517', 0, 39, NULL),
(324, 'H02788', 'MARY', '', 'LALTHANPUII', 4, '2000-07-17', '7641006654', 'B-78, N-SECTION, NEAR P/S, ZONUAM, AIZAWL,, ZONUAM, MIZORAM, - 796009     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'marysky066@gmail.com', 1, 'A+', '2022-06-03', '656726810227', 0, 39, NULL),
(325, 'H03005 ', 'RAMCHANSANGI', '', '', 4, '2002-06-04', '8794763580', 'REST HOUSE MUALLIANPUI S VANLAIPHAI, HNAHTHIAL, LUNGLEI MIZORAM 796571    796571 INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', '', 1, 'O+', '2022-11-21', '403228864733', 0, 39, NULL),
(326, 'V06550', 'VANLALHRIATHLUI', '', '', 4, '2000-04-30', '9962987475', 'KHAWHAI CHAMPHA MIZORAM  796310      INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'hriathluiv@gmail.com', 1, 'O+', '2022-08-04', '776086935798', 0, 40, NULL),
(327, 'V06486', 'PC', '', 'LALNUNENGI', 4, '2004-03-18', '7005747440', 'TA/57 TSECTION HMARVENG BAWNGKAWN AIZAWL MUNICIPAL  MIZORAM 796014     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'jaycepachuau@gmail.com', 1, 'B+', '2022-07-05', '583450331402', 0, 40, NULL),
(328, 'V06549', 'VANLALHMUANMAWII', '', '', 4, '2003-11-29', '8119942423', 'H NO 55 NEAR PHC KHAWHAI CHAMPHAI MIZORAM 796310      INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'lalhmunmawiit@gmail.com', 1, '0', '2022-08-04', '344333130941', 0, 40, NULL),
(329, 'V06552', 'LALCHHANTLUANGI', '', '', 4, '2003-09-17', '6909495739', 'C 51, SEC T, NEAR YMA HALL, MODEL VENG, KULIKAWN, AIZAWL, MIZORAM 796005     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'chhantluangi94@gmail.com', 1, 'O+', '2022-08-04', '690989824370', 0, 40, NULL),
(330, 'D01042', 'BETTY', '', 'LALCHHUANPUII', 4, '1998-01-03', '9905281548', 'H.NO.244, NEAR UPC(MZ) PASTOR QUATERS,KHAWHAI VENGLAI, CHAMPHAI MIZORAM 796310     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'bettychhuak02@gmail.com', 1, 'O+', '2023-06-16', '898860671651', 0, 40, NULL),
(331, 'V06571', 'ANKITA', '', 'DAS', 4, '1999-12-13', '8473890542', 'NEAR SARUSAJAI SATGAON, BELTOLA, BASISTHA, KAMRUP METRO, ASSAM 781029     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'ankitadas123.guria@gmail.com', 1, 'B+', '2022-08-11', '758120018208', 0, 41, NULL),
(332, 'V06575', 'SHUBHA', '', 'DEVI', 4, '2003-10-27', '7002376484', 'STREET MILON NAGAR LANDMARK PARIJAT PATH WARD NO 10 VILLAGE NORTH LAKHIMPUR SIDT LAKHIMPUR NORH LAKHIMPUR ASSAM 787001    INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'devisubha111@gmail.com', 1, 'A+', '2022-08-11', '925778469423', 0, 41, NULL),
(333, 'V06572', 'ALICIA', '', 'PYRTUH', 4, '2002-09-04', '9774810016', 'MOODYMMAI, WEST JAINTIA HILLS, MEGHALAYA 793151     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'aliciapyrtuh1@gmail.com', 1, 'B+', '2022-08-11', '670281662441', 0, 41, NULL),
(334, 'V06643', 'HIYASMITA', '', 'DAS', 4, '2003-07-27', '6001079952', 'PUB KHAGRABARI BAKSA ASSSAM 781327      INDIA ASSAM ', 'MEGHALAYA', 'INDIA', 'NA', 'hiyasmita2021@gmail.com', 1, 'B+', '2022-08-25', '339715573403', 0, 41, NULL),
(335, 'V06644', 'RAKHEE', '', 'SANGMA', 4, '2004-08-01', '8099899131', 'UKIUM NO 1 KAMRUP ASSAM 781124      INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'rakheesangma188@gmail.com', 1, 'B+', '2022-08-25', '765016801409', 0, 41, NULL),
(336, 'V06866', 'PARIMITA', '', 'DEKA', 4, '2002-05-20', '8453559332', 'DEOCHUNGA, GORESWAR, KAMRUP ASSAM 781364    781364 INDIA ASSAM  ', 'ASSAM', 'INDIA', 'NA', 'parimitadeka8@gmail.com', 1, 'A+', '2022-11-24', '581162173083', 0, 41, NULL),
(337, 'V06601 ', 'KIMTUNG', '', 'SANCHONG', 4, '2001-07-29', '8794314092', 'CHANGLANG CIRCLE, CHANGLANG,  ARUNACHAL PRADESH 792120     INDIA ARUNACHAL PRADESH ', 'ARUNACHAL PRADESH', 'INDIA', 'NA', 'sanchongkimtung@gmail.com', 1, 'O+', '2022-08-18', '921950067616', 0, 42, NULL),
(338, 'V06602', 'RUNI', '', 'DAS', 4, '2002-11-10', '9366505250', '153, C SECTOR, NEAR GANDHI MARKET, C SECTOR, ITANAGAR, PAPUM PARE ARUNACHAL PRADESH 791111     INDIA ARUNACHAL PRADESH ', 'ARUNACHAL PRADESH', 'INDIA', 'NA', 'runidas22@gmail.com', 1, 'O+', '2022-08-18', '700279592054', 0, 42, NULL),
(339, ' V06598', 'BHAGYASHREE', '', 'BURAGOHAIN', 4, '2002-11-10', '6001390332', '1 NO CHIRINGHULA, CHIRING HULA NO 1, CHRINGHULA, DIBRUGARH EAST, DIBRUGARH, ASSAM 786010     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'bhagyashreeburagohain966@gmail.com', 1, 'O+', '2022-08-18', '637309482800', 0, 42, NULL),
(340, ' V06599', 'JOYSHREE', '', 'BURAGOHAIN', 4, '2002-05-02', '9954095516', '1 NO CHIRINGHULA, CHIRING HULA NO 1, CHRINGHULA, DIBRUGARH EAST, DIBRUGARH, ASSAM 786010     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'joyshreeburagohain470@gmail.com', 1, 'O+', '2022-08-18', '940630380813', 0, 42, NULL),
(341, 'V06600 ', 'NEEHA', '', 'DEVI', 4, '2002-11-19', '8011791173', 'RENGBENG, GARUBANDA MIKIR GAON, RENG BENG GRANT, KAMPUR, NAGAON ASSAM 782427     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'nickibasty@gmail.com', 1, 'B+', '2022-08-18', '708113123403', 0, 42, NULL),
(342, 'V06597', 'ARUNJYOTI', '', 'SAIKIA', 25, '2003-06-12', '8822470258', 'VILLAGE BARKATHANI, DHALPUR, LAKHIMPUR, ASSAM 784165     INDIA ASSAM ', 'ASSAM', 'INDIA', 'NA', 'arunimasaikia832@gmail.com', 7, 'A+', '2022-08-18', '257156259217', 0, 42, NULL),
(343, ' V07282', 'ISHANI', '', 'DAS', 25, '2001-09-29', '7326959659', 'NA', 'NA', 'INDIA', 'NA', 'NA', 7, 'NA', '2023-07-12', 'NA', 0, 43, NULL),
(344, ' V07224', 'PALAK', '', 'KUMARI', 4, '2003-06-26', '7070466828', 'NATHPUR, WARD NO.-01, NARPATGANJ, ARARIA BIHAR 854335     INDIA BIHAR ', 'BIHAR', 'INDIA', 'NA', 'impalaksingh29@gmail.com', 1, 'B+', '2023-06-28', '497435647739', 0, 43, NULL),
(345, 'V06489', 'LALRINAWMI', '', '', 4, '1997-08-28', '8257095924', 'C-33 HMAR VENG V-SECTION KEPRAN AIZAWL MIZORAM  796017     796017 INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'fanailalrinawmi3@gmail.com', 1, 'O+', '2022-07-05', '687369626264', 0, 44, NULL),
(346, 'V06475', 'MARRY', '', 'LALNUNSANGI', 4, '1999-03-23', '7005446507', 'CNB/J-16 CHALTLANG LILY VENG LAIPUITHANG AIZAWL MIZORAM     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'teteiviego97@gmail.com', 1, 'A+', '2022-07-05', '503260570730', 0, 44, NULL),
(347, 'V06016', 'HMINGTHANSANGI', '', '', 4, '2003-10-11', '8729881847', '140, CHHIMTHLER KELSIH, AIZWAL MIZORAM      ', 'MIZORAM', 'INDIA', 'NA', '', 1, 'O+', '2021-12-20', '570827692639', 0, 44, NULL),
(348, 'D00868', 'LALRAMHMACHHUANI', '', '', 1, '1997-04-30', '9863644547', '91, ZALEN VENG, NEAR BUS STATION, VAIRENGTE, MIZORAM 796101     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'taeyee0@gmail.com', 1, 'B+', '2022-07-07', '760744378376', 0, 44, NULL),
(349, 'V06141', 'K', '', 'LALRINPUII', 4, '2000-05-29', '9359018564', '25(3), CHANMARI , NEAR BCM CHANMARI BELKHAI, LUNGLEI, MIZORAM,        ', 'MIZORAM', 'INDIA', 'NA', 'marnielalrinpuii@gmail.com', 1, 'O+', '2022-02-12', '816739520975', 0, 44, NULL),
(350, 'V06150', 'JYOTIREKHA', '', 'SONOWAL', 4, '1995-10-27', '7086134453', 'NAKHATIA SONOWAL GAON MATHAWANI, NAHARKATIYA DIBRUGARH, ASSAM 786610      ', 'ASSAM', 'INDIA', 'NA', 'jyotirekhasonowal2000@gmail.com', 1, 'O+', '2022-02-05', '208270136942', 0, 45, NULL),
(351, 'V06256', 'RIYA', '', 'BARICK', 4, '2002-01-10', '9681441301', 'BISHPARA NO2 BISHPARA NAYASARAI, HOOGHLY 712513    INDIA  ', 'WEST BENGAL', 'INDIA', 'NA', 'riyabarick2@gmail.com', 1, '0', '2022-04-18', '813726990659', 0, 45, NULL),
(352, 'V06151', 'SOKHINA', '', 'BEGUM', 5, '2002-11-21', '8638152908', 'BORABHAIPURIA, ABHOIPURIA DIBRUGARH  ASSAM  786103      ', 'ASSAM', 'INDIA', 'NA', 'jurikhan3@gmail.com', 2, 'A+', '2022-02-05', '583184032129', 0, 45, NULL),
(353, 'V06738', 'CANDINA', '', 'MARY MARBANIANG', 5, '2003-06-19', '6009471567', 'NEAR CHRUCH OF GOD, MAWNGAP MAWKHARSHIING, EAST KHASI HILLS MEGHALAYA 793121     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'candymarbaniang@gmail.com', 2, 'AB+', '2022-10-15', '597968857929', 0, 45, NULL),
(354, 'V06744', 'LARIHUN', '', 'MARBANIANG', 5, '2001-11-07', '9101851398', 'MAWLAI, MAWLALI, EAST KHASI HILLS MEGHALAYA 793017     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'larihun@gmail.com', 2, 'A+', '2022-10-15', '799729227697', 0, 45, NULL),
(355, 'V06737', 'HASSADELA', '', 'SURONG', 13, '2003-04-03', '9612181637', 'NEAR MERCYCHILD UPPER PRIMARY SCHOOL, DONG SUROK, THANGSNING, EAST KHASI HILLS MEGHALAYA 793015     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'hassadelasurong07@gmail.com', 4, 'A+', '2022-10-15', '746978295052', 0, 45, NULL),
(356, 'V07205', 'RAKMI', '', 'R SHIMRAY', 6, '2003-11-06', '6009321211', 'SOMDAL VILLAGE, UKHRUL  MANIPUR 795144     INDIA MANIPUR  ', 'MANIPUR', 'INDIA', 'NA', 'rakmishimray5@gmail.com', 3, 'O+', '2023-06-27', '592915766666', 0, 46, NULL),
(357, 'H03181', 'ACHAL', '', 'JUGAKAR', 4, '1999-12-06', '9606771514', '398, GOTEGALI KARWAR, UTTARA KANNADA KARNATAKA 581317     INDIA KARNATAKA ', 'KARNATAKA', 'INDIA', 'NA', 'aachaljugakar@gmail.com', 1, 'AB+', '2023-07-10', '882915556723', 0, 46, NULL),
(358, 'V06171', 'LALNUNHIMI', '', '', 4, '1998-10-09', '8794578482', '491, VENGTHAR,  NEAR ELECTRIC SDO OFFICE ELUNGDAR, MIZORAM 796370   796370   ', 'MIZORAM', 'INDIA', 'NA', 'anbucndi@gmail.com', 1, 'O+', '2022-02-15', '753434293490', 0, 46, NULL),
(359, 'V06149', 'MILLI', '', 'MAHATO', 4, '1999-07-27', '9707317726', 'CHABUA C WARD CHABUA, DIBRUGARH ASSAM 786184      ', 'ASSAM', 'INDIA', 'NA', 'milimahto814@gmail.com', 1, 'A+', '2022-02-05', '540733950285', 0, 46, NULL),
(360, 'V06170', 'LALNUNTHARI', '', '', 4, '1997-08-12', '9383009703', 'CEN 001, KAHRAWT NEAR LM SCHOOL, CHAMPHAI MIZORAM  796321      ', 'MIZORAM', 'INDIA', 'NA', 'lalnuntharijuly27@gmail.com', 1, 'B+', '2022-02-15', '745508189540', 0, 46, NULL),
(361, 'H02853', 'ROSANGKIMI	', '', '', 7, '2004-02-08', '8787326959', 'Centenary Road, Kawn Veng, Bikhawthlir, Kolasib, Mizoram 796091     INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'rosankmikilelhchhun@gmail.com', 3, 'B+', '2021-10-30', '808091156565', 0, 46, NULL),
(362, 'V07292', 'SAMRUDHI', '', 'KAVLEKAR  ', 2, '2003-10-02', '8010637688', 'NA', 'NA', 'INDIA', 'NA', 'NA', 1, 'NA', '2023-07-24', 'NA', 0, 47, NULL),
(363, 'V07255', 'CHASA', '', 'MARAK', 4, '2001-06-10', '9863362003', '165, MODYNAGAR, DANAKGRE, WEST GARO HILLS,  MEGHALAYA 794101     INDIA MEGHALAYA ', 'MEGHALAYA', 'INDIA', 'NA', 'chiasamarak949@gmail.com', 1, 'AB+', '2023-07-06', '655294775225', 0, 47, NULL),
(364, 'H02934', 'PRABHA', '', 'LAMA', 8, '1992-10-11', '7501495321', 'DB LINE LANKAPARA TEAGARDEN LANKAPARAHAT JALPAIGURI WEST BENGAL 735228     INDIA WEST BENGAL ', 'WEST BENGAL', 'INDIA', 'NA', 'prabhalama954@gmail.com', 1, 'B+', '2022-09-26', '261240134602', 0, 47, NULL),
(365, 'H02959', 'SOMITA', '', 'RAI', 8, '1989-12-02', '9635608353', '28, PARBING, LUING PERBING, RANKA, EAST SIKKIM, SIKKIM        ', 'SIKKIM', 'INDIA', 'NA', '', 1, 'A+', '2022-09-24', '208037043219', 0, 47, NULL),
(366, 'H02960', 'DIKI', '', 'SHERPA SR', 4, '2000-02-04', '8116385893', 'H NO.93, UPPER LINGTAM, SUB - RANGOLI DIST EAST SIKKIM      INDIA SIKKIM ', 'SIKKIM', 'INDIA', 'NA', '', 1, 'A+', '2022-09-24', '943585687254', 0, 47, NULL),
(367, 'V06264', 'RENBENY', '', 'OVUNG ITHM', 4, '1996-07-08', '8575821170', 'H.NO. 37/ WARD 2 CHUMUKEDIMA, DIMAPUR NAGALAND 797103    INDIA NAGALAND  ', 'NAGALAND', 'INDIA', 'NA', 'ovungrenren7@gmail.com', 1, 'O+', '2022-04-11', '256390976687', 0, 47, NULL),
(368, 'V06586', 'PRATISHA', '', 'SYNREM', 2, '2003-05-18', '9612532468', 'UMPLING DONGSHANENG SHILLONG, RYNJAH, EAST KHASI HILLS, MEGHALAYA 793006     INDIA MEGHALAYA ', 'NAGALAND', 'INDIA', 'NA', 'pratishasynrem@gmail.com', 1, 'O+', '2022-08-16', '775159538938', 0, 48, NULL),
(369, 'V07256', 'R', '', 'S PAMREIHOR', 4, '2000-01-03', '8731890821', 'LILOMTANG, NGAINGA(NGAIMU), VILLAGE, NGAIMU, UKHRUL,  MANIPUR 795142     INDIA MANIPUR ', 'MANIPUR', 'INDIA', 'NA', '', 1, 'A+', '2023-07-07', '730983912527', 0, 48, NULL),
(370, 'V06331', 'LALSANGKIMI', '', '', 4, '2000-02-02', '8787712685', '104 FIELD VENG NEAR ICI CHURCH VAJRENGTE, VAIRENGTE KOLASIB MIZORAM  796101 MIZORAM 796101   ', 'MIZORAM', 'INDIA', 'NA', 'ksang9299@gmail.com', 1, 'O+', '2022-05-06', '322453243702', 0, 48, NULL),
(371, 'V06330', 'C', '', 'LALREMSIAMI ', 4, '2004-01-27', '8794045415', '113 KHUANGPULLAM KOLASIB MIZORAM 796081   796081 INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'remsiamichhunthang@gmail.com', 1, 'O+', '2022-05-06', '285289283874', 0, 48, NULL),
(372, 'V06327', 'C', '', 'MALSAWMZUALI ', 4, '1999-05-25', '9863038311', '15 H.NO.15(1) PROJECT VENG CONVENT ROAD BUILUM, KOLASIB MIZORAM   INDIA MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'sawmichhangte600@gmail.com', 1, '0', '2022-05-06', '220245647033', 0, 48, NULL),
(373, 'V06329', 'ESTHER', '', 'LALNUNPUII', 8, '1997-03-22', '8974396937', 'H NO.138 RAMTLER NEW YMA HALL SECTION B, LUNGLAI  796701   796701  MIZORAM ', 'MIZORAM', 'INDIA', 'NA', 'estherlalnunpuii055@gmail.com', 1, 'B+', '2022-05-06', '721325593261', 0, 48, NULL);

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
(1, 'Vadiraj Inamdar', '2023-08-08 11:54:14', '2023-08-08 11:54:14', 2);

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
  `status` varchar(10) DEFAULT NULL,
  `current_room_occupancy` int(11) DEFAULT NULL
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
(10, 173, '209', 4, 'ACTIVE', 0),
(6, 174, '1', 18, 'ACTIVE', 14);

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
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=374;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

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
