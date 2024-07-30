<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListadoFacturas.aspx.cs" Inherits="Vistas.ListadoFacturas" %>

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
            width: 260px;
        }
        .auto-style5 {
            width: 585px;
            height: 23px;
        }
        .auto-style7 {
            width: 585px;
            height: 71px;
        }
        .auto-style8 {
            height: 71px;
        }
        .auto-style9 {
            height: 23px;
        }
        .auto-style10 {
            width: 295px;
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
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:Label ID="Label1" CssClass="titulos" runat="server" Font-Size="X-Large" Text="Listado de facturas"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
                <td>
                    <asp:Label ID="lblUsuario" runat="server" Font-Bold="True" Font-Italic="True"></asp:Label>
                    <asp:Button ID="btnCerrarSesion" runat="server" OnClick="Button1_Click" Text="Cerrar Sesion" OnClientClick="return confirm('¿Seguro que quieres cerrar sesion?')" />
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <div>
            <asp:DataList ID="DataList1" runat="server" DataKeyField="IdVenta" DataSourceID="SqlDataSource1" CellSpacing="5" Font-Bold="True" Font-Italic="False" Font-Names="Berlin Sans FB" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" RepeatColumns="5" RepeatDirection="Horizontal">
                <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" ForeColor="Black" />
                <ItemTemplate>
                    Id Venta:
                    <asp:Label ID="IdVentaLabel" runat="server" Text='<%# Eval("IdVenta") %>' />
                    <br />
                    Dni Usuario:
                    <asp:Label ID="DniUsuario_VenLabel" runat="server" Text='<%# Eval("DniUsuario_Ven") %>' />
                    <br />
                    Total:
                    <asp:Label ID="Total_VenLabel" runat="server" Text='<%# Eval("Total_Ven") %>' />
                    <br />
                    <asp:Button ID="btnVerDetalle" runat="server" Text="Ver detalle " CommandArgument='<%# Eval("IdVenta") %>' CommandName="eventoVerDetalle" OnCommand="btnVerDetalle_Command" />
<br />
                </ItemTemplate>
            </asp:DataList>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TP_Integrador_Grupo3ConnectionString %>" SelectCommand="SELECT * FROM [Venta]"></asp:SqlDataSource>
        <table class="auto-style1">
            <tr>
                <td class="auto-style9"></td>
                <td class="auto-style9"></td>
                <td class="auto-style9"></td>
                <td class="auto-style9"></td>
                <td class="auto-style9"></td>
                <td class="auto-style5"></td>
                <td class="auto-style9"></td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="lblDetalleVenta" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
                </td>
                <td class="auto-style8"></td>
                <td class="auto-style8"></td>
                <td class="auto-style8"></td>
                <td class="auto-style8"></td>
                <td class="auto-style7"></td>
                <td class="auto-style8"></td>
            </tr>
            <tr>
                <td class="auto-style9">
                    <asp:GridView ID="gvVerDetalle" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:TemplateField HeaderText="Id Venta">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_it_idVenta" runat="server" Text='<%# Bind("IdVenta_DV") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nombre Libro">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_it_nombreLibro" runat="server" Text='<%# Bind("Nombre_Lib") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Cantidad vendida">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_it_cantidadVendida" runat="server" Text='<%# Bind("Cantidad_DV") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Precio Unitario">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_it_precioUnitario" runat="server" Text='<%# Bind("PrecioUnitario") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
                <td class="auto-style9"></td>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style9"></td>
                <td class="auto-style9"></td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style9">
                    <asp:HyperLink ID="hlVolver" CssClass="hl" runat="server" NavigateUrl="~/PaginaPrincipalAdministrador.aspx">Volver</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="auto-style9">
            <asp:Label ID="lblTotal" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
                </td>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style9">
                    &nbsp;</td>
            </tr>
        </table>
        <p>
            &nbsp;</p>

        </div>
    </form>
</body>
</html>
