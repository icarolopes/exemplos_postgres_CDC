-- criando uma consulta relacionado duas tabelas com join
select distinct funcionario_nome 
	from funcionarios, vendas
	where funcionarios.id = vendas.funcionario_id
	order by funcionario_nome;


select distinct funcionario_nome from funcionarios, vendas order by funcionario_nome;

select distinct funcionario_nome
	from funcionarios
	inner join vendas
	on (funcionarios.id = vendas.funcionario_id)
	order by funcionario_nome;

select distinct funcionario_nome
	from funcionarios f
	join vendas v
	on (f.id = v.funcionario_id)
	order by funcionario_nome;

select funcionario_nome, v.id
	from funcionarios f
	left join vendas v
	 on f.id = v.funcionario_id 
	order by funcionario_nome desc;

select v.id, v.venda_total, funcionario_nome from vendas v
	right join funcionarios f
	on v.funcionario_id = f.id
	order by v.venda_total;



create or replace view vendas_do_dia as 
	select distinct produto_nome,
		sum(v.venda_total)
	from produtos p, itens_vendas iv, vendas v
	where p.id = iv.produto_id and v.id = iv.vendas_id and v.data_criacao = '01/01/2016'
	group by produto_nome;
	
select * from vendas_do_dia;
select * from vendas_do_dia where produto_nome = 'PASTEL';

create or replace view produtos_vendas as
	select p.id PRODUTO_ID,
		p.produto_nome PRODUTO_NOME,
		v.id VENDA_ID,
		iv.id ITEM_ID,
		iv.item_valor ITEM_VALOR,
		v.data_criacao DATA_CRIACAO
	from produtos p, vendas v, itens_vendas iv
	where v.id = iv.vendas_id
	and p.id = iv.produto_id
	order by data_criacao desc;
	
select * from produtos_vendas;

select produto_nome from produtos_vendas where data_criacao = '01/01/2016';