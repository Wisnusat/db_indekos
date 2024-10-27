-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 27, 2024 at 03:44 PM
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
-- Database: `db_kost`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nomor_telepon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nama`, `email`, `password`, `nomor_telepon`) VALUES
(1, 'Admin User', 'adminuser@gmail.com', 'adminpass123', '08335678912'),
(2, 'Support Staff', 'support@gmail.com', 'support456', '08127891234');

-- --------------------------------------------------------

--
-- Table structure for table `kos`
--

CREATE TABLE `kos` (
  `id_kos` int(11) NOT NULL,
  `id_pemilik` int(11) NOT NULL,
  `nama_kos` varchar(255) NOT NULL,
  `alamat_kos` text NOT NULL,
  `harga_sewa` decimal(10,2) NOT NULL,
  `deskripsi_kos` text NOT NULL,
  `fasilitas` text NOT NULL,
  `status_kos` varchar(50) NOT NULL DEFAULT 'Tersedia'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kos`
--

INSERT INTO `kos` (`id_kos`, `id_pemilik`, `nama_kos`, `alamat_kos`, `harga_sewa`, `deskripsi_kos`, `fasilitas`, `status_kos`) VALUES
(16, 1, 'Kos Harmoni', 'Jl. Merdeka No.10, Semarang', 1500000.00, 'Kos nyaman dekat kampus dan pusat perbelanjaan.', 'AC, WiFi, Parkir, Kamar Mandi Dalam', 'Tersedia'),
(17, 2, 'Kos Sentosa', 'Jl. Kemerdekaan No.20, Bandung', 1200000.00, 'Kos dengan suasana asri dan fasilitas lengkap.', 'AC, Laundry, Dapur Umum', 'Tersedia'),
(18, 3, 'Kos Bahagia', 'Jl. Kebahagiaan No.15, Jakarta', 2000000.00, 'Kos dekat stasiun dan mudah diakses transportasi umum.', 'AC, WiFi, Parkir', 'Penuh'),
(19, 4, 'Kos Gembira', 'Jl. Senang No.5, Yogyakarta', 1000000.00, 'Kos dengan fasilitas memadai dan lingkungan aman.', 'WiFi, Kamar Mandi Dalam, Laundry', 'Tersedia'),
(20, 5, 'Kos Elite', 'Jl. Mahogany No.7, Surabaya', 2500000.00, 'Kos elit dengan desain modern dan fasilitas premium.', 'AC, WiFi, Parkir, Gym', 'Tersedia'),
(21, 6, 'Kos Sejahtera', 'Jl. Raya Timur No.3, Medan', 900000.00, 'Kos terjangkau dengan akses mudah ke fasilitas umum.', 'WiFi, Parkir, Kamar Mandi Dalam', 'Tersedia'),
(22, 7, 'Kos Amanah', 'Jl. Ampera No.8, Malang', 1100000.00, 'Kos nyaman dan tenang, cocok untuk pelajar.', 'AC, Laundry, WiFi', 'Penuh'),
(23, 8, 'Kos Makmur', 'Jl. Rajawali No.18, Semarang', 1300000.00, 'Kos dekat kampus dengan fasilitas lengkap.', 'AC, Dapur Umum, WiFi', 'Tersedia'),
(24, 9, 'Kos Modern', 'Jl. Modern No.9, Bali', 1700000.00, 'Kos dengan desain modern dan akses ke kolam renang.', 'AC, Kolam Renang, WiFi, Gym', 'Tersedia'),
(25, 10, 'Kos Nyaman', 'Jl. Jati No.22, Bogor', 950000.00, 'Kos murah dengan fasilitas cukup lengkap.', 'Parkir, WiFi, Kamar Mandi Luar', 'Tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `moderasi_kos`
--

CREATE TABLE `moderasi_kos` (
  `id_moderasi` int(11) NOT NULL,
  `id_kos` int(11) NOT NULL,
  `status_moderasi` varchar(50) NOT NULL DEFAULT 'Belum Disetujui',
  `pesan_admin` text DEFAULT NULL,
  `tanggal_moderasi` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `moderasi_kos`
--

INSERT INTO `moderasi_kos` (`id_moderasi`, `id_kos`, `status_moderasi`, `pesan_admin`, `tanggal_moderasi`) VALUES
(41, 16, 'Belum Disetujui', NULL, NULL),
(42, 17, 'Belum Disetujui', NULL, NULL),
(43, 18, 'Disetujui', 'Kos ini layak untuk disetujui.', '2024-10-01'),
(44, 19, 'Belum Disetujui', NULL, NULL),
(45, 20, 'Disetujui', 'Kos elit dengan fasilitas premium.', '2024-10-02'),
(46, 21, 'Belum Disetujui', NULL, NULL),
(47, 22, 'Ditolak', 'Kos ini tidak memenuhi standar.', '2024-10-03'),
(48, 23, 'Belum Disetujui', NULL, NULL),
(49, 24, 'Disetujui', 'Kos modern dan nyaman untuk disewa.', '2024-10-04'),
(50, 25, 'Belum Disetujui', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_reservasi` int(11) NOT NULL,
  `metode_pembayaran` varchar(50) NOT NULL,
  `jumlah_bayar` decimal(10,2) NOT NULL,
  `tanggal_bayar` date NOT NULL,
  `status_pembayaran` varchar(50) NOT NULL DEFAULT 'Belum Dibayar'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_reservasi`, `metode_pembayaran`, `jumlah_bayar`, `tanggal_bayar`, `status_pembayaran`) VALUES
(16, 11, 'Transfer Bank', 1500000.00, '2024-10-01', 'Sudah Dibayar'),
(17, 12, 'Kartu Kredit', 1200000.00, '2024-10-02', 'Sudah Dibayar'),
(18, 13, 'Cash', 2000000.00, '2024-10-03', 'Sudah Dibayar'),
(19, 14, 'Transfer Bank', 1000000.00, '2024-10-04', 'Belum Dibayar'),
(20, 15, 'Kartu Kredit', 2500000.00, '2024-10-05', 'Sudah Dibayar'),
(21, 16, 'Cash', 900000.00, '2024-10-06', 'Belum Dibayar'),
(22, 17, 'Transfer Bank', 1100000.00, '2024-10-07', 'Sudah Dibayar'),
(23, 18, 'Kartu Kredit', 1300000.00, '2024-10-08', 'Sudah Dibayar'),
(24, 19, 'Cash', 1700000.00, '2024-10-09', 'Belum Dibayar'),
(25, 20, 'Transfer Bank', 950000.00, '2024-10-10', 'Sudah Dibayar');

-- --------------------------------------------------------

--
-- Table structure for table `pemilik_kos`
--

CREATE TABLE `pemilik_kos` (
  `id_pemilik` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nomor_telepon` varchar(15) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pemilik_kos`
--

INSERT INTO `pemilik_kos` (`id_pemilik`, `nama`, `email`, `password`, `nomor_telepon`, `alamat`) VALUES
(1, 'Budi Santoso', 'budisantoso@gmail.com', 'budi123', '081234567892', 'Jalan Thamrin No. 3'),
(2, 'Tio Putra Pratama', 'TioPratama@gmail.com', 'pratama564', '085834567891', 'Jalan M.T Haryono No. 10'),
(3, 'Fendi Kurniawan', 'FKurniawan@gmail.com', 'awan89', '085878537851', 'Jalan M. Soekarno No. 11'),
(4, 'Ayu Lestari', 'ayulestari@gmail.com', 'ayu012', '081234567893', 'Jalan Gatot Subroto No. 4'),
(5, 'Rina Suryani', 'rina.suryani@gmail.com', 'rina456', '082345678901', 'Jalan Sudirman No. 12'),
(6, 'Andi Wijaya', 'andiwijaya@gmail.com', 'andi234', '085612345678', 'Jalan Diponegoro No. 8'),
(7, 'Siti Marlina', 'sitimarlina@gmail.com', 'marlina789', '083912345678', 'Jalan Ahmad Yani No. 6'),
(8, 'Dani Prasetyo', 'daniprasetyo@gmail.com', 'dani123', '082134567892', 'Jalan Imam Bonjol No. 15'),
(9, 'Eka Saputra', 'ekasaputra@gmail.com', 'ekasap123', '081278945612', 'Jalan Sultan Agung No. 20'),
(10, 'Maya Wulandari', 'mayawulandari@gmail.com', 'maya567', '081265478932', 'Jalan Pahlawan No. 14');

-- --------------------------------------------------------

--
-- Table structure for table `penyewa`
--

CREATE TABLE `penyewa` (
  `id_penyewa` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `no_telepon` varchar(15) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penyewa`
--

INSERT INTO `penyewa` (`id_penyewa`, `nama`, `email`, `password`, `no_telepon`, `alamat`) VALUES
(1, 'John Doe', 'johndoe@gmail.com', 'password123', '081234567890', 'Jalan Merdeka No. 1'),
(2, 'Jane Smith', 'janesmith@gmail.com', 'password456', '081234567891', 'Jalan Sudirman No. 2'),
(3, 'Desi Dwi Purwasih', 'desipurwasih@gmail.com', 'star123', '081234567970', 'Jalan Merdeka No. 20'),
(4, 'Syaelendra paksi', 'paksiy@gmail.com', 'pino453', '081234568016', 'Jalan andang No. 21'),
(5, 'Muhammad Sirojul Fuad', 'SiFuad@gmail.com', 'sirojul452', '081234569789', 'Jalan margasari No 11'),
(6, 'Wisnu Satrio Agung', 'WSAgung@gmail.com', 'wisnu6742', '081243669789', 'Jalan tegal No 12'),
(7, 'Reinhart Mahardika', 'RDika@gmail.com', 'reinhart@342', '081243095689', 'Jalan Tegal No 26'),
(8, 'Dita Putri Cahya', 'PutriCahya@gmail.com', 'Cahaya@872', '081249752689', 'Jalan Cilacap No 18'),
(9, 'Putri Galuh Mandarizka', 'Mandarizka@gmail.com', 'riska@82', '085898352689', 'Jalan Purbalingga No 18'),
(10, 'Ana Ristiana', 'Ristiana@gmail.com', 'anabel345', '085863952689', 'Jalan Semarang No 21');

-- --------------------------------------------------------

--
-- Table structure for table `reservasi`
--

CREATE TABLE `reservasi` (
  `id_reservasi` int(11) NOT NULL,
  `id_penyewa` int(11) NOT NULL,
  `id_kos` int(11) NOT NULL,
  `tanggal_reservasi` date NOT NULL,
  `status_reservasi` varchar(50) NOT NULL DEFAULT 'Menunggu Verifikasi'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservasi`
--

INSERT INTO `reservasi` (`id_reservasi`, `id_penyewa`, `id_kos`, `tanggal_reservasi`, `status_reservasi`) VALUES
(11, 1, 16, '2024-10-01', 'Menunggu Verifikasi'),
(12, 2, 17, '2024-10-02', 'Menunggu Verifikasi'),
(13, 3, 18, '2024-10-03', 'Diterima'),
(14, 4, 19, '2024-10-04', 'Menunggu Verifikasi'),
(15, 5, 20, '2024-10-05', 'Diterima'),
(16, 6, 21, '2024-10-06', 'Ditolak'),
(17, 7, 22, '2024-10-07', 'Menunggu Verifikasi'),
(18, 8, 23, '2024-10-08', 'Diterima'),
(19, 9, 24, '2024-10-09', 'Menunggu Verifikasi'),
(20, 10, 25, '2024-10-10', 'Diterima');

-- --------------------------------------------------------

--
-- Table structure for table `verifikasi_penyewa`
--

CREATE TABLE `verifikasi_penyewa` (
  `id_verifikasi` int(11) NOT NULL,
  `id_reservasi` int(11) NOT NULL,
  `status_verifikasi` varchar(50) NOT NULL DEFAULT 'Belum Diverifikasi',
  `tanggal_verifikasi` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `verifikasi_penyewa`
--

INSERT INTO `verifikasi_penyewa` (`id_verifikasi`, `id_reservasi`, `status_verifikasi`, `tanggal_verifikasi`) VALUES
(1, 11, 'Belum Diverifikasi', NULL),
(2, 12, 'Belum Diverifikasi', NULL),
(3, 13, 'Diterima', '2024-10-03'),
(4, 14, 'Belum Diverifikasi', NULL),
(5, 15, 'Diterima', '2024-10-05'),
(6, 16, 'Ditolak', '2024-10-06'),
(7, 17, 'Belum Diverifikasi', NULL),
(8, 18, 'Diterima', '2024-10-08'),
(9, 19, 'Belum Diverifikasi', NULL),
(10, 20, 'Diterima', '2024-10-10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `kos`
--
ALTER TABLE `kos`
  ADD PRIMARY KEY (`id_kos`),
  ADD KEY `id_pemilik` (`id_pemilik`);

--
-- Indexes for table `moderasi_kos`
--
ALTER TABLE `moderasi_kos`
  ADD PRIMARY KEY (`id_moderasi`),
  ADD KEY `id_kos` (`id_kos`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_reservasi` (`id_reservasi`);

--
-- Indexes for table `pemilik_kos`
--
ALTER TABLE `pemilik_kos`
  ADD PRIMARY KEY (`id_pemilik`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `penyewa`
--
ALTER TABLE `penyewa`
  ADD PRIMARY KEY (`id_penyewa`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD PRIMARY KEY (`id_reservasi`),
  ADD KEY `id_penyewa` (`id_penyewa`),
  ADD KEY `id_kos` (`id_kos`);

--
-- Indexes for table `verifikasi_penyewa`
--
ALTER TABLE `verifikasi_penyewa`
  ADD PRIMARY KEY (`id_verifikasi`),
  ADD KEY `id_reservasi` (`id_reservasi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kos`
--
ALTER TABLE `kos`
  MODIFY `id_kos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `moderasi_kos`
--
ALTER TABLE `moderasi_kos`
  MODIFY `id_moderasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `pemilik_kos`
--
ALTER TABLE `pemilik_kos`
  MODIFY `id_pemilik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `penyewa`
--
ALTER TABLE `penyewa`
  MODIFY `id_penyewa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reservasi`
--
ALTER TABLE `reservasi`
  MODIFY `id_reservasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `verifikasi_penyewa`
--
ALTER TABLE `verifikasi_penyewa`
  MODIFY `id_verifikasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kos`
--
ALTER TABLE `kos`
  ADD CONSTRAINT `kos_ibfk_1` FOREIGN KEY (`id_pemilik`) REFERENCES `pemilik_kos` (`id_pemilik`);

--
-- Constraints for table `moderasi_kos`
--
ALTER TABLE `moderasi_kos`
  ADD CONSTRAINT `moderasi_kos_ibfk_1` FOREIGN KEY (`id_kos`) REFERENCES `kos` (`id_kos`);

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_reservasi`) REFERENCES `reservasi` (`id_reservasi`);

--
-- Constraints for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD CONSTRAINT `reservasi_ibfk_1` FOREIGN KEY (`id_penyewa`) REFERENCES `penyewa` (`id_penyewa`),
  ADD CONSTRAINT `reservasi_ibfk_2` FOREIGN KEY (`id_kos`) REFERENCES `kos` (`id_kos`);

--
-- Constraints for table `verifikasi_penyewa`
--
ALTER TABLE `verifikasi_penyewa`
  ADD CONSTRAINT `verifikasi_penyewa_ibfk_1` FOREIGN KEY (`id_reservasi`) REFERENCES `reservasi` (`id_reservasi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
