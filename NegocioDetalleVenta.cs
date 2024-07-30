using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Datos;
using Entidades;

namespace Negocio
{
    public class NegocioDetalleVenta
    {
        DaoDetalleVenta dao = new DaoDetalleVenta();
        public DataTable getTabla(Venta venta)
        {
            return dao.getTablaDetalleVenta(venta);
        }

       public bool CargarDetalleVenta(DetalleVenta detalleVenta)
        {

            int filasAfectadas = 0;

            filasAfectadas = dao.CargarDetalleVenta(detalleVenta);

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
