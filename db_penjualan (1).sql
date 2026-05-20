-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2026 at 02:48 PM
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
-- Database: `db_penjualan`
--

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(50) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `alamat`) VALUES
(1, 'Andi', 'Jl. Merdeka'),
(2, 'Budi', 'Jl. Sudirman'),
(3, 'Rayhan', 'Jl. Magelang'),
(4, 'Ilham', 'Jl. Sudirman'),
(5, 'Citra', 'Jl. Malioboro'),
(6, 'Dinda', 'Jl. Kaliurang'),
(7, 'Eka', 'Jl. Gejayan'),
(8, 'Farhan', 'Jl. Magelang'),
(9, 'Gina', 'Jl. Solo'),
(10, 'Hadi', 'Jl. Parangtritis');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `kode_produk` varchar(10) NOT NULL,
  `nama_produk` varchar(50) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`kode_produk`, `nama_produk`, `harga`) VALUES
('P001', 'Laptop', 7000000),
('P002', 'Mouse', 150000),
('P003', 'Headset', 350000),
('P004', 'Monitor', 2500000),
('P005', 'Printer', 1800000),
('P006', 'Flashdisk', 120000),
('P007', 'Charger', 450000),
('P008', 'Speaker', 600000),
('P009', 'Webcam', 500000),
('P010', 'Router', 800000),
('P011', 'Mic', 7000000),
('P012', 'Cooler', 150000);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `kode_produk` varchar(10) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `total_harga` int(11) DEFAULT NULL,
  `id_pelanggan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `kode_produk`, `jumlah`, `total_harga`, `id_pelanggan`) VALUES
(1, 'P001', 2, 14000000, NULL),
(2, 'P002', 5, 750000, NULL),
(18, 'P003', 1, 350000, 1),
(19, 'P004', 1, 2500000, 2),
(20, 'P005', 1, 1800000, 3),
(21, 'P006', 5, 600000, 4),
(22, 'P007', 2, 900000, 5),
(23, 'P008', 1, 600000, 6),
(24, 'P009', 2, 1000000, 7),
(25, 'P010', 1, 800000, 8),
(26, 'P011', 1, 7000000, 1),
(27, 'P012', 2, 300000, 2),
(28, 'P011', 2, 14000000, 3),
(29, 'P004', 2, 5000000, 4),
(30, 'P007', 1, 450000, 5),
(31, 'P003', 3, 1050000, 6),
(32, 'P006', 10, 1200000, 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`kode_produk`),
  ADD UNIQUE KEY `idx_kode_produk` (`kode_produk`),
  ADD KEY `idx_harga` (`harga`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `idx_kode_produk` (`kode_produk`),
  ADD KEY `idx_total_harga` (`total_harga`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`kode_produk`) REFERENCES `produk` (`kode_produk`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
