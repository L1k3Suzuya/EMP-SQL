-------------------------------------------------------------
1. Calculer le nombre employés de chaque titre.

SELECT titre, COUNT(*) AS nb_employes 
FROM employe 
GROUP BY titre

-------------------------------------------------------------
2. Calculer la moyenne des salaires et leur somme, par région.

SELECT AVG(salaire) AS moy_salaire, SUM(salaire) AS som_salaire, nodep 
FROM employe 
GROUP BY nodep

-------------------------------------------------------------
3. Afficher les numéros des départements ayant au moins 3 employés.

SELECT nodep 
FROM employe 
GROUP BY nodep 
HAVING COUNT(*) >= 3

-------------------------------------------------------------
4. Afficher les lettres qui sont initiale au moins trois employés.

SELECT LEFT(nom, 1) AS initiale, COUNT(*) AS nombre_employes 
FROM employe
GROUP BY LEFT(nom, 1) 
HAVING COUNT(*) >= 3

-------------------------------------------------------------
5. Rechercher le salaire maximum et le salaire minimum parmi tous les salariés et écart entre les deux.

SELECT MAX(salaire) AS salaire_max, MIN(salaire) AS salaire_min, MAX(salaire) - MIN(salaire) 
AS ecart 
FROM employe

-------------------------------------------------------------
6. Rechercher le nombre de titres différents.

SELECT COUNT(DISTINCT titre) AS nombre_de_titres 
FROM employe

-------------------------------------------------------------
7. Pour chaque titre, compter le nombre employés possédant ce titre

SELECT titre, COUNT(*) as nb_employees 
FROM employe 
GROUP BY titre

-------------------------------------------------------------
8. Pour chaque nom de département, afficher le nom du département et le nombre employés

SELECT COUNT(employe.nom), dept.nom 
FROM employe 
JOIN dept ON employe.nodep = dept.nodept 
GROUP BY dept.nom

-------------------------------------------------------------
9. Rechercher les titres et la moyenne des salaires par titre dont la moyenne est supérieure à la moyenne des salaires des Représentants

SELECT titre, AVG(salaire) AS moyenne_salaires 
FROM employe 
GROUP BY titre 
HAVING moyenne_salaires > (SELECT AVG(salaire) 
FROM employe 
WHERE titre = 'Representant')

-------------------------------------------------------------
10. Rechercher le nombre de salaires renseignés et le nombre de taux de commission renseignés.

SELECT COUNT(salaire) AS nombre_salaires, COUNT(tauxcom) AS nombre_de_taux_com
FROM employe