using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Entidades;


namespace Datos
{

  
    public class DaoUsuario
    {
        AccesoDatos accesoDatos = new AccesoDatos();

        public int registrarUsuario(Usuario usuario)
        {
            SqlCommand sqlCommand = new SqlCommand();
            ArmarParametrosUsuarioAgregar(ref sqlCommand, usuario);
            return accesoDatos.EjecutarProcedimientoAlmacenado(sqlCommand, "SP_REGISTRARUSUARIO");
        }

        public void ArmarParametrosUsuarioAgregar(ref SqlCommand sqlCommand, Usuario usuario)
        {
            SqlParameter sqlParameter = new SqlParameter();
            sqlParameter = sqlCommand.Parameters.Add("@dniusuario", SqlDbType.VarChar, 12);
            sqlParameter.Value = usuario.getDniUsuario();

            sqlParameter = sqlCommand.Parameters.Add("@nombre_usuario", SqlDbType.VarChar, 25);
            sqlParameter.Value = usuario.getNombreUsurio();

            sqlParameter = sqlCommand.Parameters.Add("@apellido_usuario", SqlDbType.VarChar, 25);
            sqlParameter.Value = usuario.getApellidoUsuario();

            sqlParameter = sqlCommand.Parameters.Add("@contrasenia_usuario", SqlDbType.VarChar, 25);
            sqlParameter.Value = usuario.getContraseniaUsuario();

            sqlParameter = sqlCommand.Parameters.Add("@NombreUsuario", SqlDbType.VarChar, 25);
            sqlParameter.Value = usuario.getUsuarioNick();

            sqlParameter = sqlCommand.Parameters.Add("@EmailUsuario", SqlDbType.VarChar, 25);
            sqlParameter.Value = usuario.getEmailUsuario();

        }

        public bool ExisteUsuario(Usuario usuario)
        {
            string consultaSQL = "SELECT * FROM USUARIO WHERE NombreUsuario = '" + usuario.getUsuarioNick() + "' OR Dni_Us = '" + usuario.getDniUsuario() + "'";
            return accesoDatos.existe(consultaSQL);
        }

        public bool existeUsuarioregistro(Usuario usuario)
        {
            string consultaSQL = "SELECT * FROM USUARIO WHERE NombreUsuario = '" + usuario.getUsuarioNick() + "'";
            return accesoDatos.existe(consultaSQL);
        }

        public bool verificarContrasenia(Usuario usuario)
        {
            string consultaSQL = "SELECT * FROM USUARIO WHERE NombreUsuario = '" + usuario.getUsuarioNick() + "' AND Contraseña_Us = '" + usuario.getContraseniaUsuario() + "'";
            return accesoDatos.existe(consultaSQL);
        }

        public bool esAdmin(Usuario usuario)
        {
            string consultaSql = "SELECT * FROM USUARIO WHERE NombreUsuario = '" + usuario.getUsuarioNick() + "' AND EsAdmin_Us = 1";
            return accesoDatos.existe(consultaSql);
        }

        public DataTable getTablaUsuarios()
        {
            DataTable tablaUsuarios = accesoDatos.ObtenerTabla("Usuario", "SELECT* FROM Usuario");
            return tablaUsuarios;
        }

        public string traerUsuarioVenta(Venta venta)
        {
          
            string consultaSqlNombre = "SELECT DISTINCT Nombre_US + ' ' + Apellido_Us FROM Usuario INNER JOIN Venta ON Dni_Us = DniUsuario_Ven WHERE DniUsuario_Ven= Dni_Us AND IdVenta = '" + venta.getIdVenta() + "'";
            return accesoDatos.obtenerNombre(consultaSqlNombre);
        }


        public string traerDniUsuario(string nombreUsuario)
        {
            string consultaSqlDni = "SELECT Dni_Us FROM Usuario WHERE NombreUsuario = '"+nombreUsuario +"'";
            return accesoDatos.obtenerDni(consultaSqlDni);
        }

    }
}
