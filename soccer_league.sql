DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    ranking INTEGER NOT NULL
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    player_name TEXT NOT NULL,
    team_id INTEGER REFERENCES teams (id)
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players (id),
    team_id INTEGER REFERENCES players (id)
);

CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    team1 INTEGER REFERENCES teams (id),
    team2 INTEGER REFERENCES teams (id)
);

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    referee_name TEXT NOT NULL
);

CREATE TABLE matches_referees
(
    id SERIAL PRIMARY KEY,
    match_id INTEGER REFERENCES matches (id),
    referee_id INTEGER REFERENCES referees (id)
);