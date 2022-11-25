CREATE SCHEMA IF NOT EXISTS texas;


CREATE TABLE IF NOT EXISTS texas.weather_county (
            id serial PRIMARY KEY,
            fips_code varchar(10) UNIQUE,
            county_name varchar(20),
            temperature numeric NOT NULL,
            fahrenheit bool DEFAULT true,
            updated_at timestamp default now(),
            created_at timestamp default now()
        );


INSERT INTO texas.weather_county(fips_code, county_name, temperature)
VALUES ('48225', 'Houston', 71), ('48019', 'Bandera', 71), ('48113', 'Dallas', 71), ('48141', 'El Paso', 71);
--DROP TABLE IF EXISTS texas.weather_county;

SELECT *
FROM texas.weather_county;






-- insert/update

INSERT INTO texas.weather_county(fips_code, county_name, temperature)
VALUES ('48421', 'Sherman', 69);

SELECT *
FROM texas.weather_county;


INSERT INTO texas.weather_county(fips_code, county_name, temperature)
VALUES ('48113', 'Dallas', 66), ('48225', 'Houston', 66), ('48023', 'Baylor', 66), ('48251', 'Johnson', 66)
ON CONFLICT (fips_code) DO UPDATE
SET
    temperature=excluded.temperature,
    updated_at=NOW()
;



SELECT *
FROM texas.weather_county;
