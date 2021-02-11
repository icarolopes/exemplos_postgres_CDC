-- criando toas sequencias (ids com autoincremento)
create sequence mesa_id_seq;
create sequence vendas_id_seq;
create sequence itens_vendas_id_seq;
create sequence produtos_id_seq;
create sequence funcionario_id_seq;
create sequence comissoes_id_seq;

-- vincular cada sequence com suas respectivas tabelas
alter table mesas alter column id set default nextval('mesa_id_seq');
alter table vendas alter column id set default nextval('vendas_id_seq');
alter table itens_vendas alter column id set default nextval('itens_vendas_id_seq');
alter table produtos alter column id set default nextval('produtos_id_seq');
alter table funcionarios alter column id set default nextval('funcionario_id_seq');
alter table comissoes alter column id set default nextval('comissoes_id_seq');

-- deletando uma sequence vinculado a uma tabela
drop sequence funcionario_id_seq cascade;

-- deletando uma sequence não vinculada a uma tabela
drop sequence funcionario_id_seq;

-- ALTERANDO TABELA

-- inserir um novo campo
alter table comissoes add column data_pagamento int;

-- alterando o tipo da coluna
-- por meio da exclusao da coluna e criando uma nova
alter table comissoes drop column data_pagamento;
alter table comissoes add column data_pagamento timestamp;

-- por meio do alter
alter table comissoes alter column data_pagamento type timestamp using data_pagamento_timestamp;

-- alterando o nome de uma coluna
ALTER TABLE vendas RENAME COLUMN vanda_valor TO venda_valor;
