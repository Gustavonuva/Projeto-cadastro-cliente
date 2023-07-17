using System;
using System.Net.Http;
using System.Threading.Tasks;

public partial class _Default : System.Web.UI.Page
{
    protected async void BtnConsultas(object sender, EventArgs e)
    {
        string cep = textCep.Text;
        string url = $"http://www.viacep.com.br/ws/{cep}/json/";

        using (HttpClient httpClient = new HttpClient())
        {
            try
            {
                HttpResponseMessage response = await httpClient.GetAsync(url);
                if (response.IsSuccessStatusCode)
                {
                    string jsonResponse = await response.Content.ReadAsStringAsync();
                    dynamic endereco = Newtonsoft.Json.JsonConvert.DeserializeObject(jsonResponse);

                    string logradouro = endereco.logradouro;
                    string bairro = endereco.bairro;
                    string cidade = endereco.localidade;
                    string estado = endereco.uf;

                    resultadoConsulta.Text = string.Empty; // Limpar o conteúdo da tabela de resultados

                    // Exibir os dados na tabela de resultados
                    string newRow = "<tr>";
                    newRow += "<td>" + nome.Text + "</td>"; // Coluna do nome
                    newRow += "<td>" + sobrenome.Text + "</td>"; // Coluna do sobrenome
                    newRow += "<td>" + telefone.Text + "</td>"; // Coluna do telefone
                    newRow += "<td>" + idade.Text + "</td>"; // Coluna da idade
                    newRow += "<td>" + logradouro + " " + bairro + " " + cidade + "-" + estado + " " + cep + "</td>"; // Coluna do endereço
                    newRow += "</tr>";

                    resultadoConsulta.Text += newRow;

                    textCep.Text = string.Empty; // Limpar o campo de texto

                    // Habilita o botão de salvar
                    btnSalvar.Enabled = true;

                    // Limpar os campos de nome, sobrenome, telefone e idade
                    nome.Text = string.Empty;
                    sobrenome.Text = string.Empty;
                    telefone.Text = string.Empty;
                    idade.Text = string.Empty;
                }
                else
                {
                    resultadoConsulta.Text = "<tr><td colspan=\"5\"><b style=\"color:red\">Erro na resposta da API.</b></td></tr>";
                }
            }
            catch (Exception)
            {
                resultadoConsulta.Text = "<tr><td colspan=\"5\"><b style=\"color:red\">Ocorreu um erro durante a consulta.</b></td></tr>";
            }
        }
    }

    protected void BtnSalvar_Click(object sender, EventArgs e)
    {
        // Validar campos obrigatórios
        if (string.IsNullOrEmpty(nome.Text) || string.IsNullOrEmpty(sobrenome.Text) || string.IsNullOrEmpty(telefone.Text) || string.IsNullOrEmpty(idade.Text))
        {
            resultadoConsulta.Text = "<tr><td colspan=\"5\"><b style=\"color:red\">Por favor, preencha todos os campos obrigatórios.</b></td></tr>";
            return;
        }

        // Obter os valores dos campos
        string nomeCliente = nome.Text;
        string sobrenomeCliente = sobrenome.Text;
        string telefoneCliente = telefone.Text;
        string idadeCliente = idade.Text;

        // Inserir os dados na tabela de resultados
        string newRow = "<tr>";
        newRow += "<td>" + nomeCliente + "</td>"; // Coluna do nome
        newRow += "<td>" + sobrenomeCliente + "</td>"; // Coluna do sobrenome
        newRow += "<td>" + telefoneCliente + "</td>"; // Coluna do telefone
        newRow += "<td>" + idadeCliente + "</td>"; // Coluna da idade
        newRow += "<td></td>"; // Adicionar uma coluna vazia para o endereço
        newRow += "</tr>";

        resultadoConsulta.Text += newRow;

        // Limpar o formulário
        nome.Text = string.Empty;
        sobrenome.Text = string.Empty;
        telefone.Text = string.Empty;
        idade.Text = string.Empty;
    }
}
