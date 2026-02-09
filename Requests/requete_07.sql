SELECT t.NumTrophee, t.DatePrise, c.NomCateg, h.Nom
FROM trophee t
INNER JOIN categorie c ON t.CodeCat = c.CodeCat
INNER JOIN habitant h ON t.NumPreneur = h.NumHab;
