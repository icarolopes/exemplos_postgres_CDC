select * from funcionarios;
select count(*) from funcionarios;

-- somando as colunas utilizando sum()
select venda_total total from vendas;
select sum(venda_total) from vendas;

-- calculando a média dos valores com avg()
select * from produtos;
select avg(produto_valor) from produtos;

-- valores máximos e mínimos de uma coluna com max() e min()
insert into produtos(produto_codigo, produto_nome, produto_valor, produto_situacao, data_criacao, data_atualizacao) values ('2832', 'SUCO DE LIMÃO', 15, 'C', '02/02/2016', '02/02/2016');
select * from produtos;
select max(produto_valor) maior_valor, min(produto_valor) menor_valor from produtos;

insert into vendas (
	id,
	funcionario_id,
	mesa_id,
	venda_codigo,
	venda_valor,
	venda_total,
	venda_desconto,
	venda_situacao,
	data_criacao,
	data_atualizacao
) values (
	10000,
	1,
	1,
	'10201',
	'51',
	'51',
	'0',
	'A',
	'01/01/2016',
	'01/01/2016'
);

insert into itens_vendas (
	produto_id,
	vendas_id,
	item_valor,
	item_quantidade,
	item_total,
	data_criacao,
	data_atualizacao
) values (
	4,
	10000,
	15,
	2,
	30,
	'01/01/2016',
	'01/01/2016'
);

insert into itens_vendas (
	produto_id,
	vendas_id,
	item_valor,
	item_quantidade,
	item_total,
	data_criacao,
	data_atualizacao
) values (
	3,
	10000,
	7,
	3,
	21,
	'01/01/2016',
	'01/01/2016'
);

insert into vendas (
	id,
	funcionario_id,
	mesa_id,
	venda_codigo,
	venda_valor,
	venda_total,
	venda_desconto,
	venda_situacao,
	data_criacao,
	data_atualizacao
) values (
	10001,
	1,
	1,
	'10201',
	'20',
	'20',
	'0',
	'A',
	'01/01/2016',
	'01/01/2016'
);

insert into itens_vendas(
	produto_id,
	vendas_id,
	item_valor,
	item_quantidade,
	item_total,
	data_criacao,
	data_atualizacao
) values (
	1,
	10001,
	10,
	2,
	20,
	'01/01/2016',
	'01/01/2016'
);


insert into vendas (
	id,
	funcionario_id,
	mesa_id,
	venda_codigo,
	venda_valor,
	venda_total,
	venda_desconto,
	venda_situacao,
	data_criacao,
	data_atualizacao
) values (
	10002,
	1,
	1,
	'10002',
	'45',
	'45',
	'0',
	'A',
	'01/01/2016',
	'01/01/2016'
);

insert into itens_vendas (
	produto_id,
	vendas_id,
	item_valor,
	item_quantidade,
	item_total,
	data_criacao,
	data_atualizacao
) values (
	4,
	10002,
	15,
	3,
	45,
	'01/01/2016',
	'01/01/2016'
);

select * from vendas;

select iv.item_valor, iv.item_quantidade, iv.item_total, v.venda_codigo, v.venda_total, v.venda_valor from itens_vendas iv inner join vendas v on iv.vendas_id = v.id;

select * from itens_vendas;

select produto_id, sum(item_total) from itens_vendas group by produto_id;

create or replace function
	retorna_nome_produto(prod_id int)
	returns text as
	$$
	declare 
		nome text;
	begin
		select produto_nome
			into nome
			from produtos
		where id = prod_id;
		return nome;
	end
	$$
	language plpgsql;

select retorna_nome_produto(produto_id) PRODUTO, sum(item_total) VL_TOTAL_PRODUTO from itens_vendas group by produto_id order by vl_total_produto desc, produto;

select * from itens_vendas;
select retorna_nome_produto(produto_id) PRODUTO, count(id) QTDE from itens_vendas group by produto_id;

select * from itens_vendas;
select  p.produto_name, iv.count(*) from itens_vendas iv where produto_id = (select id from produtos p where id = produto_id) group by produto_id;

select retorna_nome_produto(produto_id) PRODUTO,
	count(id) QTDE
	from itens_vendas
	group by produto_id
	having count(produto_id) >= 2
	order by qtde desc;

-- FUNÇÕES DE FORMATAÇÃO

-- converte tipo hora pra texto to_char(hora, formato)
select to_char(current_timestamp, 'HH12:MI:SS');

-- converte tipo data para texto
select to_char(current_date, 'DD/MM/YYYY');

-- converte tipo data/hora para texto
select to_char(current_timestamp, 'DD/MM/YYYY HH12:MI:SS');

-- converte numero do tipo inteiro para texto
select to_char(23232, '99999');

-- converte numero do tipo double/real para texto
select to_char(125.8::real, '999D9');

-- converte texto para data
select to_date('04 Nov 1988', 'DD MON YYYY');

-- converte texto para dados númerico
select to_number('5215.3', '99G999D9S');

-- converte tipo data/hora com fuso horário para texto
select to_timestamp('04 Nov 1988', 'DD Mon YYYY');