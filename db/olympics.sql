DROP TABLE nations CASCADE;
DROP TABLE athletes CASCADE;
DROP TABLE events CASCADE;
DROP TABLE athletes_events;

CREATE TABLE nations (
id SERIAL4 primary key,
title VARCHAR(255),
code CHAR(3),
co_ordinates POINT,
UNIQUE (title, code)
);

CREATE TABLE athletes (
id SERIAL4 primary key,
first_name VARCHAR(255),
last_name VARCHAR(255),
gender CHAR(1),
nation_id INT4 references nations(id) ON DELETE CASCADE
);

CREATE TABLE events (
id SERIAL4 primary key,
sport VARCHAR(255),
type VARCHAR(255),
day DATE,
gold_winner INT4,
silver_winner INT4,
bronze_winner INT4,
UNIQUE (sport, type),
CHECK (gold_winner = 0 OR gold_winner <> silver_winner),
CHECK (gold_winner = 0 OR gold_winner <> bronze_winner),
CHECK (silver_winner = 0 OR silver_winner <> bronze_winner)
);

CREATE TABLE athletes_events (
id SERIAL4 primary key,
athlete_id INT4 references athletes(id) ON DELETE CASCADE,
event_id INT4 references events(id) ON DELETE CASCADE
);

CREATE UNIQUE INDEX uq_athletes_events ON athletes_events(athlete_id, event_id);