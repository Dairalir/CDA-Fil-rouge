DELIMITER |
CREATE PROCEDURE commande_en_cours()
    BEGIN
        SELECT commande.id
        FROM commande
        JOIN bon_de_livraison ON commande.id = bon_de_livraison.commande_id
        WHERE commande.date < CURRENT_DATE AND bon_de_livraison.date > CURDATE()
        GROUP BY commande.id;
    END |
;

DELIMITER |
CREATE PROCEDURE delai_moyen()
    BEGIN
        SELECT AVG(DATEDIFF(bon_de_livraison.date, commande.date))
        FROM commande
        JOIN bon_de_livraison ON commande.id = Bon_de_livraison.commande_id;
    END |
;