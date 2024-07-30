<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Catalogo.aspx.cs" Inherits="Vistas.Catalogo" %>

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
            width: 137px;
        }
        .auto-style3 {
            width: 140px;
        }
        .auto-style4 {
            width: 16px;
        }
        .auto-style5 {
            width: 93px;
        }
        .auto-style6 {
            width: 345px;
        }
        .auto-style7 {
            width: 773px;
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
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style5">
                    <asp:Label ID="lblCatalogo" CssClass="titulos" runat="server" Font-Size="X-Large" Text="CATALOGO"></asp:Label>
                </td>
                <td class="auto-style6">&nbsp;</td>
                <td>
                    <asp:Label ID="lblUsuario" CssClass="lblComun" runat="server" Font-Bold="True" Font-Italic="True"></asp:Label>
                    <asp:Button ID="btnCerrarSesion" CssClass="css-button" runat="server" OnClick="btnCerrarSesion_Click" Text="Cerrar Sesion" OnClientClick="return confirm('¿Seguro que quieres cerrar sesion?')" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style5">
                    &nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    Buscar:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtBuscar" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style5">
                    por:</td>
                <td class="auto-style6">
                    <asp:DropDownList ID="ddp_Lista" runat="server">
                        <asp:ListItem>--Seleccionar--</asp:ListItem>
                        <asp:ListItem Value="Autor_Lib">Autor</asp:ListItem>
                        <asp:ListItem Value="Nombre_Lib">Nombre</asp:ListItem>
                        <asp:ListItem Value="Nombre_Cat">Categoria</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Button ID="btnAutor" CssClass="css-button" runat="server" OnClick="btnAutor_Click" Text="Aceptar" style="height: 29px" />
                </td>
            </tr>
        </table>
        <table class="auto-style1">
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblSelecciona" CssClass="lblComun" runat="server" Text="Selecciona tu compra"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="gvLibros" runat="server" AutoGenerateSelectButton="True" AutoGenerateColumns="False" DataKeyNames="IdLibro"  OnSelectedIndexChanged="gvLibros_SelectedIndexChanged" AllowPaging="True" OnPageIndexChanging="gvLibros_PageIndexChanging">
                    <Columns>
                                <asp:BoundField DataField="IdLibro" HeaderText="ID Libro" ReadOnly="True" />
                                <asp:BoundField DataField="Nombre_Lib" HeaderText="Nombre" />
                                <asp:BoundField DataField="Autor_Lib" HeaderText="Autor" />
                                <asp:BoundField DataField="Precio_Lib" HeaderText="Precio" />
                    </Columns>
                    </asp:GridView>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table class="auto-style1">
            <tr>
                <td class="auto-style7">
                    <asp:Button ID="btnVerCarrito" CssClass="css-button" runat="server" OnClick="btnVerCarrito_Click" Text="Ver carrito" />
                </td>
                <td>
                    <asp:HyperLink ID="hlVolver" CssClass="hl" runat="server" NavigateUrl="~/PaginaPrincipalUsuario.aspx">Volver</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="lbl_mensaje" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
            </div>
    </form>
</body>
</html>
