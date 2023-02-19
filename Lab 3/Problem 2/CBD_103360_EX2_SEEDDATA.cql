-- Create if exists cbd_103360_ex2 keyspace and use it
CREATE KEYSPACE IF NOT EXISTS cbd_103360_ex2 WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };
USE cbd_103360_ex2;

-- Users table
INSERT INTO users (username, name, email, register_timestamp)
VALUES ('scarpenter', 'Stephen Carpenter', 'scarpenter@deftones.com', toTimestamp(now()));

INSERT INTO users (username, name, email, register_timestamp)
VALUES ('acunningham', 'Abe Cunningham', 'acunningham@deftones.com', toTimestamp(now()));

INSERT INTO users (username, name, email, register_timestamp)
VALUES ('cmoreno', 'Chino Moreno', 'cmoreno@deftones.com', toTimestamp(now()));

INSERT INTO users (username, name, email, register_timestamp)
VALUES ('fdelgado', 'Frank Delgado', 'fdelgado@deftones.com', toTimestamp(now()));

INSERT INTO users (username, name, email, register_timestamp)
VALUES ('candreu', 'Christian Andreu', 'candreu@gojira.com', toTimestamp(now()));

INSERT INTO users (username, name, email, register_timestamp)
VALUES ('jduplantier', 'Joe Duplantier', 'jduplantier@gojira.com', toTimestamp(now()));

INSERT INTO users (username, name, email, register_timestamp)
VALUES ('mduplantier', 'Mario Duplantier', 'mduplantier@gojira.com', toTimestamp(now()));

INSERT INTO users (username, name, email, register_timestamp)
VALUES ('jmlabadie', 'Jean-Michel Labadie', 'jmlabadie@gojira.com', toTimestamp(now()));

INSERT INTO users (username, name, email, register_timestamp)
VALUES ('jhetfield', 'James Hetfield', 'jhetfield@metallica.com', toTimestamp(now()));

INSERT INTO users (username, name, email, register_timestamp)
VALUES ('dmustaine', 'Dave Mustaine', 'dmustaine@megadeth.com', toTimestamp(now()));

-- Videos table
INSERT INTO videos (id, author, name, description, tags, followers, upload_timestamp)
VALUES (1, 'scarpenter', 'Bored', 'Deftones', {'alternative metal', 'alternative rock', 'nu metal'}, 4, toTimestamp(now()));

INSERT INTO videos (id, author, name, description, tags, followers, upload_timestamp)
VALUES (2, 'acunningham', 'Birthmark', 'Deftones', {'alternative metal', 'alternative rock', 'nu metal'}, 8, toTimestamp(now()));

INSERT INTO videos (id, author, name, description, tags, followers, upload_timestamp)
VALUES (3, 'cmoreno', 'My Own Summer (Shove It)', 'Deftones', {'alternative metal', 'alternative rock', 'nu metal'}, 6, toTimestamp(now()));

INSERT INTO videos (id, author, name, description, tags, followers, upload_timestamp)
VALUES (4, 'jduplantier', 'Born in Winter', 'Gojira', {'groove metal', 'progressive metal'}, 6, toTimestamp(now()));

INSERT INTO videos (id, author, name, description, tags, followers, upload_timestamp)
VALUES (5, 'mduplantier', 'Flying Whales', 'Gojira', {'groove metal', 'progressive metal'}, 4, toTimestamp(now()));

INSERT INTO videos (id, author, name, description, tags, followers, upload_timestamp)
VALUES (6, 'jhetfield', 'For Whom The Bell Tolls', 'Metallica', {'heavy metal', 'thrash metal'}, 5, toTimestamp(now()));

INSERT INTO videos (id, author, name, description, tags, followers, upload_timestamp)
VALUES (7, 'dmustaine', 'Symphony of Destruction', 'Megadeth', {'heavy metal', 'thrash metal'}, 3, toTimestamp(now()));

INSERT INTO videos (id, author, name, description, tags, followers, upload_timestamp)
VALUES (8, 'dmustaine', 'Conquer Or Die', 'Megadeth', {'heavy metal', 'thrash metal'}, 5, toTimestamp(now()));

