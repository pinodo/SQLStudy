USE sakila;

/*
film 테이블에서 rating이 'PG'이고 rental_rate가 2.99 이하인 영화의 title과 rental_rate를 조회하세요.
film(film_id, title, description, release_year, language_id, rental_duration, rental_rate, length, rating, ...)
*/
SELECT title, rental_rate
FROM film
WHERE rating = 'PG' 
    AND rental_rate <= 2.99
ORDER BY title;

/*
category 테이블과 film_category를 조인하여, 각 카테고리별 영화 수를 많은 순으로 조회하세요.
(카테고리명, 영화수)
 category(category_id, name) | film_category(film_id, category_id)
*/

SELECT c.name, COUNT(fc.film_id) AS film_count
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY c.category_id, c.name
ORDER BY film_count DESC;

/*
고객(customer) 이름과 그 고객이 대여한 영화 제목(film.title)을 조회하세요. 중간 테이블인 rental, inventory를 함께 활용하세요.
customer(customer_id, first_name, last_name) | rental(rental_id, customer_id, inventory_id) | inventory(inventory_id, film_id) | film(film_id, title)
*/
SELECT c.first_name, c.last_name, f.title
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
ORDER BY c.last_name, f.title;

/*
한 번도 대여되지 않은 영화의 film_id와 title을 조회하세요.
film(film_id, title) | inventory(inventory_id, film_id) | rental(rental_id, inventory_id)
*/
SELECT f.film_id, f.title
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.rental_id IS NULL;

/*
평균 rental_rate보다 높은 rental_rate를 가진 영화의 title과 rental_rate를 조회하세요.
film(film_id, title, rental_rate)
*/


/*
총 결제 금액(payment.amount 합계)이 150달러 이상인 고객의 customer_id와 합계 금액을 조회하세요.
payment(payment_id, customer_id, amount, payment_date)
*/


/*
각 카테고리에서 rental_rate가 가장 높은 영화의 title, rental_rate, 카테고리명을 조회하세요.
film(film_id, title, rental_rate) | film_category(film_id, category_id) | category(category_id, name)
*/


/*
각 고객별 결제 금액 기준으로 상위 3위까지의 결제 내역을 조회하세요. (customer_id, amount, 순위)
payment(payment_id, customer_id, amount, payment_date)
*/
