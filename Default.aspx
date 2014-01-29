<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Financeiro.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Savings</title>
    <script src="JS/jquery-2.0.1.min.js"></script>
    <script src="JS/jquery.mask.min.js"></script>
    <link href="CSS/estilo_01.css" rel="stylesheet" />
</head>
<body>
    <form id="frmPrincipal" runat="server">
        <div id="principal_menu">
            <div id="menu">
                <div class="conteudo_titulo_cadastro fr"></div>
                <div class="logo fl"></div>
            </div>
        </div>
        <div class="container">
            <div id="conteudo_cadastro">
                <div>
                    <asp:Label runat="server" ID="lblResultado" Text="Resultado" CssClass="lbl" Visible="False"></asp:Label>
                </div>
                <div>
                    <div class="tamanho_coluna fl">
                        <h4 class="tit">Data
                        </h4>
                        <div class="tit">
                            <asp:TextBox ID="txtData" CssClass="txt" runat="server" MaxLength="18"></asp:TextBox>
                        </div>
                    </div>

                    <div class="tamanho_coluna fr">
                        <h4>Valor
                        </h4>
                        <div>
                            <asp:TextBox ID="txtValor" CssClass="txt" runat="server" MaxLength="18"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="tamanho_coluna fl">
                        <h4>Credor
                        </h4>
                        <div>
                            <asp:DropDownList runat="server" ID="drpCredor" CssClass="drp" ClientIDMode="Inherit">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="tamanho_coluna fr">
                        <h4>Tipo
                        </h4>
                        <div>
                            <asp:RadioButtonList ID="rbTipo" CssClass="rbl" runat="server">
                                <asp:ListItem Value="Retirada">Retirada</asp:ListItem>
                                <asp:ListItem Value="Entrada">Entrada</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="fl" style="width: 700px;">
                        <br />
                        <h4>Observação
                        </h4>
                        <div>
                            <asp:TextBox ID="txtObs" runat="server" CssClass="txt_area" TextMode="MultiLine" MaxLength="250"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="fr" style="width: 342px;">
                    <asp:Button ID="btnCadastrar" CssClass="btn" runat="server" Text="Cadastrar" OnClick="btnCadastrar_Click" />
                </div>
                <div class="fl" style="margin-bottom: 200px;">
                    <div id="divResultado" runat="server" visible="False">
                        <h2>Resultado</h2>
                        <div>
                            <asp:DropDownList runat="server" AutoPostBack="True" ID="drpPesquisa" CssClass="drp_busca" OnSelectedIndexChanged="drpPesquisa_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                        <asp:GridView ID="grdResultado" runat="server" CssClass="grd" AutoGenerateColumns="False" OnRowDataBound="grdResultado_RowDataBound" OnRowEditing="grdResultado_RowEditing" OnRowCancelingEdit="grdResultado_RowCancelingEdit" OnRowDeleting="grdResultado_RowDeleting" Style="margin-bottom: 0px" OnRowUpdating="grdResultado_RowUpdating" ShowFooter="True" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" OnPageIndexChanging="grdResultado_PageIndexChanging">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="ID" HeaderStyle-CssClass="noVisible" FooterStyle-CssClass="noVisible" ItemStyle-CssClass="noVisible">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblIDConta" Text='<%# Bind("IDCONTA") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="noVisible"></HeaderStyle>
                                    <FooterStyle CssClass="noVisible"></FooterStyle>
                                    <ItemStyle CssClass="noVisible"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nome">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblNome" Text='<%# Bind("NOME") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:DropDownList runat="server" ID="drpNomeGrid" />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Data">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblData" Text='<%# Bind("DATA") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" CssClass="txt_tamanho_data" ID="txtDataGrid" ClientIDMode="Static" />
                                        <asp:RequiredFieldValidator ID="rfData" ForeColor="red" ControlToValidate="txtDataGrid" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revData" runat="server" ErrorMessage="*" ForeColor="red" ControlToValidate="txtDataGrid" ValidationExpression="^(((((0[1-9])|(1\d)|(2[0-8]))\/((0[1-9])|(1[0-2])))|((31\/((0[13578])|(1[02])))|((29|30)\/((0[1,3-9])|(1[0-2])))))\/((20[0-9][0-9])|(19[0-9][0-9])))|((29\/02\/(19|20)(([02468][048])|([13579][26]))))$"></asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Observação" HeaderStyle-CssClass="texto">
                                    <ItemTemplate>
                                        <div style="width: 150px; word-wrap: break-word; text-align: center">
                                            <asp:Label runat="server" ID="lblObs" CssClass="txt_tamanho_obs texto" Text='<%# Bind("OBS") %>'></asp:Label>
                                        </div>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" CssClass="txt_tamanho_obs" TextMode="MultiLine" MaxLength="250" ID="txtObsGrid"></asp:TextBox><asp:RequiredFieldValidator ID="rfObs" ForeColor="red" ControlToValidate="txtObsGrid" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lblTotal" runat="server" Text="Total"></asp:Label>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tipo">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTipo" Text='<%# Bind("TIPO") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:DropDownList runat="server" ID="drpTipoGrid" />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Valor">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblValor" Text='<%# Bind("VALOR") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" ID="txtValorGrid" CssClass="txt_tamanho_data" ClientIDMode="Static" /><asp:RequiredFieldValidator ID="rfValor" ForeColor="red" ControlToValidate="txtValorGrid" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lblTotalGrid" runat="server" Text="Label"></asp:Label>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ShowEditButton="True" ButtonType="Image" CancelImageUrl="~/Images/cancel.png" CancelText="" DeleteText="" EditImageUrl="~/Images/editar.png" EditText="Editar" UpdateImageUrl="~/Images/alterar.png" UpdateText="" />
                                <asp:CommandField ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="~/Images/excluir.png" DeleteText="" />
                            </Columns>
                            <EditRowStyle BackColor="aliceblue" />
                            <FooterStyle BackColor="#68217a" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#68217a" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#0099ff" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#68217a" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#68217a" />
                            <SortedAscendingHeaderStyle BackColor="#68217a" />
                            <SortedDescendingCellStyle BackColor="#68217a" />
                            <SortedDescendingHeaderStyle BackColor="#68217a" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script>
        $("#txtData").mask('00/00/0000');
        $("#txtDataGrid").mask('00/00/0000');
        $("#txtValor").mask("##.##0,00", { reverse: true });
        $("#txtValorGrid").mask("##.##0,00", { reverse: true });
    </script>
</body>
</html>
