CREATE VIEW vue_produit_fournisseur
AS 
SELECT produit.nom, fournisseur.nom
FROM fournisseur
JOIN produit ON fournisseur.id = Produit.fournisseur_id
;
CREATE VIEW vue_produit_rubrique_srubrique
AS
SELECT produit.nom, sous_rubrique.nom, rubrique.nom
FROM produit
JOIN sous_Rubrique ON produit.sous_rubrique_id = sous_rubrique.id
JOIN rubrique ON sous_rubrique.rubrique_id = rubrique.id
;