create or replace function
	calc_comissao(data_ini timestamp, data_fim timestamp)
	returns void as $$
	declare
		-- declaração das variáveis que vamos
		-- utilizar. Já na declaração elas
		-- recebem o valor zero. Pois assim
		-- garanto que elas estarão zeradas
		-- quanto for utilizá-las.
		total_comissao real := 0;
		porc_comissao  real := 0;
		
		-- declarando uma variável para armazenar
		-- os registros dos loops
		reg record;
		
		-- cursor para buscar a % de comissão do funcionário
		cr_porce cursor (func_id int) is select rt_valor_comissao(func_id);
	begin
		-- realiza um loop e busca todas as vendas
		-- no período informado	
		for reg in (
			select 
				vendas.id id,
				funcionario_id,
				venda_total
			from vendas
			where data_criacao >= data_ini
			and data_criacao <= data_fim
			and venda_situacao = 'A')loop
			
			-- abertura, utilização e fechamento do cursor
			open cr_porce(reg.funcionario_id);
			fetch cr_porce into porc_comissao;
			close cr_porce;
		
			total_comissao := (reg.venda_total * porc_comissao) / 100;
			
			-- insere na tabela de comissoes o valor
			-- que o funcionário irá receber de comissão
			-- daquela venda
			
			insert into comissoes(
				funcionario_id,
				comissao_valor,
				comissao_situacao,
				data_criacao,
				data_atualizacao
			) values (
				reg.funcionario_id,
				total_comissao,
				'A',
				now(),
				now()
			);
		
			-- update na situacao da venda
			-- para que ela não seja mais comissionada
			update vendas set venda_situacao = 'C' where id = reg.id;
		    
		    -- devemos zerar as variáveis para reutilizá-las
		    total_comissao := 0;
		   	porc_comissao  := 0;
		   
		   -- término do loop
		   end loop;
	end
	$$ language plpgsql;
	
select calc_comissao('01/01/2016 00:00:00', '01/01/2016 00:00:00');