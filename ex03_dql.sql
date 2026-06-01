-- SELECT 절만 필수
SELECT 1 + 1;
SELECT NOW();

-- 칼럼 별명 (Alias)
SELECT NOW() AS 지금;

-- FROM 절: 테이블 조회
USE member_db;
SELECT * FROM members;  -- *는 실무 사용 금지

-- 테이블 별명 (주로 조인/서브쿼리에서 필요)
SELECT m.mem_id, m.mem_name
FROM members m;

-- 중복 제거
SELECT DISTINCT addr FROM members;

-- WHERE 절: 조건 작성
SELECT mem_id, mem_name
FROM members
WHERE mem_id = '12345678';

SELECT mem_id, mem_name
FROM members
WHERE mem_name = '홍길동';

DROP DATABASE IF EXISTS company_db;
CREATE DATABASE IF NOT EXISTS company_db;

USE company_db; 

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE IF NOT EXISTS departments
(
    dept_id     INT NOT NULL AUTO_INCREMENT COMMENT '부서아이디',
    dept_name   VARCHAR(30) COMMENT '부서명',
    location    VARCHAR(50) COMMENT '위치',
    CONSTRAINT pk_dept PRIMARY KEY(dept_id)
) ENGINE=InnoDB COMMENT '부서';

CREATE TABLE IF NOT EXISTS employees
(
    emp_id      INT NOT NULL AUTO_INCREMENT COMMENT '사원아이디',
    dept_id     INT COMMENT '부서아이디',
    emp_name    VARCHAR(15) COMMENT '사원명',
    position    CHAR(10) COMMENT '직급',
    gender      CHAR(1) COMMENT '성별',
    hire_date   DATE COMMENT '입사일자',
    salary      INT COMMENT '연봉',
    CONSTRAINT pk_emp PRIMARY KEY(emp_id),
    CONSTRAINT fk_dept_emp FOREIGN KEY(dept_id) 
      REFERENCES departments(dept_id)
) ENGINE=InnoDB COMMENT '사원';

ALTER TABLE employees AUTO_INCREMENT = 1001;

INSERT INTO departments(dept_name, location) VALUES ('영업부', '대구');
INSERT INTO departments(dept_name, location) VALUES ('인사부', '서울');
INSERT INTO departments(dept_name, location) VALUES ('총무부', '대구');
INSERT INTO departments(dept_name, location) VALUES ('기획부', '서울');

INSERT INTO employees VALUES (NULL, 1, '구창민', '과장', 'M', '95-05-01', 5000000);
INSERT INTO employees VALUES (NULL, 1, '김민서', '사원', 'M', '17-09-01', 2500000);
INSERT INTO employees VALUES (NULL, 2, '이은영', '부장', 'F', '90-09-01', 5500000);
INSERT INTO employees VALUES (NULL, 2, '한성일', '과장', 'M', '93-04-01', 5000000);

-- WHERE 절 실습
SELECT emp_id FROM employees;

-- 대구에 있는 부서 조회하기
SELECT dept_name as 'Daegu location'
FROM departments
WHERE location = '대구';

-- 부서번호가 1이고, 급여가 3,000,000 이상인 사원 조회하기
SELECT emp_id, dept_id, emp_name, position, gender, hire_date, salary
FROM employees
WHERE dept_id = 1 and salary >= 3000000;

-- 급여가 3,000,000 ~ 5,000,000 사이인 사원 조회하기
SELECT emp_id, dept_id, emp_name, position, gender, hire_date, salary
FROM employees
WHERE salary BETWEEN 3000000 AND 5000000;

-- 직급이 '과장', '부장'인 사원 조회하기
SELECT emp_id, dept_id, emp_name, position, gender, hire_date, salary
FROM employees
WHERE position IN ('과장', '부장');

-- 직급이 '과장', '부장'이 아닌 사원 조회하기
SELECT emp_id, dept_id, emp_name, position, gender, hire_date, salary
FROM employees
WHERE position NOT IN ('과장', '부장');

-- 이름이 '한'으로 시작하는 사원 조회하기
SELECT emp_id, dept_id, emp_name, position, gender, hire_date, salary
FROM employees
WHERE emp_name LIKE '한%';

SELECT emp_id, dept_id, emp_name, position, gender, hire_date, salary
FROM employees
WHERE emp_name LIKE CONCAT('한', '%'); -- 내장함수

-- GROUP BY / HAVING 절
SELECT position, AVG(salary)
FROM employees
GROUP BY position;

-- 부서별 사원 수 조회하기 (부서에 일하는 사람이 없으면 출력안함)
SELECT dept_id, COUNT(*) -- 모든 칼럼 중 어느 한 칼럼이라도 값을 가지고 있으면 갯수에 포함
FROM employees
GROUP BY dept_id;

-- 직급이 과장인 사원 수 조회하기
SELECT position, COUNT(*)
FROM employees
WHERE position = '과장'
GROUP BY position;

-- 급여 평균이 5,000,000 이상인 직급과 급여 평균 조회하기
SELECT position, AVG(salary)
FROM employees
GROUP BY position
HAVING AVG(salary) >= 5000000;

-- ORDER BY / LIMIT 절

-- 높은 급여 순
SELECT emp_id, dept_id, emp_name, position, gender, hire_date, salary
FROM employees
ORDER BY salary DESC;

-- 가장 급여가 높은 사원
SELECT emp_id, dept_id, emp_name, position, gender, hire_date, salary
FROM employees
ORDER BY salary DESC
LIMIT 1; -- LIMIT 0, 1;
