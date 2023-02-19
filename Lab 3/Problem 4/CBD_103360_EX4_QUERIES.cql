-- Sistema de gestão de venda de albuns musicais

-- Create if exists cbd_103360_ex4 keyspace and use it
CREATE KEYSPACE IF NOT EXISTS cbd_103360_ex4 WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };
USE cbd_103360_ex4;

-- JSON
-- Users table
SELECT JSON * FROM users;

-- Albums table
SELECT JSON * FROM albums;

-- Sales table
SELECT JSON * FROM sales;

-- Bands table
SELECT JSON * FROM bands;

-- Reviews table
SELECT JSON * FROM reviews;

-- Update
-- Update user email and register_timestamp
UPDATE users SET email = 'muhammad@email.com', register_timestamp=toTimestamp(now()) WHERE username='ali';

-- Update albums genres and price
UPDATE albums SET genres={'heavy metal', 'thrash metal', 'rock'}, price=29.99 WHERE name='Ride the Lightning' AND band='Metallica';

-- Update band genres
UPDATE bands SET genres={'heavy metal', 'thrash metal', 'rock'} WHERE name='Metallica';

-- Delete
-- Delete album from albums
DELETE FROM albums WHERE name='Sabotage' AND band='Black Sabbath';

-- Delete album from band albums
DELETE albums['Sabotage'] FROM bands WHERE name='Black Sabbath';

-- Delete review
DELETE FROM reviews WHERE album='Master of Puppets' AND author='francis';

-- Delete user
DELETE FROM users WHERE username='ali';

-- Delete sale
DELETE FROM sales WHERE client='conor';

-- Queries
-- Selecionar todos os albuns que tenham o genero 'thrash metal'
SELECT name, band, genres FROM albums WHERE genres CONTAINS 'thrash metal' ALLOW FILTERING;

-- Selecionar todos os albuns que tenham o genero 'thrash metal' e 'rock'
SELECT name, band, genres FROM albums WHERE genres CONTAINS 'thrash metal' AND genres CONTAINS 'rock' ALLOW FILTERING;

-- Selecionar todas as reviews feitas ao album 'Kill Em All' ordenadas por review_timestamp, do mais recente para o mais antigo
SELECT * FROM reviews WHERE album='Kill Em All';

-- Selecionar todas as reviews feitas ao album 'Kill Em All' ordenadas por review_timestamp, do mais recente para o mais antigo, limitando a 5 resultados
SELECT * FROM reviews WHERE album='Kill Em All' LIMIT 5;

-- Selecionar as compras feitas que incluam 'Comboys from Hell'
SELECT * FROM sales WHERE albums CONTAINS 'Comboys from Hell' ALLOW FILTERING;

-- Selecionar todos os albuns produzidos pelos os 'Megadeth'
SELECT * FROM albums WHERE band='Megadeth' ALLOW FILTERING;

-- ​ Selecionar 3 vendas que um preço superior a 60 euros
SELECT * FROM sales WHERE total_price > 60 LIMIT 3 ALLOW FILTERING;

-- Selecionar os albuns com rating de 4 ou mais
SELECT * FROM reviews WHERE rating >= 4 ALLOW FILTERING;

-- Selecionar os albuns de 5 compras, assim como o preço total
SELECT albums, total_price FROM sales LIMIT 5;

-- Selecionar o conjunto de albuns produzidos por cada banda
SELECT name, albums FROM bands;
