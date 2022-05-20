<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="moneycontrol.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Money Control</title>
    <link href="loginpageStyle.css" rel="stylesheet" />
</head>
<body>
    <h1>Money Control</h1>
    <form id="form1" runat="server">
        <div id="login">
            <div id="input">
                <h2>Login</h2>
                <asp:Label ID="Label1" runat="server" Text="Usuario"></asp:Label><br />
                <asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox><br />
                <asp:Label ID="Label2" runat="server" Text="Senha"></asp:Label><br />
                <asp:TextBox ID="txtSenha" runat="server"></asp:TextBox><br />
                <br />
            </div>
            <div class="button">
                <asp:Button ID="btnEntrar" runat="server" Text="Entrar" OnClick="btnEntrar_Click" CssClass="btnEsquerda"/>&nbsp
                <asp:Button ID="btnCriarConta" runat="server" Text="Criar conta" OnClick="btnCriarConta_Click" CssClass="btnDireita" />
                <br /><br />
            </div>
            <asp:Label ID="lblMensagem" runat="server" Text="" CssClass="lblMensagem"></asp:Label>
        </div>
    </form>
</body>
</html>
