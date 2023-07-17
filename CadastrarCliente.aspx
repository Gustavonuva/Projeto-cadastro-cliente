<%@ Page Language="C#" Title="Busca Cep" MasterPageFile="~/Site.Master" AutoEventWireup="true"  CodeFile="CadastrarCliente.aspx.cs" Inherits="_Default" Async="true" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h3>Cadastrar cliente</h3>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="nome">Nome:</label>
                    <asp:TextBox ID="nome" runat="server" MaxLength="20" CssClass="form-control" required="true" />
                </div>
                <div class="form-group">
                    <label for="sobrenome">Sobrenome:</label>
                    <asp:TextBox ID="sobrenome" runat="server" MaxLength="20" CssClass="form-control" required="true" />
                </div>
                <div class="form-group">
                    <label for="telefone">Telefone:</label>
                    <asp:TextBox ID="telefone" runat="server" MaxLength="20" CssClass="form-control" required="true" />
                </div>
                <div class="form-group">
                    <label for="idade">Idade:</label>
                    <asp:TextBox ID="idade" runat="server" MaxLength="20" CssClass="form-control" required="true" />
                </div>
                <asp:Button ID="btnSalvar" runat="server" Text="Salvar" OnClick="BtnSalvar_Click" CssClass="btn btn-success" Enabled="false" />
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="cep">CEP:</label>
                    <div class="input-group custom-input-group">
                        <asp:TextBox ID="textCep" runat="server" MaxLength="8" CssClass="form-control" />
                        <asp:Button ID="btnConsultaCep" runat="server" Text="Consultar" OnClick="BtnConsultas" CssClass="btn btn-primary" />
                    </div>
                </div>

                <div class="form-group">
                    <label for="logradouro">Logradouro:</label>
                    <asp:TextBox ID="logradouro" runat="server" MaxLength="100" CssClass="form-control" Enabled="false" />
                </div>
                <div class="form-group">
                    <label for="bairro">Bairro:</label>
                    <asp:TextBox ID="bairro" runat="server" MaxLength="100" CssClass="form-control" Enabled="false" />
                </div>
                <div class="form-group">
                    <label for="cidade">Cidade:</label>
                    <asp:TextBox ID="cidade" runat="server" MaxLength="100" CssClass="form-control" Enabled="false" />
                </div>
                <div class="form-group">
                    <label for="estado">Estado:</label>
                    <asp:TextBox ID="estado" runat="server" MaxLength="2" CssClass="form-control" Enabled="false" />
                </div>
            </div>
        </div>

        <div class="form-group">
            <label for="resultadoConsultas" class="resultados">Resultado da Consulta:</label>
            <table class="styled-table" id="resultadoConsultas">
                <thead>
                    <tr>
                        <th>Nome</th> <!-- Coluna do nome -->
                        <th>Sobrenome</th> <!-- Coluna do sobrenome -->
                        <th>Telefone</th> <!-- Coluna do telefone -->
                        <th>Idade</th> <!-- Coluna da idade -->
                        <th>Endereço</th> <!-- Coluna do endereço -->
                    </tr>
                </thead>
                <tbody>
                    <asp:Literal ID="resultadoConsulta" runat="server"></asp:Literal> <!-- Linhas da tabela -->
                </tbody>
            </table>
        </div>
    </div>

    <style>
         .styled-table {
            width: 100%;
            border-collapse: collapse;
        }

        .styled-table th,
        .styled-table td {
            padding: 8px;
            border: 1px solid #878787;
            text-align: left;
        }

        .styled-table thead th {
            background-color: #e7f1fd;
            color: #333;
        }

        .styled-table tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .custom-input-group {
            display: flex;
            align-items: center;
        }
        .resultados{
            margin-top: 35px
        }

        .custom-input-group .form-control {
            margin-right: 10px;
        }
    </style>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            // Ao clicar no botão de consultar CEP
            $("#<%= btnConsultaCep.ClientID %>").click(function () {
                // Obtém o valor do CEP digitado
                var cep = $("#<%= textCep.ClientID %>").val();

                // Faz a requisição AJAX à API do CEP
                $.ajax({
                    url: "https://viacep.com.br/ws/" + cep + "/json/",
                    type: "GET",
                    dataType: "json",
                    success: function (data) {
                        // Preenche os campos com os dados do CEP
                        $("#<%= logradouro.ClientID %>").val(data.logradouro);
                        $("#<%= bairro.ClientID %>").val(data.bairro);
                        $("#<%= cidade.ClientID %>").val(data.localidade);
                        $("#<%= estado.ClientID %>").val(data.uf);

                        // Habilita o botão de salvar
                        $("#<%= btnSalvar.ClientID %>").prop("disabled", false);
                    },
                    error: function () {
                        alert("Erro ao consultar o CEP. Por favor, verifique o CEP digitado.");
                    }
                });
            });

            // Ao clicar no botão de salvar
            $("#<%= btnSalvar.ClientID %>").click(function () {
                // Obtém os valores dos campos
                var nome = $("#<%= nome.ClientID %>").val();
                var sobrenome = $("#<%= sobrenome.ClientID %>").val();
                var telefone = $("#<%= telefone.ClientID %>").val();
                var idade = $("#<%= idade.ClientID %>").val();
                var cep = $("#<%= textCep.ClientID %>").val();
                var logradouro = $("#<%= logradouro.ClientID %>").val();
                var bairro = $("#<%= bairro.ClientID %>").val();
                var cidade = $("#<%= cidade.ClientID %>").val();
                var estado = $("#<%= estado.ClientID %>").val();

                // Cria a nova linha da tabela com os dados
                var newRow = "<tr>";
                newRow += "<td>" + nome + "</td>";
                newRow += "<td>" + sobrenome + "</td>";
                newRow += "<td>" + telefone + "</td>";
                newRow += "<td>" + idade + "</td>";
                newRow += "<td>"  + logradouro + ", " + bairro + ", " + cidade + ", " + estado + " - " + cep + "</td>";
                newRow += "</tr>";

                // Adiciona a nova linha à tabela de resultados
                $("#resultadoConsultas tbody").append(newRow);

                // Limpa o formulário
                $("#<%= nome.ClientID %>").val("");
                $("#<%= sobrenome.ClientID %>").val("");
                $("#<%= telefone.ClientID %>").val("");
                $("#<%= idade.ClientID %>").val("");
                $("#<%= textCep.ClientID %>").val("");
                $("#<%= logradouro.ClientID %>").val("");
                $("#<%= bairro.ClientID %>").val("");
                $("#<%= cidade.ClientID %>").val("");
                $("#<%= estado.ClientID %>").val("");

                // Desabilita o botão de salvar novamente
                $("#<%= btnSalvar.ClientID %>").prop("disabled", true);
            });
        });
    </script>
</asp:Content>
