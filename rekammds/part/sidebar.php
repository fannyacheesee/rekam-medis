<?php
$judul = "Rekam Medis Rumah Sakit";
$pecahjudul = explode(" ", $judul);
$acronym = "";

foreach ($pecahjudul as $w) {
  $acronym .= $w[0];

  $mbuh = "Rawat Jalan";
}
?>
<div class="main-sidebar sidebar-style-2">
  <aside id="sidebar-wrapper">
    <div class="sidebar-brand">
      <a href="index.html"><?php echo $judul; ?></a>
    </div>
    <div class="sidebar-brand sidebar-brand-sm">
      <a href="index.html"><?php echo $acronym; ?></a>
    </div>
    <ul class="sidebar-menu">
      <li <?php echo ($page == "Dashboard") ? "class=active" : ""; ?>><a class="nav-link" href="index.php"><i class="fas fa-fire"></i><span>Dashboard</span></a></li>
      <li class="menu-header">Menu</li>

      <li class="dropdown <?php echo ($page1 == "raw00" || $page1 == "raw01" || $page1 == "raw0" || $page1 == "raw1" || $page1 == "raw2" || $page1 == "raw3") ? "active" : ""; ?>">
        <a href="#" class="nav-link has-dropdown" data-toggle="dropdown"><i class="fas fa-stethoscope"></i> <span>Rawat Jalan</span></a>
        <ul class="dropdown-menu">
          <li <?php echo (@$page1 == "raw00" || @$page1 == "raw01" || @$page1 == "raw0") ? "class=active" : ""; ?>><a class="nav-link" href="rawat_jalan.php"><span>Pendaftaran Pasien</span></a></li>
          <li <?php echo (@$page1 == "raw1") ? "class=active" : ""; ?>><a class="nav-link" href="rawat_jalan1.php"><span>Pemeriksaan Pasien</span></a></li>
          <li <?php echo (@$page1 == "raw3") ? "class=active" : ""; ?>><a class="nav-link" href="rawat_jalan3.php"><span>Ambil Obat & Pembayaran</span></a></li>
        </ul>
      </li>
      <li class="dropdown <?php echo ($page1 == "det" || $page1 == "det1" || $page1 == "det2") ? "active" : ""; ?>">
        <a href="#" class="nav-link has-dropdown" data-toggle="dropdown"><i class="fas fa-user-injured"></i> <span>Data Pasien</span></a>
        <ul class="dropdown-menu">
          <li <?php echo (@$page1 == "det" || @$page1 == "det1") ? "class=active" : ""; ?>><a class="nav-link" href="pasien.php"><span>Detail Pasien</span></a></li>
          <li <?php echo (@$page1 == "det2") ? "class=active" : ""; ?>><a class="nav-link" href="riwayat_pemeriksaan.php"><span>Riwayat Pemeriksaan</span></a></li>

        </ul>
      </li>
      <li <?php echo ($page == "Data Pegawai") ? "class=active" : ""; ?>><a href="pegawai.php" class="nav-link"><i class="fas fa-users"></i> <span>Data Pegawai</span></a></li>
      <li class="dropdown <?php echo ($page1 == "ruang" || $page1 == "riwayatinap") ? "active" : ""; ?>">
        <a href="#" class="nav-link has-dropdown" data-toggle="dropdown"><i class="fas fa-bed"></i> <span>Rawat Inap</span></a>
        <ul class="dropdown-menu">  
          <li <?php echo (@$page1 == "ruang") ? "class=active" : ""; ?>><a class="nav-link" href="ruangan.php">Detail Ruangan</a></li>
          
        </ul>
      </li>
      <li <?php echo ($page == "Data Foto Rotgen" || @$page1 == "detrot") ? "class=active" : ""; ?>><a class="nav-link" href="meninggal.php"><i class="fas fa-skull"></i> <span>Pasien Meninggal</span></a></li>
      <li <?php echo ($page == "Data Obat") ? "class=active" : ""; ?>><a class="nav-link" href="obat.php"><i class="fas fa-briefcase-medical"></i> <span>Obat</span></a></li>
      <li <?php echo ($page == "#") ? "class=active" : ""; ?>><a class="nav-link" href="http://localhost/admin%20web/pegawai.php"><i class="fas fa-briefcase-medical"></i> <span>Admin</span></a></li>
  </aside>
</div>
