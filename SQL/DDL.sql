create database muse;
use muse;

-- 회원 정보 테이블
CREATE TABLE members(
  members_id bigint PRIMARY KEY AUTO_INCREMENT,
  email varchar(100) UNIQUE NOT NULL, -- 이메일: 회원가입시 아이디로 사용
  password varchar(255) NOT NULL, -- 비밀번호
  name varchar(200) NOT NULL, -- 실명
  nickname varchar(200) NOT NULL, -- 닉네임 
  gender ENUM ('M', 'F'), -- 성별
  phone_number varchar(50) UNIQUE NOT NULL, -- 전화번호
  birth_date datetime NOT NULL, -- 생일
  created_at datetime DEFAULT now(), -- 회원가입 날짜
  updated_at datetime DEFAULT now(), -- 정보수정날짜
  deleted_at datetime, -- 정보삭제날짜
  deleted_YN tinyint(1) DEFAULT 0 -- 정보삭제여부 1: 삭제, 0: 미삭제
);

-- 플레이리스트 테이블
CREATE TABLE playlist(
  playlist_id bigint PRIMARY KEY AUTO_INCREMENT,           
  playlist_name varchar(100) NOT NULL, -- 플레이리스트 이름
  on_off tinyint(1) DEFAULT 1, -- 플레이리스트 공개/비공개 1: 공개 , 0: 미삭제 
  created_at datetime DEFAULT now(), -- 플레이리스트 생성날짜
  updated_at datetime DEFAULT now(), -- 정보수정날짜
  deleted_at datetime, -- 정보삭제날짜
  deleted_YN tinyint(1) DEFAULT 0, -- 정보삭제여부 1: 삭제, 0: 미삭제
  members_id bigint NOT NULL, -- 회원정보테이블 fk
  FOREIGN KEY (members_id) REFERENCES members (members_id)
);

-- 노래 테이블
CREATE TABLE music(
  music_id bigint PRIMARY KEY AUTO_INCREMENT,
  title varchar(100) NOT NULL, -- 노래제목
  artist varchar(200) NOT NULL, -- 아티스트명
  description varchar(3000), -- 설명 or 노래가사
  music_file_url varchar(255) NOT NULL, --노래 파일 url
  genre ENUM -- 노래 장르
  ('Kpop', 'Jpop', 'OST', 'Pop', 'Classic', 'Jazz', 'Indie', 'Canadian_blues', 
  'Contemporary_RnB', 'Punk_blues', 'Crossover_music', 'Instrumental', 'Lofi', 'Blues_rock',
  'Chicago_blues', 'Delta_blues', 'EDM', 'Country_pop', 'Country_rap', 'Country_rock', 'Instrumental_country',
  'Western', 'New_age', 'Darkcore', 'Disco', 'City_pop', 'Dance_pop', 'Electronic_rock', 'Dance_rock',
  'Alternative_dance', 'Madchester', 'Baggy', 'New_rave', 'New_romantic', 'Electropop',
  'Electronica', 'Folktronica', 'Acid_jazz','Jungle', 'Hipster_hop', 'Cloud_rap', 'Acid_house',
  'Chicago_house', 'Futurepop', 'Dubstep'),
  on_off tinyint(1), -- 노래 공개/비공개 1: 공개 , 0: 미삭제 
  created_at datetime DEFAULT now(), -- 노래업로드 날짜
  updated_at datetime DEFAULT now(), -- 정보수정날짜
  deleted_at datetime, -- 노래삭제날짜
  deleted_YN tinyint(1) DEFAULT 0, -- 노래삭제여부 1: 삭제, 0: 미삭제
  members_id bigint NOT NULL, -- 회원정보테이블 fk
  FOREIGN KEY(members_id) REFERENCES members(members_id) on delete cascade
);

