-- 회원 검색 : 회원의 이름과 닉네임을 기준으로 검색함. 정렬 기준은 좋아요 순을 기본으로 함.

-- 테스트 전 상황
select 
m.members_id,
m.nickname,
m.name,
m.deleted_YN,
count(l.likes_id) as like_count
from members as m
left join likes as l
on m.members_id = l.members_id
group by m.members_id;

-- 유저검색 : a
select 
m.members_id,
m.nickname,
m.name,
m.deleted_YN,
count(l.likes_id) as like_count
from members as m
left join likes as l
on m.members_id = l.members_id
where name like '%a%' or nickname like '%a%' and m.deleted_YN = 0
group by m.members_id 
order by like_count desc

-- 노래 검색 : 노래 제목, 장르, 아티스트 이름으로 검색할 수 있음. 정렬 기준은 좋아요 순을 기본으로 함.

-- 테스트 전 상황
select 
m.music_id,
m.title,
m.artist,
m.genre,
m.deleted_YN,
m.on_off,
count(l.likes_id) as like_count
from music as m
left join likes as l
on m.music_id = l.music_id
group by m.music_id;

-- 노래검색 : d
select 
m.music_id,
m.title,
m.artist,
m.genre,
m.deleted_YN,
m.on_off,
count(l.likes_id) as like_count
from music as m
left join likes as l
on m.music_id = l.music_id
where (m.title like '%d%' or m.artist like '%d%' or m.genre like '%d%') 
and m.deleted_YN = 0 and m.on_off = 1
group by m.music_id
order by like_count desc;

-- 플레이리스트 검색 : 플레이리스트 제목, 소유자 이름,닉네임으로 검색할 수 있음. 정렬 기준은 좋아요 순을 기본으로 함.

