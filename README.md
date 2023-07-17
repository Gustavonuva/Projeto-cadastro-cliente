Projeto Cadastro de Cliente
Este projeto é um exemplo simples de um formulário de cadastro de clientes que utiliza uma API para consultar informações de endereço com base no CEP informado. O objetivo é demonstrar o uso de requisições HTTP e manipulação de dados em uma aplicação web utilizando C#.

Tecnologias utilizadas
ASP.NET Web Forms
C#
HTML
CSS
JavaScript
API ViaCEP (https://viacep.com.br)
Como rodar o projeto
Para rodar o projeto em sua máquina, siga as instruções abaixo:

Certifique-se de que você tenha o Visual Studio instalado em sua máquina. Você pode baixá-lo em https://visualstudio.microsoft.com/pt-br/downloads/.
Clone ou faça o download deste repositório para sua máquina.
Abra o Visual Studio e vá em "File" (Arquivo) -> "Open" (Abrir) -> "Project/Solution" (Projeto/Solução).
Navegue até o local onde você baixou/clonou o repositório e abra o arquivo do projeto (extensão .sln).
No Visual Studio, clique com o botão direito no projeto no "Solution Explorer" (Explorador de Soluções) e selecione "Build" (Compilar) para compilar o projeto.
Após a compilação bem-sucedida, clique com o botão direito novamente no projeto e selecione "View in Browser" (Visualizar no Navegador) para abrir o projeto em seu navegador padrão.
Como usar o formulário
Ao abrir o projeto no navegador, você verá um formulário de cadastro de cliente. Preencha os campos obrigatórios, como Nome, Sobrenome, Telefone e Idade. Além disso, você pode informar um CEP e clicar no botão "Consultar" para preencher automaticamente o endereço com base no CEP fornecido.

Após preencher os campos e consultar o CEP (opcional), clique no botão "Salvar" para adicionar o cliente à tabela de resultados abaixo do formulário.

Estrutura do código
CadastrarCliente.aspx: Esta é a página principal que contém o formulário e a tabela de resultados.
CadastrarCliente.aspx.cs: Este arquivo contém o código por trás da página, onde estão os eventos e a lógica de manipulação dos dados.
Web.config: Arquivo de configuração do projeto.
