SELECT p.LibPotion, p.Formule, p.ConstituantPrincipal
FROM potion p
INNER JOIN fabriquer f ON p.NumPotion = f.NumPotion
INNER JOIN habitant h ON f.NumHab = h.NumHab
WHERE h.Nom = 'Panoramix';
