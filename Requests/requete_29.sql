SELECT NomVillage
FROM village
WHERE NbHuttes = (SELECT MAX(NbHuttes) FROM village);
