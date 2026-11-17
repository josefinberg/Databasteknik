
CREATE TABLE anime_list (
    anime_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    total_nr_episodes INTEGER

);

INSERT INTO anime_list (title, total_nr_episodes)
VALUES
('Jujutsu Kaisen', 47),
('Attack on Titan', 87),
('Death Note', 37),
('Demon Slayer', 63),
('Fullmetal Alchemist: Brotherhood', 64),
('Naruto', 220),
('Chainsaw Man', 12),
('Spy x Family', 37);

SELECT total_nr_episodes, title
FROM anime_list
WHERE title = 'Demon Slayer';

CREATE TABLE watch_list (
    watchlist_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    anime_id INTEGER REFERENCES anime_list(anime_id),
    episodes_watched INTEGER
);

INSERT INTO watch_list(anime_id, episodes_watched)
VALUES
(1,24),
(2,87),
(3,37),
(4,63),
(7,12);

CREATE TABLE genre (
    genre_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL
);

INSERT INTO genre (genre_name)
VALUES
('Action'),
('Adventure'),
('Fantasy'),
('Drama'),
('Thriller'),
('Comedy'),
('Supernatural');

CREATE TABLE anime_genre (
    anime_id INTEGER REFERENCES anime_list(anime_id),
    genre_id INTEGER REFERENCES genre(genre_id),
    PRIMARY KEY (anime_id, genre_id)
);
INSERT INTO anime_genre (anime_id, genre_id)
VALUES
(1, 1),
(1, 3),
(1, 7),

(2, 1),
(2, 2),
(2, 4),

(3, 4),
(3, 5),

(4, 1),
(4, 3),
(4, 7),

(5, 1),
(5, 2),
(5, 3),

(6, 1),
(6, 2),

(7, 1),
(7, 7),

(8, 2),
(8, 6);

SELECT anime_list.title, genre.genre_name
FROM anime_list
INNER JOIN anime_genre
ON anime_list.anime_id = anime_genre.anime_id
INNER JOIN genre
ON anime_genre.genre_id = genre.genre_id;

SELECT anime_list.title, watch_list.episodes_watched
FROM anime_list
INNER JOIN watch_list
ON anime_list.anime_id = watch_list.anime_id;

UPDATE anime_list SET total_nr_episodes = total_nr_episodes + 12
WHERE anime_list.title = 'Demon Slayer';


SELECT *
FROM watch_list
WHERE anime_id = (SELECT anime_id FROM anime_list WHERE title = 'Jujutsu Kaisen');

DELETE FROM watch_list
WHERE anime_id = (SELECT anime_id FROM anime_list WHERE title = 'Jujutsu Kaisen');


INSERT INTO watch_list (anime_id, episodes_watched)
VALUES (99,5);

DELETE FROM anime_list
WHERE anime_list.title = 'Jujutsu Kaisen';

DELETE FROM genre
WHERE genre_name = 'Action';

DELETE FROM watch_list
WHERE  anime_id = 1;

SELECT FROM watch_list
WHERE anime_id = 1;

DELETE FROM anime_genre
WHERE anime_id = 1; 

SELECT  FROM anime_genre
WHERE anime_id = 1;

DELETE FROM anime_list
WHERE anime_list.title = 'Jujutsu Kaisen';

SELECT *
FROM anime_list
WHERE anime_list.title = 'Jujutsu Kaisen';
