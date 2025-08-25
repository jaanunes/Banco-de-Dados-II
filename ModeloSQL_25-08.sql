create database aula1;
use aula1;

create table livro(
cod_livro int not null auto_increment primary key,
isnb varchar(45) not null,
titulo varchar (45) not null,
num_edicao varchar (45),
preco float not null,
editora_cod_editora int not null,
foreign key (editora_cod_editora) references editora(cod_editora)
);

create table autor(
cod_autor int not null primary key,
nome varchar(45) not null,
sexo char, 
data_nascimento date not null
);

create table livro_autor(
	cod_livro int not null,
	cod_autor int not null,
	foreign key (cod_livro) references livro(cod_livro),
	foreign key (cod_autor) references autor(cod_autor)
);

alter table livro_autor add constraint livro_autor primary key(cod_livro, cod_autor);

-- 1
alter table editora rename column descricao to nome;

-- 2 
alter table autor modify sexo varchar(1);

-- 3
alter table livro add constraint unq_isnb unique (isnb);

-- 4
alter table livro modify preco float default 10.00;

-- 5
alter table livro drop column num_edicao;

alter table livro add column edicao int not null;

-- 6
create table grupo (
    id_grupo int primary key auto_increment not null,
    nome varchar(45) not null
);

alter table editora add column id_grupo int;

alter table editora add constraint foreign key fk_editora_grupo(id_grupo) references grupo(id_grupo)
on delete set null
on update cascade;



