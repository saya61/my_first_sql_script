-- mysql 에서는 FULL OUTER JOIN 지원 X
-- UNION 집합연산 사용해서 구현
-- union : 수직으로 붙이기
-- 중복 불허 / unionAll 하면 중복도 포함

CREATE TABLE cat (
    name VARCHAR(20),
    age INT,
    owner VARCHAR(20),
    type VARCHAR(20)
);

CREATE TABLE dog (
    name VARCHAR(20),
    age INT,
    owner VARCHAR(20),
    type VARCHAR(20)
);
CREATE TABLE animal (
    name VARCHAR(20),
    age INT,
    owner VARCHAR(20),
    type VARCHAR(20)
);

INSERT INTO cat VALUES
    ('도리', 3, 'SU', 'black cat'),
    ('코코로', 4, 'SU back gate', 'ramen store cat');

INSERT INTO dog VALUES
    ('dog1', 1, 'no ms', 'lindo'),
    ('dog2', 2, 'recently born', 'shiba');

INSERT INTO animal VALUES
    ('도리', 3, 'SU', 'black cat'),
    ('코코로', 4, 'SU back gate', 'ramen store cat'),
    ('dog1', 1, 'no ms', 'lindo'),
    ('dog2', 2, 'recently born', 'shiba');


SELECT * FROM cat
UNION
SELECT * FROM dog
UNION
SELECT * FROM animal;

SELECT * FROM cat
UNION
SELECT * FROM dog
UNION ALL
SELECT * FROM animal;

-- FULL OUTER JOIN
SELECT *
FROM board_user
LEFT JOIN post p
ON board_user.id = p.board_user_id
UNION
SELECT *
FROM board_user
RIGHT JOIN post p
ON board_user.id = p.board_user_id;