INSERT INTO videos (id, author, name, description, tags, followers, upload_timestamp)
VALUES (9, 'dmustaine', 'Tornado Of Souls', 'Megadeth', {'heavy metal', 'thrash metal'}, 9, toTimestamp(now()));

INSERT INTO videos (id, author, name, description, tags, followers, upload_timestamp)
VALUES (10, 'jhetfield', 'Master Of Puppets', 'Metallica', {'heavy metal', 'thrash metal'}, 9, toTimestamp(now()));

-- Events table
INSERT INTO events (video_id, author, type, event_timestamp, moment)
VALUES (1, 'scarpenter', 'PLAY', toTimestamp(now()), 0);

INSERT INTO events (video_id, author, type, event_timestamp, moment)
VALUES (1, 'scarpente', 'PAUSE', toTimestamp(now()), 30);

INSERT INTO events (video_id, author, type, event_timestamp, moment)
VALUES (1, 'scarpente', 'PLAY', toTimestamp(now()), 30);

INSERT INTO events (video_id, author, type, event_timestamp, moment)
VALUES (1, 'scarpente', 'PAUSE', toTimestamp(now()), 60);

INSERT INTO events (video_id, author, type, event_timestamp, moment)
VALUES (1, 'scarpente', 'PLAY', toTimestamp(now()), 60);

INSERT INTO events (video_id, author, type, event_timestamp, moment)
VALUES (1, 'scarpente', 'STOP', toTimestamp(now()), 300);

INSERT INTO events (video_id, author, type, event_timestamp, moment)
VALUES (2, 'acunningham', 'PLAY', toTimestamp(now()), 0);

INSERT INTO events (video_id, author, type, event_timestamp, moment)
VALUES (2, 'acunningham', 'PAUSE', toTimestamp(now()), 30);

INSERT INTO events (video_id, author, type, event_timestamp, moment)
VALUES (2, 'acunningham', 'PLAY', toTimestamp(now()), 30);

INSERT INTO events (video_id, author, type, event_timestamp, moment)
VALUES (2, 'acunningham', 'PAUSE', toTimestamp(now()), 60);

INSERT INTO events (video_id, author, type, event_timestamp, moment)
VALUES (2, 'acunningham', 'PLAY', toTimestamp(now()), 60);

INSERT INTO events (video_id, author, type, event_timestamp, moment)
VALUES (2, 'acunningham', 'STOP', toTimestamp(now()), 300);

-- Comments table
INSERT INTO comments (author, video_id, comment, comment_timestamp)
VALUES ('scarpenter', 1, 'Great video!', toTimestamp(now()));

INSERT INTO comments (author, video_id, comment, comment_timestamp)
VALUES ('acunningham', 2, 'Awesome!', toTimestamp(now()));

INSERT INTO comments (author, video_id, comment, comment_timestamp)
VALUES ('cmoreno', 3, 'Nice!', toTimestamp(now()));

INSERT INTO comments (author, video_id, comment, comment_timestamp)
VALUES ('fdelgado', 4, 'Cool!', toTimestamp(now()));

INSERT INTO comments (author, video_id, comment, comment_timestamp)
VALUES ('candreu', 5, 'Great!', toTimestamp(now()));

INSERT INTO comments (author, video_id, comment, comment_timestamp)
VALUES ('jduplantier', 6, 'Nice video!', toTimestamp(now()));

INSERT INTO comments (author, video_id, comment, comment_timestamp)
VALUES ('mduplantier', 7, 'Awesome!', toTimestamp(now()));

INSERT INTO comments (author, video_id, comment, comment_timestamp)
VALUES ('jmlabadie', 8, 'Cool!', toTimestamp(now()));

INSERT INTO comments (author, video_id, comment, comment_timestamp)
VALUES ('jhetfield', 9, 'Great!', toTimestamp(now()));

INSERT INTO comments (author, video_id, comment, comment_timestamp)
VALUES ('dmustaine', 10, 'Nice video!', toTimestamp(now()));

INSERT INTO comments (author, video_id, comment, comment_timestamp)
VALUES ('scarpenter', 1, 'Great video!', toTimestamp(now()));

INSERT INTO comments (author, video_id, comment, comment_timestamp)
VALUES ('acunningham', 2, 'Awesome!', toTimestamp(now()));

