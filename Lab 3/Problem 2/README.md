# Cassandra

## Users table
- **username** 
- **name**
- **email**
- **register timestamp**

Create users table.
```cassandra
CREATE TABLE users (
    username text,
    name text,
    email text,
    register_timestamp timestamp,
    PRIMARY KEY (username, register_timestamp)
    );
```

## Videos table
-  **id**
- **author**
- **name**
- **description**
- **tags**
- **followers**
- **upload timestamp**

Create videos table.
```cassandra
CREATE TABLE videos (
    id int,
    author text,
    name text,
    description text,
    tags set<text>,
    followers int,
    upload_timestamp timestamp,
    PRIMARY KEY (id, author, upload_timestamp)
    );
```

## Events table
- **video id**
- **author**
- **type**
- **event timestamp**
- **moment**

Create events table.
```cassandra
CREATE TABLE events (
    video_id int,
    author text,
    type text,
    event_timestamp timestamp,
    moment int,
    PRIMARY KEY (video_id, author, event_timestamp, moment)
    );
```

## Comments table
- **author**
- **video id**
- **comment**
- **comment timestamp**

Create comments table.
```cassandra
CREATE TABLE comments (
    author text,
    video_id int,
    comment text,
    comment_timestamp timestamp,
    PRIMARY KEY (video_id, comment_timestamp)) 
    WITH CLUSTERING ORDER BY (comment_timestamp DESC)
    ;
```

## Ratings table
- **video id**
- **author**
- **rating**
- **rating timestamp**

Create ratings table.
```cassandra
CREATE TABLE ratings (
    id int,
    video_id int,
    author text,
    rating int,
    rating_timestamp timestamp,
    PRIMARY KEY (id, video_id)
    );
```

## Tags table
- **tag**
- **video id**
- **tag timestamp**

Create tags table.
```cassandra
CREATE TABLE tags (
    tag text,
    videos set<int>,
    tag_timestamp timestamp,
    PRIMARY KEY (tag)
    );
```

## Followers table
- **video id**
- **followers**
- **follow timestamp**

Create followers table.
```cassandra
CREATE TABLE followers (
    video_id int,
    followers set<text>,
    follow_timestamp timestamp,
    PRIMARY KEY (video_id)
    );
```

## Put data in tables
- **Users table**
```cassandra
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
```
- **Videos table**
```cassandra
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
```
- **Events table**
```cassandra
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
```
- **Comments table**
```cassandra
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
```
- **Ratings table**
```cassandra
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
```
- **Tags table**
```cassandra
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
```
- **Followers table**
```cassandra
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
```

