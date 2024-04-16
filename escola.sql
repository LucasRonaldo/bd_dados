drop database if exists sala_de_aula;


create database sala_de_aula;

use sala_de_aula;

-- criando tabela alunos
create table alunos (
	id int not null auto_increment,
	nome varchar(120) not null,
	dt_nascimento date not null,
	endereco varchar(120) not null ,
	rm int(11) not null unique,
	primary key(id)
);

-- criando tabela professores
create table professores(
id int not null auto_increment,
nome varchar(120) not null,
ra int(11) not null unique,
especialidade varchar(45),
grau_academico varchar(45),
primary key(id)
);

-- criando tabela disciplinas
create table disciplinas(
id int not null auto_increment,
nome varchar(120),
professor_id int  null,
ra int(8) null unique,
primary key(id),
constraint fk_professor_disciplina
foreign key (professor_id)
references professores (id)
);


-- criando tabela disciplinas
create table alunos_has_disciplinas(
alunos_id int not null,
disciplina_id int not null,
primary key (alunos_id,disciplina_id),
constraint fk_alunos_disciplinas
foreign key (alunos_id)
references alunos (id),
constraint fk_disciplinas_alunos
foreign key (disciplina_id)
references disciplinas (id)
);

-- criando tabela notas
create table notas (
id int not null auto_increment,
disciplina_id int not null,
aluno_id int not null,
notas decimal(5,1) not null,
primary key (id),
constraint fk_alunos_disciplina
foreign key (aluno_id)
references alunos (id),
constraint fk_disciplinas_aluno
foreign key (disciplina_id)
references disciplinas (id)
);

-- cadastrando alunos: 20

INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno', 'Rua amazonara', '2005-03-04 ', 10101560);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno1', 'Rua cuiaba', '2005-03-04 ', 101010);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno2', 'Rua cuaiba', '2005-03-04 ', 1021010);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno3', 'Rua general', '2001-03-04 ', 1013010);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno4', 'Rua general', '2001-03-04 ', 1010410);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno6', 'Rua bau de ouro', '2000-03-04 ', 1010150);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno7', 'Rua bau de ouro', '2000-03-04 ', 1010106);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno8', 'Rua camis', '2000-03-04 ', 10101506);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno9', 'Rua camis', '2000-03-04 ', 10101110);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno10', 'Rua camis', '2000-03-04 ', 10101120);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno11', 'Rua felipinas', '2000-03-04 ', 10101450);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno12', 'Rua felipinas', '2000-03-04 ', 10101078);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno13', 'Rua felipinas', '2000-03-04 ', 10101000);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno14', 'Rua felipinas', '2000-03-04 ', 10101013);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno15', 'Rua felipinas', '2000-03-04 ', 10101044);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno16', 'Rua felipinas', '2010-03-04 ', 10101018);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno17', 'Rua felipinas', '1999-03-04 ', 10101023);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno18', 'Rua felipinas', '1980-03-04 ', 10101021);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno19', 'Rua felipinas', '1980-03-04 ', 1013110);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno20', 'Rua felipinas', '1980-03-04 ', 1450102120);
  
-- selecionado todos os alunos
select nome,endereco , dt_nascimento , rm  from alunos  ;

-- cadastrando professores: 4

insert into professores (nome, ra, grau_academico, especialidade) values('Alek', 021390, 'Doutorado', 'php');
insert into professores (nome, ra, grau_academico, especialidade) values('Claudio', 020390, 'formado em android studio', 'typescript');
insert into professores (nome, ra, grau_academico, especialidade) values('André', 12221390, 'formado em pancadaria', 'saco de pancada');

insert into professores (nome, ra, grau_academico, especialidade) values('Lucas', 12221500, 'doutorado', 'artes cenicas');


-- selecionando todos os professores
select id, nome, ra, grau_academico , especialidade  from professores p ;

-- cadastrando as disciplinas:5
insert into disciplinas (nome,ra,professor_id) values ('fisica',100100,1);
insert into disciplinas (nome,ra,professor_id) values ('quimica',100101,3);
insert into disciplinas (nome,ra,professor_id) values ('matematica',100102,2);
insert into disciplinas (nome,ra,professor_id) values ('artes',100103,2);
insert into disciplinas (nome,ra,professor_id) values ('historia',100104,1);
insert into disciplinas (nome,ra,professor_id) values ('robotica',100600, null);

-- selecinando todos as disciplinas
select id, nome, professor_id, ra from disciplinas ;

