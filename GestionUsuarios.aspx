<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionUsuarios.aspx.cs" Inherits="Vistas.GestionUsuarios" %>

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
            width: 294px;
        }
        .auto-style4 {
            width: 247px;
        }
        .auto-style5 {
            width: 186px;
        }
        .auto-style6 {
            width: 20px;
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
        <div>
            <table class="auto-style1">
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">
                        <asp:Label ID="lblGestion" CssClass="titulos" runat="server" Font-Size="X-Large" Text="Gestion de usuarios"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>
                        <asp:Label ID="lblUsuario" runat="server" Font-Bold="True" Font-Italic="True"></asp:Label>
                        <asp:Button ID="btnCerrarSesion" runat="server" OnClick="Button1_Click" Text="Cerrar Sesion" OnClientClick="return confirm('¿Seguro que quieres cerrar sesion?')" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Label ID="lblConfirmacion" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <table class="auto-style1">
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="Dni_Us" DataSourceID="SqlDataSource1" OnItemDeleted="ListView1_ItemDeleted" OnItemUpdated="ListView1_ItemUpdated" OnSelectedIndexChanged="ListView1_SelectedIndexChanged">
                        <AlternatingItemTemplate>
                            <li style="background-color: #FAFAD2; color: #284775;">Dni:
                                <asp:Label ID="Dni_UsLabel" runat="server" Text='<%# Eval("Dni_Us") %>' />
                                <br />
                                Nombre:
                                <asp:Label ID="Nombre_UsLabel" runat="server" Text='<%# Eval("Nombre_Us") %>' />
                                <br />
                                Apellido:
                                <asp:Label ID="Apellido_UsLabel" runat="server" Text='<%# Eval("Apellido_Us") %>' />
                                <br />
                                Direccion:
                                <asp:Label ID="Direccion_UsLabel" runat="server" Text='<%# Eval("Direccion_Us") %>' />
                                <br />
                                Email:
                                <asp:Label ID="Email_UsLabel" runat="server" Text='<%# Eval("Email_Us") %>' />
                                <br />
                                Contraseña:
                                <asp:Label ID="Contraseña_UsLabel" runat="server" Text='<%# Eval("Contraseña_Us") %>' />
                                <br />
                                Nombre de Usuario:
                                <asp:Label ID="NombreUsuarioLabel" runat="server" Text='<%# Eval("NombreUsuario") %>' />
                                <br />
                                <asp:CheckBox ID="EsAdmin_UsCheckBox" runat="server" Checked='<%# Eval("EsAdmin_Us") %>' Enabled="False" Text="Es Admin" />
                                <br />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" />
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Eliminar" />
                            </li>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <li style="background-color: #FFCC66;color: #000080;">Dni:
                                <asp:Label ID="Dni_UsLabel1" runat="server" Text='<%# Eval("Dni_Us") %>' />
                                <br />
                                Nombre:
                                <asp:TextBox ID="Nombre_UsTextBox" runat="server" Text='<%# Bind("Nombre_Us") %>' />
                                <br />
                                Apellido:
                                <asp:TextBox ID="Apellido_UsTextBox" runat="server" Text='<%# Bind("Apellido_Us") %>' />
                                <br />
                                Direccion:
                                <asp:TextBox ID="Direccion_UsTextBox" runat="server" Text='<%# Bind("Direccion_Us") %>' />
                                <br />
                                Email:
                                <asp:TextBox ID="Email_UsTextBox" runat="server" Text='<%# Bind("Email_Us") %>' />
                                <br />
                                Contraseña:
                                <asp:TextBox ID="Contraseña_UsTextBox" runat="server" Text='<%# Bind("Contraseña_Us") %>' />
                                <br />
                                Nombre de Usuario:
                                <asp:TextBox ID="NombreUsuarioTextBox" runat="server" Text='<%# Bind("NombreUsuario") %>' />
                                <br />
                                <asp:CheckBox ID="EsAdmin_UsCheckBox" runat="server" Checked='<%# Bind("EsAdmin_Us") %>' Text="Es Admin" />
                                <br />
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                            </li>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            No se han devuelto datos.
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <li style="">Dni_Us:
                                <asp:TextBox ID="Dni_UsTextBox" runat="server" Text='<%# Bind("Dni_Us") %>' />
                                <br />
                                Nombre_Us:
                                <asp:TextBox ID="Nombre_UsTextBox" runat="server" Text='<%# Bind("Nombre_Us") %>' />
                                <br />
                                Apellido_Us:
                                <asp:TextBox ID="Apellido_UsTextBox" runat="server" Text='<%# Bind("Apellido_Us") %>' />
                                <br />
                                Direccion_Us:
                                <asp:TextBox ID="Direccion_UsTextBox" runat="server" Text='<%# Bind("Direccion_Us") %>' />
                                <br />
                                Email_Us:
                                <asp:TextBox ID="Email_UsTextBox" runat="server" Text='<%# Bind("Email_Us") %>' />
                                <br />
                                Contraseña_Us:
                                <asp:TextBox ID="Contraseña_UsTextBox" runat="server" Text='<%# Bind("Contraseña_Us") %>' />
                                <br />
                                NombreUsuario:
                                <asp:TextBox ID="NombreUsuarioTextBox" runat="server" Text='<%# Bind("NombreUsuario") %>' />
                                <br />
                                <asp:CheckBox ID="EsAdmin_UsCheckBox" runat="server" Checked='<%# Bind("EsAdmin_Us") %>' Text="EsAdmin_Us" />
                                <br />
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                            </li>
                        </InsertItemTemplate>
                        <ItemSeparatorTemplate>
                            <br />
                        </ItemSeparatorTemplate>
                        <ItemTemplate>
                            <li style="background-color: #FFFBD6; color: #333333;">Dni:
                                <asp:Label ID="Dni_UsLabel" runat="server" Text='<%# Eval("Dni_Us") %>' />
                                <br />
                                Nombre:
                                <asp:Label ID="Nombre_UsLabel" runat="server" Text='<%# Eval("Nombre_Us") %>' />
                                <br />
                                Apellido:
                                <asp:Label ID="Apellido_UsLabel" runat="server" Text='<%# Eval("Apellido_Us") %>' />
                                <br />
                                Direccion:
                                <asp:Label ID="Direccion_UsLabel" runat="server" Text='<%# Eval("Direccion_Us") %>' />
                                <br />
                                Email:
                                <asp:Label ID="Email_UsLabel" runat="server" Text='<%# Eval("Email_Us") %>' />
                                <br />
                                Contraseña:
                                <asp:Label ID="Contraseña_UsLabel" runat="server" Text='<%# Eval("Contraseña_Us") %>' />
                                <br />
                                Nombre de Usuario:
                                <asp:Label ID="NombreUsuarioLabel" runat="server" Text='<%# Eval("NombreUsuario") %>' />
                                <br />
                                <asp:CheckBox ID="EsAdmin_UsCheckBox" runat="server" Checked='<%# Eval("EsAdmin_Us") %>' Enabled="False" Text="Es Admin" />
                                <br />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" />
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Eliminar" />
                            </li>
                            </li>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <li runat="server" id="itemPlaceholder" />
                            </ul>
                            <div style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="3">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                            </div>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <li style="background-color: #FFCC66;font-weight: bold;color: #000080;">Dni_Us:
                                <asp:Label ID="Dni_UsLabel" runat="server" Text='<%# Eval("Dni_Us") %>' />
                                <br />
                                Nombre_Us:
                                <asp:Label ID="Nombre_UsLabel" runat="server" Text='<%# Eval("Nombre_Us") %>' />
                                <br />
                                Apellido_Us:
                                <asp:Label ID="Apellido_UsLabel" runat="server" Text='<%# Eval("Apellido_Us") %>' />
                                <br />
                                Direccion_Us:
                                <asp:Label ID="Direccion_UsLabel" runat="server" Text='<%# Eval("Direccion_Us") %>' />
                                <br />
                                Email_Us:
                                <asp:Label ID="Email_UsLabel" runat="server" Text='<%# Eval("Email_Us") %>' />
                                <br />
                                Contraseña_Us:
                                <asp:Label ID="Contraseña_UsLabel" runat="server" Text='<%# Eval("Contraseña_Us") %>' />
                                <br />
                                NombreUsuario:
                                <asp:Label ID="NombreUsuarioLabel" runat="server" Text='<%# Eval("NombreUsuario") %>' />
                                <br />
                                <asp:CheckBox ID="EsAdmin_UsCheckBox" runat="server" Checked='<%# Eval("EsAdmin_Us") %>' Enabled="false" Text="EsAdmin_Us" />
                                <br />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" />
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Eliminar" />
                            </li>
                        </SelectedItemTemplate>
                    </asp:ListView>
                </td>
                <td>&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>
                    <asp:HyperLink ID="hlVolver" class="css-button" runat="server" NavigateUrl="~/PaginaPrincipalAdministrador.aspx">Volver</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TP_Integrador_Grupo3ConnectionString %>" DeleteCommand="DELETE FROM [Usuario] WHERE [Dni_Us] = @Dni_Us" InsertCommand="INSERT INTO [Usuario] ([Dni_Us], [Nombre_Us], [Apellido_Us], [Direccion_Us], [Email_Us], [Contraseña_Us], [NombreUsuario], [EsAdmin_Us]) VALUES (@Dni_Us, @Nombre_Us, @Apellido_Us, @Direccion_Us, @Email_Us, @Contraseña_Us, @NombreUsuario, @EsAdmin_Us)" SelectCommand="SELECT * FROM [Usuario]" UpdateCommand="UPDATE [Usuario] SET [Nombre_Us] = @Nombre_Us, [Apellido_Us] = @Apellido_Us, [Direccion_Us] = @Direccion_Us, [Email_Us] = @Email_Us, [Contraseña_Us] = @Contraseña_Us, [NombreUsuario] = @NombreUsuario, [EsAdmin_Us] = @EsAdmin_Us WHERE [Dni_Us] = @Dni_Us">
            <DeleteParameters>
                <asp:Parameter Name="Dni_Us" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Dni_Us" Type="String" />
                <asp:Parameter Name="Nombre_Us" Type="String" />
                <asp:Parameter Name="Apellido_Us" Type="String" />
                <asp:Parameter Name="Direccion_Us" Type="String" />
                <asp:Parameter Name="Email_Us" Type="String" />
                <asp:Parameter Name="Contraseña_Us" Type="String" />
                <asp:Parameter Name="NombreUsuario" Type="String" />
                <asp:Parameter Name="EsAdmin_Us" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Nombre_Us" Type="String" />
                <asp:Parameter Name="Apellido_Us" Type="String" />
                <asp:Parameter Name="Direccion_Us" Type="String" />
                <asp:Parameter Name="Email_Us" Type="String" />
                <asp:Parameter Name="Contraseña_Us" Type="String" />
                <asp:Parameter Name="NombreUsuario" Type="String" />
                <asp:Parameter Name="EsAdmin_Us" Type="Boolean" />
                <asp:Parameter Name="Dni_Us" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
