SELECT DISTINCT v.NomVillage
FROM village v
INNER JOIN resserre r ON v.NumVillage = r.NumVillage
ORDER BY v.NomVillage;
