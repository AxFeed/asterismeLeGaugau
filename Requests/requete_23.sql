SELECT v.NomVillage, COUNT(*) AS NombreHabitants
FROM village v
INNER JOIN habitant h ON v.NumVillage = h.NumVillage
GROUP BY v.NumVillage, v.NomVillage
ORDER BY v.NomVillage;
