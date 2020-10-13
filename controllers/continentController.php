<?php
$action=$_GET['action'];
switch ($action) {
    case 'list':
        $LesContinents=Continent::findAll();
       include('vues/listeContinent.php');
        break;
    
        case 'add':
            $mode="Ajouter";
           include('vues/formContinent.php');
            break;

            case 'update':
                $mode="Modifier";
                $continent=Continent::findByid($_GET['num']);
           include('vues/formContinent.php');
                break;

                case 'delete':
                    
                    $continent=Continent::findByid($_GET['num']);
                    $nb=Continent::delete($continent);
                   
                    if ($nb==1) {
                        $_SESSION['message']=["success" =>"Le continent a bien été supprimer"];

                     }
                     else{
                      $_SESSION['message']=["danger" =>"Le continent n'a pas été supprimer"];

                     }
                     header('location: index.php?uc=continents&action=list');
                     exit();
                break;
                    case 'valideform':
                        $continent= new Continent();
                       if (empty($_POST['num'])) { 
                            $continent->setLibelle($_POST['libelle']);
                            $nb=Continent::add($continent);
                            $message= "Ajouter";
                       }
                       else{ 
                            $continent->setNum($_POST['num']);
                            $continent->setLibelle($_POST['libelle']);
                            $nb=Continent::update($continent);
                            $message= "Modifier";
                       }
                       if ($nb==1) {
                          $_SESSION['message']=["success" =>"Le continent a bien été $message"];

                       }
                       else{
                        $_SESSION['message']=["danger" =>"Le continent n'a pas  été $message"];

                       }
                       header('location: index.php?uc=continents&action=list');
                        break;

}
?>