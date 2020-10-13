
<div class="container mt-5">
<h2 class="pt-3 text-center"><?php echo $mode; ?> un Auteur</h2>

        <form action="index.php?uc=auteurs&action=valideform" method="POST" class="col-md-6 offset-md-3 border border-primary p-3 rounded">
            <div class="form-row">
            <div class="form-group col-md-5">
            <label for="nom">Nom</label>
            <input type="text" class="form-control" id="nom" placeholder="Saisir le nom" name="nom" value="<?php if ( $mode == "Modifier"){echo  $auteur->getNom();} ?>">
            </div>
            <div class="form-group col-md-7">
            <label for="prenom">Prenom</label>
            <input type="text" class="form-control" id="prenom" placeholder="Saisir le prenom" name="prenom" value="<?php if ( $mode == "Modifier"){echo  $auteur->getPrenom();} ?>">
            </div>
            </div>
            <!-- Continent--->
            <div class="form-group">
        <label for="Nationalite">Nationalites</label>
          <select name="Nationalite" class="form-control">
          <?php
              foreach($LesNationalites as $nationalite) {
                if ( $mode == "Modifier"){
                    $selection=$nationalite->num == $auteur->getNumNationalite()->getNum() ? 'selected' : '';
                }
         
            echo "<option value='".$nationalite->num."'". $selection.">".$nationalite->libNation."</option>";
            
          }
          ?>   
          </select>
            </div>
      <!-- Continent--->

            <input type="hidden" id="num" name="num" value="<?php if ( $mode == "Modifier"){echo $auteur->getNum();} ?>">
            <div class="row">
            <div class="col"> <a href="index.php?uc=auteurs&action=list" class="btn btn-warning btn-block">Revenir à la liste</a></div>
            <div class="col"><button type="submit" class="btn btn-success btn-block"><?php echo  $mode; ?></button></div>
            </div>
        </form>

</div>

