-------------------------------------------------------------
Partie 1 (EMP-SQL)
-------------------------------------------------------------
(1) Rechercher le prénom des employés et le numéro de la région de leur département.

SELECT employe.prenom, dept.noregion 
FROM employe 
JOIN dept ON employe.nodep = dept.nodept

-------------------------------------------------------------
(2) Rechercher le numéro du département, le nom du département, le nom des employés classés par numéro de département (renommer les tables utilisées).

SELECT dept.nom as departement, prenom, employe.nom, dept.nodept as departements 
FROM employe 
JOIN dept ON dept.nodept = employe.nodep 
ORDER BY departements

-------------------------------------------------------------
(3) Rechercher le nom des employés du département Distribution.

SELECT employe.nom ,dept.nom 
FROM employe 
JOIN dept ON employe.nodep = dept.nodept 
WHERE dept.nom='distribution'

-------------------------------------------------------------
(4) Rechercher le nom et le salaire des employés qui gagnent plus que leur patron, et le nom et le salaire de leur patron.

SELECT p.nom, p.salaire, psup.nom AS 'nom_sup', psup.salaire AS salaire_sup
FROM employe as psup LEFT 
OUTER JOIN employe AS p ON p.nosup = psup.noemp 
WHERE p.salaire > psup.salaire

-------------------------------------------------------------
(5) Rechercher le nom et le titre des employés qui ont le même titre que Amartakaldire.

SELECT nom, titre 
FROM employe 
WHERE titre IN (SELECT titre 
FROM employe 
WHERE nom = 'Amartakaldire')

-------------------------------------------------------------
(6) Rechercher le nom, le salaire et le numéro de département des employés qui gagnent plus un seul employé du département 31, classés par numéro de département et salaire.

SELECT nom, salaire, nodep 
FROM employe 
WHERE salaire > ANY (SELECT salaire 
FROM employe 
WHERE nodep = 31) 
ORDER BY nodep, salaire ASC

-------------------------------------------------------------
(7) Rechercher le nom, le salaire et le numéro de département des employés qui gagnent plus que tous les employés du département 31, classés par numéro de département et salaire

SELECT nom, salaire, nodep 
FROM employe 
WHERE salaire > ALL (SELECT salaire 
FROM employe 
WHERE nodep = 31) 
ORDER BY nodep, salaire ASC

-------------------------------------------------------------
(8) Rechercher le nom et le titre des employés du service 31 qui ont un titre que on trouve dans le département 32.

SELECT nom, titre 
FROM employe 
WHERE titre IN (SELECT titre 
FROM employe 
WHERE nodep = 32) AND nodep = 31

-------------------------------------------------------------
(9) Rechercher le nom et le titre des employés du service 31 qui ont un titre on ne trouve pas dans le département 32.

SELECT nom, titre 
FROM employe 
WHERE titre NOT IN (SELECT titre 
FROM employe 
WHERE nodep = 32) AND nodep = 31

-------------------------------------------------------------
(10) Rechercher le nom, le titre et le salaire des employés qui ont le même titre et le même salaire que Fairent.

SELECT nom, titre, salaire 
FROM employe 
WHERE titre IN (SELECT titre 
FROM employe 
WHERE nom = 'Fairent') AND salaire IN (SELECT salaire 
FROM employe 
WHERE nom = 'Fairent')

-------------------------------------------------------------
(11) Rechercher le numéro de département, le nom du département, le nom des employés, en affichant aussi les départements dans lesquels il y a personne, classés par numéro de département.

SELECT employe.nodep, dept.nom, employe.nom 
FROM employe LEFT 
JOIN dept ON employe.nodep = dept.nodept 
ORDER BY employe.nodep

-------------------------------------------------------------
Partie 2 (EMP-SQL)
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