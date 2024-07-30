using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Entidades;
using Datos;
using System.Data.SqlClient;

namespace Negocio
{
    public class NegocioCategoria
    {

        public DataTable getTabla()
        {
            DaoCategoria daoCategoria = new DaoCategoria();
            return daoCategoria.getTablaCategorias();
        }

        public bool agregarCategoria(String nombreCategoria)
        {
            int filasAfectadas = 0;

            Categoria categoria = new Categoria();
            categoria.setNombreCategoria(nombreCategoria);

            DaoCategoria daoCategoria = new DaoCategoria();

            if (daoCategoria.existeCategoria(categoria) == false)
            {
                filasAfectadas = daoCategoria.agregarCategoria(categoria);
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

        public bool ActualizarCategoria(Categoria categoria)
        {
            DaoCategoria daoCategoria = new DaoCategoria();

            SqlCommand sqlCommand = new SqlCommand();
            SqlParameter sqlParameter = new SqlParameter();

            sqlParameter = sqlCommand.Parameters.Add("IdCategoria", SqlDbType.Int);
            sqlParameter.Value = categoria.getIdCategoria();

            sqlParameter = sqlCommand.Parameters.Add("@Nombre_Cat", SqlDbType.VarChar, 25);
            sqlParameter.Value = categoria.getNombreCategoria();

            return daoCategoria.actualizarCategoria(sqlCommand);

        }
    }
}
