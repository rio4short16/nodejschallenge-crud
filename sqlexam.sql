-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 25, 2022 at 04:31 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sqlexam`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `id` int(11) NOT NULL,
  `author_name` varchar(255) DEFAULT NULL,
  `book_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `author_name`, `book_name`) VALUES
(1, 'author_1', 'book_1'),
(2, 'author_1', 'book_2'),
(3, 'author_2', 'book_3'),
(4, 'author_2', 'book_4'),
(5, 'author_2', 'book_5'),
(6, 'author_3', 'book_6');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `book_name` varchar(255) DEFAULT NULL,
  `sold_copies` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `book_name`, `sold_copies`) VALUES
(1, 'book_1', 1000),
(2, 'book_2', 1500),
(3, 'book_3', 34000),
(4, 'book_4', 29000),
(5, 'book_5', 40000),
(6, 'book_6', 4400);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `department_name` varchar(255) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `employee_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `department_name`, `employee_id`, `employee_name`) VALUES
(1, 'Sales', 123, 'John Doe'),
(2, 'Sales', 211, 'Jane Smith'),
(3, 'HR', 556, 'Billy Bob'),
(4, 'Sales', 711, 'Robert Hayek'),
(5, 'Marketing', 235, 'Edward Jorgson'),
(6, 'Marketing', 236, 'Christine Packard');

-- --------------------------------------------------------

--
-- Table structure for table `salaries`
--

CREATE TABLE `salaries` (
  `employee_id` int(11) NOT NULL,
  `employee_name` varchar(255) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salaries`
--

INSERT INTO `salaries` (`employee_id`, `employee_name`, `salary`) VALUES
(123, 'John Doe', 500),
(211, 'Jane Smith', 600),
(235, 'Edward Jorgson', 1200),
(236, 'Christine Packard', 200),
(556, 'Billy Bob', 1000),
(711, 'Robert Hayek', 400);

-- --------------------------------------------------------

--
-- Table structure for table `tblstudents`
--

CREATE TABLE `tblstudents` (
  `id` int(11) NOT NULL,
  `studid` varchar(55) DEFAULT NULL,
  `fname` varchar(55) DEFAULT NULL,
  `lname` varchar(55) DEFAULT NULL,
  `level` varchar(55) DEFAULT NULL,
  `course` varchar(55) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `date_enrolled` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(55) DEFAULT 'enrolled'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblstudents`
--

INSERT INTO `tblstudents` (`id`, `studid`, `fname`, `lname`, `level`, `course`, `address`, `date_enrolled`, `date_modified`, `status`) VALUES
(1, 'STUD0001', 'Joyseline', 'Santos', '1st', 'BS in Accountancy', 'Quezon City', '2022-07-22 21:37:56', '2022-07-22 21:38:02', 'enrolled'),
(2, 'STUD0002', 'Reymark', 'Villarin', '1st', 'BS in Tourism Management', 'Caloocan City', '2022-07-22 21:37:56', '2022-07-22 21:38:01', 'enrolled'),
(5, 'STUD0005', 'Rio', 'Carpio', '4th', 'BS in Information Technology', 'Navotas City', '2022-07-22 21:37:56', '2022-07-22 22:07:28', 'graduate'),
(7, 'STUD0006', 'Mark', 'Hermosa', '1st', 'BS in Tourism Management', 'Valenzuela City', '2022-07-22 22:00:18', '2022-07-22 22:00:18', 'enrolled'),
(8, 'STUD0008', 'Jennifer', 'Ferrer', '1st', 'BS in Tourism Management', 'Marilao, Bulacan', '2022-07-22 22:06:45', '2022-07-22 22:06:45', 'enrolled');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salaries`
--
ALTER TABLE `salaries`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `tblstudents`
--
ALTER TABLE `tblstudents`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `salaries`
--
ALTER TABLE `salaries`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=712;

--
-- AUTO_INCREMENT for table `tblstudents`
--
ALTER TABLE `tblstudents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
