using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Provincia
    {
        public int Codigo { get; set; }
        public string Nombre { get; set; }
        public Pais Pais { get; set; }

        public Provincia() { }

        public Provincia(int codigo, string nombre, Pais pais)
        {
            Codigo = codigo;
            Nombre = nombre;
            Pais = pais;
        }
    }
}
