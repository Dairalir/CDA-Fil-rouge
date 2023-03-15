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


SELECT Produit.pro_id, pro_nom , SUM(cmd_qte), fou_nom
FROM Produit
JOIN Commande ON Produit.pro_id = Commande.pro_id
JOIN Fournisseur ON Produit.fou_id = Fournisseur.fou_id
WHERE YEAR(cmd_date) = '2023'
GROUP BY pro_nom
ORDER BY cmd_qte DESC
LIMIT 10
;

SELECT Produit.pro_id, pro_nom , SUM(cmd_qte*pro_prixht), fou_nom
FROM Produit
JOIN Commande ON Produit.pro_id = Commande.pro_id
JOIN Fournisseur ON Produit.fou_id = Fournisseur.fou_id
WHERE YEAR(cmd_date) = '2023'
GROUP BY pro_nom
ORDER BY cmd_qte DESC
LIMIT 10
;

SELECT cli_nom, COUNT(cmd_id) AS nombrecommande, SUM(cmd_qte*pro_prixht) AS CA
FROM Commande
JOIN Produit ON Commande.pro_id = Produit.pro_id
JOIN Client ON Commande.cli_id = Client.cli_id
GROUP BY cli_nom
ORDER BY nombrecommande DESC, CA DESC
LIMIT 10
;

SELECT SUM(cmd_qte*pro_prixht) AS CA, cli_type
FROM Commande
JOIN Produit ON Commande.pro_id = Produit.pro_id
JOIN Client ON Commande.cli_id = Client.cli_id
GROUP BY cli_type
;

SELECT COUNT( DISTINCT Commande.cmd_id) as nbcommande
FROM Commande
JOIN Bon_de_livraison ON Commande.cmd_id = Bon_de_livraison.cmd_id
WHERE cmd_date < CURRENT_DATE AND liv_date > CURDATE()
GROUP BY Commande.cmd_id
;
