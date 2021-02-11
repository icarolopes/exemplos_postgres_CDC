-- || para concatenar strings
select funcionario_codigo || ' ' || funcionario_nome
	from funcionarios
	where id = 1;
	
select (funcionario_codigo || 8 || funcionario_nome)
	from funcionarios
	where id = 1;

-- Contando os caracteres de uma string
select funcionario_nome nome from funcionarios where id = 2;
select char_length(funcionario_nome) from funcionarios where id = 2;

-- Transformando letras minúsculas em maúsculas com upper(string)
select upper(funcionario_nome) from funcionarios;
select upper('livro postgresql');

-- Transforma apenas as primeiras letras de cada palavra
select initcap('livro postgresql');

-- Transforma maiúsculas em minúsculas com lower(string)
select funcionario_nome from funcionarios;
select lower(funcionario_nome) from funcionarios;

-- Substituindo string com overlay() e extraindo com substring()
select overlay(funcionario_nome placing '******' from 3 for 5) from funcionarios where id = 1;

-- Extração de um techo da string
select substring(funcionario_nome from 3 for 5) from funcionarios where id = 1;

-- Localizando uma string position
select funcionario_nome from funcionarios where id = 1;
select position('cinius' in funcionario_nome) from funcionarios where id = 1;