## JSON
- **Users table**
```cassandra
cqlsh:cbd> SELECT JSON * FROM users;

 [json]
-----------------------------------------------------------------------------------------------------------------------------------------------
     {"username": "jhetfield", "register_timestamp": "2022-11-19 17:20:38.261Z", "email": "jhetfield@metallica.com", "name": "James Hetfield"}
          {"username": "candreu", "register_timestamp": "2022-11-19 17:20:05.256Z", "email": "candreu@gojira.com", "name": "Christian Andreu"}
         {"username": "fdelgado", "register_timestamp": "2022-11-19 17:19:59.987Z", "email": "fdelgado@deftones.com", "name": "Frank Delgado"}
    {"username": "jduplantier", "register_timestamp": "2022-11-19 17:20:21.857Z", "email": "jduplantier@gojira.com", "name": "Joe Duplantier"}
 {"username": "scarpenter", "register_timestamp": "2022-11-19 17:19:33.112Z", "email": "scarpenter@deftones.com", "name": "Stephen Carpenter"}
  {"username": "acunningham", "register_timestamp": "2022-11-19 17:19:45.822Z", "email": "acunningham@deftones.com", "name": "Abe Cunningham"}
            {"username": "cmoreno", "register_timestamp": "2022-11-19 17:19:54.370Z", "email": "cmoreno@deftones.com", "name": "Chino Moreno"}
   {"username": "jmlabadie", "register_timestamp": "2022-11-19 17:20:33.206Z", "email": "jmlabadie@gojira.com", "name": "Jean-Michel Labadie"}
       {"username": "dmustaine", "register_timestamp": "2022-11-19 17:20:43.306Z", "email": "dmustaine@megadeth.com", "name": "Dave Mustaine"}
  {"username": "mduplantier", "register_timestamp": "2022-11-19 17:20:26.408Z", "email": "mduplantier@gojira.com", "name": "Mario Duplantier"}

(10 rows)
```
- **Videos table**
```cassandra
cqlsh:cbd> SELECT JSON * FROM videos;

 [json]
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                          {"id": 5, "author": "mduplantier", "upload_timestamp": "2022-11-19 17:21:19.983Z", "description": "Gojira", "followers": 4, "name": "Flying Whales", "tags": ["groove metal", "progressive metal"]}
                          {"id": 10, "author": "jhetfield", "upload_timestamp": "2022-11-19 17:21:46.140Z", "description": "Metallica", "followers": 9, "name": "Master Of Puppets", "tags": ["heavy metal", "thrash metal"]}
                 {"id": 1, "author": "scarpenter", "upload_timestamp": "2022-11-19 17:20:49.852Z", "description": "Deftones", "followers": 4, "name": "Bored", "tags": ["alternative metal", "alternative rock", "nu metal"]}
                               {"id": 8, "author": "dmustaine", "upload_timestamp": "2022-11-19 17:21:35.683Z", "description": "Megadeth", "followers": 5, "name": "Conquer Or Die", "tags": ["heavy metal", "thrash metal"]}
            {"id": 2, "author": "acunningham", "upload_timestamp": "2022-11-19 17:20:55.544Z", "description": "Deftones", "followers": 8, "name": "Birthmark", "tags": ["alternative metal", "alternative rock", "nu metal"]}
                         {"id": 4, "author": "jduplantier", "upload_timestamp": "2022-11-19 17:21:14.652Z", "description": "Gojira", "followers": 6, "name": "Born in Winter", "tags": ["groove metal", "progressive metal"]}
                      {"id": 7, "author": "dmustaine", "upload_timestamp": "2022-11-19 17:21:30.307Z", "description": "Megadeth", "followers": 3, "name": "Symphony of Destruction", "tags": ["heavy metal", "thrash metal"]}
                     {"id": 6, "author": "jhetfield", "upload_timestamp": "2022-11-19 17:21:25.630Z", "description": "Metallica", "followers": 5, "name": "For Whom The Bell Tolls", "tags": ["heavy metal", "thrash metal"]}
                             {"id": 9, "author": "dmustaine", "upload_timestamp": "2022-11-19 17:21:40.807Z", "description": "Megadeth", "followers": 9, "name": "Tornado Of Souls", "tags": ["heavy metal", "thrash metal"]}
 {"id": 3, "author": "cmoreno", "upload_timestamp": "2022-11-19 17:21:01.677Z", "description": "Deftones", "followers": 6, "name": "My Own Summer (Shove It)", "tags": ["alternative metal", "alternative rock", "nu metal"]}

(10 rows)
```
- **Events table**
```cassandra
cqlsh:cbd> SELECT JSON * FROM events;

 [json]
------------------------------------------------------------------------------------------------------------------------
   {"video_id": 1, "author": "scarpente", "event_timestamp": "2022-11-19 17:21:58.923Z", "moment": 30, "type": "PAUSE"}
    {"video_id": 1, "author": "scarpente", "event_timestamp": "2022-11-19 17:22:03.525Z", "moment": 30, "type": "PLAY"}
   {"video_id": 1, "author": "scarpente", "event_timestamp": "2022-11-19 17:22:10.006Z", "moment": 60, "type": "PAUSE"}
    {"video_id": 1, "author": "scarpente", "event_timestamp": "2022-11-19 17:22:14.393Z", "moment": 60, "type": "PLAY"}
   {"video_id": 1, "author": "scarpente", "event_timestamp": "2022-11-19 17:22:19.656Z", "moment": 300, "type": "STOP"}
    {"video_id": 1, "author": "scarpenter", "event_timestamp": "2022-11-19 17:21:54.007Z", "moment": 0, "type": "PLAY"}
   {"video_id": 2, "author": "acunningham", "event_timestamp": "2022-11-19 17:22:25.242Z", "moment": 0, "type": "PLAY"}
 {"video_id": 2, "author": "acunningham", "event_timestamp": "2022-11-19 17:22:30.307Z", "moment": 30, "type": "PAUSE"}
  {"video_id": 2, "author": "acunningham", "event_timestamp": "2022-11-19 17:22:35.423Z", "moment": 30, "type": "PLAY"}
 {"video_id": 2, "author": "acunningham", "event_timestamp": "2022-11-19 17:22:40.422Z", "moment": 60, "type": "PAUSE"}
  {"video_id": 2, "author": "acunningham", "event_timestamp": "2022-11-19 17:22:45.277Z", "moment": 60, "type": "PLAY"}
 {"video_id": 2, "author": "acunningham", "event_timestamp": "2022-11-19 17:22:50.123Z", "moment": 300, "type": "STOP"}

(12 rows)
```
- **Comments Table**
```cassandra
cqlsh:cbd> SELECT JSON * FROM comments;

 [json]
---------------------------------------------------------------------------------------------------------------------
          {"video_id": 5, "comment_timestamp": "2022-11-19 17:24:18.780Z", "author": "candreu", "comment": "Great!"}
          {"video_id": 5, "comment_timestamp": "2022-11-19 17:23:24.852Z", "author": "candreu", "comment": "Great!"}
  {"video_id": 10, "comment_timestamp": "2022-11-19 17:24:42.675Z", "author": "dmustaine", "comment": "Nice video!"}
  {"video_id": 10, "comment_timestamp": "2022-11-19 17:23:48.232Z", "author": "dmustaine", "comment": "Nice video!"}
 {"video_id": 1, "comment_timestamp": "2022-11-19 17:23:52.859Z", "author": "scarpenter", "comment": "Great video!"}
 {"video_id": 1, "comment_timestamp": "2022-11-19 17:23:05.756Z", "author": "scarpenter", "comment": "Great video!"}
         {"video_id": 8, "comment_timestamp": "2022-11-19 17:24:33.958Z", "author": "jmlabadie", "comment": "Cool!"}
         {"video_id": 8, "comment_timestamp": "2022-11-19 17:23:38.490Z", "author": "jmlabadie", "comment": "Cool!"}
    {"video_id": 2, "comment_timestamp": "2022-11-19 17:23:57.379Z", "author": "acunningham", "comment": "Awesome!"}
    {"video_id": 2, "comment_timestamp": "2022-11-19 17:23:10.457Z", "author": "acunningham", "comment": "Awesome!"}
          {"video_id": 4, "comment_timestamp": "2022-11-19 17:24:13.524Z", "author": "fdelgado", "comment": "Cool!"}
          {"video_id": 4, "comment_timestamp": "2022-11-19 17:23:19.929Z", "author": "fdelgado", "comment": "Cool!"}
      {"video_id": 7, "comment_timestamp": "2022-11-19 19:36:52.967Z", "author": "jhetfield", "comment": "Awesome!"}
      {"video_id": 7, "comment_timestamp": "2022-11-19 19:36:21.410Z", "author": "dmustaine", "comment": "Awesome!"}
    {"video_id": 7, "comment_timestamp": "2022-11-19 17:24:30.157Z", "author": "mduplantier", "comment": "Awesome!"}
    {"video_id": 7, "comment_timestamp": "2022-11-19 17:23:33.608Z", "author": "mduplantier", "comment": "Awesome!"}
 {"video_id": 6, "comment_timestamp": "2022-11-19 17:24:24.094Z", "author": "jduplantier", "comment": "Nice video!"}
 {"video_id": 6, "comment_timestamp": "2022-11-19 17:23:29.342Z", "author": "jduplantier", "comment": "Nice video!"}
        {"video_id": 9, "comment_timestamp": "2022-11-19 17:24:37.659Z", "author": "jhetfield", "comment": "Great!"}
        {"video_id": 9, "comment_timestamp": "2022-11-19 17:23:43.023Z", "author": "jhetfield", "comment": "Great!"}
           {"video_id": 3, "comment_timestamp": "2022-11-19 17:24:03.581Z", "author": "cmoreno", "comment": "Nice!"}
           {"video_id": 3, "comment_timestamp": "2022-11-19 17:23:15.144Z", "author": "cmoreno", "comment": "Nice!"}

(22 rows)
```
- **Ratings Table**
```cassandra
cqlsh:cbd> SELECT JSON * FROM ratings;

 [json]
-----------------------------------------------------------------------------------------------------------------
      {"id": 5, "video_id": 5, "author": "candreu", "rating": 1, "rating_timestamp": "2022-11-19 17:28:35.007Z"}
  {"id": 10, "video_id": 10, "author": "dmustaine", "rating": 1, "rating_timestamp": "2022-11-19 17:28:59.512Z"}
 {"id": 16, "video_id": 6, "author": "jduplantier", "rating": 5, "rating_timestamp": "2022-11-19 17:29:26.608Z"}
     {"id": 13, "video_id": 3, "author": "cmoreno", "rating": 3, "rating_timestamp": "2022-11-19 17:29:14.592Z"}
  {"id": 11, "video_id": 1, "author": "scarpenter", "rating": 5, "rating_timestamp": "2022-11-19 17:29:03.926Z"}
   {"id": 1, "video_id": 1, "author": "scarpenter", "rating": 5, "rating_timestamp": "2022-11-19 17:28:11.294Z"}
   {"id": 19, "video_id": 9, "author": "jhetfield", "rating": 2, "rating_timestamp": "2022-11-19 17:29:42.494Z"}
    {"id": 8, "video_id": 8, "author": "jmlabadie", "rating": 3, "rating_timestamp": "2022-11-19 17:28:47.899Z"}
  {"id": 2, "video_id": 2, "author": "acunningham", "rating": 4, "rating_timestamp": "2022-11-19 17:28:17.510Z"}
     {"id": 4, "video_id": 4, "author": "fdelgado", "rating": 2, "rating_timestamp": "2022-11-19 17:28:29.142Z"}
   {"id": 18, "video_id": 8, "author": "jmlabadie", "rating": 3, "rating_timestamp": "2022-11-19 17:29:38.278Z"}
     {"id": 15, "video_id": 5, "author": "candreu", "rating": 1, "rating_timestamp": "2022-11-19 17:29:22.659Z"}
  {"id": 20, "video_id": 10, "author": "dmustaine", "rating": 1, "rating_timestamp": "2022-11-19 17:29:52.180Z"}
  {"id": 7, "video_id": 7, "author": "mduplantier", "rating": 4, "rating_timestamp": "2022-11-19 17:28:43.609Z"}
  {"id": 6, "video_id": 6, "author": "jduplantier", "rating": 5, "rating_timestamp": "2022-11-19 17:28:39.594Z"}
    {"id": 9, "video_id": 9, "author": "jhetfield", "rating": 2, "rating_timestamp": "2022-11-19 17:28:54.709Z"}
    {"id": 14, "video_id": 4, "author": "fdelgado", "rating": 2, "rating_timestamp": "2022-11-19 17:29:18.842Z"}
 {"id": 17, "video_id": 7, "author": "mduplantier", "rating": 4, "rating_timestamp": "2022-11-19 17:29:30.792Z"}
 {"id": 12, "video_id": 2, "author": "acunningham", "rating": 4, "rating_timestamp": "2022-11-19 17:29:08.525Z"}
      {"id": 3, "video_id": 3, "author": "cmoreno", "rating": 3, "rating_timestamp": "2022-11-19 17:28:22.576Z"}

(20 rows)
```
- **Tags Table**
```cassandra
cqlsh:cbd> SELECT JSON * FROM tags;

 [json]
----------------------------------------------------------------------------------------------------------
  {"tag": "rock", "tag_timestamp": "2022-11-19 17:38:51.179Z", "videos": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]}
          {"tag": "heavy metal", "tag_timestamp": "2022-11-19 17:37:41.128Z", "videos": [6, 7, 8, 9, 10]}
 {"tag": "metal", "tag_timestamp": "2022-11-19 17:38:55.901Z", "videos": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]}
 {"tag": "music", "tag_timestamp": "2022-11-19 17:39:00.031Z", "videos": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]}
            {"tag": "alternative rock", "tag_timestamp": "2022-11-19 17:37:23.765Z", "videos": [1, 2, 3]}
                   {"tag": "groove metal", "tag_timestamp": "2022-11-19 17:37:32.369Z", "videos": [4, 5]}
           {"tag": "alternative metal", "tag_timestamp": "2022-11-19 17:37:19.166Z", "videos": [1, 2, 3]}
              {"tag": "progressive metal", "tag_timestamp": "2022-11-19 17:37:36.496Z", "videos": [4, 5]}
                    {"tag": "nu metal", "tag_timestamp": "2022-11-19 17:37:28.129Z", "videos": [1, 2, 3]}
         {"tag": "thrash metal", "tag_timestamp": "2022-11-19 17:37:49.134Z", "videos": [6, 7, 8, 9, 10]}

(10 rows)
```
- **Followers Table**
```cassandra
cqlsh:cbd> SELECT JSON * FROM followers;

 [json]
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                      {"video_id": 5, "follow_timestamp": "2022-11-20 15:29:49.001Z", "followers": ["candreu", "fdelgado", "jduplantier", "mduplantier"]}
 {"video_id": 10, "follow_timestamp": "2022-11-20 15:30:18.247Z", "followers": ["acunningham", "candreu", "dmustaine", "fdelgado", "jduplantier", "jhetfield", "jmlabadie", "mduplantier", "scarpenter"]}
                                                                       {"video_id": 1, "follow_timestamp": "2022-11-20 15:29:22.624Z", "followers": ["acunningham", "cmoreno", "fdelgado", "scarpenter"]}
                                                       {"video_id": 8, "follow_timestamp": "2022-11-20 15:30:05.178Z", "followers": ["dmustaine", "jhetfield", "jmlabadie", "mduplantier", "scarpenter"]}
              {"video_id": 2, "follow_timestamp": "2022-11-20 15:29:29.803Z", "followers": ["acunningham", "candreu", "dmustaine", "jduplantier", "jhetfield", "jmlabadie", "mduplantier", "scarpenter"]}
                                        {"video_id": 4, "follow_timestamp": "2022-11-20 15:29:43.476Z", "followers": ["acunningham", "dmustaine", "jhetfield", "jmlabadie", "mduplantier", "scarpenter"]}
                                                                                  {"video_id": 7, "follow_timestamp": "2022-11-20 15:29:59.669Z", "followers": ["acunningham", "candreu", "jduplantier"]}
                                                                      {"video_id": 6, "follow_timestamp": "2022-11-20 15:29:54.324Z", "followers": ["dmustaine", "jhetfield", "jmlabadie", "scarpenter"]}
   {"video_id": 9, "follow_timestamp": "2022-11-20 15:30:12.262Z", "followers": ["acunningham", "candreu", "cmoreno", "dmustaine", "jduplantier", "jhetfield", "jmlabadie", "mduplantier", "scarpenter"]}
                                          {"video_id": 3, "follow_timestamp": "2022-11-20 15:29:36.332Z", "followers": ["acunningham", "candreu", "dmustaine", "jduplantier", "jhetfield", "scarpenter"]}

(10 rows)
```

