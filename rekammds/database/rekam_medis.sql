-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Nov 2023 pada 15.32
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
-- Database: `rekam_medis`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `antrian`
--

CREATE TABLE `antrian` (
  `no_urut` int(11) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `antrian`
--

INSERT INTO `antrian` (`no_urut`, `id_pasien`, `status`) VALUES
(1, 44, 0),
(2, 45, 0),
(3, 51, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `foto_rotgen`
--

CREATE TABLE `foto_rotgen` (
  `id` int(11) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `id_penyakit` int(11) NOT NULL,
  `biaya` int(11) NOT NULL,
  `directory` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `meninggal`
--

CREATE TABLE `meninggal` (
  `id` int(11) NOT NULL,
  `nama_pasien` varchar(225) NOT NULL,
  `keterangan` varchar(225) NOT NULL,
  `biaya` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `meninggal`
--

INSERT INTO `meninggal` (`id`, `nama_pasien`, `keterangan`, `biaya`) VALUES
(3, 'asa', 'as', 12123),
(4, 'wdvwd', 'nwd n', 11212),
(5, 'rere', 'meninggoy', 1500000),
(6, 'Sasa', 'tabrak lari', 12000000),
(7, '2', 'Jungkir Balik', 150000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `obat`
--

CREATE TABLE `obat` (
  `id` int(11) NOT NULL,
  `nama_obat` varchar(300) NOT NULL,
  `stok` int(11) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `obat`
--

INSERT INTO `obat` (`id`, `nama_obat`, `stok`, `harga`) VALUES
(1, 'parashitamol', 980, 500),
(3, 'Vitamin C', 7, 7000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `obat2`
--

CREATE TABLE `obat2` (
  `kode` varchar(50) NOT NULL,
  `id_penyakit` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL,
  `jum_obat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `obat2`
--

INSERT INTO `obat2` (`kode`, `id_penyakit`, `id_obat`, `jum_obat`) VALUES
('51202310161', 50, 1, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasien`
--

CREATE TABLE `pasien` (
  `id` int(11) NOT NULL,
  `nama_pasien` varchar(200) NOT NULL,
  `tgl_lahir` varchar(200) NOT NULL,
  `alamat` text NOT NULL,
  `kode_pasien` varchar(50) NOT NULL,
  `jenis_kelamin` int(11) NOT NULL,
  `tkp` varchar(100) NOT NULL,
  `kornologi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pasien`
--

INSERT INTO `pasien` (`id`, `nama_pasien`, `tgl_lahir`, `alamat`, `kode_pasien`, `jenis_kelamin`, `tkp`, `kornologi`) VALUES
(44, '1', '2023-10-13', '1', '202310131', 0, '1', '1'),
(45, '2', '2023-10-13', '2', '202310132', 0, '2', '2'),
(46, '3', '2023-10-13', '3', '202310133', 0, '3', '3'),
(47, '5', '2023-10-13', '5', '202310134', 0, '5', '5'),
(48, '6', '2023-10-13', '6', '202310135', 0, '6', '6'),
(49, 'Nama Lengkap Pasien', '2023-10-13', 'Alamat Pasien / Tempat Tinggal Pasien', '202310136', 0, 'Tempat Kejadian Perkara', 'Kronologi'),
(50, '2', '2023-10-14', '2', '202310147', 0, '2', '2'),
(51, 'Mei Mei', '2006-11-04', 'Rumah', '200611048', 0, 'Skip', 'Jatuh Sendiri');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama_pegawai` varchar(200) NOT NULL,
  `alamat` varchar(360) NOT NULL,
  `pekerjaan` int(11) NOT NULL,
  `foto` varchar(200) NOT NULL,
  `spesialis` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`id`, `username`, `password`, `nama_pegawai`, `alamat`, `pekerjaan`, `foto`, `spesialis`) VALUES
(6, 'admin', 'admin', 'Jasa Raharja', 'sintang', 1, 'assets/img/profile/default.png', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `riwayat_obat`
--

CREATE TABLE `riwayat_obat` (
  `id` int(11) NOT NULL,
  `id_penyakit` int(11) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `riwayat_obat`
--

INSERT INTO `riwayat_obat` (`id`, `id_penyakit`, `id_pasien`, `id_obat`, `jumlah`) VALUES
(28, 41, 45, 1, 1),
(29, 42, 46, 1, 1),
(30, 43, 44, 2, 1),
(31, 44, 47, 2, 1),
(32, 45, 48, 2, 1),
(33, 46, 49, 1, 1),
(34, 43, 44, 1, 1),
(35, 43, 44, 3, 1),
(36, 47, 44, 1, 1),
(37, 48, 44, 1, 1),
(38, 49, 46, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `riwayat_penyakit`
--

CREATE TABLE `riwayat_penyakit` (
  `id` int(11) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `penyakit` varchar(300) NOT NULL,
  `diagnosa` text NOT NULL,
  `tgl` varchar(200) NOT NULL,
  `biaya_pengobatan` int(11) NOT NULL,
  `tinggi` int(11) NOT NULL,
  `berat` int(11) NOT NULL,
  `tensi` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `riwayat_penyakit`
--

INSERT INTO `riwayat_penyakit` (`id`, `id_pasien`, `penyakit`, `diagnosa`, `tgl`, `biaya_pengobatan`, `tinggi`, `berat`, `tensi`, `id_dokter`) VALUES
(40, 44, '1', '<p>1</p>', '2023-10-13', 50000, 0, 0, 1, 1),
(41, 45, '2', '<p>2</p>', '2023-10-13', 50000, 0, 0, 2, 1),
(42, 46, '3', '<p>3</p>', '2023-10-13', 50000, 0, 0, 3, 1),
(43, 44, '1', '<p>1</p>', '2023-10-13', 50000, 0, 0, 1, 1),
(44, 47, '5', '<p>5</p>', '2023-10-13', 50000, 0, 0, 5, 1),
(45, 48, '6', '<p>6</p>', '2023-10-13', 50000, 0, 0, 6, 1),
(46, 49, 'Nama Penyakit', '<p>Diagnosa Penyakit</p>', '2023-10-13', 50000, 0, 0, 12, 1),
(47, 44, '12', '<p>12</p>', '2023-10-14', 50000, 0, 0, 12, 1),
(48, 44, 'bb', '<p>gg</p>', '2023-10-14', 50000, 0, 0, 12, 1),
(49, 46, '1', '<p>1</p>', '2023-10-16', 50000, 0, 0, 1, 1),
(50, 51, 'Demam', 'Fluuu', '2023-10-16', 50000, 0, 0, 12000000, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `riwayat_rawatinap`
--

CREATE TABLE `riwayat_rawatinap` (
  `id` int(11) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `tgl_masuk` varchar(200) NOT NULL,
  `tgl_keluar` varchar(200) NOT NULL,
  `biaya` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruangan_inap`
--

CREATE TABLE `ruangan_inap` (
  `id` int(11) NOT NULL,
  `nama_ruang` int(11) DEFAULT NULL,
  `dipakai_sejak` varchar(200) NOT NULL,
  `dipakai_oleh` varchar(200) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `biaya` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `ruangan_inap`
--

INSERT INTO `ruangan_inap` (`id`, `nama_ruang`, `dipakai_sejak`, `dipakai_oleh`, `status`, `biaya`) VALUES
(13, 1, '2/11/2023', 'Melati', 2, 12000),
(14, 2, '-', 'Belum Ada Pasien', 0, 13000),
(15, 3, '-', 'Belum Ada Pasien', 0, 10000),
(16, 4, '-', 'Belum Ada Pasien', 0, 1400000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruang_inap`
--

CREATE TABLE `ruang_inap` (
  `id` int(11) NOT NULL,
  `nama_ruang` int(11) NOT NULL,
  `id_pasien` varchar(11) NOT NULL,
  `tgl_masuk` varchar(200) NOT NULL,
  `status` int(11) NOT NULL,
  `biaya` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `ruang_inap`
--

INSERT INTO `ruang_inap` (`id`, `nama_ruang`, `id_pasien`, `tgl_masuk`, `status`, `biaya`) VALUES
(37, 0, '', '', 0, 12);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `foto_rotgen`
--
ALTER TABLE `foto_rotgen`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `meninggal`
--
ALTER TABLE `meninggal`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `riwayat_obat`
--
ALTER TABLE `riwayat_obat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `riwayat_penyakit`
--
ALTER TABLE `riwayat_penyakit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_pasien_2` (`id_pasien`);

--
-- Indeks untuk tabel `riwayat_rawatinap`
--
ALTER TABLE `riwayat_rawatinap`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ruangan_inap`
--
ALTER TABLE `ruangan_inap`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ruang_inap`
--
ALTER TABLE `ruang_inap`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `foto_rotgen`
--
ALTER TABLE `foto_rotgen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `meninggal`
--
ALTER TABLE `meninggal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `obat`
--
ALTER TABLE `obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `riwayat_obat`
--
ALTER TABLE `riwayat_obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT untuk tabel `riwayat_penyakit`
--
ALTER TABLE `riwayat_penyakit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT untuk tabel `riwayat_rawatinap`
--
ALTER TABLE `riwayat_rawatinap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `ruangan_inap`
--
ALTER TABLE `ruangan_inap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `ruang_inap`
--
ALTER TABLE `ruang_inap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
