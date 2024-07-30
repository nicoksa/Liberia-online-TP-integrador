using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class PaginaPrincipalAdministrador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["nombreUsuario"] != null)
            {
                lblUsuario.Text = Session["nombreUsuario"].ToString();
            }
            
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["nombreUsuario"] = null;          
            Response.Redirect("Inicio.aspx");

        }
    }
}