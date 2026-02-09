SELECT r.NomResserre, v.NomVillage
FROM resserre r
INNER JOIN village v ON r.NumVillage = v.NumVillage
ORDER BY r.Superficie DESC;
