<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cadastro.aspx.cs" Inherits="moneycontrol.cadastro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="loginpageStyle.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="login">
            <div id="input">
                <h2>Cadastro</h2>
                <asp:Label ID="Label3" runat="server" Text="Nome"></asp:Label><br />
                <asp:TextBox ID="txtNome" runat="server"></asp:TextBox><br />
                <asp:Label ID="Label1" runat="server" Text="Usuario"></asp:Label><br />
                <asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox><br />
                <asp:Label ID="Label2" runat="server" Text="Senha"></asp:Label><br />
                <asp:TextBox ID="txtSenha" runat="server"></asp:TextBox><br />
                <asp:Label ID="Label4" runat="server" Text="Sexo"></asp:Label><br /><br />
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" TextAlign="Left" Width="150px">
                    <asp:ListItem>M</asp:ListItem>
                    <asp:ListItem>F</asp:ListItem>
                </asp:RadioButtonList><br />
            </div>

            <div class="button">
                <asp:Button ID="btnCadastrar" runat="server" Text="Criar conta" OnClick="btnCriarConta_Click" CssClass="btnEsquerda"/>
                <asp:Button ID="btnVoltar" runat="server" Text="Voltar" OnClick="btnVoltar_Click" CssClass="btnDireita" />
                <br />
            </div>

            <asp:Label ID="lblMensagem" runat="server" Text="" CssClass="lblMensagem"></asp:Label>

        </div>
    </form>
</body>
</html>
