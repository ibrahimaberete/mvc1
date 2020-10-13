<div class="container mt-5">
  <div class="row pt-3">
  <div class="col-9"><h2>Liste des Continents</h2></div>
  <div class="col-3"><a href="index.php?uc=continents&action=add" class="btn btn-success"><i class="fas fa-plus-circle"></i> Créer un Continent</a> </div>

</div>

<table class="table table-hover table-striped">
  <thead>
    <tr class="d-flex">
      <th scope="col" class="col-md-2">Numéro</th>
      <th scope="col" class="col-md-8">Libellé</th>
      <th scope="col" class="col-md-2">Actions</th>
   
    </tr>
  </thead>
  <tbody>
  <?php
  foreach($LesContinents as $Continent){
    echo"<tr class='d-flex'>";
     echo "<td class='col-md-2'>".$Continent->getNum()."</td>";
     echo "<td class='col-md-8'>".$Continent->getLibelle()."</td>";
     echo "<td class='col-md-2'>
     <a href='index.php?uc=continents&action=update&num=".$Continent->getNum()."' class='btn btn-primary'><i class='fas fa-pen'></i></a>
     <a href='#SupprimerModal' data-toggle='modal' data-message='Vous voulez vous supprimer ce continent ?' data-suppression='index.php?uc=continents&action=delete&num=".$Continent->getNum()."' class='btn btn-primary'><i class='far fa-trash-alt'></i></a>
     </td>";
    echo"</tr>";
    }
  
    ?>
  </tbody>
  </table>
</div>