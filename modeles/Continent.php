<?php   
class Continent {
   
    /**
     * Numero du Continent
     *
     * @var int
     */
    private $num;
 
   /**
    * Libelle di Continent
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
     * Retourne l'ensemble des continents
     *
     * @return Continent[] tableau d'objet continent
     */
    public static function findAll() :array
    {
        $req=MonPdo::getInstance()->prepare("SELECT * FROM Continent");
        $req->setFetchMode(PDO::FETCH_CLASS|PDO::FETCH_PROPS_LATE,'Continent');
        $req->execute();
        $lesResultats=$req->fetchAll();
        return $lesResultats;
    }

   /**
    * Trouve un continent par son nom
    *
    * @param integer $id numéro du continent
    * @return Continent objet continent trouvé
    */
    public static function findByid(int $id) :Continent
    {
        $req=MonPdo::getInstance()->prepare("SELECT * FROM Continent WHERE num= :id");
        $req->setFetchMode(PDO::FETCH_CLASS|PDO::FETCH_PROPS_LATE,'Continent');
        $req->bindParam(':id',$id);
        $req->execute();
        $leResultat=$req->fetch();
        return $leResultat;

    }
    /**
     * Permet d'ajouter un continent
     *
     * @param Continent $continent continent à ajouter
     * @return integer resultat(1 si l'operation à réussi, 0 sinon à échouer)
     */
    public static function add(Continent $continent) :int
    {
        $req=MonPdo::getInstance()->prepare("INSERT INTO Continent(libelle) Values(:libelle)");
        $libelle=$continent->getLibelle();
        $req->bindParam(':libelle',$libelle);
        $nb=$req->execute();
        return $nb;
    }
    /**
     * Permet de modifier un continent
     *
     * @param Continent $continent continent à modifier
     * @return integer resultat(1 si l'operation à réussi, 0 sinon à échouer)
     */
    public static function update(Continent $continent) :int
    {
        $req=MonPdo::getInstance()->prepare("update Continent set libelle = :libelle where num= :id");
        $num=$continent->getNum();
        $libelle=$continent->getLibelle();
        $req->bindParam(':id',$num);
        $req->bindParam(':libelle', $libelle);
        $nb=$req->execute();
        return $nb;
    }
    /**
     * Permet de supprimer un continent
     *
     * @param Continent $continent continent à supprimer 
     * @return integer
     */
    public static function delete(Continent $continent) :int
    {
        $req=MonPdo::getInstance()->prepare("delete from Continent where num= :id");
        $num=$continent->getNum();
        $req->bindParam(':id', $num);
        $nb=$req->execute();
        return $nb;
        
    }


    /**
     * Set numero du Continent
     *
     * @param  int  $num  Numero du Continent
     *
     * @return  self
     */ 

}
?>



