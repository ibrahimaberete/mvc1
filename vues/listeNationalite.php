
<div class="container mt-5">
  <div class="row pt-3">
  <div class="col-9"><h2>Liste des Nationalites</h2></div>
  <div class="col-3"><a href="index.php?uc=nationalites&action=add" class="btn btn-success"><i class="fas fa-plus-circle"></i> Créer une Nationalité </a> </div>

</div>

<form action="index.php?uc=nationalites&action=list" method="post" class="border boder-primary rounded p-3">
      <div class="row">
        <div class="col">
            <input type="text" class="form-control" id="libelle" placeholder="Saisir le libellé" name="libelle" value="<?php echo $libelle; ?>"> 
        </div>
        <div class="col">
            <select name="continent" class="form-control">
              <?php
              echo "<option value='Tous'>Tous les Continents</option>";
              foreach($LesContinents as $Continent) {
                $selection=$Continent->getNum() == $Continents? 'selected' : '';
                echo "<option value='".$Continent->getNum()."'". $selection.">".$Continent->getLibelle()."</option>";
              }
              ?>   
          </select>
        </div>
        <div class="col">
        <button type="submit" class="btn btn-success btn-block"> Rechercher</button>

        </div>
      </div>
</form>


<table class="table table-hover table-striped">
  <thead>
    <tr class="d-flex">
      <th scope="col" class="col-md-2">Numéro</th>
      <th scope="col" class="col-md-5">Libellé</th>
      <th scope="col" class="col-md-3">Continent</th>
      <th scope="col" class="col-md-2">Actions</th>
   
    </tr>
  </thead>
  <tbody>
  <?php
  foreach($LesNationalites as $nationalite){
    echo"<tr class='d-flex'>";
     echo "<td class='col-md-2'>".$nationalite->num."</td>";
     echo "<td class='col-md-5'>".$nationalite->libNation."</td>";
     echo "<td class='col-md-3'>".$nationalite->libContinent."</td>";
     echo "<td class='col-md-2'>
     <a href='index.php?uc=nationalites&action=update&num=".$nationalite->num."'class='btn btn-primary'><i class='fas fa-pen'></i></a>
     <a href='#SupprimerModal' data-toggle='modal' data-message='Vous voulez vous supprimer cette Nationalité ?' data-suppression='index.php?uc=nationalites&action=delete&num=".$nationalite->num."'class='btn btn-primary'><i class='far fa-trash-alt'></i></a>
     </td>";
    echo"</tr>";
    }
  
    ?>
  </tbody>
  </table>
</div>