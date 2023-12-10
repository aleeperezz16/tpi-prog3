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
    public partial class AgregarProveedor : Admin
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

                VerUsuarioConectado();
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
            Proveedor proveedor = new Proveedor()
            {
                Nombre = txtNombreProveedor.Text.Trim(),
                Telefono = txtTelefono.Text.Trim(),
                Email = txtEmail.Text.Trim(),
                Direccion = txtDireccion.Text.Trim(),
                Ciudad = new Ciudad()
                {
                    Codigo = int.Parse(ddlCiudad.SelectedValue)
                }
            };

            if (_negocio.AgregarProveedor(proveedor))
            {
                lblNotificacion.Text = "Se pudo agregar el proveedor exitosamente";
                txtNombreProveedor.Text = "";
                txtTelefono.Text = "";
                txtEmail.Text = "";
                txtDireccion.Text = "";
            }
            else
            {
                lblNotificacion.Text = "No se pudo agregar el proveedor";
            }
        }

        private void CargarCiudades(int id = 0, int idProvincia = 0)
        {
            ddlCiudad.DataSource = _negocio.ObtenerCiudades(id, idProvincia);
            ddlCiudad.DataValueField = "CodigoCiudad";
            ddlCiudad.DataTextField = "NombreCiudad";
            ddlCiudad.DataBind();
        }

        public void VerUsuarioConectado()
        {
            var datos = Session["Datos"];

            if (datos.GetType() == typeof(Usuario))
            {
                Usuario usuarito = (Usuario)Session["Datos"];
                lblCuentaIngresada.Text = usuarito.Alias;
            }
            else
            {
                Cliente Clientesito = (Cliente)Session["Datos"];
                lblCuentaIngresada.Text = Clientesito.Nombre + " " + Clientesito.Apellido;
            }
        }
    }
}