<%@ Page Title="" Language="C#" MasterPageFile="~/moneycontrol.Master" AutoEventWireup="true" CodeBehind="despesas.aspx.cs" Inherits="moneycontrol.despesas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="tablepageStyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="wrap">
        <h4>Despesas</h4>
        <asp:GridView ID="gvDespesa" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="gvDespesa_RowDeleting" OnRowCancelingEdit="gvDespesa_RowCancelingEdit" OnRowEditing="gvDespesa_RowEditing" OnRowUpdating="gvDespesa_RowUpdating">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="ID" Visible="False">
                    <EditItemTemplate>
                        <asp:Label ID="lblId" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblId" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Descrição">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDesc" runat="server" Text='<%# Bind("descricao") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblDesc" runat="server" Text='<%# Eval("descricao") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Valor">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtVal" runat="server" Text='<%# Eval("valor") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblVal" runat="server" Text='<%# Eval("valor") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ID Usuário" Visible="False">
                    <EditItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("idUsuario") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblIdUs" runat="server" Text='<%# Eval("idUsuario") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Data">
                    <EditItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("datamov") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblDate" runat="server" Text='<%# Eval("datamov") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField EditText="Editar" HeaderText="Editar" ShowEditButton="True" />
                <asp:CommandField DeleteText="Excluir" HeaderText="Excluir" ShowDeleteButton="True" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

        </asp:GridView>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Total: R$ "></asp:Label>
        <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label><br />
        <asp:Label ID="lblMensagem" runat="server" Text=""></asp:Label><br />
    </div>

</asp:Content>