## Queries
- **Pesquisar todos os vídeos de um determinado autor**
```cassandra
cqlsh:cbd> SELECT * FROM videos WHERE author='dmustaine' ALLOW FILTERING;

 id | author    | upload_timestamp                | description | followers | name                    | tags
----+-----------+---------------------------------+-------------+-----------+-------------------------+---------------------------------
  8 | dmustaine | 2022-11-19 17:21:35.683000+0000 |    Megadeth |         5 |          Conquer Or Die | {'heavy metal', 'thrash metal'}
  7 | dmustaine | 2022-11-19 17:21:30.307000+0000 |    Megadeth |         3 | Symphony of Destruction | {'heavy metal', 'thrash metal'}
  9 | dmustaine | 2022-11-19 17:21:40.807000+0000 |    Megadeth |         9 |        Tornado Of Souls | {'heavy metal', 'thrash metal'}

(3 rows)
```

- **Pesquisar todos os comentários por utlizador, ordenados inversamente pela data**
```cassandra
cqlsh:cbd> SELECT * FROM comments WHERE author='jhetfield' ALLOW FILTERING;

 video_id | comment_timestamp               | author    | comment
----------+---------------------------------+-----------+---------
        9 | 2022-11-19 17:24:37.659000+0000 | jhetfield |  Great!
        9 | 2022-11-19 17:23:43.023000+0000 | jhetfield |  Great!

(2 rows)
```

