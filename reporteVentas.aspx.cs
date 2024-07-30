using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Data;
using System.Data.SqlClient;
using Negocio;

namespace Vistas
{
    public partial class reporteVentas : System.Web.UI.Page
    {
        NegocioVenta negocioVenta = new NegocioVenta();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["nombreUsuario"] != null)
            {
                lblUsuario.Text = Session["nombreUsuario"].ToString();
            }
        }
        
        protected void btnAceptar_Click(object sender, EventArgs e)
        {

            try
            {
                //VARIABLE PARA NO REPETIR CODIGO DESPUES
                int codigo = 1;

                //DATOS CON LOS QUE SE VA A ARMAR LA CONSULTA
                int rango1 = Convert.ToInt32(txtRango1.Text);
                int rango2 = Convert.ToInt32(txtRango2.Text);

                //ARMAMOS LA TABLA CON LOS PARAMETROS
                DataTable tablaReportes = negocioVenta.getTabla(rango1,rango2,codigo);
                
                //CARGAMOS EL GRID VIEW 
                gvResultados.DataSource = tablaReportes;
                gvResultados.DataBind();
                
                //MOSTRAMOS EL MONTO TOTAL

                decimal totalVentasPorRango = 0;
                foreach (DataRow row in tablaReportes.Rows)
                {
                     totalVentasPorRango += Convert.ToDecimal(row["Total"]);
                }

                lblRango.Text = "$ " + totalVentasPorRango;
                
            }
            catch (Exception ex)
            {
                
            }
        }

   

        protected void btnReportePrecio_Click(object sender, EventArgs e)
        {
            try
            {
                int minimo = Convert.ToInt32(txtMinimo.Text);
                int maximo = Convert.ToInt32(txtMaximo.Text);
                int codigo = 2;

                DataTable tablaReportes = negocioVenta.getTabla(minimo,maximo,codigo);
                                                                  

                gvResultados2.DataSource = tablaReportes;
                gvResultados2.DataBind();

                       
                decimal totalVentasPorPrecio = 0;
                foreach (DataRow row in tablaReportes.Rows)
                {
                      totalVentasPorPrecio += Convert.ToDecimal(row["Total"]);
                }

                 lblImporte.Text = "$ " + totalVentasPorPrecio;
                    
               
            }
            catch (Exception ex)
            {

            }

        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["nombreUsuario"] = null;
            Session["LibrosSeleccionados"] = null;
            Response.Redirect("Inicio.aspx");
        }

        protected void gvResultados_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {         

        }
    }
}
