SELECT SUM(commande.quantity*produit.price_ht) AS CA , commande.date
FROM produit
JOIN commande ON produit.id = Commande.produit_id
WHERE YEAR(commande.date) = '2023'
GROUP BY MONTH(commande.date)
;

SELECT SUM(commande.quantity*produit.price_ht) AS CA , fournisseur.name
FROM produit
JOIN commande ON produit.id = Commande.produit_id
JOIN fournisseur ON produit.fournisseur_id = fournisseur.id
GROUP BY fournisseur.name
;


SELECT produit.id, produit.name , SUM(commande.quantity), fournisseur.name
FROM produit
JOIN commande ON produit.id = commande.produit_id
JOIN fournisseur ON produit.fournisseur_id = fournisseur.id
WHERE YEAR(commande.date) = '2023'
GROUP BY produit.name
ORDER BY commande.quantity DESC
LIMIT 10
;

SELECT produit.id, produit.name , SUM(commande.quantity*produit.price_ht), fournisseur.name
FROM produit
JOIN commande ON produit.id = commande.produit_id
JOIN fournisseur ON produit.fournisseur_id = fournisseur.id
WHERE YEAR(commande.date) = '2023'
GROUP BY produit.name
ORDER BY commande.quantity DESC
LIMIT 10
;

SELECT client.name, COUNT(commande.id) AS nombrecommande, SUM(commande.quantity*produit.price_ht) AS CA
FROM commande
JOIN produit ON commande.produit_id = produit.id
JOIN client ON commande.client_id = client.id
GROUP BY client.name
ORDER BY nombrecommande DESC, CA DESC
LIMIT 10
;

SELECT SUM(commande.quantity*produit.price_ht) AS CA, client.type
FROM commande
JOIN produit ON commande.produit_id = produit.id
JOIN Client ON commande.client_id = client.id
GROUP BY client.type
;

SELECT COUNT( DISTINCT commande.id) as nbcommande
FROM commande
JOIN bon_de_livraison ON commande.id = bon_de_livraison.commande_id
WHERE commande.date < CURRENT_DATE AND bon_de_livraison.date > CURDATE()
GROUP BY commande.id
;
