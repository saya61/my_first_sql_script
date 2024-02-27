CREATE TABLE board_user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(20) NOT NULL,
    location VARCHAR(20) NOT NULL
);
SELECT * FROM board_user;

CREATE TABLE post (
    id INT AUTO_INCREMENT PRIMARY KEY,
    board_user_id INT,
    posted_at DATETIME DEFAULT NOW(),
    content VARCHAR(255)
);
SELECT * FROM post;

INSERT INTO board_user(user_name, location) VALUES
   ('sorbet0231', '서울'),
   ('landia92', '서울'),
   ('sungwoo7180', '울산'),
   ('msak1234', '런던'),
   ('yuop1022', '로마'),
   ('nucon84', '로마');

INSERT INTO post(board_user_id, content) VALUES
   (1,'안녕하세요 반갑습니다.'),
   (2,'저는 2번 유저'),
   (3,'일기'),
   (4,'방명록'),
   (5,'이것은 오늘 아침 뉴스'),
   (2,'오늘의 날씨'),
   (4,'오늘의 교통정보'),
   (5,'즐거운 주말'),
   (1,'아직 화요일'),
   (2,'곧 개강');

SELECT *
FROM board_user
INNER JOIN post p
    ON board_user.id = p.board_user_id;

SELECT *
FROM board_user
LEFT JOIN post p
    ON board_user.id = p.board_user_id;
-- 6번 유저 유지 후 없는건 null

INSERT INTO post (board_user_id, content) VALUES
    (10, '안녕하세요 10번'),
    (15, '전 15번');

SELECT *
FROM board_user
RIGHT JOIN post p
    ON board_user.id = p.board_user_id;

-- NATURAL JOIN
-- 동일한 목적의 테이블인데 컬럼 명이 다소 다른 테이블
CREATE TABLE private_info1 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20),
    age INT
    -- 등등
);

CREATE TABLE private_info2 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20),
    address VARCHAR(50)
);

INSERT INTO private_info1 (name, age) VALUES
    ('user1', 10),
    ('user2', 11),
    ('user3', 12),
    ('user4', 15),
    ('user5', 20),
    ('user6', 21),
    ('user7', 30),
    ('user8', 35),
    ('user9', 50),
    ('user10', 99);

INSERT INTO private_info2(name, address) VALUES
    ('user1', 'my home'),
    ('user2', 'my office'),
    ('user3', 'my hotel'),
    ('user4', 'my apt'),
    ('user5', 'my yard'),
    ('user6', 'my sky'),
    ('user7', 'my seoul'),
    ('user8', 'my back ground'),
    ('user9', 'my playground'),
    ('user10', 'now here');

-- 매우 암묵적으로 연결되는 JOIN 방식
SELECT * FROM private_info1
NATURAL JOIN private_info2;

CREATE TABLE private_info3 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20),
    insurance_registered BOOLEAN
);

INSERT INTO private_info3 (name, insurance_registered) VALUES
    ('user1', true),
    ('user10', false),
    ('user2', true),
    ('user3', true),
    ('user4', true),
    ('user5', true),
    ('user6', false),
    ('user7', false),
    ('user8', false),
    ('user9', false);
-- 문자 정렬로 데이터가 들어간 info3 로 가정
SELECT * FROM private_info1
NATURAL JOIN private_info3;
-- 의도된 결과값 X!

SELECT *
FROM private_info1 AS p1
INNER JOIN private_info3 AS p3
USING (name);
-- ON p1.id = p3.id;
-- USING (name);

CREATE TABLE device (
    device_name VARCHAR(20),
    disk_size INT
);

CREATE TABLE color_option (
    color_name VARCHAR(10)
);

INSERT INTO device VALUES
    ('Galaxy S24', 1024),
    ('Galaxy S24', 512),
    ('Galaxy S24', 256),

    ('IPhone 15', 1024),
    ('IPhone 15', 512),
    ('IPhone 15', 256);

INSERT INTO color_option VALUES
    ('BLACK'),
    ('BLUE'),
    ('WHITE');

SELECT *
FROM device
CROSS JOIN color_option;

-- 동질한 집단 SELF JOIN
CREATE TABLE staff (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20),
    job VARCHAR(20),
    salary INT,
    supervisor_id INT   -- self join 키
);

INSERT INTO staff(name, job, salary, supervisor_id) VALUES
    ('staff1','백엔드', 8500, null),
    ('staff2','프론트엔드', 6500, null),
    ('staff3','보안', 7000, 1),
    ('staff4','인프라', 7800, 1),
    ('staff5','데이터분석', 7700, 2),
    ('staff6','데이터엔지니어', 8000, 2),
    ('staff7','데브옵스', 8800, 2),
    ('staff8','유지보수', 8000, 10),
    ('staff9','QA', 7600, 10),
    ('staff10','PM', 8100, null);

SELECT s1.id, s1.name, s1.supervisor_id, s2.name
FROM staff AS s1
INNER JOIN staff AS s2
ON s1.supervisor_id = s2.id;

SELECT s1.id, s1.name, s1.supervisor_id, s2.name
FROM staff AS s1
LEFT JOIN staff AS s2
ON s1.supervisor_id = s2.id;

# SELECT s1.id, s1.name, s1.supervisor_id, s2.name
# FROM staff AS s1
# RIGHT JOIN staff AS s2
# ON s1.supervisor_id = s2.id;