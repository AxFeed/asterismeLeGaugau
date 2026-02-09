SELECT NumTrophee
FROM trophee
WHERE MONTH(DatePrise) IN (5, 6) AND YEAR(DatePrise) = 2052;
