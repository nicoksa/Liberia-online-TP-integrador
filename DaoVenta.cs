using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Entidades;
using System.Data.SqlClient;


namespace Datos
{
    public class DaoVenta
    {
        AccesoDatos accesoDatos = new AccesoDatos();
        public DataTable getTablaReportes(int rango1,int rango2,int codigo)
        {
            //DEPENDE EL CODIGO ARMAMOS LA TABLA DE REPORTES

            if (codigo == 1) 
            {
                DataTable tablaReportes = accesoDatos.ObtenerTabla("Venta", @"SELECT 
                        Venta.IdVenta AS IdVenta,
                        Usuario.Nombre_Us AS Nombre,
                        Usuario.Apellido_Us AS Apellido,
                        Libros.Nombre_Lib AS Libro,
                        DetalleVenta.Cantidad_DV AS Cantidad,
                        Venta.Total_Ven AS Total
                    FROM 
                        Venta
                    JOIN 
                        Usuario ON Venta.DniUsuario_Ven = Usuario.Dni_Us
                    JOIN 
                        DetalleVenta ON Venta.IdVenta = DetalleVenta.IdVenta_DV
                    JOIN 
                        Libros ON DetalleVenta.IdLibro_DV = Libros.IdLibro
                    WHERE 
                        Venta.IdVenta BETWEEN'" + rango1 + "' AND '" + rango2 + "'");
                return tablaReportes;
            }
            else 
            {
                DataTable tablaReportes = accesoDatos.ObtenerTabla("Venta", @"
                SELECT 
                    Venta.IdVenta AS IdVenta,
                    Usuario.Nombre_Us AS Nombre,
                    Usuario.Apellido_Us AS Apellido,
                    Libros.Nombre_Lib AS Libro,
                    DetalleVenta.Cantidad_DV AS Cantidad,
                    Venta.Total_Ven AS Total
                FROM 
                    Venta
                JOIN 
                    Usuario ON Venta.DniUsuario_Ven = Usuario.Dni_Us
                JOIN 
                    DetalleVenta ON Venta.IdVenta = DetalleVenta.IdVenta_DV
                JOIN 
                    Libros ON DetalleVenta.IdLibro_DV = Libros.IdLibro
                WHERE 
                    Venta.Total_Ven BETWEEN'" + rango1 + "' AND '" + rango2 + "'");
                return tablaReportes;
            }

            

        }


        public int cargarVenta(Venta venta)
        {
            SqlCommand sqlCommand = new SqlCommand();
            ArmarParametrosParaCargarVenta(ref sqlCommand,venta);

            return accesoDatos.EjecutarProcedimientoAlmacenado(sqlCommand, "spCargarVenta");
        }


        public void ArmarParametrosParaCargarVenta(ref SqlCommand sqlCommand,Venta venta)
        {
            SqlParameter sqlParameter = new SqlParameter();
            sqlParameter = sqlCommand.Parameters.Add("@DniUsuario_Ven", SqlDbType.VarChar,12);
            sqlParameter.Value = venta.getUsuario().getDniUsuario();

            sqlParameter = sqlCommand.Parameters.Add("@Total_Ven", SqlDbType.Money);
            sqlParameter.Value = venta.getTotalVenta();
        }

        public int ObtenerUltimoIdVenta()
        {
            string consultaSql = "SELECT MAX(IdVenta)from Venta";
            return accesoDatos.obtenerIdVenta(consultaSql);
        }

        public decimal traerTotalVenta(int idVenta)
        {
            string consultaSql = "SELECT Total_Ven FROM Venta WHERE IdVenta ='"+idVenta +"'";
            return accesoDatos.obtenerTotalVenta(consultaSql);
        }

        public string traerFechaVenta(Venta venta)
        {
            string consultaSql = "SELECT Fecha_Ven FROM Venta WHERE IdVenta ='" + venta.getIdVenta() + "'";
            return accesoDatos.obtenerFechaVenta(consultaSql);
        }
    }
}
