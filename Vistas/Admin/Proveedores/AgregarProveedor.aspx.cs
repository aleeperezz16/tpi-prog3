using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;
using System.Data;


namespace Vistas.Admin.Proveedores
{
    public partial class AgregarProveedor : System.Web.UI.Page
    {
        private NegocioCiudad negocioCiudad = new NegocioCiudad();
        private NegocioProvincia negocioProvincia = new NegocioProvincia();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlProvincia.DataValueField = "CodigoProvincia";
                ddlProvincia.DataTextField = "NombreProvincia";
                ddlProvincia.DataSource = negocioProvincia.ObtenerProvincias();
                ddlProvincia.DataBind();


                ddlCiudad.DataValueField = "CodigoCiudad";
                ddlProvincia.DataTextField = "NombreCiudad";
                ddlCiudad.DataSource = negocioCiudad.ObtenerCiudades();
                ddlCiudad.DataBind();


            }


        }

        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = ddlProvincia.SelectedValue;


            for (int i = 1; i < ddlCiudad.Items.Count; i++)
            {
                ListItem item = ddlCiudad.Items[i];
                item.Enabled = item.Value != id;


            }

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Proveedor proveedor = new Proveedor();

            proveedor.Nombre = tbNombreProveedor.Text;
            proveedor.Telefono = tbTelefono.Text;
            proveedor.Email = tbEmail.Text;
            proveedor.Direccion = tbDireccion.Text;
            proveedor.Ciudad = Convert.ToInt32(ddlCiudad.SelectedValue);

            NegocioProveedores negocioProveedores = new NegocioProveedores();

            if (!negocioProveedores.AgregarProveedor(proveedor))
            {
                lblError.Text = "No se pudo agregar el proveedor";
            }

        }
    }
}