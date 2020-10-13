<?php   
class Livre{
   
    /**
     * Numero de Livre
     *
     * @var int
     */
    private $num;
 
        /**
     * numero Auteur(clé étrangère) rélier à num de Livre
     *
     * @var int
     */
    private $numAuteur;

    /**
     *  numero Genre(clé étrangère) rélier à num de Livre
     *
     * @var int
     */
    private $numGenre;


    /**
     * ISBN du Livre
     *
     * @var string
     */
    private $isbn;

    /**
     * Titre du livre
     *
     * @var string
     */
    private $titre;

    /**
     * Le prix du livre
     *
     * @var float
     */
    private $prix;

    /**
     * Editeur du livre
     *
     * @var string
     */
    private $editeur;

    /**
     * Année du livre
     *
     * @var int
     */
    private $annee;

    /**
     * Langue du livre
     *
     * @var string
     */
    private $langue;



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
     * Get the value of isbn
     */ 
    public function getIsbn()
    {
        return $this->isbn;
    }

    /**
     * Set the value of isbn
     *
     * @return  string
     */ 
    public function setIsbn(string $isbn) : self
    {
        $this->isbn = $isbn;

        return $this;
    }



    /**
     * Get the value of titre
     */ 
    public function getTitre()
    {
        return $this->titre;
    }

    /**
     * Set the value of titre
     *
     * @return  self
     */ 
    public function setTitre(string $titre) : self
    {
        $this->titre = $titre;

        return $this;
    }



    /**
     * Get the value of prix
     */ 
    public function getPrix()
    {
    return $this->prix;
    }

    /**
     * Set the value of prix
     *
     * @return  self
     */ 
    public function setPrix(float $prix) : self
    {
    $this->prix = $prix;

    return $this;
    }


    /**
     * Get editeur du livre
     *
     * @return  string
     */ 
    public function getEditeur()
    {
    return $this->editeur;
    }

    /**
     * Set editeur du livre
     *
     * @param  string  $editeur  Editeur du livre
     *
     * @return  self
     */ 
    public function setEditeur(string $editeur) : self
    {
    $this->editeur = $editeur;

    return $this;
    }


    /**
     * Get année du livre
     *
     * @return  int
     */ 
    public function getAnnee()
    {
    return $this->annee;
    }

    /**
     * Set année du livre
     *
     * @param  int  $annee  Année du livre
     *
     * @return  self
     */ 
    public function setAnnee(int $annee) : self
    {
    $this->annee = $annee;

    return $this;
    }


    
    /**
     * Get langue du livre
     *
     * @return  string
     */ 
    public function getLangue()
    {
    return $this->langue;
    }

    /**
     * Set langue du livre
     *
     * @param  string  $langue  Langue du livre
     *
     * @return  self
     */ 
    public function setLangue(string $langue) : self
    {
    $this->langue = $langue;

    return $this;
    }


    
   /**
    * Renvoie l'objet Livre associé
    *
    * @return Auteur
    */
    public function getnumAuteur() : Auteur
    {
        return Auteur::findByid($this->numAuteur);
    }

    /**
     * Ecrit le num Auteur
     *
     * @return  self
     */ 
    public function setnumAuteur(Auteur $auteur) : self
    {
        $this->numAuteur = $auteur->getNum();

        return $this;
    }

      /**
    * Renvoie l'objet Livre associé
    *
    * @return Genre
    */
    public function getnumGenre() : Genre
    {
        return Genre::findByid($this->numGenre);
    }

    /**
     * Ecrit le num Genre
     *
     * @return  self
     */ 
    public function setnumGenre(Genre $genre) : self
    {
        $this->numGenre = $genre->getNum();

        return $this;
    }



    /**
     * Retourne l'ensemble des Auteurs
     *
     * @return Livre[] tableau d'objet Livre
     */
    public static function findAll($titre="",$auteur="Tous",$genre="all") :array //cherche le titre, le nom et prenom  de l'auteur, le genre de livre
    {   
        // on met la requête dans une variable pour chercher $titre , l'auteur, le genre
        $textRequete="SELECT l.num, isbn, titre, prix, editeur, annee, langue, a.nom, a.prenom, g.libelle as 'libGenre' from livre l, auteur a, genre g WHERE l.numAuteur=a.num AND l.numGenre=g.num";
       
        if ($titre !="") {
            $textRequete.=" and titre LIKE '%".$titre."%'"; // le titre
        }
        if ($auteur !="Tous") {
            $textRequete.=" and a.num = ". $auteur; // le nom et prenom de l'auteur
        }
        if ($genre !="all") {
            $textRequete.=" and g.num = ". $genre; //  le genre du livre
        }

        $textRequete.=" ORDER BY  titre"; // on le groupe par le nom du titre 
        $req=MonPdo::getInstance()->prepare($textRequete); //   req prend la variable $textRequete
		$req->setFetchMode(PDO::FETCH_OBJ);
        $req->execute(); // excute req( $textRequete)
        $lesResultats=$req->fetchAll();
        return $lesResultats;
		
    }

