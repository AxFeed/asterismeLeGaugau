SELECT h.Nom
FROM habitant h
INNER JOIN village v ON h.NumVillage = v.NumVillage
WHERE v.NomVillage = 'Aquilona';
