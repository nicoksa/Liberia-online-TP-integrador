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
    public class NegocioUsuario
    {
        DaoUsuario daoUsuario = new DaoUsuario();
        DaoLibro daoLibro = new DaoLibro();
        public DataTable getTabla()
        {
            return daoUsuario.getTablaUsuarios();
        }

        public bool agregarUsuario(string nombreUsuario, string apellidoUsuario, string dniUsuario, string contraseniaUsuario, string nickUsuario,string emailUsuario)
        {
            int filasAfectadas = 0;

            Usuario usuario = new Usuario(); //CREO OBJETO DE TIPO USUARIO

            usuario.setNombreUsuario(nombreUsuario);
            usuario.setApellidoUsuario(apellidoUsuario);
            usuario.setDniUsuario(dniUsuario);
            usuario.setContraseniaUsuario(contraseniaUsuario);
            usuario.setUsuarioNick(nickUsuario);
            usuario.setEmailUsuario(emailUsuario);

            

            if (daoUsuario.ExisteUsuario(usuario) == false)
            {
                filasAfectadas = daoUsuario.registrarUsuario(usuario);
            }

            if (filasAfectadas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }//fin else
        }//FIN AGREGAR USUARIO

        public int consultarUsuario(string contraseniaUsuario, string nickUsuario)
        {
            int UsuarioNoRegistrado = 0;
            int ContraseniaIncorrecta = 1;
            int UsuarioYContraseniaCorrectos = 2;
            int UsuarioAdministrador = 3;

            Usuario usuario = new Usuario();
            usuario.setContraseniaUsuario(contraseniaUsuario);
            usuario.setUsuarioNick(nickUsuario);
            


            if (daoUsuario.esAdmin(usuario) && daoUsuario.verificarContrasenia(usuario))
            {
                return UsuarioAdministrador;
            }           

            if (daoUsuario.existeUsuarioregistro(usuario))
            {
                if (daoUsuario.verificarContrasenia(usuario))
                {
                    return UsuarioYContraseniaCorrectos;
                }
                else
                {
                    return ContraseniaIncorrecta;
                }
            }
            else
            {
                return UsuarioNoRegistrado;
            }
        }

        public string traerUsuarioVenta(Venta venta)
        {
            return daoUsuario.traerUsuarioVenta(venta);
        }


        public string traerDniUsuario(string nombreUsuario)
        {
            return daoUsuario.traerDniUsuario(nombreUsuario);
        }

    }
}
