SELECT SUM(cmd_qte*pro_prixht) AS CA , cmd_date
FROM produit
JOIN Commande ON produit.pro_id = commande.pro_id