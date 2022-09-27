create database bd_polar;
use bd_polar;

create table cliente(
id_cliente  int not null auto_increment,
nome varchar(20),
endereco varchar(20), 
pontoreferencia varchar(20),
nascimento date,
telefone float,
primary key(id_cliente)
);

create table pedido(
id_pedido int not null auto_increment,
telefone float,
id_entregador int,
statuspedido varchar(23),
taxa_entrega float,
data_pedido date,
primary key(id_pedido)
);

create table item_pedido(
id_itempedido int not null auto_increment,
id_marmita int,
id_pedido int,
qunatidade varchar(20),
primary key(id_itempedido)
);

create table marmita(
id_marmita int not null auto_increment,
nome varchar(22),
descricao varchar(30),
tamanho varchar(30),
valor float,
primary key (id_marmita)
);

create table empresa(
id_empresa int not null auto_increment,
nome varchar(20),
cnpj int,
email varchar (30),
telefone float,
endereco varchar(30),
primary key (id_empresa)
);

create table entregador (
id_entregador int not null auto_increment,
id_empresa int,
nome varchar(30),
cpf float,
rg float,
celular float,
primary key (id_entregador)
);

alter table pedido add column id_cliente int;
alter table pedido add constraint fk_cliente 
foreign key (id_cliente) references cliente(id_cliente);

alter table pedido add constraint fk_entregador 
foreign key (id_entregador) references entregador(id_entregador);

alter table entregador add constraint fk_empresa 
foreign key (id_empresa) references empresa(id_empresa);

alter table item_pedido add constraint fk_marmita 
foreign key (id_marmita) references marmita(id_marmita);

alter table item_pedido add constraint fk_pedido 
foreign key (id_pedido) references pedido(id_pedido);

desc pedido;
desc item_pedido;
desc marmita;
desc empresa;
desc entregador;

insert into cliente(nome,endereco, pontoreferencia,nascimento,telefone)
values('Samira','Randiosas','Prox do mercado','2000-12-13','41984934');

insert into pedido(telefone,statuspedido,taxa_entrega,data_pedido)
values('41983242','A fazer','12.50','2022-10-02');

insert into item_pedido(qunatidade)
values('2');


insert into marmita(nome, descricao,tamanho,valor)
values('marmitex','Com 2 pedacos de carne','grande', '25.50' );