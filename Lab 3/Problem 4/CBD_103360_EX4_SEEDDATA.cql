-- Sistema de gestão de venda de albuns musicais

-- Create if exists cbd_103360_ex4 keyspace and use it
CREATE KEYSPACE IF NOT EXISTS cbd_103360_ex4 WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };
USE cbd_103360_ex4;

-- Users table
INSERT INTO users (username, name, email, register_timestamp)
VALUES ('francis', 'Francis Ngannou', 'francis@email.com', toTimestamp(now()));

INSERT INTO users (username, name, email, register_timestamp)
VALUES ('jon', 'Jon Jones', 'jon@email.com', toTimestamp(now()));

INSERT INTO users (username, name, email, register_timestamp)
VALUES ('khabib', 'Khabib Nurmagomedov', 'khabib@email.com', toTimestamp(now()));

INSERT INTO users (username, name, email, register_timestamp)
VALUES ('tyson', 'Tyson Fury', 'tyson@email.com', toTimestamp(now()));

INSERT INTO users (username, name, email, register_timestamp)
VALUES ('stipe', 'Stipe Miocic', 'stipe@email.com', toTimestamp(now()));

INSERT INTO users (username, name, email, register_timestamp)
VALUES ('mike', 'Mike Tyson', 'mike@email.com', toTimestamp(now()));

INSERT INTO users (username, name, email, register_timestamp)
VALUES ('conor', 'Conor McGregor', 'conor@email.com', toTimestamp(now()));

INSERT INTO users (username, name, email, register_timestamp)
VALUES ('ali', 'Muhammad Ali', 'ali@email.com', toTimestamp(now()));

-- Albums table
INSERT INTO albums (name, band, release_date, genres, price)
VALUES ('Kill Em All', 'Metallica', '1983-07-25', {'heavy metal', 'thrash metal'}, 19.99);

INSERT INTO albums (name, band, release_date, genres, price)
VALUES ('Master of Puppets', 'Metallica', '1986-03-03', {'heavy metal', 'thrash metal'}, 24.99);

INSERT INTO albums (name, band, release_date, genres, price)
VALUES ('Ride the Lightning', 'Metallica', '1984-07-27', {'heavy metal', 'thrash metal'}, 30.00);

INSERT INTO albums (name, band, release_date, genres, price)
VALUES ('Killing Is My Business...And Business Is Good!', 'Megadeth', '1985-06-12', {'heavy metal', 'thrash metal'}, 24.99);

INSERT INTO albums (name, band, release_date, genres, price)
VALUES ('Peace Sells...But Whos Buying?', 'Megadeth', '1986-09-03', {'heavy metal', 'thrash metal'}, 19.99);

INSERT INTO albums (name, band, release_date, genres, price)
VALUES ('Rust in Peace', 'Megadeth', '1990-09-24', {'heavy metal', 'thrash metal'}, 29.99);

INSERT INTO albums (name, band, release_date, genres, price)
VALUES ('The Number of the Beast', 'Iron Maiden', '1982-03-22', {'heavy metal', 'power metal'}, 19.99);

INSERT INTO albums (name, band, release_date, genres, price)
VALUES ('Fear of the Dark', 'Iron Maiden', '1992-08-28', {'heavy metal', 'power metal'}, 24.99);

INSERT INTO albums (name, band, release_date, genres, price)
VALUES ('Comboys from Hell', 'Pantera', '1990-09-11', {'heavy metal', 'groove metal'}, 19.99);

INSERT INTO albums (name, band, release_date, genres, price)
VALUES ('Vulgar Display of Power', 'Pantera', '1992-11-24', {'heavy metal', 'groove metal'}, 24.99);

INSERT INTO albums (name, band, release_date, genres, price)
VALUES ('The Way of the Fist', 'Five Finger Death Punch', '2007-10-09', {'heavy metal', 'groove metal'}, 19.99);

INSERT INTO albums (name, band, release_date, genres, price)
VALUES ('War Is the Answer', 'Five Finger Death Punch', '2013-09-11', {'heavy metal', 'groove metal'}, 24.99);

INSERT INTO albums (name, band, release_date, genres, price)
VALUES ('Black Sabbath', 'Black Sabbath', '1970-02-13', {'heavy metal', 'doom metal'}, 19.99);

INSERT INTO albums (name, band, release_date, genres, price)
VALUES ('Paranoid', 'Black Sabbath', '1970-09-21', {'heavy metal', 'doom metal'}, 24.99);

INSERT INTO albums (name, band, release_date, genres, price)
VALUES ('Master of Reality', 'Black Sabbath', '1971-06-04', {'heavy metal', 'doom metal'}, 29.99);

INSERT INTO albums (name, band, release_date, genres, price)
VALUES ('Sabbath Bloody Sabbath', 'Black Sabbath', '1973-02-13', {'heavy metal', 'doom metal'}, 19.99);

INSERT INTO albums (name, band, release_date, genres, price)
VALUES ('Sabotage', 'Black Sabbath', '1975-02-13', {'heavy metal', 'doom metal'}, 24.99);

-- Sales table
INSERT INTO sales (sale_id, albums, client, album_price, total_price, sale_timestamp)
VALUES (1, {'Kill Em All', 'Master of Puppets', 'Ride the Lightning'}, 'francis', {'Kill Em All': 19.99, 'Master of Puppets': 24.99, 'Ride the Lightning': 30}, 74.98, toTimestamp(now()));

INSERT INTO sales (sale_id, albums, client, album_price, total_price, sale_timestamp)
VALUES (2, {'Killing Is My Business...And Business Is Good!', 'Peace Sells...But Whos Buying?', 'Rust in Peace'}, 'jon', {'Killing Is My Business...And Business Is Good!': 24.99, 'Peace Sells...But Whos Buying?': 19.99, 'Rust in Peace': 29.99}, 74.97, toTimestamp(now()));

