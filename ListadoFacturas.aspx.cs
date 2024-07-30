using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using System.Data;
using Entidades;


namespace Vistas
{
    public partial class ListadoFacturas : System.Web.UI.Page
    {
        NegocioDetalleVenta negocio = new NegocioDetalleVenta();
        NegocioUsuario negocioUsuario = new NegocioUsuario();
        NegocioVenta negocioVenta = new NegocioVenta();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["nombreUsuario"] != null)
            {
                lblUsuario.Text = Session["nombreUsuario"].ToString();
            }
        }

        protected void btnVerDetalle_Command(object sender, CommandEventArgs e)
        {
            if(e.CommandName == "eventoVerDetalle")
            {
                int idVenta = Convert.ToInt32(e.CommandArgument);

                Venta venta = new Venta(idVenta);
                decimal totalVenta = negocioVenta.traerTotalVenta(idVenta);
                string fecha = negocioVenta.traerFechaVenta(venta);
                string fechaSinHoras = fecha.Substring(0, 10);

                DataTable tablaDetalleVenta = negocio.getTabla(venta);
                gvVerDetalle.DataSource = tablaDetalleVenta;
                gvVerDetalle.DataBind();
                
                string cliente = negocioUsuario.traerUsuarioVenta(venta);
                lblDetalleVenta.Text = cliente;
                lblDetalleVenta.Text = "Cliente: " + cliente + "<br />" +
                   "Fecha: " + fechaSinHoras + "<br /> ";
                lblTotal.Text = "TOTAL: " + totalVenta.ToString() + "$";

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio.aspx");
        }
    }
}