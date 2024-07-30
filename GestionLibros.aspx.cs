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
    public partial class GestionLibros : System.Web.UI.Page
    {
        NegocioLibro negocioLibro = new NegocioLibro();
        NegocioCategoria negocioCategoria = new NegocioCategoria();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarDDL();
                cargarGridView();

                if (Session["nombreUsuario"] != null)
                {
                    lblUsuario.Text = Session["nombreUsuario"].ToString();
                }
            }

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            if (ddlCategorias.SelectedValue != "0")
            {
                Boolean estado = false;


                int idCategoria = Convert.ToInt32(ddlCategorias.SelectedValue);
                Categoria categoria = new Categoria();
                categoria.setIdCategoria(idCategoria);

                estado = negocioLibro.agregarLibro(categoria, txtNombreLibro.Text, txtAutorLibro.Text, Convert.ToDecimal(txtPrecio.Text), Convert.ToInt32(txtStock.Text), Convert.ToInt32(txtAnioLibro.Text));

                if (estado == true)
                {
                    lblConfirmacion.Text = "Libro agregado con exito";
                    lblConfirmacion.ForeColor = System.Drawing.Color.Green;
                    txtAnioLibro.Text = string.Empty;
                    txtAutorLibro.Text = string.Empty;
                    txtNombreLibro.Text = string.Empty;
                    txtPrecio.Text = string.Empty;
                    txtStock.Text = string.Empty;
                    ddlCategorias.SelectedIndex = 0;
                }
                else
                {
                    lblConfirmacion.Text = "No se puede agregar el libro";
                    lblConfirmacion.ForeColor = System.Drawing.Color.Red;
                }
                cargarGridView();
            }
            else
            {
                lblConfirmacion.Text = "Categoria invalida";
                lblConfirmacion.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void cargarDDL()
        {
            DataTable tablaCategorias = negocioCategoria.getTabla();
            ddlCategorias.DataSource = tablaCategorias;
            ddlCategorias.DataTextField = "Nombre_Cat";
            ddlCategorias.DataValueField = "IdCategoria";
            ddlCategorias.DataBind();
            ddlCategorias.Items.Insert(0, new ListItem("--Seleccionar", "0"));
        }

        protected void cargarGridView()
        {
            DataTable tablaLibros = negocioLibro.getTabla();
            gvLibros.DataSource = tablaLibros;
            gvLibros.DataBind();
        }

        protected void gvLibros_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvLibros.EditIndex = e.NewEditIndex;
            cargarGridView();           
        }

        protected void gvLibros_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvLibros.EditIndex = -1;
            cargarGridView();
            lblConfirmacion.Text = "";
            
        }
     

        protected void gvLibros_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
                     
            string idLibro = ((Label)gvLibros.Rows[e.RowIndex].FindControl("lbl_eit_IdLibro")).Text;
            int categoria = ((DropDownList)gvLibros.Rows[e.RowIndex].FindControl("ddl_eit_Categoria")).SelectedIndex;
            string nombreLibro = ((TextBox)gvLibros.Rows[e.RowIndex].FindControl("txt_eit_NombreLibro")).Text;
            string autorLibro = ((TextBox)gvLibros.Rows[e.RowIndex].FindControl("txt_eit_AutorLibro")).Text;
            string precioLibro = ((TextBox)gvLibros.Rows[e.RowIndex].FindControl("txt_eit_PrecioLibro")).Text;
            string stockLibro = ((TextBox)gvLibros.Rows[e.RowIndex].FindControl("txt_eit_StockLibro")).Text;
            string AnioLibro = ((TextBox)gvLibros.Rows[e.RowIndex].FindControl("txt_eit_AnioLibro")).Text;

            Categoria cat = new Categoria();

            // CATEGORIA + 1, LAS CATEGORIAS NO SE ELIMINAN ASI QUE EL INDEX ES REFERENCIA CASI DIRECTA A SU ID AUTONUMERICO

            cat.setIdCategoria(categoria+1);

            Libro libro = new Libro(Convert.ToInt32(idLibro),nombreLibro,autorLibro,Convert.ToDecimal(precioLibro),Convert.ToInt32(stockLibro),
                Convert.ToInt32(AnioLibro),cat);
            
            
            if (negocioLibro.actualizarLibro(libro))
            {              
                lblConfirmacion.Text = "Libro actualizado";
                lblConfirmacion.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblConfirmacion.Text = "Error en la actualizacion";
                lblConfirmacion.ForeColor = System.Drawing.Color.Red;
            }

            gvLibros.EditIndex = -1;
            cargarGridView();
        }

        protected void gvLibros_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            
            string idLibro = ((Label)gvLibros.Rows[e.RowIndex].FindControl("lbl_it_IdLibro")).Text;

            Libro libro = new Libro(Convert.ToInt32(idLibro));

            //negocioLibro.eliminarLibro(libro);

            if (negocioLibro.DarBajaLibro(libro))
            {
                lblConfirmacion.Text = "Eliminacion exitosa";
                lblConfirmacion.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblConfirmacion.Text = "No se pudo eliminar el campo deseado";
                lblConfirmacion.ForeColor = System.Drawing.Color.Red;  
            }

            cargarGridView();
        }

      

       

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio.aspx");
        }

        protected void ddlCategorias_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvLibros_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvLibros.PageIndex = e.NewPageIndex;
            cargarGridView();
        }
    }
}