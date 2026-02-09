SELECT DISTINCT h.Nom
FROM habitant h
INNER JOIN trophee t ON h.NumHab = t.NumPreneur
INNER JOIN categorie c ON t.CodeCat = c.CodeCat
WHERE c.NomCateg = 'Bouclier de Légat';
