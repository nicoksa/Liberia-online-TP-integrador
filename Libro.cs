using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Libro
    {
        private int _idLibro;        
        private Categoria _categoria;
        private string _nombre;
        private string _autor;
        private decimal _precio;
        private int _stock;
        private int _anio;

        //CONSTRUCTOR VACIO
        public Libro()
        {
        }

        public Libro(int idLibro)
        {
            _idLibro = idLibro;
        }

        public Libro(int idLibro,string nombre,string autor,decimal precio,int stock,int anio,Categoria categoria)
        {
            _idLibro = idLibro;
            _categoria = categoria;
            _nombre = nombre;
            _autor = autor;
            _precio = precio;
            _stock = stock;
            _anio = anio;
        }

        

        //GETTERS Y SETTER

        public int getIdLibro()
        {
            return _idLibro;
        }

        public void setIdLibro(int idLibro)
        {
            _idLibro = idLibro;
        }

        public Categoria getCategoria()
        {
            return _categoria;
        }

        public void setCategoria(Categoria categoria)
        {
            _categoria = categoria;
        }

        public string getNombreLibro()
        {
            return _nombre; 
        }

        public void setNombreLibro(string nombre)
        {
            _nombre = nombre;
        }

        public string getAutorLibro()
        {
            return _autor;
        }

        public void setAutorLibro(string autor)
        {
            _autor = autor;
        }

        public decimal getPrecioLibro()
        {
            return _precio;
        }

        public void setPrecioLibro(decimal precio)
        {
            _precio = precio;
        }

        public int getStockLibro()
        {
            return _stock;
        }

        public void setStockLibro(int stock)
        {
            _stock = stock;
        }

        public int getAnioLibro()
        {
            return _anio;
        }

        public void setAnioLibro(int anio)
        {
            _anio = anio;
        }


    }
}
