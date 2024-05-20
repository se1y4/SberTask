CREATE TABLE company (
    id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(50) NOT NULL,
    INDEX idx_company_name (company_name)
);

CREATE TABLE year_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    company_id INT NOT NULL,
    month_num INT NOT NULL,
    credit_limit DECIMAL(15, 2) NOT NULL,
    actual_credit DECIMAL(15, 2) NOT NULL,
    FOREIGN KEY (company_id) REFERENCES company(id),
    INDEX idx_company_id (company_id),
    INDEX idx_month_num (month_num)
);

INSERT INTO company (company_name) VALUES
    ('Company 1'),
    ('Company 2'),
    ('Company 3');

INSERT INTO year_data (month_num, credit_limit, actual_credit, company_id) VALUES
    (1, 50000.00, 41000.00, 1),
    (2, 50000.00, 42000.00, 1),
    (3, 50000.00, 43000.00, 1),
    (4, 50000.00, 44000.00, 1),
    (5, 50000.00, 45000.00, 1),
    (6, 50000.00, 46000.00, 1),
    (7, 50000.00, 47000.00, 1),
    (8, 50000.00, 48000.00, 1),
    (9, 50000.00, 49000.00, 1),
    (10, 50000.00, 50000.00, 1),
    (11, 50000.00, 44000.00, 1),
    (12, 50000.00, 43000.00, 1),

    (1, 40000.00, 41000.00, 2),
    (2, 39000.00, 50000.00, 2),
    (3, 50000.00, 4000.00, 2),
    (4, 50000.00, 44000.00, 2),
    (5, 30000.00, 50000.00, 2),
    (6, 50000.00, 46000.00, 2),
    (7, 50000.00, 47000.00, 2),
    (8, 50000.00, 48000.00, 2),
    (9, 50000.00, 49000.00, 2),
    (10, 50000.00, 50000.00, 2),
    (11, 50000.00, 44000.00, 2),
    (12, 50000.00, 43000.00, 2),

    (1, 20000.00, 50000.00, 3),
    (2, 50000.00, 11000.00, 3),
    (3, 50000.00, 34000.00, 3),
    (4, 60000.00, 43000.00, 3),
    (5, 70000.00, 45000.00, 3),
    (6, 10000.00, 46000.00, 3),
    (7, 54000.00, 47000.00, 3),
    (8, 50000.00, 48000.00, 3),
    (9, 50000.00, 60000.00, 3),
    (10, 50000.00, 50000.00, 3),
    (11, 50000.00, 44000.00, 3),
    (12, 50000.00, 43000.00, 3);
