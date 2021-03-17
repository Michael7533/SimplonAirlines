-- 1 Affichage des marques des avions (résultat attendu : 2 lignes)

select aircraft_brands.name from aircraft_brands;

-- 2 Affichage des modèles d'avion Boeing (Résultat attendu : 14 lignes)

select aircraft_models.name
from aircraft_models where brand_idx = 2;

-- 3 Affichage de toutes les villes et leurs pays (Résultat attendu : 400 lignes)

select cities.name, countries.name from cities join countries on cities.country_idx = countries.id

-- 4 Affichage des avions AIRBUS ayant plus de 300 places triés par nb de places décroissant (Résultat attendu : 63 lignes)

select aircrafts.id, aircraft_models.name, aircrafts.seats_nb from aircrafts
        join aircraft_models on aircrafts.model_idx = aircraft_models.id
               where (seats_nb>300 and brand_idx = 1)
        order by seats_nb;

-- 5 Affichage des vols intérieurs (même pays) (Résultat attendu : 41 lignes)

select fromcity.name, tocity.name from flights
join cities fromcity on flights.from_city = fromcity.id
join cities tocity on tocity.id = flights.to_city
where fromcity.country_idx = tocity.country_idx;

-- 6 Affichage des vols intérieurs plus longs que 5h triés par durée décroissante (Résultat attendu : 17 lignes)

select fromcity.name, tocity.name, std_duration_sec/60/60 from flights
join cities fromcity on flights.from_city = fromcity.id
join cities tocity on tocity.id = flights.to_city
where fromcity.country_idx = tocity.country_idx and std_duration_sec> 18000;

-- 7 Afficher les 5 vols ayant le plus de personnel navigant (Résultat attendu : 5 lignes)

Select flight_idx, Count(flight_idx) AS Nb From flights_employees GROUP BY flight_idx ORDER BY Nb desc LIMIT 5

-- 8 Afficher les personnes travaillant moins d'une heure dans la compagnie (Résultat attendu : 32 lignes)
---- je n'arrive pas a limiter la reponse aux moins de 3600x, mais j'ai bien les 32 qui y correspondent dans ma liste ---
select sum(std_duration_sec) as ttotal, employee_idx from flights join flights_employees on flights.id = flights_employees.flight_idx
group by flights_employees.employee_idx



-- 9 Afficher les durées des vols intérieur en utilisant intersect (Résultat attendu : 41 lignes)
-------   KO j'arrive a utiliser intersect sur uniquement les villes, mais pas sur les vols interrieurs (ça me donne egalement les vols pour des villes identiques

select from_city from flights
intersect
select to_city from flights;

------

select fromcity.name  from flights
join cities fromcity on flights.from_city = fromcity.id
 join cities tocity on flights.to_city = tocity.id
INTERSECT
select tocity.name  from flights
join cities fromcity on flights.from_city = fromcity.id
join cities tocity on flights.to_city = tocity.id

0px) ;