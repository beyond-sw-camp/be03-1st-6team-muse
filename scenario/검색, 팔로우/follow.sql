-- 회원은 다른 사용자에게 팔로잉 하거나 팔로우를 당할 수 있음.

insert into follow(created_at,follow_ing,follower) values(now(), 1, 4);

-- 회원은 팔로잉을 취소할 수 있음. 회원 4번이 본인이 팔로잉한 1번을 제거

update follow set unfollow_YN = 1, unfollow_at = now() where follow_ing = 1 and follower = 4

-- 회원은 팔로워를 취소할 수 있음. 

update follow set unfollow_YN = 1, unfollow_at = now() where follow_ing = 2 and follower = 3