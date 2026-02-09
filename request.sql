SELECT 'Requête 1 : Liste des potions' AS '';
SELECT NumPotion, LibPotion, Formule, ConstituantPrincipal
FROM potion;

SELECT 'Requête 2 : Trophées rapportant 3 points' AS '';
SELECT NomCateg
FROM categorie
WHERE NbPoints = 3;

SELECT 'Requête 3 : Villages avec plus de 35 huttes' AS '';
SELECT NomVillage
FROM village
WHERE NbHuttes > 35;

SELECT 'Requête 4 : Trophées pris en mai/juin 52' AS '';
SELECT NumTrophee
FROM trophee
WHERE MONTH(DatePrise) IN (5, 6) AND YEAR(DatePrise) = 2052;

SELECT 'Requête 5 : Habitants commençant par "a" et contenant "r"' AS '';
SELECT Nom
FROM habitant
WHERE Nom LIKE 'a%' AND Nom LIKE '%r%';

SELECT 'Requête 6 : Habitants ayant bu les potions 1, 3 ou 4' AS '';
SELECT DISTINCT NumHab
FROM absorber
WHERE NumPotion IN (1, 3, 4)
ORDER BY NumHab;

SELECT 'Requête 7 : Liste complète des trophées' AS '';
SELECT t.NumTrophee, t.DatePrise, c.NomCateg, h.Nom
FROM trophee t
INNER JOIN categorie c ON t.CodeCat = c.CodeCat
INNER JOIN habitant h ON t.NumPreneur = h.NumHab;

SELECT 'Requête 8 : Habitants d\'Aquilona' AS '';
SELECT h.Nom
FROM habitant h
INNER JOIN village v ON h.NumVillage = v.NumVillage
WHERE v.NomVillage = 'Aquilona';

SELECT 'Requête 9 : Preneurs de Bouclier de Légat' AS '';
SELECT DISTINCT h.Nom
FROM habitant h
INNER JOIN trophee t ON h.NumHab = t.NumPreneur
INNER JOIN categorie c ON t.CodeCat = c.CodeCat
WHERE c.NomCateg = 'Bouclier de Légat';

SELECT 'Requête 10 : Potions fabriquées par Panoramix' AS '';
SELECT p.LibPotion, p.Formule, p.ConstituantPrincipal
FROM potion p
INNER JOIN fabriquer f ON p.NumPotion = f.NumPotion
INNER JOIN habitant h ON f.NumHab = h.NumHab
WHERE h.Nom = 'Panoramix';

SELECT 'Requête 11 : Potions absorbées par Homéopatix' AS '';
SELECT DISTINCT p.LibPotion
FROM potion p
INNER JOIN absorber a ON p.NumPotion = a.NumPotion
INNER JOIN habitant h ON a.NumHab = h.NumHab
WHERE h.Nom = 'Homéopatix';

SELECT 'Requête 12 : Habitants ayant bu une potion de l\'habitant n°3' AS '';
SELECT DISTINCT h.Nom
FROM habitant h
INNER JOIN absorber a ON h.NumHab = a.NumHab
INNER JOIN fabriquer f ON a.NumPotion = f.NumPotion
WHERE f.NumHab = 3;

SELECT 'Requête 13 : Habitants ayant bu une potion d\'Amnésix' AS '';
SELECT DISTINCT h.Nom
FROM habitant h
INNER JOIN absorber a ON h.NumHab = a.NumHab
INNER JOIN fabriquer f ON a.NumPotion = f.NumPotion
INNER JOIN habitant h2 ON f.NumHab = h2.NumHab
WHERE h2.Nom = 'Amnésix';

SELECT 'Requête 14 : Habitants sans qualité renseignée' AS '';
SELECT Nom
FROM habitant
WHERE NumQualite IS NULL;

SELECT 'Requête 15 : Consommateurs de Potion magique n°1 en février 52' AS '';
SELECT DISTINCT h.Nom
FROM habitant h
INNER JOIN absorber a ON h.NumHab = a.NumHab
INNER JOIN potion p ON a.NumPotion = p.NumPotion
WHERE p.LibPotion = 'Potion magique n°1' 
  AND MONTH(a.DateA) = 2 
  AND YEAR(a.DateA) = 2052;

