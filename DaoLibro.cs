using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data.SqlClient;
using System.Data;

namespace Datos
{
    public class DaoLibro
    {
        AccesoDatos accesoDatos = new AccesoDatos();

        public int agregarLibro(Libro libro)
        {
            SqlCommand sqlCommand = new SqlCommand();

            ArmarParametrosLibroAgregar(ref sqlCommand, libro);

            return accesoDatos.EjecutarProcedimientoAlmacenado(sqlCommand, "spAgregarLibro");
        }

        public bool actualizarLibro(Libro libro)
        {
            SqlCommand sqlCommand = new SqlCommand();
            ArmarParametrosLibroActualizar(ref sqlCommand, libro);
            int filasAfectadas = accesoDatos.EjecutarProcedimientoAlmacenado(sqlCommand, "spActualizarLibro");

            if (filasAfectadas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool eliminarLibro(Libro libro)
        {
            SqlCommand sqlCommand = new SqlCommand();
            ArmarParametrosLibroEliminar(sqlCommand,libro);
            int filasAfectadas = accesoDatos.EjecutarProcedimientoAlmacenado(sqlCommand, "spEliminarLibro");

            if (filasAfectadas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public void ArmarParametrosLibroEliminar(SqlCommand sqlCommand, Libro libro)
        {
            SqlParameter sqlParameter = new SqlParameter();
            sqlParameter = sqlCommand.Parameters.Add("@IdLibro", SqlDbType.Int);
            sqlParameter.Value = libro.getIdLibro();
        }


        public void ArmarParametrosLibroAgregar(ref SqlCommand sqlCommand, Libro libro)
        {
            SqlParameter sqlParameter = new SqlParameter();
            sqlParameter = sqlCommand.Parameters.Add("@IdCategoria", SqlDbType.Int);
            sqlParameter.Value = libro.getCategoria().getIdCategoria();

            sqlParameter = sqlCommand.Parameters.Add("@NombreLibro", SqlDbType.VarChar, 25);
            sqlParameter.Value = libro.getNombreLibro();

            sqlParameter = sqlCommand.Parameters.Add("@AutorLibro", SqlDbType.VarChar, 25);
            sqlParameter.Value = libro.getAutorLibro();

            sqlParameter = sqlCommand.Parameters.Add("@PrecioLibro", SqlDbType.Money);
            sqlParameter.Value = libro.getPrecioLibro();

            sqlParameter = sqlCommand.Parameters.Add("@StockLibro", SqlDbType.Int);
            sqlParameter.Value = libro.getStockLibro();

            sqlParameter = sqlCommand.Parameters.Add("@AnioLibro", SqlDbType.Int);
            sqlParameter.Value = libro.getAnioLibro();
        }


        public void ArmarParametrosLibroActualizar(ref SqlCommand sqlCommand,Libro libro)
        {
            SqlParameter sqlParameter = new SqlParameter();

            sqlParameter = sqlCommand.Parameters.Add("@IdLibro", SqlDbType.Int);
            sqlParameter.Value = libro.getIdLibro();

            sqlParameter = sqlCommand.Parameters.Add("@Nombre_Lib", SqlDbType.VarChar, 25);
            sqlParameter.Value = libro.getNombreLibro();

            sqlParameter = sqlCommand.Parameters.Add("@Autor_Lib", SqlDbType.VarChar, 25);
            sqlParameter.Value = libro.getAutorLibro();

            sqlParameter = sqlCommand.Parameters.Add("@Precio_Lib", SqlDbType.Decimal);
            sqlParameter.Value = libro.getPrecioLibro();

            sqlParameter = sqlCommand.Parameters.Add("@Stock_Lib", SqlDbType.Int);
            sqlParameter.Value = libro.getStockLibro();

            sqlParameter = sqlCommand.Parameters.Add("@Anio_Lib", SqlDbType.Int);
            sqlParameter.Value = libro.getAnioLibro();

            sqlParameter = sqlCommand.Parameters.Add("@IdCategoria_Lib", SqlDbType.Int);
            sqlParameter.Value = libro.getCategoria().getIdCategoria();
        }


        public Boolean existeLibro(Libro libro)
        {
            String consultaSql = "SELECT * FROM LIBROS WHERE Nombre_Lib ='" + libro.getNombreLibro() + "'";
            return accesoDatos.existe(consultaSql);
        }

        public DataTable getTablaLibros()
        {
            DataTable tablaLibros = accesoDatos.ObtenerTabla("Libros", "SELECT IdLibro,Nombre_Cat, Nombre_Lib,Autor_Lib,Precio_Lib,Stock_Lib,Año_Lib FROM LIBROS INNER JOIN CATEGORIA ON IdCategoria_Lib = IdCategoria WHERE estado_lib = 1");
            return tablaLibros;
        }

        public DataTable BuscarLibros(string columnaSeleccionada, string textoBuscar)
        {
            string consulta = "";
            switch (columnaSeleccionada)
            {
                case "Nombre_Cat":
                    consulta = "SELECT libros.*, categoria.Nombre_Cat FROM libros " +
                            "INNER JOIN categoria ON libros.IdCategoria_Lib = categoria.IdCategoria " +
                            "WHERE categoria.Nombre_Cat LIKE @textoBuscar";
                    break;
                case "Nombre_Lib":
                    consulta = "SELECT libros.*, categoria.Nombre_Cat FROM libros " +
                            "INNER JOIN categoria ON libros.IdCategoria_Lib = categoria.IdCategoria " +
                            "WHERE libros.Nombre_Lib LIKE @textoBuscar";
                    break;
                case "Autor_Lib":
                    consulta = "SELECT libros.*, categoria.Nombre_Cat FROM libros " +
                            "INNER JOIN categoria ON libros.IdCategoria_Lib = categoria.IdCategoria " +
                            "WHERE libros.Autor_Lib LIKE @textoBuscar";
                    break;
                default:
                    consulta = "SELECT libros.*, categoria.Nombre_Cat FROM libros " +
                            "INNER JOIN categoria ON libros.IdCategoria_Lib = categoria.IdCategoria " +
                            "WHERE " + columnaSeleccionada + " LIKE @textoBuscar";
                    break;
            }

            using (SqlConnection connection = accesoDatos.ObtenerConexion())
            {
                SqlCommand command = new SqlCommand(consulta, connection);
                command.Parameters.AddWithValue("@textoBuscar", "%" + textoBuscar + "%");
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                return dataTable;
            }
        }


        public string traerNombreLibro(Libro libro)
        {
            string consultaSql = "SELECT Nombre_Lib FROM Libros WHERE IdLibro ='" + libro.getIdLibro() + "'"; 
            return accesoDatos.obtenerNombreLibro(consultaSql);
        }

        public bool DarBajaLibro(Libro libro)
        {
            SqlCommand sqlCommand = new SqlCommand();
            ArmarParametrosLibroEliminar(sqlCommand, libro);
            int filasAfectadas = accesoDatos.EjecutarProcedimientoAlmacenado(sqlCommand, "spDarBajaLibro");

            if (filasAfectadas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

     

    }
}
