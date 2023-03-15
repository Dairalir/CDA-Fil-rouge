DELIMITER |
CREATE PROCEDURE Commande_en_cours()
    BEGIN
        SELECT cmd_id
        FROM Commande
        JOIN Bon_de_livraison ON Commande.cmd_id = Bon_de_livraison.cmd_id
        WHERE cmd_date < CURRENT_DATE AND liv_date > CURDATE()
        GROUP BY Commande.cmd_id;
    END |
;

DELIMITER |
CREATE PROCEDURE Delai_moyen()
    BEGIN
        SELECT AVG(DATEDIFF(liv_date, cmd_date))
        FROM Commande
        JOIN Bon_de_livraison ON Commande.cmd_id = Bon_de_livraison.cmd_id;
    END |
;