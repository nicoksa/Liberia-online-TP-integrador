<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reporteVentas.aspx.cs" Inherits="Vistas.reporteVentas" %>

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
            width: 108px;
        }
        .auto-style3 {
            width: 108px;
            height: 26px;
        }
        .auto-style4 {
            height: 26px;
            width: 170px;
        }
        .auto-style5 {
            height: 26px;
            width: 244px;
        }
        .auto-style6 {
            width: 244px;
        }
        .auto-style9 {
            text-align: justify;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: xx-large;
            width: 27px;
            height: 49px;
        }
        .auto-style10 {
            height: 26px;
            width: 27px;
        }
        .auto-style12 {
            width: 108px;
            height: 28px;
        }
        .auto-style13 {
            width: 244px;
            height: 28px;
        }
        .auto-style14 {
            height: 28px;
            width: 27px;
        }
        .auto-style15 {
            height: 28px;
            width: 170px;
        }
        .auto-style16 {
            height: 26px;
            width: 342px;
        }
        .auto-style17 {
            width: 342px;
        }
        .auto-style18 {
            height: 28px;
            width: 342px;
        }
        .auto-style19 {
            width: 170px;
        }
        .auto-style20 {
            width: 342px;
            text-align: center;
        }
        .auto-style21 {
            width: 244px;
            text-align: center;
        }
        .auto-style22 {
            width: 27px;
        }
        .auto-style23 {
            width: 244px;
            text-align: left;
        }
        .auto-style24 {
            width: 108px;
            text-align: left;
        }
        .auto-style26 {
            width: 342px;
            text-align: justify;
            height: 49px;
        }
        .auto-style27 {
            width: 170px;
            text-align: justify;
            height: 49px;
        }
        .auto-style29 {
            width: 108px;
            text-align: center;
            height: 49px;
        }
        .auto-style31 {
            height: 26px;
            text-align: justify;
        }
        .auto-style32 {
            width: 1515%;
            margin-bottom: 0px;
        }
        .auto-style33 {
            text-align: left;
            background-color: #CCCCCC;
        }
        .auto-style34 {
            font-family: "Trebuchet MS", "Lucida Sans Unicode", "Lucida Grande", "Lucida Sans", Arial, sans-serif;
            font-size: xx-large;
            background-color: #CCCCCC;
        }
        .auto-style35 {
            width: 244px;
            text-align: left;
            height: 49px;
        }
    
