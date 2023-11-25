-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Nov 2023 pada 08.28
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bromo_tiket`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `akuns`
--

CREATE TABLE `akuns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Nama` varchar(255) NOT NULL,
  `TanggalLahir` varchar(255) NOT NULL,
  `NomorTelepon` varchar(255) NOT NULL,
  `MerupakanAdmin` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `akuns`
--

INSERT INTO `akuns` (`id`, `Username`, `Password`, `Nama`, `TanggalLahir`, `NomorTelepon`, `MerupakanAdmin`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin123', 'Rijal21', '2000-05-20', '081232145151', '1', NULL, NULL),
(2, 'Yanti', 'yanti123', 'Yanti', '2005-05-27', '083357382937', '0', '2023-10-24 14:10:26', '2023-10-24 14:10:26'),
(3, 'wanto123', 'wanto123', 'wanto', '2023-10-31', '081232145151', '0', '2023-10-31 14:02:05', '2023-10-31 14:02:05'),
(4, 'Iron79', 'ironmang', 'Iron', '2023-11-22', '081938092168', '0', '2023-11-03 01:25:07', '2023-11-03 01:25:07'),
(5, 'jayanto', 'jayanto123', 'jayanto', '2000-07-06', '0812321451512', '0', '2023-11-06 06:59:19', '2023-11-06 06:59:19'),
(6, 'swito', 'swito123', 'swito', '2005-06-07', '081232145151', '0', '2023-11-07 06:15:55', '2023-11-07 06:15:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `bandaras`
--

CREATE TABLE `bandaras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Nama` varchar(255) NOT NULL,
  `KodeIATA` varchar(255) NOT NULL,
  `Kota` varchar(255) NOT NULL,
  `NegaraID` int(11) NOT NULL,
  `JumlahTerminal` int(11) NOT NULL,
  `Alamat` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `bandaras`
--

INSERT INTO `bandaras` (`id`, `Nama`, `KodeIATA`, `Kota`, `NegaraID`, `JumlahTerminal`, `Alamat`, `created_at`, `updated_at`) VALUES
(1, 'Sultan Iskandar Muda', 'BTJ', 'Banda Aceh', 61, 2, 'Banda Aceh', NULL, NULL),
(2, 'Polonia', 'MES', 'Medan', 61, 2, 'Medan', NULL, NULL),
(3, 'Hang Nadim', 'BTH', 'Batam', 61, 2, 'Batam', NULL, NULL),
(4, 'Raja Haji Fisabilillah', 'TNJ', 'Tanjung Pinang', 61, 2, 'Tanjung Pinang', NULL, NULL),
(5, 'Sultan Syarif Kasim II', 'PKU', 'Pekanbaru', 61, 2, 'Pekanbaru', NULL, NULL),
(6, 'Minangkabau', 'PDG', 'Padang', 61, 2, 'Padang', NULL, NULL),
(7, 'Sultan Mahmud Badaruddin II', 'PLM', 'Palembang', 61, 2, 'Palembang', NULL, NULL),
(8, 'Fatmawati Soekarno', 'BKS', 'Bengkulu', 61, 2, 'Bengkulu', NULL, NULL),
(9, 'Radin Inten II', 'TKG', 'Bandar Lampung', 61, 2, 'Bandar Lampung', NULL, NULL),
(10, 'Soekarno-Hatta', 'CGK', 'Banten', 61, 2, 'Banten. Singkatan CGK merujuk kepada Cengkareng', NULL, NULL),
(11, 'Halim Perdanakusuma', 'HLP', 'Jakarta', 61, 2, 'Jakarta', NULL, NULL),
(12, 'Juanda', 'SUB', 'Surabaya', 61, 2, 'Surabaya', NULL, NULL),
(13, 'Adisumarmo', 'SOC', 'Solo', 61, 2, 'Solo', NULL, NULL),
(14, 'Adi Sucipto', 'JOG', 'Yogyakarta', 61, 2, 'Yogyakarta', NULL, NULL),
(15, 'Achmad Yani', 'SRG', 'Semarang', 61, 2, 'Semarang', NULL, NULL),
(16, 'Husein Sastranegara', 'BDO', 'Bandung', 61, 2, 'Bandung', NULL, NULL),
(17, 'Ngurah Rai', 'DPS', 'Denpasar', 61, 2, 'Denpasar', NULL, NULL),
(18, 'Selaparang', 'AMI', 'Mataram', 61, 2, 'Mataram', NULL, NULL),
(19, 'El Tari', 'KOE', 'Kupang', 61, 2, 'Kupang', NULL, NULL),
(20, 'Sepinggan', 'BPN', 'Balikpapan', 61, 2, 'Balikpapan', NULL, NULL),
(21, 'Supadio', 'PNK', 'Pontianak', 61, 2, 'Pontianak', NULL, NULL),
(22, 'Juwata', 'TRK', 'Tarakan', 61, 2, 'Tarakan', NULL, NULL),
(23, 'Sultan Hasanuddin', 'UPG', 'Makassar', 61, 2, 'Makassar', NULL, NULL),
(24, 'Sam Ratulangi', 'MDC', 'Manado', 61, 2, 'Manado', NULL, NULL),
(25, 'Pattimura', 'AMQ', 'Ambon', 61, 2, 'Ambon', NULL, NULL),
(26, 'Sentani', 'DJJ', 'Jayapura', 61, 2, 'Jayapura', NULL, NULL),
(27, 'Frans Kaisiepo', 'BIK', 'Biak', 61, 2, 'Biak', NULL, NULL),
(28, 'Mozes Kilangin', 'TIM', 'Tembagapura', 61, 2, 'Tembagapura', NULL, NULL),
(29, 'Mopah', 'MKQ', 'Merauke', 61, 2, 'Merauke', NULL, NULL),
(30, 'Maimun Saleh', 'SBG', 'Sabang', 61, 2, 'Sabang', NULL, NULL),
(31, 'Lhok Sukon', 'LSX', 'Aceh Utara', 61, 2, 'Aceh Utara', NULL, NULL),
(32, 'Malikus Saleh', 'LSW', 'Lhokseumawe', 61, 2, 'Lhokseumawe', NULL, NULL),
(33, 'Cut Nyak Dhien', 'MEQ', 'Nagan Raya', 61, 2, 'Nagan Raya', NULL, NULL),
(34, 'Teuku Cut Ali', 'TPK', 'Tapaktuan', 61, 2, 'Tapaktuan', NULL, NULL),
(35, 'Syekh Hamzah Fansyuri', 'SKL', 'Singkil', 61, 2, 'Singkil', NULL, NULL),
(36, 'Lasikin', 'SNB', 'Sinabang', 61, 2, 'Sinabang', NULL, NULL),
(37, 'Sibisa', 'SIW', 'Toba Samosir', 61, 2, 'Toba Samosir', NULL, NULL),
(38, 'Silangit', 'SQT', 'Siborong-borong', 61, 2, 'Siborong-borong', NULL, NULL),
(39, 'Dr. Ferdinand Lumban Tobing', 'SIX', 'Sibolga', 61, 2, 'Sibolga', NULL, NULL),
(40, 'Aek Godang', 'AEG', 'Padang Sidempuan', 61, 2, 'Padang Sidempuan', NULL, NULL),
(41, 'Binaka', 'GNS', 'Gunung Sitoli', 61, 2, 'Gunung Sitoli', NULL, NULL),
(42, 'Lasondre', 'LSE', 'Pulau-pulau Batu', 61, 2, 'Pulau-pulau Batu', NULL, NULL),
(43, 'Pinang Kampai', 'DUM', 'Dumai', 61, 2, 'Dumai', NULL, NULL),
(44, 'Sungai Pakning', 'SEQ', 'Bengkalis', 61, 2, 'Bengkalis', NULL, NULL),
(45, 'Pasir Pengaraian', 'PPR', 'Pasir Pengaraian', 61, 2, 'Pasir Pengaraian', NULL, NULL),
(46, 'Dabo', 'SIQ', 'Singkep', 61, 2, 'Singkep', NULL, NULL),
(47, 'Japura', 'RGT', 'Rengat', 61, 2, 'Rengat', NULL, NULL),
(48, 'Sei Bati', 'TJB', 'Karimun', 61, 2, 'Karimun', NULL, NULL),
(49, 'Ranai', 'NTX', 'Natuna', 61, 2, 'Natuna', NULL, NULL),
(50, 'Matak', 'MWK', 'Pal Matak', 61, 2, 'Pal Matak', NULL, NULL),
(51, 'Rokot', 'RKO', 'Sipura', 61, 2, 'Sipura', NULL, NULL),
(52, 'Sultan Thaha Syarifuddin', 'DJB', 'Jambi', 61, 2, 'Jambi', NULL, NULL),
(53, 'Depati Parbo', 'KRC', 'Kerinci', 61, 2, 'Kerinci', NULL, NULL),
(54, 'Fatmawati Soekarno', 'BKS', 'Bengkulu', 61, 2, 'Bengkulu', NULL, NULL),
(55, 'Mukomuko', 'MPC', 'Mukomuko', 61, 2, 'Mukomuko', NULL, NULL),
(56, 'Depati Amir', 'PGK', 'Pangkalpinang', 61, 2, 'Pangkalpinang', NULL, NULL),
(57, 'H. A. S. Hanandjoeddin', 'TJQ', 'Tanjung Pandan', 61, 2, 'Tanjung Pandan', NULL, NULL),
(58, 'Silampari', 'LLG', 'Lubuklinggau', 61, 2, 'Lubuklinggau', NULL, NULL),
(59, 'Pendopo', 'PDO', 'Empat Lawang', 61, 2, 'Empat Lawang', NULL, NULL),
(60, 'Pondok Cabe', 'PCB', 'Pamulang', 61, 2, 'Pamulang', NULL, NULL),
(61, 'Pulau Panjang', 'PPJ', 'Kepulauan Seribu', 61, 2, 'Kepulauan Seribu', NULL, NULL),
(62, 'Cibeureum', 'TSY', 'Tasikmalaya', 61, 2, 'Tasikmalaya', NULL, NULL),
(63, 'Cakrabhuwana', 'CBN', 'Cirebon', 61, 2, 'Cirebon', NULL, NULL),
(64, 'Tunggul Wulung', 'CXP', 'Cilacap', 61, 2, 'Cilacap', NULL, NULL),
(65, 'Wirasaba', 'PWL', 'Purbalingga', 61, 2, 'Purbalingga', NULL, NULL),
(66, 'Dewa Daru', 'KWB', 'Karimunjawa', 61, 2, 'Karimunjawa', NULL, NULL),
(67, 'Ngloram', 'CPF', 'Cepu', 61, 2, 'Cepu', NULL, NULL),
(68, 'Abdul Rachman Saleh', 'MLG', 'Malang', 61, 2, 'Malang', NULL, '2023-11-06 02:01:59'),
(69, 'Trunojoyo', 'SUP', 'Sumenep', 61, 2, 'Sumenep', NULL, NULL),
(70, 'Masalembo', 'MSI', 'Masalembo', 61, 2, 'Masalembo', NULL, NULL),
(71, 'Brangbiji', 'SWQ', 'Sumbawa Besar', 61, 2, 'Sumbawa Besar', NULL, NULL),
(72, 'Lunyuk', 'LYK', 'Sumbawa', 61, 2, 'Sumbawa', NULL, NULL),
(73, 'Muhammad Salahuddin', 'BMU', 'Bima', 61, 2, 'Bima', NULL, NULL),
(74, 'El Tari', 'KOE', 'Kupang', 61, 2, 'Kupang', NULL, NULL),
(75, 'Komodo', 'LBJ', 'Manggarai Barat', 61, 2, 'Manggarai Barat', NULL, NULL),
(76, 'Frans Sales Lega', 'RTG', 'Ruteng', 61, 2, 'Ruteng', NULL, NULL),
(77, 'Tambolaka', 'TMC', 'Waikabubak', 61, 2, 'Waikabubak', NULL, NULL),
(78, 'Mau Hau', 'WGP', 'Waingapu', 61, 2, 'Waingapu', NULL, NULL),
(79, 'Soa', 'BJW', 'Bajawa', 61, 2, 'Bajawa', NULL, NULL),
(80, 'H Hasan Aroeboesman', 'ENE', 'Ende', 61, 2, 'Ende', NULL, NULL),
(81, 'Wai Oti', 'MOF', 'Maumere', 61, 2, 'Maumere', NULL, NULL),
(82, 'Gewayantana', 'LKA', 'Larantuka', 61, 2, 'Larantuka', NULL, NULL),
(83, 'Wonopito', 'LWE', 'Lewoleba', 61, 2, 'Lewoleba', NULL, NULL),
(84, 'Mali', 'ARD', 'Alor', 61, 2, 'Alor', NULL, NULL),
(85, 'Lekunik', 'RTI', 'Rote', 61, 2, 'Rote', NULL, NULL),
(86, 'Tardamu', 'SAU', 'Pulau Sawu', 61, 2, 'Pulau Sawu', NULL, NULL),
(87, 'Haliwen', 'ABU', 'Atambua', 61, 2, 'Atambua', NULL, NULL),
(88, 'Rahadi Oesman', 'KTG', 'Ketapang', 61, 2, 'Ketapang', NULL, NULL),
(89, 'Susilo', 'SQG', 'Sintang', 61, 2, 'Sintang', NULL, NULL),
(90, 'Nanga Pinoh', 'NPO', 'Nanga Pinoh', 61, 2, 'Nanga Pinoh', NULL, NULL),
(91, 'Pangsuma', 'PSU', 'Putussibau', 61, 2, 'Putussibau', NULL, NULL),
(92, 'Tjilik Riwut', 'PKY', 'Palangka Raya', 61, 2, 'Palangka Raya', NULL, NULL),
(93, 'Iskandar', 'PKN', 'Pangkalan Bun', 61, 2, 'Pangkalan Bun', NULL, NULL),
(94, 'Tumbang Samba', 'TBM', 'Katingan', 61, 2, 'Katingan', NULL, NULL),
(95, 'H. Asan', 'SMQ', 'Sampit', 61, 2, 'Sampit', NULL, NULL),
(96, 'Beringin', 'MTW', 'Muara Teweh', 61, 2, 'Muara Teweh', NULL, NULL),
(97, 'Syamsuddin Noor', 'BDJ', 'Banjarmasin', 61, 2, 'Banjarmasin', NULL, NULL),
(98, 'Warukin', 'TJG', 'Tanjung', 61, 2, 'Tanjung', NULL, NULL),
(99, 'Bersujud', 'BTW', 'Batulicin', 61, 2, 'Batulicin', NULL, NULL),
(100, 'Stagen', 'KBU', 'Kotabaru', 61, 2, 'Kotabaru', NULL, NULL),
(101, 'Temindung', 'SRI', 'Samarinda', 61, 2, 'Samarinda', NULL, NULL),
(102, 'Nunukan', 'NNX', 'Nunukan', 61, 2, 'Nunukan', NULL, NULL),
(103, 'Yuvai Semaring', 'LBW', 'Krayan', 61, 2, 'Krayan', NULL, NULL),
(104, 'Bunyu', 'BYQ', 'Pulau Bunyu', 61, 2, 'Pulau Bunyu', NULL, NULL),
(105, 'R.A. Bessing', 'MLN', 'Malinau', 61, 2, 'Malinau', NULL, NULL),
(106, 'Long Ampung', 'LPU', 'Kayan Selatan', 61, 2, 'Kayan Selatan', NULL, NULL),
(107, 'Tanjung Harapan', 'TJS', 'Tanjung Selor', 61, 2, 'Tanjung Selor', NULL, NULL),
(108, 'Banaina', 'NAF', 'Bulungan', 61, 2, 'Bulungan', NULL, NULL),
(109, 'Kalimarau', 'BEJ', 'Tanjung Redeb', 61, 2, 'Tanjung Redeb', NULL, NULL),
(110, 'Sangkimah', 'SGQ', 'Sangatta', 61, 2, 'Sangatta', NULL, NULL),
(111, 'Bontang', 'BXT', 'Bontang', 61, 2, 'Bontang', NULL, NULL),
(112, 'Tanjung Santan', 'TSX', 'Marang Kayu', 61, 2, 'Marang Kayu', NULL, NULL),
(113, 'Kotabangun', 'KOD', 'Kutai Kartanegara', 61, 2, 'Kutai Kartanegara', NULL, NULL),
(114, 'Senipah', 'SZH', 'Kutai Kartanegara', 61, 2, 'Kutai Kartanegara', NULL, NULL),
(115, 'Melalan', 'MLK', 'Melak', 61, 2, 'Melak', NULL, NULL),
(116, 'Datah Dawai', 'DTD', 'Kutai Barat', 61, 2, 'Kutai Barat', NULL, NULL),
(117, 'Tanah Grogot', 'TNB', 'Tanah Grogot', 61, 2, 'Tanah Grogot', NULL, NULL),
(118, 'Andi Djemma', 'MXB', 'Masamba', 61, 2, 'Masamba', NULL, NULL),
(119, 'Betoambari', 'BUW', 'Bau-bau', 61, 2, 'Bau-bau', NULL, NULL),
(120, 'Jalaluddin', 'GTO', 'Gorontalo', 61, 2, 'Gorontalo', NULL, NULL),
(121, 'Inco Soroako Waws', 'SQR', 'Sorowako', 61, 2, 'Sorowako', NULL, NULL),
(122, 'Kasiguncu', 'PSJ', 'Poso', 61, 2, 'Poso', NULL, NULL),
(123, 'Lalos', 'TLI', 'Tolitoli', 61, 2, 'Tolitoli', NULL, NULL),
(124, 'Tampa Padang', 'MJU', 'Mamuju', 61, 2, 'Mamuju', NULL, NULL),
(125, 'Melonguane', 'MNA', 'Melonguane', 61, 2, 'Melonguane', NULL, NULL),
(126, 'Mopait', 'BJG', 'Bolaang Mongondow', 61, 2, 'Bolaang Mongondow', NULL, NULL),
(127, 'Mutiara', 'PLW', 'Palu', 61, 2, 'Palu', NULL, NULL),
(128, 'Naha', 'NAH', 'Tahuna', 61, 2, 'Tahuna', NULL, NULL),
(129, 'Pogugol', 'UOL', 'Buol', 61, 2, 'Buol', NULL, NULL),
(130, 'Pomalaa', 'PUM', 'Pomalaa', 61, 2, 'Pomalaa', NULL, NULL),
(131, 'Pongtiku', 'TTR', 'Tana Toraja', 61, 2, 'Tana Toraja', NULL, NULL),
(132, 'Sugimanuru', 'RAQ', 'Raha', 61, 2, 'Raha', NULL, NULL),
(133, 'Syukuran Aminuddin Amir', 'LUW', 'Luwuk', 61, 2, 'Luwuk', NULL, NULL),
(134, 'Haluoleo', 'KDI', 'Kendari', 61, 2, 'Kendari', NULL, NULL),
(135, 'Amahai', 'AHI', 'Masohi', 61, 2, 'Masohi', NULL, NULL),
(136, 'Bandaneira', 'NDA', 'Banda', 61, 2, 'Banda', NULL, NULL),
(137, 'Dobo', 'DOB', 'Kepulauan Aru', 61, 2, 'Kepulauan Aru', NULL, NULL),
(138, 'Dumatubun', 'LUV', 'Langgur', 61, 2, 'Langgur', NULL, NULL),
(139, 'Emalamo', 'SQN', 'Sanana', 61, 2, 'Sanana', NULL, NULL),
(140, 'Gamarmalamo', 'GLX', 'Galela', 61, 2, 'Galela', NULL, NULL),
(141, 'Gebe', 'GEB', 'Gebe', 61, 2, 'Gebe', NULL, NULL),
(142, 'Kuabang', 'KAZ', 'Tobelo', 61, 2, 'Tobelo', NULL, NULL),
(143, 'Mangole', 'MAL', 'Mangole', 61, 2, 'Mangole', NULL, NULL),
(144, 'Namlea', 'NAM', 'Namlea', 61, 2, 'Namlea', NULL, NULL),
(145, 'Namrole', 'NRE', 'Namrole', 61, 2, 'Namrole', NULL, NULL),
(146, 'Nangasuri', 'BJK', 'Benjina', 61, 2, 'Benjina', NULL, NULL),
(147, 'Oesman Sadik', 'LAH', 'Labuha', 61, 2, 'Labuha', NULL, NULL),
(148, 'Olilit', 'SXK', 'Saumlaki', 61, 2, 'Saumlaki', NULL, NULL),
(149, 'Pitu', 'OTI', 'Morotai', 61, 2, 'Morotai', NULL, NULL),
(150, 'Sultan Babullah', 'TTE', 'Ternate', 61, 2, 'Ternate', NULL, NULL),
(151, 'Taliabu', 'TAX', 'Taliabu', 61, 2, 'Taliabu', NULL, NULL),
(152, 'Wahai', 'WHI', 'Pulau Seram', 61, 2, 'Pulau Seram', NULL, NULL),
(153, 'Abresso', 'RSK', 'Manokwari', 61, 2, 'Manokwari', NULL, NULL),
(154, 'Anggi', 'AGD', 'Anggi', 61, 2, 'Anggi', NULL, NULL),
(155, 'Apalapsili', 'AAS', 'Jayawijaya', 61, 2, 'Jayawijaya', NULL, NULL),
(156, 'Arso', 'ARJ', 'Arso', 61, 2, 'Arso', NULL, NULL),
(157, 'Ayawasi', 'AYW', 'Sorong', 61, 2, 'Sorong', NULL, NULL),
(158, 'Babo', 'BXB', 'Babo', 61, 2, 'Babo', NULL, NULL),
(159, 'Bade', 'BXD', 'Merauke', 61, 2, 'Merauke', NULL, NULL),
(160, 'Batom', 'BXM', 'Pegunungan Bintang', 61, 2, 'Pegunungan Bintang', NULL, NULL),
(161, 'Bintuni', 'NTI', 'Bintuni', 61, 2, 'Bintuni', NULL, NULL),
(162, 'Bokondini', 'BUI', 'Jayawijaya', 61, 2, 'Jayawijaya', NULL, NULL),
(163, 'Dabra', 'DRH', 'Puncak Jaya', 61, 2, 'Puncak Jaya', NULL, NULL),
(164, 'Elilim', 'ELR', 'Jayawijaya', 61, 2, 'Jayawijaya', NULL, NULL),
(165, 'Enarotali', 'EWI', 'Enarotali', 61, 2, 'Enarotali', NULL, NULL),
(166, 'Ewer', 'EWE', 'Merauke', 61, 2, 'Merauke', NULL, NULL),
(167, 'Illaga', 'ILA', 'Paniai', 61, 2, 'Paniai', NULL, NULL),
(168, 'Ilu', 'IUL', 'Puncak Jaya', 61, 2, 'Puncak Jaya', NULL, NULL),
(169, 'Inanwatan', 'INX', 'Inanwatan', 61, 2, 'Inanwatan', NULL, NULL),
(170, 'Jeffman', 'SOQ', 'Sorong', 61, 2, 'Sorong', NULL, NULL),
(171, 'Yemburwo.', 'FOO', 'Numfor Timur', 61, 2, 'Numfor Timur', NULL, NULL),
(172, 'Kambuaya', 'KBX', 'Sorong Selatan', 61, 2, 'Sorong Selatan', NULL, NULL),
(173, 'Kamur', 'KCD', 'Asmat', 61, 2, 'Asmat', NULL, NULL),
(174, 'Karubaga', 'KBF', 'Jayawijaya', 61, 2, 'Jayawijaya', NULL, NULL),
(175, 'Kebar', 'KEQ', 'Manokwari', 61, 2, 'Manokwari', NULL, NULL),
(176, 'Kelila', 'LLN', 'Jayawijaya', 61, 2, 'Jayawijaya', NULL, NULL),
(177, 'Kepi', 'KEI', 'Merauke', 61, 2, 'Merauke', NULL, NULL),
(178, 'Kimaan', 'KMM', 'Merauke', 61, 2, 'Merauke', NULL, NULL),
(179, 'Kokonao', 'KOX', 'Mimika', 61, 2, 'Mimika', NULL, NULL),
(180, 'Lereh', 'LHI', 'Jayapura', 61, 2, 'Jayapura', NULL, NULL),
(181, 'Mararena', 'ZRM', 'Sarmi', 61, 2, 'Sarmi', NULL, NULL),
(182, 'Merdey', 'RDE', 'Manokwari', 61, 2, 'Manokwari', NULL, NULL),
(183, 'Mindiptana', 'MDP', 'Boven Digoel', 61, 2, 'Boven Digoel', NULL, NULL),
(184, 'Moanamani', 'ONI', 'Dogiyai', 61, 2, 'Dogiyai', NULL, NULL),
(185, 'Mulia', 'LII', 'Puncak Jaya', 61, 2, 'Puncak Jaya', NULL, NULL),
(186, 'Muting', 'MUF', 'Merauke', 61, 2, 'Merauke', NULL, NULL),
(187, 'Nabire', 'NBX', 'Nabire', 61, 2, 'Nabire', NULL, NULL),
(188, 'Obano', 'OBD', 'Nabire', 61, 2, 'Nabire', NULL, NULL),
(189, 'Okaba', 'OKQ', 'Puncak Jaya', 61, 2, 'Puncak Jaya', NULL, NULL),
(190, 'Oksibil', 'OKL', 'Pegunungan Bintang', 61, 2, 'Pegunungan Bintang', NULL, NULL),
(191, 'Pulau Gag', 'GAV', 'Raja Ampat', 61, 2, 'Raja Ampat', NULL, NULL),
(192, 'Rendani', 'MKW', 'Manokwari', 61, 2, 'Manokwari', NULL, NULL),
(193, 'Senggeh', 'SEH', 'Keerom', 61, 2, 'Keerom', NULL, NULL),
(194, 'Senggo', 'ZEG', 'Mappi', 61, 2, 'Mappi', NULL, NULL),
(195, 'Sinak', 'NKD', 'Puncak Jaya', 61, 2, 'Puncak Jaya', NULL, NULL),
(196, 'Sudjarwo Tjondronegoro', 'ZRI', 'Serui', 61, 2, 'Serui', NULL, NULL),
(197, 'Tanah Merah', 'TMH', 'Tanah Merah', 61, 2, 'Tanah Merah', NULL, NULL),
(198, 'Teminabuan', 'TXM', 'Teminabuan', 61, 2, 'Teminabuan', NULL, NULL),
(199, 'Tiom', 'TMY', 'Jayawijaya', 61, 2, 'Jayawijaya', NULL, NULL),
(200, 'Torea', 'FKQ', 'Fakfak', 61, 2, 'Fakfak', NULL, NULL),
(201, 'Ubrub', 'UBR', 'Keerom', 61, 2, 'Keerom', NULL, NULL),
(202, 'Utarom', 'KNG', 'Kaimana', 61, 2, 'Kaimana', NULL, NULL),
(203, 'Waghete', 'WET', 'Deiyai', 61, 2, 'Deiyai', NULL, NULL),
(204, 'Wamena', 'WMX', 'Wamena', 61, 2, 'Wamena', NULL, NULL),
(205, 'Waris', 'WAR', 'Keerom', 61, 2, 'Keerom', NULL, NULL),
(206, 'Wasior', 'WSR', 'Wasior', 61, 2, 'Wasior', NULL, NULL),
(207, 'Yuruf', 'RUF', 'Jayawijaya', 61, 2, 'Jayawijaya', NULL, NULL),
(208, 'Zugapa', 'UGU', 'Paniai', 61, 2, 'Paniai', NULL, NULL),
(209, 'Domine Eduard Osok', 'SOQ', 'Sorong', 61, 2, 'Sorong', NULL, NULL),
(210, 'Yanto Airport', 'YAO', 'Yanto City', 4, 2, 'AS', '2023-10-25 12:56:16', '2023-10-25 12:56:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal_penerbangans`
--

