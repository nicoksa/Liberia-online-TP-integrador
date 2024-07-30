<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionCategorias.aspx.cs" Inherits="Vistas.GestionCategorias" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="estilo.css" type="text/css" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 180px;
        }
        .auto-style3 {
            width: 658px;
        }
        .auto-style4 {
            width: 5px;
        }
        .auto-style10 {
            margin-left: 0px;
        }
        .auto-style11 {
            width: 297px;
        }
        .auto-style12 {
            width: 226px;
        }
        .body-Fondo {
    background-image: url('https://images.alphacoders.com/132/1326370.png');
    background-size: cover;
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-position: center center;
    color: #333;
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}
    </style>
</head>
<body class="body-Fondo">
    <form id="form1" runat="server">
        <div class="login-container">
            <table class="auto-style1">
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Label ID="lblGestion" CssClass="titulos" runat="server" Font-Size="X-Large" Text="Gestion de Categorias"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                    <td class="auto-style12">&nbsp;</td>
                    <td>
                        <asp:Label ID="lblUsuario" runat="server" Font-Bold="True" Font-Italic="True"></asp:Label>
                        <asp:Button ID="btnCerrarSesion" runat="server" OnClick="Button1_Click" Text="Cerrar Sesion" OnClientClick="return confirm('¿Seguro que quieres cerrar sesion?')" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="auto-style12">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        
        <table class="auto-style1">
            <tr>
                <td class="auto-style11">
                    <asp:Label ID="lblCategoria" runat="server" Text="Agregar Categoria:"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtAgregarCategoria" runat="server" CssClass="auto-style10" Height="17px" OnTextChanged="txtAgregarCategoria_TextChanged" ValidationGroup="agregar"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAgregarCategoria" runat="server" ControlToValidate="txtAgregarCategoria" ErrorMessage="Ingresar nombre de la categoria" ForeColor="Red" ValidationGroup="agregar"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style3">
                    <asp:Button ID="btnAceptar" runat="server" CssClass="css-button" OnClick="btnAceptar_Click" Text="Aceptar" ValidationGroup="agregar" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:Label ID="lblConfirmacion" runat="server" ForeColor="#009933"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11">
        <asp:GridView ID="gvCategorias" runat="server" AutoGenerateEditButton="True" AutoGenerateColumns="False" OnRowCancelingEdit="gvCategorias_RowCancelingEdit" OnRowEditing="gvCategorias_RowEditing" OnRowUpdating="gvCategorias_RowUpdating" AllowPaging="True" OnPageIndexChanging="gvCategorias_PageIndexChanging">
            <Columns>
                <asp:TemplateField HeaderText="IdCategoria">
                    <EditItemTemplate>
                        <asp:Label ID="lbl_eit_IdCategoria" runat="server" Text='<%# Bind("IdCategoria") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_it_IdCategoria" runat="server" Text='<%# Bind("IdCategoria") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nombre Categoria">
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_eit_NombreCategoria" runat="server" Text='<%# Bind("Nombre_Cat") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNombreCategoria" runat="server" ControlToValidate="txt_eit_NombreCategoria" ErrorMessage="Error campo invalido" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_it_NombreCategoria" runat="server" Text='<%# Bind("Nombre_Cat") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    <asp:HyperLink ID="hlVolver" CssClass="hl" runat="server" NavigateUrl="~/PaginaPrincipalAdministrador.aspx">Volver</asp:HyperLink>
                </td>
            </tr>
        </table>
            </div>
    </form>
</body>
</html>