.hl {
    position: relative;
    display: inline-block;
    text-decoration: none;
    color: black;
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
                <td class="auto-style31" colspan="5">
                    <table class="auto-style32">
                        <tr>
                            <td class="auto-style33"><strong><span class="auto-style34">&nbsp;Reporte de ventas</span></strong></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="auto-style29">&nbsp;</td>
                <td class="auto-style35">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style27">&nbsp;</td>
                <td class="auto-style26">
                    <asp:Label ID="lblUsuario" runat="server" Font-Bold="True" Font-Italic="True"></asp:Label>
                    <asp:Button ID="btnCerrarSesion" runat="server" OnClick="btnCerrarSesion_Click" Text="Cerrar Sesion" OnClientClick="return confirm('¿Seguro que quieres cerrar sesion?')" />
                </td>
            </tr>
            <tr>
                <td class="auto-style29">&nbsp;</td>
                <td class="auto-style35">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style27">&nbsp;</td>
                <td class="auto-style26">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style29"></td>
                <td class="auto-style35">Monto total segun id de la venta</td>
                <td class="auto-style9"></td>
                <td class="auto-style27"></td>
                <td class="auto-style26">Monto total segun importe </td>
            </tr>
            <tr>
                <td class="auto-style24">&nbsp;</td>
                <td class="auto-style23">Ingrese rangos de Id venta que desea consultar:</td>
                <td class="auto-style22">&nbsp;</td>
                <td class="auto-style19">&nbsp;</td>
                <td class="auto-style17">Ingrese rangos de importe de ventas realizados:</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style22">&nbsp;</td>
                <td class="auto-style19">&nbsp;</td>
                <td class="auto-style17">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Rango 1</td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtRango1" runat="server"  TextMode="Number" ValidationGroup="reporteId"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvRango1" runat="server" ControlToValidate="txtRango1" ErrorMessage="Ingresar rango" ForeColor="Red" ValidationGroup="reporteId"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style22">&nbsp;</td>
                <td class="auto-style19">Importe minimo</td>
                <td class="auto-style17">
                    <asp:TextBox ID="txtMinimo" runat="server"  TextMode="Number" ValidationGroup="reporteImporte"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvRango3" runat="server" ControlToValidate="txtMinimo" ErrorMessage="Ingresar minimo" ForeColor="Red" ValidationGroup="reporteImporte"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"></td>
                <td class="auto-style5"></td>
                <td class="auto-style10"></td>
                <td class="auto-style4"></td>
                <td class="auto-style16"></td>
            </tr>
            <tr>
                <td class="auto-style12">Rango 2</td>
                <td class="auto-style13">
                    <asp:TextBox ID="txtRango2" runat="server" TextMode="Number" ValidationGroup="reporteId"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvRango2" runat="server" ControlToValidate="txtRango2" ErrorMessage="Ingresar rango" ForeColor="Red" ValidationGroup="reporteId"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style14"></td>
                <td class="auto-style15">Importe maximo</td>
                <td class="auto-style18">
                    <asp:TextBox ID="txtMaximo" runat="server" TextMode="Number" ValidationGroup="reporteImporte"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvRango4" runat="server" ControlToValidate="txtMaximo" ErrorMessage="Ingresar maximo" ForeColor="Red" ValidationGroup="reporteImporte"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style22">&nbsp;</td>
                <td class="auto-style19">&nbsp;</td>
                <td class="auto-style17">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style6">
                    <asp:Button ID="btnAceptar" CssClass="css-button" runat="server" OnClick="btnAceptar_Click" Text="Ver reporte" ValidationGroup="reporteId" />
                </td>
                <td class="auto-style22">&nbsp;</td>
                <td class="auto-style19">&nbsp;</td>
                <td class="auto-style17">
                    <asp:Button ID="btnReportePrecio" CssClass="css-button" runat="server" OnClick="btnReportePrecio_Click" Text="Ver reporte" ValidationGroup="reporteImporte" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3"></td>
                <td class="auto-style5"></td>
                <td class="auto-style10"></td>
                <td class="auto-style4"></td>
                <td class="auto-style16"></td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style21">
                    <asp:GridView ID="gvResultados" runat="server" AllowPaging="True" OnPageIndexChanging="gvResultados_PageIndexChanging">
                    </asp:GridView>
                </td>
                <td class="auto-style22">&nbsp;</td>
                <td class="auto-style19">&nbsp;</td>
                <td class="auto-style20">
                    <asp:GridView ID="gvResultados2" runat="server">
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"></td>
                <td class="auto-style5"></td>
                <td class="auto-style10"></td>
                <td class="auto-style4"></td>
                <td class="auto-style16"></td>
            </tr>
            <tr>
                <td class="auto-style2">Total ventas: </td>
                <td class="auto-style6">
                    <asp:Label ID="lblRango" runat="server"></asp:Label>
                </td>
                <td class="auto-style22">&nbsp;</td>
                <td class="auto-style19">Total ventas: </td>
                <td class="auto-style17">
                    <asp:Label ID="lblImporte" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style22">&nbsp;</td>
                <td class="auto-style19">&nbsp;</td>
                <td class="auto-style17">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style22">&nbsp;</td>
                <td class="auto-style19">&nbsp;</td>
                <td class="auto-style17">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style22">&nbsp;</td>
                <td class="auto-style19">&nbsp;</td>
                <td class="auto-style17">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style22">&nbsp;</td>
                <td class="auto-style19">&nbsp;</td>
                <td class="auto-style17">
                    <asp:HyperLink ID="hlVolver" CssClass="hl" runat="server" NavigateUrl="~/PaginaPrincipalAdministrador.aspx">Volver</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style22">&nbsp;</td>
                <td class="auto-style19">&nbsp;</td>
                <td class="auto-style17">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style22">&nbsp;</td>
                <td class="auto-style19">&nbsp;</td>
                <td class="auto-style17">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style22">&nbsp;</td>
                <td class="auto-style19">&nbsp;</td>
                <td class="auto-style17">&nbsp;</td>
            </tr>
        </table>
        </div>
    </form>
</body>
</html>
