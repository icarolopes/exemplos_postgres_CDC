-- consultar os registros mesas
select mesa_codigo, mesa_situacao from mesas;
select * from mesas where mesa_codigo = '00002';

-- ATUALIZANDO REGISTROS
select * from produtos;
update produtos set produto_valor = 4 where id = 2;

select * from vendas;
update vendas set mesa_id = 1 where id = 2;

-- DELETANDO REGISTROS
select * from mesas;
delete from mesas where id = 2;