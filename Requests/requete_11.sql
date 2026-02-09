SELECT DISTINCT p.LibPotion
FROM potion p
INNER JOIN absorber a ON p.NumPotion = a.NumPotion
INNER JOIN habitant h ON a.NumHab = h.NumHab
WHERE h.Nom = 'Homéopatix';
