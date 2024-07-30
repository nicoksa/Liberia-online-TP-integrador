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
    public partial class Catalogo : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (!IsPostBack)
            {
                NegocioLibro negocioLibros = new NegocioLibro();
                CargarLibros();

                if (Session["LibrosSeleccionados"] != null)
                {
                    DataTable librosSeleccionados = Session["LibrosSeleccionados"] as DataTable;
                    ViewState["LibrosSeleccionados"] = librosSeleccionados;                   
                }

                if (Session["nombreUsuario"] != null)
                {
                    lblUsuario.Text = Session["nombreUsuario"].ToString();
                }
            }
            

            
        } 
        private void CargarLibros()
            {
                NegocioLibro negocioLibros = new NegocioLibro();
                DataTable libros = negocioLibros.getTabla();
                gvLibros.DataSource = libros;
                gvLibros.DataBind();
            }

       
        protected void gvLibros_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            int index = gvLibros.SelectedIndex;
            int idLibro = Convert.ToInt32(gvLibros.DataKeys[index].Value);
            string nombre = gvLibros.Rows[index].Cells[2].Text;            
            string autor = gvLibros.Rows[index].Cells[3].Text;
            string precio = gvLibros.Rows[index].Cells[4].Text;
            
            DataTable librosSeleccionados = new DataTable();

            if (ViewState["LibrosSeleccionados"] == null)
            {
                librosSeleccionados = new DataTable();
                librosSeleccionados.Columns.Add("IdLibro", typeof(int));
                librosSeleccionados.Columns.Add("Nombre_Lib", typeof(string));
                librosSeleccionados.Columns.Add("Autor_Lib", typeof(string));
                librosSeleccionados.Columns.Add("Precio_Lib", typeof(string));
                librosSeleccionados.Columns.Add("Cantidad", typeof(int));
                librosSeleccionados.PrimaryKey = new DataColumn[] { librosSeleccionados.Columns["IdLibro"] };
            }
            else
            {
                librosSeleccionados = ViewState["LibrosSeleccionados"] as DataTable;
            }

            DataRow existingRow = librosSeleccionados.Rows.Find(idLibro);
            if (existingRow != null)
            {
                // Incrementar la cantidad si el libro ya está en el carrito
                existingRow["Cantidad"] = (int)existingRow["Cantidad"] + 1;
            }
            else
            {
                 DataRow row = librosSeleccionados.NewRow();
                 row["IdLibro"] = idLibro;
                 row["Nombre_Lib"] = nombre;
                 row["Autor_Lib"] = autor;
                 row["Precio_Lib"] = precio;
                 row["Cantidad"] = 1;

                 librosSeleccionados.Rows.Add(row);
            }


             
            ViewState["LibrosSeleccionados"] = librosSeleccionados;
            Session["LibrosSeleccionados"] = librosSeleccionados;

            lbl_mensaje.Text = "Libro agregado al carrito con exito";
            lbl_mensaje.ForeColor = System.Drawing.Color.Green;

            //gvLibrosSeleccionados.DataSource = librosSeleccionados;
            //gvLibrosSeleccionados.DataBind();
        }
       

        protected void btnVerCarrito_Click(object sender, EventArgs e)
        {
            Response.Redirect("VerLibrosSeleccionados.aspx");
        }

        protected void btnAutor_Click(object sender, EventArgs e)
        {
            NegocioLibro negocioLibros = new NegocioLibro();
            string columnaSeleccionada = ddp_Lista.SelectedValue;
            string textoBuscar = txtBuscar.Text;

            try
            {
                DataTable dataTable = negocioLibros.BuscarLibros(columnaSeleccionada, textoBuscar); 
                gvLibros.DataSource = dataTable;
                gvLibros.DataBind();
                txtBuscar.Text = "";
            }
            catch (Exception ex)
            {
                lbl_mensaje.Text = "ERROR EN LA BUSQUEDA";
                lbl_mensaje.ForeColor = System.Drawing.Color.Red;

            }
        }



        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["nombreUsuario"] = null;
            Session["LibrosSeleccionados"] = null;
            Response.Redirect("Inicio.aspx");
        }

        protected void gvLibros_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvLibros.PageIndex = e.NewPageIndex;
            CargarLibros();
        }
    }
}

