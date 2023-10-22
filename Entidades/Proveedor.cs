using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Proveedor
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Telefono { get; set; }
        public string Email { get; set; }
        public Ciudad Ciudad { get; set; }
        public bool Estado { get; set; }

        public Proveedor() { }

        public Proveedor(int id, string nombre, string telefono, string email, Ciudad ciudad, bool estado)
        {
            Id = id;
            Nombre = nombre;
            Telefono = telefono;
            Email = email;
            Ciudad = ciudad;
            Estado = estado;
        }
    }
}
