INSERT INTO `Fournisseur`(fou_id, fou_nom, fou_adr, fou_vil, fou_cp, fou_pays) VALUES
(1, 'Dynabox'   , '4413 Graceland Crossing' , 'Tournon-sur-Rhône'   , '07309', 'France'),
(2, 'Yabox'     , '25 International Street' , 'Saverne'             , '67704', 'France'),
(3, 'Skipstorm' , '300 Oak Road'            , 'Aix-en-Provence'     , '13858', 'France'),
(4, 'Kazio'     , '876 Basil Junction'      , 'Mulhouse'            , '68092', 'France'),
(5, 'Yodoo'     , '60202 6th Terrace'       , 'Paris 11'            , '75547', 'France')

INSERT INTO `Employé`(emp_id, emp_nom, emp_pre, emp_adr, emp_vil, emp_cp) VALUES
(1, 'Creaven'   , 'Anica'   , '9543 Hudson Way'     , 'Saint-Étienne'           , '42963'),
(2, 'Clues'     , 'Jilleen' , '4 Erie Street'       , 'Villeurbanne'            , '69624'),
(3, 'Fielden'   , 'Carolyne', '2650 Monica Crossing', 'Orléans'                 , '45957'),
(4, 'Lethley'   , 'Aggie'   , '3 Sloan Avenue'      , 'Cosne-Cours-sur-Loire'   , '58209'),
(5, 'Folker'    , 'Donetta' , '7580 Haas Circle'    , 'Paris 19'                , '75171')

INSERT INTO `Client`(cli_id, cli_nom, cli_pre, cli_adr, cli_vil, cli_cp, cli_pays, cli_tel, cli_mail, cli_type, cli_coef, emp_id) VALUES
(1, 'Christophe', 'Brody'       , '52474 Eagle Crest Alley' , 'Lyon'            , '69464', 'France' , '5509213300', 'bchristophe0@usda.gov'     , false , 72, 1),
(2, 'Daffern'   , 'Lorna'       , '4455 Sage Street'        , 'Grenoble'        , '38030', 'France' , '3554927729', 'ldaffern1@t.co'            , true  , 66, 2),
(3, 'Peirazzi'  , 'Evangeline'  , '48916 Kedzie Plaza'      , 'Berlin'          , '12103', 'Germany', '7679073058', 'epeirazzi2@google.nl'      , true  , 13, 3),
(4, 'Doidge'    , 'Michel'      , '77 Bartelt Pass'         , 'Paris 14'        , '75675', 'France' , '6927069676', 'mdoidge3@quantcast.com'    , false , 73, 4),
(5, 'Whyler'    , 'Madelyn'     , '0553 Old Gate Place'     , 'La Roche-sur-Yon', '85009', 'France' , '4257263378', 'mwhyler4@techcrunch.com'   , true  , 43, 5)

INSERT INTO `Rubrique`(rub_id, rub_nom) VALUES
(1, ''),
(2, ''),
(3, '')

INSERT INTO `Sous_Rubrique`(srub_id, srub_nom, rub_id) VALUES
(1, '', 1),
(2, '', 1),
(3, '', 2),
(4, '', 2),
(5, '', 3),
