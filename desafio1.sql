DROP SCHEMA IF EXISTS SpotifyClone;

CREATE SCHEMA SpotifyClone;

CREATE TABLE SpotifyClone.plans(
  id INT PRIMARY KEY AUTO_INCREMENT,
  plan_name VARCHAR(45) NOT NULL,
  price INT NOT NULL
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.artists (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.albums (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  release_year INT NULL,
  artist_id INT NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists (id)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.songs (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  duration INT NOT NULL,
  album_id INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES SpotifyClone.albums (id)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(45) NULL,
  age INT NOT NULL,
  sign_up_date DATE NOT NULL,
  plan_id INT NOT NULL,
  FOREIGN KEY (plan_id) REFERENCES SpotifyClone.plans (id)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.artists_users (
  user_id INT NOT NULL,
  artist_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES SpotifyClone.users (id),
  FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists (id),
  PRIMARY KEY (user_id, artist_id)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.user_history (
  date_time DATETIME NOT NULL,
  song_id INT NOT NULL,
  user_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES SpotifyClone.users (id),
  FOREIGN KEY (song_id) REFERENCES SpotifyClone.songs (id),
  PRIMARY KEY (date_time, song_id, user_id)
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.plans (plan_name, price)
VALUES
  ('gratuito', 0),
  ('universitário', 599),
  ('pessoal', 699),
  ('familiar', 799);

INSERT INTO SpotifyClone.artists (name)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon'),
  ('Tyler Isle'),
  ('Fog');

INSERT INTO SpotifyClone.albums (name, release_year, artist_id)
VALUES
  ('Envious', 1990, 1),
  ('Exuberant', 1993, 1),
  ('Hallowed Steam', 1995, 2),
  ('Incandescent', 1998, 3),
  ('Temporary Culture', 2001, 4),
  ('Library of liberty', 2003, 4),
  ('Chained Down', 2007, 5),
  ('Cabinet of fools', 2012, 5),
  ('No guarantees', 2015, 5),
  ('Apparatus', 2015, 6);

INSERT INTO SpotifyClone.songs (name, duration, album_id)
VALUES
  ("Soul For Us", 200, 1),
  ("Reflections Of Magic", 163, 1),
  ("Dance With Her Own", 116, 1),
  ("Troubles Of My Inner Fire", 203, 2),
  ("Time Fireworks", 152, 2),
  ("Magic Circus", 105, 3),
  ("Honey, So Do I", 207, 3),
  ("Sweetie, Let's Go Wild", 139, 3),
  ("She Knows", 244, 3),
  ("Fantasy For Me", 100, 4),
  ("Celebration Of More", 146, 4),
  ("Rock His Everything", 223, 4),
  ("Home Forever", 231, 4),
  ("Diamond Power", 241, 4),
  ("Let's Be Silly", 132, 4),
  ("Thang Of Thunder", 240, 5),
  ("Words Of Her Life", 185, 5),
  ("Without My Streets", 176, 5),
  ("Need Of The Evening", 190, 6),
  ("History Of My Roses", 222, 6),
  ("Without My Love", 111, 6),
  ("Walking And Game", 123, 6),
  ("Young And Father", 197, 6),
  ("Finding My Traditions", 179, 7),
  ("Walking And Man", 229, 7),
  ("Hard And Time", 135, 7),
  ("Honey, I'm A Lone Wolf", 150, 7),
  ("She Thinks I Won't Stay Toninght", 166, 8),
  ("He Heard You're Bad For Me", 154, 8),
  ("He Hopes We Can't Stay", 210, 8),
  ("I Know I Know", 117, 8),
  ("He's Walking Away", 159, 9),
  ("He's Troube", 138, 9),
  ("I Heard I Want To Bo Alone", 120, 9),
  ("I Ride Alone", 151, 9),
  ("Honey", 79, 10),
  ("You Cheated On Me", 95, 10),
  ("Wouldn't It Be Nice", 213, 10),
  ("Baby", 136, 10),
  ("You Make Me Feel So..", 83, 10);

INSERT INTO SpotifyClone.users (name, age, sign_up_date, plan_id)
VALUES
  ('Thati', 23, "2019-10-20", 1), 
  ('Cintia', 35, "2017-12-30", 4), 
  ('Bill', 20, "2019-06-05", 2), 
  ('Roger', 45, "2020-05-13", 3),
  ('Norman', 58, "2017-02-17", 3),
  ('Patrick', 33, "2017-01-06", 4),
  ('Vivian', 26, "2018-01-05", 2),
  ('Carol', 19, "2018-02-14", 2),
  ('Angelina', 42, "2018-04-29", 4),
  ('Paul', 46, "2017-01-17", 4);

INSERT INTO SpotifyClone.artists_users (user_id, artist_id)
VALUES
  (1, 1),
  (1, 3),
  (1, 4),
  (2, 1),
  (2, 3),
  (3, 1),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 1),
  (6, 3),
  (6, 6),
  (7, 2),
  (7, 5),
  (8, 1),
  (8, 5),
  (9, 3),
  (9, 4),
  (9, 6),
  (10, 2),
  (10, 6);

INSERT INTO SpotifyClone.user_history (date_time, user_id, song_id)
VALUES
  ("2017-01-24 00:31:17", 6, 29),
  ("2017-02-06 08:21:34", 10, 20),
  ("2017-02-24 21:14:22", 5, 12),
  ("2017-07-27 05:24:49", 10, 12),
  ("2017-10-12 12:35:20", 6, 30),
  ("2017-12-04 05:33:43", 10, 21),
  ("2017-12-25 01:03:57", 10, 13),
  ("2018-01-16 18:40:43", 7, 11),
  ("2018-03-21 16:56:40", 8, 39),
  ("2018-05-09 22:30:49", 7, 5),
  ("2018-05-29 14:56:41", 6, 22),
  ("2018-12-07 22:48:52", 9, 17),
  ("2019-02-07 20:33:48", 6, 38),
  ("2019-05-25 08:14:03", 8, 32),
  ("2020-01-02 07:40:33", 2, 34),
  ("2020-02-28 10:45:55", 1, 36),
  ("2020-03-06 11:22:33", 1, 23),
  ("2020-04-01 03:36:00", 9, 9),
  ("2020-05-02 05:30:35", 1, 25),
  ("2020-05-16 06:16:22", 2, 24),
  ("2020-07-03 19:33:28", 5, 7),
  ("2020-07-27 12:52:58", 7, 4),
  ("2020-07-30 10:00:00", 3, 26),
  ("2020-08-05 08:05:17", 1, 14),
  ("2020-08-06 15:23:43", 5, 14),
  ("2020-09-14 16:32:22", 1, 15),
  ("2020-09-21 13:14:46", 2, 39),
  ("2020-10-09 12:27:48", 2, 21),
  ("2020-10-18 13:38:05", 8, 40),
  ("2020-11-10 13:52:27", 5, 1),
  ("2020-11-13 16:55:13", 3, 6),
  ("2020-12-05 18:38:30", 3, 3),
  ("2021-01-09 01:44:33", 4, 27),
  ("2021-03-14 06:14:26", 9, 8),
  ("2021-05-24 17:23:45", 9, 16),
  ("2021-07-10 15:20:30", 4, 35),
  ("2021-08-15 17:10:10", 4, 2),
  ("2021-08-15 21:37:09", 8, 33);
