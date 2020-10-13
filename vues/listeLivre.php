<?php 

?>
<div class="container mt-5">
  <div class="row pt-3">
  <div class="col-9"><h2>Liste des Livres</h2></div>
  <div class="col-3"><a href="index.php?uc=livres&action=add" class="btn btn-success"><i class="fas fa-plus-circle"></i> Créer un livre </a> </div>

</div>

<form action="" method="POST" class="border boder-primary rounded p-3">
      <div class="row">
        <div class="col">
            <input type="text" class="form-control" id="titre" placeholder="Saisir un Titre" name="titre" value="<?php echo $titre; ?>">      
        </div>
      <!-- On cherche l'auteur qui est classé par son nom-->
        <div class="col">
            <select name="auteur" class="form-control">
              <?php
              echo "<option value='Tous'>Tous les Auteurs</option>";
              foreach($LesAuteurs as $auteur) {
                $selection=$auteur->num == $auteur? 'selected' : '';
                echo "<option value='".$auteur->num."'". $selection.">".$auteur->nom."</option>";
              }
              ?>   
          </select>
        </div>
        <!-- On cherche le genre du livre-->
        <div class="col">
            <select name="genre" class="form-control">
              <?php
              echo "<option value='all'>Tous les Genres</option>";
              foreach($LesGenres as $genre) {
                $selection=$genre->getNum() == $genre? 'selected' : '';
                echo "<option value='".$genre->getNum()."'". $selection.">".$genre->getLibelle()."</option>";
              }
              ?>   
          </select>
        </div>
        <div class="col">
        <button type="submit" class="btn btn-success btn-block"> Rechercher</button>
        </div>
      </div>
</form>

<!--- Pour les colonnes! (tableaux)-->
<table class="table table-hover table-striped">
  <thead>
    <tr class="d-flex">
      <th scope="col" class="col-md-2">ISBN</th>
      <th scope="col" class="col-md-2">Titre</th>
      <th scope="col" class="col-md-1">Prix</th>
      <th scope="col" class="col-md-1">Editeur</th>
      <th scope="col" class="col-md-1">Annee</th>
      <th scope="col" class="col-md-2">Langue</th>
      <th scope="col" class="col-md-2">Auteur</th>
      <th scope="col" class="col-md-2">Genre</th>
      <th scope="col" class="col-md-2">Actions</th>
   
    </tr>
  </thead>
  <tbody>
    <!--- On met les infos associé-->
  <?php
  foreach($LesLivres as $livre){
    echo"<tr class='d-flex'>";
     echo "<td class='col-md-2'>".$livre->isbn."</td>";
     echo "<td class='col-md-2'>".$livre->titre."</td>";
     echo "<td class='col-md-1'>".$livre->prix."</td>";
     echo "<td class='col-md-1'>".$livre->editeur."</td>";
     echo "<td class='col-md-1'>".$livre->annee."</td>";
     echo "<td class='col-md-2'>".$livre->langue."</td>";
     echo "<td class='col-md-2'>".$livre->nom."&nbsp;&nbsp;".$livre->prenom."</td>";
     echo "<td class='col-md-2'>".$livre->libGenre."</td>";
     echo "<td class='col-md-2'>
     <a href='index.php?uc=livres&action=update&num=".$livre->num."'class='btn btn-primary'><i class='fas fa-pen'></i></a>
     <a href='#SupprimerModal' data-toggle='modal' data-message='Vous voulez vous supprimer cette Nationalité ?' data-suppression='index.php?uc=livres&action=delete&num=".$livre->num."'class='btn btn-primary'><i class='far fa-trash-alt'></i></a>
     </td>";
    echo"</tr>";
    }
  
    ?>
  </tbody>
  </table>
</div>