CREATE TABLE `jadwal_penerbangans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `KodePenerbangan` varchar(255) NOT NULL,
  `BandaraKeberangkatanID` int(11) NOT NULL,
  `BandaraTujuanID` int(11) NOT NULL,
  `MaskapaiID` int(11) NOT NULL,
  `TanggalWaktuKeberangkatan` varchar(255) NOT NULL,
  `DurasiPenerbangan` int(11) NOT NULL,
  `HargaPerTiket` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `jadwal_penerbangans`
--

INSERT INTO `jadwal_penerbangans` (`id`, `KodePenerbangan`, `BandaraKeberangkatanID`, `BandaraTujuanID`, `MaskapaiID`, `TanggalWaktuKeberangkatan`, `DurasiPenerbangan`, `HargaPerTiket`, `created_at`, `updated_at`) VALUES
(1, 'IU-0696', 10, 21, 24, '2023-11-08 11:10:00', 95, 1522700, NULL, '2023-11-07 06:26:24'),
(2, 'IU-0697', 21, 10, 24, '2023-11-27 09:40:00', 85, 1268500, NULL, NULL),
(3, 'ID-7508', 12, 11, 4, '2023-11-10  20:00:00', 75, 829891, NULL, NULL),
(4, 'ID-7510', 12, 11, 4, '2023-11-22  07:45:00', 75, 829891, NULL, NULL),
(5, 'ID-7516', 12, 11, 4, '2023-11-22  10:45:00', 75, 1343152, NULL, NULL),
(6, 'ID-7514', 12, 11, 4, '2023-11-22  14:50:00', 75, 829891, NULL, NULL),
(7, 'ID-7512', 12, 11, 4, '2023-11-22  15:40:00', 75, 893837, NULL, NULL),
(8, 'ID-7518', 12, 11, 4, '2023-11-22  19:55:00', 75, 829891, NULL, NULL),
(9, 'IP-0201', 12, 10, 19, '2023-11-22  08:20:00', 95, 735000, NULL, NULL),
(10, 'IP-0205', 12, 10, 19, '2023-11-22  13:20:00', 95, 1035000, NULL, NULL),
(11, 'IP-0209', 12, 10, 19, '2023-11-22  15:10:00', 95, 835000, NULL, NULL),
(12, 'IP-0203', 12, 10, 19, '2023-11-22  19:50:00', 95, 685000, NULL, NULL),
(13, 'ID-6589', 12, 10, 4, '2023-11-22  05:00:00', 85, 833670, NULL, NULL),
(14, 'ID-6597', 12, 10, 4, '2023-11-22  07:10:00', 85, 833670, NULL, NULL),
(15, 'ID-6581', 12, 10, 4, '2023-11-22  09:10:00', 85, 833670, NULL, NULL),
(16, 'ID-6585', 12, 10, 4, '2023-11-22  10:10:00', 85, 833670, NULL, NULL),
(17, 'ID-6593', 12, 10, 4, '2023-11-22  11:10:00', 85, 833670, NULL, NULL),
(18, 'ID-6573', 12, 10, 4, '2023-11-22  14:10:00', 90, 833670, NULL, NULL),
(19, 'ID-6401', 12, 10, 4, '2023-11-22  15:10:00', 90, 833670, NULL, NULL),
(20, 'ID-6587', 12, 10, 4, '2023-11-22  16:10:00', 90, 833670, NULL, NULL),
(21, 'ID-7579', 12, 10, 4, '2023-11-22  17:10:00', 90, 833670, NULL, NULL),
(22, 'JT-0990', 12, 10, 15, '2023-11-22  09:10:00', 55, 1257180, NULL, NULL),
(23, 'JT-0706', 12, 10, 15, '2023-11-22  10:25:00', 90, 2658080, NULL, NULL),
(24, 'JT-0882', 12, 10, 15, '2023-11-22  07:00:00', 90, 2658080, NULL, NULL),
(25, 'IU-0333', 12, 10, 24, '2023-11-22  06:00:00', 85, 725966, NULL, NULL),
(26, 'IU-0331', 12, 10, 24, '2023-11-22  08:00:00', 85, 725966, NULL, NULL),
(27, 'IU-0343', 12, 10, 24, '2023-11-22  16:00:00', 90, 725966, NULL, NULL),
(28, 'IU-0341', 12, 10, 24, '2023-11-22  17:00:00', 90, 725966, NULL, NULL),
(29, 'IU-0706', 12, 10, 24, '2023-11-22  06:00:00', 55, 1060980, NULL, NULL),
(30, 'IN-0192', 12, 10, 18, '2023-11-22  12:30:00', 70, 2631720, NULL, NULL),
(31, 'IN-0192', 12, 10, 18, '2023-11-22  12:30:00', 70, 2631720, NULL, NULL),
(32, 'QG-0711', 12, 10, 6, '2023-11-22  17:45:00', 90, 1317538, NULL, NULL),
(33, 'QG-0717', 12, 10, 6, '2023-11-22  14:20:00', 90, 1317538, NULL, NULL),
(34, 'QG-0719', 12, 10, 6, '2023-11-22  19:30:00', 90, 1317538, NULL, NULL),
(35, 'QG-0737', 12, 10, 6, '2023-11-22  18:40:00', 90, 1317538, NULL, NULL),
(36, 'QG-0723', 12, 10, 6, '2023-11-22  10:10:00', 90, 1317538, NULL, NULL),
(37, 'QG-0713', 12, 10, 6, '2023-11-22  08:10:00', 90, 1317538, NULL, NULL),
(38, 'QG-0725', 12, 10, 6, '2023-11-22  06:00:00', 90, 1317538, NULL, NULL),
(39, 'QG-0715', 12, 10, 6, '2023-11-22  09:50:00', 90, 1317538, NULL, NULL),
(40, 'QG-0253', 12, 10, 6, '2023-11-22  09:10:00', 90, 1317538, NULL, NULL),
(41, 'JT-0591', 12, 10, 15, '2023-11-22  06:15:00', 85, 726331, NULL, NULL),
(42, 'JT-0573', 12, 10, 15, '2023-11-22  07:40:00', 85, 726331, NULL, NULL),
(43, 'JT-0693', 12, 10, 15, '2023-11-22  07:55:00', 85, 726331, NULL, NULL),
(44, 'JT-0697', 12, 10, 15, '2023-11-22  11:20:00', 85, 726331, NULL, NULL),
(45, 'JT-0749', 12, 10, 15, '2023-11-22  14:20:00', 90, 726331, NULL, NULL),
(46, 'JT-0581', 12, 10, 15, '2023-11-22  17:40:00', 90, 726331, NULL, NULL),
(47, 'JT-0786', 12, 10, 15, '2023-11-22  05:00:00', 90, 2705680, NULL, NULL),
(48, 'JT-0646', 12, 10, 15, '2023-11-22  05:55:00', 65, 1454080, NULL, NULL),
(49, 'GA-0305', 12, 10, 7, '2023-11-22  07:05:00', 95, 1536880, NULL, NULL),
(50, 'GA-0311', 12, 10, 7, '2023-11-22  09:30:00', 90, 1536880, NULL, NULL),
(51, 'GA-0327', 12, 10, 7, '2023-11-22  11:35:00', 95, 1536880, NULL, NULL),
(52, 'GA-0317', 12, 10, 7, '2023-11-22  13:35:00', 95, 1536880, NULL, NULL),
(53, 'GA-0315', 12, 10, 7, '2023-11-22  16:30:00', 95, 1536880, NULL, NULL),
(54, 'GA-0325', 12, 10, 7, '2023-11-22  18:40:00', 95, 1536880, NULL, NULL),
(55, 'IU-0706', 12, 10, 24, '2023-11-22  06:00:00', 55, 1227180, NULL, NULL),
(56, 'QG-0173', 12, 11, 6, '2023-11-22  19:00:00', 90, 826284, NULL, NULL),
(57, 'QG-0175', 12, 11, 6, '2023-11-22  08:05:00', 90, 826284, NULL, NULL),
(58, 'QG-0171', 12, 11, 6, '2023-11-22  13:45:00', 90, 1312717, NULL, NULL),
(59, 'QG-0179', 12, 11, 6, '2023-11-22  17:30:00', 90, 1312717, NULL, NULL),
(60, 'QG-0177', 12, 11, 6, '2023-11-22  09:00:00', 90, 1312717, NULL, NULL),
(61, 'JT-0990', 12, 10, 15, '2023-11-23 09:10:00', 55, 1257180, NULL, NULL),
(62, 'JT-0706', 12, 10, 15, '2023-11-23 10:25:00', 90, 2658080, NULL, NULL),
(63, 'JT-0882', 12, 10, 15, '2023-11-23 07:00:00', 90, 2658080, NULL, NULL),
(64, 'JT-0591', 12, 10, 15, '2023-11-23 06:15:00', 85, 726331, NULL, NULL),
(65, 'JT-0573', 12, 10, 15, '2023-11-23 07:40:00', 85, 726331, NULL, NULL),
(66, 'JT-0693', 12, 10, 15, '2023-11-23 07:55:00', 85, 726331, NULL, NULL),
(67, 'JT-0697', 12, 10, 15, '2023-11-23 11:20:00', 85, 726331, NULL, NULL),
(68, 'JT-0749', 12, 10, 15, '2023-11-23 14:20:00', 90, 726331, NULL, NULL),
(69, 'JT-0581', 12, 10, 15, '2023-11-23 17:40:00', 90, 726331, NULL, NULL),
(70, 'JT-0786', 12, 10, 15, '2023-11-23 05:00:00', 90, 2705680, NULL, NULL),
(71, 'JT-0646', 12, 10, 15, '2023-11-23 05:55:00', 65, 1454080, NULL, NULL),
(72, 'QG-0173', 12, 11, 6, '2023-11-23 19:00:00', 90, 772601, NULL, NULL),
(73, 'QG-0175', 12, 11, 6, '2023-11-23 08:05:00', 90, 772601, NULL, NULL),
(74, 'QG-0171', 12, 11, 6, '2023-11-23 13:45:00', 90, 1312717, NULL, NULL),
(75, 'QG-0179', 12, 11, 6, '2023-11-23 17:30:00', 90, 1312717, NULL, NULL),
(76, 'QG-0177', 12, 11, 6, '2023-11-23 09:00:00', 90, 1312717, NULL, NULL),
(77, 'GA-0305', 12, 10, 7, '2023-11-23 07:05:00', 95, 1536880, NULL, NULL),
(78, 'GA-0317', 12, 10, 7, '2023-11-23 13:35:00', 95, 1536880, NULL, NULL),
(79, 'GA-0449', 12, 10, 7, '2023-11-23 15:55:00', 95, 1536880, NULL, NULL),
(80, 'GA-0325', 12, 10, 7, '2023-11-23 18:40:00', 95, 1536880, NULL, NULL),
(81, 'GA-0342', 12, 10, 7, '2023-11-23 09:15:00', 60, 2656180, NULL, NULL),
(82, 'GA-0342', 12, 10, 7, '2023-11-23 09:15:00', 60, 2656180, NULL, NULL),
(83, 'GA-0342', 12, 10, 7, '2023-11-23 09:15:00', 60, 2656180, NULL, NULL),
(84, 'GA-0342', 12, 10, 7, '2023-11-23 09:15:00', 60, 2656180, NULL, NULL),
(85, 'GA-0342', 12, 10, 7, '2023-11-23 09:15:00', 60, 2656180, NULL, NULL),
(86, 'GA-0342', 12, 10, 7, '2023-11-23 09:15:00', 60, 2656180, NULL, NULL),
(87, 'IU-0706', 12, 10, 24, '2023-11-23 06:00:00', 55, 1227180, NULL, NULL),
(88, 'ID-7508', 12, 11, 4, '2023-11-23 05:00:00', 75, 829891, NULL, NULL),
(89, 'ID-7510', 12, 11, 4, '2023-11-23 07:45:00', 75, 765845, NULL, NULL),
(90, 'ID-7516', 12, 11, 4, '2023-11-23 10:45:00', 75, 1343152, NULL, NULL),
(91, 'ID-7514', 12, 11, 4, '2023-11-23 14:50:00', 75, 829891, NULL, NULL),
(92, 'ID-7512', 12, 11, 4, '2023-11-23 15:40:00', 75, 893837, NULL, NULL),
(93, 'ID-7518', 12, 11, 4, '2023-11-23 19:55:00', 75, 765845, NULL, NULL),
(94, 'ID-6589', 12, 10, 4, '2023-11-23 05:00:00', 85, 833670, NULL, NULL),
(95, 'ID-6597', 12, 10, 4, '2023-11-23 07:10:00', 85, 833670, NULL, NULL),
(96, 'ID-6581', 12, 10, 4, '2023-11-23 09:10:00', 85, 833670, NULL, NULL),
(97, 'ID-6585', 12, 10, 4, '2023-11-23 10:10:00', 85, 833670, NULL, NULL),
(98, 'ID-6593', 12, 10, 4, '2023-11-23 11:10:00', 85, 833670, NULL, NULL),
(99, 'ID-6573', 12, 10, 4, '2023-11-23 14:10:00', 90, 833670, NULL, NULL),
(100, 'ID-6401', 12, 10, 4, '2023-11-23 15:10:00', 90, 833670, NULL, NULL),
(101, 'ID-6587', 12, 10, 4, '2023-11-23 16:10:00', 90, 833670, NULL, NULL),
(102, 'ID-7579', 12, 10, 4, '2023-11-23 17:10:00', 90, 833670, NULL, NULL),
(103, 'IP-0201', 12, 10, 19, '2023-11-23 08:20:00', 95, 734000, NULL, NULL),
(104, 'IP-0205', 12, 10, 19, '2023-11-23 13:20:00', 95, 1034000, NULL, NULL),
(105, 'IP-0203', 12, 10, 19, '2023-11-23 19:50:00', 95, 684000, NULL, NULL),
(106, 'IU-0333', 12, 10, 24, '2023-11-23 06:00:00', 85, 725966, NULL, NULL),
(107, 'IU-0331', 12, 10, 24, '2023-11-23 08:00:00', 85, 725966, NULL, NULL),
(108, 'IU-0343', 12, 10, 24, '2023-11-23 16:00:00', 90, 725966, NULL, NULL),
(109, 'IU-0341', 12, 10, 24, '2023-11-23 17:00:00', 90, 725966, NULL, NULL),
(110, 'IU-0706', 12, 10, 24, '2023-11-23 06:00:00', 55, 1060980, NULL, NULL),
(111, 'QG-0711', 12, 10, 6, '2023-11-23 17:45:00', 90, 1317538, NULL, NULL),
(112, 'QG-0717', 12, 10, 6, '2023-11-23 14:20:00', 90, 1317538, NULL, NULL),
(113, 'QG-0719', 12, 10, 6, '2023-11-23 19:30:00', 90, 1317538, NULL, NULL),
(114, 'QG-0737', 12, 10, 6, '2023-11-23 18:40:00', 90, 1317538, NULL, NULL),
(115, 'QG-0723', 12, 10, 6, '2023-11-23 11:10:00', 90, 1317538, NULL, NULL),
(116, 'QG-0713', 12, 10, 6, '2023-11-23 08:10:00', 90, 1317538, NULL, NULL),
(117, 'QG-0725', 12, 10, 6, '2023-11-23 06:00:00', 90, 1317538, NULL, NULL),
(118, 'QG-0715', 12, 10, 6, '2023-11-23 09:50:00', 90, 1317538, NULL, NULL),
(119, 'QG-0253', 12, 10, 6, '2023-11-23 09:10:00', 90, 1317538, NULL, NULL),
(120, 'ID-6589', 12, 10, 4, '2023-11-24 05:00:00', 85, 833670, NULL, NULL),
(121, 'ID-6597', 12, 10, 4, '2023-11-24 07:10:00', 85, 833670, NULL, NULL),
(122, 'ID-6581', 12, 10, 4, '2023-11-24 09:10:00', 85, 833670, NULL, NULL),
(123, 'ID-6585', 12, 10, 4, '2023-11-24 10:10:00', 85, 833670, NULL, NULL),
(124, 'ID-6593', 12, 10, 4, '2023-11-24 11:10:00', 85, 833670, NULL, NULL),
(125, 'ID-6573', 12, 10, 4, '2023-11-24 14:10:00', 90, 833670, NULL, NULL),
(126, 'ID-6401', 12, 10, 4, '2023-11-24 15:10:00', 90, 833670, NULL, NULL),
(127, 'ID-6587', 12, 10, 4, '2023-11-24 16:10:00', 90, 833670, NULL, NULL),
(128, 'ID-7579', 12, 10, 4, '2023-11-24 17:10:00', 90, 833670, NULL, NULL),
(129, 'IU-0333', 12, 10, 24, '2023-11-24 06:00:00', 85, 725966, NULL, NULL),
(130, 'IU-0331', 12, 10, 24, '2023-11-24 08:00:00', 85, 725966, NULL, NULL),
(131, 'IU-0343', 12, 10, 24, '2023-11-24 16:00:00', 90, 725966, NULL, NULL),
(132, 'IU-0341', 12, 10, 24, '2023-11-24 17:00:00', 90, 725966, NULL, NULL),
(133, 'IU-0706', 12, 10, 24, '2023-11-24 06:00:00', 55, 1128680, NULL, NULL),
(134, 'IN-0192', 12, 10, 18, '2023-11-24 12:30:00', 70, 2631720, NULL, NULL),
(135, 'QG-0711', 12, 10, 6, '2023-11-24 17:45:00', 90, 1317538, NULL, NULL),
(136, 'QG-0737', 12, 10, 6, '2023-11-24 18:40:00', 90, 1317538, NULL, NULL),
(137, 'QG-0719', 12, 10, 6, '2023-11-24 19:30:00', 90, 1317538, NULL, NULL),
(138, 'QG-0717', 12, 10, 6, '2023-11-24 14:20:00', 90, 1317538, NULL, NULL),
(139, 'QG-0713', 12, 10, 6, '2023-11-24 08:10:00', 90, 1317538, NULL, NULL),
(140, 'QG-0253', 12, 10, 6, '2023-11-24 09:10:00', 90, 1317538, NULL, NULL),
(141, 'QG-0715', 12, 10, 6, '2023-11-24 09:50:00', 90, 1317538, NULL, NULL),
(142, 'IP-0201', 12, 10, 19, '2023-11-24 08:20:00', 95, 834000, NULL, NULL),
(143, 'IP-0205', 12, 10, 19, '2023-11-24 13:20:00', 95, 1034000, NULL, NULL),
(144, 'IP-0209', 12, 10, 19, '2023-11-24 15:10:00', 95, 634000, NULL, NULL),
(145, 'IP-0203', 12, 10, 19, '2023-11-24 19:50:00', 95, 684000, NULL, NULL),
(146, 'JT-0990', 12, 10, 15, '2023-11-24 09:10:00', 55, 1257180, NULL, NULL),
(147, 'JT-0706', 12, 10, 15, '2023-11-24 10:25:00', 90, 2658080, NULL, NULL),
(148, 'JT-0882', 12, 10, 15, '2023-11-24 07:00:00', 90, 2658080, NULL, NULL),
(149, 'QG-0173', 12, 11, 6, '2023-11-24 19:00:00', 90, 772601, NULL, NULL),
(150, 'QG-0175', 12, 11, 6, '2023-11-24 08:05:00', 90, 826284, NULL, NULL),
(151, 'QG-0171', 12, 11, 6, '2023-11-24 13:45:00', 90, 1312717, NULL, NULL),
(152, 'QG-0179', 12, 11, 6, '2023-11-24 17:30:00', 90, 1312717, NULL, NULL),
(153, 'QG-0177', 12, 11, 6, '2023-11-24 09:00:00', 90, 1312717, NULL, NULL),
(154, 'GA-0305', 12, 10, 7, '2023-11-24 07:05:00', 95, 1536880, NULL, NULL),
(155, 'GA-0327', 12, 10, 7, '2023-11-24 11:35:00', 95, 1536880, NULL, NULL),
(156, 'GA-0317', 12, 10, 7, '2023-11-24 13:35:00', 95, 1536880, NULL, NULL),
(157, 'GA-0315', 12, 10, 7, '2023-11-24 16:30:00', 95, 1536880, NULL, NULL),
(158, 'GA-0325', 12, 10, 7, '2023-11-24 19:55:00', 95, 1536880, NULL, NULL),
(159, 'GA-0342', 12, 10, 7, '2023-11-24 09:15:00', 60, 2656180, NULL, NULL),
(160, 'GA-0342', 12, 10, 7, '2023-11-24 09:15:00', 60, 2656180, NULL, NULL),
(161, 'GA-0342', 12, 10, 7, '2023-11-24 09:15:00', 60, 2656180, NULL, NULL),
(162, 'GA-0342', 12, 10, 7, '2023-11-24 09:15:00', 60, 2656180, NULL, NULL),
(163, 'GA-0342', 12, 10, 7, '2023-11-24 09:15:00', 60, 2656180, NULL, NULL),
(164, 'JT-0591', 12, 10, 15, '2023-11-24 06:15:00', 85, 726331, NULL, NULL),
(165, 'JT-0573', 12, 10, 15, '2023-11-24 07:40:00', 85, 726331, NULL, NULL),
(166, 'JT-0693', 12, 10, 15, '2023-11-24 07:55:00', 85, 726331, NULL, NULL),
(167, 'JT-0697', 12, 10, 15, '2023-11-24 11:20:00', 85, 726331, NULL, NULL),
(168, 'JT-0749', 12, 10, 15, '2023-11-24 14:20:00', 90, 726331, NULL, NULL),
(169, 'JT-0581', 12, 10, 15, '2023-11-24 17:40:00', 90, 726331, NULL, NULL),
(170, 'JT-0786', 12, 10, 15, '2023-11-24 05:00:00', 90, 2705680, NULL, NULL),
(171, 'JT-0646', 12, 10, 15, '2023-11-24 05:55:00', 65, 1454080, NULL, NULL),
(172, 'IU-0706', 12, 10, 24, '2023-11-24 06:00:00', 55, 1227180, NULL, NULL),
(173, 'ID-7508', 12, 11, 4, '2023-11-24 05:00:00', 75, 829891, NULL, NULL),
(174, 'ID-7510', 12, 11, 4, '2023-11-24 07:45:00', 75, 765845, NULL, NULL),
(175, 'ID-7516', 12, 11, 4, '2023-11-24 10:45:00', 75, 1343152, NULL, NULL),
(176, 'ID-7514', 12, 11, 4, '2023-11-24 14:50:00', 75, 829891, NULL, NULL),
(177, 'ID-7512', 12, 11, 4, '2023-11-24 15:40:00', 75, 893837, NULL, NULL),
(178, 'ID-7518', 12, 11, 4, '2023-11-24 19:55:00', 75, 765845, NULL, NULL),
(179, 'JT-0990', 12, 10, 15, '2023-11-25 09:10:00', 55, 1257180, NULL, NULL),
(180, 'JT-0706', 12, 10, 15, '2023-11-25 10:25:00', 90, 2658080, NULL, NULL),
(181, 'JT-0882', 12, 10, 15, '2023-11-25 07:00:00', 90, 2658080, NULL, NULL),
(182, 'GA-0305', 12, 10, 7, '2023-11-25 07:05:00', 95, 1536880, NULL, NULL),
(183, 'GA-0327', 12, 10, 7, '2023-11-25 11:35:00', 95, 1536880, NULL, NULL),
(184, 'GA-0317', 12, 10, 7, '2023-11-25 13:35:00', 95, 1536880, NULL, NULL),
(185, 'GA-0449', 12, 10, 7, '2023-11-25 15:55:00', 95, 1536880, NULL, NULL),
(186, 'GA-0315', 12, 10, 7, '2023-11-25 16:30:00', 95, 1536880, NULL, NULL),
(187, 'QG-0173', 12, 11, 6, '2023-11-25 19:00:00', 90, 826284, NULL, NULL),
(188, 'QG-0175', 12, 11, 6, '2023-11-25 08:05:00', 90, 881063, NULL, NULL),
(189, 'QG-0177', 12, 11, 6, '2023-11-25 09:00:00', 90, 1312717, NULL, NULL),
(190, 'QG-0171', 12, 11, 6, '2023-11-25 13:45:00', 90, 1312717, NULL, NULL),
(191, 'JT-0591', 12, 10, 15, '2023-11-25 06:15:00', 85, 726331, NULL, NULL),
(192, 'JT-0573', 12, 10, 15, '2023-11-25 07:40:00', 85, 726331, NULL, NULL),
(193, 'JT-0693', 12, 10, 15, '2023-11-25 07:55:00', 85, 726331, NULL, NULL),
(194, 'JT-0697', 12, 10, 15, '2023-11-25 11:20:00', 85, 726331, NULL, NULL),
(195, 'JT-0749', 12, 10, 15, '2023-11-25 14:20:00', 90, 726331, NULL, NULL),
(196, 'JT-0581', 12, 10, 15, '2023-11-25 17:40:00', 90, 726331, NULL, NULL),
(197, 'JT-0786', 12, 10, 15, '2023-11-25 05:00:00', 90, 2705680, NULL, NULL),
(198, 'JT-0646', 12, 10, 15, '2023-11-25 05:55:00', 65, 1454080, NULL, NULL),
(199, 'ID-7508', 12, 11, 4, '2023-11-25 05:00:00', 75, 829891, NULL, NULL),
(200, 'ID-7510', 12, 11, 4, '2023-11-25 07:45:00', 75, 829891, NULL, NULL),
(201, 'ID-7516', 12, 11, 4, '2023-11-25 10:45:00', 75, 1343152, NULL, NULL),
(202, 'ID-7514', 12, 11, 4, '2023-11-25 14:50:00', 75, 829891, NULL, NULL),
(203, 'ID-7512', 12, 11, 4, '2023-11-25 15:40:00', 75, 893837, NULL, NULL),
(204, 'ID-7518', 12, 11, 4, '2023-11-25 19:55:00', 75, 829891, NULL, NULL),
(205, 'ID-6589', 12, 10, 4, '2023-11-25 05:00:00', 85, 833670, NULL, NULL),
(206, 'ID-6597', 12, 10, 4, '2023-11-25 07:10:00', 85, 833670, NULL, NULL),
(207, 'ID-6581', 12, 10, 4, '2023-11-25 09:10:00', 85, 833670, NULL, NULL),
(208, 'ID-6585', 12, 10, 4, '2023-11-25 10:10:00', 85, 833670, NULL, NULL),
(209, 'ID-6593', 12, 10, 4, '2023-11-25 11:10:00', 85, 833670, NULL, NULL),
(210, 'ID-6573', 12, 10, 4, '2023-11-25 14:10:00', 90, 833670, NULL, NULL),
(211, 'ID-6401', 12, 10, 4, '2023-11-25 15:10:00', 90, 833670, NULL, NULL),
(212, 'ID-6587', 12, 10, 4, '2023-11-25 16:10:00', 90, 833670, NULL, NULL),
(213, 'ID-7579', 12, 10, 4, '2023-11-25 17:10:00', 90, 833670, NULL, NULL),
(214, 'IU-0706', 12, 10, 24, '2023-11-25 06:00:00', 55, 1257180, NULL, NULL),
(215, 'IU-0333', 12, 10, 24, '2023-11-25 06:00:00', 85, 725966, NULL, NULL),
(216, 'IU-0331', 12, 10, 24, '2023-11-25 08:00:00', 85, 725966, NULL, NULL),
(217, 'IU-0343', 12, 10, 24, '2023-11-25 16:00:00', 90, 725966, NULL, NULL),
(218, 'IU-0341', 12, 10, 24, '2023-11-25 17:00:00', 90, 725966, NULL, NULL),
(219, 'IU-0706', 12, 10, 24, '2023-11-25 06:00:00', 55, 1158680, NULL, NULL),
(220, 'QG-0711', 12, 10, 6, '2023-11-25 17:45:00', 90, 1317538, NULL, NULL),
(221, 'QG-0717', 12, 10, 6, '2023-11-25 14:20:00', 90, 1317538, NULL, NULL),
(222, 'QG-0719', 12, 10, 6, '2023-11-25 19:30:00', 90, 1317538, NULL, NULL),
(223, 'QG-0737', 12, 10, 6, '2023-11-25 18:40:00', 90, 1317538, NULL, NULL),
(224, 'QG-0723', 12, 10, 6, '2023-11-25 10:10:00', 90, 1317538, NULL, NULL),
(225, 'QG-0713', 12, 10, 6, '2023-11-25 08:10:00', 90, 1317538, NULL, NULL),
(226, 'QG-0725', 12, 10, 6, '2023-11-25 06:00:00', 90, 1317538, NULL, NULL),
(227, 'QG-0715', 12, 10, 6, '2023-11-25 09:50:00', 90, 1317538, NULL, NULL),
(228, 'QG-0253', 12, 10, 6, '2023-11-25 09:10:00', 90, 1317538, NULL, NULL),
(229, 'IP-0201', 12, 10, 19, '2023-11-25 08:20:00', 95, 934000, NULL, NULL),
(230, 'IP-0205', 12, 10, 19, '2023-11-25 13:20:00', 95, 1134000, NULL, NULL),
(231, 'IP-0203', 12, 10, 19, '2023-11-25 19:50:00', 95, 834000, NULL, NULL),
(232, 'ID-6589', 12, 10, 4, '2023-11-26 05:00:00', 85, 833670, NULL, NULL),
(233, 'ID-6597', 12, 10, 4, '2023-11-26 07:10:00', 85, 833670, NULL, NULL),
(234, 'ID-6581', 12, 10, 4, '2023-11-26 09:10:00', 85, 833670, NULL, NULL),
(235, 'ID-6585', 12, 10, 4, '2023-11-26 10:10:00', 85, 833670, NULL, NULL),
(236, 'ID-6593', 12, 10, 4, '2023-11-26 11:10:00', 85, 833670, NULL, NULL),
(237, 'ID-6573', 12, 10, 4, '2023-11-26 14:10:00', 90, 833670, NULL, NULL),
(238, 'ID-6401', 12, 10, 4, '2023-11-26 15:10:00', 90, 833670, NULL, NULL),
(239, 'ID-6587', 12, 10, 4, '2023-11-26 16:10:00', 90, 833670, NULL, NULL),
(240, 'ID-7579', 12, 10, 4, '2023-11-26 17:10:00', 90, 833670, NULL, NULL),
(241, 'IU-0706', 12, 10, 24, '2023-11-26 06:00:00', 55, 1287080, NULL, NULL),
(242, 'IP-0201', 12, 10, 19, '2023-11-26 08:20:00', 95, 1034000, NULL, NULL),
(243, 'IP-0209', 12, 10, 19, '2023-11-26 15:10:00', 95, 834000, NULL, NULL),
(244, 'IP-0203', 12, 10, 19, '2023-11-26 19:50:00', 95, 834000, NULL, NULL),
(245, 'QG-0711', 12, 10, 6, '2023-11-26 17:45:00', 90, 1317538, NULL, NULL),
(246, 'QG-0717', 12, 10, 6, '2023-11-26 14:20:00', 90, 1317538, NULL, NULL),
(247, 'QG-0719', 12, 10, 6, '2023-11-26 19:30:00', 90, 1317538, NULL, NULL),
(248, 'QG-0737', 12, 10, 6, '2023-11-26 18:40:00', 90, 1317538, NULL, NULL),
(249, 'QG-0723', 12, 10, 6, '2023-11-26 10:10:00', 90, 1317538, NULL, NULL),
(250, 'QG-0713', 12, 10, 6, '2023-11-26 08:10:00', 90, 1317538, NULL, NULL),
(251, 'QG-0725', 12, 10, 6, '2023-11-26 06:00:00', 90, 1317538, NULL, NULL),
(252, 'QG-0715', 12, 10, 6, '2023-11-26 09:50:00', 90, 1317538, NULL, NULL),
(253, 'QG-0253', 12, 10, 6, '2023-11-26 09:10:00', 90, 1317538, NULL, NULL),
(254, 'IN-0192', 12, 10, 18, '2023-11-26 12:30:00', 70, 2631720, NULL, NULL),
(255, 'IU-0333', 12, 10, 24, '2023-11-26 06:00:00', 85, 725966, NULL, NULL),
(256, 'IU-0331', 12, 10, 24, '2023-11-26 08:00:00', 85, 725966, NULL, NULL),
(257, 'IU-0343', 12, 10, 24, '2023-11-26 16:00:00', 90, 725966, NULL, NULL),
(258, 'IU-0341', 12, 10, 24, '2023-11-26 17:00:00', 90, 725966, NULL, NULL),
(259, 'IU-0706', 12, 10, 24, '2023-11-26 06:00:00', 55, 1120980, NULL, NULL),
(260, 'JT-0990', 12, 10, 15, '2023-11-26 09:10:00', 55, 1317080, NULL, NULL),
(261, 'JT-0706', 12, 10, 15, '2023-11-26 10:25:00', 90, 2658080, NULL, NULL),
(262, 'JT-0882', 12, 10, 15, '2023-11-26 07:00:00', 90, 2658080, NULL, NULL),
(263, 'JT-0591', 12, 10, 15, '2023-11-26 06:15:00', 85, 726331, NULL, NULL),
(264, 'JT-0573', 12, 10, 15, '2023-11-26 07:40:00', 85, 726331, NULL, NULL),
(265, 'JT-0693', 12, 10, 15, '2023-11-26 07:55:00', 85, 726331, NULL, NULL),
(266, 'JT-0697', 12, 10, 15, '2023-11-26 11:20:00', 85, 726331, NULL, NULL),
(267, 'JT-0749', 12, 10, 15, '2023-11-26 14:20:00', 90, 726331, NULL, NULL),
(268, 'JT-0581', 12, 10, 15, '2023-11-26 17:40:00', 90, 726331, NULL, NULL),
(269, 'JT-0786', 12, 10, 15, '2023-11-26 05:00:00', 90, 2705680, NULL, NULL),
(270, 'JT-0646', 12, 10, 15, '2023-11-26 05:55:00', 65, 1454080, NULL, NULL),
(271, 'GA-0305', 12, 10, 7, '2023-11-26 07:05:00', 95, 1536880, NULL, NULL),
(272, 'GA-0327', 12, 10, 7, '2023-11-26 11:35:00', 95, 1536880, NULL, NULL),
(273, 'GA-0317', 12, 10, 7, '2023-11-26 13:35:00', 95, 1536880, NULL, NULL),
(274, 'GA-0315', 12, 10, 7, '2023-11-26 16:30:00', 95, 1536880, NULL, NULL),
(275, 'GA-0325', 12, 10, 7, '2023-11-26 18:40:00', 95, 1536880, NULL, NULL),
(276, 'GA-0342', 12, 10, 7, '2023-11-26 09:15:00', 60, 2656180, NULL, NULL),
(277, 'GA-0342', 12, 10, 7, '2023-11-26 09:15:00', 60, 2656180, NULL, NULL),
(278, 'GA-0342', 12, 10, 7, '2023-11-26 09:15:00', 60, 2656180, NULL, NULL),
(279, 'GA-0342', 12, 10, 7, '2023-11-26 09:15:00', 60, 2656180, NULL, NULL),
(280, 'GA-0342', 12, 10, 7, '2023-11-26 09:15:00', 60, 2656180, NULL, NULL),
(281, 'GA-0342', 12, 10, 7, '2023-11-26 09:15:00', 60, 2656180, NULL, NULL),
(282, 'QG-0173', 12, 11, 6, '2023-11-26 19:00:00', 90, 881063, NULL, NULL),
(283, 'QG-0175', 12, 11, 6, '2023-11-26 08:05:00', 90, 881063, NULL, NULL),
(284, 'QG-0177', 12, 11, 6, '2023-11-26 09:00:00', 90, 1312717, NULL, NULL),
(285, 'QG-0171', 12, 11, 6, '2023-11-26 13:45:00', 90, 1312717, NULL, NULL),
(286, 'ID-7508', 12, 11, 4, '2023-11-26 05:00:00', 75, 829891, NULL, NULL),
(287, 'ID-7510', 12, 11, 4, '2023-11-26 07:45:00', 75, 829891, NULL, NULL),
(288, 'ID-7516', 12, 11, 4, '2023-11-26 10:45:00', 75, 1343152, NULL, NULL),
(289, 'ID-7514', 12, 11, 4, '2023-11-26 14:50:00', 75, 829891, NULL, NULL),
(290, 'ID-7512', 12, 11, 4, '2023-11-26 15:40:00', 75, 893837, NULL, NULL),
(291, 'ID-7518', 12, 11, 4, '2023-11-26 19:55:00', 75, 829891, NULL, NULL),
(292, 'JT-0591', 12, 10, 15, '2023-11-27 06:15:00', 85, 726331, NULL, NULL),
(293, 'JT-0573', 12, 10, 15, '2023-11-27 07:40:00', 85, 726331, NULL, NULL),
(294, 'JT-0693', 12, 10, 15, '2023-11-27 07:55:00', 85, 726331, NULL, NULL),
(295, 'JT-0697', 12, 10, 15, '2023-11-27 11:20:00', 85, 726331, NULL, NULL),
(296, 'JT-0749', 12, 10, 15, '2023-11-27 14:20:00', 90, 726331, NULL, NULL),
(297, 'JT-0581', 12, 10, 15, '2023-11-27 17:40:00', 90, 726331, NULL, NULL),
(298, 'JT-0786', 12, 10, 15, '2023-11-27 05:00:00', 90, 2705680, NULL, NULL),
(299, 'JT-0646', 12, 10, 15, '2023-11-27 05:55:00', 65, 1454080, NULL, NULL),
(300, 'QG-0173', 12, 11, 6, '2023-11-27 19:00:00', 90, 826284, NULL, NULL),
(301, 'QG-0175', 12, 11, 6, '2023-11-27 08:05:00', 90, 934746, NULL, NULL),
(302, 'QG-0171', 12, 11, 6, '2023-11-27 13:45:00', 90, 1312717, NULL, NULL),
(303, 'QG-0179', 12, 11, 6, '2023-11-27 17:30:00', 90, 1312717, NULL, NULL),
(304, 'QG-0177', 12, 11, 6, '2023-11-27 09:00:00', 90, 1312717, NULL, NULL),
(305, 'JT-0990', 12, 10, 15, '2023-11-27 09:10:00', 55, 1257180, NULL, NULL),
(306, 'JT-0706', 12, 10, 15, '2023-11-27 10:25:00', 90, 2658080, NULL, NULL),
(307, 'JT-0882', 12, 10, 15, '2023-11-27 07:00:00', 90, 2658080, NULL, NULL),
(308, 'GA-0305', 12, 10, 7, '2023-11-27 07:05:00', 95, 1536880, NULL, NULL),
(309, 'GA-0327', 12, 10, 7, '2023-11-27 11:35:00', 95, 1536880, NULL, NULL),
(310, 'GA-0317', 12, 10, 7, '2023-11-27 13:35:00', 95, 1536880, NULL, NULL),
(311, 'GA-0449', 12, 10, 7, '2023-11-27 15:55:00', 95, 1536880, NULL, NULL),
(312, 'GA-0315', 12, 10, 7, '2023-11-27 16:30:00', 95, 1536880, NULL, NULL),
(313, 'GA-0325', 12, 10, 7, '2023-11-27 18:40:00', 95, 1536880, NULL, NULL),
(314, 'GA-0342', 12, 10, 7, '2023-11-27 09:15:00', 60, 2656180, NULL, NULL),
(315, 'GA-0342', 12, 10, 7, '2023-11-27 09:15:00', 60, 2656180, NULL, NULL),
(316, 'GA-0342', 12, 10, 7, '2023-11-27 09:15:00', 60, 2656180, NULL, NULL),
(317, 'GA-0342', 12, 10, 7, '2023-11-27 09:15:00', 60, 2656180, NULL, NULL),
(318, 'GA-0342', 12, 10, 7, '2023-11-27 09:15:00', 60, 2656180, NULL, NULL),
(319, 'GA-0342', 12, 10, 7, '2023-11-27 09:15:00', 60, 2656180, NULL, NULL),
(320, 'GA-0342', 12, 10, 7, '2023-11-27 09:15:00', 60, 2656180, NULL, NULL),
(321, 'ID-7508', 12, 11, 4, '2023-11-27 05:00:00', 75, 829891, NULL, NULL),
(322, 'ID-7510', 12, 11, 4, '2023-11-27 07:45:00', 75, 829891, NULL, NULL),
(323, 'ID-7516', 12, 11, 4, '2023-11-27 10:45:00', 75, 1343152, NULL, NULL),
(324, 'ID-7514', 12, 11, 4, '2023-11-27 14:50:00', 75, 829891, NULL, NULL),
(325, 'ID-7512', 12, 11, 4, '2023-11-27 15:40:00', 75, 893837, NULL, NULL),
(326, 'ID-7518', 12, 11, 4, '2023-11-27 19:55:00', 75, 829891, NULL, NULL),
(327, 'IU-0706', 12, 10, 24, '2023-11-27 06:00:00', 55, 1227180, NULL, NULL),
(328, 'QG-0711', 12, 10, 6, '2023-11-27 17:45:00', 90, 1317538, NULL, NULL),
(329, 'QG-0737', 12, 10, 6, '2023-11-27 18:40:00', 90, 1317538, NULL, NULL),
(330, 'QG-0719', 12, 10, 6, '2023-11-27 19:30:00', 90, 1317538, NULL, NULL),
(331, 'QG-0717', 12, 10, 6, '2023-11-27 14:20:00', 90, 1317538, NULL, NULL),
(332, 'QG-0713', 12, 10, 6, '2023-11-27 08:10:00', 90, 1317538, NULL, NULL),
(333, 'QG-0253', 12, 10, 6, '2023-11-27 09:10:00', 90, 1317538, NULL, NULL),
(334, 'QG-0715', 12, 10, 6, '2023-11-27 09:50:00', 90, 1317538, NULL, NULL),
(335, 'IU-0333', 12, 10, 24, '2023-11-27 06:00:00', 85, 725966, NULL, NULL),
(336, 'IU-0331', 12, 10, 24, '2023-11-27 08:00:00', 85, 725966, NULL, NULL),
(337, 'IU-0343', 12, 10, 24, '2023-11-27 16:00:00', 90, 725966, NULL, NULL),
(338, 'IU-0341', 12, 10, 24, '2023-11-27 17:00:00', 90, 725966, NULL, NULL),
(339, 'IU-0706', 12, 10, 24, '2023-11-27 06:00:00', 55, 1060980, NULL, NULL),
(340, 'ID-6589', 12, 10, 4, '2023-11-27 05:00:00', 85, 833670, NULL, NULL),
(341, 'ID-6597', 12, 10, 4, '2023-11-27 07:10:00', 85, 833670, NULL, NULL),
(342, 'ID-6581', 12, 10, 4, '2023-11-27 09:10:00', 85, 833670, NULL, NULL),
(343, 'ID-6585', 12, 10, 4, '2023-11-27 10:10:00', 85, 833670, NULL, NULL),
(344, 'ID-6593', 12, 10, 4, '2023-11-27 11:10:00', 85, 833670, NULL, NULL),
(345, 'ID-6573', 12, 10, 4, '2023-11-27 14:10:00', 90, 833670, NULL, NULL),
(346, 'ID-6401', 12, 10, 4, '2023-11-27 15:10:00', 90, 833670, NULL, NULL),
(347, 'ID-6587', 12, 10, 4, '2023-11-27 16:10:00', 90, 833670, NULL, NULL),
(348, 'ID-7579', 12, 10, 4, '2023-11-27 17:10:00', 90, 833670, NULL, NULL),
(349, 'IP-0205', 12, 10, 19, '2023-11-27 13:20:00', 95, 1034000, NULL, NULL),
(350, 'IP-0203', 12, 10, 19, '2023-11-27 19:50:00', 95, 734000, NULL, NULL),
(351, 'IU-0706', 12, 10, 24, '2023-11-28 06:00:00', 55, 1697780, NULL, NULL),
(352, 'IU-0333', 12, 10, 24, '2023-11-28 06:00:00', 85, 725966, NULL, NULL),
(353, 'IU-0331', 12, 10, 24, '2023-11-28 08:00:00', 85, 725966, NULL, NULL),
(354, 'IU-0343', 12, 10, 24, '2023-11-28 16:00:00', 90, 725966, NULL, NULL),
(355, 'IU-0341', 12, 10, 24, '2023-11-28 17:00:00', 90, 725966, NULL, NULL),
(356, 'IU-0706', 12, 10, 24, '2023-11-28 06:00:00', 55, 1262980, NULL, NULL),
(357, 'IN-0192', 12, 10, 18, '2023-11-28 12:30:00', 70, 2631720, NULL, NULL),
(358, 'QG-0711', 12, 10, 6, '2023-11-28 17:45:00', 90, 1317538, NULL, NULL),
(359, 'QG-0717', 12, 10, 6, '2023-11-28 14:20:00', 90, 1317538, NULL, NULL),
(360, 'QG-0719', 12, 10, 6, '2023-11-28 19:30:00', 90, 1317538, NULL, NULL),
(361, 'QG-0737', 12, 10, 6, '2023-11-28 18:40:00', 90, 1317538, NULL, NULL),
(362, 'QG-0723', 12, 10, 6, '2023-11-28 10:10:00', 90, 1317538, NULL, NULL),
(363, 'QG-0713', 12, 10, 6, '2023-11-28 08:10:00', 90, 1317538, NULL, NULL),
(364, 'QG-0725', 12, 10, 6, '2023-11-28 06:00:00', 90, 1317538, NULL, NULL),
(365, 'QG-0715', 12, 10, 6, '2023-11-28 09:50:00', 90, 1317538, NULL, NULL),
(366, 'QG-0253', 12, 10, 6, '2023-11-28 09:10:00', 90, 1317538, NULL, NULL),
(367, 'IP-0201', 12, 10, 19, '2023-11-28 08:20:00', 95, 734000, NULL, NULL),
(368, 'IP-0209', 12, 10, 19, '2023-11-28 15:10:00', 95, 834000, NULL, NULL),
(369, 'IP-0203', 12, 10, 19, '2023-11-28 19:50:00', 95, 834000, NULL, NULL),
(370, 'ID-6589', 12, 10, 4, '2023-11-28 05:00:00', 85, 833670, NULL, NULL),
(371, 'ID-6597', 12, 10, 4, '2023-11-28 07:10:00', 85, 833670, NULL, NULL),
(372, 'ID-6581', 12, 10, 4, '2023-11-28 09:10:00', 85, 833670, NULL, NULL),
(373, 'ID-6585', 12, 10, 4, '2023-11-28 10:10:00', 85, 833670, NULL, NULL),
(374, 'ID-6593', 12, 10, 4, '2023-11-28 11:10:00', 85, 833670, NULL, NULL),
(375, 'ID-6573', 12, 10, 4, '2023-11-28 14:10:00', 90, 833670, NULL, NULL),
(376, 'ID-6401', 12, 10, 4, '2023-11-28 15:10:00', 90, 833670, NULL, NULL),
(377, 'ID-6587', 12, 10, 4, '2023-11-28 16:10:00', 90, 833670, NULL, NULL),
(378, 'ID-7579', 12, 10, 4, '2023-11-28 17:10:00', 90, 833670, NULL, NULL),
(379, 'JT-0591', 12, 10, 15, '2023-11-28 06:15:00', 85, 726331, NULL, NULL),
(380, 'JT-0573', 12, 10, 15, '2023-11-28 07:40:00', 85, 726331, NULL, NULL),
(381, 'JT-0693', 12, 10, 15, '2023-11-28 07:55:00', 85, 726331, NULL, NULL),
(382, 'JT-0697', 12, 10, 15, '2023-11-28 11:20:00', 85, 726331, NULL, NULL),
(383, 'JT-0749', 12, 10, 15, '2023-11-28 14:20:00', 90, 726331, NULL, NULL),
(384, 'JT-0581', 12, 10, 15, '2023-11-28 17:40:00', 90, 726331, NULL, NULL),
(385, 'JT-0786', 12, 10, 15, '2023-11-28 05:00:00', 90, 2705680, NULL, NULL),
(386, 'JT-0646', 12, 10, 15, '2023-11-28 05:55:00', 65, 1454080, NULL, NULL),
(387, 'GA-0305', 12, 10, 7, '2023-11-28 07:05:00', 95, 1536880, NULL, NULL),
(388, 'GA-0327', 12, 10, 7, '2023-11-28 11:35:00', 95, 1536880, NULL, NULL),
(389, 'GA-0317', 12, 10, 7, '2023-11-28 13:35:00', 95, 1536880, NULL, NULL),
(390, 'GA-0315', 12, 10, 7, '2023-11-28 16:30:00', 95, 1536880, NULL, NULL),
(391, 'GA-0325', 12, 10, 7, '2023-11-28 18:40:00', 95, 1536880, NULL, NULL),
(392, 'GA-0342', 12, 10, 7, '2023-11-28 09:15:00', 60, 2656180, NULL, NULL),
(393, 'GA-0342', 12, 10, 7, '2023-11-28 09:15:00', 60, 2656180, NULL, NULL),
(394, 'GA-0342', 12, 10, 7, '2023-11-28 09:15:00', 60, 2656180, NULL, NULL),
(395, 'GA-0342', 12, 10, 7, '2023-11-28 09:15:00', 60, 2656180, NULL, NULL),
(396, 'GA-0342', 12, 10, 7, '2023-11-28 09:15:00', 60, 2656180, NULL, NULL),
(397, 'GA-0342', 12, 10, 7, '2023-11-28 09:15:00', 60, 2656180, NULL, NULL),
(398, 'GA-0342', 12, 10, 7, '2023-11-28 09:15:00', 60, 2656180, NULL, NULL),
(399, 'GA-0342', 12, 10, 7, '2023-11-28 09:15:00', 60, 2656180, NULL, NULL),
(400, 'GA-0342', 12, 10, 7, '2023-11-28 09:15:00', 60, 2656180, NULL, NULL),
(401, 'QG-0175', 12, 11, 6, '2023-11-28 08:05:00', 90, 881063, NULL, NULL),
(402, 'QG-0173', 12, 11, 6, '2023-11-28 19:00:00', 90, 1096890, NULL, NULL),
(403, 'QG-0177', 12, 11, 6, '2023-11-28 09:00:00', 90, 1312717, NULL, NULL),
(404, 'QG-0171', 12, 11, 6, '2023-11-28 13:45:00', 90, 1312717, NULL, NULL),
(405, 'JT-0990', 12, 10, 15, '2023-11-28 09:10:00', 55, 1727780, NULL, NULL),
(406, 'JT-0706', 12, 10, 15, '2023-11-28 10:25:00', 90, 2658080, NULL, NULL),
(407, 'JT-0882', 12, 10, 15, '2023-11-28 07:00:00', 90, 2658080, NULL, NULL),
(408, 'ID-7508', 12, 11, 4, '2023-11-28 05:00:00', 75, 829891, NULL, NULL),
(409, 'ID-7510', 12, 11, 4, '2023-11-28 07:45:00', 75, 829891, NULL, NULL),
(410, 'ID-7516', 12, 11, 4, '2023-11-28 10:45:00', 75, 1343152, NULL, NULL),
(411, 'ID-7514', 12, 11, 4, '2023-11-28 14:50:00', 75, 829891, NULL, NULL),
(412, 'ID-7512', 12, 11, 4, '2023-11-28 15:40:00', 75, 893837, NULL, NULL),
(413, 'ID-7518', 12, 11, 4, '2023-11-28 19:55:00', 75, 829891, NULL, NULL),
(414, 'JT-0591', 12, 10, 15, '2023-11-29 06:15:00', 85, 726331, NULL, NULL),
(415, 'JT-0573', 12, 10, 15, '2023-11-29 07:40:00', 85, 726331, NULL, NULL),
(416, 'JT-0693', 12, 10, 15, '2023-11-29 07:55:00', 85, 726331, NULL, NULL),
(417, 'JT-0697', 12, 10, 15, '2023-11-29 11:20:00', 85, 726331, NULL, NULL),
(418, 'JT-0749', 12, 10, 15, '2023-11-29 14:20:00', 90, 726331, NULL, NULL),
(419, 'JT-0581', 12, 10, 15, '2023-11-29 17:40:00', 90, 726331, NULL, NULL),
(420, 'JT-0786', 12, 10, 15, '2023-11-29 05:00:00', 90, 2705680, NULL, NULL),
(421, 'JT-0646', 12, 10, 15, '2023-11-29 05:55:00', 65, 1454080, NULL, NULL),
(422, 'QG-0173', 12, 11, 6, '2023-11-29 19:00:00', 90, 772601, NULL, NULL),
(423, 'QG-0175', 12, 11, 6, '2023-11-29 08:05:00', 90, 881063, NULL, NULL),
(424, 'QG-0171', 12, 11, 6, '2023-11-29 13:45:00', 90, 1312717, NULL, NULL),
(425, 'QG-0179', 12, 11, 6, '2023-11-29 17:30:00', 90, 1312717, NULL, NULL),
(426, 'QG-0177', 12, 11, 6, '2023-11-29 09:00:00', 90, 1312717, NULL, NULL),
(427, 'JT-0990', 12, 10, 15, '2023-11-29 09:10:00', 55, 1257180, NULL, NULL),
(428, 'JT-0706', 12, 10, 15, '2023-11-29 10:25:00', 90, 2658080, NULL, NULL),
(429, 'JT-0882', 12, 10, 15, '2023-11-29 07:00:00', 90, 2658080, NULL, NULL),
(430, 'GA-0305', 12, 10, 7, '2023-11-29 07:05:00', 95, 1536880, NULL, NULL),
(431, 'GA-0311', 12, 10, 7, '2023-11-29 09:30:00', 90, 1536880, NULL, NULL),
(432, 'GA-0327', 12, 10, 7, '2023-11-29 11:35:00', 95, 1536880, NULL, NULL),
(433, 'GA-0317', 12, 10, 7, '2023-11-29 13:35:00', 95, 1536880, NULL, NULL),
(434, 'GA-0315', 12, 10, 7, '2023-11-29 16:30:00', 95, 1536880, NULL, NULL),
(435, 'GA-0325', 12, 10, 7, '2023-11-29 18:40:00', 95, 1536880, NULL, NULL),
(436, 'IN-0192', 12, 10, 18, '2023-11-29 12:30:00', 70, 2631720, NULL, NULL),
(437, 'ID-7508', 12, 11, 4, '2023-11-29 05:00:00', 75, 829891, NULL, NULL),
(438, 'ID-7510', 12, 11, 4, '2023-11-29 07:45:00', 75, 829891, NULL, NULL),
(439, 'ID-7516', 12, 11, 4, '2023-11-29 10:45:00', 75, 1343152, NULL, NULL),
(440, 'ID-7514', 12, 11, 4, '2023-11-29 14:50:00', 75, 829891, NULL, NULL),
(441, 'ID-7512', 12, 11, 4, '2023-11-29 15:40:00', 75, 893837, NULL, NULL),
(442, 'ID-7518', 12, 11, 4, '2023-11-29 19:55:00', 75, 829891, NULL, NULL),
(443, 'IU-0333', 12, 10, 24, '2023-11-29 06:00:00', 85, 725966, NULL, NULL),
(444, 'IU-0331', 12, 10, 24, '2023-11-29 08:00:00', 85, 725966, NULL, NULL),
(445, 'IU-0343', 12, 10, 24, '2023-11-29 16:00:00', 90, 725966, NULL, NULL),
(446, 'IU-0341', 12, 10, 24, '2023-11-29 17:00:00', 90, 725966, NULL, NULL),
(447, 'IU-0706', 12, 10, 24, '2023-11-29 06:00:00', 55, 1060980, NULL, NULL),
(448, 'IU-0706', 12, 10, 24, '2023-11-29 06:00:00', 55, 1227180, NULL, NULL),
(449, 'QG-0711', 12, 10, 6, '2023-11-29 17:45:00', 90, 1317538, NULL, NULL),
(450, 'QG-0717', 12, 10, 6, '2023-11-29 14:20:00', 90, 1317538, NULL, NULL),
(451, 'QG-0719', 12, 10, 6, '2023-11-29 19:30:00', 90, 1317538, NULL, NULL),
(452, 'QG-0737', 12, 10, 6, '2023-11-29 18:40:00', 90, 1317538, NULL, NULL),
(453, 'QG-0723', 12, 10, 6, '2023-11-29 10:10:00', 90, 1317538, NULL, NULL),
(454, 'QG-0713', 12, 10, 6, '2023-11-29 08:10:00', 90, 1317538, NULL, NULL),
(455, 'QG-0725', 12, 10, 6, '2023-11-29 06:00:00', 90, 1317538, NULL, NULL),
(456, 'QG-0715', 12, 10, 6, '2023-11-29 09:50:00', 90, 1317538, NULL, NULL),
(457, 'QG-0253', 12, 10, 6, '2023-11-29 09:10:00', 90, 1317538, NULL, NULL),
(458, 'ID-6589', 12, 10, 4, '2023-11-29 05:00:00', 85, 833670, NULL, NULL),
(459, 'ID-6597', 12, 10, 4, '2023-11-29 07:10:00', 85, 833670, NULL, NULL),
(460, 'ID-6581', 12, 10, 4, '2023-11-29 09:10:00', 85, 833670, NULL, NULL),
(461, 'ID-6585', 12, 10, 4, '2023-11-29 10:10:00', 85, 833670, NULL, NULL),
(462, 'ID-6593', 12, 10, 4, '2023-11-29 11:10:00', 85, 833670, NULL, NULL),
(463, 'ID-6573', 12, 10, 4, '2023-11-29 14:10:00', 90, 833670, NULL, NULL),
(464, 'ID-6401', 12, 10, 4, '2023-11-29 15:10:00', 90, 833670, NULL, NULL),
(465, 'ID-6587', 12, 10, 4, '2023-11-29 16:10:00', 90, 833670, NULL, NULL),
(466, 'ID-7579', 12, 10, 4, '2023-11-29 17:10:00', 90, 833670, NULL, NULL),
(467, 'IP-0201', 12, 10, 19, '2023-11-29 08:20:00', 95, 734000, NULL, NULL),
(468, 'IP-0205', 12, 10, 19, '2023-11-29 13:20:00', 95, 1034000, NULL, NULL),
(469, 'IP-0209', 12, 10, 19, '2023-11-29 15:10:00', 95, 634000, NULL, NULL),
(470, 'IP-0203', 12, 10, 19, '2023-11-29 19:50:00', 95, 684000, NULL, NULL),
(471, 'JT-0990', 12, 10, 15, '2023-11-30 09:10:00', 55, 1257180, NULL, NULL),
(472, 'JT-0706', 12, 10, 15, '2023-11-30 10:25:00', 90, 2658080, NULL, NULL),
(473, 'JT-0882', 12, 10, 15, '2023-11-30 07:00:00', 90, 2658080, NULL, NULL),
(474, 'JT-0591', 12, 10, 15, '2023-11-30 06:15:00', 85, 726331, NULL, NULL),
(475, 'JT-0573', 12, 10, 15, '2023-11-30 07:40:00', 85, 726331, NULL, NULL),
(476, 'JT-0693', 12, 10, 15, '2023-11-30 07:55:00', 85, 726331, NULL, NULL),
(477, 'JT-0697', 12, 10, 15, '2023-11-30 11:20:00', 85, 726331, NULL, NULL),
(478, 'JT-0749', 12, 10, 15, '2023-11-30 14:20:00', 90, 726331, NULL, NULL),
(479, 'JT-0581', 12, 10, 15, '2023-11-30 17:40:00', 90, 726331, NULL, NULL),
(480, 'JT-0786', 12, 10, 15, '2023-11-30 05:00:00', 90, 2705680, NULL, NULL),
(481, 'JT-0646', 12, 10, 15, '2023-11-30 05:55:00', 65, 1454080, NULL, NULL),
(482, 'QG-0173', 12, 11, 6, '2023-11-30 19:00:00', 90, 772601, NULL, NULL),
(483, 'QG-0175', 12, 11, 6, '2023-11-30 08:05:00', 90, 772601, NULL, NULL),
(484, 'QG-0171', 12, 11, 6, '2023-11-30 13:45:00', 90, 1312717, NULL, NULL),
(485, 'QG-0179', 12, 11, 6, '2023-11-30 17:30:00', 90, 1312717, NULL, NULL),
(486, 'QG-0177', 12, 11, 6, '2023-11-30 09:00:00', 90, 1312717, NULL, NULL),
(487, 'GA-0305', 12, 10, 7, '2023-11-30 07:05:00', 95, 1536880, NULL, NULL),
(488, 'GA-0317', 12, 10, 7, '2023-11-30 13:35:00', 95, 1536880, NULL, NULL),
(489, 'GA-0449', 12, 10, 7, '2023-11-30 15:55:00', 95, 1536880, NULL, NULL),
(490, 'GA-0325', 12, 10, 7, '2023-11-30 18:40:00', 95, 1536880, NULL, NULL),
(491, 'GA-0342', 12, 10, 7, '2023-11-30 09:15:00', 60, 2656180, NULL, NULL),
(492, 'GA-0342', 12, 10, 7, '2023-11-30 09:15:00', 60, 2656180, NULL, NULL),
(493, 'GA-0342', 12, 10, 7, '2023-11-30 09:15:00', 60, 2656180, NULL, NULL),
(494, 'GA-0342', 12, 10, 7, '2023-11-30 09:15:00', 60, 2656180, NULL, NULL),
(495, 'GA-0342', 12, 10, 7, '2023-11-30 09:15:00', 60, 2656180, NULL, NULL),
(496, 'GA-0342', 12, 10, 7, '2023-11-30 09:15:00', 60, 2656180, NULL, NULL),
(497, 'IP-0201', 12, 10, 19, '2023-11-30 08:20:00', 95, 734000, NULL, NULL),
(498, 'IP-0205', 12, 10, 19, '2023-11-30 13:20:00', 95, 1034000, NULL, NULL),
(499, 'IP-0203', 12, 10, 19, '2023-11-30 19:50:00', 95, 684000, NULL, NULL),
(500, 'IU-0333', 12, 10, 24, '2023-11-30 06:00:00', 85, 725966, NULL, NULL),
(501, 'IU-0331', 12, 10, 24, '2023-11-30 08:00:00', 85, 725966, NULL, NULL),
(502, 'IU-0343', 12, 10, 24, '2023-11-30 16:00:00', 90, 725966, NULL, NULL),
(503, 'IU-0341', 12, 10, 24, '2023-11-30 17:00:00', 90, 725966, NULL, NULL),
(504, 'IU-0706', 12, 10, 24, '2023-11-30 06:00:00', 55, 1060980, NULL, NULL),
(505, 'QG-0711', 12, 10, 6, '2023-11-30 17:45:00', 90, 1317538, NULL, NULL),
(506, 'QG-0717', 12, 10, 6, '2023-11-30 14:20:00', 90, 1317538, NULL, NULL),
(507, 'QG-0719', 12, 10, 6, '2023-11-30 19:30:00', 90, 1317538, NULL, NULL),
(508, 'QG-0737', 12, 10, 6, '2023-11-30 18:40:00', 90, 1317538, NULL, NULL),
(509, 'QG-0723', 12, 10, 6, '2023-11-30 11:10:00', 90, 1317538, NULL, NULL),
(510, 'QG-0713', 12, 10, 6, '2023-11-30 08:10:00', 90, 1317538, NULL, NULL),
(511, 'QG-0725', 12, 10, 6, '2023-11-30 06:00:00', 90, 1317538, NULL, NULL),
(512, 'QG-0715', 12, 10, 6, '2023-11-30 09:50:00', 90, 1317538, NULL, NULL),
(513, 'QG-0253', 12, 10, 6, '2023-11-30 09:10:00', 90, 1317538, NULL, NULL),
(514, 'ID-6589', 12, 10, 4, '2023-11-30 05:00:00', 85, 833670, NULL, NULL),
(515, 'ID-6597', 12, 10, 4, '2023-11-30 07:10:00', 85, 833670, NULL, NULL),
(516, 'ID-6581', 12, 10, 4, '2023-11-30 09:10:00', 85, 833670, NULL, NULL),
(517, 'ID-6585', 12, 10, 4, '2023-11-30 10:10:00', 85, 833670, NULL, NULL),
(518, 'ID-6593', 12, 10, 4, '2023-11-30 11:10:00', 85, 833670, NULL, NULL),
(519, 'ID-6573', 12, 10, 4, '2023-11-30 14:10:00', 90, 833670, NULL, NULL),
(520, 'ID-6401', 12, 10, 4, '2023-11-30 15:10:00', 90, 833670, NULL, NULL),
(521, 'ID-6587', 12, 10, 4, '2023-11-30 16:10:00', 90, 833670, NULL, NULL),
(522, 'ID-7579', 12, 10, 4, '2023-11-30 17:10:00', 90, 833670, NULL, NULL),
(523, 'IU-0706', 12, 10, 24, '2023-11-30 06:00:00', 55, 1227180, NULL, NULL),
(524, 'ID-7508', 12, 11, 4, '2023-11-30 05:00:00', 75, 829891, NULL, NULL),
(525, 'ID-7510', 12, 11, 4, '2023-11-30 07:45:00', 75, 765845, NULL, NULL),
(526, 'ID-7516', 12, 11, 4, '2023-11-30 10:45:00', 75, 1343152, NULL, NULL),
(527, 'ID-7514', 12, 11, 4, '2023-11-30 14:50:00', 75, 829891, NULL, NULL),
(528, 'ID-7512', 12, 11, 4, '2023-11-30 15:40:00', 75, 893837, NULL, NULL),
(529, 'ID-7518', 12, 11, 4, '2023-11-30 19:55:00', 75, 829891, NULL, NULL),
(530, 'UI-1212', 12, 10, 4, '2023-11-22 12:00:00', 90, 22222, '2023-11-06 01:08:48', '2023-11-06 06:53:05'),
(531, 'NI-0101', 153, 15, 2, '2023-11-21 12:00:00', 20, 111111, '2023-11-07 01:16:01', '2023-11-07 01:17:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kode_promos`
--

