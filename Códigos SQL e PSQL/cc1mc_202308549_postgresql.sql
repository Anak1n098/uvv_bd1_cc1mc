--Banco de Dados 1 - PSET 1
--Professor: Abrantes Araújo Silva Filho
--Aluno: Nicolas Salvador
--Monitora:
--Turma: CC1Mc


--+=+=+=Podemos começar=+=+=+--


--Deletando o banco de dados "uvv" caso já exista
DROP DATABASE IF EXISTS uvv;



--Deletando usuário "nicolas" caso já exista
DROP USER IF EXISTS nicolas;



--Criando o usuário "nicolas" com todas as permissões necessárias
CREATE USER nicolas
	    encrypted PASSWORD 's3nha'        
	    CREATEDB          
	    CREATEROLE        
	    LOGIN;



--Criando o banco de dados "uvv"
CREATE DATABASE uvv
    WITH
    OWNER = nicolas
    TEMPLATE = template0
    ENCODING = 'UTF8'
    LC_COLLATE = 'pt_BR.UTF-8'
    LC_CTYPE = 'pt_BR.UTF-8'
    TABLESPACE = pg_default
    ALLOW_CONNECTIONS = true;



--Entrando no usuário
SET role nicolas;



--Fazendo conexão com o banco de dados
\c "dbname=uvv user=nicolas password=s3nha"



--Criando a schema "lojas"
CREATE SCHEMA IF NOT EXISTS lojas
    AUTHORIZATION nicolas;



--Determinando caminho temporário para criação de tabelas
SET SEARCH_PATH TO lojas, "$user", public;



--Alterando para o usuário e para a criação de tabelas
ALTER USER nicolas;
SET SEARCH_PATH TO lojas, "$user", public;



--+=+=+=+=+=+--


--Criando a tabela "produtos"

CREATE TABLE produtos (
                produto_id 		NUMERIC(38) 			NOT NULL,
                nome 			VARCHAR(255) 			NOT NULL,
                preco_unitario 		NUMERIC(10,2),
                detalhes BYTEA,
                imagem BYTEA,
                imagem_mime_type 	VARCHAR(512),
                imagem_arquivo 		VARCHAR(512),
                imagem_charset 		VARCHAR(512),
                imagem_ultima_atualizacao DATE,
                CONSTRAINT pk_produtos PRIMARY KEY (produto_id)
);



--Comentários da tabela "produtos"

COMMENT ON TABLE produtos IS 'Esta tabela contém informações sobre os produtos.';
COMMENT ON COLUMN produtos.produto_id IS 'Esta coluna mostra o id do produto e é uma PK da tabela "produtos".';
COMMENT ON COLUMN produtos.nome IS 'Esta coluna mostra o nome do produto.';
COMMENT ON COLUMN produtos.preco_unitario IS 'Esta coluna mostra o preço do produto.';
COMMENT ON COLUMN produtos.detalhes IS 'Esta coluna mostra os detalhes sobre o produto.';
COMMENT ON COLUMN produtos.imagem IS 'Esta coluna mostra a imagem do produto.';
COMMENT ON COLUMN produtos.imagem_mime_type IS 'Esta coluna mostra o tipo de arquivo da imagem do produto.';
COMMENT ON COLUMN produtos.imagem_arquivo IS 'Esta coluna mostra o arquivo da imagem.';
COMMENT ON COLUMN produtos.imagem_charset IS 'Esta coluna mostra o conjunto de caracteres/conjunto de símbolos usados na imagem.';
COMMENT ON COLUMN produtos.imagem_ultima_atualizacao IS 'Esta coluna mostra a data da última atualizção feita na imagem do produto.';


--+=+=+=+=+=+--


--Criando a tabela "lojas"

CREATE TABLE lojas (
                loja_id 		NUMERIC(38) 			NOT NULL,
                nome 			VARCHAR(255) 			NOT NULL,
                endereco_web 		VARCHAR(100),
                endereco_fisico 	VARCHAR(512),
                latitude 		NUMERIC,
                logo BYTEA,
                longitude 		NUMERIC,
                logo_mime_type 		VARCHAR(512),
                logo_arquivo 		VARCHAR(512),
                logo_charset 		VARCHAR(512),
                logo_ultima_atualizacao DATE,
                CONSTRAINT pk_lojas PRIMARY KEY (loja_id)
);



--Comentários da tabela "lojas"

