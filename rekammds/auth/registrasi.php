<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <link rel="shortcut icon" type="image/x-icon" href="../assets/img/stisla.svg" />
  <title>Rekam Medis - Login</title>

  <!-- General CSS Files -->
  <link rel="stylesheet" href="../assets/modules/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="../assets/modules/fontawesome/css/all.min.css">

  <!-- Template CSS -->
  <link rel="stylesheet" href="../assets/css/style.css">
  <link rel="stylesheet" href="../assets/css/components.css">

  <?php
  session_start();
  if(isset($_SESSION['id_pengguna'])){
    header('location:../');
  }else{
    include 'connect.php';
    if(isset($_POST['submit'])){
      @$user = mysqli_real_escape_string($conn, $_POST['username']);
      @$kart = mysqli_real_escape_string($conn, $_POST['no_kartu']);

      $regis = mysqli_query($conn, "SELECT * FROM pengguna WHERE username='$user' AND password='$kart'");
      $cek = mysqli_num_rows($regis);
      $userid = mysqli_fetch_array($regis);

      if($cek == 0){
        echo '
        <script>
        setTimeout(function() {
          swal({
            title: "Registrasi Gagal",
            text: "Username atau No Kartu Anda Salah. Mohon periksa kembali form anda!",
            icon: "error"
            });
            }, 500);
            </script>
            ';
          }else{
            header('location:../');
            $_SESSION['id_pengguna'] = $userid['id'];
          }
        }
        ?>
      </head>
      <body>
        <div id="app">
          <section class="section">
            <div class="container mt-5">
              <div class="row">
                <div class="col-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">
                  <div class="login-brand">
                    <img src="https://rmol.id/images/berita/normal/2021/08/160752_11204302082021_logo_jasa_raharja_.jpg" alt="logo" width="100" class="shadow-light rounded-circle">
                  </div>

                  <div class="card card-primary">
                    <div class="card-header"><h4>Registrasi</h4></div>

                    <div class="card-body">
                      <form method="POST" action="" class="needs-validation" novalidate="" autocomplete="off">
                        <div class="form-group">
                          <label for="username">Username</label>
                          <input id="username" type="text" class="form-control" minlength="2" name="username" tabindex="1" required autofocus>
                          <div class="invalid-feedback">
                            Mohon isi username anda dengan benar!
                          </div>
                        </div>

                        <div class="form-group">
                          <div class="d-block">
                           <label for="password" class="control-label">No Kartu</label>
                         </div>
                         <input id="password" type="password" class="form-control" name="password" tabindex="2" required>
                         <div class="invalid-feedback">
                          Mohon isi nomor kartu anda!
                        </div>
                      </div>

                      <div class="form-group">

                        <button type="submit" name="submit" class="btn btn-primary btn-lg btn-block" tabindex="4">
                          Login
                        </button>
                      </div>
                    </form>

                  </div>
                </div>
                <div class="simple-footer">
                  Copyright &copy; Jasa Raharja 2023
                  <br><center><p><a href='' title='' target='_blank'></a></p></center>
                  
                  
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>

      <!-- General JS Scripts -->
      <script src="../assets/modules/jquery.min.js"></script>
      <script src="../assets/modules/popper.js"></script>
      <script src="../assets/modules/tooltip.js"></script>
      <script src="../assets/modules/bootstrap/js/bootstrap.min.js"></script>
      <script src="../assets/modules/nicescroll/jquery.nicescroll.min.js"></script>
      <script src="../assets/modules/moment.min.js"></script>
      <script src="../assets/js/stisla.js"></script>

      <!-- Template JS File -->
      <script src="../assets/js/scripts.js"></script>
      <script src="../assets/js/custom.js"></script>
      <!-- Sweet Alert -->
      <script src="../assets/modules/sweetalert/sweetalert.min.js"></script>
      <script src="../assets/js/page/modules-sweetalert.js"></script>
    </body>
  <?php } ?>
  </html>