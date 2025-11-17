-- 1. Afficher l’id, first_name, last_name des employés qui n’ont pas d’équipe.
SELECT
  id,
  first_name,
  last_name
FROM
  employee
WHERE
  team_id IS NULL;

-- 2. Afficher l’id, first_name, last_name des employés qui n’ont jamais pris de congé de leur vie.
SELECT
  employee.id,
  employee.first_name,
  employee.last_name
FROM
  employee
  LEFT JOIN leave ON employee.id = leave.employee_id
WHERE
  employee.id is null;

-- 3. Afficher les congés de tel sorte qu’on voie l’id du congé, le début du congé, la fin du congé,
-- le nom & prénom de l’employé qui prend congé et le nom de son équipe.
SELECT
  leave.*,
  employee.first_name,
  employee.last_name,
  team."name"
FROM
  employee
  INNER JOIN team ON employee.team_id = team.id
  INNER JOIN leave ON employee.id = leave.employee_id;

-- 4. Affichez par le nombre d’employés par contract_type, vous devez afficher le type de contrat,
-- et le nombre d’employés associés.
SELECT
  contract_type,
  COUNT(contract_type)
FROM
  employee
GROUP BY
  contract_type;

-- 5. Afficher le nombre d’employés en congé aujourd'hui. La période de congé s'étend 
-- de start_date inclus jusqu’à end_date inclus.
SELECT
  id,
  "start_date",
  end_date,
  COUNT(id)
FROM
  employee
WHERE
  NOW () BETWEEN "start_date" AND end_date;

-- 6. Afficher l’id, le nom, le prénom de tous les employés + le nom de leur équipe qui 
-- sont en congé aujourd’hui. Pour rappel, la end_date est incluse dans le congé, 
-- l’employé ne revient que le lendemain
SELECT
  employee.id,
  employee.first_name,
  employee.last_name,
  team."name",
FROM
  employee
  INNER JOIN team ON team.id = employee.team_id
WHERE
  NOW () BETWEEN "start_date" AND end_date;