-- adicionando alunos para a disciplina de Quimica
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (1, 2);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (2, 2);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (3, 2);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (4, 2);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (5, 2);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (6, 2);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (7, 2);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (8, 2);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (9, 2);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (10, 2);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (12, 2);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (13, 2);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (14, 2);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (15, 2);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (16, 2);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (17, 2);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (18, 2);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (19, 2);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (20, 2);

-- adicionando alunos para a disciplina de Artes
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (1, 4);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (2, 4);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (3, 4);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (4, 4);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (5, 4);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (6, 4);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (7, 4);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (8, 4);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (9, 4);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (10, 4);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (12, 4);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (13, 4);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (14, 4);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (15, 4);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (16, 4);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (17, 4);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (18, 4);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (19, 4);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (20, 4);

-- adicionando em Matematica
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (1, 3);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (2, 3);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (3, 3);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (4, 3);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (5, 3);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (6, 3);

-- adicionando em Fisica
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (1, 1);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (2, 1);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (3, 1);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (4, 1);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (5, 1);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (6, 1);

-- adicionando em historia
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (1, 5);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (2, 5);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (3, 5);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (4, 5);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (5, 5);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (6, 5);






-- Adicionando notas para os alunos na disciplina de Artes
INSERT INTO notas (aluno_id, disciplina_id, notas) VALUES
(1, 4, 9.5),
(2, 4, 9.8),
(3, 4, 9.9),
(4, 4, 9.3),
(5, 4, 9.5),
(6, 4, 9.2),
(7, 4, 9.9),
(8, 4, 9.5),
(9, 4, 9.0),
(10, 4, 9.7),
(12, 4, 9.8),
(13, 4, 9.1),
(14, 4, 9.3),
(15, 4, 9.6),
(16, 4, 8.2),
(17, 4, 7.4),
(18, 4, 6.7),
(19, 4, 9.2),
(20, 4, 7.6);


-- Adicionando notas para os alunos na disciplina de Matemática
INSERT INTO notas (aluno_id, disciplina_id, notas) VALUES
(1, 3, 8.5),
(2, 3, 7.8),
(3, 3, 6.9),
(4, 3, 9.3),
(5, 3, 6.5),
(6, 3, 7.2),
(7, 3, 8.9),
(8, 3, 5.5),
(9, 3, 8.0),
(10,3, 7.7),
(12, 3, 6.8),
(13, 3, 9.1),
(14, 3, 7.3),
(15, 3, 8.6),
(16, 3, 8.2),
(17, 3, 7.4),
(18, 3, 6.7),
(19, 3, 9.2),
(20, 3, 7.6);


-- Adicionando notas para os alunos na disciplina de Quimica
INSERT INTO notas (aluno_id, disciplina_id, notas) VALUES
(1, 2, 8.5),
(2, 2, 7.8),
(3, 2, 6.9),
(4, 2, 9.3),
(5, 2, 6.5),
(6, 2, 7.2),
(7, 2, 8.9),
(8, 2, 5.5),
(9, 2, 8.0),
(10, 2, 7.7),
(12, 2, 6.8),
(13, 2, 9.1),
(14, 2, 7.3),
(15, 2, 8.6),
(16, 2, 8.2),
(17, 2, 7.4),
(18, 2, 6.7),
(19, 2, 9.2),
(20, 2, 7.6);


-- Adicionando notas para os alunos na disciplina de Fisica
INSERT INTO notas (aluno_id, disciplina_id, notas) VALUES
(1, 1, 8.5),
(2, 1, 7.8),
(3, 1, 6.9),
(4, 1, 9.3),
(5, 1, 6.5),
(6, 1, 7.2),
(7, 1, 8.9),
(8, 1, 5.5),
(9, 1, 8.0),
(10,1, 7.7),
(12, 1, 6.8),
(13, 1, 9.1),
(14, 1, 7.3),
(15, 1, 8.6),
(16, 1, 8.2),
(17, 1, 7.4),
(18, 1, 6.7),
(19, 1, 9.2),
(20, 1, 7.6);

-- Adicionando notas para os alunos na disciplina de Fisica
INSERT INTO notas (aluno_id, disciplina_id, notas) VALUES
(1, 5, 8.5),
(2, 5, 7.8),
(3, 5, 6.9),
(4,5, 9.3),
(5, 5, 6.5),
(6, 5, 7.2),
(7, 5, 8.9),
(8, 5, 5.5),
(9, 5, 8.0),
(10,5, 7.7),
(12, 5, 6.8),
(13, 5, 9.1),
(14, 5, 7.3),
(15, 5, 8.6),
(16, 5, 8.2),
(17, 5, 7.4),
(18, 5, 6.7),
(19, 5, 9.2),
(20, 5, 7.6);


