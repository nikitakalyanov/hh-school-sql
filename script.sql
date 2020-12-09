-- define tables

CREATE TABLE areas
(
    id	  serial  PRIMARY KEY,
    name  text
);

CREATE TABLE employers
(
    id 	     serial   PRIMARY KEY,
    name     text     NOT NULL,
    area_id	 integer  NOT NULL REFERENCES areas (id)
);

CREATE TABLE vacancies
(
    id	                serial 	   PRIMARY KEY,
    employer_id	        integer	   NOT NULL REFERENCES employers (id),
    position_name	    text	   NOT NULL,
    compensation_from   integer,
    compensation_to	    integer,
    compensation_gross  boolean,
    created_at		    timestamp  NOT NULL DEFAULT NOW(),
    updated_at		    timestamp  NOT NULL DEFAULT NOW(),
    deleted		        boolean    NOT NULL DEFAULT FALSE,
    deleted_at		    timestamp
);

CREATE TABLE cvs (
    id	     serial  PRIMARY KEY,
    content  jsonb   NOT NULL DEFAULT '{}'
);

CREATE TABLE job_applications
(
    id	        serial     PRIMARY KEY,
    cv_id       integer    NOT NULL REFERENCES cvs (id),
    vacancy_id  integer    NOT NULL references vacancies (id),
    created_at	timestamp  NOT NULL DEFAULT NOW(),
    updated_at	timestamp  NOT NULL DEFAULT NOW(),
    UNIQUE (cv_id, vacancy_id)
);

-- fill data
INSERT INTO areas (id, name) VALUES (1, 'Default City');
INSERT INTO areas (id, name) VALUES (2, 'Izumrudniy gorod');
INSERT INTO areas (id, name) VALUES (3, 'Los Santos');
INSERT INTO areas (id, name) VALUES (4, 'Innopolis');
INSERT INTO areas (id, name) VALUES (5, 'Zurich');

INSERT INTO employers (id, name, area_id) VALUES (1, 'CoolCompany Ltd.', 1);
INSERT INTO employers (id, name, area_id) VALUES (2, 'CoolCompany Ltd. (Izumrudniy gorod)', 2);
INSERT INTO employers (id, name, area_id) VALUES (3, 'HaCkEr$ Inc.', 1);
INSERT INTO employers (id, name, area_id) VALUES (4, 'E Corp.', 3);
INSERT INTO employers (id, name, area_id) VALUES (5, 'Lorep Inpsum Corp.', 3);
INSERT INTO employers (id, name, area_id) VALUES (6, 'DeeJays LLC', 4);
INSERT INTO employers (id, name, area_id) VALUES (7, 'Sample Ltd.', 5);
INSERT INTO employers (id, name, area_id) VALUES (8, 'NII Technologiy', 4);
INSERT INTO employers (id, name, area_id) VALUES (9, 'Gugel', 1);
INSERT INTO employers (id, name, area_id) VALUES (10, 'OOO "U Vasyana"', 1);
INSERT INTO employers (id, name, area_id) VALUES (11, 'IP Sidorov', 5);

