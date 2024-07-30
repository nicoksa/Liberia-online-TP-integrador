<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Vistas.Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="estilo.css" type="text/css" />
    <title></title>
    <style  type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 103px;
        }
        .auto-style3 {
            width: 128px;
        }
        .auto-style5 {
            height: 23px;
        }
        .auto-style6 {
            width: 103px;
            height: 23px;
        }
        .auto-style7 {
            width: 128px;
            height: 23px;
        }
        .auto-style8 {
            width: 213px;
        }
        .auto-style9 {
            height: 23px;
            width: 213px;
        }
        .auto-style10 {
            width: 75px;
        }
        .auto-style11 {
            width: 75px;
            height: 23px;
        }
        .auto-style12 {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            min-width: 130px;
            height: 40px;
            color: #fff;
            padding: 5px 10px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            display: inline-block;
            outline: none;
            border-radius: 5px;
            box-shadow: inset 2px 2px 2px 0px rgba(255,255,255,.5), 7px 7px 20px 0px rgba(0,0,0,.1), 4px 4px 5px 0px rgba(0,0,0,.1);
            background: #2c0b8e;
            z-index: 1;
            left: 0px;
            top: 0px;
            width: 164px;
        }
        .auto-style13 {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            min-width: 130px;
            height: 21px;
            color: #fff;
            padding: 5px 10px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            display: inline-block;
            outline: none;
            border-radius: 5px;
            box-shadow: inset 2px 2px 2px 0px rgba(255,255,255,.5), 7px 7px 20px 0px rgba(0,0,0,.1), 4px 4px 5px 0px rgba(0,0,0,.1);
            background: #2c0b8e;
            z-index: 1;
            left: 0px;
            top: 0px;
            width: 143px;
        }
        .auto-style14 {
            width: 305px;
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
        .auto-style16 {
            height: 23px;
            width: 243px;
        }
        .auto-style17 {
            width: 243px;
        }
    </style>
</head>
<body class="body-Fondo">
    <form id="form1" runat="server">
        <div class="login-container">
        <table class="auto-style1">
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style17">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9"></td>
                <td class="auto-style6"></td>
                <td class="auto-style7"></td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style16"></td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style3">
                    <asp:Label ID="lblTitulo" CssClass="lblTitulo" runat="server" Text="Libreria"></asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:Label ID="lblUsuario" CssClass="lblComun" runat="server" Text="Usuario"></asp:Label>
                </td>
                <td class="auto-style17">
                    <asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" BackColor="#FFCC99" BorderColor="White" ControlToValidate="txtUsuario" CssClass="auto-style14" ErrorMessage="Ingresar Usuario" Font-Names="Arial" Font-Size="Medium"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style10">
                    <asp:Label ID="lblContrasenia" CssClass="lblComun" runat="server" Text="Contraseña"></asp:Label>
                </td>
                <td class="auto-style17">
                    <asp:TextBox ID="txtContrasenia" runat="server"  TextMode="Password"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style17">
                    <asp:Button ID="btnIniciarSesion" CssClass="auto-style12" runat="server" Text="Inicia Sesion" OnClick="btnIniciarSesion_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style17">
                    <asp:HyperLink ID="hlRegistrarse" CssClass="auto-style13" runat="server" NavigateUrl="~/RegistrarUsuario.aspx">Registrarse</asp:HyperLink>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <div>
        </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style14">&nbsp;</td>
                <td>
                    <asp:Label ID="lblMensaje" runat="server" BackColor="#FFCC99" BorderColor="White" BorderStyle="None" CssClass="auto-style20" Font-Bold="False" Font-Italic="False" Font-Names="Arial" Font-Size="Medium" style="position: relative"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style14">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        </div>
    </form>
</body>
</html>
