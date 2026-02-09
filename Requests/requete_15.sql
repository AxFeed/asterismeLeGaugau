SELECT DISTINCT h.Nom
FROM habitant h
INNER JOIN absorber a ON h.NumHab = a.NumHab
INNER JOIN potion p ON a.NumPotion = p.NumPotion
WHERE p.LibPotion = 'Potion magique n°1' 
  AND MONTH(a.DateA) = 2 
  AND YEAR(a.DateA) = 2052;
