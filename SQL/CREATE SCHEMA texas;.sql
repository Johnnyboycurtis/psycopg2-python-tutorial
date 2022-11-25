CREATE SCHEMA texas;


CREATE TABLE IF NOT EXISTS texas.weather (
            id serial PRIMARY KEY,
            city varchar(20) UNIQUE,
            temperature numeric NOT NULL,
            fahrenheit bool DEFAULT true,
            updated_at timestamp default now(),
            created_at timestamp default now()
        );


INSERT INTO texas.weather(city, temperature)
VALUES ('Houston', 69), ('Arlington', 71), ('Dallas', 71), ('El Paso', 71);
--DROP TABLE IF EXISTS schema1.weather;

SELECT *
FROM texas.weather;


INSERT INTO texas.weather(city, temperature)
VALUES ('San Antonio', 68);


INSERT INTO texas.weather(city, temperature)
VALUES ('Dallas', 66), ('Houston', 66), ('Baytown', 65)
ON CONFLICT (city) DO UPDATE
SET
    city=excluded.city,
    temperature=excluded.temperature,
    updated_at=NOW()
;