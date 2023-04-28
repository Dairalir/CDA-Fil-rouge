USE `Ecommerce`;
INSERT INTO `fournisseur`(id, name, adress, city, postal_code, country) VALUES
(1, 'Dynabox'   , '4413 Graceland Crossing' , 'Tournon-sur-Rhône'   , '07309', 'France'),
(2, 'Yabox'     , '25 International Street' , 'Saverne'             , '67704', 'France'),
(3, 'Skipstorm' , '300 Oak Road'            , 'Aix-en-Provence'     , '13858', 'France'),
(4, 'Kazio'     , '876 Basil Junction'      , 'Mulhouse'            , '68092', 'France'),
(5, 'Yodoo'     , '60202 6th Terrace'       , 'Paris 11'            , '75547', 'France');

INSERT INTO `employe`(id, surname, name, adress, city, postal_code) VALUES
(1, 'Creaven'   , 'Anica'   , '9543 Hudson Way'     , 'Saint-Étienne'           , '42963'),
(2, 'Clues'     , 'Jilleen' , '4 Erie Street'       , 'Villeurbanne'            , '69624'),
(3, 'Fielden'   , 'Carolyne', '2650 Monica Crossing', 'Orléans'                 , '45957'),
(4, 'Lethley'   , 'Aggie'   , '3 Sloan Avenue'      , 'Cosne-Cours-sur-Loire'   , '58209'),
(5, 'Folker'    , 'Donetta' , '7580 Haas Circle'    , 'Paris 19'                , '75171');

INSERT INTO `client`(id, surname, name, adress, city, postal_code, country, phone, mail, type, coef, employe_id) VALUES
(1, 'Christophe', 'Brody'       , '52474 Eagle Crest Alley' , 'Lyon'            , '69464', 'France' , '5509213300', 'bchristophe0@usda.gov'     , false , 72, 1),
(2, 'Daffern'   , 'Lorna'       , '4455 Sage Street'        , 'Grenoble'        , '38030', 'France' , '3554927729', 'ldaffern1@t.co'            , true  , 66, 2),
(3, 'Peirazzi'  , 'Evangeline'  , '48916 Kedzie Plaza'      , 'Berlin'          , '12103', 'Germany', '7679073058', 'epeirazzi2@google.nl'      , true  , 13, 3),
(4, 'Doidge'    , 'Michel'      , '77 Bartelt Pass'         , 'Paris 14'        , '75675', 'France' , '6927069676', 'mdoidge3@quantcast.com'    , false , 73, 4),
(5, 'Whyler'    , 'Madelyn'     , '0553 Old Gate Place'     , 'La Roche-sur-Yon', '85009', 'France' , '4257263378', 'mwhyler4@techcrunch.com'   , true  , 43, 5);

INSERT INTO `rubrique`(id, name) VALUES
(1, 'Groupes'),
(2, 'Albums'),
(3, 'Merch');

INSERT INTO `sous_rubrique`(id, name, picture, rubrique_id) VALUES
(1, 'Dreamcatcher'	,'dreamcatcherlogo.jpeg' 	, 1),
(2, 'BLACKPINK'		,'blackpinklogo.jpeg'	 	, 1),
(3, 'Album studio'	,'' 				, 2),
(4, 'EP' 		,''				, 2),
(5, 'Lightsicks'	,'' 				, 3);

INSERT INTO `produit`(id, name, description, price_ht, picture, stock, active, sous_rubrique_id, fournisseur_id) VALUES
(1, 'Produit1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus aliquet erat vel mattis facilisis. Sed pulvinar vestibulum sapien id sagittis.', 19.99, 'pic1.jpg', 500   , true, 4, 2),
(2, 'Produit2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus aliquet erat vel mattis facilisis. Sed pulvinar vestibulum sapien id sagittis.', 39.99, 'pic2.jpg', 1000  , true, 5, 3),
(3, 'Produit3', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus aliquet erat vel mattis facilisis. Sed pulvinar vestibulum sapien id sagittis.', 16.50, 'pic3.jpg', 250   , true, 3, 5),
(4, 'Produit4', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus aliquet erat vel mattis facilisis. Sed pulvinar vestibulum sapien id sagittis.', 69.99, 'pic4.jpg', 600   , true, 1, 4),
(5, 'Produit5', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus aliquet erat vel mattis facilisis. Sed pulvinar vestibulum sapien id sagittis.', 44.99, 'pic5.jpg', 150   , true, 2, 1)
;
INSERT IGNORE INTO `commande`(id, produit_id, client_id, shipping_adress, shipping_cp, shipping_city, facturation_adress, facturation_cp, facturation_city, date, quantity, reduction, tva) VALUES
(1, 2, 1, '808 Graedel Place'      ,'','', '808 Graedel Place'   ,'','', '2023-03-12', 3, NULL, NULL),
(1, 5, 1, '808 Graedel Place'      ,'','', '808 Graedel Place'   ,'','', '2023-03-12', 5, NULL, NULL),
(2, 1, 5, '7600 Fremont Parkway'   ,'','', '7600 Fremont Parkway','','', '2023-04-26', 1, NULL, NULL),
(3, 3, 4, '41 Mayer Way'           ,'','', '9 Moulton Parkway'   ,'','', '2023-05-14', 2, NULL, NULL),
(3, 4, 4, '41 Mayer Way'           ,'','', '9 Moulton Parkway'   ,'','', '2023-05-14', 1, NULL, NULL);

INSERT INTO `facture`(id, date, commande_id) VALUES
(1, '2023-03-13', 1 ),
(2, '2023-04-27', 2 ),
(3, '2023-05-15', 3 );

INSERT INTO `bon_de_livraison`(id, commande_id, produit_id, date, quantity) VALUES
(1, 1, 2, '2023-05-16', 2),
(2, 1, 2, '2023-07-27', 1),
(2, 1, 5, '2023-07-27', 5),
(3, 2, 1, '2023-08-05', 1),
(4, 3, 3, '2023-09-18', 2),
(4, 3, 4, '2023-09-18', 1)
;
