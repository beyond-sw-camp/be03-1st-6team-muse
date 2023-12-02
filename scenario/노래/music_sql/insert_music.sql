-- 노래 추가
-- 서비스 사용자중 한명이 본인의 노래를 업로드 한다.
insert into music(title, artist, description, music_file_url, genre, on_off, members_id)
values
('shampoine supernova', 'Greenday', 'how many special pople change?', 
'public/storage/music9', 'Electronic_rock', 1, 3);


select * from music;