INSERT INTO comments (author, video_id, comment, comment_timestamp)
VALUES ('cmoreno', 3, 'Nice!', toTimestamp(now()));

INSERT INTO comments (author, video_id, comment, comment_timestamp)
VALUES ('fdelgado', 4, 'Cool!', toTimestamp(now()));

INSERT INTO comments (author, video_id, comment, comment_timestamp)
VALUES ('candreu', 5, 'Great!', toTimestamp(now()));

INSERT INTO comments (author, video_id, comment, comment_timestamp)
VALUES ('jduplantier', 6, 'Nice video!', toTimestamp(now()));

INSERT INTO comments (author, video_id, comment, comment_timestamp)
VALUES ('mduplantier', 7, 'Awesome!', toTimestamp(now()));

INSERT INTO comments (author, video_id, comment, comment_timestamp)
VALUES ('jmlabadie', 8, 'Cool!', toTimestamp(now()));

INSERT INTO comments (author, video_id, comment, comment_timestamp)
VALUES ('jhetfield', 9, 'Great!', toTimestamp(now()));

INSERT INTO comments (author, video_id, comment, comment_timestamp)
VALUES ('dmustaine', 10, 'Nice video!', toTimestamp(now()));

INSERT INTO comments (author, video_id, comment, comment_timestamp)
VALUES ('dmustaine', 7, 'Awesome!', toTimestamp(now()));

INSERT INTO comments (author, video_id, comment, comment_timestamp)
VALUES ('jhetfield', 7, 'Awesome!', toTimestamp(now()));

-- Ratings table
INSERT INTO ratings (id, author, video_id, rating, rating_timestamp)
VALUES (1, 'scarpenter', 1, 5, toTimestamp(now()));

INSERT INTO ratings (id, author, video_id, rating, rating_timestamp)
VALUES (2, 'acunningham', 2, 4, toTimestamp(now()));

INSERT INTO ratings (id, author, video_id, rating, rating_timestamp)
VALUES (3, 'cmoreno', 3, 3, toTimestamp(now()));

INSERT INTO ratings (id, author, video_id, rating, rating_timestamp)
VALUES (4, 'fdelgado', 4, 2, toTimestamp(now()));

INSERT INTO ratings (id, author, video_id, rating, rating_timestamp)
VALUES (5, 'candreu', 5, 1, toTimestamp(now()));

INSERT INTO ratings (id, author, video_id, rating, rating_timestamp)
VALUES (6, 'jduplantier', 6, 5, toTimestamp(now()));

INSERT INTO ratings (id, author, video_id, rating, rating_timestamp)
VALUES (7, 'mduplantier', 7, 4, toTimestamp(now()));

INSERT INTO ratings (id, author, video_id, rating, rating_timestamp)
VALUES (8, 'jmlabadie', 8, 3, toTimestamp(now()));

INSERT INTO ratings (id, author, video_id, rating, rating_timestamp)
VALUES (9, 'jhetfield', 9, 2, toTimestamp(now()));

INSERT INTO ratings (id, author, video_id, rating, rating_timestamp)
VALUES (10, 'dmustaine', 10, 1, toTimestamp(now()));

INSERT INTO ratings (id, author, video_id, rating, rating_timestamp)
VALUES (11, 'scarpenter', 1, 5, toTimestamp(now()));

INSERT INTO ratings (id, author, video_id, rating, rating_timestamp)
VALUES (12, 'acunningham', 2, 4, toTimestamp(now()));

INSERT INTO ratings (id, author, video_id, rating, rating_timestamp)
VALUES (13, 'cmoreno', 3, 3, toTimestamp(now()));

INSERT INTO ratings (id, author, video_id, rating, rating_timestamp)
VALUES (14, 'fdelgado', 4, 2, toTimestamp(now()));

INSERT INTO ratings (id, author, video_id, rating, rating_timestamp)
VALUES (15, 'candreu', 5, 1, toTimestamp(now()));

INSERT INTO ratings (id, author, video_id, rating, rating_timestamp)
VALUES (16, 'jduplantier', 6, 5, toTimestamp(now()));

INSERT INTO ratings (id, author, video_id, rating, rating_timestamp)
VALUES (17, 'mduplantier', 7, 4, toTimestamp(now()));

