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
        private NegocioProveedores _negocio = new NegocioProveedores();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlProvincia.DataSource = _negocio.ObtenerProvincias();
                ddlProvincia.DataValueField = "CodigoProvincia";
                ddlProvincia.DataTextField = "NombreProvincia";
                ddlProvincia.DataBind();
            }
        }

        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlProvincia.SelectedValue != "--Seleccionar--")
            {
                CargarCiudades(idProvincia: int.Parse(ddlProvincia.SelectedValue));
            }
            else
            {
                ddlCiudad.Items.Clear();
                ddlCiudad.Items.Add(new ListItem("--Seleccione una provincia--", "--Seleccione una provincia--"));
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Proveedor proveedor = new Proveedor();
            Ciudad ciudad = new Ciudad();
            ciudad.Codigo = int.Parse(ddlCiudad.SelectedValue);

            proveedor.Nombre = txtNombreProveedor.Text.Trim();
            proveedor.Telefono = txtTelefono.Text.Trim();
            proveedor.Email = txtEmail.Text.Trim();
            proveedor.Direccion = txtDireccion.Text.Trim();
            proveedor.Ciudad = ciudad;

            if (!_negocio.AgregarProveedor(proveedor))
                lblError.Text = "No se pudo agregar el proveedor";
        }

        private void CargarCiudades(int id = 0, int idProvincia = 0)
        {
            ddlCiudad.DataSource = _negocio.ObtenerCiudades(id, idProvincia);
            ddlCiudad.DataValueField = "CodigoCiudad";
            ddlCiudad.DataTextField = "NombreCiudad";
            ddlCiudad.DataBind();
        }
    }
}