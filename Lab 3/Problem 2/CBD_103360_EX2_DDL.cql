-- Create if exists cbd_103360_ex2 keyspace and use it
CREATE KEYSPACE IF NOT EXISTS cbd_103360_ex2 WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };
USE cbd_103360_ex2;

-- Users table
CREATE TABLE users (
    username text,
    name text,
    email text,
    register_timestamp timestamp,
    PRIMARY KEY (username)
    );

-- Videos table
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

-- Events table
CREATE TABLE events (
    video_id int,
    author text,
    type text,
    event_timestamp timestamp,
    moment int,
    PRIMARY KEY (video_id, author, event_timestamp, moment)
    );

-- Comments table
CREATE TABLE comments (
    author text,
    video_id int,
    comment text,
    comment_timestamp timestamp,
    PRIMARY KEY (video_id, comment_timestamp)) 
    WITH CLUSTERING ORDER BY (comment_timestamp DESC)
    ;

-- Ratings table
CREATE TABLE ratings (
    id int,
    video_id int,
    author text,
    rating int,
    rating_timestamp timestamp,
    PRIMARY KEY (id, video_id)
    );

-- Tags table
CREATE TABLE tags (
    tag text,
    videos set<int>,
    tag_timestamp timestamp,
    PRIMARY KEY (tag)
    );

-- Followers table
CREATE TABLE followers (
    video_id int,
    followers set<text>,
    follow_timestamp timestamp,
    PRIMARY KEY (video_id)
    );
