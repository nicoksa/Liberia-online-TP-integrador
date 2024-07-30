using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Venta
    {
        private int _idVenta;
        private Usuario _usuario;
        private decimal _totalVenta;


        public Venta()
        {

        }


        public Venta(Usuario usuario,decimal totalVenta)
        {
            _usuario = usuario;
            _totalVenta = totalVenta;
        }

        public Venta(int idVenta)
        {
            _idVenta = idVenta;
        }

        public Venta(Usuario usuario)
        {
            _usuario = usuario;
        }




        public int getIdVenta()
        {
            return _idVenta;
        }

        public void setIdVenta(int idVenta)
        {
            _idVenta = idVenta;
        }


        public Usuario getUsuario()
        {
            return _usuario;
        }
        public void setUsuario(Usuario usuario)
        {
            _usuario = usuario;
        }

        public decimal getTotalVenta()
        {
            return _totalVenta;
        }

        public void setTotalVenta(decimal totalVenta)
        {
            _totalVenta = totalVenta;
        }
    }
}
