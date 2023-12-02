-- 시나리오1
-- 1. 회원은 회원가입 후, 바로 플레이리스트를 생성하려고 한다.
insert into members(email, password, name, nickname, gender, phone_number, birth_date)
values ('sinae@naver.com', 'sinaepw', 'Sinae', 'sinaetown', 'F', '010-1234-5678', '2005.05.05');

select * from members;

-- 2. 플레이리스트를 전체 공개 설정한 뒤 이름을 입력 (여기서는 'Sinae's Running Playlist'라 명명)하고 커버 사진을 추가해서 생성한다.
DELIMITER //
CREATE PROCEDURE playlist_img_insert(IN email_param VARCHAR(100), 
IN image_url_param VARCHAR(255), IN playlist_name_param VARCHAR(100))
BEGIN
declare mem_id BIGINT default (select members_id from members where email=email_param); 
insert into playlist(playlist_name, members_id) values (playlist_name_param, mem_id);
insert into image(image_url, playlist_id) 
values (image_url_param, 
(select playlist_id from playlist 
where playlist_name=playlist_name_param));
END //
DELIMITER ;

call playlist_img_insert('sinae@naver.com', 'public/storage/sinae/profile_img', 'Sinae\'s Running Playlist');

select * from image;
select * from playlist;

-- 3. 원하는 노래를 'Sinae's Running Playlist’에 삽입한다.
DELIMITER //
CREATE PROCEDURE playlist_music_insert(IN playlist_id_param BIGINT, IN music_id_param BIGINT)
BEGIN
insert into playlist_music(playlist_id, music_id) values (playlist_id_param, music_id_param);

select playlist_name, title from playlist left join 
playlist_music on playlist.playlist_id=playlist_music.playlist_id 
left join 
music on playlist_music.music_id=music.music_id
where playlist_music.playlist_id=playlist_id_param;

END //
DELIMITER ;

call playlist_music_insert(5,3);
select * from playlist_music;

-- 4. 신애 러닝 플리의 이름을 신애 공부 플리로 바꾼다.
DELIMITER //
CREATE PROCEDURE playlist_rename(IN mem_id BIGINT, IN old_name VARCHAR(100), IN new_name VARCHAR(100))
BEGIN
update playlist set playlist_name=new_name where playlist_name=old_name && members_id=mem_id;
update playlist set updated_at=now() where  playlist_name=old_name && members_id=mem_id;
END //
DELIMITER ;

call playlist_rename(1,'Sinae\'s Running Playlist', 'Sinae\'s Study Playlist'); -- 'Sinae'의 members_id는 5번이기 때문에 그 외의 members_id일 때는 데이터 수정이 불가하다.
call playlist_rename(5,'Sinae\'s Running Playlist', 'Sinae\'s Study Playlist');
select * from playlist;

-- 5. 신애 공부 플리의 커버 사진을 변경한다.
DELIMITER //
CREATE PROCEDURE playlist_image_change(IN email_param VARCHAR(100), 
IN new_image_url VARCHAR(255), IN playlist_name_param VARCHAR(100))
BEGIN
declare mem_id BIGINT default (select members_id from members where email=email_param); 
declare play_id BIGINT default (select playlist_id from playlist where playlist_name = playlist_name_param && members_id=mem_id);
update image set image_url=new_image_url where playlist_id=play_id;
END //
DELIMITER ;

call playlist_image_change('si@naver.com','wrongroute', 'Sinae\'s Study Playlist'); -- 다른 유저로 로그인했을 때
call playlist_image_change('sinae@naver.com','wrongroute2', 'Sinae\'s wrong Playlist'); -- 없는 플리를 바꿀 때
call playlist_image_change('sinae@naver.com','realnewroute', 'Sinae\'s Study Playlist'); -- 정상 작동

-- 6.  신애 공부 플리를 비공개로 바꾼다.
DELIMITER //
CREATE PROCEDURE playlist_on_off_set(IN email_param VARCHAR(100), 
IN on_off_chg VARCHAR(5), IN playlist_name_param VARCHAR(100))
BEGIN
declare choice TINYINT(1) default 
case on_off_chg
when 'open' then 1 -- 공개
else 0 -- 비공개
end;
declare mem_id BIGINT default (select members_id from members where email=email_param); 
declare play_id BIGINT default (select playlist_id from playlist where playlist_name = playlist_name_param && members_id=mem_id);
update playlist set on_off=choice where playlist_id=play_id;
END //
DELIMITER ;

call playlist_on_off_set('si@naver.com','off', 'Sinae\'s Study Playlist'); -- 다른 유저로 로그인했을 때
call playlist_on_off_set('sinae@naver.com','off', 'Sinae\'s wrong Playlist'); -- 없는 플리를 바꿀 때
call playlist_on_off_set('sinae@naver.com','off', 'Sinae\'s Study Playlist'); -- 정상 작동
select * from playlist;

-- 7. 신애 공부 플리를 삭제한다.
DELIMITER //
CREATE PROCEDURE delete_playlist(IN email_param VARCHAR(100), IN playlist_name_param VARCHAR(100))
BEGIN
declare mem_id BIGINT default (select members_id from members where email=email_param); 
declare play_id BIGINT default (select playlist_id from playlist where playlist_name = playlist_name_param && members_id=mem_id);
update playlist set deleted_YN = 1, updated_at = now() where playlist_id=play_id;
END //
DELIMITER ;

call delete_playlist('si@naver.com', 'Sinae\'s Study Playlist'); -- 다른 유저로 로그인했을 때
call delete_playlist('sinae@naver.com', 'Sinae\'s wrong Playlist'); -- 없는 플리를 바꿀 때
call delete_playlist('sinae@naver.com', 'Sinae\'s Study Playlist'); -- 정상 작동
select * from playlist;

-- 8. 공개처리된 플리를 조회해본다.
select playlist.playlist_name as Playlist_Names, members.nickname as Artists from playlist left join members on playlist.members_id=members.members_id
where playlist.on_off=1 && playlist.deleted_YN=0;

-- 9. 공개처리된 플리를 좋아요순, 최신순, 이름순으로 각각 조회해본다.
-- 좋아요순
select playlist.playlist_name as Playlist_Names, members.nickname as Artists from likes left join
playlist on playlist.playlist_id=likes.playlist_id left join
members on playlist.members_id=members.members_id
where playlist.on_off=1 && playlist.deleted_YN=0
group by likes.playlist_id;

-- 최신순
select playlist.playlist_name as Playlist_Names, members.nickname as Artists, playlist.created_at as created_time
from playlist left join members
on playlist.members_id=members.members_id 
where playlist.on_off=1 && playlist.deleted_YN=0
order by playlist.created_at desc;

-- 이름순
select playlist.playlist_name as Playlist_Names, members.nickname as Artists
from playlist left join members
on playlist.members_id=members.members_id 
where playlist.on_off=1 && playlist.deleted_YN=0
order by playlist.playlist_name;

-- 10. 다른 회원의 플리에 처음으로 좋아요를 누른다.
DELIMITER //
CREATE PROCEDURE press_like(IN status TINYINT(1), IN email_param VARCHAR(100), IN playlist_name_param VARCHAR(100))
BEGIN
declare stat TINYINT(1) default
case status
when 1 then 0 -- 0이 좋아요한 상태, 1이 좋아요하지 않은 (취소한) 상태
else 1
end;

declare mem_id BIGINT default (select members_id from members where email=email_param); 
declare play_id BIGINT default (select playlist_id from playlist where playlist_name = playlist_name_param);

if (select count(*) from likes where playlist_id= play_id && who_id = mem_id)=0 then
	insert into likes(who_id, playlist_id) values (mem_id, play_id);
ELSE 
	update likes set canceled_YN = stat where playlist_id= play_id && who_id = mem_id;
end if;

END //
DELIMITER ;

call press_like(0,'sinae@naver.com', 'angry'); -- 아무 기록이 없는 상태에서 처음 좋아요를 누를 경우
select * from likes; -- 여기서 sinae이메일에 해당되는 who_id는 5, angry 플리에 해당되는 playlist_id는 3이다.

-- 11. 눌렀던 좋아요를 취소한다.
call press_like(0,'john@gmail.com', 'happy'); -- 원래 0에서 -> 좋아요를 취소(1) 할 경우
select * from likes; -- 여기서 john이메일에 해당되는 who_id는 2, happy 플리에 해당되는 playlist_id는 1이다.


-- 12. 취소했던 좋아요를 다시 누른다.
call press_like(1,'john@gmail.com', 'happy'); -- 원래 1에서 -> 좋아요를 누를(0) 경우
select * from likes; -- 여기서 john이메일에 해당되는 who_id는 2, happy 플리에 해당되는 playlist_id는 1이다.