INSERT INTO sales (sale_id, albums, client, album_price, total_price, sale_timestamp)
VALUES (3, {'The Number of the Beast', 'Fear of the Dark'}, 'khabib', {'The Number of the Beast': 19.99, 'Fear of the Dark': 24.99}, 44.98, toTimestamp(now()));

INSERT INTO sales (sale_id, albums, client, album_price, total_price, sale_timestamp)
VALUES (4, {'Comboys from Hell', 'Vulgar Display of Power'}, 'tyson', {'Comboys from Hell': 19.99, 'Vulgar Display of Power': 24.99}, 44.98, toTimestamp(now()));

INSERT INTO sales (sale_id, albums, client, album_price, total_price, sale_timestamp)
VALUES (5, {'The Way of the Fist', 'War Is the Answer'}, 'stipe', {'The Way of the Fist': 19.99, 'War Is the Answer': 24.99}, 44.98, toTimestamp(now()));

INSERT INTO sales (sale_id, albums, client, album_price, total_price, sale_timestamp)
VALUES (6, {'Black Sabbath', 'Paranoid', 'Master of Reality', 'Sabbath Bloody Sabbath', 'Sabotage'}, 'conor', {'Black Sabbath': 19.99, 'Paranoid': 24.99, 'Master of Reality': 29.99, 'Sabbath Bloody Sabbath': 19.99, 'Sabotage': 24.99}, 118.96, toTimestamp(now()));

-- Bands table
INSERT INTO bands (name, members, foundation_date, genres, albums)
VALUES ('Metallica', {'James Hetfield', 'Kirk Hammett', 'Lars Ulrich', 'Robert Trujillo'}, '1981-10-28', {'heavy metal', 'thrash metal'}, {'Kill Em All', 'Master of Puppets', 'Ride the Lightning'});

INSERT INTO bands (name, members, foundation_date, genres, albums)
VALUES ('Megadeth', {'Dave Mustaine', 'Kiko Loureiro', 'David Ellefson', 'Dirk Verbeuren'}, '1983-09-04', {'heavy metal', 'thrash metal'}, {'Killing Is My Business...And Business Is Good!', 'Peace Sells...But Whos Buying?', 'Rust in Peace'});

INSERT INTO bands (name, members, foundation_date, genres, albums)
VALUES ('Iron Maiden', {'Bruce Dickinson', 'Dave Murray', 'Adrian Smith', 'Steve Harris', 'Nicko McBrain'}, '1975-12-25', {'heavy metal', 'power metal'}, {'The Number of the Beast', 'Fear of the Dark'});

INSERT INTO bands (name, members, foundation_date, genres, albums)
VALUES ('Pantera', {'Philip Anselmo', 'Dimebag Darrell', 'Vinnie Paul', 'Rex Brown'}, '1981-09-25', {'heavy metal', 'groove metal'}, {'Comboys from Hell', 'Vulgar Display of Power'});

INSERT INTO bands (name, members, foundation_date, genres, albums)
VALUES ('Five Finger Death Punch', {'Zoltan Bathory', 'Jason Hook', 'Jeremy Spencer', 'Chris Kael', 'Ivan Moody'}, '2005-10-05', {'heavy metal', 'groove metal'}, {'The Way of the Fist', 'War Is the Answer'});

INSERT INTO bands (name, members, foundation_date, genres, albums)
VALUES ('Black Sabbath', {'Ozzy Osbourne', 'Tony Iommi', 'Geezer Butler', 'Bill Ward'}, '1968-02-13', {'heavy metal', 'doom metal'}, {'Black Sabbath', 'Paranoid', 'Master of Reality', 'Sabbath Bloody Sabbath', 'Sabotage'});

-- Reviews table
INSERT INTO reviews (album, author, review, rating, review_timestamp)
VALUES ('Kill Em All', 'francis', 'This is a great album', 5, toTimestamp(now()));

INSERT INTO reviews (album, author, review, rating, review_timestamp)
VALUES ('Kill Em All', 'francis', 'Fuck yeah', 5, toTimestamp(now()));

INSERT INTO reviews (album, author, review, rating, review_timestamp)
VALUES ('Master of Puppets', 'francis', 'This is a great album', 5, toTimestamp(now()));

INSERT INTO reviews (album, author, review, rating, review_timestamp)
VALUES ('Ride the Lightning', 'francis', 'This is a good album', 4, toTimestamp(now()));

INSERT INTO reviews (album, author, review, rating, review_timestamp)
VALUES ('Killing Is My Business...And Business Is Good!', 'jon', 'This is a great album', 5, toTimestamp(now()));

INSERT INTO reviews (album, author, review, rating, review_timestamp)
VALUES ('Peace Sells...But Whos Buying?', 'jon', 'This is a great album', 5, toTimestamp(now()));

INSERT INTO reviews (album, author, review, rating, review_timestamp)
VALUES ('Rust in Peace', 'jon', 'This is a great album', 5, toTimestamp(now()));

INSERT INTO reviews (album, author, review, rating, review_timestamp)
VALUES ('The Number of the Beast', 'khabib', 'Good music', 3, toTimestamp(now()));

INSERT INTO reviews (album, author, review, rating, review_timestamp)
VALUES ('Fear of the Dark', 'khabib', 'Not my style because I have no fear', 2, toTimestamp(now()));

INSERT INTO reviews (album, author, review, rating, review_timestamp)
VALUES ('Comboys from Hell', 'tyson', 'Fat comboy from hell aka me ahahhaha', 4, toTimestamp(now()));
