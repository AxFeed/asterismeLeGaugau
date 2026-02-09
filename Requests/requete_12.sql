SELECT DISTINCT h.Nom
FROM habitant h
INNER JOIN absorber a ON h.NumHab = a.NumHab
INNER JOIN fabriquer f ON a.NumPotion = f.NumPotion
WHERE f.NumHab = 3;
