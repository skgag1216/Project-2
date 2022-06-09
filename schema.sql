-- Drop table if exists
DROP TABLE IF EXISTS original_restaurants;
DROP TABLE IF EXISTS restaurants;
DROP TABLE IF EXISTS menu;

--Create the new tables
CREATE TABLE original_restaurants (
	id BIGINT PRIMARY KEY,
	name TEXT,
	score DOUBLE PRECISION,
	ratings DOUBLE PRECISION,
	category TEXT,
	price_range TEXT,
	full_address TEXT,
    street TEXT,
    city texT,
    state TEXT,
	zip_code BIGINT,
	lat DOUBLE PRECISION,
	lng DOUBLE PRECISION
);

CREATE TABLE restaurants (
    id BIGINT PRIMARY KEY,
	name TEXT,
	score DOUBLE PRECISION,
	ratings DOUBLE PRECISION,
	category TEXT,
	price_range TEXT,
	full_address TEXT,
    street TEXT,
    city texT,
    state TEXT,
	zip_code BIGINT,
	lat DOUBLE PRECISION,
	lng DOUBLE PRECISION
);

CREATE TABLE menu (
    restaurant_id BIGINT FOREIGN KEY REFERENCES restaurants(id), 
    category TEXT,
    name TEXT,
    description TEXT,
    price TEXT
);