INSERT INTO vacancies (id, employer_id, position_name, compensation_from, compensation_to, compensation_gross, created_at) VALUES (1, 1, 'Senior YAML Developer', 10000, 15000, TRUE, NOW());
INSERT INTO vacancies (id, employer_id, position_name, compensation_from, compensation_to, compensation_gross, created_at) VALUES (2, 2, 'Senior YAML Developer', 9000, 12000, FALSE, NOW()-make_interval(days => 1));
INSERT INTO vacancies (id, employer_id, position_name, compensation_from, compensation_to, compensation_gross, created_at) VALUES (3, 1, 'Junior YAML Developer', NULL, 10000, FALSE, NOW()-make_interval(days => 1));
INSERT INTO vacancies (id, employer_id, position_name, compensation_from, compensation_to, compensation_gross, created_at) VALUES (4, 5, 'QA Engineer', NULL, 14000, FALSE, NOW());
INSERT INTO vacancies (id, employer_id, position_name, compensation_from, compensation_to, compensation_gross, created_at) VALUES (5, 9, 'DevOps Engineer', 11000, NULL, TRUE, NOW()-make_interval(days => 3));
INSERT INTO vacancies (id, employer_id, position_name, compensation_from, compensation_to, compensation_gross, created_at) VALUES (6, 8, 'OpenSource Developer', NULL, 12500, FALSE, NOW()-make_interval(days => 5));
INSERT INTO vacancies (id, employer_id, position_name, compensation_from, compensation_to, compensation_gross, created_at) VALUES (7, 5, 'Junior YAML Developer', NULL, 10000, FALSE, NOW()-make_interval(days => 2));
INSERT INTO vacancies (id, employer_id, position_name, compensation_from, compensation_to, compensation_gross, created_at) VALUES (8, 11, 'Blue Team Engineer', NULL, 14000, TRUE, NOW());
INSERT INTO vacancies (id, employer_id, position_name, compensation_from, compensation_to, compensation_gross, created_at) VALUES (9, 1, 'Red Team Engineer', NULL, NULL, FALSE, NOW());
INSERT INTO vacancies (id, employer_id, position_name, compensation_from, compensation_to, compensation_gross, created_at) VALUES (10, 9, 'Principal YAML Architect', 25000, 50000, FALSE, NOW());
INSERT INTO vacancies (id, employer_id, position_name, compensation_from, compensation_to, compensation_gross, created_at) VALUES (11, 6, 'Junior DevOps Engineer', NULL, 11000, FALSE, NOW()-make_interval(days => 4));
INSERT INTO vacancies (id, employer_id, position_name, compensation_from, compensation_to, compensation_gross, created_at) VALUES (12, 1, 'Team Lead', NULL, 12000, FALSE, NOW());
INSERT INTO vacancies (id, employer_id, position_name, compensation_from, compensation_to, compensation_gross, created_at) VALUES (13, 2, 'Project Manager', 11000, 14000, TRUE, NOW()-make_interval(days => 5));
INSERT INTO vacancies (id, employer_id, position_name, compensation_from, compensation_to, compensation_gross, created_at) VALUES (14, 3, 'Project Manager', NULL, NULL, FALSE, NOW()-make_interval(days => 7));
INSERT INTO vacancies (id, employer_id, position_name, compensation_from, compensation_to, compensation_gross, created_at) VALUES (15, 4, 'Product Owner', 14000, NULL, FALSE, NOW()-make_interval(days => 5));
INSERT INTO vacancies (id, employer_id, position_name, compensation_from, compensation_to, compensation_gross, created_at) VALUES (16, 3, 'Tru Hacker', NULL, NULL, FALSE, NOW()-make_interval(days => 4));
INSERT INTO vacancies (id, employer_id, position_name, compensation_from, compensation_to, compensation_gross, created_at) VALUES (17, 8, 'ML/AI Researcher', 12000, NULL, FALSE, NOW()-make_interval(days => 3));
INSERT INTO vacancies (id, employer_id, position_name, compensation_from, compensation_to, compensation_gross, created_at) VALUES (18, 4, 'ML Engineer', NULL, 14000, FALSE, NOW()-make_interval(days => 1));
INSERT INTO vacancies (id, employer_id, position_name, compensation_from, compensation_to, compensation_gross, created_at) VALUES (19, 7, 'ML/CV Engineer', NULL, 14500, TRUE, NOW()-make_interval(days => 10));
INSERT INTO vacancies (id, employer_id, position_name, compensation_from, compensation_to, compensation_gross, created_at) VALUES (20, 4, 'IoT Engineer', NULL, 12000, FALSE, NOW()-make_interval(days => 7));
INSERT INTO vacancies (id, employer_id, position_name, compensation_from, compensation_to, compensation_gross, created_at) VALUES (21, 11, 'Super-Full-Stack Developer', 15000, 15000, FALSE, NOW()-make_interval(days => 8));


