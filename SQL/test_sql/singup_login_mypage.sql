-- 회원가입하기

insert into MEMBERS (EMAIL, PASSWORD, NAME, nickname, GENDER, PHONE_NUMBER, BIRTH_DATE) 
value('keepself@naver.com', '234', 'chang', 'L', 'M', '010-8899-1111', '1995.01.01');


-- 로그인하기
select * from members
where email = 'keepself@naver.com'
and password ='234';


-- 프로필사진 추가
INSERT INTO IMAGE(image_url, members_id) values('public/storage/img/13', '4');


-- 프로필 사진 수정
UPDATE IMAGE SET image_url = 'public/storage/img/14' where members_id = 4;


-- 프로필 사진 삭제
UPDATE IMAGE SET DELETED_YN = 1, DELETED_AT = NOW() WHERE MEMBERS_ID = 4;


-- 나의 프로필 수정
-- 회원이 회원가입 때 입력한 정보를 수정하여 최신화 할 수 있다.
-- 3번 회원이 자신의 닉네임과 휴대폰 번호를 수정할려고한다.
update members set nickname = 'Jerry', phone_number = '010-9876-5432', updated_at = now()
where members_id = 3;


-- 나의 노래 리스트
-- 내가 업로드한 노래를 확인할 수 있다.
-- 3번 회원이 자신이 업로드한 노래리스트를 확인할려고 한다.
select m.title, m.artist, m.description, m.music_file_url, m.genre, m.on_off, n.members_id as uploader
from music m inner join members n
on m.members_id =  n.members_id
where m.members_id = 3;


-- 나의 플레이리스트 확인
-- 사용자는 자신이 만든 플레이리스트를 확인할 수 있다.
-- 자신이 만든 플레이 리스트를 공개 / 비공개 처리할 수있다.
-- 1번 회원이 자신이 만든 플레이리스트를 조회할려고한다.
select * from playlist where members_id = 1;


-- 팔로워 리스트
-- 나를 팔로우 하고있는 사람들의 정보를 알 수 있다.
-- 4번 회원이 자신을 팔로우 하고있는 사람들을 조회할려고한다.
select * from follow where follow_ing = 4;


-- 팔로잉 리스트
-- 내가 팔로우 하고있는 사람들의 정보를 알 수 있다.
-- 2번 회원이 자신이 팔로우 하고있는 사람들을 조회할려고한다.
select * from follow where follower = 2;