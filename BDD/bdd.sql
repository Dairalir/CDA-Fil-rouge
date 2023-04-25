DROP DATABASE IF EXISTS `Ecommerce`;

CREATE DATABASE `Ecommerce`;

USE `Ecommerce`;

CREATE TABLE `fournisseur`(
    id      	INT AUTO_INCREMENT NOT NULL,
    name     	VARCHAR(50) NOT NULL,
    adress     	VARCHAR(50) NOT NULL,
    city    	VARCHAR(50) NOT NULL,
    postal_code VARCHAR(10) NOT NULL,
    country    	VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE `employe`(
    id      	INT AUTO_INCREMENT NOT NULL,
    surname     VARCHAR(50) NOT NULL,
    name     	VARCHAR(50) NOT NULL,
    adress     	VARCHAR(50) NOT NULL,
    city     	VARCHAR(50) NOT NULL,
    postal_code VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE `client`(
    id      	INT AUTO_INCREMENT NOT NULL,
    surname     VARCHAR(50) NOT NULL,
    name  	    VARCHAR(50) NOT NULL,
    adress     	VARCHAR(50) NOT NULL,
    city     	VARCHAR(50) NOT NULL,
    postal_code	VARCHAR(50) NOT NULL,
    country    	VARCHAR(50) NOT NULL,
    phone     	VARCHAR(10),
    mail    	VARCHAR(50) NOT NULL,
    type    	BOOLEAN,
    coef    	DECIMAL(4,2) NOT NULL,
    employe_id      INT,
    PRIMARY KEY(id),
    FOREIGN KEY(employe_id) REFERENCES `employe`(id)
);

CREATE TABLE `rubrique`(
    id      INT AUTO_INCREMENT NOT NULL,
    name    VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE `sous_rubrique`(
    id     	    INT AUTO_INCREMENT NOT NULL,
    name   	    VARCHAR(50) NOT NULL,
    picture     VARCHAR(255),
    rubrique_id INT,
    PRIMARY KEY(id),
    FOREIGN KEY(rubrique_id) REFERENCES `rubrique`(id)
);

CREATE TABLE `produit`(
    id      	    INT AUTO_INCREMENT NOT NULL,
    name     	    VARCHAR(50) NOT NULL,
    description	    VARCHAR(255),
    price_ht  	    DECIMAL(4,2) NOT NULL,
    picture         VARCHAR(255) NOT NULL,
    stock   	    INT NOT NULL,
    active     	    BOOLEAN,
    sous_rubrique_id     INT,
    fournisseur_id      INT,
    PRIMARY KEY(id),
    FOREIGN KEY(sous_rubrique_id) REFERENCES `sous_rubrique`(id),
    FOREIGN KEY(fournisseur_id) REFERENCES `fournisseur`(id)
);

CREATE TABLE `commande`(
    id      		    INT AUTO_INCREMENT NOT NULL,
    produit_id      	INT,
    client_id      	    INT,
    shipping_adress 	VARCHAR(100) NOT NULL,
    facturation_adress 	VARCHAR(100) NOT NULL,
    date    		    DATE NOT NULL,
    quantity		    INT NOT NULL,
    reduction		    INT,
    tva     		    INT,
    PRIMARY KEY(id, produit_id),
    FOREIGN KEY (client_id) REFERENCES `client`(id),
    FOREIGN KEY (produit_id) REFERENCES `produit`(id)
);

CREATE TABLE `facture`(
    id          INT AUTO_INCREMENT NOT NULL,
    date        DATE NOT NULL,
    commande_id INT,
    PRIMARY KEY(id),
    FOREIGN KEY(commande_id) REFERENCES `commande`(id)
);

CREATE TABLE `bon_de_livraison`(
    id      	INT AUTO_INCREMENT NOT NULL,
    commande_id INT,
    produit_id  INT,
    date    	DATE NOT NULL,
    quantity    INT NOT NULL,
    PRIMARY KEY(id, produit_id),
    FOREIGN KEY(produit_id) REFERENCES `produit`(id),
    FOREIGN KEY(commande_id) REFERENCES `commande`(id)
);
