SELECT SUM(c.NbPoints) AS TotalPoints
FROM trophee t
INNER JOIN categorie c ON t.CodeCat = c.CodeCat
INNER JOIN habitant h ON t.NumPreneur = h.NumHab
WHERE h.Nom = 'Goudurix';
