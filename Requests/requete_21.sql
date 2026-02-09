SELECT SUM(a.Quantite) AS TotalLouches
FROM absorber a
INNER JOIN potion p ON a.NumPotion = p.NumPotion
WHERE p.LibPotion = 'Potion magique n°2';
