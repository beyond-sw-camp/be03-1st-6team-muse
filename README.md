# 🎵 MUSE
![Muse Banner](https://github.com/SimJH99/MUSE_DB/assets/123349044/4545d1e4-765c-4c8d-b538-5bea1b5e3c5b)

---
### 팀명: 개발 6팀
### 팀원
- 팀장 : [심재혁](https://github.com/SimJH99) :rabbit: 
- 사원 : [이창선](https://github.com/keepself) :pig:
- 사원 : [홍신애](https://github.com/sinaetown) :snake:
- 사원 : [조경남](https://github.com/GyeongNam) :cow:

---
## 🎧 프로젝트 소개

**MUSE 프로젝트는 음악 공유/스트리밍 서비스를 제공하는 플랫폼이다.**
<br> 회원 본인이 직접 제작한 노래들을 업로드하면서 자신의 창작물을 다수의 사람들이 즐길 수 있게 된다.

본인이 원하는 노래나 <ins>✔장르 태그 _(#)_</ins>를 통해서 검색을 함으로써 자신의 플레이리스트에 추가하거나 
<br>오직 자신의 취향만으로 이루어진 공간을 만들어낼 수 있다.

**소통의 장 역시 제공한다.**
<br> 회원들은 각 노래와 플레이리스트에 <ins>;❤좋아요</ins>를 누를 수 있으며 
<br>다른 회원들의 피드를 모아볼 수 있는 회원 <ins>👫팔로우</ins> 기능도 제공한다.
<br>이에, 본인의 취향을 공유하고 또 소통을 가능하게 한다.

---
## 🎧 시장 조사 및 프로젝트 필요성
국제 음반 산업 협회(IFPI)에서 제공한 ‘글로벌 음악 보고서 2023’에 따르면,
<br>음악 스트리밍 서비스는 전세계 음악산업 수익의 67%를 차지하고 전년 대비 10%이상 성장했다. 
<br> 이는 8년 연속 성장세를 보이고 있으며 앞으로도 계속 성장세를 이어갈 것이라고 예상하고 있다.

<br> 뿐만 아니라, 수익도 끊임없이 증가해왔다. 2010년부터 2020년까지 수익은 4억 달러에서 136억 달러로 약 34배 증가했다. 
<br>2022년에는 175억 달러를 달성했고 2025년에는 300억 달러를 초과한다는 분석도 나오고 있다. 

**<br> ❗ 음악 스트리밍 서비스는 무궁무진하게 발전할 수 있는 분야이며 
<br> 최근 사회는 스트리밍 서비스에 크게 의존하고 있다는 동향에 따라 해당 프로젝트를 진행했다.**

 <img src = "https://www.digitalmusicnews.com/wp-content/uploads/2023/03/Global-Music-Industry-Revenue-Breakdown-2022.jpg" width="40%" height="40%"> &nbsp;&nbsp;&nbsp; <img src = "https://cdn.buttercms.com/output=f:webp/fObvxkSgRAefF9B0jyFo" width="40%" height="40%"> 

---
## 🎧 WBS
 ![Alt WBS](https://github.com/SimJH99/MUSE_DB/blob/main/PNG/WBS/%EA%B0%9C%EB%B0%9C6%ED%8C%80%20WBS.PNG)

---
## 🎧 요구사항

 ![Alt 회원가입_로그인_마이페이지](https://github.com/SimJH99/MUSE_DB/blob/main/%EC%84%9C%EB%B9%84%EC%8A%A4%20%EC%9A%94%EA%B5%AC%EC%82%AC%ED%95%AD/%EC%9A%94%EA%B5%AC%EC%82%AC%ED%95%AD-%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85_%EB%A1%9C%EA%B7%B8%EC%9D%B8_%EB%A7%88%EC%9D%B4%ED%8E%98%EC%9D%B4%EC%A7%80.png)

  ![Alt 노래_플레이리스트](https://github.com/SimJH99/MUSE_DB/blob/main/%EC%84%9C%EB%B9%84%EC%8A%A4%20%EC%9A%94%EA%B5%AC%EC%82%AC%ED%95%AD/%EC%9A%94%EA%B5%AC%EC%82%AC%ED%95%AD-%EB%85%B8%EB%9E%98_%ED%94%8C%EB%A0%88%EC%9D%B4%EB%A6%AC%EC%8A%A4%ED%8A%B8.png)

   ![Alt 검색_팔로우](https://github.com/SimJH99/MUSE_DB/blob/main/%EC%84%9C%EB%B9%84%EC%8A%A4%20%EC%9A%94%EA%B5%AC%EC%82%AC%ED%95%AD/%EC%9A%94%EA%B5%AC%EC%82%AC%ED%95%AD-%EA%B2%80%EC%83%89_%ED%8C%94%EB%A1%9C%EC%9A%B0.png)

---
## 🎧 DB 모델링
  * 개념적 모델링

 ![Alt 개념적 ERD](https://github.com/SimJH99/MUSE_DB/blob/main/PNG/ERD/MUSE_%EA%B0%9C%EB%85%90%EC%A0%81_%EB%AA%A8%EB%8D%B8%EB%A7%81.drawio.png)

  * 논리적 모델링

 ![Alt 논리적 ERD](https://github.com/SimJH99/MUSE_DB/blob/main/PNG/ERD/%EA%B0%9C%EB%B0%9C6%ED%8C%80_MUSE_%EB%A6%B4%EB%A0%88%EC%9D%B4%EC%85%98%EC%8A%A4%ED%82%A4%EB%A7%88.png)

## 주요 쿼리 요약본
* DDL
**회원 테이블 생성**
```SQL
CREATE TABLE members(
   members_id bigint PRIMARY KEY AUTO_INCREMENT,
   email varchar(100) UNIQUE NOT NULL, -- 이메일: 회원가입시 아이디로 사용
   password varchar(255) NOT NULL, -- 비밀번호
   name varchar(200) NOT NULL, -- 실명
   nickname varchar(200) NOT NULL, -- 닉네임 
   gender ENUM ('M', 'F'), -- 성별
   phone_number varchar(50) UNIQUE NOT NULL, -- 전화번호
   birth_date datetime NOT NULL, -- 생일
   created_at datetime DEFAULT now(), -- 회원가입 날짜
   updated_at datetime DEFAULT now(), -- 정보수정날짜
   deleted_at datetime, -- 정보삭제날짜
   deleted_YN tinyint(1) DEFAULT 0 -- 정보삭제여부 1: 삭제, 0: 미삭제
 );
```
**노래 테이블 생성**
```SQL
CREATE TABLE music(
  music_id bigint PRIMARY KEY AUTO_INCREMENT,
  title varchar(100) NOT NULL, -- 노래제목
  artist varchar(200) NOT NULL, -- 아티스트명
  description varchar(3000), -- 설명 or 노래가사
  music_file_url varchar(255) NOT NULL, -- 노래 파일 url
  genre ENUM -- 노래 장르
  ('Kpop', 'Jpop', 'OST', 'Pop', 'Classic', 'Jazz', 'Indie', 'Canadian_blues', 
  'Contemporary_RnB', 'Punk_blues', 'Crossover_music', 'Instrumental', 'Lofi', 'Blues_rock',
  'Chicago_blues', 'Delta_blues', 'EDM', 'Country_pop', 'Country_rap', 'Country_rock', 'Instrumental_country',
  'Western', 'New_age', 'Darkcore', 'Disco', 'City_pop', 'Dance_pop', 'Electronic_rock', 'Dance_rock',
  'Alternative_dance', 'Madchester', 'Baggy', 'New_rave', 'New_romantic', 'Electropop',
  'Electronica', 'Folktronica', 'Acid_jazz','Jungle', 'Hipster_hop', 'Cloud_rap', 'Acid_house',
  'Chicago_house', 'Futurepop', 'Dubstep'),
  on_off tinyint(1), -- 노래 공개/비공개 1: 공개 , 0: 미삭제 
  created_at datetime DEFAULT now(), -- 노래업로드 날짜
  updated_at datetime DEFAULT now(), -- 정보수정날짜
  deleted_at datetime, -- 노래삭제날짜
  deleted_YN tinyint(1) DEFAULT 0, -- 노래삭제여부 1: 삭제, 0: 미삭제
  members_id bigint NOT NULL, -- 회원정보테이블 fk
  FOREIGN KEY(members_id) REFERENCES members(members_id) on delete cascade
);
```
* DCL
```SQL
create user 'user_viewpoint'@'%';
create user 'admin_viewpoint'@'%';

grant select on muse.* to 'admin_viewpoint'@'%';
grant update on muse.* to 'admin_viewpoint'@'%';
grant insert on muse.* to 'admin_viewpoint'@'%';
grant delete on muse.* to 'admin_viewpoint'@'%';
grant exectue on procedure muse.press_like to 'admin_viewpoint'@'%';
grant exectue on procedure muse.playlist_rename to 'admin_viewpoint'@'%';
grant exectue on procedure muse.playlist_on_off_set to 'admin_viewpoint'@'%';
grant exectue on procedure muse.playlist_music_insert to 'admin_viewpoint'@'%';
grant exectue on procedure muse.press_image_change to 'admin_viewpoint'@'%';
grant exectue on procedure muse.delete_playlist to 'admin_viewpoint'@'%';
flush privileges;

grant select on muse.* to 'user_viewpoint'@'%';
grant exectue on procedure muse.press_like to 'user_viewpoint'@'%';
grant exectue on procedure muse.playlist_rename to 'user_viewpoint'@'%';
grant exectue on procedure muse.playlist_on_off_set to 'user_viewpoint'@'%';
grant exectue on procedure muse.playlist_music_insert to 'user_viewpoint'@'%';
grant exectue on procedure muse.press_image_change to 'user_viewpoint'@'%';
grant exectue on procedure muse.delete_playlist to 'user_viewpoint'@'%';
flush privileges;
```
---
# 테스트
<details>
<summary>회원가입</summary>
<div markdown="1">

* **쿼리문**
<br>![Alt 논리적 ERD](https://github.com/SimJH99/MUSE_DB/blob/main/PNG/Test%20Queries/Signup_Login_Mypage_PNG/sign%20up%20image/%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85%20sql.png)

* **테스트 결과**
 <br>![Alt 논리적 ERD](https://github.com/SimJH99/MUSE_DB/blob/main/PNG/Test%20Queries/Signup_Login_Mypage_PNG/sign%20up%20image/%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85%20sql%20%EA%B2%B0%EA%B3%BC.png)

</div>
</details>

<details>
<summary>노래 업로드</summary>
<div markdown="1">

 * **쿼리문**
<br>![Alt 논리적 ERD](https://github.com/SimJH99/MUSE_DB/blob/main/PNG/Test%20Queries/Music_PNG/%EB%85%B8%EB%9E%98%EC%B6%94%EA%B0%80.PNG)

* **테스트 결과**
 <br>![Alt 논리적 ERD](https://github.com/SimJH99/MUSE_DB/blob/main/PNG/Test%20Queries/Music_PNG/%EB%85%B8%EB%9E%98%EC%B6%94%EA%B0%80%20%EA%B2%B0%EA%B3%BC.PNG)
 </div>
</details>

<details>
<summary>플레이리스트 생성</summary>
<div markdown="1">

* **쿼리문**
<br>![Alt 논리적 ERD](https://github.com/SimJH99/MUSE_DB/blob/main/PNG/Test%20Queries/Playlist_PNG/%ED%94%8C%EB%A0%88%EC%9D%B4%EB%A6%AC%EC%8A%A4%ED%8A%B8%20DML%20-%20Test%20Queries/%EC%8B%9C%EB%82%98%EB%A6%AC%EC%98%A4%201-1.png)

* **테스트 결과**
 <br>![Alt 논리적 ERD](https://github.com/SimJH99/MUSE_DB/blob/main/PNG/Test%20Queries/Playlist_PNG/%ED%94%8C%EB%A0%88%EC%9D%B4%EB%A6%AC%EC%8A%A4%ED%8A%B8%20DML%20-%20Test%20Queries/%EC%8B%9C%EB%82%98%EB%A6%AC%EC%98%A4%201-1%20%EA%B2%B0%EA%B3%BC.png)
 </div>
</details>


<details>
<summary>플레이리스트에 노래 추가</summary>
<div markdown="1">

* **쿼리문**
<br>![Alt 논리적 ERD](https://github.com/SimJH99/MUSE_DB/blob/main/PNG/Test%20Queries/Playlist_PNG/%ED%94%8C%EB%A0%88%EC%9D%B4%EB%A6%AC%EC%8A%A4%ED%8A%B8%20DML%20-%20Test%20Queries/%EC%8B%9C%EB%82%98%EB%A6%AC%EC%98%A4%201-3.png)

* **테스트 결과**
   1) **추가된 노래가 플리에 잘 들어갔는지 확인**
  <br>![Alt 논리적 ERD](https://github.com/SimJH99/MUSE_DB/blob/main/PNG/Test%20Queries/Playlist_PNG/%ED%94%8C%EB%A0%88%EC%9D%B4%EB%A6%AC%EC%8A%A4%ED%8A%B8%20DML%20-%20Test%20Queries/%EC%8B%9C%EB%82%98%EB%A6%AC%EC%98%A4%201-3%20%EA%B2%B0%EA%B3%BC%20playlist_music%EC%97%90%20%EC%B6%94%EA%B0%80%EB%90%9C%20%EB%85%B8%EB%9E%98%EA%B0%80%20%ED%94%8C%EB%A6%AC%EC%97%90%20%EC%9E%98%20%EB%93%A4%EC%96%B4%EA%B0%94%EB%8A%94%EC%A7%80%20%ED%99%95%EC%9D%B8.png)

  2) **플리에 추가된 노래 확인**
      <br>![Alt 논리적 ERD](https://github.com/SimJH99/MUSE_DB/blob/main/PNG/Test%20Queries/Playlist_PNG/%ED%94%8C%EB%A0%88%EC%9D%B4%EB%A6%AC%EC%8A%A4%ED%8A%B8%20DML%20-%20Test%20Queries/%EC%8B%9C%EB%82%98%EB%A6%AC%EC%98%A4%201-3%20%EA%B2%B0%EA%B3%BC%20%EC%B6%94%EA%B0%80%EB%90%9C%20%ED%94%8C%EB%A6%AC%EC%99%80%20%EB%85%B8%EB%9E%98%20%EB%A7%A4%EC%B9%AD.png)
     
</details>

<details>
<summary>플레이리스트에 좋아요 누르기</summary>
<div markdown="1">

* **쿼리문**
    <br>![Alt 논리적 ERD](https://github.com/SimJH99/MUSE_DB/blob/main/PNG/Test%20Queries/Playlist_PNG/%ED%94%8C%EB%A0%88%EC%9D%B4%EB%A6%AC%EC%8A%A4%ED%8A%B8%20DML%20-%20Test%20Queries/%EC%8B%9C%EB%82%98%EB%A6%AC%EC%98%A4%203-2.png)
 
* **테스트 결과**
  <br>![Alt 논리적 ERD](https://github.com/SimJH99/MUSE_DB/blob/main/PNG/Test%20Queries/Playlist_PNG/%ED%94%8C%EB%A0%88%EC%9D%B4%EB%A6%AC%EC%8A%A4%ED%8A%B8%20DML%20-%20Test%20Queries/%EC%8B%9C%EB%82%98%EB%A6%AC%EC%98%A4%203-2%20%EA%B2%B0%EA%B3%BC%20%ED%94%84%EB%A1%9C%EC%8B%9C%EC%A0%80%20%EC%BD%9C%20%EC%B5%9C%EC%B4%88%20%EC%A2%8B%EC%95%84%EC%9A%94.png)
     
</details>

<details>
<summary>팔로우/팔로잉</summary>
<div markdown="1">

* **쿼리문**
 <br>![Alt 논리적 ERD](https://github.com/SimJH99/MUSE_DB/blob/main/PNG/Test%20Queries/Search_Follow_PNG/follow_PNG/%ED%8C%94%EB%A1%9C%EC%9E%89.png)

* **테스트 결과**
   <br>![Alt 논리적 ERD](https://github.com/SimJH99/MUSE_DB/blob/main/PNG/Test%20Queries/Search_Follow_PNG/follow_PNG/%ED%8C%94%EB%A1%9C%EC%9A%B0%20%EA%B2%B0%EA%B3%BC.png)  
</details>
---
