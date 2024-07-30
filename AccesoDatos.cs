using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    class AccesoDatos
    {
        //CONSTRUCTOR VACIO
        String cadenaConexion = @"Data Source=DESKTOP-7P1LKKU\SQLEXPRESS;Initial Catalog=TP_Integrador_Grupo3;Integrated Security=True";
        public AccesoDatos()
        {

        }

        public SqlConnection ObtenerConexion()
        {
            SqlConnection sqlConnection = new SqlConnection(cadenaConexion);
            try
            {
                sqlConnection.Open();
                return sqlConnection;
            }
            catch(Exception)
            {
                return null;
            }            
        }


        private SqlDataAdapter ObtenerAdaptador(String consultaSql,SqlConnection sqlConnection)
        {
            
            try
            {
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(consultaSql, sqlConnection);
                return sqlDataAdapter;
            }
            catch (Exception)
            {
                return null;
            }
        }

        public DataTable ObtenerTabla(string nombreTabla, String consultaSql)
        {
            DataSet dataSet = new DataSet();
            SqlConnection sqlConnection = ObtenerConexion();
            SqlDataAdapter sqlDataAdapter = ObtenerAdaptador(consultaSql,sqlConnection);
            sqlDataAdapter.Fill(dataSet, nombreTabla);
            sqlConnection.Close();

            return dataSet.Tables[nombreTabla];
        }

        public int EjecutarProcedimientoAlmacenado(SqlCommand sqlCommand, String nombreProcedimiento)
        {
            int filasAfectadas=0;
            SqlConnection sqlConnection = ObtenerConexion();
            sqlCommand.Connection = sqlConnection;
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = nombreProcedimiento;
            filasAfectadas = sqlCommand.ExecuteNonQuery();

            return filasAfectadas;
        }

        public Boolean existe(String consultaSql)
        {
            Boolean estado = false;
            SqlConnection sqlConnection = ObtenerConexion();
            SqlCommand sqlCommand = new SqlCommand(consultaSql, sqlConnection);
            SqlDataReader datos = sqlCommand.ExecuteReader();
            if (datos.Read())
            {
                estado = true;
            }
            return estado;
        }

        public string obtenerNombre(string consultaSql)
        {
            string nombreCliente = "";
            SqlConnection sqlConnection = ObtenerConexion();
            SqlCommand sqlCommand = new SqlCommand(consultaSql, sqlConnection);
            SqlDataReader datos = sqlCommand.ExecuteReader();

            if (datos.Read())
            {
                nombreCliente = datos[0].ToString();
            }
        
            datos.Close();
       
            return nombreCliente;
                    
        }


        public string obtenerDni(string consultaSql)
        {
            string dni = "";
            SqlConnection sqlConnection = ObtenerConexion();
            SqlCommand sqlCommand = new SqlCommand(consultaSql, sqlConnection);
            SqlDataReader datos = sqlCommand.ExecuteReader();

            if (datos.Read())
            {
                dni = datos[0].ToString();
            }

            datos.Close();

            return dni;

        }


        public int obtenerIdVenta(string consultaSql)
        {
            int idVenta=0;
            SqlConnection sqlConnection = ObtenerConexion();
            SqlCommand sqlCommand = new SqlCommand(consultaSql, sqlConnection);
            SqlDataReader datos = sqlCommand.ExecuteReader();

            if (datos.Read())
            {
                idVenta = Convert.ToInt32(datos[0]);
            }
            datos.Close();

            return idVenta;
        }


        public string obtenerNombreLibro(string consultaSql)
        {
            string nombreLibro = "";
            SqlConnection sqlConnection = ObtenerConexion();
            SqlCommand sqlCommand = new SqlCommand(consultaSql, sqlConnection);
            SqlDataReader datos = sqlCommand.ExecuteReader();

            if (datos.Read())
            {
                nombreLibro = datos[0].ToString();
            }
            datos.Close();

            return nombreLibro;
        }


        public decimal obtenerTotalVenta(string consultaSql)
        {
            decimal totalVenta = 0;
            SqlConnection sqlConnection = ObtenerConexion();
            SqlCommand sqlCommand = new SqlCommand(consultaSql, sqlConnection);
            SqlDataReader datos = sqlCommand.ExecuteReader();

            if (datos.Read())
            {
                totalVenta = Convert.ToDecimal(datos[0]);
            }
            datos.Close();

            return totalVenta;

        }


        public string obtenerFechaVenta(string consultaSql)
        {
            string fecha = "";

            SqlConnection sqlConnection = ObtenerConexion();
            SqlCommand sqlCommand = new SqlCommand(consultaSql, sqlConnection);
            SqlDataReader datos = sqlCommand.ExecuteReader();

            if (datos.Read())
            {
                fecha = Convert.ToString(datos[0]);
            }

            datos.Close();

            return fecha;
        }



    }
}