COMMENT ON TABLE lojas IS 'Esta tabela contém informações sobre as lojas.';
COMMENT ON COLUMN lojas.loja_id IS 'Esta coluna mostra o id da loja e é uma PK da tabela "lojas".';
COMMENT ON COLUMN lojas.nome IS 'Esta coluna mostra o nome da loja.';
COMMENT ON COLUMN lojas.endereco_web IS 'Esta coluna mostra o endereço web da loja.';
COMMENT ON COLUMN lojas.endereco_fisico IS 'Esta coluna mostra o endereço físico da loja.';
COMMENT ON COLUMN lojas.latitude IS 'Esta coluna mostra a latitude da loja.';
COMMENT ON COLUMN lojas.logo IS 'Esta coluna mostra a logo da loja.';
COMMENT ON COLUMN lojas.longitude IS 'Esta coluna mostra a longitude da loja.';
COMMENT ON COLUMN lojas.logo_mime_type IS 'Esta coluna mostra o tipo de arquivo da logo da loja.';
COMMENT ON COLUMN lojas.logo_arquivo IS 'Esta coluna mostra o arquivo da logo.';
COMMENT ON COLUMN lojas.logo_charset IS 'Esta coluna mostra o conjunto de caracteres/conjunto de símbolos usados na logo.';
COMMENT ON COLUMN lojas.logo_ultima_atualizacao IS 'Esta coluna mostra a data da última atualização feita na logo da loja.';


--+=+=+=+=+=+--


--Criando a tabela "estoques"

CREATE TABLE estoques (
                estoque_id 		NUMERIC(38) 			NOT NULL,
                quantidade 		NUMERIC(38) 			NOT NULL,
                loja_id 		NUMERIC(38) 			NOT NULL,
                produto_id 		NUMERIC(38) 			NOT NULL,
                CONSTRAINT pk_estoques PRIMARY KEY (estoque_id)
);



--Comentários da tabela "estoques"

COMMENT ON TABLE estoques IS 'Esta tabela contém informações sobre o estoque das lojas.';
COMMENT ON COLUMN estoques.estoque_id IS 'Esta coluna mostra o id do estoque e é uma PK da tabela "estoques".';
COMMENT ON COLUMN estoques.quantidade IS 'Esta coluna mostra a quantidade do estoque.';
COMMENT ON COLUMN estoques.loja_id IS 'Esta coluna mostra o id da loja e é uma FK da tabela "estoques".';
COMMENT ON COLUMN estoques.produto_id IS 'Esta coluna mostra do id do produto e é uma FK da tabela "estoques".';


--+=+=+=+=+=+--


--Criando tabela "clientes"

CREATE TABLE clientes (
                cliente_id 		NUMERIC(38) 			NOT NULL,
                email 			VARCHAR(255) 			NOT NULL,
                nome 			VARCHAR(255) 			NOT NULL,
                telefone1 		VARCHAR(20),
                telefone2 		VARCHAR(20),
                telefone3 		VARCHAR(20),
                CONSTRAINT pk_clientes PRIMARY KEY (cliente_id)
);



--Comentários da tabela "clientes"

COMMENT ON TABLE clientes IS 'Esta tabela contém informações soobre os clientes.';
COMMENT ON COLUMN clientes.cliente_id IS 'Esta coluna mostra o id do cliente e é uma PK da tabela "clientes".';
COMMENT ON COLUMN clientes.email IS 'Esta coluna mostra o email do cliente.';
COMMENT ON COLUMN clientes.nome IS 'Esta coluna mostra o nome do cliente.';
COMMENT ON COLUMN clientes.telefone1 IS 'Esta coluna mostra o telefone 1 do cliente.';
COMMENT ON COLUMN clientes.telefone2 IS 'Esta coluna mostra o telefone 2 do cliente.';
COMMENT ON COLUMN clientes.telefone3 IS 'Esta coluna mostra o telefone 3 do cliente.';


--+=+=+=+=+=+--


--Criando a tabela "envios"

CREATE TABLE envios (
                envio_id 		NUMERIC(38) 			NOT NULL,
                loja_id 		NUMERIC(38) 			NOT NULL,
                cliente_id 		NUMERIC(38) 			NOT NULL,
                endereco_entrega 	VARCHAR(512) 			NOT NULL,
                status 			VARCHAR(15) 			NOT NULL,
                CONSTRAINT pk_envios PRIMARY KEY (envio_id)
);



--Comentários da tabela "envios"

COMMENT ON TABLE envios IS 'Esta tabela contém informações sobre os envios.';
COMMENT ON COLUMN envios.envio_id IS 'Esta coluna mostra o id do envio e é a PK da tabela "envios".';
COMMENT ON COLUMN envios.loja_id IS 'Esta coluna mostra p id da loja e é uma FK da tabela "envios".';
COMMENT ON COLUMN envios.cliente_id IS 'Esta coluna mostra o id do cliente e é uma FK da tabela "envios".';
COMMENT ON COLUMN envios.endereco_entrega IS 'Esta coluna mostra o endereço da entrega.';
COMMENT ON COLUMN envios.status IS 'Esta coluna mostra o status da entrega.';


