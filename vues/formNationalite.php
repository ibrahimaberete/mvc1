
<div class="container mt-5">
<h2 class="pt-3 text-center"><?php echo $mode; ?> une Nationalité</h2>

        <form action="index.php?uc=nationalites&action=valideform" method="POST" class="col-md-6 offset-md-3 border border-primary p-3 rounded">
            <div class="form-group">
            <label for="libelle">Libellé</label>
            <input type="text" class="form-control" id="libelle" placeholder="Saisir le libellé" name="libelle" value="<?php if ( $mode == "Modifier"){echo  $nationalite->getLibelle();} ?>">
            </div>
            <!-- Continent--->
            <div class="form-group">
        <label for="Continent">Libellé</label>
          <select name="Continent" class="form-control">
          <?php
          foreach($LesContinents as $Continent) {
            $selection=$Continent->getNum() == $Continent ? 'selected' : '';
            echo "<option value='".$Continent->getNum()."'". $selection.">".$Continent->getLibelle()."</option>";
          }
          ?>   
          </select>
            </div>
      <!-- Continent--->

            <input type="hidden" id="num" name="num" value="<?php if ( $mode == "Modifier"){echo $nationalite->getNum();} ?>">
            <div class="row">
            <div class="col"> <a href="index.php?uc=nationalites&action=list" class="btn btn-warning btn-block">Revenir à la liste</a></div>
            <div class="col"><button type="submit" class="btn btn-success btn-block"><?php echo  $mode; ?></button></div>
            </div>
        </form>

</div>

