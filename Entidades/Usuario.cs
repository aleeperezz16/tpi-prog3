using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Usuario
    {
        public string Alias { get; set; }
        public string Contrasenia { get; set; }
        public bool Tipo { get; set; }

        public Usuario() { }

        public Usuario(string alias, string contrasenia, bool tipo)
        {
            Alias = alias;
            Contrasenia = contrasenia;
            Tipo = tipo;
        }
    }
}
