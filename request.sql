SELECT *
FROM potion;

SELECT NomCateg
FROM categorie
WHERE NbPoints = 3;

SELECT NomVillage
FROM village
WHERE NbHuttes > 35;

SELECT NumTrophee
FROM trophee
WHERE MONTH(DatePrise) IN (5, 6) AND YEAR(DatePrise) = 2052;

SELECT Nom
FROM habitant
WHERE Nom LIKE 'a%' AND Nom LIKE '%r%';

SELECT DISTINCT NumHab
FROM absorber
WHERE NumPotion IN (1, 3, 4)
ORDER BY NumHab;

SELECT t.NumTrophee, t.DatePrise, c.NomCateg, h.Nom
FROM trophee t
INNER JOIN categorie c ON t.CodeCat = c.CodeCat
INNER JOIN habitant h ON t.NumPreneur = h.NumHab;

SELECT h.Nom
FROM habitant h
INNER JOIN village v ON h.NumVillage = v.NumVillage
WHERE v.NomVillage = 'Aquilona';

SELECT DISTINCT h.Nom
FROM habitant h
INNER JOIN trophee t ON h.NumHab = t.NumPreneur
INNER JOIN categorie c ON t.CodeCat = c.CodeCat
WHERE c.NomCateg = 'Bouclier de Légat';

SELECT p.LibPotion, p.Formule, p.ConstituantPrincipal
FROM potion p
INNER JOIN fabriquer f ON p.NumPotion = f.NumPotion
INNER JOIN habitant h ON f.NumHab = h.NumHab
WHERE h.Nom = 'Panoramix';

SELECT DISTINCT p.LibPotion
FROM potion p
INNER JOIN absorber a ON p.NumPotion = a.NumPotion
INNER JOIN habitant h ON a.NumHab = h.NumHab
WHERE h.Nom = 'Homéopatix';

SELECT DISTINCT h.Nom
FROM habitant h
INNER JOIN absorber a ON h.NumHab = a.NumHab
INNER JOIN fabriquer f ON a.NumPotion = f.NumPotion
WHERE f.NumHab = 3;

SELECT DISTINCT h.Nom
FROM habitant h
INNER JOIN absorber a ON h.NumHab = a.NumHab
INNER JOIN fabriquer f ON a.NumPotion = f.NumPotion
INNER JOIN habitant h2 ON f.NumHab = h2.NumHab
WHERE h2.Nom = 'Amnésix';

SELECT Nom
FROM habitant
WHERE NumQualite IS NULL;

SELECT DISTINCT h.Nom
FROM habitant h
INNER JOIN absorber a ON h.NumHab = a.NumHab
INNER JOIN potion p ON a.NumPotion = p.NumPotion
WHERE p.LibPotion = 'Potion magique n°1' 
  AND MONTH(a.DateA) = 2 
  AND YEAR(a.DateA) = 2052;

SELECT Nom, Age
FROM habitant
ORDER BY Nom;

SELECT r.NomResserre, v.NomVillage
FROM resserre r
INNER JOIN village v ON r.NumVillage = v.NumVillage
ORDER BY r.Superficie DESC;

SELECT COUNT(*) AS NombreHabitants
FROM habitant
WHERE NumVillage = 5;

SELECT SUM(c.NbPoints) AS TotalPoints
FROM trophee t
INNER JOIN categorie c ON t.CodeCat = c.CodeCat
INNER JOIN habitant h ON t.NumPreneur = h.NumHab
WHERE h.Nom = 'Goudurix';

SELECT MIN(DatePrise) AS PremierePrise
FROM trophee;

SELECT SUM(a.Quantite) AS TotalLouches
FROM absorber a
INNER JOIN potion p ON a.NumPotion = p.NumPotion
WHERE p.LibPotion = 'Potion magique n°2';

SELECT MAX(Superficie) AS SuperficieMax
FROM resserre;

SELECT v.NomVillage, COUNT(*) AS NombreHabitants
FROM village v
INNER JOIN habitant h ON v.NumVillage = h.NumVillage
GROUP BY v.NumVillage, v.NomVillage
ORDER BY v.NomVillage;

SELECT h.Nom, COUNT(*) AS NombreTrophees
FROM habitant h
INNER JOIN trophee t ON h.NumHab = t.NumPreneur
GROUP BY h.NumHab, h.Nom
ORDER BY h.Nom;

SELECT p.NomProvince, AVG(h.Age) AS MoyenneAge
FROM province p
INNER JOIN village v ON p.NumProvince = v.NumProvince
INNER JOIN habitant h ON v.NumVillage = h.NumVillage
GROUP BY p.NumProvince, p.NomProvince
ORDER BY p.NomProvince;

SELECT h.Nom, COUNT(DISTINCT a.NumPotion) AS NombrePotionsDifferentes
FROM habitant h
INNER JOIN absorber a ON h.NumHab = a.NumHab
GROUP BY h.NumHab, h.Nom
ORDER BY h.Nom;

SELECT h.Nom
FROM habitant h
INNER JOIN absorber a ON h.NumHab = a.NumHab
INNER JOIN potion p ON a.NumPotion = p.NumPotion
WHERE p.LibPotion = 'Potion Zen'
GROUP BY h.NumHab, h.Nom
HAVING SUM(a.Quantite) > 2;

SELECT DISTINCT v.NomVillage
FROM village v
INNER JOIN resserre r ON v.NumVillage = r.NumVillage
ORDER BY v.NomVillage;

SELECT NomVillage
FROM village
WHERE NbHuttes = (SELECT MAX(NbHuttes) FROM village);

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
