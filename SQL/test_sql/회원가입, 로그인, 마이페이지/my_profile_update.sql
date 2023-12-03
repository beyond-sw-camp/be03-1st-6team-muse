-- 나의 프로필 수정
-- 회원이 회원가입 때 입력한 정보를 수정하여 최신화 할 수 있다.

-- 3번 회원이 자신의 닉네임과 휴대폰 번호를 수정할려고한다.
update members set nickname = 'Jerry', phone_number = '010-9876-5432', updated_at = now()
where members_id = 3;


select * from members;
