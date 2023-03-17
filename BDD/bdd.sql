DROP DATABASE IF EXISTS `Ecommerce`;

CREATE DATABASE `Ecommerce`;

USE `Ecommerce`;

CREATE TABLE `Fournisseur`(
    fou_id      INT AUTO_INCREMENT NOT NULL,
    fou_nom     VARCHAR(50) NOT NULL,
    fou_adr     VARCHAR(50) NOT NULL,
    fou_vil     VARCHAR(50) NOT NULL,
    fou_cp      VARCHAR(10) NOT NULL,
    fou_pays    VARCHAR(50) NOT NULL,
    PRIMARY KEY(fou_id)
);

CREATE TABLE `Employé`(
    emp_id      INT AUTO_INCREMENT NOT NULL,
    emp_nom     VARCHAR(50) NOT NULL,
    emp_pre     VARCHAR(50) NOT NULL,
    emp_adr     VARCHAR(50) NOT NULL,
    emp_vil     VARCHAR(50) NOT NULL,
    emp_cp      VARCHAR(50) NOT NULL,
    PRIMARY KEY(emp_id)
);

CREATE TABLE `Client`(
    cli_id      INT AUTO_INCREMENT NOT NULL,
    cli_nom     VARCHAR(50) NOT NULL,
    cli_prenom  VARCHAR(50) NOT NULL,
    cli_adr     VARCHAR(50) NOT NULL,
    cli_vil     VARCHAR(50) NOT NULL,
    cli_cp      VARCHAR(50) NOT NULL,
    cli_pays    VARCHAR(50) NOT NULL,
    cli_tel     VARCHAR(10),
    cli_mail    VARCHAR(50) NOT NULL,
    cli_type    BOOLEAN,
    cli_coef    DECIMAL(4,2) NOT NULL,
    emp_id      INT,
    PRIMARY KEY(cli_id),
    FOREIGN KEY(emp_id) REFERENCES `Employé`(emp_id)
);

CREATE TABLE `Rubrique`(
    rub_id      INT AUTO_INCREMENT NOT NULL,
    rub_nom     VARCHAR(50) NOT NULL,
    PRIMARY KEY(rub_id)
);

CREATE TABLE `Sous_Rubrique`(
    srub_id     INT AUTO_INCREMENT NOT NULL,
    srub_nom    VARCHAR(50) NOT NULL,
    rub_id      INT,
    PRIMARY KEY(srub_id),
    FOREIGN KEY(rub_id) REFERENCES `Rubrique`(rub_id)
);

CREATE TABLE `Produit`(
    pro_id      INT AUTO_INCREMENT NOT NULL,
    pro_nom     VARCHAR(50) NOT NULL,
    pro_desc    VARCHAR(255),
    pro_prixht  DECIMAL(4,2) NOT NULL,
    pro_pic     VARCHAR(255) NOT NULL,
    pro_stock   INT NOT NULL,
    pro_act     BOOLEAN,
    srub_id     INT,
    fou_id      INT,
    PRIMARY KEY(pro_id),
    FOREIGN KEY(srub_id) REFERENCES `Sous_Rubrique`(srub_id),
    FOREIGN KEY(fou_id) REFERENCES `Fournisseur`(fou_id)
);

CREATE TABLE `Commande`(
    cmd_id      INT AUTO_INCREMENT NOT NULL,
    pro_id      INT,
    cli_id      INT,
    cmd_adr_liv VARCHAR(100) NOT NULL,
    cmd_adr_fac VARCHAR(100) NOT NULL,
    cmd_date    DATE NOT NULL,
    cmd_qte     INT NOT NULL,
    com_red     INT,
    com_tva     INT,
    PRIMARY KEY(cmd_id, pro_id),
    FOREIGN KEY (cli_id) REFERENCES `Client`(cli_id),
    FOREIGN KEY (pro_id) REFERENCES `Produit`(pro_id)
);

CREATE TABLE Facture(
    fac_id      INT AUTO_INCREMENT NOT NULL,
    fac_date    DATE NOT NULL,
    cmd_id      INT,
    PRIMARY KEY(fac_id),
    FOREIGN KEY(cmd_id) REFERENCES Commande(cmd_id)
);

CREATE TABLE Bon_de_livraison(
    liv_id      INT AUTO_INCREMENT NOT NULL,
    cmd_id      INT,
    pro_id      INT,
    liv_date    DATE NOT NULL,
    liv_qte     INT NOT NULL,
    PRIMARY KEY(liv_id, pro_id),
    FOREIGN KEY(pro_id) REFERENCES Produit(pro_id),
    FOREIGN KEY(cmd_id) REFERENCES Commande(cmd_id)
);