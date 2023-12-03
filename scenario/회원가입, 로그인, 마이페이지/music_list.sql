-- 나의 노래 리스트
-- 내가 업로드한 노래를 확인할 수 있다.
-- 3번 회원이 자신이 업로드한 노래리스트를 확인할려고 한다.

select m.title, m.artist, m.description, m.music_file_url, m.genre, m.on_off, n.members_id as uploader
from music m inner join members n
on m.members_id =  n.members_id
where m.members_id = 3;

