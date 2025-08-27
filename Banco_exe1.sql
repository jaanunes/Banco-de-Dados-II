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
);

create table cliente(
	cpf varchar(14) primary key,
    nome varchar(45) not null,
    endereco varchar(100), 
    sexo char(1)	
);

drop table agencia;

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



