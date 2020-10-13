<?php   
class Auteur {
   
    /**
     * Numero de Auteur
     *
     * @var int
     */
    private $num;
 
        /**
     * numero Continent(clé étrangère) rélier à num de continent
     *
     * @var int
     */
    private $numNationalite;

    /**
     * nom d'auteurs
     *
     * @var string
     */
    private $nom;

    /**
     * prenom d'auteurs
     *
     * @var string
     */
    private $prenom;


    /**
     * Get the value of num
     */ 
    public function getNum()
    {
        return $this->num;
    }

    public function setNum(int $num)
    {
        $this->num = $num;

        return $this;
    }

    /**
     * Get the value of nom
     */ 
    public function getNom()
    {
        return $this->nom;
    }

    /**
     * Set the value of nom
     *
     * @return  self
     */ 
    public function setNom(string $nom) : self
    {
        $this->nom = $nom;

        return $this;
    }

        /**
     * Get the value of prenom
     */ 
    public function getPrenom()
    {
        return $this->prenom;
    }

    /**
     * Set the value of prenom
     *
     * @return  self
     */ 
    public function setPrenom(string $prenom) : self
    {
        $this->prenom = $prenom;

        return $this;
    }



   /**
    * Renvoie l'objet nationalite associé
    *
    * @return Nationalite
    */
    public function getnumNationalite() : Nationalite
    {
        return Nationalite::findByid($this->numNationalite);
    }

    /**
     * Ecrit le num Nationalite
     *
     * @return  self
     */ 
    public function setNumNationalite(Nationalite $nationalite) : self
    {
        $this->numNationalite = $nationalite->getNum();

        return $this;
    }


    /**
     * Retourne l'ensemble des Auteurs
     *
     * @return Auteur[] tableau d'objet continent
     */
    public static function findAll($nom="", $prenom="", $Nationalite="Tous") :array // On cherche le nom, prenom, Nationalité
    {
        $textRequete="SELECT  a.num, nom, prenom, n.libelle as 'libNationalite' from auteur a, nationalite n WHERE a.numNationalite=n.num"; //On met la requête dans une variable! 
        if ($nom !="") {
            $textRequete.=" and nom LIKE '%".$nom."%'"; // On cherche le nom
        }
        if ($prenom !="") {
            $textRequete.=" and prenom LIKE '%".$prenom."%'";  // On cherche le prenom
        }
        if ($Nationalite !="Tous") {
            $textRequete.=" and n.num = ". $Nationalite; // On cherche la nationalite
        }
        $textRequete.=" ORDER BY  nom"; // On les groupes par libellé
        $req=MonPdo::getInstance()->prepare($textRequete); // on range la variable $textRequete
	    $req->setFetchMode(PDO::FETCH_OBJ);
        $req->execute();
        $lesResultats=$req->fetchAll();
        return $lesResultats;
		
    }

   /**
    * Trouve un Auteur  par son nom et son prenom
    *
    * @param integer $id numéro du Auteur
    * @return Auteur objet continent trouvé
    */
    public static function findByid(int $id) :Auteur
    {
        $req=MonPdo::getInstance()->prepare("SELECT * FROM auteur WHERE num= :id");
        $req->setFetchMode(PDO::FETCH_CLASS|PDO::FETCH_PROPS_LATE,'auteur');
        $req->bindParam(':id',$id);
        $req->execute();
        $leResultat=$req->fetch();
        return $leResultat;

    }
    /**
     * Permet d'ajouter un Auteur
     *
     * @param Auteur $auteur Auteur à ajouter
     * @return integer resultat(1 si l'operation à réussi, 0 sinon à échouer)
     */
    public static function add(Auteur $auteur) : int
    {
        $req=MonPdo::getInstance()->prepare("INSERT INTO auteur (nom, prenom, numNationalite) Values (:nom, :prenom, :numNationalite)");
        $nom = $auteur->getNom();
        $prenom= $auteur->getPrenom();
        $numnationalite = $auteur->numNationalite;
        $req->bindParam(':nom',$nom);
        $req->bindParam(':prenom',$prenom);
        $req->bindParam(':numNationalite', $numnationalite);
        $nb=$req->execute();
        return $nb;
    }
    /**
     * Permet de modifier une Auteur
     *
     * @param Auteur $auteur Auteur à modifier
     * @return integer resultat(1 si l'operation à réussi, 0 sinon à échouer)
     */
    public static function update(Auteur $auteur) :int
    {
        $req=MonPdo::getInstance()->prepare("UPDATE auteur SET nom = :nom, prenom = :prenom, numNationalite= :numNationalite WHERE num= :id");
        $num =$auteur->getNum();
        $nom = $auteur->getNom();
        $prenom= $auteur->getPrenom();
        $numnationalite = $auteur->numNationalite;
        $req->bindParam(':id',$num);
        $req->bindParam(':nom',$nom);
        $req->bindParam(':prenom',$prenom);
        $req->bindParam(':numNationalite', $numnationalite);
        $nb=$req->execute();
        return $nb;
    }
    /**
     * Permet de supprimer une Auteur
     * 
     * @param Auteur $auteur Auteur à supprimer 
     * @return integer
     */
    public static function delete(Auteur $auteur) :int
    {
        $req=MonPdo::getInstance()->prepare("DELETE FROM auteur WHERE num= :id");
        $num =$auteur->getNum();
        $req->bindParam(':id', $num);
        $nb=$req->execute();
        return $nb;
        
    }


    public static function nbAuteur() :int //
    {
        $req=MonPdo::getInstance()->prepare("SELECT  COUNT(*) as 'nombreGenre'  FROM Auteur");
        $req->execute();
        $leResultat=$req->fetch();
      
        return  $leResultat[0];

    }




}
?>



