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
