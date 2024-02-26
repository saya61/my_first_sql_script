CREATE TABLE example_table2 (
    id INT PRIMARY KEY,
    small_integer SMALLINT,
    large_integer BIGINT,
		birth_date DATE,
    decimal_number DECIMAL(10, 2),
    floating_point FLOAT,
    double_precision DOUBLE,
    fixed_length_string CHAR(10),
    variable_length_string VARCHAR(255),
    long_text TEXT,
    binary_data BLOB,
    long_binary_data LONGBLOB,
		json_data JSON
);

-- JSON 리터럴 데이터 추가
INSERT INTO example_table2 (id, json_data) VALUES (1, '{"name": "John", "age": 30, "arr": [10, 20, 30]}');
INSERT INTO example_table2 (id, json_data) VALUES (2, '{"name": "Jenny", "arr": [1, 2, 3]}');
-- SELECT 절에서 값 사용 (1)
SELECT json_data->>'$.name' AS name FROM example_table2 WHERE id = 1;
SELECT json_data->>'$.name' AS name FROM example_table2; -- 속성 타입
SELECT json_data->'$.name' AS name FROM example_table2;  -- "" 객체 타입
-- SELECT 절에서 값 사용 (2)
SELECT json_data->'$[0]' FROM example_table2;
SELECT json_data->'$.arr' FROM example_table2;
SELECT
    json_data->'$.arr',
    json_data->'$.arr[0]',
    json_data->'$.arr[1]',
    json_data->'$.arr[2]'
FROM example_table2;

-- Class -> Entity 매핑
    -- field = attribute
-- Object -> Column 매핑
    -- Object 내부 field = JSON 타입의 key
-- WHERE 절에서 값 필터링
SELECT * FROM example_table2 WHERE json_data->'$.name' = 'John';