-- Create if exists cbd_103360_ex2 keyspace and use it
CREATE KEYSPACE IF NOT EXISTS cbd_103360_ex2 WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };
USE cbd_103360_ex2;

-- JSON data
-- Users table
SELECT JSON * FROM users;

-- Videos table
SELECT JSON * FROM videos;

-- Events table
SELECT JSON * FROM events;

-- Comments Table
SELECT JSON * FROM comments;

-- Ratings Table
SELECT JSON * FROM ratings;

-- Tags Table
SELECT JSON * FROM tags;

-- Followers Table
SELECT JSON * FROM followers;

-- Queries
-- Pesquisar todos os vídeos de um determinado autor
SELECT * FROM videos WHERE author='dmustaine' ALLOW FILTERING;

-- Pesquisar todos os comentários por utlizador, ordenados inversamente pela data
SELECT * FROM comments WHERE author='jhetfield' ALLOW FILTERING;

-- Pesquisar todos os comentários de um determinado video, ordenados inversamente pela data
SELECT * FROM comments WHERE video_id=9;

-- Pesquisar o rating médio de um vídeo e quantas vezes foi votado
SELECT AVG(rating), COUNT(rating) FROM ratings WHERE video_id=3 ALLOW FILTERING;

-- Pesquisar os últimos 3 comentários introduzidos para um vídeo
SELECT * FROM comments WHERE video_id=7 LIMIT 3;

-- Pesquisar a lista das tags de um determinado vídeo
SELECT tags FROM videos WHERE id=10;

-- Pesquisar todos os vídeos com a tag thrash metal
SELECT * FROM tags WHERE tag='thrash metal';

-- Pesquisar os últimos 5 eventos de um determinado vídeo realizados por um utilizador
SELECT * FROM events WHERE video_id=2 AND author='acunningham' LIMIT 5;

-- Pesquisar os vídeos partilhados por determinado utilizador num determinado período de tempo
-- Não existe em Cassandra um operador LIKE como em SQL, o mais semelhante que existe é utilizar os operadores "<" e ">". A utilização dos operadores necessita da utilização de ALLOW FILTERING.
SELECT * FROM videos WHERE author='dmustaine' AND upload_timestamp > '2022-11-19 17:21:30.307000+0000' AND upload_timestamp < '2022-11-19 17:21:40.807000+0000' ALLOW FILTERING;

-- Pesquisar os últimos 10 vídeos, ordenados inversamente pela data de partilha
-- É impossível realizar esta query, para que os resultados aparecerem ordenados seria necessário especificar um autor desse vídeo.

-- Pesquisar todos seguidores (followers) de determinado vídeo
SELECT followers FROM followers WHERE video_id=6;

-- Pesquisar todos comentários (dos vídeos) que determinado utilizador está a seguir (following)
-- Tentei correr este comando mas não consegui, acho que não é possível fazer este tipo de queries como em SQL, umas das maneiras era criar uma table comments followers, onde contem os dados que precisamos, assim era muito mais fácil ir buscar os dados.
SELECT * FROM comments WHERE video_id IN (SELECT video_id FROM followers WHERE followers CONTAINS 'jhetfield' ALLOW FILTERING) AND author='jhetfield' ALLOW FILTERING;

-- Pesquisar os 5 vídeos com maior rating
-- Não é possível realizar esta query, seria necessário incluir o rating como clustering key de forma a ordenar por rating e uma partition key.

-- Query que retorne todos os vídeos e que mostre claramente a forma pela qual estão ordenados
-- Não é possível realizar esta query.

-- Lista com as Tags existentes e o número de vídeos catalogados com cada uma delas
-- Não é possível realizar esta query, seria necessário ter uma coluna que contabilizasse o número de vídeos com a tag em causa, porque em cassandra não existe nenhum método nativo para fazer esta operação.

-- Pesquisar todos os vídeos que a sua descrição é deftones
SELECT * FROM videos WHERE description='Deftones' ALLOW FILTERING;

-- Pesquisar todos os vídeos que a sua descrição é deftones e que tenham a tag alternative metal
SELECT * FROM videos WHERE description='Deftones' AND tags CONTAINS 'alternative metal' ALLOW FILTERING;
