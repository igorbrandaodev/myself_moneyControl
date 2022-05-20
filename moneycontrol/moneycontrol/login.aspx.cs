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
    public partial class login : System.Web.UI.Page
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

        protected void btnEntrar_Click(object sender, EventArgs e)
        {
            // Cria a conexão com o BD MySQL
            MySqlConnection con =
                new MySqlConnection(strConexao);
            // Abrir a Conexão com o BD
            con.Open();
            // Consulta o registro
            MySqlCommand cmd = new MySqlCommand(
                       @"SELECT * FROM usuario WHERE usuario = @usuario AND senha = @senha;", con);
            // Define os valores para os parâmetros
            cmd.Parameters.AddWithValue("@usuario", txtUsuario.Text);
            cmd.Parameters.AddWithValue("@senha", txtSenha.Text);

            lblMensagem.Text = cmd.CommandText;
            // Executar o comando SQL (Select)
            MySqlDataReader reader = cmd.ExecuteReader();


            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Session["idUsuario"] = reader.GetString(0);
                    Session["sexo"] = reader.GetString(1);
                    Session["usuario"] = reader.GetString(2);

                }

                Response.Redirect("inicial.aspx");

            }
            else
            {
                lblMensagem.Text = "Usuario invalido";
            }

            // Fecha a Conexão com o BD
            con.Close();

            
        }

        protected void btnCriarConta_Click(object sender, EventArgs e)
        {
            Response.Redirect("cadastro.aspx");
        }
    }
}