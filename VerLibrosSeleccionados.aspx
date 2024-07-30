<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerLibrosSeleccionados.aspx.cs" Inherits="Vistas.VerLibrosSeleccionados" %>

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
        .auto-style3 {
            width: 548px;
        }
        .auto-style4 {
            width: 4px;
        }
        .auto-style5 {
            width: 106px;
        }
        .auto-style6 {
            width: 579px;
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
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    <asp:Label ID="lblUsuario" runat="server" Font-Bold="True" Font-Italic="True"></asp:Label>
                    <asp:Button ID="btnCerrarSesion" runat="server" OnClick="btnCerrarSesion_Click" Text="Cerrar Sesion" OnClientClick="return confirm('¿Seguro que quieres cerrar sesion?')" />
                </td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:GridView ID="gvLibrosSeleccionados" runat="server" DataKeyNames="IdLibro" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="gvLibrosSeleccionados_PageIndexChanging">
                        <Columns>
                        <%--<asp:BoundField DataField="IdLibro" HeaderText="ID Libro" ReadOnly="True" />--%>
                        <asp:BoundField DataField="Nombre_Lib" HeaderText="Nombre" />
                        <asp:BoundField DataField="Autor_Lib" HeaderText="Autor" />
                        <asp:BoundField DataField="Precio_Lib" HeaderText="Precio" />
                            <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
                        </Columns>
                    </asp:GridView>             
                </td>
                <td class="auto-style5">
                    <asp:Label ID="lblNohay" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Button ID="btnConfirmar" CssClass="css-button" runat="server" Text="Confirmar Compra" OnClick="btnConfirmar_Click" OnClientClick="return confirm('¿Deseas confirmar la compra?')" />
                </td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    <asp:HyperLink ID="hlVolver" CssClass="hl" runat="server" NavigateUrl="~/PaginaPrincipalUsuario.aspx">Volver</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        </div>
    </form>
</body>
</html>
