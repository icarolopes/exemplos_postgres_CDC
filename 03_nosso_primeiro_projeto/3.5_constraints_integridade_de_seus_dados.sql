-- excluir uma table
drop table comissoes;

-- tabela para gravar registro do caculo das comissoes sem uma chave primaria e sem chave estrangeira
create table comissoe(
	id int not null,
	funcionario_id int,
	comissao_valor real,
	comissao_situacao varchar(1) default 'A',
	data_criacao timestamp,
	data_atualizacao timestamp
);

-- renomear uma table
ALTER TABLE public.comissoe RENAME TO comissoes;

-- criando uma constraints PK (chave primaria)
alter table comissoes add constraint comissoes_pkey primary key(id);

-- criando uma constraints FK (chave estrangeiras)
alter table comissoes add foreign key (funcionario_id) references funcionarios(id);

-- deletando uma constraint
-- removendo FK da tabela de comissoes (funcionario_id) que se relacionova com a tabela de funcionarios(id)
alter table comissoes drop constraint comissoes_funcionario_id_fkey;

-- criar uma constraint que dira para o banco testa o campo venda_total é maior que zero (positivo) a cada novo registro
alter table vendas add check ( venda_total > 0 );

-- criar uma cosntraint para não permitir inserir nulo no campo
alter table funcionarios add check ( funcionario_nome <> null );