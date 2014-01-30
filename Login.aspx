    <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Financeiro.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Savings</title>
    <link href="CSS/estilo_01.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="principal_menu">
            <div id="menu">
                <div class="conteudo_titulo fr"></div>
                <div class="logo fl"></div>
            </div>
        </div>
        <div class="container">
            <div class="conteudo">
                <div>
                    <asp:Label runat="server" Text="Resultado" ID="lblResultado" CssClass="lbl" Visible="False"></asp:Label>
                </div>
                <div>
                    <h4>Usuário
                    </h4>
                    <asp:TextBox runat="server" ID="txtNome" CssClass="txt" MaxLength="50" />
                </div>
                <div>
                    <h4>Senha
                    </h4>
                    <asp:TextBox runat="server" ID="txtSenha" CssClass="txt" MaxLength="20" TextMode="Password" />
                </div>
                <div>
                    <asp:Button ID="btnEntrar" runat="server" Text="Entrar" CssClass="btn" OnClick="btnEntrar_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
