<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionLibros.aspx.cs" Inherits="Vistas.GestionLibros" %>

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
            width: 437px;
        }
        .auto-style4 {
            width: 645px;
        }
        .auto-style5 {
            width: 105px;
        }
        .auto-style6 {
            width: 136px;
            height: 26px;
        }
        .auto-style7 {
            height: 26px;
        }
        .auto-style8 {
            width: 862px;
        }
        .auto-style9 {
            width: 313px;
            height: 56px;
        }
        .auto-style10 {
            height: 56px;
        }
        .auto-style11 {
            width: 645px;
            height: 72px;
        }
        .auto-style12 {
            height: 72px;
        }
        .auto-style13 {
            width: 105px;
            height: 72px;
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
        .auto-style14 {
            width: 136px;
        }
        .auto-style15 {
            margin-left: 0px;
        }
        .auto-style16 {
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
            left: -1px;
            top: -1px;
        }
        .auto-style17 {
            width: 136px;
            height: 28px;
        }
        .auto-style18 {
            height: 28px;
        }
        .auto-style20 {
            height: 26px;
            width: 1px;
        }
        .auto-style21 {
            height: 28px;
            width: 1px;
        }
        .auto-style22 {
            width: 1px;
        }
        .auto-style23 {
            margin-left: 0px;
            margin-top: 0px;
        }
    </style>
</head>
<body class="body-Fondo">
    <form id="form1" runat="server">
        <div class="login-container">
        <table class="auto-style1">
            <tr>
                <td class="auto-style11">
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style9"></td>
                            <td class="auto-style10">
                                <asp:Label ID="lblGestion" CssClass="titulos" runat="server" Font-Size="X-Large" Text="Gestion de libros"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td >
                                <asp:Label ID="lblAgregar"  CssClass="titulos" runat="server" Font-Bold="True" Text="Agregar Libro"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
                <td class="auto-style12"></td>
                <td class="auto-style12"></td>
                <td class="auto-style12"></td>
                <td class="auto-style13"></td>
                <td class="auto-style12">
                    <asp:Label ID="lblUsuario" runat="server" Font-Bold="True" Font-Italic="True"></asp:Label>
                    <asp:Button ID="btnCerrarSesion" runat="server" OnClick="Button1_Click" Text="Cerrar Sesion" OnClientClick="return confirm('¿Seguro que quieres cerrar sesion?')" />
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style14">Nombre:</td>
                            <td class="auto-style22">
                                &nbsp;</td>
                            <td>
                                <asp:TextBox ID="txtNombreLibro" runat="server" ValidationGroup="agregar"></asp:TextBox>
                                </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNombreLibro" ErrorMessage="Ingresar Nombre " ForeColor="Red" ValidationGroup="agregar"></asp:RequiredFieldValidator>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style6">Autor</td>
                            <td class="auto-style20">
                                &nbsp;</td>
                            <td class="auto-style7">
                                <asp:TextBox ID="txtAutorLibro" runat="server" ValidationGroup="agregar"></asp:TextBox>
                                </td>
                            <td class="auto-style7">
                                <asp:RequiredFieldValidator ID="rfvAutorLibro" runat="server" ControlToValidate="txtAutorLibro" ErrorMessage="Ingresar Autor" ForeColor="Red" ValidationGroup="agregar"></asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style7"></td>
                            <td class="auto-style7"></td>
                        </tr>
                        <tr>
                            <td class="auto-style17">Año:</td>
                            <td class="auto-style21">
                            </td>
                            <td class="auto-style18">
                                <asp:TextBox ID="txtAnioLibro" runat="server" MaxLength="4" TextMode="Number" ValidationGroup="agregar"></asp:TextBox>
                                </td>
                            <td class="auto-style18">
                                <asp:RequiredFieldValidator ID="rfvAño" runat="server" ControlToValidate="txtAnioLibro" ErrorMessage="Ingresar Año" ForeColor="Red" ValidationGroup="agregar"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="rvAñoLibro" runat="server" ControlToValidate="txtAnioLibro" ErrorMessage="Año ingresado invalido" ForeColor="Red" MaximumValue="2024" MinimumValue="0" ValidationGroup="agregar"></asp:RangeValidator>
                            </td>
                            <td class="auto-style18"></td>
                            <td class="auto-style18"></td>
                        </tr>
                        <tr>
                            <td class="auto-style6">Categoria:</td>
                            <td class="auto-style20">
                                &nbsp;</td>
                            <td class="auto-style7">
                                <asp:DropDownList ID="ddlCategorias" runat="server" Height="16px" Width="154px" ValidationGroup="agregar" CssClass="auto-style23">
                                    <asp:ListItem Value="0">--Seleccionar--</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style7"></td>
                            <td class="auto-style7"></td>
                            <td class="auto-style7"></td>
                        </tr>
                        <tr>
                            <td class="auto-style14">Precio:</td>
                            <td class="auto-style22">
                                &nbsp;</td>
                            <td>
                                <asp:TextBox ID="txtPrecio" runat="server" TextMode="Number" ValidationGroup="agregar"></asp:TextBox>
                                </td>
                            <td>
                                <asp:RangeValidator ID="rvPrecioLibro" runat="server" ControlToValidate="txtPrecio" ErrorMessage="Precio invalido" ForeColor="Red" MaximumValue="9999999999999" MinimumValue="0" ValidationGroup="agregar"></asp:RangeValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPrecio" ErrorMessage="Ingresar precio" ForeColor="Red" ValidationGroup="agregar"></asp:RequiredFieldValidator>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style6">Stock:</td>
                            <td class="auto-style20">
                                &nbsp;</td>
                            <td class="auto-style7">
                                <asp:TextBox ID="txtStock" runat="server" TextMode="Number" ValidationGroup="agregar" CssClass="auto-style15"></asp:TextBox>
                                </td>
                            <td class="auto-style7">
                                <asp:RangeValidator ID="rvStockLibro" runat="server" ControlToValidate="txtStock" ErrorMessage="Stock invalido" ForeColor="Red" MaximumValue="999999" MinimumValue="0" ValidationGroup="agregar"></asp:RangeValidator>
                                <asp:RequiredFieldValidator ID="rfvStock" runat="server" ControlToValidate="txtStock" ErrorMessage="Ingresar stock" ForeColor="Red" ValidationGroup="agregar"></asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style7"></td>
                            <td class="auto-style7"></td>
                        </tr>
                        <tr>
                            <td class="auto-style14">&nbsp;</td>
                            <td class="auto-style22">
                                &nbsp;</td>
                            <td>
                                <asp:Button ID="btnAceptar" CssClass="auto-style16" runat="server" Text="Aceptar" Width="85px" OnClick="btnAceptar_Click" ValidationGroup="agregar" />
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table class="auto-style1">
            <tr>
                <td>
                    <asp:Label ID="lblConfirmacion" runat="server"></asp:Label>
                </td>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
                    <asp:GridView ID="gvLibros" runat="server" AutoGenerateEditButton="True" AutoGenerateColumns="False" OnRowCancelingEdit="gvLibros_RowCancelingEdit" OnRowEditing="gvLibros_RowEditing" OnRowUpdating="gvLibros_RowUpdating" OnRowDeleting="gvLibros_RowDeleting" AllowPaging="True" OnPageIndexChanging="gvLibros_PageIndexChanging" >
                        <Columns>
                                 <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" OnClientClick="return confirm('¿Estas seguro de eliminar este libro?')" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            <asp:TemplateField HeaderText="Id Libro">
                                <EditItemTemplate>
                                    <asp:Label ID="lbl_eit_IdLibro" runat="server" Text='<%# Bind("IdLibro") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_it_IdLibro" runat="server" Text='<%# Bind("IdLibro") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Categoria">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddl_eit_Categoria" runat="server" DataSourceID="SqlDataSource2" DataTextField="Nombre_Cat" DataValueField="Nombre_Cat" SelectedValue='<%# Bind("Nombre_Cat") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TP_Integrador_Grupo3ConnectionString %>" SelectCommand="SELECT [Nombre_Cat] FROM [Categoria]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_it_Categoria" runat="server" Text='<%# Bind("Nombre_Cat") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nombre">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_eit_NombreLibro" runat="server" Text='<%# Bind("Nombre_Lib") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfv_eit_Nombre" runat="server" ControlToValidate="txt_eit_NombreLibro" ErrorMessage="Error campo vacio" ForeColor="Red"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_it_Nombre" runat="server" Text='<%# Bind("Nombre_Lib") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Autor">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_eit_AutorLibro" runat="server" Text='<%# Bind("Autor_Lib") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfv_eit_Autor" runat="server" ControlToValidate="txt_eit_AutorLibro" ErrorMessage="Error campo vacio" ForeColor="Red"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_it_Autor" runat="server" Text='<%# Bind("Autor_Lib") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Precio">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_eit_PrecioLibro" runat="server" Text='<%# Bind("Precio_Lib") %>' ></asp:TextBox>
                                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txt_eit_PrecioLibro" ErrorMessage="Precio invalido" ForeColor="Red" MaximumValue="999999999" MinimumValue="0" Type="Double"></asp:RangeValidator>
                                    <asp:RequiredFieldValidator ID="rfvPreciogv" runat="server" ControlToValidate="txt_eit_PrecioLibro" ErrorMessage="Ingresar precio" ForeColor="Red"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_it_Precio" runat="server" Text='<%# Bind("Precio_Lib") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Stock">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_eit_StockLibro" runat="server" Text='<%# Bind("Stock_Lib") %>' TextMode="Number"></asp:TextBox>
                                    <asp:RangeValidator ID="rv_eit_Stock" runat="server" ControlToValidate="txt_eit_StockLibro" ErrorMessage="Stock invalido" ForeColor="Red" MaximumValue="99999999999999" MinimumValue="0"></asp:RangeValidator>
                                    <asp:RequiredFieldValidator ID="rfvStockgv" runat="server" ControlToValidate="txt_eit_StockLibro" ErrorMessage="Ingresar stock" ForeColor="Red"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_it_Stock" runat="server" Text='<%# Bind("Stock_Lib") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Año">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_eit_AnioLibro" runat="server" Text='<%# Bind("Año_Lib") %>' TextMode="Number"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfv_eit_Año" runat="server" ControlToValidate="txt_eit_AnioLibro" ErrorMessage="Error campo vacio" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="rv_eit_AñoLibro" runat="server" ControlToValidate="txt_eit_AnioLibro" ErrorMessage="Año ingresado invalido" ForeColor="Red" MaximumValue="2024" MinimumValue="0"></asp:RangeValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_it_Anio" runat="server" Text='<%# Bind("Año_Lib") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                          
                        </Columns>
                    </asp:GridView>
                <table class="auto-style1">
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td class="auto-style8">
                            &nbsp;</td>
                        <td>
                    <asp:HyperLink ID="hlVolver" CssClass="hl" runat="server" NavigateUrl="~/PaginaPrincipalAdministrador.aspx">Volver</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td class="auto-style8">
                            &nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
        </table>

        </div>
    </form>
</body>
</html>
