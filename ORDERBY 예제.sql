SELECT * FROM bank_account;

INSERT INTO bank_account (account_owner, balance)
    VALUES
        ('워렌버핏', 2100000000),
        ('일론머스크', 2000000000),
        ('빌게이츠', 1900000000),
        ('재드래곤', 1000000000);

SELECT * FROM bank_account
ORDER BY balance DESC;  -- 기본값 : ASC, 낮 -> 높 / DESC : 높 -> 낮

SELECT * FROM bank_account
ORDER BY account_owner DESC;

-- ORDER BY 절 할 때 염두
-- WHERE 조건에 적어준 필터링 기준 컬럼이 INDEX 설정 되었을 경우
-- 자동으로 해당 INDEX 에 따라서 정렬된 결과 출력

SELECT * FROM bank_account
WHERE account_number>4; -- WHERE 조건에 들어온 인덱스가 사용되면서 정렬

SELECT * FROM drink_order;
SELECT * FROM drink_order
ORDER BY customer_id is null;
-- 그냥 하면 null 이 맨위. is null 하면 TRUE : 1
-- nulls last(ANSI 표준 아님) 와 동일

SELECT * FROM drink_order
ORDER BY 2 DESC;    -- column 번호를 기준으로 정렬

SELECT * FROM drink_order
ORDER BY 3, 4;
-- 3번 컬럼으로 정렬 후 동일하면 4번 컬럼으로 정렬

SELECT customer_id, SUM(total_amount)
FROM drink_order
GROUP BY customer_id
ORDER BY SUM(total_amount);

SELECT * FROM drink_order
ORDER BY
    CASE order_status
        WHEN 'completed' THEN total_amount
        WHEN NULL THEN ordered_at
        ELSE NULL
    END;