DROP SCHEMA IF EXISTS member_db;
CREATE SCHEMA member_db;

USE member_db;

CREATE TABLE  members (
        mem_id CHAR(8) NOT NULL  PRIMARY KEY,
        mem_name VARCHAR(10) NOT NULL,
        mem_number TINYINT NOT NULL,
        addr CHAR(2) NOT NULL,
        phone1 CHAR(3),
        phone2 CHAR(8),
        height TINYINT,
        debut_date DATE
);

CREATE TABLE visit_history (
        visit_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        mem_id CHAR(8),
        visited_at DATE,
        FOREIGN KEY(mem_id) REFERENCES members(mem_id)
                ON DELETE SET NULL
);

DROP TABLE IF EXISTS visit_history;
DROP TABLE IF EXISTS members;