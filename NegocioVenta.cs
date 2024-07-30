using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using Entidades;
using System.Data;

namespace Negocio
{
    public class NegocioVenta
    {
        DaoVenta daoVenta = new DaoVenta();
        public DataTable getTabla(int rango1, int rango2,int codigo)
        {
            return daoVenta.getTablaReportes( rango1,rango2,codigo);
        }

        public bool cargarVenta(Venta venta)
        {
            int filasAfectadas = 0;

            filasAfectadas = daoVenta.cargarVenta(venta);

            if (filasAfectadas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public int ObtenerUltimoIdVenta()
        {
            return daoVenta.ObtenerUltimoIdVenta();
        }


        public decimal traerTotalVenta(int idVenta)
        {

            return daoVenta.traerTotalVenta(idVenta);
        }

        public string traerFechaVenta(Venta venta)
        {
            return daoVenta.traerFechaVenta(venta);
        }

    }
}
