-- Quantos vendedores a empresa possuem em cada cidade?
select count(v.id_vendedores), c2.cidade  
from vendedores v inner join concessionarias c on (v.id_concessionarias = c.id_concessionarias)
                  inner join cidades c2 on (c.id_cidades = c2.id_cidades)				
group by c2.cidade 

--Liste todos os veículos com tipo 'SUV Compacta' e valor inferior a 30.000,00.

select 
	V.tipo ,
	v.valor 
from
	veiculos v 
where
	v.tipo ='SUV Compacta' and v.valor < 300000

-- Encontre os veículos mais caros vendidos em cada tipo de veículo.

select 
	v.tipo ,MAX(v.valor) 
from
	veiculos v 
group by v.tipo 


--  Liste o nome do cliente, o veículo comprado e o valor pago, para todas as vendas.
select 
	c.cliente ,
	v2.nome ,
	v.valor_pago 
from
	vendas v inner join clientes c on (v.id_clientes = c.id_clientes)
			 inner join veiculos v2 on (v.id_veiculos  = v2.id_veiculos)
	
-- Identifique as concessionárias que venderam mais de 5 veículos.

select id_concessionarias, COUNT(*) AS total_vendas
from vendas
group by id_concessionarias
having COUNT(*) > 5;

-- Liste os três veículos mais caros disponíveis.

select 
	v.nome,
	v.valor 
from
	veiculos v 
order by v.valor desc 
limit 3

-- Selecione todos os veículos adicionados no último mês.
select 
	v.nome,
	v.data_inclusao 
from
	veiculos v 
where 
	v.data_inclusao > '2024-06-01'
	
-- Liste todas as cidades e qualquer concessionária nelas, se houver.
select 
	c2.cidade,
	c.concessionaria 
from concessionarias c right join cidades c2 on(c.id_cidades = c2.id_cidades)

--  Encontre clientes que compraram veículos 'SUV Premium Híbrida' ou veículos com valor acima de 60.000,00.

select 
	c.cliente,
	v.valor_pago,
	v2.tipo 
from vendas v inner join clientes c on (v.id_clientes = c.id_clientes)
			  inner join veiculos v2 on(v.id_veiculos = v2.id_veiculos)
where 
	(v2.tipo = 'SUV Premium Híbrida' or v.valor_pago > 60000) 

	