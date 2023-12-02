-- 노래 삭제
-- 업로드한 노래가 문제가 생겨 노래를 삭제한다.
update music set deleted_at = now(), deleted_YN = 1
where music_id = 9;


select music_id, title, artist, created_at, updated_at, deleted_at, deleted_YN, members_id from music;