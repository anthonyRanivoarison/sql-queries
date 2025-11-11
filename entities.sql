-- Entities
-- Team, Employee, Leave

CREATE DATABASE company;

/c company;

CREATE TABLE
  team (id SERIAL PRIMARY KEY, "name" VARCHAR(100));

CREATE TABLE
  employee (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    contract_type VARCHAR(100),
    salary INT,
    team_id INT REFERENCES team (id)
  );

CREATE TABLE
  leave (
    id SERIAL PRIMARY KEY,
    "start_date" Date,
    end_date Date,
    employee_id INT REFERENCES employee (id)
  );

-- Relation: 
-- Team <- belong -> Employee (One-to-Many)
-- Employee <- take -> leave (One-to-Many)