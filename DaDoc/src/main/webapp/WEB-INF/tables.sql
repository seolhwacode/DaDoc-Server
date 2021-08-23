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