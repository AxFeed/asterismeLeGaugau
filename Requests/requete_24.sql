SELECT h.Nom, COUNT(*) AS NombreTrophees
FROM habitant h
INNER JOIN trophee t ON h.NumHab = t.NumPreneur
GROUP BY h.NumHab, h.Nom
ORDER BY h.Nom;
