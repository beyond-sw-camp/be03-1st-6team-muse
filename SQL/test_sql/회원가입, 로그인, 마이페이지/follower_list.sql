-- 팔로워 리스트
-- 나를 팔로우 하고있는 사람들의 정보를 알 수 있다.

-- 4번 회원이 자신을 팔로우 하고있는 사람들을 조회할려고한다.

select * from follow
where follow_ing = 4;

