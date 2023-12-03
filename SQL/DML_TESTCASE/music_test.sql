-- 노래 추가
-- 서비스 사용자중 한명이 본인의 노래를 업로드 한다.
insert into music(title, artist, description, music_file_url, genre, on_off, members_id)
values
('shampoine supernova', 'Greenday', 'how many special pople change?', 
'public/storage/music9', 'Electronic_rock', 1, 3);

select * from music;


-- 노래 수정
-- 노래를 업로드 한뒤 자신이 입력한 정보가 틀려 내용을 수정한다.
update music set artist = 'Oasis'
where music_id = 9;

select * from music;


-- 좋아요/좋아요 취소 기능
-- 사용자들은 본인이 좋아하는 노래에 좋아요를 누를 수 있고 좋아요 취소도 가능하다.

-- 좋아요 누르기
insert into likes(who_id, music_id)
values
(1, 9);

insert into likes(who_id, music_id)
values
(2, 9);

insert into likes(who_id, music_id)
values
(4, 9);

-- 좋아요 취소
update likes set canceled_at = now(), canceled_YN = 1
where whos_id = 4 and music_id = 9;

-- 다시 좋아요 누르기
insert into likes(who_id, music_id)
values
(4, 9);

select likes_id, created_at, canceled_at, canceled_YN, who_id, music_id 
from likes
order by music_id;


-- 댓글 달기
insert into comment(comment_chk, contents, members_id, music_id)
values
(1, 'good sound!', 1, 4);

select * from comment;

-- 대댓글 달기
insert into comment(comment_chk, contents, members_id, music_id, parent_id)
values
(0, 'thank you!', 3, 4, 1);

insert into comment(comment_chk, contents, members_id, music_id, parent_id)
values
(0, 'OMG!!', 1, 4, 1);

select * from comment;

-- 댓글 수정
update comment set contents = 'good sound guy~!', updated_at = now() 
where comment_id = 1;

select * from comment;

-- 대댓글 삭제
update comment set deleted_YN = 1 , deleted_at = now() 
where comment_id = 3;


-- 좋아요/좋아요 취소 기능
-- 사용자들은 본인이 좋아하는 노래에 좋아요를 누를 수 있고 좋아요 취소도 가능하다.

-- 좋아요 누르기
insert into likes(who_id, music_id)
values
(1, 9);

insert into likes(who_id, music_id)
values
(2, 9);

insert into likes(who_id, music_id)
values
(4, 9);

-- 좋아요 취소
update likes set canceled_at = now(), canceled_YN = 1
where whos_id = 4 and music_id = 9;

-- 다시 좋아요 누르기
insert into likes(who_id, music_id)
values
(4, 9);

select likes_id, created_at, canceled_at, canceled_YN, who_id, music_id 
from likes
order by music_id;


-- 노래 삭제
-- 업로드한 노래가 문제가 생겨 노래를 삭제한다.
update music set deleted_at = now(), deleted_YN = 1
where music_id = 9;

select music_id, title, artist, created_at, updated_at, deleted_at, deleted_YN, members_id from music;