INSERT INTO cvs (id, content) VALUES (1, '{"experience": 500, "age":27}');
INSERT INTO cvs (id, content) VALUES (2, '{"experience": 490, "location": "Default City"}');
INSERT INTO cvs (id, content) VALUES (3, '{"technologies": ["framework1", "framework2", "framework3"]}');
INSERT INTO cvs (id, content) VALUES (4, '{"experience": 270, "age":21}');
INSERT INTO cvs (id, content) VALUES (5, '{"certifications": ["cert1", "cert2"]}');
INSERT INTO cvs (id, content) VALUES (6, '{"experience": 500, "age":27}');
INSERT INTO cvs (id, content) VALUES (7, '{"skills": ["debugging", "fixing", "testing"]}');
INSERT INTO cvs (id, content) VALUES (8, '{"experience": 9000, "desired_compensation": 100500}');
INSERT INTO cvs (id, content) VALUES (9, '{"extra": "I  have lactose intolerance, need lactose-free youghorts in the office plz"}');
INSERT INTO cvs (id, content) VALUES (10, '{"extra": "remote only"}');
INSERT INTO cvs (id, content) VALUES (11, '{"extra": "ready for relocation"}');
INSERT INTO cvs (id, content) VALUES (12, '{"extra": "plz click my spam link: http://totally-not-a-spam.com"}');
INSERT INTO cvs (id, content) VALUES (13, '{"skills": ["kopat''", "ne kopat''"]}');
INSERT INTO cvs (id, content) VALUES (14, '{"skills": ["write yaml manifests", "deploy k8s", "monitoring", "ci/cd"]}');
INSERT INTO cvs (id, content) VALUES (15, '{"hobbies": ["playing D&D"]}');
INSERT INTO cvs (id, content) VALUES (16, '{"experience": 350, "hobbies": ["compiling linux kernel"]}');

INSERT INTO job_applications (id, cv_id, vacancy_id, created_at) VALUES (1, 1, 5, GREATEST((SELECT created_at FROM vacancies WHERE id = 5), NOW()-make_interval(days => 3)));
INSERT INTO job_applications (id, cv_id, vacancy_id, created_at) VALUES (2, 1, 1, GREATEST((SELECT created_at FROM vacancies WHERE id = 1), NOW()-make_interval(days => 4)));
INSERT INTO job_applications (id, cv_id, vacancy_id, created_at) VALUES (3, 10, 21, GREATEST((SELECT created_at FROM vacancies WHERE id = 21), NOW()-make_interval(days => 2)));
INSERT INTO job_applications (id, cv_id, vacancy_id, created_at) VALUES (4, 8, 18, GREATEST((SELECT created_at FROM vacancies WHERE id = 18), NOW()-make_interval(days => 1)));
INSERT INTO job_applications (id, cv_id, vacancy_id, created_at) VALUES (5, 8, 4, GREATEST((SELECT created_at FROM vacancies WHERE id = 4), NOW()-make_interval(days => 1)));
INSERT INTO job_applications (id, cv_id, vacancy_id, created_at) VALUES (6, 3, 2, GREATEST((SELECT created_at FROM vacancies WHERE id = 2), NOW()-make_interval(days => 1)));
INSERT INTO job_applications (id, cv_id, vacancy_id, created_at) VALUES (7, 16, 7, GREATEST((SELECT created_at FROM vacancies WHERE id = 7), NOW()-make_interval(days => 8)));
INSERT INTO job_applications (id, cv_id, vacancy_id, created_at) VALUES (8, 4, 6, GREATEST((SELECT created_at FROM vacancies WHERE id = 6), NOW()-make_interval(days => 7)));
INSERT INTO job_applications (id, cv_id, vacancy_id, created_at) VALUES (9, 4, 5, GREATEST((SELECT created_at FROM vacancies WHERE id = 5), NOW()-make_interval(days => 3)));
INSERT INTO job_applications (id, cv_id, vacancy_id, created_at) VALUES (10, 7, 3, GREATEST((SELECT created_at FROM vacancies WHERE id = 3), NOW()-make_interval(days => 3)));
INSERT INTO job_applications (id, cv_id, vacancy_id, created_at) VALUES (11, 3, 3, GREATEST((SELECT created_at FROM vacancies WHERE id = 3), NOW()-make_interval(days => 5)));
INSERT INTO job_applications (id, cv_id, vacancy_id, created_at) VALUES (12, 2, 10, GREATEST((SELECT created_at FROM vacancies WHERE id = 10), NOW()-make_interval(days => 1)));
INSERT INTO job_applications (id, cv_id, vacancy_id, created_at) VALUES (13, 9, 10, GREATEST((SELECT created_at FROM vacancies WHERE id = 10), NOW()-make_interval(days => 1)));
INSERT INTO job_applications (id, cv_id, vacancy_id, created_at) VALUES (14, 11, 9, GREATEST((SELECT created_at FROM vacancies WHERE id = 9), NOW()-make_interval(days => 1)));
INSERT INTO job_applications (id, cv_id, vacancy_id, created_at) VALUES (15, 12, 8, GREATEST((SELECT created_at FROM vacancies WHERE id = 8), NOW()-make_interval(days => 4)));
INSERT INTO job_applications (id, cv_id, vacancy_id, created_at) VALUES (16, 13, 7, GREATEST((SELECT created_at FROM vacancies WHERE id = 7), NOW()-make_interval(days => 3)));
INSERT INTO job_applications (id, cv_id, vacancy_id, created_at) VALUES (17, 14, 11, GREATEST((SELECT created_at FROM vacancies WHERE id = 11), NOW()-make_interval(days => 2)));
INSERT INTO job_applications (id, cv_id, vacancy_id, created_at) VALUES (18, 1, 12, GREATEST((SELECT created_at FROM vacancies WHERE id = 12), NOW()-make_interval(days => 10)));
INSERT INTO job_applications (id, cv_id, vacancy_id, created_at) VALUES (19, 7, 14, GREATEST((SELECT created_at FROM vacancies WHERE id = 14), NOW()-make_interval(days => 3)));
INSERT INTO job_applications (id, cv_id, vacancy_id, created_at) VALUES (20, 5, 5, GREATEST((SELECT created_at FROM vacancies WHERE id = 5), NOW()-make_interval(days => 6)));