--+=+=+=+=+=+--


--Criando a tabela "pedidos"

CREATE TABLE pedidos (
                pedido_id 		NUMERIC(38) 			NOT NULL,
                data_hora 		TIMESTAMP 			NOT NULL,
                cliente_id 		NUMERIC(38) 			NOT NULL,
                status 			VARCHAR(15) 			NOT NULL,
                loja_id 		NUMERIC(38) 			NOT NULL,
                CONSTRAINT pk_pedidos PRIMARY KEY (pedido_id)
);



--Comentários da tabela "pedidos"

COMMENT ON TABLE pedidos IS 'Esta tabela contém informações sobre os pedidos.';
COMMENT ON COLUMN pedidos.pedido_id IS 'Esta coluna mostra o id do pedido e é uma PK da tabela "pedidos".';
COMMENT ON COLUMN pedidos.data_hora IS 'Esta coluna mostra a data que foi feita o pedido.';
COMMENT ON COLUMN pedidos.cliente_id IS 'Esta coluna mostra o id do cliente.';
COMMENT ON COLUMN pedidos.loja_id IS 'Esta coluna mostra o id da loja e é uma FK na tabela "pedidos".';


--+=+=+=+=+=+--


--Criando a tabela "pedidos_itens"

CREATE TABLE pedidos_itens (
                pedido_id 		NUMERIC(38) 			NOT NULL,
                produto_id 		NUMERIC(38) 			NOT NULL,
                numero_da_linha 	NUMERIC(38) 			NOT NULL,
                preco_unitario 		NUMERIC(10,2) 			NOT NULL,
                quantidade 		NUMERIC(38) 			NOT NULL,
                envio_id 		NUMERIC(38),
                CONSTRAINT pk_pedidos_itens PRIMARY KEY (pedido_id, produto_id)
);



--Comentários da tabela "pedidos_itens"

COMMENT ON TABLE pedidos_itens IS 'Esta tabela contém informaçõs sobre os itens pedidos.';
COMMENT ON COLUMN pedidos_itens.pedido_id IS 'Esta coluna mostra o id do pedido e é uma PFK da tabela "pedidos_itens".';
COMMENT ON COLUMN pedidos_itens.produto_id IS 'Esta coluna mostra o id do produto e é uma PFK da tabela "pedidos_itens".';
COMMENT ON COLUMN pedidos_itens.numero_da_linha IS 'Esta coluna mostra o número da linha do pedido.';
COMMENT ON COLUMN pedidos_itens.preco_unitario IS 'Esta coluna mostra o preço do pedido.';
COMMENT ON COLUMN pedidos_itens.quantidade IS 'Esta coluna mostra a quantidade de pedidos.';
COMMENT ON COLUMN pedidos_itens.envio_id IS 'Esta coluna mostra o id do envio e é uma FK da tabela "pedidos_itens".';


--+=+=+=+=+=+--


--Restrições


--Fazendo com que a coluna "produto_id" seja uma FK na tabela "estoques"
ALTER TABLE estoques ADD CONSTRAINT produtos_estoque_fk
FOREIGN KEY (produto_id)
REFERENCES produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;



--Fazendo com que a coluna "produto_id" seja uma FK na tabela "pedidos_itens"
ALTER TABLE pedidos_itens ADD CONSTRAINT produtos_pedidos_itens_fk
FOREIGN KEY (produto_id)
REFERENCES produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;



--Fazendo com que a coluna "loja_id" seja uma FK na tabela "pedidos"
ALTER TABLE pedidos ADD CONSTRAINT lojas_pedidos_fk
FOREIGN KEY (loja_id)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;



--Fazendo com que a coluna "loja_id" seja uma FK na tabela "envios"
ALTER TABLE envios ADD CONSTRAINT lojas_envios_fk
FOREIGN KEY (loja_id)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;



--Fazendo com que a coluna "loja_id" seja uma FK na tabela "estoques"
ALTER TABLE estoques ADD CONSTRAINT lojas_estoque_fk
FOREIGN KEY (loja_id)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;



--Fazendo com que a coluna "cliente_id" seja uma FK na tabela "pedidos"
ALTER TABLE pedidos ADD CONSTRAINT clientes_pedidos_fk
FOREIGN KEY (cliente_id)
REFERENCES clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;



--Fazendo com que a coluna "cliente_id" seja uma FK na tabela "envios"
ALTER TABLE envios ADD CONSTRAINT clientes_envios_fk
FOREIGN KEY (cliente_id)
REFERENCES clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;



