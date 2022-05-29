-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Apr 2022 pada 02.55
-- Versi server: 10.4.20-MariaDB
-- Versi PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotelmanagement`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `hotel_id` int(11) DEFAULT NULL,
  `admin_name` varchar(20) NOT NULL,
  `admin_email` varchar(20) NOT NULL,
  `admin_password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`admin_id`, `hotel_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 1, 'lovelyta', 'lovelyta@gmail.com', 'admin'),
(2, 1, 'sasa', 'sasa@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `cust_id` int(11) NOT NULL,
  `cust_name` varchar(20) NOT NULL,
  `cust_email` varchar(30) NOT NULL,
  `cust_phone` int(10) NOT NULL,
  `cust_password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`cust_id`, `cust_name`, `cust_email`, `cust_phone`, `cust_password`) VALUES
(1, 'Ayu Aisyah', 'Ayuuu@gmail.com', 821345678, 'ayu9'),
(4, 'Arya Tegar', 'arya@gmail.com', 812345273, 'arya2'),
(6, 'Tay Tawan', 'tawan@gmail.com', 84869532, 'tayta'),
(7, 'Mark Lee', 'leemark@gmail.com', 81676755, 'melt1'),
(9, 'Jungwoo', 'jungwoo@gmail.com', 847483647, 'jungjung');

-- --------------------------------------------------------

--
-- Struktur dari tabel `facilities`
--

CREATE TABLE `facilities` (
  `facility_id` int(11) NOT NULL,
  `facility` varchar(20) NOT NULL,
  `facility_cost` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `facilities`
--

INSERT INTO `facilities` (`facility_id`, `facility`, `facility_cost`) VALUES
(5, 'WI-FI', 0),
(8, 'Refrigarator', 50000),
(9, 'Breakfast', 75000),
(10, 'Television', 20000),
(19, 'Writting Table', 30000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `hotel`
--

CREATE TABLE `hotel` (
  `hotel_id` int(11) NOT NULL,
  `hotel_name` varchar(45) NOT NULL,
  `hotel_addr` varchar(130) NOT NULL,
  `hotel_email` varchar(30) NOT NULL,
  `hotel_phone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `hotel`
--

INSERT INTO `hotel` (`hotel_id`, `hotel_name`, `hotel_addr`, `hotel_email`, `hotel_phone`) VALUES
(1, 'The Avas ', 'jl. Samadia ', 'theavas@gmail.com', '869745912');

-- --------------------------------------------------------

--
-- Struktur dari tabel `reservation`
--

CREATE TABLE `reservation` (
  `r_id` int(11) NOT NULL,
  `cust_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `booking_date` date NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Trigger `reservation`
--
DELIMITER $$
CREATE TRIGGER `gst` BEFORE INSERT ON `reservation` FOR EACH ROW set new.amount=new.amount+(0.01*new.amount*18)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `room`
--

CREATE TABLE `room` (
  `room_id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `facility_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `hotel_id` int(11) DEFAULT NULL,
  `images` varchar(3000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `room`
--

INSERT INTO `room` (`room_id`, `type_id`, `facility_id`, `status_id`, `hotel_id`, `images`) VALUES
(4, 1, 5, 2, 1, ' https://i.pinimg.com/236x/03/c3/3d/03c33d548b61a544ec8abeb76cfca3e4.jpg'),
(15, 2, 8, 2, 1, 'http://localhost:8000/profile/profile_1609230934360.jpg'),
(22, 2, 10, 2, 1, 'http://localhost:8000/profile/profile_1609312006994.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `room_status`
--

CREATE TABLE `room_status` (
  `status_id` int(11) NOT NULL,
  `availability` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `room_status`
--

INSERT INTO `room_status` (`status_id`, `availability`) VALUES
(2, 'AVAILABLE'),
(3, 'NOTAVAILABLE');

-- --------------------------------------------------------

--
-- Struktur dari tabel `room_type`
--

CREATE TABLE `room_type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(10) NOT NULL,
  `cost` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `room_type`
--

INSERT INTO `room_type` (`type_id`, `type_name`, `cost`) VALUES
(1, 'AC', 300000),
(2, 'NON AC', 200000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `servents`
--

CREATE TABLE `servents` (
  `s_id` int(11) NOT NULL,
  `hotel_id` int(11) DEFAULT NULL,
  `s_name` varchar(20) NOT NULL,
  `s_phone` int(11) NOT NULL,
  `s_adhar` varchar(20) NOT NULL,
  `s_age` int(11) NOT NULL,
  `s_salary` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD KEY `hotel_id` (`hotel_id`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cust_id`);

--
-- Indeks untuk tabel `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`facility_id`);

--
-- Indeks untuk tabel `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`hotel_id`);

--
-- Indeks untuk tabel `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`r_id`),
  ADD KEY `cust_id` (`cust_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indeks untuk tabel `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_id`),
  ADD KEY `hotel_id` (`hotel_id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `facility_id` (`facility_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indeks untuk tabel `room_status`
--
ALTER TABLE `room_status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indeks untuk tabel `room_type`
--
ALTER TABLE `room_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indeks untuk tabel `servents`
--
ALTER TABLE `servents`
  ADD PRIMARY KEY (`s_id`),
  ADD KEY `hotel_id` (`hotel_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `customer`
--
ALTER TABLE `customer`
  MODIFY `cust_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `facilities`
--
ALTER TABLE `facilities`
  MODIFY `facility_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `hotel`
--
ALTER TABLE `hotel`
  MODIFY `hotel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `reservation`
--
ALTER TABLE `reservation`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `room`
--
ALTER TABLE `room`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `room_status`
--
ALTER TABLE `room_status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `room_type`
--
ALTER TABLE `room_type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `servents`
--
ALTER TABLE `servents`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `room_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `room_type` (`type_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `room_ibfk_3` FOREIGN KEY (`facility_id`) REFERENCES `facilities` (`facility_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `room_ibfk_4` FOREIGN KEY (`status_id`) REFERENCES `room_status` (`status_id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `servents`
--
ALTER TABLE `servents`
  ADD CONSTRAINT `servents_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
