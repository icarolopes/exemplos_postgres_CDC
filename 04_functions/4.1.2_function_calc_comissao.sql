create or replace function
	calc_comissao(data_ini timestamp, data_fim timestamp)
	returns void as $$
	declare
		-- declara��o das vari�veis que vamos
		-- utilizar. J� na declara��o elas
		-- recebem o valor zero. Pois assim
		-- garanto que elas estar�o zeradas
		-- quanto for utiliz�-las.
		total_comissao real := 0;
		porc_comissao  real := 0;
		
		-- declarando uma vari�vel para armazenar
		-- os registros dos loops
		reg record;
		
		-- cursor para buscar a % de comiss�o do funcion�rio
		cr_porce cursor (func_id int) is select rt_valor_comissao(func_id);
	begin
		-- realiza um loop e busca todas as vendas
		-- no per�odo informado	
		for reg in (
			select 
				vendas.id id,
				funcionario_id,
				venda_total
			from vendas
			where data_criacao >= data_ini
			and data_criacao <= data_fim
			and venda_situacao = 'A')loop
			
			-- abertura, utiliza��o e fechamento do cursor
			open cr_porce(reg.funcionario_id);
			fetch cr_porce into porc_comissao;
			close cr_porce;
		
			total_comissao := (reg.venda_total * porc_comissao) / 100;
			
			-- insere na tabela de comissoes o valor
			-- que o funcion�rio ir� receber de comiss�o
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
			-- para que ela n�o seja mais comissionada
			update vendas set venda_situacao = 'C' where id = reg.id;
		    
		    -- devemos zerar as vari�veis para reutiliz�-las
		    total_comissao := 0;
		   	porc_comissao  := 0;
		   
		   -- t�rmino do loop
		   end loop;
	end
	$$ language plpgsql;
	
select calc_comissao('01/01/2016 00:00:00', '01/01/2016 00:00:00');