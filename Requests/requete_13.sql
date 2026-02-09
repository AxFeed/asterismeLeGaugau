SELECT DISTINCT h.Nom
FROM habitant h
INNER JOIN absorber a ON h.NumHab = a.NumHab
INNER JOIN fabriquer f ON a.NumPotion = f.NumPotion
INNER JOIN habitant h2 ON f.NumHab = h2.NumHab
WHERE h2.Nom = 'Amnésix';
