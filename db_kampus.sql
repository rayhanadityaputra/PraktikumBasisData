-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2026 at 12:37 PM
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
-- Database: `db_kampus`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `nip` char(10) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `bidang` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`nip`, `nama`, `bidang`) VALUES
('1980010001', 'Dr. Ahmad Fauzi', 'Basis Data'),
('1980010002', 'Dr. Siti Aminah', 'Pemrograman'),
('1980010003', 'Dr. Rudi Hartono', 'Jaringan'),
('1980010004', 'Dr. Maya Putri', 'Kecerdasan Buatan'),
('1980010005', 'Dr. Deni Saputra', 'Sistem Informasi'),
('1980010006', 'Dr. Andika Prasetyo', 'Sistem Operasi'),
('1980010007', 'Dr. Rahmawati', 'Data Mining'),
('1980010008', 'Dr. Yusuf Hidayat', 'Keamanan Informasi'),
('1980010009', 'Dr. Nur Aini', 'Pemrograman Mobile'),
('1980010010', 'Dr. Bambang Setiawan', 'Machine Learning'),
('1980010011', 'Dr. Fitri Lestari', 'RPL'),
('1980010012', 'Dr. Hendra Gunawan', 'IoT'),
('1980010013', 'Dr. Siska Melati', 'Komputasi Awan'),
('1980010014', 'Dr. Rina Anggraini', 'Algoritma'),
('1980010015', 'Dr. Taufik Hidayat', 'Basis Data');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` char(10) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `jurusan` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `jurusan`) VALUES
('1234567890', 'Andi', 'Informatika'),
('2311000001', 'Andi Saputra', 'Informatika'),
('2311000002', 'Budi Santoso', 'Sistem Informasi'),
('2311000003', 'Citra Dewi', 'Informatika'),
('2311000004', 'Dewi Lestari', 'Teknik Komputer'),
('2311000005', 'Eko Prasetyo', 'Sistem Informasi'),
('2311000006', 'Farhan Akbar', 'Informatika'),
('2311000007', 'Gita Maharani', 'Sistem Informasi'),
('2311000008', 'Hendra Wijaya', 'Teknik Komputer'),
('2311000009', 'Indah Permata', 'Informatika'),
('2311000010', 'Joko Susilo', 'Sistem Informasi'),
('2311000011', 'Kartika Sari', 'Informatika'),
('2311000012', 'Lukman Hakim', 'Teknik Komputer'),
('2311000013', 'Maya Putri', 'Sistem Informasi'),
('2311000014', 'Nanda Saputra', 'Informatika'),
('2311000015', 'Oki Pratama', 'Teknik Komputer');

-- --------------------------------------------------------

--
-- Table structure for table `matakuliah`
--

CREATE TABLE `matakuliah` (
  `kode_mk` char(6) NOT NULL,
  `nama_mk` varchar(50) DEFAULT NULL,
  `sks` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `matakuliah`
--

INSERT INTO `matakuliah` (`kode_mk`, `nama_mk`, `sks`) VALUES
('IF1001', 'Basis Data', 3),
('IF1002', 'Struktur Data', 3),
('IF1003', 'Pemrograman Web', 3),
('IF1004', 'Jaringan Komputer', 3),
('IF1005', 'Kecerdasan Buatan', 3),
('IF1006', 'Sistem Operasi', 3),
('IF1007', 'Algoritma dan Pemrograman', 3),
('IF1008', 'Data Mining', 3),
('IF1009', 'Keamanan Informasi', 3),
('IF1010', 'Pemrograman Mobile', 3),
('IF1011', 'Machine Learning', 3),
('IF1012', 'Manajemen Proyek TI', 2),
('IF1013', 'Rekayasa Perangkat Lunak', 3),
('IF1014', 'Komputasi Awan', 3),
('IF1015', 'Internet of Things', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tagihan`
--

CREATE TABLE `tagihan` (
  `id_tagihan` int(11) NOT NULL,
  `nim` char(10) DEFAULT NULL,
  `jumlah_tagihan` decimal(10,2) DEFAULT NULL,
  `status_pembayaran` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tagihan`
--

INSERT INTO `tagihan` (`id_tagihan`, `nim`, `jumlah_tagihan`, `status_pembayaran`) VALUES
(1, '2311000001', 1500000.00, 'Lunas'),
(2, '2311000002', 2000000.00, 'Lunas'),
(3, '2311000003', 1750000.00, 'Belum Lunas'),
(4, '2311000004', 2250000.00, 'Lunas'),
(5, '2311000005', 1800000.00, 'Belum Lunas');

-- --------------------------------------------------------

--
-- Table structure for table `temp_tabel`
--

CREATE TABLE `temp_tabel` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`nip`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`kode_mk`);

--
-- Indexes for table `tagihan`
--
ALTER TABLE `tagihan`
  ADD PRIMARY KEY (`id_tagihan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tagihan`
--
ALTER TABLE `tagihan`
  MODIFY `id_tagihan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