--Fazendo com que a coluna "envio_id" seja uma FK na tabela "pedidos_itens"
ALTER TABLE pedidos_itens ADD CONSTRAINT envios_pedidos_itens_fk
FOREIGN KEY (envio_id)
REFERENCES envios (envio_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;



--Fazendo com que a coluna "pedido_id" seja uma FK na tabela "pedidos_itens"
ALTER TABLE pedidos_itens ADD CONSTRAINT pedidos_pedidos_itens_fk
FOREIGN KEY (pedido_id)
REFERENCES pedidos (pedido_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;



--Criando uma restrição onde a coluna "status" da tabela "pedidos" aceite apenas os valores: CANCELADO, COMPLETO, ABERTO, PAGO, REEMBOLSADO e ENVIADO
ALTER TABLE pedidos 
ADD CONSTRAINT status_check 
CHECK  (status = 'CANCELADO'    	OR 
	status = 'COMPLETO'     	OR
	status = 'ABERTO'       	OR
	status = 'PAGO'	        	OR
	status = 'REEMBOLSADO'		OR
	status = 'ENVIADO'
);



--Criando uma restrição onde a coluna "data_hora" da tabela "pedidos" apenas aceite datas do dia atual e/ou futuro
ALTER TABLE pedidos
ADD CONSTRAINT data_hora_check
CHECK (data_hora >= current_timestamp);



--Criando uma restrição onde as colunas "endereco_fisico" e "endereco_web" tenham pelo menos uma delas preenchida
ALTER TABLE lojas 
ADD CONSTRAINT endereco_check 
CHECK ((endereco_web IS NULL OR endereco_fisico IS NOT NULL) OR
       (endereco_web IS NOT NULL OR endereco_fisico IS NULL)
);



--Criando uma restrição onde não permita a coluna "latitude" da tabela "lojas" ter valores inferiores a -90 ou superiores a 90
ALTER TABLE lojas
ADD CONSTRAINT latitude_check
CHECK (latitude >= -90 AND
       latitude <= 90
);



--Criando uma restrição onde não permita a coluna "longitude" da tabela "lojas" ter valores inferiores a -180 ou superiores a 180
ALTER TABLE lojas
ADD CONSTRAINT longitude_check
CHECK (longitude >= -180 AND
       longitude <= 180
);



--Criando uma restrição onde a coluna "logo_ultima_atualizacao" da tabela "lojas" apenas aceite datas passadas ou atual
ALTER TABLE lojas
ADD CONSTRAINT data_hora_lojas_check
CHECK (logo_ultima_atualizacao <= current_timestamp);



--Criando uma restrição onde não permita a coluna "preco_unitario" da tabela "produtos" ter valores negativos
ALTER TABLE produtos 
ADD CONSTRAINT preco_check 
CHECK (preco_unitario > 0);



--Criando uma restrição onde a coluna "imagem_ultima_atualizacao" da tabela "produtos" apenas aceite datas passadas ou atual
ALTER TABLE produtos
ADD CONSTRAINT data_hora_produtos_check
CHECK (imagem_ultima_atualizacao <= current_timestamp);



--Criando uma restrição onde não permita a coluna "quantidade" da tabela "estoques" ter valores negativos
ALTER TABLE estoques  
ADD CONSTRAINT quantidade_check 
CHECK (quantidade >= 0);



--Criando uma restrição onde a coluna "email" da tabela "cliente" possua "@"
ALTER TABLE clientes
ADD CONSTRAINT email_check
CHECK (email LIKE '%@%'
);



--Criando uma restrição onde a coluna "status" da tabela "envios" aceite apenas os valores: CRIADO, ENVIADO, TRANSITO e ENTREGUE
ALTER TABLE envios 
ADD CONSTRAINT status_envios_check 
CHECK  (status = 'CRIADO'    	OR 
	status = 'ENVIADO'   	OR
	status = 'TRANSITO'  	OR
	status = 'ENTREGUE'
);



--Criando uma restrção onde não permita a coluna "preco_unitario" da tabela "pedidos_itens" ter valores negativos
ALTER TABLE pedidos_itens 
ADD CONSTRAINT preco_itens_check 
CHECK (preco_unitario > 0);



--Fazendo com que o meu usuário seja o dono das tabelas
ALTER TABLE clientes 	 		OWNER TO nicolas;
ALTER TABLE produtos 	 		OWNER TO nicolas;
ALTER TABLE lojas    	 		OWNER TO nicolas;
ALTER TABLE envios    	 		OWNER TO nicolas;
ALTER TABLE pedidos  	 		OWNER TO nicolas;
ALTER TABLE pedidos_itens		OWNER TO nicolas;
ALTER TABLE estoques     		OWNER TO nicolas;
