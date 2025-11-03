-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 03, 2025 at 05:24 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `itech_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `laptop`
--

CREATE TABLE `laptop` (
  `id_laptop` int NOT NULL,
  `nama_produk` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `kebutuhan_pengguna` enum('Office','Desain / Editing','Gaming','Kuliah / Sekolah') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `prosessor` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ram` enum('8 GB','16 GB','32 GB','64 GB') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `penyimpanan` enum('256 GB','512 GB','1 T','> 1 T') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vga` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `panel_layar` enum('TN','VA','IPS','OLED') COLLATE utf8mb4_general_ci NOT NULL,
  `ukuran_layar` float DEFAULT NULL,
  `resolusi_layar` enum('HD (720p)','FHD (1080p)','QHD (2k)','WQXD','WQXGA (2.5k)','UHD (4k)') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `berat` float DEFAULT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `link_resmi` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laptop`
--

INSERT INTO `laptop` (`id_laptop`, `nama_produk`, `harga`, `kebutuhan_pengguna`, `prosessor`, `ram`, `penyimpanan`, `vga`, `panel_layar`, `ukuran_layar`, `resolusi_layar`, `berat`, `gambar`, `link_resmi`) VALUES
(145, 'Axioo Mybook Hype 3 i3', '4549000.00', 'Office', 'Intel Core i3-1005G1', '8 GB', '256 GB', 'Intel UHD Graphics', 'IPS', 14, 'FHD (1080p)', 1.4, 'Axioo Mybook Hype 3 i3.png', 'https://axiooworld.com/hype-3'),
(146, 'HP Chromebook 11 G8 EE', '3299000.00', 'Office', 'Intel Celeron N4020', '8 GB', '256 GB', 'Intel UHD Graphics', 'TN', 11.6, 'HD (720p)', 1.3, 'HP Chromebook 11 G8 EE.png', 'https://www.hp.com/id/'),
(147, 'Advan Soulmate', '3400000.00', 'Office', 'Intel Celeron N4020', '8 GB', '256 GB', 'Intel UHD Graphics', 'IPS', 14.1, 'FHD (1080p)', 1.4, 'Advan Soulmate.png', 'https://advandigital.id/'),
(148, 'Lenovo IdeaPad Slim 3 i3', '6399000.00', 'Office', 'Intel Core i3-1215U', '8 GB', '256 GB', 'Intel Iris Xe', 'IPS', 14, 'FHD (1080p)', 1.4, 'Lenovo IdeaPad Slim 3 i3.png', 'https://www.lenovo.com/id/'),
(149, 'Acer Aspire 5 Slim i5', '8999000.00', 'Office', 'Intel Core i5-1335U', '8 GB', '512 GB', 'Intel Iris Xe', 'IPS', 14, 'FHD (1080p)', 1.7, 'Acer Aspire 5 Slim i5.png', 'https://www.acer.com/id-id/'),
(150, 'MSI Modern 14 i5', '8369000.00', 'Office', 'Intel Core i5-1155G7', '16 GB', '512 GB', 'Intel Iris Xe', 'IPS', 14, 'FHD (1080p)', 1.3, 'MSI Modern 14 i5.png', 'https://id.msi.com/'),
(151, 'Acer Swift Go 14 i5', '12500000.00', 'Office', 'Intel Core i5-1335U', '16 GB', '512 GB', 'Intel Iris Xe', 'IPS', 14, 'FHD (1080p)', 1.25, 'Acer Swift Go 14 i5.png', 'https://www.acer.com/id-id/'),
(152, 'ASUS Vivobook 15X OLED R7', '10500000.00', 'Office', 'AMD Ryzen 7 5800H', '16 GB', '512 GB', 'AMD Radeon', 'OLED', 15.6, 'QHD (2k)', 1.7, 'ASUS Vivobook 15X OLED R7.png', 'https://www.asus.com/id/'),
(153, 'HP Pavilion 14 Aero R5', '10999000.00', 'Office', 'AMD Ryzen 5 5600U', '16 GB', '512 GB', 'AMD Radeon', 'IPS', 13.3, 'FHD (1080p)', 1, 'HP Pavilion 14 Aero R5.png', 'https://www.hp.com/id/'),
(154, 'MacBook Air M1 (2020)', '17500000.00', 'Office', 'Apple M1', '8 GB', '256 GB', 'Integrated Apple GPU', 'IPS', 13.3, 'QHD (2k)', 1.29, 'MacBook Air M1 (2020).png', 'https://www.apple.com/id/'),
(155, 'ASUS Zenbook S13 OLED', '20500000.00', 'Office', 'Intel Core i7-1355U', '16 GB', '512 GB', 'Intel Iris Xe', 'OLED', 13.3, 'QHD (2k)', 1, 'ASUS Zenbook S13 OLED.png', 'https://www.asus.com/id/'),
(156, 'Apple MacBook Pro M4 14\"', '28999000.00', 'Office', 'Apple M4', '16 GB', '512 GB', 'Integrated Apple GPU', 'OLED', 14, 'WQXD', 1.6, 'Apple MacBook Pro M4 14\".png', 'https://www.apple.com/id/'),
(157, 'Axioo Mybook Hype 3 i3 (Basic)', '4549000.00', 'Desain / Editing', 'Intel Core i3-1005G1', '8 GB', '256 GB', 'Intel UHD Graphics', 'IPS', 14, 'FHD (1080p)', 1.4, 'Axioo Mybook Hype 3 i3 (Basic).png', 'https://axiooworld.com/hype-3'),
(158, 'HP 14s-fq1135AU R5', '7499000.00', 'Desain / Editing', 'AMD Ryzen 5-5500U', '8 GB', '512 GB', 'AMD Radeon', 'IPS', 14, 'FHD (1080p)', 1.47, 'HP 14s-fq1135AU R5.png', 'https://www.hp.com/id/'),
(159, 'Xiaomi RedmiBook 15 i3', '6500000.00', 'Desain / Editing', 'Intel Core i3-1115G4', '8 GB', '256 GB', 'Intel UHD Graphics', 'IPS', 15.6, 'FHD (1080p)', 1.8, 'Xiaomi RedmiBook 15 i3.png', 'https://www.mi.co.id/'),
(160, 'Acer Swift 3 i5', '9500000.00', 'Desain / Editing', 'Intel Core i5-1135G7', '8 GB', '512 GB', 'Intel Iris Xe', 'IPS', 14, 'FHD (1080p)', 1.2, 'Acer Swift 3 i5.png', 'https://www.acer.com/id-id/'),
(161, 'HP Pavilion 14 i5 (DG)', '9999000.00', 'Desain / Editing', 'Intel Core i5-1035G1', '8 GB', '512 GB', 'NVIDIA MX250', 'IPS', 14, 'FHD (1080p)', 1.6, 'HP Pavilion 14 i5 (DG).png', 'https://www.hp.com/id/'),
(162, 'Lenovo IdeaPad Flex 5 R5', '9800000.00', 'Desain / Editing', 'AMD Ryzen 5 5500U', '8 GB', '512 GB', 'AMD Radeon', 'IPS', 14, 'FHD (1080p)', 1.5, 'Lenovo IdeaPad Flex 5 R5.png', 'https://www.lenovo.com/id/'),
(163, 'Acer Nitro V 15 i5 RTX 4050', '14999000.00', 'Desain / Editing', 'Intel Core i5-13420H', '16 GB', '512 GB', 'NVIDIA RTX 4050', 'IPS', 15.6, 'FHD (1080p)', 2.1, 'Acer Nitro V 15 i5 RTX 4050.png', 'https://www.acer.com/id-id/'),
(164, 'Lenovo LOQ 15 i5 RTX 4050', '15400000.00', 'Desain / Editing', 'Intel Core i5-13420H', '16 GB', '512 GB', 'NVIDIA RTX 4050', 'IPS', 15.6, 'FHD (1080p)', 2.4, 'Lenovo LOQ 15 i5 RTX 4050.png', 'https://www.lenovo.com/id/'),
(165, 'ASUS Vivobook Pro 14 OLED', '16000000.00', 'Desain / Editing', 'AMD Ryzen 7 5800H', '16 GB', '512 GB', 'NVIDIA RTX 3050', 'OLED', 14, 'QHD (2k)', 1.4, 'ASUS Vivobook Pro 14 OLED.png', 'https://www.asus.com/id/'),
(166, 'MacBook Pro 14 Inch M3 Max', '35000000.00', 'Desain / Editing', 'Apple M3 Max', '32 GB', '> 1 T', 'Integrated Apple GPU', 'OLED', 14, 'WQXD', 1.6, 'MacBook Pro 14 Inch M3 Max.png', 'https://www.apple.com/id/'),
(167, 'ASUS ProArt Studiobook 16', '32000000.00', 'Desain / Editing', 'Intel Core i9-13980HX', '32 GB', '> 1 T', 'NVIDIA RTX 4070', 'OLED', 16, 'WQXD', 2.4, 'ASUS ProArt Studiobook 16.png', 'https://www.asus.com/id/'),
(168, 'HP Envy X360 14 OLED', '21500000.00', 'Desain / Editing', 'Intel Core i7-1355U', '16 GB', '512 GB', 'Intel Iris Xe', 'OLED', 14, 'QHD (2k)', 1.3, 'HP Envy X360 14 OLED.png', 'https://www.hp.com/id/'),
(169, 'Lenovo V14 G2 R3', '4999000.00', 'Gaming', 'AMD Ryzen 3 5300U', '8 GB', '256 GB', 'AMD Radeon', 'IPS', 14, 'FHD (1080p)', 1.6, 'Lenovo V14 G2 R3.png', 'https://www.lenovo.com/id/'),
(170, 'HP 245 G10 R3', '4899000.00', 'Gaming', 'AMD Ryzen 3 5300U', '8 GB', '256 GB', 'AMD Radeon', 'IPS', 14, 'FHD (1080p)', 1.4, 'HP 245 G10 R3.png', 'https://www.hp.com/id/'),
(171, 'ASUS VivoBook 14 A1400 i3', '5929000.00', 'Gaming', 'Intel Core i3-1005G1', '8 GB', '256 GB', 'Intel UHD Graphics', 'IPS', 14, 'FHD (1080p)', 1.5, 'ASUS VivoBook 14 A1400 i3.png', 'https://www.asus.com/id/'),
(172, 'MSI Thin GF63 i5 (RTX 3050)', '9999000.00', 'Gaming', 'Intel Core i5-11400H', '16 GB', '512 GB', 'NVIDIA RTX 3050', 'IPS', 15.6, 'FHD (1080p)', 1.86, 'MSI Thin GF63 i5 (RTX 3050).png', 'https://id.msi.com/'),
(173, 'Advan Pixelwar R5', '10999000.00', 'Gaming', 'AMD Ryzen 5 6600H', '16 GB', '512 GB', 'AMD RX 6500M', 'IPS', 16, 'QHD (2k)', 2, 'Advan Pixelwar R5.png', 'https://advandigital.id/'),
(174, 'Acer Nitro V 15 i5 (RTX 2050)', '10999000.00', 'Gaming', 'Intel Core i5-13420H', '16 GB', '512 GB', 'NVIDIA RTX 2050', 'IPS', 15.6, 'FHD (1080p)', 2.1, 'Acer Nitro V 15 i5 (RTX 2050).png', 'https://www.acer.com/id-id/'),
(175, 'Lenovo LOQ 15 i5 RTX 4050', '15400000.00', 'Gaming', 'Intel Core i5-13450HX', '16 GB', '512 GB', 'NVIDIA RTX 4050', 'IPS', 15.6, 'FHD (1080p)', 2.4, 'Lenovo LOQ 15 i5 RTX 4050.png', 'https://www.lenovo.com/id/'),
(176, 'HP Victus 15 R7 RTX 4060', '17000000.00', 'Gaming', 'AMD Ryzen 7 7840HS', '16 GB', '512 GB', 'NVIDIA RTX 4060', 'IPS', 15.6, 'FHD (1080p)', 2.3, 'HP Victus 15 R7 RTX 4060.png', 'https://www.hp.com/id/'),
(177, 'ASUS TUF Gaming A15 R9 RTX 4070', '19999000.00', 'Gaming', 'AMD Ryzen 9 7940HS', '16 GB', '> 1 T', 'NVIDIA RTX 4070', 'IPS', 15.6, 'QHD (2k)', 2.2, 'ASUS TUF Gaming A15 R9 RTX 4070.png', 'https://www.asus.com/id/'),
(178, 'ASUS ROG Zephyrus G14 (2024)', '28000000.00', 'Gaming', 'AMD Ryzen 9 8945HS', '32 GB', '> 1 T', 'NVIDIA RTX 4070', 'OLED', 14, 'WQXD', 1.5, 'ASUS ROG Zephyrus G14 (2024).png', 'https://www.asus.com/id/'),
(179, 'MSI Titan 18 HX', '45000000.00', 'Gaming', 'Intel Core i9-14900HX', '64 GB', '> 1 T', 'NVIDIA RTX 4090', 'OLED', 18, 'UHD (4k)', 3.6, 'MSI Titan 18 HX.png', 'https://id.msi.com/'),
(180, 'Acer Predator Helios Neo 16', '24999000.00', 'Gaming', 'Intel Core i9-13900HX', '32 GB', '> 1 T', 'NVIDIA RTX 4070', 'IPS', 16, 'QHD (2k)', 2.6, 'Acer Predator Helios Neo 16.png', 'https://www.acer.com/id-id/'),
(181, 'Samsung Chromebook 4', '2499900.00', 'Kuliah / Sekolah', 'Intel Celeron N4000', '8 GB', '256 GB', 'Intel UHD Graphics', 'TN', 11.6, 'HD (720p)', 1.1, 'Samsung Chromebook 4.png', 'https://www.samsung.com/id/'),
(186, 'ASUS Vivobook 14 A1404 i3', '6999000.00', 'Kuliah / Sekolah', 'Intel Core i3-1215U', '8 GB', '256 GB', 'Intel Iris Xe', 'IPS', 14, 'FHD (1080p)', 1.5, 'ASUS Vivobook 14 A1404 i3.png', 'https://www.asus.com/id/'),
(187, 'Dell Inspiron 14 5410 i5', '11500000.00', 'Kuliah / Sekolah', 'Intel Core i5-1335U', '16 GB', '512 GB', 'Intel Iris Xe', 'IPS', 14, 'FHD (1080p)', 1.6, 'Dell Inspiron 14 5410 i5.png', 'https://www.dell.com/id/'),
(188, 'Lenovo ThinkBook 14 i7', '14499000.00', 'Kuliah / Sekolah', 'Intel Core i7-1255U', '16 GB', '512 GB', 'Intel Iris Xe', 'IPS', 14, 'FHD (1080p)', 1.4, 'Lenovo ThinkBook 14 i7.png', 'https://www.lenovo.com/id/'),
(190, 'Apple MacBook Air M2 15\"', '22500000.00', 'Kuliah / Sekolah', 'Apple M2', '16 GB', '512 GB', 'Integrated Apple GPU', 'IPS', 15.3, 'WQXD', 1.5, 'Apple MacBook Air M2 15\".png', 'https://www.apple.com/id/'),
(192, 'Microsoft Surface Laptop 5', '24000000.00', 'Kuliah / Sekolah', 'Intel Core i7-1255U', '16 GB', '512 GB', 'Intel Iris Xe', 'IPS', 13.5, 'QHD (2k)', 1.2, 'Microsoft Surface Laptop 5.png', 'https://www.microsoft.com/id-id/surface');

