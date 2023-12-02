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


select likes_id, created_at, canceled_at, canceled_YN, who_id, music_id from likes
order by music_id;