- **Pesquisar todos os comentários de um determinado video, ordenados inversamente pela data**
```cassandra
cqlsh:cbd> SELECT * FROM comments WHERE video_id=9;


 video_id | comment_timestamp               | author    | comment
----------+---------------------------------+-----------+---------
        9 | 2022-11-19 17:24:37.659000+0000 | jhetfield |  Great!
        9 | 2022-11-19 17:23:43.023000+0000 | jhetfield |  Great!

(2 rows)
```

- **Pesquisar o rating médio de um vídeo e quantas vezes foi votado**
```cassandra
cqlsh:cbd> SELECT AVG(rating), COUNT(rating) FROM ratings WHERE video_id=3 ALLOW FILTERING;

 system.avg(rating) | system.count(rating)
--------------------+----------------------
                  3 |                    2

(1 rows)
```

- **Pesquisar os últimos 3 comentários introduzidos para um vídeo**
```cassandra
cqlsh:cbd> SELECT * FROM comments WHERE video_id=7 LIMIT 3;

 video_id | comment_timestamp               | author      | comment
----------+---------------------------------+-------------+----------
        7 | 2022-11-19 19:36:52.967000+0000 |   jhetfield | Awesome!
        7 | 2022-11-19 19:36:21.410000+0000 |   dmustaine | Awesome!
        7 | 2022-11-19 17:24:30.157000+0000 | mduplantier | Awesome!

(3 rows)
```

