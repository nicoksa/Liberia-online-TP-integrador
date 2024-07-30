using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

using Entidades;
using Negocio;

namespace Vistas
{
    public partial class VerLibrosSeleccionados : System.Web.UI.Page
    {
        NegocioUsuario negocioUsuario = new NegocioUsuario();
        NegocioVenta negocioVenta = new NegocioVenta();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarLibrosSeleccionados();
                if (Session["nombreUsuario"] != null)
                {
                    lblUsuario.Text = Session["nombreUsuario"].ToString();
                }
            }
        }
        private void CargarLibrosSeleccionados()
        {
            DataTable librosSeleccionados = Session["LibrosSeleccionados"] as DataTable;
            if (librosSeleccionados != null)
            {
                gvLibrosSeleccionados.DataSource = librosSeleccionados;
                gvLibrosSeleccionados.DataBind();
            }
            else
            {
                lblNohay.Text = "Aun no ha seleccionado libros";
            }
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            DataTable librosSeleccionados = Session["LibrosSeleccionados"] as DataTable;

            decimal totalVenta = 0;
            foreach (DataRow row in librosSeleccionados.Rows)
            {
                totalVenta += Convert.ToDecimal(row["Precio_Lib"]) * Convert.ToInt32(row["Cantidad"]);
            }

            string nombreUsuario = lblUsuario.Text;

            string dniUsuario= negocioUsuario.traerDniUsuario(nombreUsuario);

            Usuario usuario = new Usuario(dniUsuario);
            Venta venta = new Venta(usuario,totalVenta);

            

            Boolean estado = false;
            estado = negocioVenta.cargarVenta(venta);

            if (estado == true)
            {
                //ACA ME QUEDE

                // Obtener el ID de la venta recién insertada
                int idVenta = negocioVenta.ObtenerUltimoIdVenta();

                NegocioDetalleVenta negocioDetalleVenta = new NegocioDetalleVenta();

                foreach (DataRow row in librosSeleccionados.Rows)
                {
                    int idLibro = Convert.ToInt32(row["IdLibro"]);
                    int cantidad = Convert.ToInt32(row["Cantidad"]);
                    decimal precioUnitario = Convert.ToDecimal(row["Precio_Lib"]);

                    venta.setIdVenta(idVenta);
                    Libro libro = new Libro(idLibro);

                    DetalleVenta detalle = new DetalleVenta(venta, libro, cantidad, precioUnitario);
                     negocioDetalleVenta.CargarDetalleVenta(detalle);

                }

                Response.Redirect("ConfirmacionCompra.aspx");
            }

           
            else
            {
                lblNohay.Text = "No se pudo realizar la compra";
                lblNohay.ForeColor = System.Drawing.Color.Red;
            }

            
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["nombreUsuario"] = null;
            Session["LibrosSeleccionados"] = null;
            Response.Redirect("Inicio.aspx");
        }

        protected void gvLibrosSeleccionados_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvLibrosSeleccionados.PageIndex = e.NewPageIndex;
            CargarLibrosSeleccionados();
        }
    }
}