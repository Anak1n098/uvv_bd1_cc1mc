Este subdiretório armazena os scripts para a geração do banco de dados em [PostgreSQL]() e mostra passo a passo a criação do banco de dados nesse SGBD.

#
#### PostgreSQL
1. ***O usuário*** <br>
É preciso a criação de um usuário com os privilégios específicos.

2. ***O banco de dados*** <br>
Se cria o banco de dados com o usuário criado anteriormente definido como dono. 

3. ***O esquema*** <br>
É preciso a criação de um esquema dentro do banco de dados para a criação das tabelas, é o diferencial do PostgreSQL. Isso serve para definir onde criaremos as tabelas, para que não haja confusão.

4. ***As tabelas*** <br>
Nesse passo, se pode inserir o comando para a criação de tabelas `CREATE TABLE esquema.tabela (atributos, tipos, chaves...);`.

5. ***Restrições*** <br>
As restrições devem ser criadas após a criação da tabela, com o comando `ALTER TABLE esquema.tabela ADD CONSTRAINT *Nome da restrição* *O tipo da restrição*;`.

6. ***Os dados*** <br>
Utlizando o comando `INSERT INTO esquema.tabela (atributo1, atributo2...) VALUES ('tupla1', 'tupla2');` após a criação das tabelas, os dados devem ser inseridos.