- **Pesquisar a lista das tags de um determinado vídeo**
```cassandra
cqlsh:cbd> SELECT tags FROM videos WHERE id=10;

 tags
---------------------------------
 {'heavy metal', 'thrash metal'}

(1 rows
```

- **Pesquisar todos os vídeos com a tag thrash metal**
```cassandra
cqlsh:cbd> SELECT * FROM tags WHERE tag='thrash metal';

 tag          | tag_timestamp                   | videos
--------------+---------------------------------+------------------
 thrash metal | 2022-11-19 17:37:49.134000+0000 | {6, 7, 8, 9, 10}

(1 rows)
```

- **Pesquisar os últimos 5 eventos de um determinado vídeo realizados por um utilizador**
```cassandra
cqlsh:cbd> SELECT * FROM events WHERE video_id=2 AND author='acunningham' LIMIT 5;

 video_id | author      | event_timestamp                 | moment | type
----------+-------------+---------------------------------+--------+-------
        2 | acunningham | 2022-11-19 17:22:25.242000+0000 |      0 |  PLAY
        2 | acunningham | 2022-11-19 17:22:30.307000+0000 |     30 | PAUSE
        2 | acunningham | 2022-11-19 17:22:35.423000+0000 |     30 |  PLAY
        2 | acunningham | 2022-11-19 17:22:40.422000+0000 |     60 | PAUSE
        2 | acunningham | 2022-11-19 17:22:45.277000+0000 |     60 |  PLAY

(5 rows)
```

