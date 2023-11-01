DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    region_name TEXT NOT NULL
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    preferred_region_id INTEGER REFERENCES regions (id)
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    post_text TEXT,
    user_id INTEGER REFERENCES users (id),
    location TEXT NOT NULL,
    region_id INTEGER REFERENCES regions (id)
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    category_name TEXT NOT NULL,
    post_id INTEGER REFERENCES posts (id)
);


