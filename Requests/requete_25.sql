SELECT p.NomProvince, AVG(h.Age) AS MoyenneAge
FROM province p
INNER JOIN village v ON p.NumProvince = v.NumProvince
INNER JOIN habitant h ON v.NumVillage = h.NumVillage
GROUP BY p.NumProvince, p.NomProvince
ORDER BY p.NomProvince;