- **Pesquisar os vídeos partilhados por determinado utilizador num determinado período de tempo**
_**Nota:** Não existe em Cassandra um operador LIKE como em SQL, o mais semelhante que existe é utilizar os operadores "<" e ">". A utilização dos operadores necessita da utilização de ALLOW FILTERING._ 
```cassandra
cqlsh:cbd> SELECT * FROM videos WHERE author='dmustaine' AND upload_timestamp > '2022-11-19 17:21:30.307000+0000' AND upload_timestamp < '2022-11-19 17:21:40.807000+0000' ALLOW FILTERING;


 id | author    | upload_timestamp                | description | followers | name           | tags
----+-----------+---------------------------------+-------------+-----------+----------------+---------------------------------
  8 | dmustaine | 2022-11-19 17:21:35.683000+0000 |    Megadeth |         5 | Conquer Or Die | {'heavy metal', 'thrash metal'}

(1 rows)
```

- **Pesquisar os últimos 10 vídeos, ordenados inversamente pela data de partilha**
_**Nota:** É impossível realizar esta query, para que os resultados aparecerem ordenados seria necessário especificar um autor desse vídeo._

- **Pesquisar todos seguidores (followers) de determinado vídeo**
```cassandra
cqlsh:cbd> SELECT followers FROM followers WHERE video_id=6;

 followers
-------------------------------------------------------
 {'dmustaine', 'jhetfield', 'jmlabadie', 'scarpenter'}

(1 rows)
```

