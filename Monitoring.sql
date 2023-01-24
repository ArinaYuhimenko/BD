create table students (id serial not null unique, 
note varchar(255),
sudent_number varchar(255) not null unique);
create table st_groups (id serial not null unique, 
year_of_formation date not null,
number_groups varchar(255) not null unique);
create table directions (id serial not null unique,
code_digits varchar(255) not null,
name_direction varchar(255) not null,
note varchar(255));
create table users(id serial not null unique,
first_name varchar(255) not null,
last_name varchar(255) not null,
middle_name varchar(255) not null,
email varchar(255) not null,
date_of_birth date not null,
gender varchar(255) not null);
create table projects (id serial not null unique,
prefix varchar(255) not null,
numbers_of_students int,
name_project varchar(255) not null,
link varchar(255),
note varchar(255));
create table curators (id serial not null unique, 
post varchar(255),
scientific_degree varchar(255),
users_id int not null references users (id));
create table potok (id serial not null unique,
semestr int not null,
year_p date not null);
create table current_resuts (id serial not null unique,
projects_id int not null references projects (id),
record text not null,
r_date date not null, 
potok_id int not null references potok (id));
create table registration (id serial not null unique,
students_id int not null references students (id),
projects_id int not null references projects (id),
note varchar(255),
potok_id int not null references potok (id));


alter table projects  add column curators_id int not null references curators (id);
alter table st_groups  add column directions_id int not null references directions (id);
alter table students  add column st_groups_id int not null references st_groups (id);
alter table students  add column users_id int not null references users (id);

insert into directions (code_digits, name_direction) values ('35', 'ATPP');
insert into directions (code_digits, name_direction) values ('7', 'Mehatronika');

insert into st_groups (year_of_formation, number_groups, directions_id) values ('2019-09-01', '11', 1);
insert into st_groups (year_of_formation, number_groups, directions_id) values ('2019-09-01', '12', 1);
insert into st_groups (year_of_formation, number_groups, directions_id) values ('2020-09-01', '99', 1);

insert into users (first_name, last_name, middle_name, email,  date_of_birth, gender) values ('Kotelnikov', 'Egor', 'Alekseevich', 'kotelnikovegor@mail.ru', '2000-02-14', 'male');
insert into users (first_name, last_name, middle_name, email, date_of_birth, gender) values ('Bezushko', 'Nazar', 'Andreevich', 'Bezushko21@mail.ru', '1999-03-20', 'male');
insert into users (first_name, last_name, middle_name, email, date_of_birth, gender) values ('Trefilof', 'Alexander', 'Andreevich', 'TrefilofAlex@mail.ru', '1999-10-20', 'male');
insert into users (first_name, last_name, middle_name, email, date_of_birth, gender) values ('Petrovich', 'Ekaterina', 'Victorovna', 'PetrovichE18@mail.ru', '2001-10-21', 'female');
insert into users (first_name, last_name, middle_name, email, date_of_birth, gender) values ('Agaeva', 'Elvira', 'Andreevna', 'Agaeva051@mail.ru', '1986-02-20', 'female');
insert into users (first_name, last_name, middle_name, email, date_of_birth, gender) values ('Lisakov', 'Andrei', 'Vladimirovich', 'Lisakov01@mail.ru', '1975-01-05', 'male');
insert into users (first_name, last_name, middle_name, email, date_of_birth, gender) values ('Tihonov', 'Igor', 'Nicolaevich', 'TihonovIgor5105@mail.ru', '1950-01-23', 'male');

insert into students (note, sudent_number, st_groups_id, users_id) values ('NMT-193511', '53904201', 1, 1);
insert into students (note, sudent_number, st_groups_id, users_id) values ('NMT-193511', '53904216', 1, 2);
insert into students (note, sudent_number, st_groups_id, users_id) values ('NMT-193511', '53904207', 1, 3);
insert into students (note, sudent_number, st_groups_id, users_id) values ('NMT-193511', '53904204', 1, 4);


insert into curators (post, scientific_degree, users_id) values ('teacher electronics', 'doctor of science', 5);
insert into curators (post, scientific_degree, users_id) values ('teacher modeling', 'doctor of science', 6);
insert into curators (post, scientific_degree, users_id) values ('head_of_departament', 'doctor of science', 7);

insert into potok (semestr, year_p) values ('1', '2019-09-01');
insert into potok (semestr, year_p) values ('2', '2019-09-01');
insert into potok (semestr, year_p) values ('1', '2020-09-01');

insert into projects (prefix, numbers_of_students, name_project, curators_id) values ('A2-01', 3, 'Доработка сборочного чертежа изделия «Корпус» и разработка чертежей деталей по действующим стандартам.', 2);
insert into projects (prefix, numbers_of_students, name_project, curators_id) values ('A2-03', 2, 'Переработка чертежа со стандарта DIN ISO и выполнение сборочного чертежа изделия «Муфта» и чертежей деталей в соответствии со стандартами ЕСКД.', 1);
insert into projects (prefix, numbers_of_students, name_project, curators_id) values ('A2-02', 2, 'Доработка сборочного чертежа изделия «Приспособление для фрезерования» и разработка чертежей деталей по действующим стандартам.', 1);
insert into projects (prefix, numbers_of_students, name_project, curators_id) values ('A2-04', 3, 'Доработка сборочного чертежа изделия «Приспособление для шлифования» и разработка чертежей деталей по действующим стандартам.', 1);