-- validate that every test application was created not earlier than the corresponding vacancy
SELECT
    bool_and(appl.created_at >= v.created_at) AS should_be_true_here
FROM job_applications appl
INNER JOIN vacancies v ON v.id = appl.vacancy_id;



-- 3
SELECT
    v.position_name,
    a.name,
    e.name
FROM vacancies v
INNER JOIN employers e ON v.employer_id = e.id
INNER JOIN areas a ON e.area_id = a.id
WHERE v.compensation_from IS NULL and v.compensation_to IS NULL
ORDER BY created_at DESC
LIMIT 10;

-- 4
-- get the 2 averages (one average for gross compensations and one average for net compensations) and remember their corresponding N's
WITH gross_net_avgs AS (
    SELECT
        AVG(compensation_from) AS min_avg,
        AVG(compensation_to) AS max_avg,
        AVG((compensation_to + compensation_from)/2) AS avg_avg,
        COUNT(compensation_from) AS from_n,
        COUNT(compensation_to) AS to_n,
        COUNT(compensation_to + compensation_from) AS to_from_n
    FROM vacancies
    WHERE compensation_gross IS TRUE
    UNION
    SELECT
        AVG(compensation_from/0.87) AS min_avg,
        AVG(compensation_to/0.87) AS max_avg,
        AVG((compensation_to + compensation_from)/2) AS avg_avg,
        COUNT(compensation_from) AS from_n,
        COUNT(compensation_to) AS to_n,
        COUNT(compensation_to + compensation_from) AS to_from_n
    FROM vacancies
    WHERE compensation_gross IS FALSE
)
-- here we reconstruct back the overall average using the 2 averages of two groups
SELECT
    SUM(min_avg*from_n)/SUM(from_n) AS min_avg,
    SUM(max_avg*to_n)/SUM(to_n) AS max_avg,
    SUM(avg_avg*to_from_n)/SUM(to_from_n) AS avg_avg
FROM gross_net_avgs;

-- 5
WITH employer_applications AS (
    SELECT
        e.name AS name,
        COUNT(*) AS n_applications
    FROM job_applications appl
    INNER JOIN vacancies v ON v.id = appl.vacancy_id
    INNER JOIN employers e ON e.id = v.employer_id
    GROUP BY v.employer_id, e.name
    ORDER BY n_applications DESC, name
)
SELECT
    name
FROM employer_applications
LIMIT 5;

-- 6
WITH n_vacancies AS (
    SELECT
        COUNT(*) AS n
    FROM vacancies v
    GROUP BY v.employer_id
)
SELECT
    percentile_cont(0.5) within group (order by n_vacancies.n) AS median
FROM n_vacancies;

-- 7
SELECT
    MIN(appl.created_at - v.created_at) AS min_time,
    MAX(appl.created_at - v.created_at) AS max_time,
    a.name AS city_name
FROM job_applications appl
INNER JOIN vacancies v ON v.id = appl.vacancy_id
INNER JOIN employers e ON v.employer_id = e.id
INNER JOIN areas a ON a.id = e.area_id
GROUP BY a.name;
