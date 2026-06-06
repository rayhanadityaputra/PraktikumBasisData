-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2026 at 07:46 AM
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
-- Database: `toko_buku`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `tambah_transaksi` (IN `p_id_pelanggan` INT, IN `p_id_buku` INT, IN `p_jumlah` INT)   BEGIN

    DECLARE v_harga DECIMAL(10,2);
    DECLARE v_stok INT;
    DECLARE v_total DECIMAL(10,2);

    SELECT harga, stok
    INTO v_harga, v_stok
    FROM buku
    WHERE id_buku = p_id_buku;

    IF v_stok < p_jumlah THEN

        SELECT 'Stok tidak mencukupi' AS pesan;

    ELSE

        SET v_total = v_harga * p_jumlah;

        UPDATE buku
        SET stok = stok - p_jumlah
        WHERE id_buku = p_id_buku;

        INSERT INTO transaksi(
            id_pelanggan,
            id_buku,
            jumlah,
            total_harga,
            tanggal_transaksi
        )
        VALUES(
            p_id_pelanggan,
            p_id_buku,
            p_jumlah,
            v_total,
            CURDATE()
        );

        UPDATE pelanggan
        SET total_belanja = total_belanja + v_total
        WHERE id_pelanggan = p_id_pelanggan;

        SELECT 'Transaksi berhasil' AS pesan;

    END IF;

END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `hitung_diskon` (`total_belanja` DECIMAL(10,2)) RETURNS DECIMAL(5,2)  BEGIN

    DECLARE diskon DECIMAL(5,2);

    IF total_belanja < 1000000 THEN
        SET diskon = 0;

    ELSEIF total_belanja < 5000000 THEN
        SET diskon = 5;

    ELSE
        SET diskon = 10;

    END IF;

    RETURN diskon;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `judul` varchar(100) DEFAULT NULL,
  `penulis` varchar(100) DEFAULT NULL,
  `harga` decimal(10,2) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `judul`, `penulis`, `harga`, `stok`) VALUES
(1, 'Basis Data', 'Abdul Kadir', 150000.00, 7),
(2, 'Pemrograman PHP', 'Rosa A.S', 200000.00, 5),
(3, 'Algoritma dan Pemrograman', 'Sukamto', 250000.00, 0),
(4, 'Pemrograman Java', 'Herbert Schildt', 300000.00, 12),
(5, 'Struktur Data', 'Narasimha Karumanchi', 180000.00, 18),
(6, 'Jaringan Komputer', 'Andrew S. Tanenbaum', 275000.00, 25),
(7, 'Kecerdasan Buatan', 'Stuart Russell', 350000.00, 8),
(8, 'Machine Learning', 'Tom Mitchell', 400000.00, 10),
(9, 'Analisis Sistem', 'Jogiyanto', 220000.00, 14),
(10, 'Rekayasa Perangkat Lunak', 'Pressman', 320000.00, 16);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `total_belanja` decimal(10,2) DEFAULT 0.00,
  `status_member` enum('REGULER','GOLD','PLATINUM') DEFAULT 'REGULER'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama`, `total_belanja`, `status_member`) VALUES
(1, 'Andi Saputra', 5000000.00, 'PLATINUM'),
(2, 'Budi Santoso', 6000000.00, 'PLATINUM'),
(3, 'Citra Lestari', 0.00, 'REGULER'),
(4, 'Dewi Anggraini', 50000.00, 'REGULER'),
(5, 'Eko Prasetyo', 1500000.00, 'GOLD'),
(6, 'Fajar Nugroho', 50000.00, 'REGULER'),
(7, 'Gita Maharani', 1500000.00, 'GOLD'),
(8, 'Hendra Wijaya', 50000.00, 'REGULER'),
(9, 'Intan Permata', 0.00, 'REGULER'),
(10, 'Joko Susilo', 1500000.00, 'GOLD');

--
-- Triggers `pelanggan`
--
DELIMITER $$
CREATE TRIGGER `update_status_member` BEFORE UPDATE ON `pelanggan` FOR EACH ROW BEGIN

    IF NEW.total_belanja >= 5000000 THEN
        SET NEW.status_member = 'PLATINUM';

    ELSEIF NEW.total_belanja >= 1000000 THEN
        SET NEW.status_member = 'GOLD';

    ELSE
        SET NEW.status_member = 'REGULER';

    END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_pelanggan` int(11) DEFAULT NULL,
  `id_buku` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `total_harga` decimal(10,2) DEFAULT NULL,
  `tanggal_transaksi` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_pelanggan`, `id_buku`, `jumlah`, `total_harga`, `tanggal_transaksi`) VALUES
(1, 1, 1, 3, 450000.00, '2026-06-06'),
(2, 1, 3, 5, 1250000.00, '2026-06-06'),
(3, 1, 3, 5, 1250000.00, '2026-06-06'),
(4, 1, 1, 10, 1500000.00, '2026-06-06'),
(5, 1, 2, 10, 2000000.00, '2026-06-06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_buku` (`id_buku`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
