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