<?php
$action=$_GET['action'];
switch ($action) {
            
    
    case 'list':
        $titre=""; 
        $auteur="Tous";
        $genre="all";

        
        if (isset($_POST['titre'])) {
            $titre=$_POST['titre'];
        }

        
        if (isset($_POST['auteur'])) {
            $auteur=$_POST['auteur'];
        }

        
        if (isset($_POST['genre'])) {
            $genre=$_POST['genre'];
        }

        $LesLivres=Livre::findAll( $titre,$auteur,$genre);
        $LesGenres=Genre::findAll(); 
        $LesAuteurs=Auteur::findAll(); 
       include('vues/listeLivre.php');
      
        break;
    
    
    case 'add':
        $mode="Ajouter";
        $LesGenres=Genre::findall();
        $LesAuteurs=Auteur::findAll();
        include('vues/formLivre.php');
        break;
    
        
    case 'update':
        $mode="Modifier";
         $LesGenres=Genre::findall();
        $LesAuteurs=Auteur::findAll();
        $livre=Livre::findByid($_GET['num']);
       include('vues/formLivre.php');
        break;

        
    case 'delete':
        
        $livre=Livre::findByid($_GET['num']);
        $nb=Livre::delete($livre);
        
        if ($nb==1) {
            $_SESSION['message']=["success" =>"Le livre  a bien été supprimer"];

            }
        else{
            $_SESSION['message']=["danger" =>"Le livre  n'a pas été supprimer"];

            }
            header('location: index.php?uc=livres&action=list');
            exit();
        break;
                    case 'valideform':
                        $livre= new Livre();
                       if (empty($_POST['num'])) { 
                        $Auteur=new Auteur;
                        $Auteur=Auteur::findByid($_POST['auteur']); 
                        $livre->setnumAuteur($Auteur);
                        $Genre=new Genre;
                        $Genre=Genre::findByid($_POST['genre']);
                        $livre->setnumGenre($Genre);

                        $livre->setIsbn($_POST['isbn']);
                        $livre->setTitre($_POST['titre']);
                        $livre->setPrix($_POST['prix']);
                        $livre->setEditeur($_POST['editeur']);
                        $livre->setAnnee($_POST['annee']);
                        $livre->setLangue($_POST['langue']);
                            $nb=Livre::add($livre);
                            $message= "Ajouter";
                       }
                       else{ 
                        $Auteur=new Auteur;
                        $Auteur=Auteur::findByid($_POST['auteur']); 
                        $livre->setnumAuteur($Auteur);
                        $Genre=new Genre;
                        $Genre=Genre::findByid($_POST['genre']);
                        $livre->setnumGenre($Genre);

                            $livre->setNum($_POST['num']);
                            $livre->setIsbn($_POST['isbn']);
                            $livre->setTitre($_POST['titre']);
                            $livre->setPrix($_POST['prix']);
                            $livre->setEditeur($_POST['editeur']);
                            $livre->setAnnee($_POST['annee']);
                            $livre->setLangue($_POST['langue']);
                            $nb=Livre::update($livre);
                            $message= "Modifier";
                       }
                       if ($nb==1) {
                        
                          $_SESSION['message']=["success" =>"Le livre a bien été $message"];

                       }
                       else{
                        $_SESSION['message']=["danger" =>"Le livre n'a pas été $message"];

                       }
                   
                       header('location: index.php?uc=livres&action=list');
                break;
                case 'nbgenre':
                       

                break;
}
?>