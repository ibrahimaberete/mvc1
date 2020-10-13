<?php 


?>
<div class="container mt-5">
  <div class="row pt-3">
  <div class="col-9"><h2>Liste des Auteurs</h2></div>
  <div class="col-3"><a href="index.php?uc=auteurs&action=add" class="btn btn-success"><i class="fas fa-plus-circle"></i> Créer un Auteur </a> </div>

</div>

<form action="index.php?uc=auteurs&action=list" method="POST" class="border boder-primary rounded p-3">
      <div class="row">
        <div class="col">
            <input type="text" class="form-control" id="nom" placeholder="Saisir le nom" name="nom" value="<?php echo $nom; ?>">      
        </div>
        <div class="col">
            <input type="text" class="form-control" id="prenom" placeholder="Saisir le prenom" name="prenom" value="<?php echo  $prenom; ?>">      
        </div>
        <div class="col">
            <select name="nationalite" class="form-control">
              <?php
              echo "<option value='Tous'>Tous les Nationalites</option>";
              foreach($LesNationalites as $nationalite) {
                $selection=$nationalite->num == $auteur? 'selected' : '';
                
                echo "<option value='".$nationalite->num."'". $selection.">".$nationalite->libNation."</option>";
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
      <th scope="col" class="col-md-3">Nom</th>
      <th scope="col" class="col-md-3">Prenom</th>
      <th scope="col" class="col-md-2">Nationalites</th>
      <th scope="col" class="col-md-2">Actions</th>
   
    </tr>
  </thead>
  <tbody>
  <?php
  foreach($LesAuteurs as $auteur){
    echo"<tr class='d-flex'>";
     echo "<td class='col-md-2'>".$auteur->num."</td>";
     echo "<td class='col-md-3'>".$auteur->nom."</td>";
     echo "<td class='col-md-3'>".$auteur->prenom."</td>";
     echo "<td class='col-md-2'>".$auteur->libNationalite."</td>";
     echo "<td class='col-md-2'>
     <a href='index.php?uc=auteurs&action=update&num=".$auteur->num."'class='btn btn-primary'><i class='fas fa-pen'></i></a>
     <a href='#SupprimerModal' data-toggle='modal' data-message='Vous voulez vous supprimer cette Nationalité ?' data-suppression='index.php?uc=auteurs&action=delete&num=".$auteur->num."'class='btn btn-primary'><i class='far fa-trash-alt'></i></a>
     </td>";
    echo"</tr>";
    }
  
    ?>
  </tbody>
  </table>
</div>