using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;


namespace Vistas.Admin.Categorias
{
    public partial class AgregarCategoria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAgregarcat_Click(object sender, EventArgs e)
        {
            Categoria nuevacategoria = new Categoria();
            
            NegocioCategorias manejoCat = new NegocioCategorias();

            nuevacategoria.Nombre = tbNombre.Text.Trim();
            nuevacategoria.Descripcion = tbDescripcion.Text.Trim();


            lblResultado.Text = manejoCat.agregarCategoria(nuevacategoria) ? "La Categoria se ha agregado con exito" : "No se pudo agregar la categoria";
        }
       
    }
    
}