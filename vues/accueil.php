<main role="main">
<!-- Main jumbotron for a primary marketing message or call to action -->
<div class="jumbotron">
    <div class="container">
      <h1 class="display-3">Bonjour  !</h1>
      <p>Bienvenue sur le site d'administration de Ibrahima BERETE </p>

        </div>
 </div>
 
 <div class="container">
        <div class="row">
<div class="col-md-8" style="height: 600px">
<div class="card text-white  mb-3" style="height: 600px">
  <div class="card-header bg-danger"> Livres classer par genres </div>
  <div class="card-body">
    <h4 class="card-title"></h4>
    <div class="card-text" id="chartContainer"></div>
  </div>
</div>
</div>
<div class="col-md-4" style="height: 600px">
<div class="card text-white  mb-3" sstyle="height: 600px">
  <div class="card-header bg-danger">Statistique du site </div>
  <div class="card-body mt-5">
    <h4 class="card-title text-center"><a href="index.php?uc=livres&action=list">
    <span class="badge badge-success"><?php echo Livre::nbLivre();?> </span>
      Livres
    </a></h4>
   <hr>
   <h4 class="card-title text-center"><a href="index.php?uc=auteurs&action=list">
    <span class="badge badge-primary"><?php echo Auteur::nbAuteur();?> </span>
       Auteurs
    </a></h4>
    <hr>
    <h4 class="card-title text-center"><a href="index.php?uc=genres&action=list">
    <span class="badge badge-danger"><?php echo Genre::nbGenre();?> </span>
      Genres
    </a></h4>
    
  </div>
</div>
</div>


 
 <script>
 window.onload = function () {
  
 var chart = new CanvasJS.Chart("chartContainer", {
   animationEnabled: true,
   exportEnabled: true,
   title:{
     text: "Répartition des livres par genre"
   },
   subtitles: [{
     text: "en nombre de livres"
   }],
   data: [{
     type: "pie",
     showInLegend: "true",
     legendText: "{label}",
     indexLabelFontSize: 16,
     indexLabel: "{label} - #percent%",
     yValueFormatString: "฿#,##0",
     dataPoints: <?php echo json_encode(Livre::nbgenre(), JSON_NUMERIC_CHECK); ?>
   }]
 });
 chart.render();
  
 }
 </script>


</main>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>