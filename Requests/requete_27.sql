SELECT h.Nom
FROM habitant h
INNER JOIN absorber a ON h.NumHab = a.NumHab
INNER JOIN potion p ON a.NumPotion = p.NumPotion
WHERE p.LibPotion = 'Potion Zen'
GROUP BY h.NumHab, h.Nom
HAVING SUM(a.Quantite) > 2;
