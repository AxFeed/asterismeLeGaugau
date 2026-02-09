SELECT h.Nom, COUNT(DISTINCT a.NumPotion) AS NombrePotionsDifferentes
FROM habitant h
INNER JOIN absorber a ON h.NumHab = a.NumHab
GROUP BY h.NumHab, h.Nom
ORDER BY h.Nom;
