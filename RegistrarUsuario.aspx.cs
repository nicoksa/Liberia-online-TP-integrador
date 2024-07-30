using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Entidades;
using Negocio;

namespace Vistas
{
    public partial class RegistrarUsuario : System.Web.UI.Page
    {
        NegocioUsuario NegocioUsuario = new NegocioUsuario();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Boolean estado = false;
            estado = NegocioUsuario.agregarUsuario(txtNombre.Text, txtApellido.Text, txtDni.Text, txtContrasenia.Text, txtNombreUsuario.Text,txtEmail.Text);

            if (estado == true)
            {
                lbl_mensaje.Text = "Usuario registrado con exito";
                Server.Transfer("PaginaPrincipalUsuario.aspx");
            }
            else
            {
                lbl_mensaje.Text = "Error Usuario ya registrado";
            }
        }
    }
}