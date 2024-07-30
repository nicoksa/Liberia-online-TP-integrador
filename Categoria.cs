using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Categoria
    {
        private int _idCategoria;
        private String _nombreCategoria;

        public Categoria()
        {
        }

        public Categoria(int idCategoria,string nombreCategoria)
        {
            _idCategoria = idCategoria;
            _nombreCategoria = nombreCategoria;
        }

        public int getIdCategoria()
        {
            return _idCategoria;
        }

        public void setIdCategoria(int idCategoria)
        {
            _idCategoria = idCategoria;
        }

        public String getNombreCategoria()
        {
            return _nombreCategoria;
        }


        public void setNombreCategoria(String nombreCategoria)
        {
            _nombreCategoria = nombreCategoria;
        }
    }
}
