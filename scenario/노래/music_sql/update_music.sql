-- 노래 수정
-- 노래를 업로드 한뒤 자신이 입력한 정보가 틀려 내용을 수정한다.
update music set artist = 'Oasis'
where music_id = 9;

select * from music;
