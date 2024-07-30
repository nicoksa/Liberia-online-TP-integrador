using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Negocio;
using Entidades;

namespace Vistas
{
    public partial class GestionUsuarios : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["nombreUsuario"] != null)
            {
                lblUsuario.Text = Session["nombreUsuario"].ToString();
            }
        }

        protected void ListView1_ItemDeleted(object sender, ListViewDeletedEventArgs e)
        {
            lblConfirmacion.Text = "Se ha eliminado el registro con exito";
            lblConfirmacion.ForeColor = System.Drawing.Color.Green;
        }

        protected void ListView1_ItemUpdated(object sender, ListViewUpdatedEventArgs e)
        {
            lblConfirmacion.Text = "La actualización ha sido exitosa";
            lblConfirmacion.ForeColor = System.Drawing.Color.Green;
        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio.aspx");
        }

        protected void ListView1_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {

        }
    }
}