SELECT 'Requête 16 : Habitants par ordre alphabétique' AS '';
SELECT Nom, Age
FROM habitant
ORDER BY Nom;

SELECT 'Requête 17 : Resserres par superficie décroissante' AS '';
SELECT r.NomResserre, v.NomVillage
FROM resserre r
INNER JOIN village v ON r.NumVillage = v.NumVillage
ORDER BY r.Superficie DESC;

SELECT 'Requête 18 : Nombre d\'habitants du village n°5' AS '';
SELECT COUNT(*) AS NombreHabitants
FROM habitant
WHERE NumVillage = 5;

SELECT 'Requête 19 : Points gagnés par Goudurix' AS '';
SELECT SUM(c.NbPoints) AS TotalPoints
FROM trophee t
INNER JOIN categorie c ON t.CodeCat = c.CodeCat
INNER JOIN habitant h ON t.NumPreneur = h.NumHab
WHERE h.Nom = 'Goudurix';

SELECT 'Requête 20 : Date de première prise de trophée' AS '';
SELECT MIN(DatePrise) AS PremierePrise
FROM trophee;

SELECT 'Requête 21 : Total louches de Potion magique n°2' AS '';
SELECT SUM(a.Quantite) AS TotalLouches
FROM absorber a
INNER JOIN potion p ON a.NumPotion = p.NumPotion
WHERE p.LibPotion = 'Potion magique n°2';

SELECT 'Requête 22 : Superficie maximale' AS '';
SELECT MAX(Superficie) AS SuperficieMax
FROM resserre;

SELECT 'Requête 23 : Nombre d\'habitants par village' AS '';
SELECT v.NomVillage, COUNT(*) AS NombreHabitants
FROM village v
INNER JOIN habitant h ON v.NumVillage = h.NumVillage
GROUP BY v.NumVillage, v.NomVillage
ORDER BY v.NomVillage;

SELECT 'Requête 24 : Nombre de trophées par habitant' AS '';
SELECT h.Nom, COUNT(*) AS NombreTrophees
FROM habitant h
INNER JOIN trophee t ON h.NumHab = t.NumPreneur
GROUP BY h.NumHab, h.Nom
ORDER BY h.Nom;

SELECT 'Requête 25 : Moyenne d\'âge par province' AS '';
SELECT p.NomProvince, AVG(h.Age) AS MoyenneAge
FROM province p
INNER JOIN village v ON p.NumProvince = v.NumProvince
INNER JOIN habitant h ON v.NumVillage = h.NumVillage
GROUP BY p.NumProvince, p.NomProvince
ORDER BY p.NomProvince;

SELECT 'Requête 26 : Nombre de potions différentes par habitant' AS '';
SELECT h.Nom, COUNT(DISTINCT a.NumPotion) AS NombrePotionsDifferentes
FROM habitant h
INNER JOIN absorber a ON h.NumHab = a.NumHab
GROUP BY h.NumHab, h.Nom
ORDER BY h.Nom;

SELECT 'Requête 27 : Habitants ayant bu plus de 2 louches de Potion Zen' AS '';
SELECT h.Nom
FROM habitant h
INNER JOIN absorber a ON h.NumHab = a.NumHab
INNER JOIN potion p ON a.NumPotion = p.NumPotion
WHERE p.LibPotion = 'Potion Zen'
GROUP BY h.NumHab, h.Nom
HAVING SUM(a.Quantite) > 2;

SELECT 'Requête 28 : Villages ayant une resserre' AS '';
SELECT DISTINCT v.NomVillage
FROM village v
INNER JOIN resserre r ON v.NumVillage = r.NumVillage
ORDER BY v.NomVillage;

SELECT 'Requête 29 : Village avec le plus de huttes' AS '';
SELECT NomVillage
FROM village
WHERE NbHuttes = (SELECT MAX(NbHuttes) FROM village);

SELECT 'Requête 30 : Habitants ayant plus de trophées qu\'Obélix' AS '';
SELECT h.Nom
FROM habitant h
INNER JOIN trophee t ON h.NumHab = t.NumPreneur
GROUP BY h.NumHab, h.Nom
HAVING COUNT(*) > (
    SELECT COUNT(*)
    FROM trophee t2
    INNER JOIN habitant h2 ON t2.NumPreneur = h2.NumHab
    WHERE h2.Nom = 'Obélix'
)
ORDER BY h.Nom;