insert into current_resuts (projects_id, record, r_date, potok_id) values (3, 'Nachalo', '2023-01-10', '1');
insert into registration (students_id, projects_id, potok_id) values (1, 2, 1);
insert into registration (students_id, projects_id, potok_id) values (2, 2, 1);
insert into registration (students_id, projects_id, potok_id) values (3, 3, 1);
insert into registration (students_id, projects_id, potok_id) values (4, 3, 1);

select * from students;
select first_name, last_name from users;
 
update projects set link = 'https://teamproject.urfu.ru/#/' where id = 3;
select u.first_name, u.last_name, u.middle_name, c.post, c.scientific_degree from users u join curators c on c.users_id = u.id;
delete from projects where id = 5;

create view curator_view as select u.first_name, u.last_name, u.middle_name, c.post, c.scientific_degree from users u join curators c on c.users_id = u.id;
select*from curator_view;

create view students_view as select u.first_name, u.last_name, u.middle_name, u.email, s.note, p.name_project from users u join students s on s.users_id = u.id join registration r on r.students_id = s.id join projects p on r.projects_id = p.id;
select*from students_view;

CREATE OR REPLACE PROCEDURE add_users
(
  add_id INT,
  add_first_name VARCHAR(255),
  add_last_name VARCHAR(255),
  add_middle_name VARCHAR(255),
  add_email VARCHAR(255),
  add_date_of_birth date,
  add_gender VARCHAR(255)
)
LANGUAGE plpgsql AS
$$
BEGIN 
  IF not exists (SELECT email FROM users join add_users on  WHERE email = add_email) THEN
    INSERT INTO users (first_name, last_name, middle_name, email, date_of_birth, gender)
    VALUES (add_first_name, add_last_name, add_middle_name, add_email, add_date_of_birth, add_gender)
    RETURNING id INTO add_id;
  ELSE
    RAISE NOTICE 'Данный пользователь уже существует';
  END IF;
END
$$;

call add_users (8, 'Petrov', 'Petr', 'Petrovich', 'Petrov15151@urfu.me', '2000-09-05', 'male');
call add_users (1, 'yuhimenko', 'arina', 'Nicolaevich', 'TihonovIgor5105@mail.ru', '1950-01-23', 'male');

   
insert into users (first_name, last_name, middle_name, email, date_of_birth, gender) values ('Oparin', 'Daniil', 'Vyacheslavovich', 'DaniilLink018@mail.ru', '1998-09-05', 'male');
insert into students (note, sudent_number, st_groups_id, users_id) values ('NMT-193511', '53905603', 1, 9);
insert into registration (students_id, projects_id, potok_id) values (5, 3, 1);
insert into students (note, sudent_number, st_groups_id, users_id) values ('NMT-193511', '53908974', 1, 8);
insert into registration (students_id, projects_id, potok_id) values (8, 3, 1);


--update projects p
--set numbers_of_students =
--(select count (projects_id) as kol from registration r
--where p.id=r.projects_id);

CREATE OR REPLACE FUNCTION process_projects() RETURNS TRIGGER AS $process_projects$
    BEGIN
        IF (TG_OP = 'DELETE') THEN
            update projects p
set numbers_of_students =
(select count (projects_id) as kol from registration r
where p.id=r.projects_id);
        ELSIF (TG_OP = 'UPDATE') THEN
            update projects p
set numbers_of_students =
(select count (projects_id) as kol from registration r
where p.id=r.projects_id);
        ELSIF (TG_OP = 'INSERT') THEN
          update projects p
set numbers_of_students =
(select count (projects_id) as kol from registration r
where p.id=r.projects_id);
        END IF;
        RETURN NULL;
    END;
$process_projects$ LANGUAGE plpgsql;

CREATE TRIGGER process_projects
AFTER INSERT OR UPDATE OR DELETE ON registration
    FOR EACH ROW EXECUTE PROCEDURE process_projects();

CREATE ROLE ADMIN;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA PUBLIC TO ADMIN;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA PUBLIC TO ADMIN;
GRANT ALL PRIVILEGES ON ALL PROCEDURES IN SCHEMA PUBLIC TO ADMIN;
GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA PUBLIC TO ADMIN;

CREATE ROLE Curator;
GRANT ALL PRIVILEGES ON TABLE projects  TO Curator;
GRANT ALL PRIVILEGES ON TABLE registration  TO Curator;
GRANT SELECT ON ALL TABLES IN SCHEMA PUBLIC TO Curator;

CREATE ROLE Students;
GRANT ALL PRIVILEGES ON TABLE current_resuts  TO Students;


insert into registration (students_id, projects_id, potok_id) values (5, 1, 1);