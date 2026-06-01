USE company_db;

-- 사원아이디, 사원명, 부서명 조회하기
SELECT e.emp_id, e.emp_name, d.dept_name
    FROM departments d
   INNER JOIN employees e
         ON d.dept_id = e.dept_id;

-- 대구에 근무하는 사원 조회하기
/* 잘 못만든 테이블 */
SELECT e.emp_id, e.emp_name, e.position, e.gender, e.hire_date, e.salary, d.dept_id, d.dept_name, d.location
FROM employees e -- Drive Table
INNER JOIN departments d -- Driven Table
ON d.dept_id = e.dept_id
WHERE d.location = '대구';

/* 잘 만든 테이블 */
SELECT e.emp_id, e.emp_name, e.position, e.gender, e.hire_date, e.salary, d.dept_id, d.dept_name, d.location
FROM departments d -- 모수가 적은 테이블 배치 (PK로 데이터를 찾아서 성능 우수) / 1대다일 때 1
INNER JOIN employees e -- 1대다일 때 다
ON d.dept_id = e.dept_id
WHERE d.location = '대구';

-- 지역별로 근무중인 사원 수 조회하기
SELECT d.location AS Location, COUNT(*) AS NumberOfEmployees
FROM departments d
INNER JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.location;

-- 근무 중인 사원이 없는 부서도 함께 조회하기
SELECT e.emp_id, e.emp_name, d.dept_name
FROM departments d
LEFT OUTER JOIN employees e
ON d.dept_id = e.dept_id;

-- 부서별 사원 수 조회하기 (근무 중인 사원이 없으면 0으로 조회하기)
SELECT d.dept_name, COUNT(e.emp_id)
FROM departments d
LEFT OUTER JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.dept_name;