- **Pesquisar todos comentários (dos vídeos) que determinado utilizador está a seguir (following)**
_**Nota:** Tentei correr este comando mas não consegui, acho que não é possível fazer este tipo de queries como em SQL, umas das maneiras era criar uma table comments followers, onde contem os dados que precisamos, assim era muito mais fácil ir buscar os dados._
```cassandra
cqlsh:cbd> SELECT * FROM comments WHERE video_id IN (SELECT video_id FROM followers WHERE followers CONTAINS 'jhetfield' ALLOW FILTERING) AND author='jhetfield' ALLOW FILTERING;
```

- **Pesquisar os 5 vídeos com maior rating**
_**Nota:** Não é possível realizar esta query, seria necessário incluir o rating como clustering key de forma a ordenar por rating e uma partition key._

- **Query que retorne todos os vídeos e que mostre claramente a forma pela qual estão ordenados**
_**Nota:** Não é possível realizar esta query._

- **Lista com as Tags existentes e o número de vídeos catalogados com cada uma delas**
_**Nota:** Não é possível realizar esta query, seria necessário ter uma coluna que contabilizasse o número de vídeos com a tag em causa, porque em cassandra não existe nenhum método nativo para fazer esta operação._

- **Pesquisar todos os vídeos que a sua descrição é deftones**
```cassandra
cqlsh:cbd> SELECT * FROM videos WHERE description='Deftones' ALLOW FILTERING;


 id | author      | upload_timestamp                | description | followers | name                     | tags
----+-------------+---------------------------------+-------------+-----------+--------------------------+-------------------------------------------------------
  1 |  scarpenter | 2022-11-19 17:20:49.852000+0000 |    Deftones |         4 |                    Bored | {'alternative metal', 'alternative rock', 'nu metal'}
  2 | acunningham | 2022-11-19 17:20:55.544000+0000 |    Deftones |         8 |                Birthmark | {'alternative metal', 'alternative rock', 'nu metal'}
  3 |     cmoreno | 2022-11-19 17:21:01.677000+0000 |    Deftones |         6 | My Own Summer (Shove It) | {'alternative metal', 'alternative rock', 'nu metal'}

(3 rows)
```

- **Pesquisar todos os vídeos que a sua descrição é deftones e que tenham a tag alternative metal**
```cassandra
cqlsh:cbd> SELECT * FROM videos WHERE description='Deftones' AND tags CONTAINS 'alternative metal' ALLOW FILTERING;

 id | author      | upload_timestamp                | description | followers | name                     | tags
----+-------------+---------------------------------+-------------+-----------+--------------------------+-------------------------------------------------------
  1 |  scarpenter | 2022-11-19 17:20:49.852000+0000 |    Deftones |         4 |                    Bored | {'alternative metal', 'alternative rock', 'nu metal'}
  2 | acunningham | 2022-11-19 17:20:55.544000+0000 |    Deftones |         8 |                Birthmark | {'alternative metal', 'alternative rock', 'nu metal'}
  3 |     cmoreno | 2022-11-19 17:21:01.677000+0000 |    Deftones |         6 | My Own Summer (Shove It) | {'alternative metal', 'alternative rock', 'nu metal'}

(3 rows)
```
