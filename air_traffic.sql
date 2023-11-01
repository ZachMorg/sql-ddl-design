-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

create table countries
(
  id SERIAL PRIMARY KEY,
  country_name TEXT NOT NULL
);

create table cities
(
  id SERIAL PRIMARY KEY,
  city_name TEXT NOT NULL
);

create table flights
(
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline TEXT NOT NULL,
  from_city_id INTEGER REFERENCES cities (id),
  from_country_id INTEGER REFERENCES countries (id),
  to_city_id INTEGER REFERENCES cities (id),
  to_country_id INTEGER REFERENCES countries (id)
);

CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  flight_id INTEGER NOT NULL
);


INSERT INTO countries
  (country_name)
VALUES
  ('United States'),
  ('Japan'),
  ('United Kingdom'),
  ('Mexico'),
  ('Morocco'),
  ('China'),
  ('Chile'),
  ('Brazil'),
  ('France'),
  ('UAE');

INSERT INTO cities
  (city_name)
VALUES
  ('Washington DC'),
  ('Seattle'),
  ('Tokyo'),
  ('London'),
  ('Los Angeles'),
  ('Las Vegas'),
  ('Mexico City'),
  ('Paris'),
  ('Casablanca'),
  ('Dubai'),
  ('Beijing'),
  ('New York'),
  ('Charlotte'),
  ('Cedar Rapids'),
  ('Chicago'),
  ('New Orleans'),
  ('Sao Paolo'),
  ('Santiago');

INSERT INTO flights
  (departure, arrival, airline, from_city_id, from_country_id, to_city_id, to_country_id)
VALUES
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 1, 1, 2, 1),
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 3, 2, 4, 3),
  ('2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 5, 1, 6, 1),
  ('2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 2, 1, 7, 4),
  ('2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 8, 9, 9, 5),
  ('2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 10, 10, 11, 6),
  ('2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 12, 1, 13, 1),
  ('2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 14, 1, 15, 1),
  ('2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 13, 1, 16, 1),
  ('2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 17, 8, 18, 7);


INSERT INTO passengers
  (first_name, last_name, seat, flight_id)
VALUES
  ('Jennifer', 'Finch', '33B', 1),
  ('Thadeus', 'Gathercoal', '8A', 2),
  ('Sonja', 'Pauley', '12F', 3),
  ('Jennifer', 'Finch', '20A', 4),
  ('Waneta', 'Skeleton', '23D', 5),
  ('Thadeus', 'Gathercoal', '18C', 6),
  ('Berkie', 'Wycliff', '9E', 7),
  ('Alvin', 'Leathes', '1A', 8),
  ('Berkie', 'Wycliff', '32B', 9),
  ('Cory', 'Squibbes', '10D', 10);