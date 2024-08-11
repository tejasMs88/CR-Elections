-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 11, 2024 at 04:52 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr_`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(50) DEFAULT NULL,
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(50) DEFAULT NULL,
  `hashed_password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `admin_id`, `admin_name`, `hashed_password`) VALUES
('Dean', 1, 'Jayanna H S', '$2y$10$rdxvjXzoZq8KH1B0JffuEueMZ3yPlNIuysLxIzsl9Xht7ylFvgn3e');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dept_id` int(11) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `dept_name` varchar(50) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_id`, `session_id`, `dept_name`, `admin_id`) VALUES
(1, 1, 'CSE', 1),
(2, 2, 'ISE', 1),
(3, 3, 'ECE', 1),
(4, 4, 'ME', 1);

-- --------------------------------------------------------

--
-- Table structure for table `nominations`
--

CREATE TABLE `nominations` (
  `id` int(11) NOT NULL,
  `proposer_name` varchar(255) NOT NULL,
  `proposer_usn` varchar(20) NOT NULL,
  `candidate_name` varchar(255) NOT NULL,
  `candidate_usn` varchar(20) NOT NULL,
  `candidate_year` varchar(10) NOT NULL,
  `candidate_department` varchar(255) NOT NULL,
  `candidate_college` varchar(255) NOT NULL,
  `proposer_verified` tinyint(1) DEFAULT 0,
  `candidate_verified` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `username` varchar(50) DEFAULT NULL,
  `student_id` int(11) NOT NULL,
  `student_name` varchar(50) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `st_year` int(11) DEFAULT NULL,
  `voted` tinyint(1) NOT NULL DEFAULT 0,
  `hashed_password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`username`, `student_id`, `student_name`, `dept_id`, `st_year`, `voted`, `hashed_password`) VALUES
('1SI23CS001', 1, 'Adarsh', 1, 1, 1, '$2y$10$RLsKSEIsFUjNhofLaQZrguMCK4Lne.93CaH1rLS3lR6h0FhBCtPKa'),
('1SI23CS002', 2, 'Aadya', 1, 1, 0, '$2y$10$xeVauG8U0jStd4UeIqGh7e3dYS/pPN8mzhbBKvqOvQqOmqksvyq02'),
('1SI23CS003', 3, 'Abhinav', 1, 1, 0, '$2y$10$vwL2HzwvZ91ypoqkyxLmFeMdpvsgiBGVZFjHVQ5x8q0j1J0xYh03K'),
('1SI23CS004', 4, 'Ajay', 1, 1, 0, '$2y$10$cW7jkOk4YtfAQqtWpYgQJuhi0JiV5snPCISKGl8c5Ptj4kFh.KBve'),
('1SI23CS005', 5, 'Thippeswamy', 1, 1, 0, '$2y$10$jOIs95TSMvaVx5DGOfV/2.aZvSWffeHCy3oQZHATfR6JViTv1GpJK'),
('1SI22CS001', 6, 'Arun', 1, 2, 0, '$2y$10$kMH2sW2Fw7el9SWxGdN7.ObgRMVEDDM.nse7EufUdZS9jVePN5RP.'),
('1SI22CS002', 7, 'Usha', 1, 2, 0, '$2y$10$MjrHyCXqciD6M9jv.0ef8ev1rGzQnJJOYDpdcD34rk5UW9pFPeiTO'),
('1SI22CS003', 8, 'Imran', 1, 2, 0, '$2y$10$YslPGgvGLhAulJWLXP5XDO6CnwmQLNtYf7BjW2EtbqiKjpgHyw6hO'),
('1SI22CS004', 9, 'Siri', 1, 2, 0, '$2y$10$k1MdIh9RXXJQbIL04EouW.Zob8YuJYAEZd/ECowj3pWmhtyazbk/e'),
('1SI22CS005', 10, 'Lalith', 1, 2, 0, '$2y$10$I5kiTUONjrMGKwy01TAw1e4WpNhjIKQLzDQemx7GRAkSnM293Ygsa'),
('1SI21CS001', 11, 'Shreyas', 1, 3, 0, '$2y$10$oCqkua6clRmn2kuUjtyKKuAPAr7xIUt3QIKH3sWeT/E0jxV5B6r3W'),
('1SI21CS002', 12, 'Nidhi', 1, 3, 0, '$2y$10$4a1NBDhIMSugek1xk7uAIeZl4Zi2zsTNHyE7STneyMnQ62gAljj0m'),
('1SI21CS003', 13, 'Lavanya', 1, 3, 0, '$2y$10$jFRlu5iztisZwlqMoSpuuOsQPB7pWQPRwrU2LfY.bnuVO9JTF1bgi'),
('1SI21CS004', 14, 'Nikhil', 1, 3, 0, '$2y$10$HoTTQDAJLyfy7I9le4yEp.xGE6UcCFABDloBM1xwZu7ai/V9B1ODS'),
('1SI21CS005', 15, 'Rohith', 1, 3, 0, '$2y$10$M8qoyYu0GUA3hU7HoX.3yuVOXPEL5yFRcY20qwWhLTxxjNOAUtuQS'),
('1SI20CS001', 16, 'Varsha', 1, 4, 0, '$2y$10$ojMdCyml1SVygkbE8JKFVebZppMYIjEuGtIq9cLbHHp7Qva13BaSO'),
('1SI20CS002', 17, 'Rishith', 1, 4, 0, '$2y$10$qgLeZlp.ImTM6hHLqKRUQOOEgFRnOyAILjrW5Ug0FbXim3aVzM4ry'),
('1SI20CS003', 18, 'Keshav', 1, 4, 0, '$2y$10$Bp9G/8CisbzR3vlx3viWnuR.UanAf8HydsqdSrdFi6.HLkCKk6yAq'),
('1SI20CS004', 19, 'Sakshi', 1, 4, 0, '$2y$10$jWOMd02picFNtxq8Ooy1zOZP9f.Luo.oeiKzvGEhiLnar95TKOa4m'),
('1SI20CS005', 20, 'Priya', 1, 4, 0, '$2y$10$Vr4AYsVTC9kD8YYdR0aKSeWqNkKaE.KjtoclTF0Uawkl7.fNCz/1O'),
('1SI23IS001', 21, 'Ankitha', 2, 1, 0, '$2y$10$jkYdzLGdX9MMyKZzZIDY0.cZxSZHaeExZsBgdLnNNrgU/PZZyMg1.'),
('1SI23IS002', 22, 'Abhi', 2, 1, 0, '$2y$10$VHKTMzG08Nasrr43hisfHewATxyVd3hywF7q3uaaCcee8LazFuwbK'),
('1SI23IS003', 23, 'Anusha', 2, 1, 0, '$2y$10$SFwDpHdUSHm.F5pg9XlW7OCqbs6fGAO0rD8U9h1u9E8.XZqShNQZS'),
('1SI23IS004', 24, 'Gana', 2, 1, 0, '$2y$10$8O08hA.jxihpSe4uDi6nKeceI6m3yMsyAuVk4cwJ/KGuxer9Mm0Xy'),
('1SI23IS005', 25, 'Avinash', 2, 1, 0, '$2y$10$jhmrlvKYKx/LW7T0fAP4yuk3oyCq6FDOxIOwT4NAZARaNx6lQIbtO'),
('1SI22IS001', 26, 'Minal', 2, 2, 0, '$2y$10$68dXI5/U1f8gzyc9huBCauUH5fFKrV1NQHOG.P.j.aTEAgNw33BMu'),
('1SI22IS002', 27, 'Ananya', 2, 2, 0, '$2y$10$0CFtC3SZVo4N/G6MX78Ds.m0BAJMDn2mHGG/8ScRIdn/Irk19Bzqa'),
('1SI22IS003', 28, 'Anagha', 2, 2, 0, '$2y$10$u7HiCV4Pw87OSzpviYDUl.xMlq.Zt4Q5yvFsbg6GDAE1iO4y3rXY2'),
('1SI22IS004', 29, 'Deeksha', 2, 2, 0, '$2y$10$DoKfH6hqYRlR8RHkoMp9x..AgwKb66rhxwsmPWbvyc2nFblWThma.'),
('1SI22IS005', 30, 'Sharma', 2, 2, 0, '$2y$10$3oScq84YgYkRhhNajHQ1w.VFHNKATLEzmHpc1TcSkU.BlOvjCwLQ2'),
('1SI21IS001', 31, 'Shayana', 2, 3, 0, '$2y$10$NvlNgvuhdtZwNBdVGBvdNuBfZYlzi99.EcJZjsj31AsUxcKwMK1r2'),
('1SI21IS002', 32, 'Sushanth', 2, 3, 0, '$2y$10$EFcVy8qyFcyAYV9o5FAMpOPyo.5/VitRuZ/U1LqVLoH/20EPHhs9m'),
('1SI21IS003', 33, 'Anushka', 2, 3, 0, '$2y$10$EE8AU1FfHJ/BAAS3omkR.eCuFyK.d0W3yrKR5moSFvo7Xs9P5FMpm'),
('1SI21IS004', 34, 'Ganavi', 2, 3, 0, '$2y$10$2TzTtbyiWvs5Xn8Vm3Ys9eEDKMN/jdt5axx3jwUHg.XdxLu0Jnh3.'),
('1SI21IS005', 35, 'Ananth', 2, 3, 0, '$2y$10$/UW8KDmw.oauGjNpvOsU0OOjnamBKBUU8EX3z4Dz8u/8N5WxTi8Zq'),
('1SI20IS001', 36, 'Ankith', 2, 4, 0, '$2y$10$DTun8WigcsP9WFSylT97Eevn/bz1QfYnSapj.yCbCHpMSzbQvnMme'),
('1SI20IS002', 37, 'Abhishek', 2, 4, 0, '$2y$10$eZc14CZ87OAVD8bSgnhl7.Gq860LqUwFN5PqSrGVdONMvARyXaR3S'),
('1SI20IS003', 38, 'Anudeep', 2, 4, 0, '$2y$10$2Uu44XIY25sp93Cvdgu7COm74kuHpONT0JuNK22El39eG8FfvUrT.'),
('1SI20IS004', 39, 'Gowtham', 2, 4, 0, '$2y$10$w9.17.GiBAQv.oEI.ytOtu7Sd5SDxov7el0IlK55pMts9sPf9AazC'),
('1SI20IS005', 40, 'Manju', 2, 4, 0, '$2y$10$FPwIOCDHwJTc3VjMcYzhwOJN.s.Lf3tUBzDZeUt.Kt54nY0SClZnS'),
('1SI23EC001', 41, 'kumkum', 3, 1, 0, '$2y$10$8iorJbrsy5v3xQ5ex91kSuT6mYzoHk7BHI/UTIV1.YR7zGKa7.VuC'),
('1SI23EC002', 42, 'sharada', 3, 1, 0, '$2y$10$qbnNn2pHRx8Cx7JXyccWu.CtDUhnQsOZbP8SnqiKOhIGQ7J87kzLS'),
('1SI23EC003', 43, 'namitha', 3, 1, 0, '$2y$10$8aHiA.bfXvJWd.8ibQCRZecXPZRVQ/u4IfCHEQlxOwr6c5otdxFzK'),
('1SI23EC004', 44, 'monisha', 3, 1, 0, '$2y$10$2r0RyVyEh4BAt6RwCUb2veG5oA5kBkIHWF8aJ/CMRuCJLl2IpA9qS'),
('1SI23EC005', 45, 'chandu', 3, 1, 0, '$2y$10$lxJOklK6VlhWG0iJvy2t5eHI8bIU6UqNylTbrDg4Nbxj2WkOuOWoe'),
('1SI22EC001', 46, 'nisha', 3, 2, 0, '$2y$10$KiUqLCOhdcwiY2mPOMTv9.Fbrz5L4bWfZ987HSB8vxHVzAS9McM2O'),
('1SI22EC002', 47, 'varsha', 3, 2, 0, '$2y$10$MLBPBXmg1GklKU4U77jWhu8TBQ.6kA/rznz8QyWt0xx/Td.fLj9hG'),
('1SI22EC003', 48, 'shambu', 3, 2, 0, '$2y$10$CvC4YzU2anzdnRKd9Tdi0Oki9dQ5T3AMkGkbc/INRUHdCIyVyscjq'),
('1SI22EC004', 49, 'vivek', 3, 2, 0, '$2y$10$k2.q68FEIBLx2pcE/9HMCuTs6DziYOphcBYu/EaxC7z1qDOWrKhWG'),
('1SI22EC005', 50, 'raju', 3, 2, 0, '$2y$10$4WIDlYgYyQ.4Uh7f0q0ekeen3z9LptSGnYB4OB0q4/Iew0PTqCocq'),
('1SI21EC001', 51, 'mohan', 3, 3, 0, '$2y$10$i9y7noZm2QaH/NtKNyejr.eCT4YyHNS0S3pE1BJdGo3RXpvvus30G'),
('1SI21EC002', 52, 'krishna', 3, 3, 0, '$2y$10$d0QcbbNR/Bvc3VDSGdJAYuDPUoe7kqci5vbP.JyzQuoQStKsKS9SO'),
('1SI21EC003', 53, 'nayana', 3, 3, 0, '$2y$10$dB3YuUQaImE7TqnmYtmMuO0SDgLPMAJXjzDIxH3LyW25ZgVCLmCGG'),
('1SI21EC004', 54, 'raksha', 3, 3, 0, '$2y$10$dQ7y0bgpOxtEDbmz0QzbieZZdKKoucjexvf9Fg6aH8z4TSpS/5Mum'),
('1SI21EC005', 55, 'Yuktha', 3, 3, 0, '$2y$10$ueudrvS1Qb5uuLN9ZaNPCeTv9n/.3dbn8IRjkwjrrQfiSVHzYBv22'),
('1SI20EC001', 56, 'daksha', 3, 4, 0, '$2y$10$mzhjsIrxN6PkdUf.fphph.HyVf3W59IVjIXlZboz7klT0tuMShDpq'),
('1SI20EC002', 57, 'sonu', 3, 4, 0, '$2y$10$3w6RlYk5rxkPYlrFOSKEze800t0X6FGASNji50Zxrf26bjJwOxH72'),
('1SI20EC003', 58, 'sanju', 3, 4, 0, '$2y$10$YrnJotYaR8wFKDThtVnhq.WgTYKk5kZJu8XcGleOHGcn9Z.6CleZC'),
('1SI20EC004', 59, 'hima', 3, 4, 0, '$2y$10$xHlg1p6OHj9mTCNlu2..Se1aojJRYsBZCgkqvVzNf8u8c3ybB6n9G'),
('1SI20EC005', 60, 'Preksha', 3, 4, 0, '$2y$10$Y.w5AlEGx0P8zWqj1TQEA.MWmdPM7Zvd3rhLGdlydlfqwhVHlvyr2'),
('1SI23ME001', 61, 'Amruth', 4, 1, 0, '$2y$10$FYntkVzShrcc.B7nseZq/ucW8hSLkz/OYZukaWOwQR3mFlf5t3oEO'),
('1SI23ME002', 62, 'Sai', 4, 1, 0, '$2y$10$h.mBtxDacFCggKeYxfozx.KP1Huvgmozk5jqsfWO2MzQ0TdXmChzm'),
('1SI23ME003', 63, 'Saketh', 4, 1, 0, '$2y$10$C.ZAz9q0s3FmoLY5vGEUXuTQqhGMBEd5eZC6v4IlgyEBL0Vb6cexq'),
('1SI23ME004', 64, 'Mohith', 4, 1, 0, '$2y$10$/DEc43DqNFvfpk4Uk3JuCuW50F4NVkJ6tAxA7FBbItMDFF6KkI/TK'),
('1SI23ME005', 65, 'Amrutha', 4, 1, 0, '$2y$10$gDD2vq26WKcL6okZPCk3CeZ.uBEydwRHlugOua07//7tXAhXsN28i'),
('1SI22ME001', 66, 'Bhargav', 4, 2, 0, '$2y$10$0Ywoi7QH1TPE1TlJpcQmXuECnqWDLORkiidwvLj/jQuNliVsvUY4m'),
('1SI22ME002', 67, 'Bhuvan', 4, 2, 0, '$2y$10$k.bajJO6VCHUCaydaw0kkO9jNry71l/xRvw0FGFsGaSnyKA4q9aie'),
('1SI22ME003', 68, 'Samahith', 4, 2, 0, '$2y$10$WiU9eLD1cJiE8UdIfW88aueEikg6iBMnPWOTpANu13l2Ja4d81uNO'),
('1SI22ME004', 69, 'Shubham', 4, 2, 0, '$2y$10$WJ9wcPJ6vdbu8MRp5nGSn.hjgwKHEjW2PJbQntvtQa1MY2LmCHb/m'),
('1SI22ME005', 70, 'Veeresh', 4, 2, 0, '$2y$10$Zy.K81WmeykfLKQjUudou.WstL8FRaEsnzE2pZVq9JWsyB7obYXo6'),
('1SI21ME001', 71, 'Aman', 4, 3, 0, '$2y$10$0lBOi3uVZ0KEZhxmarmt.eMkz8AYiRXvwC/32jl.CeT1aFY5AmXqW'),
('1SI21ME002', 72, 'Abrar', 4, 3, 0, '$2y$10$9rpQV4rKLqGeFFysSy8H1..L/l6On1hKHBw4qa2QmHeWpw6Gr/Yme'),
('1SI21ME003', 73, 'Saif', 4, 3, 0, '$2y$10$zUC6Z3ZDoWq3LuFAg.NyG.QzXKymOzuVjdblwXQI10BDkuWz5b8M2'),
('1SI21ME004', 74, 'Namith', 4, 3, 0, '$2y$10$R4nd0cpPWL.0xPEvJcJ1jODUg/jSqWTyNatuimPO0sYldDBtPheOq'),
('1SI21ME005', 75, 'Karthik', 4, 3, 0, '$2y$10$C834054OFjfbu4NHuP3n5uQhTZnTKZjMxp.oD6RJR/fwqxK0T5baK'),
('1SI20ME001', 76, 'Archana', 4, 4, 0, '$2y$10$JA6iHEMDStI68b7iAEEjkOIB.goJHTGt1KcYVxFb1y9GUNg2TqIE6'),
('1SI20ME002', 77, 'Nishanka', 4, 4, 0, '$2y$10$6hedK4R6sWD4IMlBvmVLgek9eizPxQ6tq7XYsqWVdn650V0vjjp8.'),
('1SI20ME003', 78, 'Vishal', 4, 4, 0, '$2y$10$jrKCwfSdzzp1Kqd81J42G.8SmK84MBPDEQ9d3vOgdL.JoouT3lIMS'),
('1SI20ME004', 79, 'Akash', 4, 4, 0, '$2y$10$RfNi7vFWwlP7kDKak/RPG.pmpdVcv0FKZjDnIOb5eWrPnawt5LMDW'),
('1SI20ME005', 80, 'Sachin', 4, 4, 0, '$2y$10$RDaSnrhKfkVVI9iHpO6xUebkptAFvR4ZeffD0IQd4i/724K9V5owC');

-- --------------------------------------------------------

--
-- Table structure for table `verified_nominations`
--

CREATE TABLE `verified_nominations` (
  `candidate_id` int(11) NOT NULL,
  `proposer_name` varchar(255) NOT NULL,
  `proposer_usn` varchar(20) NOT NULL,
  `candidate_name` varchar(255) NOT NULL,
  `candidate_usn` varchar(20) NOT NULL,
  `candidate_year` varchar(10) NOT NULL,
  `candidate_department` varchar(255) NOT NULL,
  `candidate_college` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `no_of_votes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `student_id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `voting_session`
--

CREATE TABLE `voting_session` (
  `voting_start` datetime DEFAULT NULL,
  `voting_end` datetime DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `voting_session`
--

INSERT INTO `voting_session` (`voting_start`, `voting_end`, `dept_id`) VALUES
('2024-08-05 10:52:00', '2024-08-07 10:52:00', 1),
('2024-02-04 02:24:00', '2024-03-01 02:24:00', 2),
('2024-02-14 03:17:00', '2024-02-18 03:17:00', 3),
('2024-01-29 08:45:00', '2024-02-29 08:45:00', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dept_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `nominations`
--
ALTER TABLE `nominations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indexes for table `verified_nominations`
--
ALTER TABLE `verified_nominations`
  ADD PRIMARY KEY (`candidate_id`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voting_session`
--
ALTER TABLE `voting_session`
  ADD KEY `dept_id` (`dept_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nominations`
--
ALTER TABLE `nominations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `verified_nominations`
--
ALTER TABLE `verified_nominations`
  MODIFY `candidate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
