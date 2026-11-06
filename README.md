# Teste_Avaliacao
Realização do Teste de Avaliação

Gestão de Torneios 

Descrição do Projeto
Este projeto foi desenvolvido no âmbito do Módulo 17A e 17C e tem como objetivo criar uma aplicação de consola em C# para gerir equipas, jogadores e torneios, utilizando uma base de dados MySQL.

A aplicação permite:
•	Listar todas as equipas registadas.
•	Inserir novos jogadores.
•	Listar os jogadores de uma determinada equipa.
•	Consultar os dados através da ligação à base de dados MySQL.

Tecnologias Utilizadas
•	C#
•	Visual Studio
•	MySQL
•	MySQL Workbench
•	Pacote NuGet MySql.Data

Estrutura do Projeto
•	Program.cs – Contém o menu principal e a interação com o utilizador.
•	Equipa.cs – Representa uma equipa e contém os seus atributos e métodos.
•	Jogador.cs – Representa um jogador e contém os seus atributos e métodos.
•	BaseDados.cs – Responsável pela ligação e comunicação com a base de dados MySQL.

Base de Dados
O projeto utiliza uma base de dados com o nome Gestao_Torneios, composta pelas seguintes tabelas:
•	Equipas – Guarda a informação das equipas.
•	Jogadores – Guarda a informação dos jogadores.
•	Torneios – Guarda a informação dos torneios.
•	Participacoes – Regista a participação das equipas nos torneios.

Como Executar o Projeto
1.	Abrir o MySQL Workbench.
2.	Executar o script SQL Gestao_Torneios.sql para criar a base de dados e inserir os registos.
3.	Abrir a solução GestaoTorneios no Visual Studio.
4.	Confirmar que o pacote NuGet MySql.Data está instalado.
5.	Verificar a connection string na classe BaseDados.cs e configurar a palavra-passe do MySQL.
6.	Executar o projeto.
   
Autor Rafaela Clemente
Projeto realizado no âmbito do Módulo 17A e 17C.
