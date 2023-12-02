-- 노래 정렬
-- 좋아요순, 최신순, 이름순으로 정렬

-- 좋아요순
select m.music_id, m.title, m.artist, m.genre, count(l.music_id) as likes from 
music m left join likes l
on l.music_id = m.music_id
where m.deleted_YN = 0
group by l.music_id
order by likes desc;

-- 최신순
select m.music_id, m.title, m.artist, m.genre, m.created_at, count(l.music_id) as likes from 
music m left join likes l
on m.music_id = l.music_id
where m.deleted_YN = 0
group by l.music_id
order by m.created_at;

-- 이름순
select m.music_id, m.title, m.artist, m.genre, count(l.music_id) as likes from 
music m left join likes l
on m.music_id = l.music_id
where m.deleted_YN = 0
group by l.music_id
order by m.title;
