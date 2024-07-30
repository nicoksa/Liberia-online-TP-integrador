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
   
    public partial class ConfirmacionCompra : System.Web.UI.Page
    {
        NegocioDetalleVenta NegocioDetalleVenta = new NegocioDetalleVenta();
        NegocioVenta negocioVenta = new NegocioVenta();
        NegocioUsuario negocioUsuario = new NegocioUsuario();
        NegocioLibro negocioLibro = new NegocioLibro();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["nombreUsuario"] != null)
            {
                lblUsuario.Text = Session["nombreUsuario"].ToString();
            }
        }
        protected void btnVerFactura_Click(object sender, EventArgs e)
        {
            int idVenta = negocioVenta.ObtenerUltimoIdVenta();
            Venta venta = new Venta();
            venta.setIdVenta(idVenta);
            string usuarioVenta = negocioUsuario.traerUsuarioVenta(venta);
            string fecha = negocioVenta.traerFechaVenta(venta);
            string fechaSinHoras = fecha.Substring(0, 10);

            DataTable librosSeleccionados = Session["LibrosSeleccionados"] as DataTable;
            decimal totalVenta = 0;

            foreach (DataRow row in librosSeleccionados.Rows)
            {
                totalVenta += Convert.ToDecimal(row["Precio_Lib"]) * Convert.ToInt32(row["Cantidad"]);
            }
            lblFactura.Text = "FACTURA N° " + idVenta + "<br />" +
                "Cliente: " + usuarioVenta + "<br /> "+
                "Fecha: " + fechaSinHoras + "<br />";

            gvFactura.DataSource = librosSeleccionados;
            gvFactura.DataBind();
                    
            lblTotal.Text = "<br /> TOTAL: " + totalVenta.ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["nombreUsuario"] = null;
            Session["LibrosSeleccionados"] = null;
            Response.Redirect("Inicio.aspx");
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Session["LibrosSeleccionados"] = null;
            Response.Redirect("PaginaPrincipalUsuario.aspx");
        }
    }
}