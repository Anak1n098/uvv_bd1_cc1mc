# Banco de Dados - I [PSET 1]
#### Aluno: Nicolas Salvador (Matrícula: 202308549)
#### Monitora: Suellen Miranda Amorin
#### Professor: [Abrantes Araujo Silva Filho](https://github.com/abrantesasf)
#
### Sobre o PSET 1
Este PSET (Problem Set) consiste em perguntas desafiadoras elaboradas pelo professor Abrantes para incentivar os alunos a aprender o conteúdo e desenvolver suas habilidades emocionais e práticas. Nesses exercícios exclusivos, tivemos que passar por uma série de etapas e resolver problemas difíceis que nos levavam a reproduzir o banco de dados em um script PostgreSQL totalmente funcional. Isso só é possível com um bom entendimento do PostgreSQL e a necessidade de diferenciá-lo de outros bancos de dados.


#

Este diretório tem a função de conter cada subdiretório específico com os arquivos do PSET 1, trabalho da disciplina *Banco de Dados - I* do curso *Ciência da Computação na Universidade Vila Velha*.
#

### Linguagem Markdown.

As anotações destes trabalhos estão escritas em markdown, que de maneira bem resumida, é uma linguagem de marcação criada para ser direta e prática, sem haver comandos que cortam o texto/string no código fonte e que sirva de utilidade para os clientes como uma forma de entender sobre o trabalho.

Utilizado como linguagem de formatação em diversos aplicativos e softwares de chats como o WhatsApp e Discord, também em controles de versão, e também por diversos escritores por conta da facilidade de compartilhamento de manuscritos produzidos em markdown.

`O Github utiliza o Flavored Markdown, que é basicamente o Markdown com funções extras.`

A documentação de markdown é bem simples, e recomendo aprende-la. Ela pode ser consultada em [Markdown Guide](https://www.markdownguide.org/basic-syntax/).
#
### PDF
Aqui há o PDF do projeto para que você possa acompanhar e até mesmo fazer você mesmo o trabalho. Boa sorte!
#

### Programas utilizados durante o projeto:
- Oracle VM VirtualBox (dbserver2)
- Terminal Linux
- DBeaver
- SQL Power Architect
- PosgresSQL **Comand Line**

#

### Minha opinião
Este projeto foi uma coisa muito diferente de tudo que ja fiz. Um dos únicos trabalho  que me fez ficar dias inteiros focados para conseguir terminar e fazer funcionar, pois tive que tetar os códigos várias e várias vezes. Mas cada desafio tem uma solução, emtão bastava não desistir, mesmo que eu sofresse para conseguir.


#
#
#
# PSET 1 - Modelo Lógico

#### O modelo lógico tem a função de oferecer uma visão mais ampla do banco de dados para a análise antes de inseri-lo em algum SGBD.

#### O PDF é para visualização sem o *Power Architect*

#
### Abra o arquivo .architect com o [Power Architect](https://bestofbi.com/products/sql-power-architect-data-modeling/)
#

# Imagem usada para o projeto:
![Imagem](https://github.com/Anak1n098/uvv_bd1_cc1mc/blob/main/lojas-uvv.png)


#
#
#
# PSET 1 - Código PSQL

Este suubdiretório contém o código usado para a criação do banco de dados usando [PostgreSQL](https://github.com/Anak1n098/uvv_bd1_cc1mc/blob/main/pset1/cc1mc_202308549_postgresql.sql) e também há um passo a passo básico de como funciona.

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

# 

Para informações mais detalhadas, olhe o [PDF](https://github.com/Anak1n098/uvv_bd1_cc1mc/blob/main/pset1.pdf) dado anteriormente.