INSERT INTO ratings (id, author, video_id, rating, rating_timestamp)
VALUES (18, 'jmlabadie', 8, 3, toTimestamp(now()));

INSERT INTO ratings (id, author, video_id, rating, rating_timestamp)
VALUES (19, 'jhetfield', 9, 2, toTimestamp(now()));

INSERT INTO ratings (id, author, video_id, rating, rating_timestamp)
VALUES (20, 'dmustaine', 10, 1, toTimestamp(now()));

-- Tags table
INSERT INTO tags (tag, videos,tag_timestamp)
VALUES ('alternative metal', {1, 2, 3}, toTimestamp(now()));

INSERT INTO tags (tag, videos,tag_timestamp)
VALUES ('alternative rock', {1, 2, 3}, toTimestamp(now()));

INSERT INTO tags (tag, videos,tag_timestamp)
VALUES ('nu metal', {1, 2, 3}, toTimestamp(now()));

INSERT INTO tags (tag, videos,tag_timestamp)
VALUES ('groove metal', {4, 5}, toTimestamp(now()));

INSERT INTO tags (tag, videos,tag_timestamp)
VALUES ('progressive metal', {4, 5}, toTimestamp(now()));

INSERT INTO tags (tag, videos,tag_timestamp)
VALUES ('heavy metal', {6, 7, 8, 9, 10}, toTimestamp(now()));

INSERT INTO tags (tag, videos,tag_timestamp)
VALUES ('thrash metal', {6, 7, 8, 9, 10}, toTimestamp(now()));

INSERT INTO tags (tag, videos,tag_timestamp)
VALUES ('rock', {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, toTimestamp(now()));

INSERT INTO tags (tag, videos,tag_timestamp)
VALUES ('metal', {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, toTimestamp(now()));

INSERT INTO tags (tag, videos,tag_timestamp)
VALUES ('music', {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, toTimestamp(now()));

-- Followers table
INSERT INTO followers (video_id, followers, follow_timestamp)
VALUES (1, {'scarpenter', 'acunningham', 'cmoreno', 'fdelgado'}, toTimestamp(now()));

INSERT INTO followers (video_id, followers, follow_timestamp)
VALUES (2, {'candreu', 'jduplantier', 'mduplantier', 'jmlabadie', 'jhetfield', 'dmustaine', 'scarpenter', 'acunningham'}, toTimestamp(now()));

INSERT INTO followers (video_id, followers, follow_timestamp)
VALUES (3, {'jhetfield', 'dmustaine', 'scarpenter', 'acunningham', 'candreu', 'jduplantier'}, toTimestamp(now()));

INSERT INTO followers (video_id, followers, follow_timestamp)
VALUES (4, {'mduplantier', 'jmlabadie', 'jhetfield', 'dmustaine', 'scarpenter', 'acunningham'}, toTimestamp(now()));

INSERT INTO followers (video_id, followers, follow_timestamp)
VALUES (5, {'fdelgado', 'candreu', 'jduplantier', 'mduplantier'}, toTimestamp(now()));

INSERT INTO followers (video_id, followers, follow_timestamp)
VALUES (6, {'jmlabadie', 'jhetfield', 'dmustaine', 'scarpenter'}, toTimestamp(now()));

INSERT INTO followers (video_id, followers, follow_timestamp)
VALUES (7, {'acunningham', 'candreu', 'jduplantier'}, toTimestamp(now()));

INSERT INTO followers (video_id, followers, follow_timestamp)
VALUES (8, {'mduplantier', 'jmlabadie', 'jhetfield', 'dmustaine', 'scarpenter'}, toTimestamp(now()));

INSERT INTO followers (video_id, followers, follow_timestamp)
VALUES (9, {'jhetfield', 'dmustaine', 'scarpenter', 'acunningham', 'candreu', 'jduplantier', 'mduplantier', 'jmlabadie', 'cmoreno'}, toTimestamp(now()));

INSERT INTO followers (video_id, followers, follow_timestamp)
VALUES (10, {'jhetfield', 'dmustaine', 'scarpenter', 'acunningham', 'candreu', 'jduplantier', 'mduplantier', 'jmlabadie', 'fdelgado'}, toTimestamp(now()));
