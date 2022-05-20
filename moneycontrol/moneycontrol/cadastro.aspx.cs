using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
// Utilizar a classe MySQL.Data
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Data;

namespace moneycontrol
{
    public partial class cadastro : System.Web.UI.Page
    {
        // Declara as variáveis globais

        // Definindo a String de Conexão com o BD
        string strConexao = @"SERVER=localhost;
                                DATABASE=moneycontrol;
                                UID=root;
                                PASSWORD=1234;";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCriarConta_Click(object sender, EventArgs e)
        {

            // Cria a conexão com o BD MySQL
            MySqlConnection con =
                new MySqlConnection(strConexao);
            // Abrir a Conexão com o BD
            con.Open();
            // Consulta o registro
            MySqlCommand cmd = new MySqlCommand(
                       @"SELECT * FROM usuario
                        WHERE usuario = @usuario ", con);
            // Define os valores para os parâmetros
            cmd.Parameters.AddWithValue("@usuario", txtUsuario.Text);

            // Executar o comando SQL (Select)
            MySqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                lblMensagem.Text = "Usuário já utilizado, tente outro.";
            }
            else
            {
                criaConta();
            }
            
        }

        public void criaConta()
        {
            DateTime dataHora = DateTime.Now;

            // Cria a conexão com o BD MySQL
            MySqlConnection con =
                new MySqlConnection(strConexao);
            // Abrir a Conexão com o BD
            con.Open();


            // Insere um novo registro
            MySqlCommand cmd = new MySqlCommand(
                       @"INSERT INTO usuario(sexo, nome, usuario, senha, datacad) VALUES (@sexo,@nome,@usuario,@senha, @data);", con);
            // Define os valores para os parâmetros
            cmd.Parameters.AddWithValue("@sexo", RadioButtonList1.SelectedValue);
            cmd.Parameters.AddWithValue("@nome", txtNome.Text);
            cmd.Parameters.AddWithValue("@usuario", txtUsuario.Text);
            cmd.Parameters.AddWithValue("@senha", txtSenha.Text);
            cmd.Parameters.AddWithValue("@data", dataHora);


            // Executar o comando SQL (Insert)
            cmd.ExecuteNonQuery();

            // Fecha a Conexão com o BD
            con.Close();

            Response.Write("<script language='javascript'>window.alert('Usuario cadastrado com Sucesso!');window.location='login.aspx';</script>");

        }

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
    }
}