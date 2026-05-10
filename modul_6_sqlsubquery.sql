-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2026 at 06:07 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `modul_6_sqlsubquery`
--

-- --------------------------------------------------------

--
-- Table structure for table `ambil_mk`
--

CREATE TABLE `ambil_mk` (
  `NIM` char(3) NOT NULL,
  `kode_mk` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ambil_mk`
--

INSERT INTO `ambil_mk` (`NIM`, `kode_mk`) VALUES
('101', 'PTI447'),
('103', 'TIK333'),
('104', 'PTI333'),
('104', 'PTI777'),
('105', 'PTI123'),
('107', 'PTI777');

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `Kode_dos` int(2) NOT NULL,
  `Nama_dos` varchar(30) NOT NULL,
  `Alamat_dos` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`Kode_dos`, `Nama_dos`, `Alamat_dos`) VALUES
(10, 'Suharto', 'Jl. Jombang'),
(11, 'Martono', 'Jl. Kalpataru'),
(12, 'Rahmawati', 'Jl. Jakarta'),
(13, 'Bambang', 'Jl. Bandung'),
(14, 'Nurul', 'Jl. Raya Tidar');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `kode_jur` char(2) NOT NULL,
  `Nama_jur` varchar(30) NOT NULL,
  `Kode_dos` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`kode_jur`, `Nama_jur`, `Kode_dos`) VALUES
('TE', 'Teknik Elektro', 10),
('TM', 'Teknik Mesin', 13),
('TS', 'Teknik Sipil', 23);

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `NIM` char(3) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `JK` enum('P','L') NOT NULL,
  `Alamat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`NIM`, `Nama`, `JK`, `Alamat`) VALUES
('101', 'Arif', 'L', 'Jl. Kenangan'),
('102', 'Budi', 'L', 'Jl. Jombang'),
('103', 'Wati', 'P', 'Jl. Surabaya'),
('104', 'Ika', 'P', 'Jl. Jombang'),
('105', 'Tono', 'L', 'Jl. Jakarta'),
('106', 'Iwan', 'L', 'Jl. Bandung'),
('107', 'Sari', 'P', 'Jl. Malang');

-- --------------------------------------------------------

--
-- Table structure for table `matakuliah`
--

CREATE TABLE `matakuliah` (
  `kd_mk` char(6) NOT NULL,
  `Nama_mk` varchar(30) NOT NULL,
  `SKS` int(5) NOT NULL,
  `Semester` int(5) NOT NULL,
  `Kode_dos` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `matakuliah`
--

INSERT INTO `matakuliah` (`kd_mk`, `Nama_mk`, `SKS`, `Semester`, `Kode_dos`) VALUES
('PTI123', 'Grafika Multimedia', 3, 5, 12),
('PTI333', 'Basis Data Terdistribusi', 3, 5, 10),
('PTI447', 'Praktikum Basis Data', 1, 3, 11),
('PTI777', 'Sistem Informasi', 2, 3, 99),
('TIK123', 'Jaringan Komputer', 2, 5, 33),
('TIK333', 'Sistem Operasi', 3, 5, 10),
('TIK342', 'Praktikum Basis Data', 1, 3, 11);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ambil_mk`
--
ALTER TABLE `ambil_mk`
  ADD KEY `NIM` (`NIM`),
  ADD KEY `kode_mk` (`kode_mk`);

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`Kode_dos`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`kode_jur`),
  ADD KEY `Kode_dos` (`Kode_dos`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`NIM`);

--
-- Indexes for table `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`kd_mk`),
  ADD KEY `Kode_dos` (`Kode_dos`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ambil_mk`
--
ALTER TABLE `ambil_mk`
  ADD CONSTRAINT `ambil_mk_ibfk_1` FOREIGN KEY (`NIM`) REFERENCES `mahasiswa` (`NIM`),
  ADD CONSTRAINT `ambil_mk_ibfk_2` FOREIGN KEY (`kode_mk`) REFERENCES `matakuliah` (`kd_mk`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
