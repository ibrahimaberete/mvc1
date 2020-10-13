
CREATE TABLE `auteur` (
  `num` smallint(6) NOT NULL auto_increment,
  `nom` varchar(25) NOT NULL default '',
  `prenom` varchar(25) default NULL,
  `nationalite` varchar(15) default NULL,
  PRIMARY KEY  (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=34 ;

-- 
-- Contenu de la table `auteur`
-- 

INSERT INTO `auteur` VALUES (1, 'Dostoeïvski', 'Fédor', 'Russe');
INSERT INTO `auteur` VALUES (2, 'Semprun', 'Jorge', 'Espagnol');
INSERT INTO `auteur` VALUES (3, 'Tolstoï', 'Leon', 'Russe');
INSERT INTO `auteur` VALUES (4, 'Steinbeck', 'John', 'Américain');
INSERT INTO `auteur` VALUES (5, 'Ferro', 'Marc', 'Français');
INSERT INTO `auteur` VALUES (6, 'Stocker', 'Bram', 'Irlandais');
INSERT INTO `auteur` VALUES (7, 'Shelley', 'Marie', 'Britannique');
INSERT INTO `auteur` VALUES (8, 'King', 'Stephen', 'Américain');
INSERT INTO `auteur` VALUES (9, 'Grass', 'Gunter', 'Allemand');
INSERT INTO `auteur` VALUES (10, 'Barjavel', 'René', 'Français');
INSERT INTO `auteur` VALUES (11, 'Simmons', 'Dan', 'Américain');
INSERT INTO `auteur` VALUES (12, 'Herbert', 'Frank', 'Américain');
INSERT INTO `auteur` VALUES (13, 'Clarke', 'Arthur C.', 'Britannique');
INSERT INTO `auteur` VALUES (14, 'Bradbury', 'Ray', 'Américain');
INSERT INTO `auteur` VALUES (15, 'Dick', 'Philip K.', 'Américain');
INSERT INTO `auteur` VALUES (16, 'Orwell', 'Georges', 'Britannique');
INSERT INTO `auteur` VALUES (17, 'Hugo', 'Victor', 'Français');
INSERT INTO `auteur` VALUES (18, 'Zola', 'Emile', 'Français');
INSERT INTO `auteur` VALUES (19, 'Morris', NULL, 'Belge');
INSERT INTO `auteur` VALUES (20, 'Flaubert', 'Gustave', 'Français');
INSERT INTO `auteur` VALUES (21, 'Asimov', 'Isaac', 'Américain');
INSERT INTO `auteur` VALUES (22, 'Miller', 'Frank', 'Américain');
INSERT INTO `auteur` VALUES (23, 'Eco', 'Umberto', 'Italien');
INSERT INTO `auteur` VALUES (24, 'Irving', 'John', 'Américain');
INSERT INTO `auteur` VALUES (25, 'Braudel', 'Fernand', 'Français');
INSERT INTO `auteur` VALUES (26, 'Camus', 'Albert', 'Français');
INSERT INTO `auteur` VALUES (27, 'Vian', 'Boris', 'Français');
INSERT INTO `auteur` VALUES (28, 'Lehane', 'Dennis', 'Américain');
INSERT INTO `auteur` VALUES (29, 'Oe', 'Kenzaburo', 'Japonais');
INSERT INTO `auteur` VALUES (30, 'Kertesz', 'Imre', 'Hongrois');
INSERT INTO `auteur` VALUES (31, 'Garcia Marquez', 'Gabriel', 'Colombien');
INSERT INTO `auteur` VALUES (32, 'Pratt', 'Hugo', 'Italien');
INSERT INTO `auteur` VALUES (33, 'Cooper', 'Fenimore', 'Américain');


CREATE TABLE `genre` (
  `num` tinyint(4) NOT NULL auto_increment,
  `libelle` varchar(25) NOT NULL default '',
  PRIMARY KEY  (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=8 ;


INSERT INTO `genre` VALUES (1, 'Littérature');
INSERT INTO `genre` VALUES (2, 'Terreur');
INSERT INTO `genre` VALUES (3, 'Science-Fiction');
INSERT INTO `genre` VALUES (4, 'BD');
INSERT INTO `genre` VALUES (5, 'Essai');
INSERT INTO `genre` VALUES (6, 'Policier');
INSERT INTO `genre` VALUES (7, 'Roman contemporain');


CREATE TABLE `livre` (
  `num` smallint(6) NOT NULL auto_increment,
  `ISBN` varchar(14) NOT NULL,
  `titre` varchar(50) NOT NULL default '',
  `prix` float default NULL,
  `editeur` varchar(25) default NULL,
  `annee` smallint(4) default NULL,
  `langue` varchar(25) default NULL,
  `numAuteur` smallint(6) default NULL,
  `numGenre` tinyint(4) default NULL,
  PRIMARY KEY  (`num`),
  CONSTRAINT `livre_fk_1` FOREIGN KEY (`numAuteur`) REFERENCES auteur(`num`),
  CONSTRAINT `livre_fk_2` FOREIGN KEY (`numGenre`) REFERENCES genre(`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=50 ;


INSERT INTO `livre` VALUES (1,'2-07-038692-6', 'Les fréres Karamazov', 7, 'Folio', 1880, 'Russe', 1, 1);
INSERT INTO `livre` VALUES (2,'2-07-036893-9', 'Le Joueur', 5, 'Folio', 1866, 'Russe', 1, 1);
INSERT INTO `livre` VALUES (3,'2-07-074049-8', 'L''écriture ou la vie', 15, 'Gallimard', 1994, 'Français', 2, 1);
INSERT INTO `livre` VALUES (4,'2-07-036287-6', 'Guerre et Paix', 8, 'Folio', 1869, 'Russe', 3, 1);
INSERT INTO `livre` VALUES (5,'2-07-036083-0', 'Les raisins de la colère', 6, 'Folio', 1947, 'Américain', 4, 1);
INSERT INTO `livre` VALUES (6,'2-02-018381-1', 'Histoire des colonisations', 20, 'Seuil', 1994, 'Français', 5, 5);
INSERT INTO `livre` VALUES (7,'2-266-05366-3', 'Dracula', 6, 'Pocket', 1897, 'Anglais', 6, 2);
INSERT INTO `livre` VALUES (8,'2-501-00279-2', 'Frankenstein', 6, 'Marabout', 1818, 'Anglais', 7, 2);
INSERT INTO `livre` VALUES (9,'2-277-21197-4', 'Shining', 6, 'J''ai Lu', 1977, 'Américain', 8, 2);
INSERT INTO `livre` VALUES (10,'2-8001-1455-X', 'L''évasion des Dalton', 9, 'Dupuis', 1960, 'Français', 19, 4);
INSERT INTO `livre` VALUES (11,'2-258-00139-0', 'La Nuit des temps', 6, 'Pocket', 1968, 'Français', 10, 3);
INSERT INTO `livre` VALUES (12,'2-253-13862-2', 'Nuit d''été', 6, 'Albin Michel', 1991, 'Français', 11, 2);
INSERT INTO `livre` VALUES (13,'2-266-02665-8', 'Dune', 6, 'Pocket', 1965, 'Américain', 12, 3);
INSERT INTO `livre` VALUES (14,'2-290-00349-2', '2001 L''odyssée de l''espace', 5, 'J''ai Lu', 1968, 'Anglais', 13, 3);
INSERT INTO `livre` VALUES (15,'2-207-30008-0', 'Fahrenheit 451', 5, 'Denoël', 1953, 'Américain', 14, 3);
INSERT INTO `livre` VALUES (16,'2-277-21768-9', 'Blade Runner', 5, 'J''ai Lu', 1968, 'Américain', 15, 3);
INSERT INTO `livre` VALUES (17,'2-8001-1452-5', 'Les cousins Dalton', 7, 'Dupuis', 1958, 'Français', 19, 4);
INSERT INTO `livre` VALUES (18,'2-07-036822-X', '1984', 7, 'Folio', 1948, 'Anglais', 16, 1);
INSERT INTO `livre` VALUES (19,'2-07-037093-3', 'Quatrevingt-treize', 6, 'Folio', 1874, 'Français', 17, 1);
INSERT INTO `livre` VALUES (20,'2-266-08308-2', 'Les Misérables', 12, 'Folio', 1862, 'Français', 17, 1);
INSERT INTO `livre` VALUES (21,'2-07-037001-1', 'Germinal', 7, 'Folio', 1885, 'Français', 18, 1);
INSERT INTO `livre` VALUES (22,'2-07-037051-8', 'L''assommoir', 7, 'Folio', 1877, 'Français', 18, 1);
INSERT INTO `livre` VALUES (23,'2-8001-1441-X', 'La mine d''or de Dick Digger', 9, 'Dargaud', 1949, 'Français', 19, 4);
INSERT INTO `livre` VALUES (24,'2-234-04964-4', 'Lourdes', 15, 'Stock', 1894, 'Français', 18, 1);
INSERT INTO `livre` VALUES (25,'2-234-04963-6', 'Paris', 15, 'Stock', 1898, 'Français', 18, 1);
INSERT INTO `livre` VALUES (26,'2-8001-1457-6', 'Sur la piste des Dalton', 9, 'Dupuis', 1962, 'Français', 19, 4);
INSERT INTO `livre` VALUES (27,'2-8001-1462-2', 'Les Dalton dans le blizzard', 9, 'Dupuis', 1963, 'Français', 19, 4);
INSERT INTO `livre` VALUES (28,'2-205-00585-5', 'Ma Dalton', 9, 'Dargaud', 1971, 'Français', 19, 4);
INSERT INTO `livre` VALUES (29,'2-234-049652', 'Rome', 15, 'Stock', 1896, 'Français', 18, 1);
INSERT INTO `livre` VALUES (30,'2-02-031430-4', 'Le Tambour', 9, 'Seuil', 1959, 'Allemand', 9, 1);
INSERT INTO `livre` VALUES (31,'2-8001-1471-1', 'Tortillas pour les Dalton', 9, 'Dupuis', 1967, 'Français', 19, 4);
INSERT INTO `livre` VALUES (32,'2-070-30878-2', 'Salammbô', 8, 'Folio', 1862, 'Français', 20, 1);
INSERT INTO `livre` VALUES (33,'2-207-30089-7', 'Fondation', 7, 'Denoël', 1951, 'Américain', 21, 3);
INSERT INTO `livre` VALUES (34,'2-070-41311-X', 'Madame Bovary', 8, 'Folio', 1857, 'Français', 20, 1);
INSERT INTO `livre` VALUES (35,'2-277-12453-2', 'Les robots', 5, 'J''ai Lu', 1950, 'Américain', 21, 3);
INSERT INTO `livre` VALUES (36,'2-070-74277-6', 'Notes de Hiroshima', 11, 'Marabout', 1965, 'Japonais', 29, 5);
INSERT INTO `livre` VALUES (37,'2-7427-1542-8', 'Etre sans destin', 9, 'Actes Sud', 1975, 'Hongrois', 30, 1);
INSERT INTO `livre` VALUES (38,'2-020-23811-X', 'Cent ans de solitude', 6, 'Actes Sud', 1967, 'Espagnol', 31, 1);
INSERT INTO `livre` VALUES (39,'2-253-00597-5', 'A l''Est d''Eden', 7, 'Le Livre de Poche', 1952, 'Américain', 4, 1);
INSERT INTO `livre` VALUES (40,'2-02-036376-3', 'Le Monde selon Garp', 8, 'Seuil', 1976, 'Américain', 24, 7);
INSERT INTO `livre` VALUES (41,'2-253-003313-8', 'Le Nom de la Rose', 6, 'Le Livre de Poche', 1980, 'Italien', 23, 1);
INSERT INTO `livre` VALUES (42,'2-7436-1281-9', 'Mystic River', 9, 'Rivages', 2001, 'Américain', 28, 6);
INSERT INTO `livre` VALUES (43,'2-070-36042-3', 'La Peste', 5, 'Folio', 1947, 'Français', 26, 1);
INSERT INTO `livre` VALUES (44,'2-2531-4087-2', 'L''Ecume des Jours', 8, 'Folio', 1947, 'Français', 27, 7);
INSERT INTO `livre` VALUES (45,'2-87827-038-X', 'Sin City', 11, 'Rackham', 1994, 'Américain', 22, 4);
INSERT INTO `livre` VALUES (46,'2-203-34411-3', 'La Ballade de la Mer Salée', 14, 'Casterman', 1967, 'Italien', 32, 4);
INSERT INTO `livre` VALUES (47,'2-253-06168-9', 'La Méditerranée', 8, 'Le Livre de Poche', 1949, 'Français', 25, 5);
INSERT INTO `livre` VALUES (48,'2-08-070611-X', 'Le Dernier des Mohicans', 7, 'Marabout', 1826, 'Américain', 33, 1);
INSERT INTO `livre` VALUES (49,'2-277-11830-3', 'Avant l''Eden', 6, 'J''ai Lu', 1974, 'Anglais', 13, 3);

CREATE TABLE `adherent` (
  `num` smallint(6) NOT NULL auto_increment,
  `nom` varchar(25) NOT NULL default '',
  `prenom` varchar(25) NOT NULL default '',
  `adrRue` varchar(50) default NULL,
  `adrCP` mediumint(5) default NULL,
  `adrVille` varchar(25) default NULL,
  `tel` varchar(10) default NULL,
  `mel` varchar(25) default NULL,
  PRIMARY KEY  (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=21 ;


INSERT INTO `adherent` VALUES (1, 'Deltour', 'Charles', '4 rue du Pont', 95100, 'Argenteuil', '01...', 'cdeltour@hotmail.com');
INSERT INTO `adherent` VALUES (2, 'Fime', 'Nadia', '5 rue du Montparnasse', 75006, 'Paris', '06...', NULL);
INSERT INTO `adherent` VALUES (3, 'Ertau', 'Frank', '4 Avenue du président Wilson', 94320, 'Cachan', '01...', 'frank.ertau@laposte.net');
INSERT INTO `adherent` VALUES (4, 'Maneur', 'David', '6 rue Charles Péguy', 94000, 'Créteil', '01...', NULL);
INSERT INTO `adherent` VALUES (5, 'Berezovski', 'Sylvie', '18 rue du Château', 91150, 'Etampes', '01...', NULL);
INSERT INTO `adherent` VALUES (6, 'Finley', 'Pascale', '25 rue de Tolbiac', 75013, 'Paris', '01...', 'pascfinley@yahoo.fr');
INSERT INTO `adherent` VALUES (7, 'Vofur', 'Hector', '18 rue Deparcieux', 75014, 'Paris', '01...', 'hvofur@free.fr');
INSERT INTO `adherent` VALUES (8, 'Derzou', 'Fred', '230 avenue de la liberté', 93100, 'Montreuil-sous-bois', '01...', 'ouzala@aol.com');
INSERT INTO `adherent` VALUES (9, 'Serty', 'Julie', '23 rue du Calvaire', 92800, 'Suresnes', '01...', NULL);
INSERT INTO `adherent` VALUES (10, 'Vofur', 'Victor', '18 rue Deparcieux', 75014, 'Paris', '01...', 'victor.vofur@laposte.net');
INSERT INTO `adherent` VALUES (11, 'Calende', 'Hugo', '22 rue des jardins', 91000, 'Evry', '01...', NULL);
INSERT INTO `adherent` VALUES (12, 'Jemba', 'Hubert', '10 rue du 8 mai 1945', 78000, 'Versailles', '01...', 'jaimeba@yahoo.fr');
INSERT INTO `adherent` VALUES (13, 'Morin', 'Séverine', '4 rue du bac', 93000, 'Saint Denis', '01...', 'morinsev@hotmail.com');
INSERT INTO `adherent` VALUES (14, 'Benrech', 'Tarek', '79 rue de Sèvres', 95000, 'Nanterre', '01...', NULL);
INSERT INTO `adherent` VALUES (15, 'Nguyen', 'Marc', '53 impasse Tourneur', 91400, 'Orsay', '01...', 'nguyen774@wanadoo.fr');
INSERT INTO `adherent` VALUES (16, 'Louali', 'Karima', '89 avenue Poincaré', 75001, 'Paris', '01...', 'kloua@caramail.fr');
INSERT INTO `adherent` VALUES (17, 'Paolo', 'Marco', '14 rue du Caire', 91300, 'Massy', '01...', NULL);
INSERT INTO `adherent` VALUES (18, 'Map', 'Joanna', '120 boulevard Voltaire', 75012, 'Paris', '01...', NULL);
INSERT INTO `adherent` VALUES (19, 'Koundé', 'Fatoumata', '4 Place Carrée', 77000, 'Melun', '01...', NULL);
INSERT INTO `adherent` VALUES (20, 'Derissam', 'Bachir', '1 rue des Indes', 78550, 'Houdan', '01...', NULL);


CREATE TABLE `pret` (
  `num` smallint(6) NOT NULL auto_increment,
  `numLivre` smallint(6) NOT NULL default '0',
  `numAdherent` smallint(6) NOT NULL default '0',
  `datePret` date NOT NULL,
  `dateRetourPrevue` date NOT NULL,
  `dateRetourReelle` date default NULL,
  PRIMARY KEY  (`num`),
  CONSTRAINT `pret_fk_1` FOREIGN KEY (`numLivre`) REFERENCES livre(`num`),
  CONSTRAINT `pret_fk_2` FOREIGN KEY (`numAdherent`) REFERENCES adherent(`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


INSERT INTO `pret` VALUES (null,'1','1','2013-06-02','2013-06-16','2013-06-16'); 
INSERT INTO `pret` VALUES (null,'1','2','2013-05-02','2013-05-16','2013-05-12'); 
INSERT INTO `pret` VALUES (null,'1','3','2013-05-13','2013-05-27','2013-05-22'); 
INSERT INTO `pret` VALUES (null,'1','14','2013-06-18','2013-07-02','2013-07-01'); 
INSERT INTO `pret` VALUES (null,'2','5','2013-05-22','2013-06-05','2013-06-04'); 
INSERT INTO `pret` VALUES (null,'2','6','2013-06-06','2013-06-20','2013-06-13'); 
INSERT INTO `pret` VALUES (null,'2','14','2013-05-04','2013-05-18','2013-05-20'); 
INSERT INTO `pret` VALUES (null,'3','6','2013-05-07','2013-05-21','2013-05-18'); 
INSERT INTO `pret` VALUES (null,'3','7','2013-05-19','2013-06-02','2013-06-02'); 
INSERT INTO `pret` VALUES (null,'3','8','2013-06-03','2013-06-17','2013-06-16'); 
INSERT INTO `pret` VALUES (null,'4','9','2013-05-10','2013-05-24','2013-05-19'); 
INSERT INTO `pret` VALUES (null,'4','10','2013-05-20','2013-06-03','2013-06-05'); 
INSERT INTO `pret` VALUES (null,'4','11','2013-06-06','2013-06-20','2013-06-21'); 
INSERT INTO `pret` VALUES (null,'5','4','2013-05-21','2013-06-04','2013-06-01'); 
INSERT INTO `pret` VALUES (null,'5','5','2013-05-13','2013-05-27','2013-05-20'); 
INSERT INTO `pret` VALUES (null,'5','8','2013-06-02','2013-06-16','2013-06-16'); 
INSERT INTO `pret` VALUES (null,'5','14','2013-06-18','2013-07-02','2013-06-29'); 
INSERT INTO `pret` VALUES (null,'6','2','2013-06-20','2013-07-04','2013-07-05'); 
INSERT INTO `pret` VALUES (null,'6','4','2013-08-15','2013-08-29','2013-08-28'); 
INSERT INTO `pret` VALUES (null,'6','6','2013-07-07','2013-07-21','2013-07-18'); 
INSERT INTO `pret` VALUES (null,'6','7','2013-05-16','2013-05-30','2013-05-25'); 
INSERT INTO `pret` VALUES (null,'6','8','2013-07-19','2013-08-02','2013-08-12'); 
INSERT INTO `pret` VALUES (null,'6','9','2013-05-26','2013-06-09','2013-06-11'); 
INSERT INTO `pret` VALUES (null,'6','16','2013-08-29','2013-09-12','2013-09-13'); 
INSERT INTO `pret` VALUES (null,'6','16','2013-09-14','2013-09-28','2013-09-30'); 
INSERT INTO `pret` VALUES (null,'7','3','2013-05-19','2013-06-02','2013-05-26'); 
INSERT INTO `pret` VALUES (null,'7','3','2013-07-10','2013-07-24','2013-07-21'); 
INSERT INTO `pret` VALUES (null,'7','6','2013-05-27','2013-06-10','2013-06-10'); 
INSERT INTO `pret` VALUES (null,'7','7','2013-07-22','2013-08-05','2013-08-07'); 
INSERT INTO `pret` VALUES (null,'7','9','2013-06-15','2013-06-29','2013-06-25'); 
INSERT INTO `pret` VALUES (null,'7','13','2013-06-30','2013-07-14','2013-07-09'); 
INSERT INTO `pret` VALUES (null,'8','4','2013-05-20','2013-06-03','2013-05-31'); 
INSERT INTO `pret` VALUES (null,'8','6','2013-09-01','2013-09-15','2013-09-15'); 
INSERT INTO `pret` VALUES (null,'8','6','2013-09-18','2013-10-02','2013-10-01'); 
INSERT INTO `pret` VALUES (null,'8','7','2013-06-03','2013-06-17','2013-06-27'); 
INSERT INTO `pret` VALUES (null,'8','8','2013-06-30','2013-07-14','2013-07-16'); 
INSERT INTO `pret` VALUES (null,'8','8','2013-10-03','2013-10-17','2013-10-12'); 
INSERT INTO `pret` VALUES (null,'8','10','2013-08-05','2013-08-19','2013-08-12'); 
INSERT INTO `pret` VALUES (null,'8','16','2013-07-19','2013-08-02','2013-08-03'); 
INSERT INTO `pret` VALUES (null,'8','16','2013-08-14','2013-08-28','2013-08-25'); 
INSERT INTO `pret` VALUES (null,'9','7','2013-08-02','2013-08-16','2013-08-11'); 
INSERT INTO `pret` VALUES (null,'9','8','2013-06-06','2013-06-20','2013-06-21'); 
INSERT INTO `pret` VALUES (null,'9','8','2013-07-04','2013-07-18','2013-07-15'); 
INSERT INTO `pret` VALUES (null,'9','10','2013-05-20','2013-06-03','2013-06-05'); 
INSERT INTO `pret` VALUES (null,'9','11','2013-06-21','2013-07-05','2013-06-28'); 
INSERT INTO `pret` VALUES (null,'9','11','2013-08-31','2013-09-14','2013-09-15'); 
INSERT INTO `pret` VALUES (null,'9','12','2013-08-13','2013-08-27','2013-08-29'); 
INSERT INTO `pret` VALUES (null,'9','12','2013-09-15','2013-09-29','2013-09-26'); 
INSERT INTO `pret` VALUES (null,'9','12','2013-10-01','2013-10-15',NULL); 
INSERT INTO `pret` VALUES (null,'9','15','2013-07-16','2013-07-30','2013-07-30'); 
INSERT INTO `pret` VALUES (null,'10','1','2013-05-02','2013-05-16','2013-05-05'); 
INSERT INTO `pret` VALUES (null,'10','1','2013-05-05','2013-05-19','2013-05-06'); 
INSERT INTO `pret` VALUES (null,'10','1','2013-05-06','2013-05-20','2013-05-07'); 
INSERT INTO `pret` VALUES (null,'10','1','2013-05-07','2013-05-21','2013-05-08'); 
INSERT INTO `pret` VALUES (null,'10','1','2013-05-08','2013-05-22','2013-05-10'); 
INSERT INTO `pret` VALUES (null,'10','1','2013-05-10','2013-05-24','2013-05-10'); 
INSERT INTO `pret` VALUES (null,'10','2','2013-05-10','2013-05-24','2013-05-11'); 
INSERT INTO `pret` VALUES (null,'10','2','2013-05-11','2013-05-25','2013-05-12'); 
INSERT INTO `pret` VALUES (null,'10','2','2013-05-12','2013-05-26','2013-05-15'); 
INSERT INTO `pret` VALUES (null,'10','2','2013-05-15','2013-05-29','2013-05-18'); 
INSERT INTO `pret` VALUES (null,'10','2','2013-05-18','2013-06-01','2013-05-19'); 
INSERT INTO `pret` VALUES (null,'10','2','2013-05-19','2013-06-02','2013-05-20'); 
INSERT INTO `pret` VALUES (null,'10','2','2013-05-20','2013-06-03','2013-05-21'); 
INSERT INTO `pret` VALUES (null,'10','2','2013-05-21','2013-06-04','2013-05-22'); 
INSERT INTO `pret` VALUES (null,'10','2','2013-05-22','2013-06-05','2013-05-23'); 
INSERT INTO `pret` VALUES (null,'10','2','2013-05-23','2013-06-06','2013-05-24'); 
INSERT INTO `pret` VALUES (null,'10','2','2013-05-24','2013-06-07','2013-05-26'); 
INSERT INTO `pret` VALUES (null,'10','2','2013-05-26','2013-06-09','2013-05-27'); 
INSERT INTO `pret` VALUES (null,'10','2','2013-05-27','2013-06-10','2013-05-30'); 
INSERT INTO `pret` VALUES (null,'10','3','2013-05-30','2013-06-13','2013-05-30'); 
INSERT INTO `pret` VALUES (null,'10','4','2013-05-30','2013-06-13','2013-06-02'); 
INSERT INTO `pret` VALUES (null,'10','4','2013-06-02','2013-06-16','2013-06-04'); 
INSERT INTO `pret` VALUES (null,'10','4','2013-06-04','2013-06-18','2013-06-06'); 
INSERT INTO `pret` VALUES (null,'10','4','2013-06-06','2013-06-20','2013-06-07'); 
INSERT INTO `pret` VALUES (null,'10','4','2013-06-07','2013-06-21','2013-06-08'); 
INSERT INTO `pret` VALUES (null,'10','4','2013-06-08','2013-06-22','2013-06-09'); 
INSERT INTO `pret` VALUES (null,'10','5','2013-06-09','2013-06-23','2013-06-10'); 
INSERT INTO `pret` VALUES (null,'10','5','2013-06-10','2013-06-24','2013-06-11'); 
INSERT INTO `pret` VALUES (null,'10','5','2013-06-11','2013-06-25','2013-06-13'); 
INSERT INTO `pret` VALUES (null,'10','5','2013-06-13','2013-06-27','2013-06-16'); 
INSERT INTO `pret` VALUES (null,'10','6','2013-06-16','2013-06-30','2013-06-17'); 
INSERT INTO `pret` VALUES (null,'10','6','2013-06-17','2013-07-01','2013-06-18'); 
INSERT INTO `pret` VALUES (null,'10','6','2013-06-18','2013-07-02','2013-06-19'); 
INSERT INTO `pret` VALUES (null,'10','6','2013-06-19','2013-07-03','2013-06-20'); 
INSERT INTO `pret` VALUES (null,'10','7','2013-06-20','2013-07-04','2013-06-21'); 
INSERT INTO `pret` VALUES (null,'10','7','2013-06-21','2013-07-05','2013-06-23'); 
INSERT INTO `pret` VALUES (null,'10','7','2013-06-23','2013-07-07','2013-06-26'); 
INSERT INTO `pret` VALUES (null,'10','7','2013-06-26','2013-07-10','2013-06-27'); 
INSERT INTO `pret` VALUES (null,'10','7','2013-06-27','2013-07-11','2013-06-28'); 
INSERT INTO `pret` VALUES (null,'10','7','2013-06-28','2013-07-12','2013-06-29'); 
INSERT INTO `pret` VALUES (null,'10','7','2013-06-29','2013-07-13','2013-06-30'); 
INSERT INTO `pret` VALUES (null,'10','7','2013-06-30','2013-07-14','2013-07-01'); 
INSERT INTO `pret` VALUES (null,'10','7','2013-07-01','2013-07-15','2013-07-03'); 
INSERT INTO `pret` VALUES (null,'10','8','2013-07-03','2013-07-17','2013-07-06'); 
INSERT INTO `pret` VALUES (null,'10','8','2013-07-06','2013-07-20','2013-07-07'); 
INSERT INTO `pret` VALUES (null,'10','8','2013-07-07','2013-07-21','2013-07-08'); 
INSERT INTO `pret` VALUES (null,'10','8','2013-07-08','2013-07-22','2013-07-09'); 
INSERT INTO `pret` VALUES (null,'10','8','2013-07-09','2013-07-23','2013-07-10'); 
INSERT INTO `pret` VALUES (null,'10','8','2013-07-10','2013-07-24','2013-07-11'); 
INSERT INTO `pret` VALUES (null,'10','8','2013-07-11','2013-07-25','2013-07-13'); 
INSERT INTO `pret` VALUES (null,'10','8','2013-07-13','2013-07-27','2013-07-16'); 
INSERT INTO `pret` VALUES (null,'10','8','2013-07-16','2013-07-30','2013-07-17'); 
INSERT INTO `pret` VALUES (null,'10','8','2013-07-17','2013-07-31','2013-07-18'); 
INSERT INTO `pret` VALUES (null,'10','9','2013-07-18','2013-08-01','2013-07-19'); 
INSERT INTO `pret` VALUES (null,'10','9','2013-07-19','2013-08-02','2013-07-20'); 
INSERT INTO `pret` VALUES (null,'10','9','2013-07-20','2013-08-03','2013-07-21'); 
INSERT INTO `pret` VALUES (null,'10','9','2013-07-21','2013-08-04','2013-07-23'); 
INSERT INTO `pret` VALUES (null,'10','9','2013-07-23','2013-08-06','2013-07-26'); 
INSERT INTO `pret` VALUES (null,'10','9','2013-07-26','2013-08-09','2013-07-27'); 
INSERT INTO `pret` VALUES (null,'10','10','2013-07-27','2013-08-10','2013-07-28'); 
INSERT INTO `pret` VALUES (null,'10','10','2013-07-28','2013-08-11','2013-07-29'); 
INSERT INTO `pret` VALUES (null,'10','10','2013-07-29','2013-08-12','2013-07-30'); 
INSERT INTO `pret` VALUES (null,'10','10','2013-07-30','2013-08-13','2013-07-31'); 
INSERT INTO `pret` VALUES (null,'10','10','2013-07-31','2013-08-14','2013-08-02'); 
INSERT INTO `pret` VALUES (null,'10','10','2013-08-02','2013-08-16','2013-08-05'); 
INSERT INTO `pret` VALUES (null,'10','10','2013-08-05','2013-08-19','2013-08-06'); 
INSERT INTO `pret` VALUES (null,'10','11','2013-08-06','2013-08-20','2013-08-07'); 
INSERT INTO `pret` VALUES (null,'10','11','2013-08-07','2013-08-21','2013-08-08'); 
INSERT INTO `pret` VALUES (null,'10','11','2013-08-08','2013-08-22','2013-08-09'); 
INSERT INTO `pret` VALUES (null,'10','11','2013-08-09','2013-08-23','2013-08-10'); 
INSERT INTO `pret` VALUES (null,'10','11','2013-08-10','2013-08-24','2013-08-12'); 
INSERT INTO `pret` VALUES (null,'10','12','2013-08-12','2013-08-26','2013-08-15'); 
INSERT INTO `pret` VALUES (null,'10','12','2013-08-15','2013-08-29','2013-08-16'); 
INSERT INTO `pret` VALUES (null,'10','12','2013-08-16','2013-08-30','2013-08-17'); 
INSERT INTO `pret` VALUES (null,'10','12','2013-08-17','2013-08-31','2013-08-18'); 
INSERT INTO `pret` VALUES (null,'10','12','2013-08-18','2013-09-01','2013-08-19'); 
INSERT INTO `pret` VALUES (null,'10','12','2013-08-19','2013-09-02','2013-08-20'); 
INSERT INTO `pret` VALUES (null,'10','12','2013-08-20','2013-09-03','2013-08-22'); 
INSERT INTO `pret` VALUES (null,'10','13','2013-08-22','2013-09-05','2013-08-25'); 
INSERT INTO `pret` VALUES (null,'10','13','2013-08-25','2013-09-08','2013-08-26'); 
INSERT INTO `pret` VALUES (null,'10','13','2013-08-26','2013-09-09','2013-08-27'); 
INSERT INTO `pret` VALUES (null,'10','13','2013-08-27','2013-09-10','2013-08-28'); 
INSERT INTO `pret` VALUES (null,'10','13','2013-08-28','2013-09-11','2013-08-29'); 
INSERT INTO `pret` VALUES (null,'10','13','2013-08-29','2013-09-12','2013-08-30'); 
INSERT INTO `pret` VALUES (null,'10','14','2013-08-30','2013-09-13','2013-09-01'); 
INSERT INTO `pret` VALUES (null,'10','14','2013-09-01','2013-09-15','2013-09-04'); 
INSERT INTO `pret` VALUES (null,'10','14','2013-09-04','2013-09-18','2013-09-05'); 
INSERT INTO `pret` VALUES (null,'10','14','2013-09-05','2013-09-19','2013-09-06'); 
INSERT INTO `pret` VALUES (null,'10','14','2013-09-06','2013-09-20','2013-09-07'); 
INSERT INTO `pret` VALUES (null,'10','14','2013-09-07','2013-09-21','2013-09-08'); 
INSERT INTO `pret` VALUES (null,'10','14','2013-09-08','2013-09-22','2013-09-09'); 
INSERT INTO `pret` VALUES (null,'10','14','2013-09-09','2013-09-23','2013-09-11'); 
INSERT INTO `pret` VALUES (null,'10','14','2013-09-11','2013-09-25','2013-09-14'); 
INSERT INTO `pret` VALUES (null,'10','14','2013-09-14','2013-09-28','2013-09-15'); 
INSERT INTO `pret` VALUES (null,'10','14','2013-09-15','2013-09-29','2013-09-16'); 
INSERT INTO `pret` VALUES (null,'10','14','2013-09-16','2013-09-30','2013-09-17'); 
INSERT INTO `pret` VALUES (null,'10','15','2013-09-17','2013-10-01','2013-09-18'); 
INSERT INTO `pret` VALUES (null,'10','15','2013-09-18','2013-10-02','2013-09-19'); 
INSERT INTO `pret` VALUES (null,'10','15','2013-09-19','2013-10-03','2013-09-21'); 
INSERT INTO `pret` VALUES (null,'10','15','2013-09-21','2013-10-05','2013-09-24'); 
INSERT INTO `pret` VALUES (null,'10','15','2013-09-24','2013-10-08','2013-09-25'); 
INSERT INTO `pret` VALUES (null,'10','15','2013-09-25','2013-10-09','2013-09-26'); 
INSERT INTO `pret` VALUES (null,'10','15','2013-09-26','2013-10-10','2013-09-27'); 
INSERT INTO `pret` VALUES (null,'10','15','2013-09-27','2013-10-11','2013-09-28'); 
INSERT INTO `pret` VALUES (null,'11','1','2013-05-10','2013-05-24','2013-05-23'); 
INSERT INTO `pret` VALUES (null,'11','4','2013-07-12','2013-07-26','2013-07-21'); 
INSERT INTO `pret` VALUES (null,'11','4','2013-07-22','2013-08-05','2013-08-02'); 
INSERT INTO `pret` VALUES (null,'11','5','2013-08-05','2013-08-19','2013-08-12'); 
INSERT INTO `pret` VALUES (null,'11','9','2013-09-13','2013-09-27','2013-09-29'); 
INSERT INTO `pret` VALUES (null,'11','12','2013-07-03','2013-07-17','2013-07-10'); 
INSERT INTO `pret` VALUES (null,'11','14','2013-10-03','2013-10-17','2013-10-07'); 
INSERT INTO `pret` VALUES (null,'12','3','2013-06-20','2013-07-04','2013-06-29'); 
INSERT INTO `pret` VALUES (null,'12','3','2013-07-03','2013-07-17','2013-07-12'); 
INSERT INTO `pret` VALUES (null,'12','4','2013-08-12','2013-08-26','2013-08-27'); 
INSERT INTO `pret` VALUES (null,'12','6','2013-06-10','2013-06-24','2013-06-19'); 
INSERT INTO `pret` VALUES (null,'12','8','2013-05-04','2013-05-18','2013-05-13'); 
INSERT INTO `pret` VALUES (null,'12','8','2013-07-24','2013-08-07','2013-08-09'); 
INSERT INTO `pret` VALUES (null,'12','8','2013-08-29','2013-09-12','2013-09-05'); 
INSERT INTO `pret` VALUES (null,'12','10','2013-05-25','2013-06-08','2013-06-09'); 
INSERT INTO `pret` VALUES (null,'12','11','2013-05-14','2013-05-28','2013-05-24'); 
INSERT INTO `pret` VALUES (null,'12','11','2013-09-07','2013-09-21','2013-09-18'); 
INSERT INTO `pret` VALUES (null,'12','12','2013-07-12','2013-07-26','2013-07-23'); 
INSERT INTO `pret` VALUES (null,'12','12','2013-09-20','2013-10-04','2013-09-30'); 
INSERT INTO `pret` VALUES (null,'12','12','2013-10-04','2013-10-18',NULL); 
INSERT INTO `pret` VALUES (null,'13','5','2013-06-25','2013-07-09','2013-07-09'); 
INSERT INTO `pret` VALUES (null,'13','5','2013-09-03','2013-09-17','2013-09-10'); 
INSERT INTO `pret` VALUES (null,'13','6','2013-08-29','2013-09-12','2013-09-01'); 
INSERT INTO `pret` VALUES (null,'13','7','2013-07-10','2013-07-24','2013-07-25'); 
INSERT INTO `pret` VALUES (null,'13','8','2013-05-04','2013-05-18','2013-05-20'); 
INSERT INTO `pret` VALUES (null,'13','8','2013-08-05','2013-08-19','2013-08-20'); 
INSERT INTO `pret` VALUES (null,'13','8','2013-08-21','2013-09-04','2013-08-28'); 
INSERT INTO `pret` VALUES (null,'13','10','2013-06-05','2013-06-19','2013-06-12'); 
INSERT INTO `pret` VALUES (null,'13','13','2013-05-21','2013-06-04','2013-06-04'); 
INSERT INTO `pret` VALUES (null,'13','13','2013-06-13','2013-06-27','2013-06-24'); 
INSERT INTO `pret` VALUES (null,'13','13','2013-07-26','2013-08-09','2013-08-05'); 
INSERT INTO `pret` VALUES (null,'14','1','2013-06-13','2013-06-27','2013-06-24'); 
INSERT INTO `pret` VALUES (null,'14','3','2013-07-26','2013-08-09','2013-08-05'); 
INSERT INTO `pret` VALUES (null,'14','4','2013-06-25','2013-07-09','2013-07-09'); 
INSERT INTO `pret` VALUES (null,'14','4','2013-10-04','2013-10-18',NULL); 
INSERT INTO `pret` VALUES (null,'14','7','2013-06-05','2013-06-19','2013-06-12'); 
INSERT INTO `pret` VALUES (null,'14','8','2013-08-05','2013-08-19','2013-08-20'); 
INSERT INTO `pret` VALUES (null,'14','8','2013-09-07','2013-09-21','2013-09-18'); 
INSERT INTO `pret` VALUES (null,'14','9','2013-07-10','2013-07-24','2013-07-25'); 
INSERT INTO `pret` VALUES (null,'14','13','2013-05-21','2013-06-04','2013-06-04'); 
INSERT INTO `pret` VALUES (null,'14','13','2013-09-20','2013-10-04','2013-09-30'); 
INSERT INTO `pret` VALUES (null,'15','2','2013-09-07','2013-09-21','2013-09-21'); 
INSERT INTO `pret` VALUES (null,'15','3','2013-09-23','2013-10-07','2013-09-30'); 
INSERT INTO `pret` VALUES (null,'15','6','2013-05-22','2013-06-05','2013-06-05'); 
INSERT INTO `pret` VALUES (null,'15','6','2013-06-17','2013-07-01','2013-06-26'); 
INSERT INTO `pret` VALUES (null,'15','8','2013-06-28','2013-07-12','2013-07-13'); 
INSERT INTO `pret` VALUES (null,'15','9','2013-07-15','2013-07-29','2013-07-31'); 
INSERT INTO `pret` VALUES (null,'15','9','2013-08-24','2013-09-07','2013-09-04'); 
INSERT INTO `pret` VALUES (null,'15','10','2013-10-04','2013-10-18',NULL); 
INSERT INTO `pret` VALUES (null,'15','13','2013-06-06','2013-06-20','2013-06-13'); 
INSERT INTO `pret` VALUES (null,'15','13','2013-08-04','2013-08-18','2013-08-20'); 
INSERT INTO `pret` VALUES (null,'16','2','2013-05-07','2013-05-21','2013-05-18'); 
INSERT INTO `pret` VALUES (null,'16','5','2013-06-05','2013-06-19','2013-06-12'); 
INSERT INTO `pret` VALUES (null,'16','6','2013-06-13','2013-06-27','2013-06-24'); 
INSERT INTO `pret` VALUES (null,'16','7','2013-09-07','2013-09-21','2013-09-18'); 
INSERT INTO `pret` VALUES (null,'16','8','2013-07-26','2013-08-09','2013-08-05'); 
INSERT INTO `pret` VALUES (null,'16','10','2013-06-25','2013-07-09','2013-07-09'); 
INSERT INTO `pret` VALUES (null,'16','10','2013-07-10','2013-07-24','2013-07-25'); 
INSERT INTO `pret` VALUES (null,'16','14','2013-08-05','2013-08-19','2013-08-20'); 
INSERT INTO `pret` VALUES (null,'16','15','2013-09-20','2013-10-04','2013-09-30'); 
INSERT INTO `pret` VALUES (null,'16','15','2013-10-04','2013-10-18',NULL); 
INSERT INTO `pret` VALUES (null,'17','1','2013-09-07','2013-09-21','2013-09-21'); 
INSERT INTO `pret` VALUES (null,'17','7','2013-10-15','2013-10-29',NULL); 
INSERT INTO `pret` VALUES (null,'17','9','2013-05-22','2013-06-05','2013-06-05'); 
INSERT INTO `pret` VALUES (null,'17','9','2013-08-04','2013-08-18','2013-08-20'); 
INSERT INTO `pret` VALUES (null,'17','10','2013-06-17','2013-07-01','2013-06-26'); 
INSERT INTO `pret` VALUES (null,'17','10','2013-06-28','2013-07-12','2013-07-13'); 
INSERT INTO `pret` VALUES (null,'17','10','2013-08-24','2013-09-07','2013-09-04'); 
INSERT INTO `pret` VALUES (null,'17','11','2013-06-06','2013-06-20','2013-06-13'); 
INSERT INTO `pret` VALUES (null,'17','11','2013-09-23','2013-10-07','2013-09-30'); 
INSERT INTO `pret` VALUES (null,'17','12','2013-07-15','2013-07-29','2013-07-31'); 
INSERT INTO `pret` VALUES (null,'18','5','2013-06-12','2013-06-26','2013-06-26'); 
INSERT INTO `pret` VALUES (null,'18','6','2013-09-18','2013-10-02','2013-09-28'); 
INSERT INTO `pret` VALUES (null,'18','7','2013-10-03','2013-10-17','2013-10-19'); 
INSERT INTO `pret` VALUES (null,'18','8','2013-06-03','2013-06-17','2013-06-12'); 
INSERT INTO `pret` VALUES (null,'18','8','2013-08-08','2013-08-22','2013-08-15'); 
INSERT INTO `pret` VALUES (null,'18','9','2013-07-28','2013-08-11','2013-08-06'); 
INSERT INTO `pret` VALUES (null,'18','9','2013-09-01','2013-09-15','2013-09-15'); 
INSERT INTO `pret` VALUES (null,'18','10','2013-07-13','2013-07-27','2013-07-27'); 
INSERT INTO `pret` VALUES (null,'18','11','2013-05-20','2013-06-03','2013-06-03'); 
INSERT INTO `pret` VALUES (null,'18','13','2013-06-27','2013-07-11','2013-07-04'); 
INSERT INTO `pret` VALUES (null,'18','15','2013-07-05','2013-07-19','2013-07-12'); 
INSERT INTO `pret` VALUES (null,'18','15','2013-08-16','2013-08-30','2013-08-25'); 
INSERT INTO `pret` VALUES (null,'19','2','2013-07-15','2013-07-29','2013-07-31'); 
INSERT INTO `pret` VALUES (null,'19','3','2013-05-23','2013-06-06','2013-06-08'); 
INSERT INTO `pret` VALUES (null,'19','8','2013-09-23','2013-10-07','2013-09-30'); 
INSERT INTO `pret` VALUES (null,'19','9','2013-08-04','2013-08-18','2013-08-20'); 
INSERT INTO `pret` VALUES (null,'19','9','2013-08-24','2013-09-07','2013-09-04'); 
INSERT INTO `pret` VALUES (null,'19','10','2013-05-13','2013-05-27','2013-05-20'); 
INSERT INTO `pret` VALUES (null,'19','12','2013-09-07','2013-09-21','2013-09-21'); 
INSERT INTO `pret` VALUES (null,'19','16','2013-06-13','2013-06-27','2013-06-24'); 
INSERT INTO `pret` VALUES (null,'19','16','2013-10-04','2013-10-18',NULL); 
INSERT INTO `pret` VALUES (null,'20','1','2013-06-06','2013-06-20','2013-06-15'); 
INSERT INTO `pret` VALUES (null,'20','6','2013-08-04','2013-08-18','2013-08-14'); 
INSERT INTO `pret` VALUES (null,'20','7','2013-08-24','2013-09-07','2013-09-08'); 
INSERT INTO `pret` VALUES (null,'20','8','2013-06-17','2013-07-01','2013-07-01'); 
INSERT INTO `pret` VALUES (null,'20','10','2013-05-22','2013-06-05','2013-05-29'); 
INSERT INTO `pret` VALUES (null,'20','10','2013-07-15','2013-07-29','2013-07-30'); 
INSERT INTO `pret` VALUES (null,'20','10','2013-09-23','2013-10-07','2013-10-03'); 
INSERT INTO `pret` VALUES (null,'20','10','2013-10-04','2013-10-18',NULL); 
INSERT INTO `pret` VALUES (null,'21','1','2013-06-20','2013-07-04','2013-07-06'); 
INSERT INTO `pret` VALUES (null,'21','2','2013-07-26','2013-08-09','2013-08-06'); 
INSERT INTO `pret` VALUES (null,'21','5','2013-08-27','2013-09-10','2013-09-03'); 
INSERT INTO `pret` VALUES (null,'21','6','2013-08-09','2013-08-23','2013-08-23'); 
INSERT INTO `pret` VALUES (null,'21','11','2013-05-07','2013-05-21','2013-05-16'); 
INSERT INTO `pret` VALUES (null,'21','11','2013-07-07','2013-07-21','2013-07-23'); 
INSERT INTO `pret` VALUES (null,'21','11','2013-09-07','2013-09-21','2013-09-22'); 
INSERT INTO `pret` VALUES (null,'21','12','2013-06-05','2013-06-19','2013-06-19'); 
INSERT INTO `pret` VALUES (null,'22','1','2013-05-02','2013-05-16','2013-05-09'); 
INSERT INTO `pret` VALUES (null,'22','5','2013-08-08','2013-08-22','2013-08-15'); 
INSERT INTO `pret` VALUES (null,'22','7','2013-09-01','2013-09-15','2013-09-15'); 
INSERT INTO `pret` VALUES (null,'22','11','2013-05-12','2013-05-26','2013-05-19'); 
INSERT INTO `pret` VALUES (null,'22','12','2013-09-18','2013-10-02','2013-09-28'); 
INSERT INTO `pret` VALUES (null,'22','16','2013-08-16','2013-08-30','2013-08-25'); 
INSERT INTO `pret` VALUES (null,'23','4','2013-09-01','2013-09-15','2013-09-17'); 
INSERT INTO `pret` VALUES (null,'23','6','2013-07-28','2013-08-11','2013-08-04'); 
INSERT INTO `pret` VALUES (null,'23','6','2013-08-14','2013-08-28','2013-08-28'); 
INSERT INTO `pret` VALUES (null,'23','10','2013-07-09','2013-07-23','2013-07-23'); 
INSERT INTO `pret` VALUES (null,'23','12','2013-05-02','2013-05-16','2013-05-18'); 
INSERT INTO `pret` VALUES (null,'23','12','2013-05-20','2013-06-03','2013-05-27'); 
INSERT INTO `pret` VALUES (null,'23','12','2013-09-18','2013-10-02','2013-09-25'); 
INSERT INTO `pret` VALUES (null,'23','12','2013-10-03','2013-10-17','2013-10-13'); 
INSERT INTO `pret` VALUES (null,'23','15','2013-06-22','2013-07-06','2013-07-07'); 
INSERT INTO `pret` VALUES (null,'23','15','2013-07-24','2013-08-07','2013-07-26'); 
INSERT INTO `pret` VALUES (null,'23','16','2013-06-03','2013-06-17','2013-06-18'); 
INSERT INTO `pret` VALUES (null,'24','3','2013-10-03','2013-10-17','2013-10-18'); 
INSERT INTO `pret` VALUES (null,'24','6','2013-05-16','2013-05-30','2013-05-27'); 
INSERT INTO `pret` VALUES (null,'24','7','2013-05-28','2013-06-11','2013-06-06'); 
INSERT INTO `pret` VALUES (null,'24','8','2013-06-07','2013-06-21','2013-06-22'); 
INSERT INTO `pret` VALUES (null,'24','9','2013-08-07','2013-08-21','2013-08-18'); 
INSERT INTO `pret` VALUES (null,'24','13','2013-07-07','2013-07-21','2013-07-21'); 
INSERT INTO `pret` VALUES (null,'24','13','2013-08-19','2013-09-02','2013-08-26'); 
INSERT INTO `pret` VALUES (null,'24','13','2013-09-09','2013-09-23','2013-10-03'); 
INSERT INTO `pret` VALUES (null,'24','14','2013-07-22','2013-08-05','2013-08-06'); 
INSERT INTO `pret` VALUES (null,'24','15','2013-08-30','2013-09-13','2013-09-06'); 
INSERT INTO `pret` VALUES (null,'25','3','2013-06-03','2013-06-17','2013-06-19'); 
INSERT INTO `pret` VALUES (null,'25','7','2013-05-17','2013-05-31','2013-05-31'); 
INSERT INTO `pret` VALUES (null,'25','7','2013-06-22','2013-07-06','2013-06-29'); 
INSERT INTO `pret` VALUES (null,'25','7','2013-07-16','2013-07-30','2013-07-23'); 
INSERT INTO `pret` VALUES (null,'25','8','2013-07-27','2013-08-10','2013-08-10'); 
INSERT INTO `pret` VALUES (null,'25','8','2013-09-11','2013-09-25','2013-09-25'); 
INSERT INTO `pret` VALUES (null,'25','9','2013-08-29','2013-09-12','2013-09-08'); 
INSERT INTO `pret` VALUES (null,'25','15','2013-08-12','2013-08-26','2013-08-28'); 
INSERT INTO `pret` VALUES (null,'26','2','2013-05-18','2013-06-01','2013-06-02'); 
INSERT INTO `pret` VALUES (null,'26','3','2013-06-04','2013-06-18','2013-06-13'); 
INSERT INTO `pret` VALUES (null,'26','7','2013-07-17','2013-07-31','2013-07-28'); 
INSERT INTO `pret` VALUES (null,'26','9','2013-06-14','2013-06-28','2013-06-25'); 
INSERT INTO `pret` VALUES (null,'26','12','2013-08-15','2013-08-29','2013-09-08'); 
INSERT INTO `pret` VALUES (null,'26','15','2013-07-30','2013-08-13','2013-08-14'); 
INSERT INTO `pret` VALUES (null,'27','1','2013-05-19','2013-06-02','2013-05-26'); 
INSERT INTO `pret` VALUES (null,'27','2','2013-05-27','2013-06-10','2013-06-12'); 
INSERT INTO `pret` VALUES (null,'27','9','2013-06-14','2013-06-28','2013-06-28'); 
INSERT INTO `pret` VALUES (null,'28','1','2013-05-20','2013-06-03','2013-06-04'); 
INSERT INTO `pret` VALUES (null,'28','6','2013-06-07','2013-06-21','2013-06-18'); 
INSERT INTO `pret` VALUES (null,'28','8','2013-06-20','2013-07-04','2013-06-29'); 
INSERT INTO `pret` VALUES (null,'29','3','2013-06-10','2013-06-24','2013-06-26'); 
INSERT INTO `pret` VALUES (null,'29','6','2013-05-07','2013-05-21','2013-05-21'); 
INSERT INTO `pret` VALUES (null,'29','16','2013-05-21','2013-06-04','2013-05-28'); 
INSERT INTO `pret` VALUES (null,'30','2','2013-07-09','2013-07-23','2013-07-24'); 
INSERT INTO `pret` VALUES (null,'30','6','2013-05-22','2013-06-05','2013-06-02'); 
INSERT INTO `pret` VALUES (null,'30','7','2013-06-12','2013-06-26','2013-07-06'); 
INSERT INTO `pret` VALUES (null,'31','1','2013-05-22','2013-06-05','2013-05-29'); 
INSERT INTO `pret` VALUES (null,'31','7','2013-06-03','2013-06-17','2013-06-17'); 
INSERT INTO `pret` VALUES (null,'31','8','2013-06-19','2013-07-03','2013-06-29'); 
INSERT INTO `pret` VALUES (null,'31','9','2013-05-04','2013-05-18','2013-05-20'); 
INSERT INTO `pret` VALUES (null,'32','11','2013-05-21','2013-06-04','2013-06-01'); 
INSERT INTO `pret` VALUES (null,'32','11','2013-06-22','2013-07-06','2013-07-06'); 
INSERT INTO `pret` VALUES (null,'32','11','2013-08-04','2013-08-18','2013-08-15'); 
INSERT INTO `pret` VALUES (null,'32','13','2013-06-03','2013-06-17','2013-06-19'); 
INSERT INTO `pret` VALUES (null,'32','13','2013-07-08','2013-07-22','2013-07-21'); 
INSERT INTO `pret` VALUES (null,'32','15','2013-07-24','2013-08-07','2013-07-31'); 
INSERT INTO `pret` VALUES (null,'32','15','2013-08-15','2013-08-29','2013-08-28'); 
INSERT INTO `pret` VALUES (null,'32','16','2013-09-01','2013-09-15','2013-09-11'); 
INSERT INTO `pret` VALUES (null,'33','12','2013-05-03','2013-05-17','2013-05-13'); 
INSERT INTO `pret` VALUES (null,'33','12','2013-06-18','2013-07-02','2013-06-25'); 
INSERT INTO `pret` VALUES (null,'33','12','2013-07-06','2013-07-20','2013-07-20'); 
INSERT INTO `pret` VALUES (null,'33','14','2013-06-07','2013-06-21','2013-06-16'); 
INSERT INTO `pret` VALUES (null,'33','14','2013-08-29','2013-09-12','2013-09-13'); 
INSERT INTO `pret` VALUES (null,'33','16','2013-05-15','2013-05-29','2013-05-31'); 
INSERT INTO `pret` VALUES (null,'33','16','2013-07-24','2013-08-07','2013-08-04'); 
INSERT INTO `pret` VALUES (null,'34','11','2013-05-07','2013-05-21','2013-05-18'); 
INSERT INTO `pret` VALUES (null,'34','11','2013-06-22','2013-07-06','2013-07-01'); 
INSERT INTO `pret` VALUES (null,'34','13','2013-06-03','2013-06-17','2013-06-12'); 
INSERT INTO `pret` VALUES (null,'34','13','2013-07-24','2013-08-07','2013-08-07'); 
INSERT INTO `pret` VALUES (null,'34','13','2013-08-09','2013-08-23','2013-08-25'); 
INSERT INTO `pret` VALUES (null,'34','15','2013-07-08','2013-07-22','2013-07-24'); 
INSERT INTO `pret` VALUES (null,'34','15','2013-08-29','2013-09-12','2013-09-14'); 
INSERT INTO `pret` VALUES (null,'35','12','2013-05-02','2013-05-16','2013-05-16'); 
INSERT INTO `pret` VALUES (null,'35','12','2013-08-11','2013-08-25','2013-09-04'); 
INSERT INTO `pret` VALUES (null,'35','14','2013-05-27','2013-06-10','2013-06-11'); 
INSERT INTO `pret` VALUES (null,'35','14','2013-06-27','2013-07-11','2013-07-07'); 
INSERT INTO `pret` VALUES (null,'35','14','2013-07-09','2013-07-23','2013-07-24'); 
INSERT INTO `pret` VALUES (null,'35','15','2013-09-16','2013-09-30','2013-10-01'); 
INSERT INTO `pret` VALUES (null,'35','16','2013-05-19','2013-06-02','2013-05-26'); 
INSERT INTO `pret` VALUES (null,'35','16','2013-06-12','2013-06-26','2013-06-27'); 
INSERT INTO `pret` VALUES (null,'35','16','2013-10-03','2013-10-17','2013-10-17'); 
INSERT INTO `pret` VALUES (null,'36','8','2013-05-13','2013-05-27','2013-05-22'); 
INSERT INTO `pret` VALUES (null,'36','13','2013-06-02','2013-06-16','2013-06-16'); 
INSERT INTO `pret` VALUES (null,'36','17','2013-05-12','2013-05-26','2013-05-12'); 
INSERT INTO `pret` VALUES (null,'36','18','2013-06-18','2013-07-02','2013-07-01'); 
INSERT INTO `pret` VALUES (null,'37','10','2013-05-22','2013-06-05','2013-06-04'); 
INSERT INTO `pret` VALUES (null,'37','11','2013-06-06','2013-06-20','2013-06-13'); 
INSERT INTO `pret` VALUES (null,'37','20','2013-05-10','2013-05-24','2013-05-20'); 
INSERT INTO `pret` VALUES (null,'38','11','2013-05-19','2013-06-02','2013-06-02'); 
INSERT INTO `pret` VALUES (null,'38','12','2013-05-07','2013-05-21','2013-05-18'); 
INSERT INTO `pret` VALUES (null,'38','12','2013-06-03','2013-06-17','2013-06-16'); 
INSERT INTO `pret` VALUES (null,'39','11','2013-05-20','2013-06-03','2013-06-05'); 
INSERT INTO `pret` VALUES (null,'39','12','2013-06-06','2013-06-20','2013-06-21'); 
INSERT INTO `pret` VALUES (null,'39','20','2013-05-10','2013-05-24','2013-05-19'); 
INSERT INTO `pret` VALUES (null,'40','13','2013-05-21','2013-06-04','2013-06-01'); 
INSERT INTO `pret` VALUES (null,'40','14','2013-05-19','2013-06-02','2013-05-20'); 
INSERT INTO `pret` VALUES (null,'40','15','2013-06-18','2013-07-02','2013-06-29'); 
INSERT INTO `pret` VALUES (null,'40','17','2013-06-02','2013-06-16','2013-06-16'); 
INSERT INTO `pret` VALUES (null,'41','11','2013-06-03','2013-06-17','2013-06-11'); 
INSERT INTO `pret` VALUES (null,'41','12','2013-09-09','2013-09-23','2013-09-13'); 
INSERT INTO `pret` VALUES (null,'41','13','2013-09-14','2013-09-28','2013-09-30'); 
INSERT INTO `pret` VALUES (null,'41','16','2013-06-20','2013-07-04','2013-07-05'); 
INSERT INTO `pret` VALUES (null,'41','16','2013-10-01','2013-10-15',NULL); 
INSERT INTO `pret` VALUES (null,'41','18','2013-08-15','2013-08-29','2013-08-28'); 
INSERT INTO `pret` VALUES (null,'41','19','2013-08-29','2013-09-12','2013-09-08'); 
INSERT INTO `pret` VALUES (null,'41','20','2013-07-19','2013-08-02','2013-08-12'); 
INSERT INTO `pret` VALUES (null,'42','14','2013-05-19','2013-06-02','2013-05-26'); 
INSERT INTO `pret` VALUES (null,'42','15','2013-08-08','2013-08-22','2013-08-11'); 
INSERT INTO `pret` VALUES (null,'42','16','2013-06-30','2013-07-14','2013-07-09'); 
INSERT INTO `pret` VALUES (null,'42','16','2013-07-22','2013-08-05','2013-08-07'); 
INSERT INTO `pret` VALUES (null,'42','17','2013-07-10','2013-07-24','2013-07-21'); 
INSERT INTO `pret` VALUES (null,'42','18','2013-08-12','2013-08-26','2013-08-26'); 
INSERT INTO `pret` VALUES (null,'43','11','2013-09-18','2013-10-02','2013-10-01'); 
INSERT INTO `pret` VALUES (null,'43','12','2013-10-13','2013-10-27','2013-10-14'); 
INSERT INTO `pret` VALUES (null,'43','13','2013-06-30','2013-07-14','2013-07-16'); 
INSERT INTO `pret` VALUES (null,'43','14','2013-10-03','2013-10-17','2013-10-12'); 
INSERT INTO `pret` VALUES (null,'43','15','2013-08-12','2013-08-26','2013-08-14'); 
INSERT INTO `pret` VALUES (null,'43','16','2013-08-14','2013-08-28','2013-08-25'); 
INSERT INTO `pret` VALUES (null,'43','17','2013-10-14','2013-10-28',NULL); 
INSERT INTO `pret` VALUES (null,'43','19','2013-05-20','2013-06-03','2013-05-31'); 
INSERT INTO `pret` VALUES (null,'43','20','2013-09-01','2013-09-15','2013-09-15'); 
INSERT INTO `pret` VALUES (null,'44','11','2013-06-21','2013-07-05','2013-06-28'); 
INSERT INTO `pret` VALUES (null,'44','12','2013-08-31','2013-09-14','2013-09-15'); 
INSERT INTO `pret` VALUES (null,'44','13','2013-09-22','2013-10-06','2013-09-27'); 
INSERT INTO `pret` VALUES (null,'44','14','2013-09-15','2013-09-29','2013-09-20'); 
INSERT INTO `pret` VALUES (null,'44','15','2013-10-08','2013-10-22',NULL); 
INSERT INTO `pret` VALUES (null,'44','16','2013-08-12','2013-08-26','2013-08-24'); 
INSERT INTO `pret` VALUES (null,'44','17','2013-09-28','2013-10-12','2013-10-08'); 
INSERT INTO `pret` VALUES (null,'44','18','2013-08-02','2013-08-16','2013-08-11'); 
INSERT INTO `pret` VALUES (null,'44','19','2013-07-04','2013-07-18','2013-07-15'); 
INSERT INTO `pret` VALUES (null,'44','20','2013-07-16','2013-07-30','2013-08-01'); 
INSERT INTO `pret` VALUES (null,'45','11','2013-05-12','2013-05-26','2013-05-15'); 
INSERT INTO `pret` VALUES (null,'45','11','2013-06-11','2013-06-25','2013-06-13'); 
INSERT INTO `pret` VALUES (null,'45','11','2013-09-18','2013-10-02','2013-09-19'); 
INSERT INTO `pret` VALUES (null,'45','12','2013-05-18','2013-06-01','2013-05-19'); 
INSERT INTO `pret` VALUES (null,'45','12','2013-06-16','2013-06-30','2013-06-17'); 
INSERT INTO `pret` VALUES (null,'45','12','2013-09-24','2013-10-08','2013-09-25'); 
INSERT INTO `pret` VALUES (null,'45','13','2013-05-20','2013-06-03','2013-05-21'); 
INSERT INTO `pret` VALUES (null,'45','13','2013-06-19','2013-07-03','2013-06-20'); 
INSERT INTO `pret` VALUES (null,'45','14','2013-05-21','2013-06-04','2013-05-22'); 
INSERT INTO `pret` VALUES (null,'45','14','2013-06-21','2013-07-05','2013-06-23'); 
INSERT INTO `pret` VALUES (null,'45','15','2013-05-24','2013-06-07','2013-05-26'); 
INSERT INTO `pret` VALUES (null,'45','15','2013-07-30','2013-08-13','2013-07-31'); 
INSERT INTO `pret` VALUES (null,'45','16','2013-05-02','2013-05-16','2013-05-05'); 
INSERT INTO `pret` VALUES (null,'45','16','2013-05-07','2013-05-21','2013-05-08'); 
INSERT INTO `pret` VALUES (null,'45','16','2013-05-27','2013-06-10','2013-05-30'); 
INSERT INTO `pret` VALUES (null,'45','16','2013-06-04','2013-06-18','2013-06-06'); 
INSERT INTO `pret` VALUES (null,'45','16','2013-08-05','2013-08-19','2013-08-06'); 
INSERT INTO `pret` VALUES (null,'45','16','2013-08-10','2013-08-24','2013-08-12'); 
INSERT INTO `pret` VALUES (null,'45','17','2013-05-23','2013-06-06','2013-05-24'); 
INSERT INTO `pret` VALUES (null,'45','17','2013-06-26','2013-07-10','2013-06-27'); 
INSERT INTO `pret` VALUES (null,'45','18','2013-05-06','2013-05-20','2013-05-07'); 
INSERT INTO `pret` VALUES (null,'45','18','2013-05-30','2013-06-13','2013-06-02'); 
INSERT INTO `pret` VALUES (null,'45','18','2013-08-07','2013-08-21','2013-08-08'); 
INSERT INTO `pret` VALUES (null,'45','19','2013-05-10','2013-05-24','2013-05-10'); 
INSERT INTO `pret` VALUES (null,'45','19','2013-06-07','2013-06-21','2013-06-08'); 
INSERT INTO `pret` VALUES (null,'45','19','2013-09-14','2013-09-28','2013-09-15'); 
INSERT INTO `pret` VALUES (null,'45','20','2013-05-10','2013-05-24','2013-05-11'); 
INSERT INTO `pret` VALUES (null,'45','20','2013-06-09','2013-06-23','2013-06-10'); 
INSERT INTO `pret` VALUES (null,'45','20','2013-09-16','2013-09-30','2013-09-17'); 
INSERT INTO `pret` VALUES (null,'46','13','2013-05-10','2013-05-24','2013-05-23'); 
INSERT INTO `pret` VALUES (null,'46','14','2013-07-12','2013-07-26','2013-07-21'); 
INSERT INTO `pret` VALUES (null,'46','15','2013-08-05','2013-08-19','2013-08-12'); 
INSERT INTO `pret` VALUES (null,'46','16','2013-09-13','2013-09-27','2013-09-29'); 
INSERT INTO `pret` VALUES (null,'46','16','2013-10-09','2013-10-23',NULL); 
INSERT INTO `pret` VALUES (null,'46','17','2013-07-22','2013-08-05','2013-08-02'); 
INSERT INTO `pret` VALUES (null,'46','18','2013-10-01','2013-10-15','2013-10-07'); 
INSERT INTO `pret` VALUES (null,'47','11','2013-08-12','2013-08-26','2013-08-27'); 
INSERT INTO `pret` VALUES (null,'47','12','2013-08-28','2013-09-11','2013-08-29'); 
INSERT INTO `pret` VALUES (null,'47','13','2013-06-30','2013-07-14','2013-07-13'); 
INSERT INTO `pret` VALUES (null,'47','14','2013-07-24','2013-08-07','2013-08-09'); 
INSERT INTO `pret` VALUES (null,'47','15','2013-10-02','2013-10-16','2013-10-04'); 
INSERT INTO `pret` VALUES (null,'47','16','2013-09-19','2013-10-03','2013-09-20'); 
INSERT INTO `pret` VALUES (null,'47','16','2013-09-20','2013-10-04','2013-09-24'); 
INSERT INTO `pret` VALUES (null,'47','17','2013-08-29','2013-09-12','2013-09-05'); 
INSERT INTO `pret` VALUES (null,'47','18','2013-09-07','2013-09-21','2013-09-18'); 
INSERT INTO `pret` VALUES (null,'47','19','2013-06-20','2013-07-04','2013-06-29'); 
INSERT INTO `pret` VALUES (null,'47','19','2013-09-25','2013-10-09','2013-09-30'); 
INSERT INTO `pret` VALUES (null,'47','20','2013-07-13','2013-07-27','2013-07-21'); 
INSERT INTO `pret` VALUES (null,'47','20','2013-10-04','2013-10-18',NULL); 
INSERT INTO `pret` VALUES (null,'48','17','2013-10-15','2013-10-29',NULL); 