-- Sistema de gestão de venda de albuns musicais

-- Create if exists cbd_103360_ex4 keyspace and use it
CREATE KEYSPACE IF NOT EXISTS cbd_103360_ex4 WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };
USE cbd_103360_ex4;

-- User table
CREATE TABLE users (
    username text,
    name text,
    email text,
    register_timestamp timestamp,
    PRIMARY KEY (username)
    );

-- Albums table
CREATE TABLE albums (
    name text,
    band text,
    release_date date,
    genres set<text>,
    price float,
    PRIMARY KEY (name, band)
    );

-- Sales table
CREATE TABLE sales (
    sale_id int,
    albums set<text>,
    client text,
    album_price map<text, float>,
    total_price float,
    sale_timestamp timestamp,
    PRIMARY KEY (client, sale_timestamp)
    );

-- Indexes
CREATE INDEX total_price_idx ON sales (total_price);
CREATE INDEX albums_idx ON sales (albums);

-- Bands table
CREATE TABLE bands (
    name text,
    members set<text>,
    foundation_date date,
    genres set<text>,
    albums set<text>,
    PRIMARY KEY (name)
    );

-- Review tables
CREATE TABLE reviews (
    album text,
    author text,
    review text,
    rating int,
    review_timestamp timestamp,
    PRIMARY KEY (album, author, review_timestamp)
    )
    WITH CLUSTERING ORDER BY (author ASC, review_timestamp DESC);
