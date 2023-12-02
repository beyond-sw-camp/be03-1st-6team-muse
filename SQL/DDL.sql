create database muse;
use muse;
CREATE TABLE members(
  members_id bigint PRIMARY KEY AUTO_INCREMENT,
  email varchar(100) UNIQUE NOT NULL,
  password varchar(255) NOT NULL,
  name varchar(200) NOT NULL,
  nickname varchar(200) NOT NULL,
  gender ENUM ('M', 'F'),
  phone_number varchar(50) UNIQUE NOT NULL,
  birth_date datetime NOT NULL,
  created_at datetime DEFAULT now(),
  updated_at datetime DEFAULT now(),
  deleted_at datetime,
  deleted_YN tinyint(1) DEFAULT 0
);

CREATE TABLE playlist(
  playlist_id bigint PRIMARY KEY AUTO_INCREMENT,
  playlist_name varchar(100) NOT NULL,
  on_off tinyint(1) DEFAULT 1,
  created_at datetime DEFAULT now(),
  updated_at datetime DEFAULT now(),
  deleted_at datetime,
  deleted_YN tinyint(1) DEFAULT 0,
  members_id bigint NOT NULL,
  FOREIGN KEY (members_id) REFERENCES members (members_id)
);

CREATE TABLE music(
  music_id bigint PRIMARY KEY AUTO_INCREMENT,
  title varchar(100) NOT NULL,
  artist varchar(200) NOT NULL,
  description varchar(3000),
  music_file_url varchar(255) NOT NULL,
  genre ENUM ('Kpop', 'Jpop', 'OST', 'Pop', 'Classic', 'Jazz', 'Indie', 'Canadian_blues',
  'Contemporary_RnB', 'Punk_blues', 'Crossover_music', 'Instrumental', 'Lofi', 'Blues_rock',
  'Chicago_blues', 'Delta_blues', 'EDM', 'Country_pop', 'Country_rap', 'Country_rock', 'Instrumental_country',
  'Western', 'New_age', 'Darkcore', 'Disco', 'City_pop', 'Dance_pop', 'Electronic_rock', 'Dance_rock',
  'Alternative_dance', 'Madchester', 'Baggy', 'New_rave', 'New_romantic', 'Electropop',
  'Electronica', 'Folktronica', 'Acid_jazz','Jungle', 'Hipster_hop', 'Cloud_rap', 'Acid_house',
  'Chicago_house', 'Futurepop', 'Dubstep'),
  on_off tinyint(1),
  created_at datetime DEFAULT now(),
  updated_at datetime DEFAULT now(),
  deleted_at datetime,
  deleted_YN tinyint(1) DEFAULT 0,
  members_id bigint NOT NULL,
  FOREIGN KEY(members_id) REFERENCES members(members_id) on delete cascade
);

CREATE TABLE follow(
  follow_id bigint PRIMARY KEY AUTO_INCREMENT,
  created_at datetime DEFAULT now(),
  unfollow_at datetime,
  unfollow_YN tinyint(1) DEFAULT 0,
  follow_ing bigint,
  follower bigint,
  FOREIGN KEY (follow_ing) REFERENCES members (members_id),
  FOREIGN KEY (follower) REFERENCES members (members_id)
);

CREATE TABLE likes(
  likes_id bigint PRIMARY KEY AUTO_INCREMENT,
  created_at datetime DEFAULT now(),
  canceled_at datetime,
  canceled_YN tinyint(1) DEFAULT 0,
  who_id bigint,
  members_id bigint,
  playlist_id bigint,
  music_id bigint,
  FOREIGN KEY (who_id) REFERENCES members (members_id) on delete cascade,
  FOREIGN KEY (playlist_id) REFERENCES playlist (playlist_id) on delete cascade,
  FOREIGN KEY (members_id) REFERENCES members (members_id) on delete cascade,
  FOREIGN KEY (music_id) REFERENCES music (music_id) on delete cascade
);

CREATE TABLE playlist_music(
  pm_id bigint PRIMARY KEY AUTO_INCREMENT,
  created_at datetime DEFAULT now(),
  updated_at datetime DEFAULT now(),
  deleted_at datetime,
  deleted_YN tinyint(1) DEFAULT 0,
  playlist_id bigint NOT NULL,
  music_id bigint NOT NULL,
  FOREIGN KEY (playlist_id) REFERENCES playlist (playlist_id) on delete cascade ,
  FOREIGN KEY (music_id) REFERENCES music (music_id) on delete cascade
);

CREATE TABLE image(
  image_id bigint PRIMARY KEY AUTO_INCREMENT,
  image_url varchar(255),
  members_id bigint,
  music_id bigint,
  playlist_id bigint
  FOREIGN KEY (playlist_id) REFERENCES playlist (playlist_id) on delete cascade,
  FOREIGN KEY (members_id) REFERENCES members (members_id) on delete cascade,
  FOREIGN KEY (music_id) REFERENCES music (music_id) on delete cascade
);

CREATE TABLE comment(
  comment_id bigint PRIMARY KEY AUTO_INCREMENT,
  comment_chk tinyint(1),
  contents varchar(300),
  created_at datetime DEFAULT now(),
  updated_at datetime,
  deleted_at datetime,
  members_id bigint,
  music_id bigint,
  FOREIGN KEY (music_id) REFERENCES music (music_id) on delete cascade,
  FOREIGN KEY (members_id) REFERENCES members (members_id) on delete cascade
);