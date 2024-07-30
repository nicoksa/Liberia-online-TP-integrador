using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class DetalleVenta
    {
        private Venta _venta;
        private Libro _libro;
        private int _cantidad;
        private decimal _precioUnitario;

        public DetalleVenta()
        {

        } 

        public DetalleVenta(Venta venta,Libro libro,int cantidad,decimal precioUnitario)
        {
            _venta = venta;
            _libro = libro;
            _cantidad = cantidad;
            _precioUnitario = precioUnitario;
        }



        //GETTERS Y SETTERS


        public Venta getVenta()
        {
            return _venta;
        }

        public void setVenta(Venta venta)
        {
            _venta = venta;
        }


        public Libro getLibro()
        {
            return _libro;
        }


        public void setLibro(Libro libro)
        {
            _libro = libro;
        }


        public int getCantidad()
        {
            return _cantidad;
        }

        public void setCantidad(int cantidad)
        {
            _cantidad= cantidad;
        }

        public decimal getPrecioUnitario()
        {
            return _precioUnitario;
        }

        public void setPrecioUnitario(decimal precioUnitario)
        {
            _precioUnitario = precioUnitario;
        }

    }
}
