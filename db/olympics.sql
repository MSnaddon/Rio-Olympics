DROP TABLE athletes;
DROP TABLE nations;
DROP TABLE events;
DROP TABLE participants;

CREATE TABLE nations(
id SERIAL8 PRIMARY KEY,
name VARCHAR(255) 
);

CREATE TABLE athletes(
id SERIAL8 PRIMARY KEY,
name VARCHAR(255),
nation_id int8 REFERENCES nations(id)
);

CREATE TABLE events(
id SERIAL8 PRIMARY KEY,
name VARCHAR(255),
gold_winner INT2,
silver_winner INT2,
bronze_winner INT2
);

CREATE TABLE participants(
  id SERIAL8 PRIMARY KEY,
  athlete_id INT2,
  event_id INT2
);

INSERT INTO nations (name) VALUES ('Hungary');
INSERT INTO nations (name) VALUES ('Great Britian');
INSERT INTO nations (name) VALUES ('Ireland');
INSERT INTO nations (name) VALUES ('Luxembourg');


INSERT INTO athletes (name, nation_id) VALUES ('Zsolt', 1);
INSERT INTO athletes (name, nation_id) VALUES ('Nomanom', 1);
INSERT INTO athletes (name, nation_id) VALUES ('Hamish Broon', 2);
INSERT INTO athletes (name, nation_id) VALUES ('William Macpherson', 2);
INSERT INTO athletes (name, nation_id) VALUES ('Ggin ness', 3);
INSERT INTO athletes (name, nation_id) VALUES ('Gilles Diederich', 4);
INSERT INTO athletes (name, nation_id) VALUES ('Zoey Diederich', 4);
INSERT INTO athletes (name, nation_id) VALUES ('Not a russian', 1);


INSERT INTO events (name, gold_winner, silver_winner, bronze_winner)VALUES ('100 line ruby coding', 4,1,8);
INSERT INTO events (name, gold_winner, silver_winner, bronze_winner)VALUES ('Javaslin', 1,6,5);

INSERT INTO participants (athlete_id, event_id) VALUES (1,1);
INSERT INTO participants (athlete_id, event_id) VALUES (4,1);
INSERT INTO participants (athlete_id, event_id) VALUES (8,1);
INSERT INTO participants (athlete_id, event_id) VALUES (5,1);

INSERT INTO participants (athlete_id, event_id) VALUES (1,2);
INSERT INTO participants (athlete_id, event_id) VALUES (2,2);
INSERT INTO participants (athlete_id, event_id) VALUES (3,2);
INSERT INTO participants (athlete_id, event_id) VALUES (4,2);
INSERT INTO participants (athlete_id, event_id) VALUES (5,2);
INSERT INTO participants (athlete_id, event_id) VALUES (6,2);
INSERT INTO participants (athlete_id, event_id) VALUES (7,2);
INSERT INTO participants (athlete_id, event_id) VALUES (8,2);

