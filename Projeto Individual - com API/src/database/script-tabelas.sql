-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!
/* para workbench - local - desenvolvimento */
create database HiPlay;
use HiPlay;

create table usuario (
id int primary key auto_increment,
nome varchar(50),
email varchar(100),
senha varchar(45),
fkvotacao int,
foreign key (fkvotacao) references Votacao (idvotacao)
);

insert into usuario values
(null, 'kaique', 'kaique@sptech.school', '2904', 9),
(null, 'hilary', 'hilary@sptech.school', '123', 1),
(null, 'ezequiel', 'ezequiel@sptech.school', '0907', 6),
(null, 'vitinho', 'vitinho@sptech.school', 'magodohtml', 2),
(null, 'marco', 'marco@sptech.school', 'marcopolo', 3),
(null, 'rafa', 'raf@sptech.school', 'rafabd', 2);



create table votacao (
idvotacao int primary key auto_increment,
nomegenero varchar (20)
); 

insert into votacao values
(null, 'Pop'),
(null, 'Rock'),
(null, 'Rap'),
(null, 'R&B'),
(null, 'Sertanejo'),
(null, 'Eletrônica'),
(null, 'Funk'),
(null, 'Pagode/Samba'),
(null, 'K-pop'),
(null, 'Outros');

select * from usuario;
select * from votacao;

select id, nome, email, senha, fkvotacao, nomegenero from usuario, votacao where fkvotacao = idvotacao;

select nomegenero, count(fkvotacao) Qtd_de_Votos from usuario, votacao where fkvotacao = idvotacao group by fkvotacao;

'Pop'
'Rock'
'Rap'
'R&B'
'Sertanejo'
'Eletrônica'
'Funk'
'Pagode/Samba'
'K-pop'
'Outros'