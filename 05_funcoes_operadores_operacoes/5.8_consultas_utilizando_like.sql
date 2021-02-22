insert into funcionarios (
	funcionario_codigo,
	funcionario_nome,
	funcionario_situacao,
	funcionario_comissao,
	funcionario_cargo,
	data_criacao
) values (
	'0100',
	'VINICIUS SOUZA',
	'A',
	'2',
	'GAR�OM',
	'01/03/2016'
);

insert into funcionarios (
	funcionario_codigo,
	funcionario_nome,
	funcionario_situacao,
	funcionario_comissao,
	funcionario_cargo,
	data_criacao
) values (
	'0101',
	'VINICIUS SOUZA MOLIN',
	'A',
	2,
	'GAR�OM',
	'01/03/2016'
);

insert into funcionarios(
	funcionario_codigo,
	funcionario_nome,
	funcionario_situacao,
	funcionario_comissao,
	funcionario_cargo,
	data_criacao
) values (
	'0102',
	'VINICIUS RANKEL C',
	'A',
	2,
	'GAR�OM',
	'01/03/2016'
);

insert into funcionarios(
	funcionario_codigo,
	funcionario_nome,
	funcionario_situacao,
	funcionario_comissao,
	funcionario_cargo,
	data_criacao
) values (
	'0103',
	'BATISTA SOUZA LUIZ',
	'A',
	2,
	'GAR�OM',
	'01/03/2016'
);

insert into funcionarios(
	funcionario_codigo,
	funcionario_nome,
	funcionario_situacao,
	funcionario_comissao,
	funcionario_cargo,
	data_criacao
) values ( 
	'0104',
	'ALBERTO SOUZA CARDOSO',
	'A',
	2,
	'GAR�OM',
	'01/03/2016'
);

insert into funcionarios(
	funcionario_codigo,
	funcionario_nome,
	funcionario_situacao,
	funcionario_comissao,
	funcionario_cargo,
	data_criacao
) values (
	'0105',
	'CARLOS GABRIEL ALMEIDA',
	'A',
	2,
	'GAR�OM',
	'01/03/2016'
);

insert into funcionarios(
	funcionario_codigo,
	funcionario_nome,
	funcionario_situacao,
	funcionario_comissao,
	funcionario_cargo,
	data_criacao
) values (
	'0106',
	'RENAN SIMOES SOUZA',
	'A',
	2,
	'GAR�OM',
	'01/03/2016'
);

select * from funcionarios;

select * from funcionarios where funcionario_nome ilike 'VINICIUS%';

select * from funcionarios where funcionario_nome ilike '%souza%';