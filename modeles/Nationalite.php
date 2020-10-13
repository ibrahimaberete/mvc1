<?php   
class Nationalite {
   
    /**
     * Numero de Nationalite
     *
     * @var int
     */
    private $num;
 
   /**
    * Libelle de Nationalite
    * @var string
    */
    private $libelle;

        /**
     * numero Continent(clé étrangère) rélier à num de continent
     *
     * @var int
     */
    private $numContinent;

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
    * Renvoie l'objet continent associé
    *
    * @return Continent
    */
    public function getNumContinent() : Continent
    {
        return Continent::findByid($this->numContinent);
    }

    /**
     * Ecrit le num continent
     *
     * @return  self
     */ 
    public function setNumContinent(Continent $continent) : self
    {
        $this->numContinent = $continent->getNum();

        return $this;
    }


    /**
     * Retourne l'ensemble des Nationalites
     *
     * @return Nationalite[] tableau d'objet continent
     */
    public static function findAll($libelle="",$Continent="Tous") :array //On lui file les deux paramètres
    {
        $textRequete="SELECT n.num, n.libelle as 'libNation', c.libelle as 'libContinent' from nationalite n, Continent c WHERE n.numContinent=c.num ";
              
            //On cherche s'il y a quelque chose dans libelle, on fait la requete $textRequete, s'il y a rien on passe. 
                if ($libelle !="") {
                    $textRequete.=" and n.libelle LIKE '%".$libelle."%'";
                    }
            //On cherche s'il y a quelque chose dans Continent, on fait la requete $textRequete, s'il y a rien on passe. 
                 if ($Continent != "Tous") {
                    $textRequete.=" and c.num = ". $Continent;

                    }

                    
        $textRequete.=" ORDER BY n.libelle "; //On fait Order by n.libelle
        $req=MonPdo::getInstance()->prepare($textRequete);
        $req->setFetchMode(PDO::FETCH_OBJ);
        $req->execute();
        $lesResultats=$req->fetchAll();
        return $lesResultats;
        

    }

   /**
    * Trouve une nationalité par son nom
    *
    * @param integer $id numéro du continent
    * @return Nationalite objet continent trouvé
    */
    public static function findByid(int $id) :Nationalite
    {
        $req=MonPdo::getInstance()->prepare("SELECT * FROM nationalite WHERE num= :id");
        $req->setFetchMode(PDO::FETCH_CLASS|PDO::FETCH_PROPS_LATE,'Nationalite');
        $req->bindParam(':id',$id);
        $req->execute();
        $leResultat=$req->fetch();
        return $leResultat;

    }
    /**
     * Permet d'ajouter une Nationalité
     *
     * @param Nationalite $Nationalite Nationalité à ajouter
     * @return integer resultat(1 si l'operation à réussi, 0 sinon à échouer)
     */
    public static function add(Nationalite $nationalite) : int
    {
        $req=MonPdo::getInstance()->prepare("INSERT INTO nationalite (libelle, numContinent) Values (:libelle, :numContinent)");
        $libelle = $nationalite->getLibelle();
        $numcontinent = $nationalite->numContinent;
        $req->bindParam(':libelle',$libelle);
        $req->bindParam(':numContinent',$numcontinent);
        $nb=$req->execute();
        return $nb;
    }
    /**
     * Permet de modifier une Nationlaité
     *
     * @param Nationalite $Nationalite Nationalité à modifier
     * @return integer resultat(1 si l'operation à réussi, 0 sinon à échouer)
     */
    public static function update(Nationalite $nationalite) :int
    {
        $req=MonPdo::getInstance()->prepare("UPDATE nationalite SET libelle = :libelle, numContinent= :numContinent WHERE num= :id");
        $num = $nationalite->getNum();
        $numcontinent = $nationalite->numContinent;
        $libelle = $nationalite->getLibelle();
        $req->bindParam(':id',$num);
        $req->bindParam(':libelle',$libelle);
        $req->bindParam(':numContinent', $numcontinent);
        $nb=$req->execute();
        return $nb;
    }
    /**
     * Permet de supprimer une Nationalité
     *
     * @param Nationalite $Nationalite Nationalité à supprimer 
     * @return integer
     */
    public static function delete(Nationalite $nationalite) :int
    {
        $req=MonPdo::getInstance()->prepare("DELETE FROM nationalite WHERE num= :id");
        $num = $nationalite->getNum();
        $req->bindParam(':id', $num);
        $nb=$req->execute();
        return $nb;
        
    }



}
?>



