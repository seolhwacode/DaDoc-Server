-- 사용자(회원) 정보를 저장할 테이블
CREATE TABLE dadoc_users(
	id VARCHAR2(100) PRIMARY KEY,	-- 아이디
	pwd VARCHAR2(100) NOT NULL,		-- 비밀번호
	name VARCHAR2(100) NOT NULL,	-- 이름(실명)
	nickname VARCHAR2(100) NOT NULL UNIQUE,	-- 닉네임
	tel VARCHAR2(100),		-- 휴대전화번호
	email VARCHAR2(100),	-- 이메일
	sex NUMBER,				-- 성별 : 0(남자), 1(여자), 2(그 외)
	birth DATE,				-- 생년월일
	profile VARCHAR2(100),	-- 프로필 이미지 경로를 저장할 컬럼
	regdate DATE,	--가입일
	pwd_question NUMBER,	-- users_pwd_question 테이블의 pk
	pwd_answer VARCHAR2(200),	-- 사용자의 대답. 단답형
	point NUMBER DEFAULT(50000),	-- 책의 중고거래를 위한 포인트
	tos NUMBER	-- 광고 수신 동의 : 0(동의X), 1(동의O)
);

-- 사용자(회원) 비밀번호 찾기 질문 테이블
CREATE TABLE users_pwd_question(
	num NUMBER PRIMARY KEY,	-- PK
	question VARCHAR2(200) NOT NULL	-- 질문 내용
);

-- 책의 좋아요 리스트를 저장하는 table
CREATE TABLE dadoc_book_good(
	id VARCHAR2(100),	-- 아이디
	isbn VARCHAR2(100),	-- 책의 isbn
	PRIMARY KEY(id, isbn)
)

-- 챌린지 정보를 저장할 테이블
CREATE TABLE dadoc_challenges(
	num NUMBER PRIMARY KEY, -- 등록된 챌린지 순서
	type VARCHAR2(100) NOT NULL, -- 일반챌린지/프리미엄 챌린지 구분
	writer VARCHAR2(100), -- 등록자
	title VARCHAR2(100) NOT NULL, -- 챌린지명
	category VARCHAR2(100) NOT NULL, -- 챌린지 종류 구분
	imagePath VARCHAR2(100), -- 이미지 경로
	orgFileName VARCHAR2(100), -- 원본 파일명
	saveFileName VARCHAR2(100), -- 서버에 실제로 저장된 파일명
	fileSize NUMBER, -- 파일의 크기 
	description CLOB NOT NULL, -- 챌린지 설명
	period NUMBER NOT NULL, -- 인증 주기 몇회?
	startdate VARCHAR2(100), -- 챌린지 시작일
	enddate VARCHAR2(100), -- 챌린지 종료일
	regdate DATE -- 챌린지 등록 날짜
);

CREATE SEQUENCE challenges_seq; 

CREATE TABLE dadoc_challenger( 
	num NUMBER PRIMARY KEY, -- 챌린저 번호
	id VARCHAR2(100) NOT NULL, -- 챌린저 id
	challengeTitle VARCHAR2(100) NOT NULL, -- 챌린지 명
	period NUMBER, -- 챌린지 인증해야하는 횟수
	stamp NUMBER, -- 인증한 횟수
	success VARCHAR2(100) -- 챌린지 성공 여부 (default false)
);
	
CREATE SEQUENCE challenger_seq; 

CREATE TABLE dadoc_photoshot( 
	num NUMBER PRIMARY KEY, -- 인증샷 번호
	id VARCHAR2(100) NOT NULL, -- 챌린저 id
	challengeTitle VARCHAR2(100) NOT NULL, -- 챌린지 명
	photo VARCHAR2(100), -- 인증샷 담을 주소
	regdate DATE -- 인증샷 등록 날짜
);
	
CREATE SEQUENCE photoshot_seq; 

CREATE TABLE dadoc_challenge_comment(
	num NUMBER PRIMARY KEY, --댓글의 글번호
	writer VARCHAR2(100), --댓글 작성자의 아이디
	content VARCHAR2(500), --댓글 내용
	target_id VARCHAR2(100), --댓글의 대상자 아이디
	ref_group NUMBER,
	comment_group NUMBER,
	deleted CHAR(3) DEFAULT 'no',
	regdate DATE
);

CREATE SEQUENCE dadoc_challenge_comment_seq;

CREATE TABLE notice_board(
	NUM NUMBER PRIMARY KEY,
	WRITER VARCHAR2(100) NOT NULL,
	TITLE VARCHAR2(100) NOT NULL,
	CONTENT CLOB,
	REGDATE DATE,
);
CREATE SEQUENCE notice_board_seq;
