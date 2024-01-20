<!DOCTYPE html>
<html lang="en">

<head>
  <?php
  include 'auth/connect.php';
  $idnama = $_POST['id'];
  $cek = mysqli_query($conn, "SELECT * FROM pasien WHERE nama_pasien='$idnama'");
  $ceque = mysqli_fetch_array($cek);
  $realid = $ceque['id'];
  $page1 = $_POST['page'];

  $cekriwayat = mysqli_query($conn, "SELECT * FROM `riwayat_penyakit` ORDER BY id DESC LIMIT 1");
  $datapasien = mysqli_fetch_array($cekriwayat);
  @$idpeny = $datapasien['id']+1;

  if ($page1 == "raw1") {
    $page = "Pemeriksaan Pasien";
    $bread = "<a href='rawat_jalan1.php'>";
  } else {
    header("location:index.php");
  }

  session_start();
  include "part/head.php";
  include "part_func/tgl_ind.php";
  ?>
</head>

<body>
  <div id="app">
    <div class="main-wrapper main-wrapper-1">
      <div class="navbar-bg"></div>

      <?php
      include 'part/navbar.php';
      include 'part/sidebar.php';
      ?>

      <!-- Main Content -->
      <div class="main-content">
        <section class="section">
          <div class="section-header">
            <h1><?php echo $mbuh; ?></h1>
            <div class="section-header-breadcrumb">
              <div class="breadcrumb-item active"><?php echo $bread . " " . $page; ?></a></div>
              <div class="breadcrumb-item">Nama Pasien : <?php echo ucwords($idnama); ?></div>
            </div>
          </div>

          <div class="section-body">
            <div class="row">
              <div class="col-12">
                <div class="card">
                  <div class="card-header">
                    <h4><?php echo $page; ?></h4>
                  </div>
                  <div class="card-body">
                    <div class="row">
                      <div class="col-4">
                        <div class="list-group" id="list-tab" role="tablist">
                          <a class="list-group-item list-group-item-action active" id="list-diagnosa-list" data-toggle="list" href="#list-diagnosa" role="tab">Diagnosa</a>
                          <a class="list-group-item list-group-item-action" id="list-info-list" data-toggle="list" href="#list-info" role="tab">Info Pasien</a>

                          
                          <!-- <a class="list-group-item list-group-item-action" id="list-rekam-list" data-toggle="list" href="#list-rekam" role="tab">Rekam Medis Pasien</a> -->
                        </div>
                      </div>
                      <div class="col-8">
                        <div class="tab-content" id="nav-tabContent">
                          <div class="tab-pane fade show active" id="list-diagnosa" role="tabpanel" aria-labelledby="list-diagnosa-list">
                            <form action="rawat_jalan_obat.php" method="POST" class="needs-validation" novalidate="" autocomplete="off">
                              <div class="row">
                                <div class="form-group col-md-6 col-12">
                                  <div class="input-group">
                                    <input type="hidden" name="idlae" value="<?php echo $realid; ?>" readonly required>
                                    <input type="hidden" name="dokter" value="<?php echo $sessionid; ?>" readonly required>
                                    <input type="hidden" name="idpeny" value="<?php echo $idpeny; ?>" readonly required>
                                    <div class="input-group-prepend">
                                      <div class="input-group">
                                        
                                      </div>
                                    </div>
                                    <div class="invalid-feedback">
                                      Mohon data diisi!
                                    </div>
                                  </div>
                                </div>
                                <div class="form-group col-md-6 col-12">
                                  <div class="input-group">
                                    <div class="input-group-prepend">
                                      <div class="input-group">
                                        
                                      </div>
                                    </div>
                                    <div class="invalid-feedback">
                                      Mohon data diisi!
                                    </div>
                                  </div>
                                </div>
                              </div>
                            
                              <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Total Harga</label>
                                <div class="input-group col-sm-9">
                                  <input type="hidden" name="id" required="">
                                  <input type="number" class="form-control" name="tensi" required="" placeholder="Total harga">
                                  <div class="input-group-prepend">
                                    <div class="input-group-text">
                                      Rp
                                    </div>
                                  </div>
                                  <div class="invalid-feedback">
                                    Mohon data diisi!
                                  </div>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Diagnosa Penyakit</label>
                                <div class="col-sm-9">
                                  <textarea placeholder="Wajib" class="summernote-simple" name="diagnosa" required></textarea>
                                  <div class="invalid-feedback">
                                    Mohon data diisi!
                                  </div>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Nama Penyakit</label>
                                <div class="col-sm-9">
                                  <input type="text" class="form-control" name="penyakit" required="" placeholder="Nama Penyakit yang menyerang Pasien">
                                  <div class="invalid-feedback">
                                    Mohon data diisi!
                                  </div>
                                </div>
                              </div>
                              <input type="hidden" class="form-control" name="status" required readonly value="1">
                              <input type="hidden" class="form-control" name="biaya" required readonly value="50000">
                              <button type="submit" class="btn btn-primary" name="submit">Pemeriksaan Selesai</button>
                            </form>
                          </div>
                          <div class="tab-pane fade" id="list-info" role="tabpanel" aria-labelledby="list-info-list">
                            <?php
                            $cek = mysqli_query($conn, "SELECT * FROM pasien WHERE nama_pasien='$idnama'");
                            $pasien = mysqli_fetch_array($cek);
                            $idid = $pasien['id'];
                            $terakhir = mysqli_query($conn, "SELECT * FROM riwayat_penyakit WHERE id_pasien='$idid' ORDER BY id DESC LIMIT 1");
                            $riwayat_terakhir = mysqli_fetch_array($terakhir);
                            ?>
                            <table class="table table-striped table-sm">
                              <tbody>
                                <tr>
                                  <th scope="row">Nama Lengkap</th>
                                  <td> : <?php echo ucwords($idnama); ?></td>
                                </tr>
                                <tr>
                                  <th scope="row">Tanggal Lahir</th>
                                  <td> : <?php echo ucwords($pasien['tgl_lahir']); ?></td>
                                </tr>
                                <tr>
                                  <th scope="row">Tempat Kejadian Perkara</th>
                                  <td> : <?php echo ucwords($pasien['tkp']); ?></td>
                                </tr>
                                <tr>
                                  <th scope="row">Kronologi</th>
                                  <td> : <?php echo ucwords($pasien['kornologi']); ?></td>
                                </tr>
                                <tr>
                                  <th scope="row">Jenis Kelamin</th>
                                  <td> :
                                    <?php if ($pasien['jenis_kelamin'] == "0") {
                                      echo "Laki - Laki";
                                    } else {
                                      echo "Perempuan";
                                    } ?>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">Alamat</th>
                                  <td> : <?php echo ucwords($pasien['alamat']); ?></td>
                                </tr>
                               
                                
                              </tbody>
                            </table>
                          </div>
                             
                          </div>
                  
                              </tbody>
                            </table>
                          </div>
                         
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
      <?php include 'part/footer.php'; ?>
    </div>
  </div>
  <?php include "part/all-js.php"; ?>
</body>

</html>