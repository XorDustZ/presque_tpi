<?php
/**
 * Author: Tom Ryser
 * Date: 22.05.2018
 * Version : 1.0
 * Title : index
 * Description : contain 6 most recent available vehicles.
 */
session_start();

require_once('..\php\fonctionsBD_select.php');
$vehicle = getRecentVehicleAvaible();
?>
<!DOCTYPE html>
<html lang="fr">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="RedLoca">
    <meta name="author" content="Tom Ryser">

    <title>Accueil - RedLoca</title>

      <!-- Bootstrap core CSS -->
      <link href="../bootstrap/css/bootstrap.css" rel="stylesheet">

      <link href="../css/style.css" rel="stylesheet">

  </head>

  <body id="page-top">

  <!-- Navigation -->
    <?php 
      require_once('nav.php');
    ?>
    <section id="recentlyAdded" class="bg-light">
      <div class="container">
      <?php
        if(isset($_GET['result'])){
          if($_GET['result'] == "true"){
            echo'<div class="alert alert-success">Votre location as été enregistrée.</div>';
          }else{
            echo'<div class="alert alert-warning">une erreur est survenue.</div>';
          }
          
        }

        $i = 0;
        foreach ($vehicle as $key => $value) {
          if($i==0)echo'<div class="row">';
          if($i%3 == 0)echo'</div><div class="row">';
          echo'
              <div class="col-lg-4 col-sm-6 portfolio-item">
                <div class="card h-100">
                  <a href="item.php?vehicleId='.$value['idVehicule'].'&date='.date("Y-m-d").'"><img class="card-img-top" src="../mediaUser/'.$value['image'].'" alt=""></a>
                  <div class="card-body">
                    <h4 class="card-title">
                      <a href="item.php?vehicleId='.$value['idVehicule'].'">'.$value['marque'].' '.$value['model'].'</a>
                    </h4>
                    <p class="card-text">
                      places: '.$value['nbPlace'].'
                    </p>
                    <p class="card-text">
                      couleur: '.$value['couleur'].'
                    </p>
                    <p class="card-text">
                      catégorie: '.$value['categorie'].'
                    </p>
                  </div>
                </div>
              </div>
          ';$i++;
        if($i==6)exit();
        }
        ?>
      </div>
    </section>

    <section id="contact">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto">
            <h2>Contactez nous</h2>
            <p class="lead">Email : tom.rsr@eduge.ch</p>
          </div>
        </div>
      </div>
    </section>

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
      <p class="m-0 text-center text-white">RedLoca CFPT-I 2018</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="../jquery/jquery.js"></script>
    <script src="../bootstrap/js/bootstrap.bundle.js"></script>

    <!-- Custom JavaScript for this theme -->
    <script src="../js/scrolling-nav.js"></script>

  </body>

</html>