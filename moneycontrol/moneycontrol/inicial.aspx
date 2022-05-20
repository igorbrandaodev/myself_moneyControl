<%@ Page Title="" Language="C#" MasterPageFile="~/moneycontrol.Master" AutoEventWireup="true" CodeBehind="inicial.aspx.cs" Inherits="moneycontrol.inicial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="mainpageStyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="wrap">
        <div id="perfil">
            <asp:Label ID="Label4" runat="server" Text="Seja bem vindo, "></asp:Label>
            <asp:Label ID="lblNome" runat="server" Text="" CssClass="lblNome"></asp:Label><br />
            <asp:Label ID="Label5" runat="server" Text="Seu saldo: "></asp:Label>
            <asp:Label ID="lblS" runat="server" Text="R$ " CssClass="lblSaldo"></asp:Label>
            <asp:Label ID="lblSaldo" runat="server" Text="" CssClass="lblSaldo"></asp:Label><br />
        </div>

        <div id="main">
            <div id="adicionar">
                <div id="input">
                    <h4>Adicione uma despesa ou receita</h4>
                    <asp:Label ID="Label1" runat="server" Text="Descricao:"></asp:Label><br />
                    <asp:TextBox ID="txtDescricao" runat="server"></asp:TextBox><br />

                    <asp:Label ID="Label2" runat="server" Text="Valor:"></asp:Label><br />
                    <asp:TextBox ID="txtValor" runat="server"></asp:TextBox><br />

                    <asp:Label ID="Label3" runat="server" Text="Tipo:"></asp:Label><br /><br />
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="dropdown">
                        <asp:ListItem>Despesa</asp:ListItem>
                        <asp:ListItem>Receita</asp:ListItem>
                    </asp:DropDownList><br />
                    <br />
                </div>

                <div class="button">
                    <asp:Button ID="btnAdd" runat="server" Text="Adicionar" OnClick="btnAdd_Click" />
                </div>
                <br />
                <br />
                <asp:Label ID="lblMensagem" runat="server" Text=""></asp:Label><br />
            </div>

            <div id="tabelas">
                <h4>Receitas</h4>
                <asp:GridView ID="gvReceita" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="gvReceita_RowDeleting" OnRowCancelingEdit="gvReceita_RowCancelingEdit" OnRowEditing="gvReceita_RowEditing" OnRowUpdating="gvReceita_RowUpdating">
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
                <br />

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
            </div>
        </div>
    </div>
</asp:Content>
