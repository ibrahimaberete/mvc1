<?php   
class Genre {
   
    /**
     * Numero du Genre
     *
     * @var int
     */
    private $num;
 
   /**
    * Libelle di Genre
    * @var string
    */
    private $libelle;


    /**
     * lit le num
     */ 
    public function getNum()
    {
        return $this->num;
    }

    /**
     * ecrit le num
     *
     * @param integer $num
     * @return void
     */
    public function setNum(int $num) :self
    {
        $this->num = $num;

        return $this;
    }
    
    /**
     * lit le libellé
     *
     * @return string
     */
        public function getLibelle() : string
        {
            return $this->libelle;
        }

  /**
   * Ecrit dans le libellé
   *
   * @param string $libelle
   * @return self
   */
    public function setLibelle(string $libelle) : self
    {
        $this->libelle = $libelle;

        return $this;
    }

    /**
     * Retourne l'ensemble des Genres
     *
     * @return Genre[] tableau d'objet Genre
     */
    public static function findAll() :array
    {
        $req=MonPdo::getInstance()->prepare("SELECT * FROM genre");
        $req->setFetchMode(PDO::FETCH_CLASS|PDO::FETCH_PROPS_LATE,'genre');
        $req->execute();
        $lesResultats=$req->fetchAll();
        return $lesResultats;
    }

   /**
    * Trouve un Genre par son nom
    *
    * @param integer $id numéro du Genre
    * @return Genre objet Genre trouvé
    */
    public static function findByid(int $id) :Genre
    {
        $req=MonPdo::getInstance()->prepare("SELECT * FROM genre WHERE num= :id");
        $req->setFetchMode(PDO::FETCH_CLASS|PDO::FETCH_PROPS_LATE,'genre');
        $req->bindParam(':id',$id);
        $req->execute();
        $leResultat=$req->fetch();
        return $leResultat;

    }
    /**
     * Permet d'ajouter un Genre
     *
     * @param Genre $Genre Genre à ajouter
     * @return integer resultat(1 si l'operation à réussi, 0 sinon à échouer)
     */
    public static function add(Genre $genre) :int
    {
        $req=MonPdo::getInstance()->prepare("INSERT INTO genre(libelle) Values(:libelle)");
        $libelle=$genre->getLibelle();
        $req->bindParam(':libelle',$libelle);
        $nb=$req->execute();
        return $nb;
    }
    /**
     * Permet de modifier un Genre
     *
     * @param Genre $Genre Genre à modifier
     * @return integer resultat(1 si l'operation à réussi, 0 sinon à échouer)
     */
    public static function update(Genre $genre) :int
    {
        $req=MonPdo::getInstance()->prepare("update genre set libelle = :libelle where num= :id");
        $num=$genre->getNum();
        $libelle=$genre->getLibelle();
        $req->bindParam(':id',$num);
        $req->bindParam(':libelle', $libelle);
        $nb=$req->execute();
        return $nb;
    }
    /**
     * Permet de supprimer un Genre
     *
     * @param Genre $Genre Genre à supprimer 
     * @return integer
     */
    public static function delete(Genre $genre) :int
    {
        $req=MonPdo::getInstance()->prepare("delete from genre where num= :id");
        $num=$genre->getNum();
        $req->bindParam(':id', $num);
        $nb=$req->execute();
        return $nb;
        
    }

    public static function nbGenre() :int //
    {
        $req=MonPdo::getInstance()->prepare("SELECT  COUNT(*) as 'nombreGenre'  FROM genre");
        $req->execute();
        $leResultat=$req->fetch();
      
        return  $leResultat[0];

    }
}
?>