-- 회원 팔로우 테이블
CREATE TABLE follow(
  follow_id bigint PRIMARY KEY AUTO_INCREMENT,
  created_at datetime DEFAULT now(), -- 팔로우날짜
  unfollow_at datetime, -- 언팔로우날짜
  unfollow_YN tinyint(1) DEFAULT 0, -- 언팔로우 여부 1: 언팔, 0: 팔로우
  follow_ing bigint, -- 회원이 팔로우하고 있는 사람들 fk
  follower bigint, -- 회원을 팔로우하고있는 사람들 fk
  FOREIGN KEY (follow_ing) REFERENCES members (members_id),
  FOREIGN KEY (follower) REFERENCES members (members_id)
);

-- 회원, 노래, 플레이리스트 좋아요 테이블
CREATE TABLE likes(
  likes_id bigint PRIMARY KEY AUTO_INCREMENT,
  created_at datetime DEFAULT now(), -- 좋아요 생성날짜
  canceled_at datetime, -- 좋아요 취소날짜
  canceled_YN tinyint(1) DEFAULT 0, -- 좋아요 취소 여부 1: 취소, 0: 좋아요 유지
  who_id bigint, -- 좋아요를 누른사람
  members_id bigint, -- 회원 정보 fk
  playlist_id bigint, -- 플레이리스트 정보 fk
  music_id bigint, -- 노래 정보 fk
  FOREIGN KEY (who_id) REFERENCES members (members_id) on delete cascade,
  FOREIGN KEY (playlist_id) REFERENCES playlist (playlist_id) on delete cascade,
  FOREIGN KEY (members_id) REFERENCES members (members_id) on delete cascade,
  FOREIGN KEY (music_id) REFERENCES music (music_id) on delete cascade
);

-- 플레이리스트안에 있는 노래 정보 테이블
CREATE TABLE playlist_music(
  pm_id bigint PRIMARY KEY AUTO_INCREMENT,
  created_at datetime DEFAULT now(), -- 생성날짜
  updated_at datetime DEFAULT now(), -- 수정날짜
  deleted_at datetime, -- 삭제날짜
  deleted_YN tinyint(1) DEFAULT 0, -- 삭제여부 1: 삭제, 0: 미삭제
  playlist_id bigint NOT NULL, -- 플레이리스트 정보 fk
  music_id bigint NOT NULL, -- 노래 정보 fk
  FOREIGN KEY (playlist_id) REFERENCES playlist (playlist_id) on delete cascade ,
  FOREIGN KEY (music_id) REFERENCES music (music_id) on delete cascade
);

-- 회원프로필사진, 노래앨범사진, 플레이리스트 커버사진 테이블
CREATE TABLE image(
  image_id bigint PRIMARY KEY AUTO_INCREMENT,
  image_url varchar(255), -- 이미지 파일 url
  created_at datetime DEFAULT now(), -- 생성날짜
  updated_at datetime DEFAULT now(), -- 수정날짜
  deleted_at datetime, -- 삭제날짜
  deleted_YN tinyint(1) DEFAUlT 0, -- 삭제여부 1: 삭제 
  members_id bigint, -- 회원정보
  music_id bigint,
  playlist_id bigint,
  FOREIGN KEY (playlist_id) REFERENCES playlist (playlist_id) on delete cascade,
  FOREIGN KEY (members_id) REFERENCES members (members_id) on delete cascade,
  FOREIGN KEY (music_id) REFERENCES music (music_id) on delete cascade
);

-- 댓글, 대댓글 테이블
CREATE TABLE comment(
  comment_id bigint PRIMARY KEY AUTO_INCREMENT,
  comment_chk tinyint(1),
  contents varchar(300),
  created_at datetime DEFAULT now(),
  updated_at datetime DEFAULT now(),
  deleted_at datetime,
  deleted_YN tinyint(1) DEFAUlT 0,
  members_id bigint not null,
  music_id bigint not null,
  parent_id bigint not null DEFAUlT 0,
  FOREIGN KEY (music_id) REFERENCES music (music_id) on delete cascade,
  FOREIGN KEY (members_id) REFERENCES members (members_id) on delete cascade,
  FOREIGN KEY (parent_id) REFERENCES comment (comment_id)
);