CREATE TABLE `kode_promos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Kode` varchar(255) NOT NULL,
  `PresentaseDiskon` int(11) NOT NULL,
  `MaksimumDiskon` int(11) NOT NULL,
  `BerlakuSampai` varchar(255) NOT NULL,
  `Deskripsi` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kode_promos`
--

INSERT INTO `kode_promos` (`id`, `Kode`, `PresentaseDiskon`, `MaksimumDiskon`, `BerlakuSampai`, `Deskripsi`, `created_at`, `updated_at`) VALUES
(1, 'BROMOAJAYUK', 15, 200000, '2023-12-01', 'Yuk pakai diskon ini', NULL, '2023-11-06 01:58:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `maskapais`
--

CREATE TABLE `maskapais` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Nama` varchar(255) NOT NULL,
  `Perusahaan` varchar(255) NOT NULL,
  `JumlahKru` int(11) NOT NULL,
  `Deskripsi` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `maskapais`
--

INSERT INTO `maskapais` (`id`, `Nama`, `Perusahaan`, `JumlahKru`, `Deskripsi`, `created_at`, `updated_at`) VALUES
(1, 'Adam Air', 'PT Adam Air', 16, 'Adam Air adalah salah satu maskapai penerbangan terbaik di Indonesia!!', NULL, '2023-11-06 02:03:00'),
(2, 'Aviastar', 'PT Aviastar', 12, 'Aviastar adalah salah satu maskapai penerbangan terbaik di Indonesia', NULL, NULL),
(3, 'Batavia Air', 'PT Batavia Air', 6, 'Batavia Air adalah salah satu maskapai penerbangan terbaik di Indonesia', NULL, NULL),
(4, 'Batik Air', 'PT Batik Air', 17, 'Batik Air adalah salah satu maskapai penerbangan terbaik di Indonesia', NULL, NULL),
(5, 'Bouraq Indonesia Airlines', 'PT Bouraq Indonesia Airlines', 19, 'Bouraq Indonesia Airlines adalah salah satu maskapai penerbangan terbaik di Indonesia', NULL, NULL),
(6, 'Citilink', 'PT Citilink', 12, 'Citilink adalah salah satu maskapai penerbangan terbaik di Indonesia', NULL, NULL),
(7, 'Garuda Indonesia', 'PT Garuda Indonesia', 5, 'Garuda Indonesia adalah salah satu maskapai penerbangan terbaik di Indonesia', NULL, NULL),
(8, 'Indonesia AirAsia', 'PT Indonesia AirAsia', 17, 'Indonesia AirAsia adalah salah satu maskapai penerbangan terbaik di Indonesia', NULL, NULL),
(9, 'Indonesia AirAsia X', 'PT Indonesia AirAsia X', 16, 'Indonesia AirAsia X adalah salah satu maskapai penerbangan terbaik di Indonesia', NULL, NULL),
(10, 'Indonesia Airlines', 'PT Indonesia Airlines', 10, 'Indonesia Airlines adalah salah satu maskapai penerbangan terbaik di Indonesia', NULL, NULL),
(11, 'Indonesia Metro Aviation', 'PT Indonesia Metro Aviation', 10, 'Indonesia Metro Aviation adalah salah satu maskapai penerbangan terbaik di Indonesia', NULL, NULL),
(12, 'Jatayu Airlines', 'PT Jatayu Airlines', 11, 'Jatayu Airlines adalah salah satu maskapai penerbangan terbaik di Indonesia', NULL, NULL),
(13, 'Kalstar Aviation', 'PT Kalstar Aviation', 13, 'Kalstar Aviation adalah salah satu maskapai penerbangan terbaik di Indonesia', NULL, NULL),
(14, 'Kartika Airlines', 'PT Kartika Airlines', 5, 'Kartika Airlines adalah salah satu maskapai penerbangan terbaik di Indonesia', NULL, NULL),
(15, 'Lion Air', 'PT Lion Air', 11, 'Lion Air adalah salah satu maskapai penerbangan terbaik di Indonesia', NULL, NULL),
(16, 'Mandala Tigerair', 'PT Mandala Tigerair', 11, 'Mandala Tigerair adalah salah satu maskapai penerbangan terbaik di Indonesia', NULL, NULL),
(17, 'Merpati Nusantara Airlines', 'PT Merpati Nusantara Airlines', 5, 'Merpati Nusantara Airlines adalah salah satu maskapai penerbangan terbaik di Indonesia', NULL, NULL),
(18, 'NAM Air', 'PT NAM Air', 14, 'NAM Air adalah salah satu maskapai penerbangan terbaik di Indonesia', NULL, NULL),
(19, 'Pelita Air Service', 'PT Pelita Air Service', 15, 'Pelita Air Service adalah salah satu maskapai penerbangan terbaik di Indonesia', NULL, NULL),
(20, 'Sky Aviation', 'PT Sky Aviation', 14, 'Sky Aviation adalah salah satu maskapai penerbangan terbaik di Indonesia', NULL, NULL),
(21, 'Sempati Air', 'PT Sempati Air', 7, 'Sempati Air adalah salah satu maskapai penerbangan terbaik di Indonesia', NULL, NULL),
(22, 'Sriwijaya Air', 'PT Sriwijaya Air', 7, 'Sriwijaya Air adalah salah satu maskapai penerbangan terbaik di Indonesia', NULL, NULL),
(23, 'Star Air', 'PT Star Air', 11, 'Star Air adalah salah satu maskapai penerbangan terbaik di Indonesia', NULL, NULL),
(24, 'Super Air Jet', 'PT Super Air Jet', 12, 'Super Air Jet adalah salah satu maskapai penerbangan terbaik di Indonesia', NULL, NULL),
(25, 'Susi Air', 'PT Susi Air', 18, 'Susi Air adalah salah satu maskapai penerbangan terbaik di Indonesia', NULL, NULL),
(26, 'TransNusa', 'PT TransNusa', 9, 'TransNusa adalah salah satu maskapai penerbangan terbaik di Indonesia', NULL, NULL),
(27, 'Trigana Air', 'PT Trigana Air', 16, 'Trigana Air adalah salah satu maskapai penerbangan terbaik di Indonesia', NULL, NULL),
(28, 'Wings Air', 'PT Wings Air', 18, 'Wings Air adalah salah satu maskapai penerbangan terbaik di Indonesia', NULL, NULL),
(29, 'Xpress Air', 'PT Xpress Air', 13, 'Xpress Air adalah salah satu maskapai penerbangan terbaik di Indonesia', NULL, NULL),
(30, 'didin', 'pt didin', 31, 'Maskapai Cepat', '2023-10-25 02:40:38', '2023-11-06 06:52:26'),
(31, 'didin', 'pt didin', 3123, 'akbar can', '2023-10-25 02:40:43', '2023-10-25 02:40:43'),
(32, 'nurdididm', 'PT didin', 23, 'akbar can', '2023-10-25 03:13:36', '2023-11-01 02:15:12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(50, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(51, '2023_10_12_080958_create_akuns_table', 1),
(54, '2023_10_12_105931_create_kode_promos_table', 1),
(56, '2023_10_12_110040_create_maskapais_table', 1),
(57, '2023_10_12_110112_create_perubahan_status_jadwal_penerbangans_table', 1),
(58, '2023_10_12_110135_create_status_penerbangans_table', 1),
(59, '2023_10_14_183454_create_negaras_table', 1),
(60, '2023_10_14_183726_create_bandaras_table', 1),
(66, '2023_10_12_104633_create_transaksi_details_table', 6),
(68, '2023_10_12_101534_create_transaksi_headers_table', 7),
(69, '2023_10_12_110021_create_jadwal_penerbangans_table', 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `negaras`
--

CREATE TABLE `negaras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Nama` varchar(255) NOT NULL,
  `IbukotaNegara` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `negaras`
--

INSERT INTO `negaras` (`id`, `Nama`, `IbukotaNegara`, `created_at`, `updated_at`) VALUES
(1, 'Afganistan', 'Kabul', NULL, NULL),
(2, 'Albania', 'Tirana', NULL, NULL),
(3, 'Aljazair', 'Aljir', NULL, NULL),
(4, 'Amerika Serikat', 'Washington, DC', NULL, NULL),
(5, 'Andorra', 'Andorra la Vella', NULL, NULL),
(6, 'Angola', 'Luanda', NULL, NULL),
(7, 'Antigua dan Barbuda', 'Saint John\'s', NULL, NULL),
(8, 'Arab Saudi', 'Riyadh', NULL, NULL),
(9, 'Argentina', 'Buenos Aires', NULL, NULL),
(10, 'Armenia', 'Yerevan', NULL, NULL),
(11, 'Australia', 'Canberra', NULL, NULL),
(12, 'Austria', 'Wina', NULL, NULL),
(13, 'Azerbaijan', 'Baku', NULL, NULL),
(14, 'Bahama', 'Nassau', NULL, NULL),
(15, 'Bahrain', 'Manama', NULL, NULL),
(16, 'Bangladesh', 'Dhaka', NULL, NULL),
(17, 'Barbados', 'Bridgetown', NULL, NULL),
(18, 'Belanda', 'Amsterdam', NULL, NULL),
(19, 'Belarus', 'Minsk', NULL, NULL),
(20, 'Belgia', 'Brusel', NULL, NULL),
(21, 'Belize', 'Belmopan', NULL, NULL),
(22, 'Benin', 'Porto Novo, Cotonou', NULL, NULL),
(23, 'Bhutan', 'Thimphu', NULL, NULL),
(24, 'Bolivia', 'La Paz, Sucre', NULL, NULL),
(25, 'Bosnia Herzegovina', 'Sarajevo', NULL, NULL),
(26, 'Botswana', 'Gaborone', NULL, NULL),
(27, 'Brasil', 'Brasília', NULL, NULL),
(28, 'Brunei', 'Bandar Seri Begawan', NULL, NULL),
(29, 'Bulgaria', 'Sofia', NULL, NULL),
(30, 'Burkina Faso', 'Ouagadougou', NULL, NULL),
(31, 'Burundi', 'Bujumbura', NULL, NULL),
(32, 'Chad', 'N\'Djamena', NULL, NULL),
(33, 'Chili', 'Santiago, Valparaiso', NULL, NULL),
(34, 'Denmark', 'Kopenhagen', NULL, NULL),
(35, 'Djibouti', 'Djibouti', NULL, NULL),
(36, 'Dominika', 'Roseau', NULL, NULL),
(37, 'Ekuador', 'Quito', NULL, NULL),
(38, 'El Salvador', 'San Salvador', NULL, NULL),
(39, 'Eritrea', 'Asmara', NULL, NULL),
(40, 'Estonia', 'Tallinn', NULL, NULL),
(41, 'Eswatini', 'Mbabane', NULL, NULL),
(42, 'Ethiopia', 'Addis Ababa', NULL, NULL),
(43, 'Fiji', 'Suva', NULL, NULL),
(44, 'Filipina', 'Manila', NULL, NULL),
(45, 'Finlandia', 'Helsinki', NULL, NULL),
(46, 'Gabon', 'Libreville', NULL, NULL),
(47, 'Gambia', 'Banjul', NULL, NULL),
(48, 'Georgia', 'Tbilisi', NULL, NULL),
(49, 'Ghana', 'Accra', NULL, NULL),
(50, 'Grenada', 'Saint George\'s', NULL, NULL),
(51, 'Guatemala', 'Guatemala', NULL, NULL),
(52, 'Guiana', 'Cayennye', NULL, NULL),
(53, 'Guinea Bissau', 'Bissau', NULL, NULL),
(54, 'Guinea Ekuatorial', 'Malabo', NULL, NULL),
(55, 'Guinea', 'Conakry', NULL, NULL),
(56, 'Guyana', 'Georgetown', NULL, NULL),
(57, 'Haiti', 'Port-au-Prince', NULL, NULL),
(58, 'Honduras', 'Tegucigalpa', NULL, NULL),
(59, 'Hungaria', 'Budapest', NULL, NULL),
(60, 'India', 'New Delhi', NULL, NULL),
(61, 'Indonesia', 'Jakarta', NULL, NULL),
(62, 'Irak', 'Bagdad', NULL, NULL),
(63, 'Iran', 'Teheran', NULL, NULL),
(64, 'Irlandia', 'Dublin', NULL, NULL),
(65, 'Islandia', 'Reykjavik', NULL, NULL),
(66, 'Jamaika', 'Kingston', NULL, NULL),
(67, 'Jepang', 'Tokyo', NULL, NULL),
(68, 'Jerman', 'Berlin', NULL, NULL),
(69, 'Israel', 'Tel Aviv', NULL, NULL),
(70, 'Italia', 'Roma', NULL, NULL),
(71, 'Kamboja', 'Phnom Penh', NULL, NULL),
(72, 'Kamerun', 'Yaoundé', NULL, NULL),
(73, 'Kanada', 'Ottawa', NULL, NULL),
(74, 'Kazakhstan', 'Astana', NULL, NULL),
(75, 'Kenya', 'Nairobi', NULL, NULL),
(76, 'Kepulauan Marshall', 'Majuro', NULL, NULL),
(77, 'Kepulauan Solomon', 'Honiara', NULL, NULL),
(78, 'Kyrgyzstan', 'Bishkek', NULL, NULL),
(79, 'Kiribati', 'Tarawa', NULL, NULL),
(80, 'Kolombia', 'Bogotá', NULL, NULL),
(81, 'Komoro', 'Moroni', NULL, NULL),
(82, 'Korea Selatan', 'Seoul', NULL, NULL),
(83, 'Korea Utara', 'Pyongyang', NULL, NULL),
(84, 'Kosovo', 'Pristina', NULL, NULL),
(85, 'Kosta Rika', 'San José', NULL, NULL),
(86, 'Kroasia', 'Zagreb', NULL, NULL),
(87, 'Kuba', 'Havana', NULL, NULL),
(88, 'Kuwait', 'Kuwait City', NULL, NULL),
(89, 'Laos', 'Vientiane', NULL, NULL),
(90, 'Latvia', 'Riga', NULL, NULL),
(91, 'Lebanon', 'Beirut', NULL, NULL),
(92, 'Lesotho', 'Maseru', NULL, NULL),
(93, 'Liberia', 'Monrovia', NULL, NULL),
(94, 'Libya', 'Tripoli', NULL, NULL),
(95, 'Liechtenstein', 'Vaduz', NULL, NULL),
(96, 'Lithuania', 'Vilnius', NULL, NULL),
(97, 'Luxemburg', 'Luxemburg (kota)', NULL, NULL),
(98, 'Madagaskar', 'Antananarivo', NULL, NULL),
(99, 'Makedonia', 'Skopje', NULL, NULL),
(100, 'Maladewa', 'Male', NULL, NULL),
(101, 'Malawi', 'Lilongwe', NULL, NULL),
(102, 'Malaysia', 'Kuala Lumpur', NULL, NULL),
(103, 'Mali', 'Bamako', NULL, NULL),
(104, 'Malta', 'Valletta', NULL, NULL),
(105, 'Maroko', 'Rabat', NULL, NULL),
(106, 'Martinique', 'Fort de France', NULL, NULL),
(107, 'Mauritania', 'Nouakchott', NULL, NULL),
(108, 'Mauritius', 'Port Louis', NULL, NULL),
(109, 'Meksiko', 'Kota Mexico', NULL, NULL),
(110, 'Mesir', 'Kairo', NULL, NULL),
(111, 'Mikronesia', 'Palikir', NULL, NULL),
(112, 'Moldova', 'Chisinau', NULL, NULL),
(113, 'Monako', 'Monaco', NULL, NULL),
(114, 'Mongolia', 'Ulan Bator', NULL, NULL),
(115, 'Montenegro', 'Podgorica', NULL, NULL),
(116, 'Mozambik', 'Maputo', NULL, NULL),
(117, 'Namibia', 'Windhoek', NULL, NULL),
(118, 'Nauru', 'Yaren', NULL, NULL),
(119, 'Nepal', 'Kathmandu', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `perubahan_status_jadwal_penerbangans`
--

CREATE TABLE `perubahan_status_jadwal_penerbangans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `JadwalPenerbanganID` int(11) NOT NULL,
  `StatusPenerbanganID` int(11) NOT NULL,
  `WaktuPerubahanTerjadi` varchar(255) DEFAULT NULL,
  `PerkiraanWaktuDelay` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `perubahan_status_jadwal_penerbangans`
--

INSERT INTO `perubahan_status_jadwal_penerbangans` (`id`, `JadwalPenerbanganID`, `StatusPenerbanganID`, `WaktuPerubahanTerjadi`, `PerkiraanWaktuDelay`, `created_at`, `updated_at`) VALUES
(10, 2, 2, '07/11/2023, 13.25.54', 20, '2023-11-07 06:25:55', '2023-11-07 06:25:55'),
(11, 1, 2, '07/11/2023, 13.26.46', 20, '2023-11-07 06:26:47', '2023-11-07 06:26:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `status_penerbangans`
--

CREATE TABLE `status_penerbangans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Nama` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `status_penerbangans`
--

INSERT INTO `status_penerbangans` (`id`, `Nama`, `created_at`, `updated_at`) VALUES
(1, 'Sesuai Jadwal', NULL, NULL),
(2, 'Delay', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_details`
--

CREATE TABLE `transaksi_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `TransaksiHeaderID` int(11) NOT NULL,
  `TitelPenumpang` varchar(255) NOT NULL,
  `NamaLengkapPenumpang` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `transaksi_details`
--

INSERT INTO `transaksi_details` (`id`, `TransaksiHeaderID`, `TitelPenumpang`, `NamaLengkapPenumpang`, `created_at`, `updated_at`) VALUES
(10, 12, 'Tuan', 'swito', '2023-11-06 00:50:17', '2023-11-06 00:50:17'),
(11, 13, 'Tuan', 'swito', '2023-11-06 06:43:19', '2023-11-06 06:43:19'),
(12, 14, 'Tuan', 'jayanto', '2023-11-06 06:59:43', '2023-11-06 06:59:43'),
(13, 15, 'Tuan', 'niko', '2023-11-07 00:40:09', '2023-11-07 00:40:09'),
(14, 16, 'Tuan', 'niko', '2023-11-07 00:44:48', '2023-11-07 00:44:48'),
(15, 17, 'Tuan', 'al', '2023-11-07 01:08:45', '2023-11-07 01:08:45'),
(16, 17, 'Tuan', 'el', '2023-11-07 01:08:45', '2023-11-07 01:08:45'),
(17, 17, 'Tuan', 'dul', '2023-11-07 01:08:45', '2023-11-07 01:08:45'),
(18, 17, 'Tuan', 'dal', '2023-11-07 01:08:45', '2023-11-07 01:08:45'),
(19, 17, 'Tuan', 'dol', '2023-11-07 01:08:45', '2023-11-07 01:08:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_headers`
--

CREATE TABLE `transaksi_headers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `AkunID` int(11) NOT NULL,
  `TanggalTransaksi` date NOT NULL,
  `JadwalPenerbanganID` int(11) NOT NULL,
  `JumlahPenumpang` int(11) NOT NULL,
  `TotalHarga` int(11) NOT NULL,
  `KodePromoID` int(11) NOT NULL,
  `MetodePembayaran` varchar(255) NOT NULL,
  `TerimaPembayaran` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `transaksi_headers`
--

INSERT INTO `transaksi_headers` (`id`, `AkunID`, `TanggalTransaksi`, `JadwalPenerbanganID`, `JumlahPenumpang`, `TotalHarga`, `KodePromoID`, `MetodePembayaran`, `TerimaPembayaran`, `created_at`, `updated_at`) VALUES
(12, 2, '2023-11-06', 9, 1, 624750, 1, 'Kartu Kredit', 1, '2023-11-06 00:50:16', '2023-11-06 00:50:28'),
(13, 4, '2023-11-06', 12, 1, 685000, 0, 'Bank Debit', 1, '2023-11-06 06:43:18', '2023-11-06 06:43:33'),
(16, 3, '2023-11-07', 1, 1, 1522700, 0, 'Bank Debit', 0, '2023-11-07 00:44:48', '2023-11-07 00:44:48'),
(17, 5, '2023-11-07', 1, 5, 7413500, 1, 'Kartu Kredit', 1, '2023-11-07 01:08:45', '2023-11-07 01:09:24');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `akuns`
--
ALTER TABLE `akuns`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `bandaras`
--
ALTER TABLE `bandaras`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jadwal_penerbangans`
--
ALTER TABLE `jadwal_penerbangans`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kode_promos`
--
ALTER TABLE `kode_promos`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `maskapais`
--
ALTER TABLE `maskapais`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `negaras`
--
ALTER TABLE `negaras`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `perubahan_status_jadwal_penerbangans`
--
ALTER TABLE `perubahan_status_jadwal_penerbangans`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `status_penerbangans`
--
ALTER TABLE `status_penerbangans`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi_details`
--
ALTER TABLE `transaksi_details`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi_headers`
--
ALTER TABLE `transaksi_headers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `akuns`
--
ALTER TABLE `akuns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `bandaras`
--
ALTER TABLE `bandaras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;

--
-- AUTO_INCREMENT untuk tabel `jadwal_penerbangans`
--
ALTER TABLE `jadwal_penerbangans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=532;

--
-- AUTO_INCREMENT untuk tabel `kode_promos`
--
ALTER TABLE `kode_promos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `maskapais`
--
ALTER TABLE `maskapais`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT untuk tabel `negaras`
--
ALTER TABLE `negaras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `perubahan_status_jadwal_penerbangans`
--
ALTER TABLE `perubahan_status_jadwal_penerbangans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `status_penerbangans`
--
ALTER TABLE `status_penerbangans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `transaksi_details`
--
ALTER TABLE `transaksi_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `transaksi_headers`
--
ALTER TABLE `transaksi_headers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
