create or replace function
	rt_valor_comissao(func_id int)
	returns real as
	$$
	declare
		valor_comissao real;
	
	begin
		select funcionario_comissao
			into valor_comissao
			from funcionarios
		where id = func_id;
		return valor_comissao;
	end
	$$
	language plpgsql;

select rt_valor_comissao(1);