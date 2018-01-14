-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 20, 2017 at 03:41 AM
-- Server version: 10.1.9-MariaDB-log
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbkegiatan`
--

-- --------------------------------------------------------

--
-- Table structure for table `jenis_peserta`
--

CREATE TABLE `jenis_peserta` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jenis_peserta`
--

INSERT INTO `jenis_peserta` (`id`, `nama`) VALUES
(1, 'Mahasiswa'),
(2, 'Dosen'),
(3, 'Pelajar'),
(4, 'Umum');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `nama` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama`) VALUES
(1, 'Seminar'),
(2, 'Workshop'),
(3, 'Training'),
(4, 'Conferences'),
(5, 'Kuliah Umum');

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan`
--

CREATE TABLE `kegiatan` (
  `id` int(11) NOT NULL,
  `kode` varchar(10) NOT NULL,
  `judul` text,
  `deskripsi` text,
  `narasumber` varchar(100) DEFAULT NULL,
  `kategori_id` int(11) NOT NULL,
  `biaya` double DEFAULT NULL,
  `kapasitas` int(11) DEFAULT NULL,
  `tgl_mulai` date DEFAULT NULL,
  `tgl_akhir` date DEFAULT NULL,
  `tempat` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kegiatan`
--

INSERT INTO `kegiatan` (`id`, `kode`, `judul`, `deskripsi`, `narasumber`, `kategori_id`, `biaya`, `kapasitas`, `tgl_mulai`, `tgl_akhir`, `tempat`) VALUES
(1, 'SEM201701', 'Seminar Rembulan #1', 'Image Processing', 'Indra Hermawan', 1, 0, 150, '2017-10-06', '2017-10-06', 'Auditorium Kampus B2 STT-NF'),
(2, 'KUL201701', 'Kuliah Umum Semester Ganjil 20171', 'Fintech & Security', 'Dr. Rudi Lumanto', 5, 0, 200, '2017-09-20', '2017-09-20', 'Auditorium Kampus B2 STT-NF'),
(3, 'SEM201702', 'Seminar Rembulan #2', 'Gamefication Wisata Depok', 'Suhendi', 1, 0, 150, '2017-11-28', '2017-11-28', 'Auditorium Kampus B2 STT-NF');

-- --------------------------------------------------------

--
-- Table structure for table `peserta`
--

CREATE TABLE `peserta` (
  `id` int(11) NOT NULL,
  `nomor` varchar(15) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `namalengkap` varchar(45) DEFAULT NULL,
  `hp` varchar(30) DEFAULT NULL,
  `fbaccount` varchar(30) DEFAULT NULL,
  `kegiatan_id` int(11) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `jenis_id` int(11) NOT NULL,
  `tgl_daftar` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `peserta`
--

INSERT INTO `peserta` (`id`, `nomor`, `email`, `namalengkap`, `hp`, `fbaccount`, `kegiatan_id`, `status`, `jenis_id`, `tgl_daftar`) VALUES
(1, 'SEM201701-001', 'alissa@gmail.com', 'alissa khairunnisa', '08123123239', 'alissa01', 1, 'DAFTAR', 1, '2017-10-01'),
(2, 'SEM201701-002', 'faiz01@gmail.com', 'faiz fikri', '0812344232', 'faizok01', 1, 'DAFTAR', 1, '2017-10-01'),
(3, 'SEM201701-003', 'dudi@gmail.com', 'dudi herlino', '08592412232', 'duditop01', 1, 'DAFTAR', 3, '2017-10-02');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_peserta`
-- (See below for the actual view)
--
CREATE TABLE `vw_peserta` (
`kategori` varchar(30)
,`kode` varchar(10)
,`kegiatan` text
,`nopeserta` varchar(15)
,`peserta` varchar(45)
,`hp` varchar(30)
,`email` varchar(45)
,`fbaccount` varchar(30)
,`jenis` varchar(45)
,`tgl_daftar` date
);

-- --------------------------------------------------------

--
-- Structure for view `vw_peserta`
--
DROP TABLE IF EXISTS `vw_peserta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_peserta`  AS  select `a`.`nama` AS `kategori`,`b`.`kode` AS `kode`,`b`.`judul` AS `kegiatan`,`c`.`nomor` AS `nopeserta`,`c`.`namalengkap` AS `peserta`,`c`.`hp` AS `hp`,`c`.`email` AS `email`,`c`.`fbaccount` AS `fbaccount`,`d`.`nama` AS `jenis`,`c`.`tgl_daftar` AS `tgl_daftar` from (((`kategori` `a` join `kegiatan` `b` on((`a`.`id` = `b`.`kategori_id`))) join `peserta` `c` on((`b`.`id` = `c`.`kegiatan_id`))) join `jenis_peserta` `d` on((`d`.`id` = `c`.`jenis_id`))) order by `c`.`nomor` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jenis_peserta`
--
ALTER TABLE `jenis_peserta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_UNIQUE` (`kode`),
  ADD KEY `fk_kegiatan_kategori_idx` (`kategori_id`);

--
-- Indexes for table `peserta`
--
ALTER TABLE `peserta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nomor` (`nomor`),
  ADD KEY `fk_peserta_kegiatan1_idx` (`kegiatan_id`),
  ADD KEY `fk_peserta_jenis_peserta1_idx` (`jenis_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jenis_peserta`
--
ALTER TABLE `jenis_peserta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `kegiatan`
--
ALTER TABLE `kegiatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `peserta`
--
ALTER TABLE `peserta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD CONSTRAINT `fk_kegiatan_kategori` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `peserta`
--
ALTER TABLE `peserta`
  ADD CONSTRAINT `fk_peserta_jenis_peserta1` FOREIGN KEY (`jenis_id`) REFERENCES `jenis_peserta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_peserta_kegiatan1` FOREIGN KEY (`kegiatan_id`) REFERENCES `kegiatan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