-- 1. Selecionar alunos matriculados em uma disciplina específica exemplo disciplina de matemática.
select a.nome
from alunos a
inner join alunos_has_disciplinas ad ON a.id = ad.alunos_id
inner join disciplinas d on ad.disciplina_id = d.id
where d.nome = 'matematica';

-- 2. Selecionar professor de uma disciplina específica.
select p.nome
from professores p
inner join disciplinas d on p.id = d.professor_id
where d.nome = 'historia';

-- 3. Selecionar todos os alunos e mostrar em quais disciplinas os alunos estão cadastrados.
select a.nome, d.nome as disciplina
from alunos a
inner join alunos_has_disciplinas ad on a.id = ad.alunos_id
inner join disciplinas d on ad.disciplina_id = d.id;

-- 4. Selecionar notas dos alunos em uma disciplina específica, exibir a nota, nome do aluno e a disciplina.
select a.nome as aluno, d.nome as disciplina, n.notas
from alunos a
inner join notas n on a.id = n.aluno_id
inner join disciplinas d on n.disciplina_id = d.id
where d.nome = 'matematica';

-- 5. Selecionar alunos que têm notas superiores ou igual a um determinado valor, exibir os campos nome do aluno, disciplina e a nota (por exemplo quando a nota for superior ou igual a 7).
select a.nome as aluno, d.nome as disciplina, n.notas
from alunos a
inner join notas n on a.id = n.aluno_id
inner join disciplinas d on n.disciplina_id = d.id
where n.notas >= 7;

-- 6. Selecionar alunos que têm notas superiores ou igual a um determinado valor em uma disciplina específica (por exemplo, com código de disciplina 'MAT101' e nota superior a 7).
select a.nome as aluno, d.nome as disciplina, n.notas
from alunos a
inner join notas n on a.id = n.aluno_id
inner join disciplinas d on n.disciplina_id = d.id
where d.ra = 100101 and n.notas > 7;

-- 7. Selecionar alunos que têm notas superiores a um determinado valor em uma disciplina específica (por exemplo, com código de disciplina 'MAT101' e nota superior a 7).
select a.nome as aluno, d.nome as disciplina, n.notas
from alunos a
inner join notas n on a.id = n.aluno_id
inner join disciplinas d on n.disciplina_id = d.id
where d.nome = 'matematica' and n.notas > 7;

-- 8. Selecionar alunos que têm notas inferior a um determinado valor, exibir os campos nome do aluno, disciplina e a nota (por exemplo quando a nota for inferior a 7).
select a.nome as aluno, d.nome as disciplina, n.notas
from alunos a
inner join notas n on a.id = n.aluno_id
inner join disciplinas d on n.disciplina_id = d.id
where n.notas < 7;

-- 9. Selecionar alunos com base em sua data de nascimento (por exemplo, alunos nascidos após 2000).
select nome
from alunos
where year(dt_nascimento) > 2000;

