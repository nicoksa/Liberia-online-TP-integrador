using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Datos;
using System.Data;
using System.Data.SqlClient;



namespace Negocio
{
    public class NegocioLibro
    {
        DaoLibro daoLibro = new DaoLibro();

        public DataTable getTabla()
        {           
            return daoLibro.getTablaLibros();
        }


        public bool agregarLibro(Categoria categoria,string nombre,string autor,decimal precio, int stock,int anio)
        {
            int filasAfectadas = 0;
            Libro libro = new Libro();

            libro.setCategoria(categoria);
            libro.setNombreLibro(nombre);
            libro.setAutorLibro(autor);
            libro.setPrecioLibro(precio);
            libro.setStockLibro(stock);
            libro.setAnioLibro(anio);

            

            if (daoLibro.existeLibro(libro)==false)
            {
                filasAfectadas = daoLibro.agregarLibro(libro);                
            } 
          

             if(filasAfectadas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }                     
        }


        public bool actualizarLibro(Libro libro)
        {                      
            return daoLibro.actualizarLibro(libro);
        }


        public bool eliminarLibro(Libro libro)
        {
            return daoLibro.eliminarLibro(libro);
        }

        public DataTable BuscarLibros(string columnaSeleccionada, string textoBuscar)
        {
            return daoLibro.BuscarLibros(columnaSeleccionada, textoBuscar);
        }


        public string traerNombreLibro(Libro libro)
        {
            return daoLibro.traerNombreLibro(libro);
        }


        public bool DarBajaLibro(Libro libro)
        {

            return daoLibro.DarBajaLibro(libro);
        }
    }
}
