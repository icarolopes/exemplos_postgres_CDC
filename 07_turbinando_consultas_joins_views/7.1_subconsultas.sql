
-- relacionando duas tabelas por meio de uma subconsulta, na qual buscaremos os funcionários que possuem vínculo com uma ou mais vendas
select funcionario_nome from funcionarios where id in (select funcionario_id from vendas);

-- realizando uma consulta apenas buscando as vendas realizadas em 2016
-- passando o ano da data atual por parâmetro
select funcionario_nome from funcionarios where id in(select funcionario_id from vendas where date_part('year', data_criacao) = '2016');
select v.id, f.funcionario_nome from vendas v inner join funcionarios f on v.funcionario_id = f.id;


-- realizando uma consulta trazendo apenas os nomes distintos dos funcionarios e ordenando em ordem alfabética
select distinct funcionario_nome
	from funcionarios 
		where id in(select funcionario_id 
			from vendas v
				where date_part('year', data_criacao) = '2016')
		order by funcionario_nome desc;
		
select distinct produto_nome
	from produtos
where id in (select id from itens_vendas v);

select * from itens_vendas;