-- 10. Selecionar disciplinas que não têm notas registradas (Para garantir que todos os alunos tenham suas notas registradas, é necessário identificar as disciplinas em que as notas ainda não foram registradas.
select d.nome as disciplina
from disciplinas d
LEFT JOIN notas n on d.id = n.disciplina_id
where n.id is null;

-- 11. Selecionar alunos com base na especialidade do professor que ministra a disciplina em que estão matriculados (O departamento de orientação acadêmica deseja identificar os alunos matriculados em disciplinas ministradas por professores especializados em uma determinada área, como "Geografia". 
select a.nome
from alunos a
inner join alunos_has_disciplinas ad on a.id = ad.alunos_id
inner join disciplinas d on ad.disciplina_id = d.id
inner join professores p on d.professor_id = p.id
where p.especialidade = 'typescript';

 -- 12. Selecionar alunos matriculados em disciplinas ministradas por professores com um determinado grau acadêmico (por exemplo, todos os alunos matriculados em disciplinas ministradas por professores com doutorado, O departamento de planejamento acadêmico deseja identificar os alunos matriculados em disciplinas ministradas por professores que possuem doutorado. 
select a.nome
from alunos a
inner join alunos_has_disciplinas ad on a.id = ad.alunos_id
inner join disciplinas d on ad.disciplina_id = d.id
inner join professores p on d.professor_id = p.id
where p.grau_academico = 'Doutorado';

 -- 13. Selecionar disciplinas que não têm professores atribuídos utilizando LEFT JOIN (Para otimizar a alocação de recursos, é necessário identificar quais disciplinas ainda não têm professores atribuídos.
select d.nome as disciplina
from disciplinas d
LEFT JOIN professores p on d.professor_id = p.id
where p.id is NULL;

-- 14. Calcule o número total de alunos matriculados na disciplina de Matemática Avançada.

select  count(a.nome) as total_matriculados
from alunos a
inner join alunos_has_disciplinas ad ON a.id = ad.alunos_id
inner join disciplinas d on ad.disciplina_id = d.id
where d.nome = 'fisica';

-- 15. Determine a soma total das notas dos alunos na disciplina de Física.

select sum(n.notas) as soma_total
from alunos a
inner join notas n on a.id = n.aluno_id
inner join disciplinas d on n.disciplina_id = d.id
where d.nome = 'fisica' and n.notas is not null;

-- 16. Encontre a maior nota alcançada por um aluno na disciplina de História.


select max(n.notas) as maior_nota
from alunos a
inner join notas n on a.id = n.aluno_id
inner join disciplinas d on n.disciplina_id = d.id
where d.nome = 'historia' ;

-- 17. Descubra a menor nota obtida por um aluno na disciplina de Química.

select min(n.notas) as menor_nota
from alunos a
inner join notas n on a.id = n.aluno_id
inner join disciplinas d on n.disciplina_id = d.id
where d.nome = 'quimica' ;

-- 18. . Calcule a média das notas dos alunos na disciplina de Biologia.

select avg(n.notas) as menor_nota
from alunos a
inner join notas n on a.id = n.aluno_id
inner join disciplinas d on n.disciplina_id = d.id
where d.nome = 'artes' ;

-- 19. Conte quantos alunos estão matriculados em cada disciplina. 
select d.nome as disciplina, count(ad.alunos_id) 
as quantidade_alunos 
from alunos_has_disciplinas ad 
inner join disciplinas d on ad.disciplina_id = d.id 
group by d.nome;



-- 20.Calcule a soma total das notas de todos os alunos em todas as disciplinas.

select sum(notas) as total from notas n; 



-- 21. Determine a maior nota entre todos os alunos em todas as disciplinas.

select max(notas) as maior_nota from notas where disciplina_id;



-- 22. Descubra a menor nota entre todos os alunos em todas as disciplinas.

select min(notas) as menor_nota from notas where disciplina_id;



-- 23. Calcule a média das notas de todos os alunos em todas as disciplinas

select avg(notas) as media_nota from notas where disciplina_id;



-- 24. Liste todas as disciplinas e a média das notas de cada disciplina.


select  d.nome, avg(notas) as media_de_notas
from notas n
inner join disciplinas d on n.disciplina_id = d.id
group by d.nome ;



-- 25.Liste a disciplinas, alunos e a média, realize a ordenação de disciplina e aluno por ordem crescente.

select d.nome, a.nome, avg(notas) as media_de_notas from notas n
inner join disciplinas d on n.disciplina_id = d.id
inner join alunos a on n.notas = a.id 
group by d.nome, a.nome order by media_de_notas asc;



-- 26. Liste a disciplinas, alunos e a média, realize a ordenação de disciplina por ordem crescente e a média em ordem decrescente

select d.nome, a.nome, avg(notas) as media_de_notas from notas n
inner join disciplinas d on n.disciplina_id = d.id
inner join alunos a on n.notas = a.id 
group by d.nome, a.nome order by media_de_notas desc;



-- 27. Liste as 5 menores notas da disciplina de História, exibir o nome do aluno e a nota.

select a.nome , n.notas as menor_nota_historia from notas n 
inner join alunos a on n.notas = a.id
where disciplina_id = 3
order by menor_nota_historia asc limit 5;



-- 28. Liste as 3 maiores médias da disciplina de Química, exibir o nome do aluno e a média.


	select d.id, a.nome, avg(notas) as media_nota_quimica from notas n 
	inner join alunos a on n.aluno_id = a.id
	inner join disciplinas d on n.disciplina_id = d.id
	where d.nome = 'quimica'
	group by d.id, a. nome
	order by media_nota_quimica desc limit 3;



-- 29. Liste as 10 maiores médias, exibir nome da disciplina, nome do aluno e a média. Obs. Deve considerar todas as disciplinas.


SELECT a.nome AS aluno,avg(n.notas) AS media from notas n
join alunos a on n.aluno_id = a.id
join disciplinas d on n.disciplina_id = d.id
group by a.nome 
order by media desc limit 10;







-/*  30. Conte quantos alunos ativos tem cadastrado na escola. Para saber se o aluno esta 

ativo ele deve estar matriculado em alguma disciplina caso o aluno não esteja 
matricula em uma disciplina ele é considerado inativo*/

select count(distinct  a.id) AS numero_de_alunos_ativos from alunos a
join aluno_disciplina ad ON a.id = ad.aluno_id;
























































select * from notas








