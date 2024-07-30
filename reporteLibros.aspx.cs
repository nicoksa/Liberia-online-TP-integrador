using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;



namespace Vistas
{
    public partial class reporteLibros : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCategoria_Click(object sender, EventArgs e)
        {
            try
            {
                string categoria = txtCategoria.Text;
                

                string cadenaConexion = @"Data Source=TAMI-VIDAL\SQLEXPRESS;Initial Catalog=TP_Integrador_Grupo3;Integrated Security=True"; // Actualiza esto con tu cadena de conexión real
                string query = @"SELECT Nombre_Cat as categoria, Libros.Nombre_Lib as Libro, Libros.Autor_Lib as Autor
                                FROM Libros
                                JOIN Categoria ON Libros.IdCategoria_Lib = Categoria.IdCategoria
                                WHERE Categoria.Nombre_Cat = @categoria";
                using (SqlConnection connection = new SqlConnection(cadenaConexion))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.Add(new SqlParameter("@categoria", categoria));
                        

                        SqlDataAdapter adapter = new SqlDataAdapter(command);
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);

                        gvCategorias.DataSource = dt;
                        gvCategorias.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnAutor_Click(object sender, EventArgs e)
        {
            try
            {
                string autor = txtAutor.Text;


                string cadenaConexion = @"Data Source=TAMI-VIDAL\SQLEXPRESS;Initial Catalog=TP_Integrador_Grupo3;Integrated Security=True"; 
                string query = @"SELECT Autor_Lib as Autor, Nombre_Lib as Libro, Precio_Lib As Precio
                                FROM Libros
                                WHERE Autor_Lib = @autor;";
                using (SqlConnection connection = new SqlConnection(cadenaConexion))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.Add(new SqlParameter("@autor", autor));


                        SqlDataAdapter adapter = new SqlDataAdapter(command);
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);

                        gvAutores.DataSource = dt;
                        gvAutores.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {

            }

        }
    }
 }
