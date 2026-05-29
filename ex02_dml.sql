USE member_db;

-- INSERT
INSERT INTO members (mem_id, mem_name, mem_number, addr, phone1, phone2, height, debut_date)
VALUES ('12345678', '홍길동', 1, 'KR', '010', '44445555', 100, NOW()); -- NOW(): INSERT가 실행된 시간, SYSDATE(): SYSDATE가 실행된 시간

-- UPDATE
UPDATE members
SET mem_name = '김철수'
WHERE mem_id = '12345678'; -- 조건은 PK를 사용할 것

INSERT INTO visit_history (mem_id, visited_at)
VALUES ('12345678', NOW());

-- DELETE
DELETE FROM members
WHERE mem_id = '12345678';