using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Usuario
    {
        //PROPIEDADES DEL USUARIO
        private string _dniUsuario;
        private string _nombreUsuario;
        private string _apellidoUsuario;
        private string _contraseniaUsuario;
        private string _Usuario;
        private string _emailUsuario;


        //CONSTRUCTOR
        public Usuario()
        {

        }

        public Usuario(string nombreUsuario, string apellidoUsuario, string dniUsuario, string contraseniaUsuario, string usuario)
        {
            _dniUsuario = dniUsuario;
            _nombreUsuario = nombreUsuario;
            _apellidoUsuario = apellidoUsuario;
            _contraseniaUsuario = contraseniaUsuario;
            _Usuario = usuario;
        }


        public Usuario(string dniUsuario)
        {
            _dniUsuario = dniUsuario;
        }

        //GETTERS Y SETTER


        public string getDniUsuario()
        {
            return _dniUsuario;
        }

        public void setDniUsuario(string dniUsuario)
        {
            _dniUsuario = dniUsuario;
        }

        public string getNombreUsurio()
        {
            return _nombreUsuario;
        }

        public void setNombreUsuario(string nombreUsuario)
        {
            _nombreUsuario = nombreUsuario;
        }

        public string getApellidoUsuario()
        {
            return _apellidoUsuario;
        }

        public void setApellidoUsuario(string apellidoUsuario)
        {
            _apellidoUsuario = apellidoUsuario;
        }

        public string getContraseniaUsuario()
        {
            return _contraseniaUsuario;
        }

        public void setContraseniaUsuario(string contraseniaUsuario)
        {
            _contraseniaUsuario = contraseniaUsuario;
        }

        public string getUsuarioNick()
        {
            return _Usuario;
        }

        public void setUsuarioNick(string usuarioNick)
        {
            _Usuario = usuarioNick;
        }

        public string getEmailUsuario()
        {
            return _emailUsuario;
        }

        public void setEmailUsuario(string emailUsuario)
        {
            _emailUsuario = emailUsuario;
        }
    }
}
