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
    public partial class despesas : System.Web.UI.Page
    {
        // Declara as variáveis globais

        // Definindo a String de Conexão com o BD
        string strConexao = @"SERVER=localhost;
                                DATABASE=moneycontrol;
                                UID=root;
                                PASSWORD=1234;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
            {
                Response.Redirect("login.aspx");
            }

            if (!IsPostBack)
            {
                BuscaDespesas();
            }
            BuscaSaldo();
            
        }

        public void BuscaDespesas()
        {
            try
            {
                // Conecta com BD
                MySqlConnection con = new MySqlConnection(strConexao);
                // Abre a conexão
                con.Open();
                // Define o comando SQL
                MySqlCommand cmd = new MySqlCommand(@"SELECT * FROM 
                despesa WHERE idUsuario = @idUsuario", con);
                cmd.Parameters.AddWithValue("@idUsuario", Session["idUsuario"]);

                // Definir um adaptador dos dados a partir da consulta SQL
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                // Cria um Data Table
                DataTable dt = new DataTable();
                // Adicionar os dados no Data Table
                da.Fill(dt);
                // Define a fonte de dados para o GridView Funcionario
                gvDespesa.DataSource = dt;
                // Carrega dos dados para o Grid View
                gvDespesa.DataBind();
                // Fecha a conexão com o BD
                con.Close();
            }
            catch (Exception erro)
            {
                // Mostra o erro na tela
                lblMensagem.Text = erro.Message;
            }
        }

        public void BuscaSaldo()
        {
            int receitas, despesas, saldo;

            // Cria a conexão com o BD MySQL
            MySqlConnection con =
                new MySqlConnection(strConexao);
            // Abrir a Conexão com o BD
            con.Open();
            // Consulta o registro
            MySqlCommand cmd = new MySqlCommand(
                       @"SELECT SUM(receita.valor) as totalreceita, (SELECT DISTINCT SUM(valor) FROM despesa WHERE idUsuario = @idUsuario) as totaldespesa
                        FROM receita
                        WHERE receita.idUsuario = @idUsuario", con);
            // Define os valores para os parâmetros
            cmd.Parameters.AddWithValue("@idUsuario", (string)(Session["idUsuario"]));

            // Executar o comando SQL (Select)
            MySqlDataReader reader = cmd.ExecuteReader();


            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    if (reader.IsDBNull(0))
                    {
                        receitas = 0;
                    }
                    else
                    {
                        receitas = Convert.ToInt32(reader.GetString(0));
                    }

                    if (reader.IsDBNull(1))
                    {
                        despesas = 0;
                    }
                    else
                    {
                        despesas = Convert.ToInt32(reader.GetString(1));
                    }

                    lblTotal.Text = Convert.ToString(despesas);

                }

            }
            else
            {

            }

            // Fecha a Conexão com o BD
            con.Close();



        }

        //Comandos da tabela Despesa

        protected void gvDespesa_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            int id = Convert.ToInt32(((Label)gvDespesa.Rows[e.RowIndex].FindControl("lblId")).Text);

            // Excluindo os dados de um funcionario
            // Cria a conexão com o BD MySQL
            MySqlConnection con =
                new MySqlConnection(strConexao);
            // Abrir a Conexão com o BD
            con.Open();
            // Define o comando SQL 
            MySqlCommand cmd =
                new MySqlCommand("DELETE FROM despesa " +
                    "WHERE id = @id", con);

            cmd.Parameters.AddWithValue("@id", id);

            // Executa o Comando SQL (DELETE)
            cmd.ExecuteNonQuery();
            lblMensagem.Text = "Despesa excluída com sucesso!!!";
            this.BuscaDespesas(); // Atualiza o DataGrid
            BuscaSaldo();

        }

        protected void gvDespesa_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDespesa.EditIndex = e.NewEditIndex;
            this.BuscaDespesas(); // Atualiza o DataGrid
        }

        protected void gvDespesa_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvDespesa.EditIndex = -1;
            this.BuscaDespesas();
        }

        protected void gvDespesa_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(((Label)gvDespesa.Rows[e.RowIndex].FindControl("lblId")).Text);

            // Excluindo os dados de um funcionario
            // Cria a conexão com o BD MySQL
            MySqlConnection con =
                new MySqlConnection(strConexao);
            // Abrir a Conexão com o BD
            con.Open();
            // Define o comando SQL 
            MySqlCommand cmd =
                new MySqlCommand("UPDATE despesa SET descricao = @descricao, valor = @valor " +
                    "WHERE id = @id", con);

            cmd.Parameters.AddWithValue("@descricao", ((TextBox)gvDespesa.Rows[e.RowIndex].FindControl("txtDesc")).Text);
            cmd.Parameters.AddWithValue("@valor", ((TextBox)gvDespesa.Rows[e.RowIndex].FindControl("txtVal")).Text);
            cmd.Parameters.AddWithValue("@id", id);

            // Executa o Comando SQL (UPDATE)
            cmd.ExecuteNonQuery();
            lblMensagem.Text = "Despesa editada com sucesso!!!";
            //Sai do template editing
            gvDespesa.EditIndex = -1;


            this.BuscaDespesas(); // Atualiza o DataGrid
            BuscaSaldo();

        }
    }
}