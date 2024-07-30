using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace Vistas
{
    public partial class Inicio : System.Web.UI.Page
    {
        NegocioUsuario NegocioUsuario = new NegocioUsuario();
        protected void Page_Load(object sender, EventArgs e)
        {

        }      

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            //VALORES QUE TIENEN ASIGNADOS EN NEGOCIO USUARIO
            //int UsuarioNoRegistrado = 0;
            //int ContraseniaIncorrecta = 1;
            //int UsuarioYContraseniaCorrectos = 2;
            //int UsuarioAdministrador = 3;

            int estado = NegocioUsuario.consultarUsuario(txtContrasenia.Text, txtUsuario.Text);

            if (estado == 0)
            {
                lblMensaje.Text = "El usuario no se encuentra registrado";
            }
            if (estado == 1)
            {
                lblMensaje.Text = "La contraseña es incorrecta";
            }
            if (estado == 2)
            {
                Session["nombreUsuario"] = txtUsuario.Text; 
                Server.Transfer("PaginaPrincipalUsuario.aspx");
            }
            if (estado == 3)
            {
                Session["nombreUsuario"] = txtUsuario.Text;
                Server.Transfer("PaginaPrincipalAdministrador.aspx");
            }
        }
    }
}
