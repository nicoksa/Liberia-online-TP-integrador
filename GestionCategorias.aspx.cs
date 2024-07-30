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
    public partial class GestionCategorias : System.Web.UI.Page
    {
        NegocioCategoria negocioCategoria = new NegocioCategoria();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarGridView();
                if (Session["nombreUsuario"] != null)
                {
                    lblUsuario.Text = Session["nombreUsuario"].ToString();
                }
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            Boolean estado = false;
            estado = negocioCategoria.agregarCategoria(txtAgregarCategoria.Text);

            if(estado == true)
            {
                lblConfirmacion.Text = "Categoria agregada con exito";
                lblConfirmacion.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblConfirmacion.Text = "No se pudo agregar la categoria";
                lblConfirmacion.ForeColor = System.Drawing.Color.Red;
            }
            cargarGridView();
            txtAgregarCategoria.Text = string.Empty;
        }

        protected void gvCategorias_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCategorias.EditIndex = e.NewEditIndex;
            cargarGridView();

        }

        protected void gvCategorias_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCategorias.EditIndex = -1;
            cargarGridView();
            lblConfirmacion.Text = "";

        }

        protected void gvCategorias_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string idCategoria = ((Label)gvCategorias.Rows[e.RowIndex].FindControl("lbl_eit_idCategoria")).Text;
            string nombreCategoria = ((TextBox)gvCategorias.Rows[e.RowIndex].FindControl("txt_eit_NombreCategoria")).Text;

            Categoria categoria = new Categoria(Convert.ToInt32(idCategoria),nombreCategoria);

            if (negocioCategoria.ActualizarCategoria(categoria))
            {
                lblConfirmacion.Text = "Actualización exitosa";
            }
            else
            {
                lblConfirmacion.Text = "Error en la actualización";
            }
            

            gvCategorias.EditIndex = -1;
            cargarGridView();

        }

        protected void cargarGridView()
        {
            DataTable tablaCategorias = negocioCategoria.getTabla();
            gvCategorias.DataSource = tablaCategorias;
            gvCategorias.DataBind();
        }

        protected void txtAgregarCategoria_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio.aspx");
        }

        protected void gvCategorias_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCategorias.PageIndex = e.NewPageIndex;
            cargarGridView();
        }
    }
}