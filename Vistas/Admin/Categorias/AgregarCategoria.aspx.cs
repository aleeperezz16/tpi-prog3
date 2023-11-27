using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using Entidades;
using Negocio;


namespace Vistas.Admin.Categorias
{
    public partial class AgregarCategoria : Admin
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblResultado.Text = "";
        }

        protected void btnAgregarcat_Click(object sender, EventArgs e)
        {
            Categoria nuevacategoria = new Categoria();
            NegocioCategorias manejoCat = new NegocioCategorias();
            nuevacategoria.Nombre = tbNombre.Text.Trim();
            nuevacategoria.Descripcion = tbDescripcion.Text.Trim();
            tbNombre.Text = "";
            tbDescripcion.Text = "";
            bool agrego = manejoCat.agregarCategoria(nuevacategoria);
            if (!agrego) 
            {
                MessageBox.Show("Se agregó la Categoría correctamente","Mensaje");
            }
            else
            {
                MessageBox.Show("No se pudo agregar la categoria", "Mensaje");
            }
            
        }
       
    }
    
}