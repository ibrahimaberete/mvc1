
    <div class="container mt-5">
    <h2 class="pt-3 text-center"><?php echo $mode; ?> un Livre</h2>

<form action="index.php?uc=livres&action=valideform" method="POST" class="col-md-6 offset-md-3 border border-primary p-3 rounded">
    <div class="form-row">
            <div class="form-group col-md-5">
              <!-- permet d'ajouter ou de mofier  le ISBN avec getIsbn()-->
            <label for="isbn">ISBN</label>
            <input type="text" class="form-control" id="isbn" placeholder="Saisir un isbn" name="isbn" value="<?php if ( $mode == "Modifier"){echo  $livre->getIsbn();} ?>">
            </div>
                          
            <!-- permet d'ajouter ou de mofier  le Titre avec getTitre()-->
            <div class="form-group col-md-7">
            <label for="Titre">Titre</label>
            <input type="text" class="form-control" id="titre" placeholder="Saisir un titre" name="titre" value="<?php if ( $mode == "Modifier"){echo  $livre->getTitre();} ?>">
            </div>             
            
            <!-- permet d'ajouter ou de mofier  le prix avec getPrix()-->
            <div class="form-group col-md-2">
            <label for="prix">Prix</label>
            <input type="number" class="form-control" id="prix"  name="prix" value="<?php if ( $mode == "Modifier"){echo  $livre->getPrix();} ?>">
            </div>             
            
            <!-- permet d'ajouter ou de mofier  l'editeur avec getEditeur()-->
            <div class="form-group col-md-4">
            <label for="editeur">Editeur</label>
            <input type="text" class="form-control" id="editeur" placeholder="Editeur" name="editeur" value="<?php if ( $mode == "Modifier"){echo  $livre->getEditeur();} ?>">
            </div>             
            
            <!-- permet d'ajouter ou de mofier  l'année avec getAnnee()-->
            <div class="form-group col-md-3">
            <label for="annee">Année</label>
            <input type="number" class="form-control" id="annee" name="annee" value="<?php if ( $mode == "Modifier"){echo  $livre->getAnnee();} ?>">
            </div>   

            <!-- permet d'ajouter ou de mofier  la langue avec getLangue()-->
            <div class="form-group col-md-3">
            <label for="langue">Langue</label>
            <input type="text" class="form-control" id="langue" placeholder="Langue" name="langue" value="<?php if ( $mode == "Modifier"){echo  $livre->getLangue();} ?>">
            </div>
   
            <!-- pour avoir le nom de l'Auteur --->
            <div class="form-group col-md-6">
        <label for="auteur">Auteurs</label>
          <select name="auteur" class="form-control">
          <?php
              foreach($LesAuteurs as $auteur) {
                if ( $mode == "Modifier"){
                    $selection=$auteur->num == $livre->getnumAuteur()->getNum() ? 'selected' : '';
                }
         
            echo "<option value='".$auteur->num."'". $selection.">".$auteur->nom."</option>";
            
          }
          ?>   
          </select>
            </div>

        <!--pour avoir l'Genre du livre-->
            <div class="form-group col-md-6">
        <label for="genre">Genres</label>
          <select name="genre" class="form-control">
          <?php
              foreach($LesGenres as $genre) {
                if ( $mode == "Modifier"){
            $selection=$genre->getNum() == $livre? 'selected' : '';
                }
            echo "<option value='".$genre->getNum()."'". $selection.">".$genre->getLibelle()."</option>";
            
          }
          ?>   
          </select>
            </div>
    </div>
      <!-- Ajouter et revenir à la liste--->

            <input type="hidden" id="num" name="num" value="<?php if ( $mode == "Modifier"){echo $livre->getNum();} ?>">
            <div class="row">
            <div class="col"> <a href="index.php?uc=livres&action=list" class="btn btn-warning btn-block">Revenir à la liste</a></div>
            <div class="col"><button type="submit" class="btn btn-success btn-block"><?php echo  $mode; ?></button></div>
            </div>
    
</form>


