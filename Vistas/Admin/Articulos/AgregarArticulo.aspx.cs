using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;

namespace Vistas
{
    public partial class AgregarSucursal : System.Web.UI.Page
    {
        static private NegocioCategorias _negocioCat = new NegocioCategorias();
        static private NegocioProveedores _negocioProv = new NegocioProveedores();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlCategoria.DataSource = _negocioCat.ObtenerCategorias(-1);
                ddlCategoria.DataTextField = "NombreCategoria";
                ddlCategoria.DataValueField = "IDCategoria";
                ddlCategoria.DataBind();

                ddlProveedor.DataSource = _negocioProv.ObtenerProveedoresActivos(-1);
                ddlProveedor.DataTextField = "NombreProveedor";
                ddlProveedor.DataValueField = "IDProveedor";
                ddlProveedor.DataBind();
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {

            Articulo nuevaArticulo = new Articulo();
            NegocioArticulos manejoArt = new NegocioArticulos();

            nuevaArticulo.Nombre = txtNombreArticulo.Text.Trim();
            nuevaArticulo.Categoria = _negocioCat.ObtenerCategoriaObjeto(Convert.ToInt32(ddlCategoria.SelectedValue));
            nuevaArticulo.Proveedor = _negocioProv.ObtenerProveedorObjeto(Convert.ToInt32(ddlProveedor.SelectedValue));
            nuevaArticulo.PrecioVenta = Convert.ToDecimal(txtPrecioDeVenta.Text.Trim());
            nuevaArticulo.PrecioCompra = Convert.ToDecimal(txtPrecioDeCompra.Text.Trim());
            nuevaArticulo.Stock = Convert.ToInt32(txtStock.Text.Trim());

            lblResultado.Text = manejoArt.agregarArticulo(nuevaArticulo) ? "La sucursal se ha agregado con exito" : "No se pudo agregar la sucursal";
        }
    }
}