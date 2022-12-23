<?php
require("../require/page.php");
//require("function.php")
//$userdb = mysqli_query($cpconn, "SELECT * FROM users where discord_id = '". $_SESSION["user"]->id. "'")->fetch_object();
//$cpconn->query("INSERT INTO afk_data (discord_id, isafk) VALUES ('$user->id', '1')");
//
$userdb = $cpconn->query("SELECT * FROM users WHERE discord_id = '" . mysqli_real_escape_string($cpconn, $_SESSION["user"]->id) . "'")->fetch_array();
$stconn = $cpconn->query("SELECT * FROM settings")->fetch_array();

$usrcoins = $userdb['coins'];
$usrafkmin = $userdb['minutes_idle'];

?>
 <!--<script>
            setTimeout(function() {
                window.location.href=".php";
            }, 60000);
        </script> -->

<!-- Header -->
<meta http-equiv="refresh" content="62">
<div class="header bg-primary pb-6">
    <div class="container-fluid">
        <div class="header-body">
            <div class="row align-items-center py-4">
                <div class="col-lg-6 col-7">
                    <h6 class="h2 text-white d-inline-block mb-0">Earn coins</h6>
                    <nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
                        <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
                            <li class="breadcrumb-item"><a href="/"><i class="fas fa-home"></i></a></li>
                            <li class="breadcrumb-item active" aria-current="page">Earn coins</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
<input id="node" name="node" type="hidden" value="">
<!-- Page content -->
<div class="container-fluid mt--6">
    <div class="row justify-content-center">
        <div class="col-lg-8 card-wrapper">
            <div class="card">
                <div class="card-header">
                    <h3 class="mb-0"><img src="https://i.imgur.com/jv3Frir.png" width="30"> You are eraning coins now</h3>
                </div>
                <div class="card-body" style="text-align: center;">
                    <!--<p> Every 60 seconds, you will get 1 coins</p>
                    <p>You will gain 1 coin in <span id="timer"></span></p>-->
                    <p>For every minute you idle here, you get one coin. With those coins that you earn, you can purchase things from the shop. </p>
                    <p>You currently have <?php echo $usrcoins; ?> coin(s)!</p>
                    <p>You have been idling for <?php echo $usrafkmin; ?> minute(s)!</p>
                    <p>You will get more coins in <span id="timer"></span>!</p>
                    
                </div>
            </div>
        </div>
    </div>
    <!-- Footer -->
    <footer class="footer pt-0">
        <div class="row align-items-center justify-content-lg-between">
            <div class="col-lg-6">
    
            </div>
            <div class="col-lg-6">
                <ul class="nav nav-footer justify-content-center justify-content-lg-end">
                    <li class="nav-item">
                        <a href="<?= $stconn["website"] ?>" class="nav-link" target="_blank"> Website</a>
                    </li>
                    <li class="nav-item">
                        <a href="<?= $stconn["statuspage"] ?>" class="nav-link" target="_blank">Uptime / Status</a>
                    </li>
                    <li class="nav-item">
                        <a href="<?= $stconn["privacypolicy"] ?>" class="nav-link" target="_blank">Privacy policy</a>
                    </li>
                    <li class="nav-item">
                        <a href="<?= $stconn["termsofservice"] ?>" class="nav-link" target="_blank">Terms of service</a>
                    </li>
                </ul>
            </div>
        </div>
    </footer>
    </div>
    </div>
    <?php echo '<script>';
echo "setInterval(function () { $.ajax({ url: '../core/afk/functions/coins.php', success: function (data) { console.log(\"Earned A Coin!\"); } }); }, 60000)";
echo '</script>';
?>
<script>
    setInterval(function () {
        $('#stats').load(location.href + " #stats>*", "")
    }, 61000)

</script>
    <script src="/assets/vendor/jquery/dist/jquery.min.js"></script>
    <script src="/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/assets/vendor/js-cookie/js.cookie.js"></script>
    <script src="/assets/vendor/jquery.scrollbar/jquery.scrollbar.min.js"></script>
    <script src="/assets/vendor/jquery-scroll-lock/dist/jquery-scrollLock.min.js"></script>
    <!-- Optional JS -->
    <script src="/core/afk/functions/timer.js"></script>
    </script>
    <script src="/assets/vendor/sweetalert2/dist/sweetalert2.min.js"></script>
    <script src="/assets/vendor/bootstrap-notify/bootstrap-notify.min.js"></script>
    <!-- Argon JS -->
    <script src="/assets/js/argon.js?v=1.2.0"></script>
</div>

</html>
