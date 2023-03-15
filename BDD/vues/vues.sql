CREATE VIEW vue_produit_fournisseur
AS 
SELECT pro_nom, fou_nom
FROM Fournisseur
JOIN Produit ON Fournisseur.fou_id = Produit.fou_id
;
CREATE VIEW vue_produit_rubrique_srubrique
AS
SELECT pro_nom, srub_nom, rub_nom
FROM Produit
JOIN Sous_Rubrique ON Produit.srub_id = Sous_Rubrique.srub_id
JOIN Rubrique ON Sous_Rubrique.rub_id = Rubrique.rub_id
;