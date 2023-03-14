SELECT SUM(cmd_qte*pro_prixht) AS CA , cmd_date
FROM Produit
JOIN Commande ON Produit.pro_id = Commande.pro_id
WHERE YEAR(cmd_date) = '2023'
GROUP BY MONTH(cmd_date)
;

SELECT SUM(cmd_qte*pro_prixht) AS CA , fou_nom
FROM Produit
JOIN Commande ON Produit.pro_id = Commande.pro_id
JOIN Fournisseur ON Produit.fou_id = Fournisseur.fou_id
GROUP BY fou_nom
;