-- --------------------------------------------------------

--
-- Table structure for table `motherboard`
--

CREATE TABLE `motherboard` (
  `id_motherboard` int NOT NULL,
  `nama_produk` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `socket` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `chipset` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tipe_ram_didukung` enum('DDR 4','DDR 5') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `form_factor` enum('ATX','mATX','mIATX') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `harga` decimal(10,2) NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `link_resmi` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `motherboard`
--

INSERT INTO `motherboard` (`id_motherboard`, `nama_produk`, `socket`, `chipset`, `tipe_ram_didukung`, `form_factor`, `harga`, `gambar`, `link_resmi`) VALUES
(27, 'MSI PRO H610M-E DDR4', 'LGA 1700', 'H610', 'DDR 4', 'mATX', '1200000.00', 'MSI PRO H610M-E DDR4.png', 'https://www.msi.com/Motherboard/PRO-H610M-E'),
(28, 'Gigabyte H610M H V2 DDR4', 'LGA 1700', 'H610', 'DDR 4', 'mATX', '1100000.00', 'Gigabyte H610M H V2 DDR4.png', 'https://www.gigabyte.com/Motherboard/H610M-H-V2'),
(29, 'ASUS PRIME H610M-A WIFI D4', 'LGA 1700', 'H610', 'DDR 4', 'mATX', '1450000.00', 'ASUS PRIME H610M-A WIFI D4.png', 'https://www.asus.com/id/motherboards/intel/prime/prime-h610m-a-wifi-d4/'),
(30, 'ASRock H610M-HDV/M.2 R2.0', 'LGA 1700', 'H610', 'DDR 4', 'mATX', '1050000.00', 'ASRock H610M-HDV/M.2 R2.0.png', 'https://www.asrock.com/mb/Intel/H610M-HDV'),
(31, 'Gigabyte A520M K V2', 'AM4', 'A520', 'DDR 4', 'mATX', '1250000.00', 'Gigabyte A520M K V2.png', 'https://www.gigabyte.com/Motherboard/A520M-K-V2'),
(32, 'ASRock B550M-HDV', 'AM4', 'B550', 'DDR 4', 'mATX', '1350000.00', 'ASRock B550M-HDV.png', 'https://www.asrock.com/mb/amd/B550M-HDV/'),
(33, 'ASRock A620M-HDV/M.2+', 'AM5', 'A620', 'DDR 5', 'mATX', '1850000.00', 'ASRock A620M-HDV/M.2+.png', 'https://www.asrock.com/mb/AMD/A620M-HDV-M.2+'),
(34, 'Biostar B650T-Silver', 'AM5', 'B650', 'DDR 5', 'mIATX', '1900000.00', 'Biostar B650T-Silver.png', 'https://www.biostar.com.tw/app/en/mb/introduction.php?S_ID=1200'),
(35, 'Gigabyte B760M DS3H DDR4', 'LGA 1700', 'B760', 'DDR 4', 'mATX', '2050000.00', 'Gigabyte B760M DS3H DDR4.png', 'https://www.gigabyte.com/Motherboard/B760M-DS3H-DDR4'),
(36, 'ASUS PRIME B760-PLUS WIFI', 'LGA 1700', 'B760', 'DDR 5', 'ATX', '2900000.00', 'ASUS PRIME B760-PLUS WIFI.png', 'https://www.asus.com/id/motherboards/intel/prime/prime-b760-plus-wifi/'),
(37, 'MSI PRO B650-P WIFI', 'AM5', 'B650', 'DDR 5', 'ATX', '3200000.00', 'MSI PRO B650-P WIFI.png', 'https://www.msi.com/Motherboard/PRO-B650-P-WIFI'),
(38, 'ASRock Z790 Lightning WiFi', 'LGA 1700', 'Z790', 'DDR 5', 'ATX', '3750000.00', 'ASRock Z790 Lightning WiFi.png', 'https://www.asrock.com/mb/Intel/Z790%20Lightning%20WiFi/'),
(39, 'ASUS TUF GAMING B550-PLUS WIFI II', 'AM4', 'B550', 'DDR 4', 'ATX', '2450000.00', 'ASUS TUF GAMING B550-PLUS WIFI II.png', 'https://www.asus.com/id/motherboards/amd/tuf-gaming/tuf-gaming-b550-plus-wifi-ii/'),
(40, 'Gigabyte B760 GAMING X AX', 'LGA 1700', 'B760', 'DDR 5', 'ATX', '3300000.00', 'Gigabyte B760 GAMING X AX.png', 'https://www.gigabyte.com/Motherboard/B760-GAMING-X-AX'),
(41, 'ASUS ROG STRIX B760-F GAMING WIFI', 'LGA 1700', 'B760', 'DDR 5', 'ATX', '4500000.00', 'ASUS ROG STRIX B760-F GAMING WIFI.png', 'https://rog.asus.com/motherboards/intel/rog-strix/rog-strix-b760-f-gaming-wifi/'),
(42, 'MSI MAG B760M MORTAR WIFI', 'LGA 1700', 'B760', 'DDR 5', 'mATX', '3800000.00', 'MSI MAG B760M MORTAR WIFI.png', 'https://www.msi.com/Motherboard/MAG-B760M-MORTAR-WIFI'),
(43, 'ASRock B650M PG Lightning WiFi', 'AM5', 'B650', 'DDR 5', 'mATX', '2900000.00', 'ASRock B650M PG Lightning WiFi.png', 'https://www.asrock.com/mb/AMD/B650M%20PG%20Lightning%20WiFi/'),
(44, 'Gigabyte B650 AORUS ELITE AX', 'AM5', 'B650', 'DDR 5', 'ATX', '3850000.00', 'Gigabyte B650 AORUS ELITE AX.png', 'https://www.gigabyte.com/Motherboard/B650-AORUS-ELITE-AX'),
(45, 'ASUS PRIME Z790-P WIFI', 'LGA 1700', 'Z790', 'DDR 5', 'ATX', '4900000.00', 'ASUS PRIME Z790-P WIFI.png', 'https://www.asus.com/id/motherboards/intel/prime/prime-z790-p-wifi/'),
(46, 'MSI PRO Z790-P WIFI', 'LGA 1700', 'Z790', 'DDR 5', 'ATX', '4750000.00', 'MSI PRO Z790-P WIFI.png', 'https://www.msi.com/Motherboard/PRO-Z790-P-WIFI'),
(47, 'ASRock B650I Lightning WiFi', 'AM5', 'B650', 'DDR 5', 'mIATX', '4200000.00', 'ASRock B650I Lightning WiFi.png', 'https://www.asrock.com/mb/AMD/B650I%20Lightning%20WiFi'),
(48, 'ASUS ROG STRIX Z790-A GAMING WIFI', 'LGA 1700', 'Z790', 'DDR 5', 'ATX', '7200000.00', 'ASUS ROG STRIX Z790-A GAMING WIFI.png', 'https://rog.asus.com/motherboards/intel/rog-strix/rog-strix-z790-a-gaming-wifi/'),
(49, 'MSI MEG Z790 ACE', 'LGA 1700', 'Z790', 'DDR 5', 'ATX', '9800000.00', 'MSI MEG Z790 ACE.png', 'https://www.msi.com/Motherboard/MEG-Z790-ACE'),
(50, 'Gigabyte Z790 AORUS MASTER', 'LGA 1700', 'Z790', 'DDR 5', 'ATX', '8500000.00', 'Gigabyte Z790 AORUS MASTER.png', 'https://www.gigabyte.com/Motherboard/Z790-AORUS-MASTER-rev-10'),
(51, 'ASUS ROG STRIX X670E-F GAMING WIFI', 'AM5', 'X670E', 'DDR 5', 'ATX', '8800000.00', 'ASUS ROG STRIX X670E-F GAMING WIFI.png', 'https://rog.asus.com/motherboards/amd/rog-strix/rog-strix-x670e-f-gaming-wifi/'),
(52, 'MSI MPG X670E CARBON WIFI', 'AM5', 'X670E', 'DDR 5', 'ATX', '9500000.00', '', 'https://www.msi.com/Motherboard/MPG-X670E-CARBON-WIFI'),
(53, 'ASRock Z790 Taichi Carrara', 'LGA 1700', 'Z790', 'DDR 5', 'ATX', '10800000.00', '', 'https://www.asrock.com/mb/Intel/Z790%20Taichi%20Carrara/'),
(54, 'ASUS ROG MAXIMUS Z790 EXTREME', 'LGA 1700', 'Z790', 'DDR 5', 'ATX', '12500000.00', '', 'https://rog.asus.com/motherboards/intel/rog-maximus/rog-maximus-z790-extreme/'),
(55, 'Gigabyte Z790 AORUS XTREME', 'LGA 1700', 'Z790', 'DDR 5', 'ATX', '14000000.00', '', 'https://www.gigabyte.com/Motherboard/Z790-AORUS-XTREME-rev-10'),
(56, 'ASUS ROG CROSSHAIR X670E EXTREME', 'AM5', 'X670E', 'DDR 5', 'ATX', '13500000.00', '', 'https://rog.asus.com/motherboards/amd/rog-crosshair/rog-crosshair-x670e-extreme/'),
(57, 'MSI MEG Z790 GODLIKE', 'LGA 1700', 'Z790', 'DDR 5', 'ATX', '15500000.00', '', 'https://www.msi.com/Motherboard/MEG-Z790-GODLIKE'),
(58, 'ASUS ProArt Z790-CREATOR WIFI (Premium)', 'LGA 1700', 'Z790', 'DDR 5', 'ATX', '16000000.00', '', 'https://www.asus.com/id/motherboards-components/motherboards/proart/proart-z790-creator-wifi/'),
(59, 'Gigabyte X670E AORUS XTREME', 'AM5', 'X670E', 'DDR 5', 'ATX', '17000000.00', '', 'https://www.gigabyte.com/Motherboard/X670E-AORUS-XTREME-rev-10'),
(60, 'MSI MEG Z790 GODLIKE MAX', 'LGA 1700', 'Z790', 'DDR 5', 'ATX', '18500000.00', '', 'https://www.msi.com/Motherboard/MEG-Z790-GODLIKE-MAX'),
(61, 'ASUS ROG RAMPAGE VI EXTREME OMEGA (HEDT)', 'LGA 2066', 'X299', 'DDR 4', 'ATX', '20000000.00', '', 'https://rog.asus.com/us/motherboards/intel/rog-rampage/rog-rampage-vi-extreme-omega/'),
(62, 'ASUS ROG MAXIMUS Z790 APEX (EK)', 'LGA 1700', 'Z790', 'DDR 5', 'ATX', '21000000.00', '', 'https://rog.asus.com/motherboards/intel/rog-maximus/rog-maximus-z790-apex-encore/'),
(63, 'Gigabyte X670E AORUS XTREME (Limited)', 'AM5', 'X670E', 'DDR 5', 'ATX', '22500000.00', '', 'https://www.gigabyte.com/Motherboard/X670E-AORUS-XTREME-rev-10'),
(64, 'MSI MEG X670E GODLIKE (EK)', 'AM5', 'X670E', 'DDR 5', 'ATX', '25000000.00', '', 'https://www.msi.com/Motherboard/MEG-X670E-GODLIKE'),
(65, 'ASUS ROG MAXIMUS Z790 EXTREME GLACIAL', 'LGA 1700', 'Z790', 'DDR 5', 'ATX', '30000000.00', '', 'https://rog.asus.com/motherboards/intel/rog-maximus/rog-maximus-z790-extreme-glacial/'),
(66, 'ASUS ROG Dominus Extreme (HEDT)', 'LGA 3647', 'C621', 'DDR 4', 'ATX', '45000000.00', '', 'https://rog.asus.com/us/motherboards/intel/rog-dominus-extreme-model/');

-- --------------------------------------------------------

--
-- Table structure for table `penyimpanan`
--

CREATE TABLE `penyimpanan` (
  `id_penyimpanan` int NOT NULL,
  `nama_produk` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `tipe` enum('HDD','SSD SATA','SSD NVMe','SSD M.2 SATA','SSD PCIe Gen4','SSD PCIe Gen5') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kapasitas` enum('256 GB','512 GB','1 T','2 T') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kecepatan_baca` int DEFAULT NULL,
  `harga` decimal(10,2) NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `link_resmi` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penyimpanan`
--

INSERT INTO `penyimpanan` (`id_penyimpanan`, `nama_produk`, `tipe`, `kapasitas`, `kecepatan_baca`, `harga`, `gambar`, `link_resmi`) VALUES
(31, 'Seagate Barracuda 1TB 3.5\"', 'HDD', '1 T', 180, '500000.00', 'Seagate Barracuda 1TB 3.5\".png', 'https://www.seagate.com/barracuda'),
(32, 'WD Blue 1TB 3.5\"', 'HDD', '1 T', 150, '480000.00', 'WD Blue 1TB 3.5\".png', 'https://www.westerndigital.com/wd-blue'),
(33, 'Seagate SkyHawk 2TB', 'HDD', '2 T', 180, '725000.00', 'Seagate SkyHawk 2TB.png', 'https://www.seagate.com/skyhawk'),
(34, 'WD Purple 2TB', 'HDD', '2 T', 180, '1249000.00', 'WD Purple 2TB.png', 'https://www.westerndigital.com/wd-purple'),
(35, 'Seagate Barracuda 2TB 3.5\"', 'HDD', '2 T', 200, '950000.00', 'Seagate Barracuda 2TB 3.5\".png', 'https://www.seagate.com/barracuda'),
(36, 'V-GEN Platinum SATA 3', 'SSD SATA', '256 GB', 550, '289000.00', 'V-GEN Platinum SATA 3.png', 'https://www.v-gen.co.id/ssd-sata'),
(37, 'Lexar NS100 2.5\"', 'SSD SATA', '256 GB', 550, '310000.00', 'Lexar NS100 2.5\".png', 'https://www.lexar.com/ns100'),
(38, 'ADATA SU650 SATA 3', 'SSD SATA', '512 GB', 520, '480000.00', 'ADATA SU650 SATA 3.png', 'https://www.adata.com/su650'),
(39, 'Samsung 870 EVO SATA 3', 'SSD SATA', '512 GB', 560, '780000.00', 'Samsung 870 EVO SATA 3.png', 'https://www.samsung.com/870-evo'),
(40, 'SSD ZADAK TWSS3 2.5\"', 'SSD SATA', '1 T', 560, '1050000.00', 'SSD ZADAK TWSS3 2.5\".png', 'https://www.zadak.com/twss3'),
(41, 'Kingston A400 SATA 3', 'SSD SATA', '2 T', 500, '1750000.00', 'Kingston A400 SATA 3.png', 'https://www.kingston.com/a400'),
(42, 'Kingston NV1 Gen3', 'SSD NVMe', '256 GB', 2100, '395000.00', 'Kingston NV1 Gen3.png', 'https://www.kingston.com/nv1'),
(43, 'AGI AI298 Gen3', 'SSD NVMe', '512 GB', 2500, '580000.00', 'AGI AI298 Gen3.png', 'https://www.agi-ai298'),
(44, 'Team MP33 Gen3', 'SSD NVMe', '1 T', 3500, '894000.00', 'Team MP33 Gen3.png', 'https://www.teamgroupinc.com/mp33'),
(45, 'Seagate Barracuda Q5 Gen3', 'SSD NVMe', '1 T', 2400, '1050000.00', 'Seagate Barracuda Q5 Gen3.png', 'https://www.seagate.com/q5'),
(46, 'ADATA XPG SX6000 Pro Gen3', 'SSD NVMe', '2 T', 3300, '1950000.00', 'ADATA XPG SX6000 Pro Gen3.png', 'https://www.adata.com/sx6000-pro'),
(47, 'Kingston NV2 Gen4', 'SSD PCIe Gen4', '512 GB', 3500, '599000.00', 'Kingston NV2 Gen4.png', 'https://www.kingston.com/nv2'),
(48, 'WD Black SN770 Gen4', 'SSD PCIe Gen4', '1 T', 5150, '1250000.00', 'WD Black SN770 Gen4.png', 'https://www.westerndigital.com/sn770'),
(49, 'Lexar NM790 Gen4', 'SSD PCIe Gen4', '1 T', 7400, '1400000.00', 'Lexar NM790 Gen4.png', 'https://www.lexar.com/nm790'),
(50, 'Samsung 990 PRO Gen4', 'SSD PCIe Gen4', '1 T', 7450, '1845000.00', 'Samsung 990 PRO Gen4.png', 'https://www.samsung.com/ssd-990-pro'),
(51, 'Crucial P5 Plus Gen4', 'SSD PCIe Gen4', '2 T', 6600, '2580000.00', 'Crucial P5 Plus Gen4.png', 'https://www.crucial.com/p5-plus'),
(52, 'WD Black SN850X Gen4', 'SSD PCIe Gen4', '2 T', 7300, '3250000.00', 'WD Black SN850X Gen4.png', 'https://www.westerndigital.com/sn850x'),
(53, 'ADATA XPG Gammix S70 Blade Gen4', 'SSD PCIe Gen4', '2 T', 7400, '2411000.00', 'ADATA XPG Gammix S70 Blade Gen4.png', 'https://www.adata.com/xpg-s70-blade'),
(54, 'PNY CS2241 Gen4', 'SSD PCIe Gen4', '1 T', 5000, '765000.00', 'PNY CS2241 Gen4.png', 'https://www.pny.com/cs2241'),
(55, 'MSI SPATIUM M560 Gen 5', 'SSD PCIe Gen5', '1 T', 10300, '1886000.00', 'MSI SPATIUM M560 Gen 5.png', 'https://www.msi.com/spatium-m560'),
(56, 'Crucial T700 Gen 5', 'SSD PCIe Gen5', '1 T', 12400, '3090000.00', '', 'https://www.crucial.com/t700'),
(57, 'Corsair MP700 Elite Gen 5', 'SSD PCIe Gen5', '1 T', 10000, '2589000.00', '', 'https://www.corsair.com/mp700-elite'),
(58, 'WD BLACK SN8100 Gen 5', 'SSD PCIe Gen5', '2 T', 14000, '5220000.00', '', 'https://www.westerndigital.com/sn8100'),
(59, 'Kingston Fury Renegade G5', 'SSD PCIe Gen5', '2 T', 12000, '5630000.00', '', 'https://www.kingston.com/renegade-g5'),
(60, 'ADATA XPG Mars 980 Gen 5', 'SSD PCIe Gen5', '2 T', 14000, '4185000.00', '', 'https://www.adata.com/mars-980');

-- --------------------------------------------------------

--
-- Table structure for table `processor`
--

CREATE TABLE `processor` (
  `id_processor` int NOT NULL,
  `nama_produk` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `socket` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `jumlah_core` enum('2 Core','4 Core','6 Core','8 Core','10 Core','12 Core','14 Core','16 Core','18 Core','20 Core','22 Core','24 Core') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kecepatan_dasar` float DEFAULT NULL,
  `tdp` int DEFAULT NULL,
  `harga` decimal(10,2) NOT NULL,
  `link_resmi` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `processor`
--

INSERT INTO `processor` (`id_processor`, `nama_produk`, `socket`, `jumlah_core`, `kecepatan_dasar`, `tdp`, `harga`, `link_resmi`) VALUES
(65, 'Intel Pentium Gold G7400', 'LGA 1700', '2 Core', 3.7, 46, '1200000.00', 'https://www.intel.com/products/g7400'),
(66, 'AMD Athlon 3000G', 'AM4', '2 Core', 3.5, 35, '760000.00', 'https://www.amd.com/athlon-3000g'),
(67, 'Intel Core i3-14100F', 'LGA 1700', '4 Core', 3.5, 58, '1545000.00', 'https://www.intel.com/products/i3-14100f'),
(68, 'AMD Ryzen 5 4500', 'AM4', '6 Core', 3.6, 65, '1130000.00', 'https://www.amd.com/ryzen-5-4500'),
(69, 'AMD Ryzen 5 5500', 'AM4', '6 Core', 3.6, 65, '1210000.00', 'https://www.amd.com/ryzen-5-5500'),
(70, 'AMD Ryzen 5 5600', 'AM4', '6 Core', 3.5, 65, '1650000.00', 'https://www.amd.com/ryzen-5-5600'),
(71, 'Intel Core i5-14400F', 'LGA 1700', '10 Core', 2.5, 65, '2923000.00', 'https://www.intel.com/products/i5-14400f'),
(72, 'Intel Core i5-14500', 'LGA 1700', '14 Core', 2.6, 65, '4690000.00', 'https://www.intel.com/products/i5-14500'),
(73, 'Intel Core i5-14600K', 'LGA 1700', '14 Core', 3.5, 125, '4083155.00', 'https://www.intel.com/products/i5-14600k'),
(74, 'AMD Ryzen 5 7500F', 'AM5', '6 Core', 3.7, 65, '2399000.00', 'https://www.amd.com/ryzen-5-7500f'),
(75, 'AMD Ryzen 5 7600', 'AM5', '6 Core', 3.8, 65, '3529000.00', 'https://www.amd.com/ryzen-5-7600'),
(76, 'AMD Ryzen 5 7600X', 'AM5', '6 Core', 4.7, 105, '3959000.00', 'https://www.amd.com/ryzen-5-7600x'),
(77, 'AMD Ryzen 7 5700X', 'AM4', '8 Core', 3.4, 65, '3180000.00', 'https://www.amd.com/ryzen-7-5700x'),
(78, 'AMD Ryzen 7 8700G', 'AM5', '8 Core', 4.2, 65, '4730000.00', 'https://www.amd.com/ryzen-7-8700g'),
(79, 'Intel Core i5-13600K', 'LGA 1700', '14 Core', 3.5, 125, '4350000.00', 'https://www.intel.com/products/i5-13600k'),
(80, 'AMD Ryzen 7 7700', 'AM5', '8 Core', 3.8, 65, '5430000.00', 'https://www.amd.com/ryzen-7-7700'),
(81, 'AMD Ryzen 7 7700X', 'AM5', '8 Core', 4.5, 105, '5649000.00', 'https://www.amd.com/ryzen-7-7700x'),
(82, 'Intel Core i7-13700F', 'LGA 1700', '16 Core', 2.1, 65, '5090000.00', 'https://www.intel.com/products/i7-13700f'),
(83, 'Intel Core i7-14700F', 'LGA 1700', '20 Core', 2.1, 65, '5800000.00', 'https://www.intel.com/products/i7-14700f'),
(84, 'Intel Core i7-14700K', 'LGA 1700', '20 Core', 3.4, 125, '6730000.00', 'https://www.intel.com/products/i7-14700k'),
(85, 'AMD Ryzen 7 7800X3D', 'AM5', '8 Core', 4.2, 120, '6889000.00', 'https://www.amd.com/ryzen-7-7800x3d'),
(86, 'AMD Ryzen 9 7900X', 'AM5', '12 Core', 4.7, 170, '6799000.00', 'https://www.amd.com/ryzen-9-7900x'),
(87, 'AMD Ryzen 9 9900X', 'AM5', '12 Core', 4.4, 120, '7529000.00', 'https://www.amd.com/ryzen-9-9900x'),
(88, 'Intel Core i9-14900F', 'LGA 1700', '24 Core', 2, 65, '8500000.00', 'https://www.intel.com/products/i9-14900f'),
(89, 'Intel Core i9-14900K', 'LGA 1700', '24 Core', 3.2, 125, '8780000.00', 'https://www.intel.com/products/i9-14900k'),
(90, 'AMD Ryzen 9 7950X', 'AM5', '16 Core', 4.5, 170, '8990000.00', 'https://www.amd.com/ryzen-9-7950x'),
(91, 'AMD Ryzen 9 9950X', 'AM5', '16 Core', 4.7, 170, '10375000.00', 'https://www.amd.com/ryzen-9-9950x'),
(92, 'AMD Ryzen 9 7950X3D', 'AM5', '16 Core', 4.2, 120, '10299000.00', 'https://www.amd.com/ryzen-9-7950x3d'),
(93, 'AMD Ryzen 9 9900X3D', 'AM5', '12 Core', 4.6, 120, '10930000.00', 'https://www.amd.com/ryzen-9-9900x3d'),
(94, 'AMD Ryzen 9 9950X3D', 'AM5', '16 Core', 4.7, 120, '12539000.00', 'https://www.amd.com/ryzen-9-9950x3d'),
(95, 'AMD Threadripper 7960X', 'sTR5', '24 Core', 3.2, 280, '27150000.00', 'https://www.amd.com/threadripper-7960x'),
(96, 'AMD Threadripper PRO 7965WX', 'sTR5', '24 Core', 4.2, 350, '50799000.00', 'https://www.amd.com/threadripper-7965wx');

-- --------------------------------------------------------

--
-- Table structure for table `psu`
--

CREATE TABLE `psu` (
  `id_psu` int NOT NULL,
  `nama_produk` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `daya` int NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `link_resmi` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `psu`
--

INSERT INTO `psu` (`id_psu`, `nama_produk`, `daya`, `harga`, `gambar`, `link_resmi`) VALUES
(1, 'Digital Alliance Oasis 450W', 450, '260000.00', 'Digital Alliance Oasis 450W.png', 'https://www.digitalalliance.co.id/oasis-450w'),
(2, 'PCCooler KF450', 450, '450000.00', 'PCCooler KF450.png', 'https://www.pccooler.com/kf450'),
(3, 'POWERMAX 500W', 500, '175000.00', 'POWERMAX 500W.png', 'https://www.powermax.com/500w'),
(4, 'Aerocool United Power 500W', 500, '480000.00', 'Aerocool United Power 500W.png', 'https://www.aerocool.com/united-power'),
(5, 'Gamemax ECO GE-500W', 500, '399000.00', 'Gamemax ECO GE-500W.png', 'https://www.gamemax.com/eco-500w'),
(6, 'DeepCool PF550 550W', 550, '625000.00', 'DeepCool PF550 550W.png', 'https://www.deepcool.com/pf550'),
(7, 'Segotep BN550 550W', 550, '549000.00', 'Segotep BN550 550W.png', 'https://www.segotep.com/bn550'),
(8, 'Thermaltake LitePower RGB 550W', 550, '580000.00', 'Thermaltake LitePower RGB 550W.png', 'https://www.thermaltake.com/litepower-rgb-550w'),
(9, 'Corsair CV550 550W', 550, '789000.00', 'Corsair CV550 550W.png', 'https://www.corsair.com/cv550'),
(10, 'MSI MAG A650BNL 650W', 650, '971000.00', 'MSI MAG A650BNL 650W.png', 'https://www.msi.com/mag-a650bnl'),
(11, 'Digital Alliance PBZ650RGB', 650, '585000.00', 'Digital Alliance PBZ650RGB.png', 'https://www.digitalalliance.co.id/pbz650rgb'),
(12, 'DeepCool PF600X 600W', 600, '618000.00', 'DeepCool PF600X 600W.png', 'https://www.deepcool.com/pf600x'),
(13, 'Segotep BN750 750W', 750, '700000.00', 'Segotep BN750 750W.png', 'https://www.segotep.com/bn750'),
(14, 'Corsair CV750 750W', 750, '1075000.00', 'Corsair CV750 750W.png', 'https://www.corsair.com/cv750'),
(15, 'Darkflash PMT750 750W', 750, '1143000.00', 'Darkflash PMT750 750W.png', 'https://www.darkflash.com/pmt750'),
(16, 'Corsair RM750e 750W', 750, '1825000.00', 'Corsair RM750e 750W.png', 'https://www.corsair.com/rm750e'),
(17, 'Seasonic Focus GX-750 750W', 750, '1650000.00', 'Seasonic Focus GX-750 750W.png', 'https://www.seasonic.com/focus-gx-750'),
(18, 'Gamemax GX-850 850W', 850, '1230000.00', 'Gamemax GX-850 850W.png', 'https://www.gamemax.com/gx-850'),
(19, 'Phanteks AMP GH 850W', 850, '1730000.00', 'Phanteks AMP GH 850W.png', 'https://www.phanteks.com/amp-gh-850'),
(20, 'Cooler Master MWE Gold V2 850W', 850, '1850000.00', 'Cooler Master MWE Gold V2 850W.png', 'https://www.coolermaster.com/mwe-gold-v2-850w'),
(21, 'Corsair RM850e 850W', 850, '2319000.00', 'Corsair RM850e 850W.png', 'https://www.corsair.com/rm850e'),
(22, 'Segotep PM850W 850W', 850, '1499000.00', 'Segotep PM850W 850W.png', 'https://www.segotep.com/pm850w'),
(23, 'Cooler Master V1000 1000W', 1000, '2220000.00', 'Cooler Master V1000 1000W.png', 'https://www.coolermaster.com/v1000'),
(24, 'Galax Omega GLX1000 1000W', 1000, '2295000.00', 'Galax Omega GLX1000 1000W.png', 'https://www.galax.com/glx1000'),
(25, 'Super Flower Leadex VII 1000W', 1000, '2599000.00', 'Super Flower Leadex VII 1000W.png', 'https://www.super-flower.com/leadex-vii-1000w'),
(26, 'Corsair HXi HX1200i 1200W (Platinum)', 1200, '5040000.00', '', 'https://www.corsair.com/hx1200i'),
(27, 'MSI MEG Ai1300P 1300W (Platinum, PCIe 5)', 1300, '5098000.00', '', 'https://www.msi.com/meg-ai1300p'),
(28, 'ASUS ROG THOR 1600W (Titanium, ATX 3.0)', 1600, '7500000.00', '', 'https://rog.asus.com/thor-1600w-titanium'),
(29, 'Cooler Master M2000 2000W (Platinum)', 2000, '6450000.00', '', 'https://www.coolermaster.com/m2000-platinum'),
(30, 'Seasonic Prime TX-1600 1600W (Titanium)', 1600, '8500000.00', '', 'https://www.seasonic.com/prime-tx-1600');

-- --------------------------------------------------------

--
-- Table structure for table `ram`
--

CREATE TABLE `ram` (
  `id_ram` int NOT NULL,
  `nama_produk` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `tipe` enum('DDR 4','DDR 5') COLLATE utf8mb4_general_ci NOT NULL,
  `kapasitas` enum('8 GB','16 GB','32 GB','48 GB','64 GB') COLLATE utf8mb4_general_ci NOT NULL,
  `kecepatan` int NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `link_resmi` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ram`
--

INSERT INTO `ram` (`id_ram`, `nama_produk`, `tipe`, `kapasitas`, `kecepatan`, `harga`, `gambar`, `link_resmi`) VALUES
(1, 'V-GeN Platinum 8GB', 'DDR 4', '8 GB', 3200, '325000.00', 'V-GeN Platinum 8GB.png', 'https://www.v-gen.co.id/ram-ddr4'),
(2, 'Team Elite Plus 8GB', 'DDR 4', '8 GB', 3200, '393000.00', 'Team Elite Plus 8GB.png', 'https://www.teamgroupinc.com/elite-plus'),
(3, 'Kingston Fury Beast 8GB', 'DDR 4', '8 GB', 3200, '445000.00', 'Kingston Fury Beast 8GB.png', 'https://www.kingston.com/fury-beast'),
(4, 'Visipro Sodimm 8GB', 'DDR 4', '8 GB', 3200, '460000.00', 'Visipro Sodimm 8GB.png', 'https://www.visipro.com/ram-sodimm'),
(5, 'Corsair Vengeance LPX 16GB (8x2)', 'DDR 4', '16 GB', 3600, '1050000.00', 'Corsair Vengeance LPX 16GB (8x2).png', 'https://www.corsair.com/lpx-16gb-3600'),
(6, 'G.Skill Ripjaws V 16GB (8x2)', 'DDR 4', '16 GB', 3200, '950000.00', 'G.Skill Ripjaws V 16GB (8x2).png', 'https://www.gskill.com/ripjaws-v'),
(7, 'Adata XPG Spectrix D35G 16GB (8x2)', 'DDR 4', '16 GB', 3200, '1235000.00', 'Adata XPG Spectrix D35G 16GB (8x2).png', 'https://www.adata.com/d35g'),
(8, 'Kingston Fury Renegade 16GB (8x2)', 'DDR 4', '16 GB', 3600, '1399000.00', 'Kingston Fury Renegade 16GB (8x2).png', 'https://www.kingston.com/renegade-ddr4'),
(9, 'Corsair Vengeance LPX 32GB (16x2)', 'DDR 4', '32 GB', 3600, '2469000.00', 'Corsair Vengeance LPX 32GB (16x2).png', 'https://www.corsair.com/lpx-32gb-3600'),
(10, 'G.Skill Trident Z RGB 32GB (16x2)', 'DDR 4', '32 GB', 3600, '2480000.00', 'G.Skill Trident Z RGB 32GB (16x2).png', 'https://www.gskill.com/tridentz-rgb'),
(11, 'Kingston Fury Beast 16GB', 'DDR 5', '16 GB', 5200, '1050000.00', 'Kingston Fury Beast 16GB.png', 'https://www.kingston.com/fury-beast-ddr5'),
(12, 'Team Elite Plus 16GB', 'DDR 5', '16 GB', 4800, '790000.00', 'Team Elite Plus 16GB.png', 'https://www.teamgroupinc.com/elite-ddr5'),
(13, 'Adata XPG Lancer Blade 16GB (8x2)', 'DDR 5', '16 GB', 6000, '1197000.00', 'Adata XPG Lancer Blade 16GB (8x2).png', 'https://www.adata.com/lancer-blade'),
(14, 'V-GeN Platinum 16GB', 'DDR 5', '16 GB', 5600, '1803000.00', 'V-GeN Platinum 16GB.png', 'https://www.v-gen.co.id/ram-ddr5'),
(15, 'Corsair Vengeance 32GB (16x2)', 'DDR 5', '32 GB', 6000, '1979000.00', 'Corsair Vengeance 32GB (16x2).png', 'https://www.corsair.com/vengeance-32gb-6000'),
(16, 'Adata XPG Lancer Blade 32GB (16x2)', 'DDR 5', '32 GB', 6000, '1665000.00', 'Adata XPG Lancer Blade 32GB (16x2).png', 'https://www.adata.com/lancer-blade-32gb'),
(17, 'Kingston Fury Beast 32GB (16x2)', 'DDR 5', '32 GB', 6000, '2925000.00', 'Kingston Fury Beast 32GB (16x2).png', 'https://www.kingston.com/fury-beast-6000'),
(18, 'Crucial Pro 32GB (16x2)', 'DDR 5', '32 GB', 5600, '2250000.00', 'Crucial Pro 32GB (16x2).png', 'https://www.crucial.com/pro-ddr5'),
(19, 'G.Skill Trident Z5 RGB 32GB (16x2)', 'DDR 5', '32 GB', 6400, '3800000.00', 'G.Skill Trident Z5 RGB 32GB (16x2).png', 'https://www.gskill.com/trident-z5-rgb-32gb'),
(20, 'KLEVV CRAS V RGB 32GB (16x2)', 'DDR 5', '32 GB', 7200, '2699000.00', 'KLEVV CRAS V RGB 32GB (16x2).png', 'https://www.klevv.com/cras-v-rgb'),
(21, 'Corsair Dominator Platinum 32GB (16x2)', 'DDR 5', '32 GB', 7200, '3716000.00', 'Corsair Dominator Platinum 32GB (16x2).png', 'https://www.corsair.com/dominator-platinum'),
(22, 'G.Skill Trident Z5 Neo 48GB (2x24GB)', 'DDR 5', '48 GB', 6400, '3166000.00', 'G.Skill Trident Z5 Neo 48GB (2x24GB).png', 'https://www.gskill.com/tridentz5-neo-48gb'),
(23, 'XPG Lancer Blade 48GB (2x24GB)', 'DDR 5', '48 GB', 6000, '2642000.00', 'XPG Lancer Blade 48GB (2x24GB).png', 'https://www.adata.com/lancer-blade-48gb'),
(24, 'KLEVV BOLT V 48GB (2x24GB)', 'DDR 5', '48 GB', 7200, '2430000.00', 'KLEVV BOLT V 48GB (2x24GB).png', 'https://www.klevv.com/bolt-v-48gb'),
(25, 'Corsair Vengeance RGB 48GB (2x24GB)', 'DDR 5', '48 GB', 6000, '2335000.00', 'Corsair Vengeance RGB 48GB (2x24GB).png', 'https://www.corsair.com/vengeance-48gb'),
(26, 'TEAM T-Force Vulcan 64GB (32x2)', 'DDR 5', '64 GB', 6000, '3325200.00', '', 'https://www.teamgroupinc.com/vulcan-64gb'),
(27, 'G.Skill Trident Z5 RGB 64GB (32x2)', 'DDR 5', '64 GB', 6400, '3800000.00', '', 'https://www.gskill.com/tridentz5-64gb'),
(28, 'Corsair Dominator Platinum 64GB (32x2)', 'DDR 5', '64 GB', 5600, '4100000.00', '', 'https://www.corsair.com/dominator-64gb'),
(29, 'KLEVV CRAS V RGB 64GB (32x2)', 'DDR 5', '64 GB', 7200, '5200000.00', '', 'https://www.klevv.com/cras-v-64gb'),
(30, 'Acer Predator Vesta II 64GB (32x2)', 'DDR 5', '64 GB', 6800, '5725000.00', '', 'https://www.acer.com/predator-vesta-ii');

-- --------------------------------------------------------

--
-- Table structure for table `rekomendasi_pc`
--

CREATE TABLE `rekomendasi_pc` (
  `id_rekomendasi` int NOT NULL,
  `nama_paket` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `kebutuhan_pengguna` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `total_budget` decimal(10,2) DEFAULT NULL,
  `id_processor` int DEFAULT NULL,
  `id_motherboard` int DEFAULT NULL,
  `id_ram_1` int DEFAULT NULL,
  `id_ram_2` int DEFAULT NULL,
  `id_vga` int DEFAULT NULL,
  `id_penyimpanan` int DEFAULT NULL,
  `id_psu` int DEFAULT NULL,
  `total_harga_paket` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vga`
--

CREATE TABLE `vga` (
  `id_vga` int NOT NULL,
  `nama_produk` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `chipset` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vram` enum('4 GB','6 GB','8 GB','10 GB','12 GB','14 GB','16 GB','18 GB','20 GB','22 GB','24 GB') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kebutuhan_daya` int DEFAULT NULL,
  `harga` decimal(10,2) NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `link_resmi` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vga`
--

INSERT INTO `vga` (`id_vga`, `nama_produk`, `chipset`, `vram`, `kebutuhan_daya`, `harga`, `gambar`, `link_resmi`) VALUES
(1, 'Colorful GT 1030', 'NVIDIA GT 1030', '4 GB', 30, '850000.00', 'Colorful GT 1030.png', 'https://www.colorful.cn/gt1030'),
(2, 'GALAX GTX 1650 EX PLUS', 'NVIDIA GTX 1650', '4 GB', 75, '2300000.00', '', 'https://www.galax.com/gtx1650'),
(3, 'ASUS Dual RTX 3050 OC', 'NVIDIA RTX 3050', '8 GB', 130, '3950000.00', 'ASUS Dual RTX 3050 OC.png', 'https://www.asus.com/rtx3050'),
(4, 'MSI RTX 4060 VENTUS 2X', 'NVIDIA RTX 4060', '8 GB', 115, '5300000.00', 'MSI RTX 4060 VENTUS 2X.png', 'https://www.msi.com/rtx4060'),
(5, 'Gigabyte RTX 4060 Ti Eagle', 'NVIDIA RTX 4060 Ti', '8 GB', 160, '6800000.00', 'Gigabyte RTX 4060 Ti Eagle.png', 'https://www.gigabyte.com/rtx4060ti'),
(6, 'ASUS Dual RTX 4060 Ti OC', 'NVIDIA RTX 4060 Ti', '16 GB', 165, '8300000.00', 'ASUS Dual RTX 4060 Ti OC.png', 'https://www.asus.com/rtx4060ti-16gb'),
(7, 'PowerColor Hellhound RX 7600', 'AMD RX 7600', '8 GB', 165, '4500000.00', 'PowerColor Hellhound RX 7600.png', 'https://www.powercolor.com/rx7600'),
(8, 'Sapphire Pulse RX 7700 XT', 'AMD RX 7700 XT', '12 GB', 245, '7500000.00', 'Sapphire Pulse RX 7700 XT.png', 'https://www.sapphiretech.com/rx7700xt'),
(9, 'ASRock Challenger RX 7800 XT', 'AMD RX 7800 XT', '16 GB', 263, '8500000.00', 'ASRock Challenger RX 7800 XT.png', 'https://www.asrock.com/rx7800xt'),
(10, 'PowerColor Red Devil RX 7900 XT', 'AMD RX 7900 XT', '20 GB', 315, '14000000.00', 'PowerColor Red Devil RX 7900 XT.png', 'https://www.powercolor.com/rx7900xt'),
(11, 'Sapphire Nitro+ RX 7900 XTX', 'AMD RX 7900 XTX', '24 GB', 355, '18500000.00', 'Sapphire Nitro+ RX 7900 XTX.png', 'https://www.sapphiretech.com/rx7900xtx'),
(12, 'Zotac Gaming RTX 4070 Twin Edge', 'NVIDIA RTX 4070', '12 GB', 200, '9300000.00', 'Zotac Gaming RTX 4070 Twin Edge.png', 'https://www.zotac.com/rtx4070'),
(13, 'PNY RTX 4070 SUPER Verto', 'NVIDIA RTX 4070 SUPER', '12 GB', 220, '10500000.00', 'PNY RTX 4070 SUPER Verto.png', 'https://www.pny.com/rtx4070-super'),
(14, 'Inno3D RTX 4070 Ti SUPER', 'NVIDIA RTX 4070 Ti SUPER', '16 GB', 285, '13500000.00', 'Inno3D RTX 4070 Ti SUPER.png', 'https://www.inno3d.com/rtx4070ti-super'),
(15, 'ASUS ROG Strix RTX 4080 SUPER', 'NVIDIA RTX 4080 SUPER', '16 GB', 320, '20000000.00', 'ASUS ROG Strix RTX 4080 SUPER.png', 'https://www.asus.com/rtx4080-super'),
(16, 'Gigabyte Gaming OC RTX 4090', 'NVIDIA RTX 4090', '24 GB', 450, '32000000.00', 'Gigabyte Gaming OC RTX 4090.png', 'https://www.gigabyte.com/rtx4090'),
(17, 'MSI GT 710', 'NVIDIA GT 710', '4 GB', 19, '550000.00', 'MSI GT 710.png', 'https://www.msi.com/gt710'),
(18, 'ASUS Phoenix GTX 1660 Ti', 'NVIDIA GTX 1660 Ti', '6 GB', 120, '3500000.00', 'ASUS Phoenix GTX 1660 Ti.png', 'https://www.asus.com/gtx1660ti'),
(19, 'Colorful RTX 3060 NB', 'NVIDIA RTX 3060', '12 GB', 170, '4700000.00', 'Colorful RTX 3060 NB.png', 'https://www.colorful.cn/rtx3060'),
(20, 'GALAX RTX 3070 SG', 'NVIDIA RTX 3070', '8 GB', 220, '6800000.00', 'GALAX RTX 3070 SG.png', 'https://www.galax.com/rtx3070'),
(21, 'ASUS TUF Gaming RX 6700 XT', 'AMD RX 6700 XT', '12 GB', 230, '5500000.00', 'ASUS TUF Gaming RX 6700 XT.png', 'https://www.asus.com/rx6700xt'),
(22, 'PowerColor RX 6800 Fighter', 'AMD RX 6800', '16 GB', 250, '7200000.00', 'PowerColor RX 6800 Fighter.png', 'https://www.powercolor.com/rx6800'),
(23, 'Inno3D RTX 4070 Ti X3', 'NVIDIA RTX 4070 Ti', '12 GB', 285, '12000000.00', 'Inno3D RTX 4070 Ti X3.png', 'https://www.inno3d.com/rtx4070ti'),
(24, 'Zotac RTX 4080 AMP Extreme', 'NVIDIA RTX 4080', '16 GB', 320, '22000000.00', 'Zotac RTX 4080 AMP Extreme.png', 'https://www.zotac.com/rtx4080'),
(25, 'ASUS ROG Strix RX 7900 XT', 'AMD RX 7900 XT', '20 GB', 300, '15500000.00', 'ASUS ROG Strix RX 7900 XT.png', 'https://www.asus.com/rx7900xt'),
(26, 'Zotac RTX 3080 Trinity', 'NVIDIA RTX 3080', '10 GB', 320, '9500000.00', '', 'https://www.zotac.com/rtx3080'),
(27, 'Colorful RTX 4070 Ti 14GB (Custom)', 'NVIDIA RTX 4070 Ti', '14 GB', 285, '11500000.00', '', 'https://www.colorful.cn/rtx4070ti-14gb'),
(28, 'ASUS ROG Strix RTX 3080 12GB', 'NVIDIA RTX 3080', '12 GB', 350, '10500000.00', '', 'https://www.asus.com/rtx3080-12gb'),
(29, 'MSI Ventus 3X RTX 4080 18GB (Custom)', 'NVIDIA RTX 4080', '18 GB', 320, '23000000.00', '', 'https://www.msi.com/rtx4080-18gb'),
(30, 'Gigabyte RX 7900 XT 22GB (Custom)', 'AMD RX 7900 XT', '22 GB', 300, '15000000.00', '', 'https://www.gigabyte.com/rx7900xt-22gb');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `laptop`
--
ALTER TABLE `laptop`
  ADD PRIMARY KEY (`id_laptop`);

--
-- Indexes for table `motherboard`
--
ALTER TABLE `motherboard`
  ADD PRIMARY KEY (`id_motherboard`);

--
-- Indexes for table `penyimpanan`
--
ALTER TABLE `penyimpanan`
  ADD PRIMARY KEY (`id_penyimpanan`);

--
-- Indexes for table `processor`
--
ALTER TABLE `processor`
  ADD PRIMARY KEY (`id_processor`);

--
-- Indexes for table `psu`
--
ALTER TABLE `psu`
  ADD PRIMARY KEY (`id_psu`);

--
-- Indexes for table `ram`
--
ALTER TABLE `ram`
  ADD PRIMARY KEY (`id_ram`);

--
-- Indexes for table `rekomendasi_pc`
--
ALTER TABLE `rekomendasi_pc`
  ADD PRIMARY KEY (`id_rekomendasi`),
  ADD KEY `id_processor` (`id_processor`),
  ADD KEY `id_motherboard` (`id_motherboard`),
  ADD KEY `id_ram_1` (`id_ram_1`),
  ADD KEY `id_ram_2` (`id_ram_2`),
  ADD KEY `id_vga` (`id_vga`),
  ADD KEY `id_penyimpanan` (`id_penyimpanan`),
  ADD KEY `id_psu` (`id_psu`);

--
-- Indexes for table `vga`
--
ALTER TABLE `vga`
  ADD PRIMARY KEY (`id_vga`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `laptop`
--
ALTER TABLE `laptop`
  MODIFY `id_laptop` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;

--
-- AUTO_INCREMENT for table `motherboard`
--
ALTER TABLE `motherboard`
  MODIFY `id_motherboard` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `penyimpanan`
--
ALTER TABLE `penyimpanan`
  MODIFY `id_penyimpanan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `processor`
--
ALTER TABLE `processor`
  MODIFY `id_processor` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `psu`
--
ALTER TABLE `psu`
  MODIFY `id_psu` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `ram`
--
ALTER TABLE `ram`
  MODIFY `id_ram` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `rekomendasi_pc`
--
ALTER TABLE `rekomendasi_pc`
  MODIFY `id_rekomendasi` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vga`
--
ALTER TABLE `vga`
  MODIFY `id_vga` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rekomendasi_pc`
--
ALTER TABLE `rekomendasi_pc`
  ADD CONSTRAINT `rekomendasi_pc_ibfk_1` FOREIGN KEY (`id_processor`) REFERENCES `processor` (`id_processor`),
  ADD CONSTRAINT `rekomendasi_pc_ibfk_2` FOREIGN KEY (`id_motherboard`) REFERENCES `motherboard` (`id_motherboard`),
  ADD CONSTRAINT `rekomendasi_pc_ibfk_3` FOREIGN KEY (`id_ram_1`) REFERENCES `ram` (`id_ram`),
  ADD CONSTRAINT `rekomendasi_pc_ibfk_4` FOREIGN KEY (`id_ram_2`) REFERENCES `ram` (`id_ram`),
  ADD CONSTRAINT `rekomendasi_pc_ibfk_5` FOREIGN KEY (`id_vga`) REFERENCES `vga` (`id_vga`),
  ADD CONSTRAINT `rekomendasi_pc_ibfk_6` FOREIGN KEY (`id_penyimpanan`) REFERENCES `penyimpanan` (`id_penyimpanan`),
  ADD CONSTRAINT `rekomendasi_pc_ibfk_7` FOREIGN KEY (`id_psu`) REFERENCES `psu` (`id_psu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
