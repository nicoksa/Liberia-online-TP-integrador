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
    public class DaoDetalleVenta
    {
        AccesoDatos accesoDatos = new AccesoDatos();


        public DataTable getTablaDetalleVenta(Venta venta)
        {
            DataTable tablaDetalleVenta = accesoDatos.ObtenerTabla("DetalleVenta", "SELECT IdVenta_DV, Nombre_Lib, Cantidad_DV, PrecioUnitario FROM DetalleVenta INNER JOIN Libros ON IdLibro_DV = iDlIBRO WHERE IdVenta_DV= '" + venta.getIdVenta() + "'");
            return tablaDetalleVenta;
        }

        public void ArmarParametrosDetalleVentaAgregar(ref SqlCommand sqlCommand, DetalleVenta detalleVenta)
        {
            SqlParameter sqlParameter = new SqlParameter();

            sqlParameter = sqlCommand.Parameters.Add("@IdVenta", SqlDbType.Int);
            sqlParameter.Value = detalleVenta.getVenta().getIdVenta();

            sqlParameter = sqlCommand.Parameters.Add("@IdLibro", SqlDbType.Int);
            sqlParameter.Value = detalleVenta.getLibro().getIdLibro();

            sqlParameter = sqlCommand.Parameters.Add("@Cantidad", SqlDbType.Int);
            sqlParameter.Value = detalleVenta.getCantidad();

            sqlParameter = sqlCommand.Parameters.Add("@PrecioUnitario", SqlDbType.Money);
            sqlParameter.Value = detalleVenta.getPrecioUnitario();
        }

        public int CargarDetalleVenta(DetalleVenta detalleVenta)
        {
            SqlCommand sqlCommand = new SqlCommand();
            ArmarParametrosDetalleVentaAgregar(ref sqlCommand, detalleVenta);
            return accesoDatos.EjecutarProcedimientoAlmacenado(sqlCommand, "spCargarDetalleVenta");
        }

        

    }
}
