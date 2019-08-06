/*Escreva um comando que exiba o c�digo do im�vel, a descri��o do im�vel, o estado, a cidade, a zona e o bairro dos im�veis ordenados por estado, cidade, zona e bairro. */

select CodImovel, Imovel, Cidade, Estado, Zona, Bairro 
from Imovel, Bairro, Zona
where Imovel.CodBairro = Bairro.CodBairro  and Bairro.CodZona = Zona.CodZona
order by Estado, Cidade, Zona, Bairro

select CodImovel, Imovel, Cidade, Estado, Zona, Bairro 
from Imovel 
Inner join Bairro 
	on (Imovel.CodBairro = Bairro.CodBairro)
Inner join Zona
	on(Bairro.CodZona = Zona.CodZona)
order by Estado, Cidade, Zona, Bairro


/*Escreva um comando que exiba a listagem dos bairros que n�o t�m im�veis cadastrados.*/


select Bairro from Bairro
	where CodBairro not in (select CodBairro from Imovel)


/*Escreva um comando que exiba o nome da zona, o nome dos bairros e a quantidade de im�veis dispon�veis em cada bairro ordenado por nome de zona e bairro.*/

Select Zona, Bairro, count(CodImovel) as [Qtd Imoveis] from Zona, Bairro, Imovel
	where Bairro.CodZona = Zona.CodZona and Bairro.CodBairro = Imovel.CodBairro and Imovel.Disponivel = 'S'
	group by Zona, Bairro
	order by Zona, Bairro

/*Escreva um comando que exiba o tipo do im�vel, a quantidade, o valor total dos im�veis e o pre�o m�dio dos im�veis ordenado por tipo.*/

select CodImovelTipo, count(CodImovel) as [Qtd Imoveis], sum(PrecoVenda) as [Pre�o Total], AVG(PrecoVenda) as[Pre�o M�dio] from Imovel
group by CodImovelTipo
order by CodImovelTipo


/*Escreva um comando que apresente as vendas realizadas calculando o desconto dado na venda (diferen�a entre o valor do im�vel e o valor da venda).*/

select CodVenda, PrecoVenda - Valor as [Desconto] from Venda 
	inner Join Imovel on (Imovel.CodImovel = Venda.CodImovel)


/*Escreva um comando que exiba a data da venda, a descri��o do im�vel, o nome do cliente, o nome do corretor, o percentual de comiss�o e o valor da comiss�o sobre as vendas realizadas.*/

select Data, Imovel, Cliente, Corretor, Comissao, (Comissao / 100) * Valor as [Valor da Comissao] from Venda
	Inner join Imovel on (Venda.CodImovel = Imovel.CodImovel)
	Inner join Cliente on (Venda.CodCliente = Cliente.Codigo)
	Inner join Corretor on (Venda.CodCorretor = Corretor.CodCorretor)


/*Escreva um comando que exiba o nome do corretor, o percentual de comiss�o e o valor da comiss�o sobre as vendas.*/

select Corretor, Comissao, (Comissao / 100) * Valor as [Valor da Comissao] from Corretor
	Inner join Venda on (Venda.CodCorretor = Corretor.CodCorretor)

/*Escreva um comando que exiba o nome dos corretores que n�o realizaram vendas.*/

select Corretor from Corretor 
	where CodCorretor not in (select CodCorretor from Venda)



















