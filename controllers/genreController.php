<?php
$action=$_GET['action'];
switch ($action) {
    case 'list':
        $LesGenres=Genre::findAll();
       include('vues/listeGenre.php');
        break;
    
        case 'add':
            $mode="Ajouter";
           include('vues/formGenre.php');
            break;

            case 'update':
                $mode="Modifier";
                $genre=Genre::findByid($_GET['num']);
           include('vues/formGenre.php');
                break;

                case 'delete':
                    
                    $genre=Genre::findByid($_GET['num']);
                    $nb=Genre::delete($genre);
                   
                    if ($nb==1) {
                        $_SESSION['message']=["success" =>"Le Genre a bien été supprimer"];

                     }
                     else{
                      $_SESSION['message']=["danger" =>"Le Genre n'a pas été supprimer"];

                     }
                     header('location: index.php?uc=genres&action=list');
                     exit();
                break;
                    case 'valideform':
                        $genre= new Genre();
                       if (empty($_POST['num'])) { 
                            $genre->setLibelle($_POST['libelle']);
                            $nb=Genre::add($genre);
                            $message= "Ajouter";
                       }
                       else{ 
                            $genre->setNum($_POST['num']);
                            $genre->setLibelle($_POST['libelle']);
                            $nb=Genre::update($genre);
                            $message= "Modifier";
                       }
                       if ($nb==1) {
                          $_SESSION['message']=["success" =>"Le Genre a bien été $message"];

                       }
                       else{
                        $_SESSION['message']=["danger" =>"Le Genre n'a pas  été $message"];

                       }
                       header('location: index.php?uc=genres&action=list');
                        break;

}
?>