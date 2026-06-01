USE company_db;

-- 평균 급여 이상을 받는 사원 조회
SELECT * FROM employees
WHERE salary > (SELECT AVG(salary) 
                             FROM employees);
                             
-- 중첩 서브쿼리(결과가 2개 이상인 다중 행 서브쿼리)
SELECT *
FROM employees
WHERE dept_id IN (SELECT dept_id
                                 FROM departments
                                 WHERE dept_name = '영업부' OR dept_name = '총무부');
