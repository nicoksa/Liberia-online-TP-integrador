using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Entidades;



namespace Datos
{
     public class DaoCategoria
    {
        AccesoDatos accesoDatos = new AccesoDatos();
        
        public Categoria getCategoria(Categoria categoria)
        {
            DataTable tablaCategorias = accesoDatos.ObtenerTabla("Categoria", "SELECT* FROM CATEGORIA WHERE IdCategoria=" + categoria.getIdCategoria());
            categoria.setIdCategoria(Convert.ToInt32(tablaCategorias.Rows[0][0].ToString()));
            categoria.setNombreCategoria(tablaCategorias.Rows[0][1].ToString());

            return categoria;

        }


        public Boolean existeCategoria(Categoria categoria)
        {
            String consultaSql = "SELECT * FROM CATEGORIA WHERE Nombre_Cat ='" + categoria.getNombreCategoria()+"'";
            return accesoDatos.existe(consultaSql);
        }

        public DataTable getTablaCategorias()
        {
            DataTable tablaCategorias = accesoDatos.ObtenerTabla("Categoria", "SELECT*FROM CATEGORIA");
            return tablaCategorias;
        }

        public int agregarCategoria(Categoria categoria)
        {
            SqlCommand sqlCommand = new SqlCommand();
            ArmarParametrosCategoriaAgregar(ref sqlCommand, categoria);

            return accesoDatos.EjecutarProcedimientoAlmacenado(sqlCommand, "spAgregarCategoria");
        }

        private void ArmarParametrosCategoriaAgregar(ref SqlCommand sqlCommand,Categoria categoria)
        {
            SqlParameter sqlParameter = new SqlParameter();
            sqlParameter = sqlCommand.Parameters.Add("@NombreCategoria", SqlDbType.VarChar);
            sqlParameter.Value = categoria.getNombreCategoria();
        }

        public Boolean actualizarCategoria(SqlCommand sqlCommand)
        {
            int filasAfectadas = accesoDatos.EjecutarProcedimientoAlmacenado(sqlCommand, "spActualizarCategoria");

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
