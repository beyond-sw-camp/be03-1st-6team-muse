-- 회원 검색 : 회원의 이름과 닉네임을 기준으로 검색함. 정렬 기준은 좋아요 순을 기본으로 함.

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

-- 플레이리스트 검색 : 플레이리스트 제목, 소유자 이름, 닉네임으로 검색할 수 있음. 정렬 기준은 좋아요 순을 기본으로 함.

-- 플레이리스트 검색 : a
select 
p.playlist_id,
p.playlist_name,
m.name,
m.nickname,
m.deleted_YN as user_deleted_YN,
p.deleted_YN as playlist_deleted_YN,
p.on_off as playlist_on_off
from members as m
join playlist as p
on m.members_id = p.members_id
left join likes as l
on p.playlist_id = l.playlist_id
where (p.playlist_name like '%a%' or m.name like '%a%' or m.nickname like '%d%') 
and m.deleted_YN = 0 and p.deleted_YN = 0 and  p.on_off = 1
group by p.playlist_id