   /**
    * Trouve un Livre  
    *
    * @param integer $id numéro du Livre
    * @return Livre objet Livre trouvé
    */
    public static function findByid(int $id) :Livre
    {
        $req=MonPdo::getInstance()->prepare("SELECT * FROM livre WHERE num= :id");
        $req->setFetchMode(PDO::FETCH_CLASS|PDO::FETCH_PROPS_LATE,'livre');
        $req->bindParam(':id',$id);
        $req->execute();
        $leResultat=$req->fetch();
        return $leResultat;

    }
    /**
     * Permet d'ajouter un Livre
     *
     * @param Livre $Livre Livre à ajouter
     * @return integer resultat(1 si l'operation à réussi, 0 sinon à échouer)
     */
    public static function add(Livre $livre) : int
    {   
        //on ajoute les infos de livre

        $req=MonPdo::getInstance()->prepare("INSERT INTO livre (isbn, titre, prix, editeur, annee, langue, numAuteur, numGenre) Values (:isbn, :titre, :prix, :editeur, :annee, :langue, :numAuteur, :numGenre)");
      $isbn= $livre->getIsbn();
      $titre= $livre->getTitre();
      $prix= $livre->getPrix();
      $editeur= $livre->getEditeur();
      $annee= $livre->getAnnee();
      $langue= $livre->getLangue();
      $numAuteur= $livre->numAuteur;
      $numGenre= $livre->numGenre;
        $req->bindParam(':isbn',$isbn);
        $req->bindParam(':titre',$titre);
        $req->bindParam(':prix',$prix);
        $req->bindParam(':editeur',$editeur);
        $req->bindParam(':annee',$annee);
        $req->bindParam(':langue',$langue);
        $req->bindParam(':numAuteur',$numAuteur);
        $req->bindParam(':numGenre', $numGenre);
$nb=$req->execute();
        return $nb;
    }
    /**
     * Permet de modifier une Auteur
     *
     * @param Auteur $auteur Auteur à modifier
     * @return integer resultat(1 si l'operation à réussi, 0 sinon à échouer)
     */
    public static function update(Livre $livre) :int
    {   
        //on modifie les infos de livre
        $req=MonPdo::getInstance()->prepare("UPDATE livre SET isbn = :isbn, titre = :titre, prix = :prix, editeur = :editeur, annee = :annee, langue = :langue, numAuteur= :numAuteur, numGenre = :numGenre WHERE num= :id");
        $isbn= $livre->getIsbn();
        $titre= $livre->getTitre();
        $prix= $livre->getPrix();
        $editeur= $livre->getEditeur();
        $annee= $livre->getAnnee();
        $langue= $livre->getLangue();
        $numAuteur= $livre->numAuteur;
        $numGenre= $livre->numGenre;
        $num=$livre->getNum();
        $req->bindParam(':id',$num);
          $req->bindParam(':isbn',$isbn);
          $req->bindParam(':titre',$titre);
          $req->bindParam(':prix',$prix);
          $req->bindParam(':editeur',$editeur);
          $req->bindParam(':annee',$annee);
          $req->bindParam(':langue',$langue);
          $req->bindParam(':numAuteur',$numAuteur);
          $req->bindParam(':numGenre', $numGenre);
 $nb=$req->execute();

        return $nb;
    }
    /**
     * Permet de supprimer une Auteur
     * 
     * @param Auteur $auteur Auteur à supprimer 
     * @return integer
     */
    public static function delete(Livre $livre) :int
    {
        $req=MonPdo::getInstance()->prepare("DELETE FROM livre WHERE num= :id");
        $num =$livre->getNum();
        $req->bindParam(':id', $num);
        $nb=$req->execute();
        return $nb;
        
    }


    public static function nbgenre() :array // Création graphique
    {
        $req=MonPdo::getInstance()->prepare("SELECT g.libelle, COUNT(g.libelle) as 'nombreGenre'  FROM livre l, genre g WHERE l.numGenre=g.num GROUP BY libelle;");
        $req->setFetchMode(PDO::FETCH_OBJ);
        $req->execute();
        $lesResultats=$req->fetchAll();
        $dataPoints=[];
        foreach ($lesResultats as $leResultat) {
            $dataPoints[]=["label"=>"$leResultat->libelle","y"=>intval($leResultat->nombreGenre)]; // création graphique avec foreach et tableau
         }
        return  $dataPoints;

    }

    public static function nbLivre() :int //
    {
        $req=MonPdo::getInstance()->prepare("SELECT  COUNT(*) as 'nombreGenre'  FROM livre");
        $req->execute();
        $leResultat=$req->fetch();
      
        return  $leResultat[0];

    }










}
?>



