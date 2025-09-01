create database Exercicio1;
use Exercicio1;


create table banco(
	codigo int not null primary key auto_increment,
    nome varchar(45)
);

create	table agencia(
	numero_agencia int not null auto_increment,
    cod_banco int not null,
    constraint primary key (numero_agencia, cod_banco),
    constraint fk_cod_banco foreign key(cod_banco) references banco(codigo)
);

create table conta(
	num_conta varchar(7) not null primary key,
    saldo float not null,
    tipo_conta int,
    num_agencia int,
    constraint fk_agencia foreign key (num_agencia) references agencia(numero_agencia)
	on delete cascade
    on update cascade
);

create table cliente(
	cpf varchar(14) primary key,
    nome varchar(45) not null,
    endereco varchar(100), 
    sexo char(1)	
);



create table telefone_cliente(
	cpf_cli varchar(14) not null,
    telefone varchar(20) not null,
    constraint primary key (cpf_cli, telefone),
    constraint  fk_tc_cliente foreign key (cpf_cli) references cliente(cpf)
);

create table historico(
	cpf varchar(14) not null,
    num_conta varchar(7) not null,
    data_inicio date,
    constraint fk_historico_cliente foreign key (cpf) references cliente(cpf),
    constraint fk_historico_conta foreign key (num_conta) references conta(num_conta)
);

insert into banco (nome, codigo) values
("Banco do Brasil", 1),
("CEF", 4);

alter table agencia add column endereço varchar(100);

insert into agencia (numero_agencia, endereço, cod_banco) values
(0562, "Rua Joaquim Teixeira Alves, 1555", 4),
(3153, "Ac. Marcelino Pires, 1960", 1);

insert into cliente (cpf, nome, sexo, endereco) values
("111.222.333-44", "Jennifer B Souza", "F", "Rua Cuiabá, 1050"),
("666.777.888-99", "Caetano K Lima", "M", "Rua Ivinhema, 879"),
("555.444.777-33", "Silvia Macedo", "F", "Rua Estados Unidos, 735");

insert into conta (num_conta, saldo, tipo_conta, num_agencia) values
("86340-2", "763.05", "2", "3153"),
("23584-7", "3879.12", "1", "0562");

insert into historico (cpf, num_conta, data_inicio) values 
("111.222.333-44", "23584-7", "1997-12-17"),
("666.777.888-99", "23584-7", "1997-12-17"),
("555.444.777-33", "86340-2", "2010-11-29");

insert into telefone_cliente (cpf_cli, telefone) values
("111.222.333-44", "(67)3422-7788"),
("666.777.888-99", "(67)3423-9900"),
("666.777.888-99", "(67)8121-8833");

alter table cliente add column email varchar(100);

select cpf, endereCo from cliente 
where nome like "C%";

update conta set num_agencia = '6342' where num_agencia = '0562';


