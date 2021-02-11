create or replace function
	retorna_nome_funcionario(func_id int)
	returns text as 
	$$
	declare
	nome text;
	situacao text;
	begin
		select funcionario_nome,
				funcionario_situacao
			into nome, situacao
			from funcionarios
		where id = func_id;
		
		if situacao = 'A' then
			return nome || ' Usuário Ativo';
		elseif situacao = 'I' then
			return nome || ' Usuário Inativo';
		elseif situacao is null then
			return nome || ' Usuário sem status';
		else 
			return nome || ' Usuário com status diferente de A e I';
		end if;
	end
	$$
	language plpgsql;

select retorna_nome_funcionario(1);