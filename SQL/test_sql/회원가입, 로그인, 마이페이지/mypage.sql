-- 프로필사진 추가

INSERT INTO IMAGE(image_url, members_id) values('public/storage/img/13', '4');

-- 프로필 사진 수정

UPDATE IMAGE SET image_url = 'public/storage/img/14' where members_id = 4;

-- 프로필 사진 삭제
UPDATE IMAGE SET DELETED_YN = 1, DELETED_AT = NOW() WHERE MEMBERS_ID = 4;