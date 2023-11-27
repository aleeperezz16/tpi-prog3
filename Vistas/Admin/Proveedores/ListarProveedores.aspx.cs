using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;

namespace Vistas.Admin.Proveedores
{
    public partial class ListarProveedores : Admin
    {
        private NegocioProveedores _negocio = new NegocioProveedores();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarProveedoresEnGrilla();
            }
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            string idProv = txtIdProveedor.Text.Trim();
            string nombre = txtNombreProveedor.Text.Trim();

            CargarProveedoresEnGrilla(idProv != "" ? int.Parse(idProv) : 0, nombre);
        }

        protected void gvProveedores_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvProveedores.EditIndex = e.NewEditIndex;
            CargarProveedoresEnGrilla();

            DropDownList ciudades = (DropDownList)gvProveedores.Rows[e.NewEditIndex].FindControl("ddlEditCiudad");

            ciudades.DataSource = _negocio.ObtenerCiudades();
            ciudades.DataTextField = "NombreCiudad";
            ciudades.DataValueField = "CodigoCiudad";
            ciudades.DataBind();
        }

        protected void gvProveedores_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvProveedores.PageIndex = e.NewPageIndex;
            CargarProveedoresEnGrilla();
        }

        protected void gvProveedores_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvProveedores.EditIndex = -1;
            CargarProveedoresEnGrilla();
        }

        private void CargarProveedoresEnGrilla(int id = 0, string nombre = "")
        {
            gvProveedores.DataSource = _negocio.ObtenerProveedores(id, nombre);
            gvProveedores.DataBind();
        }

        protected void gvProveedores_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int idProv = int.Parse(((Label)gvProveedores.Rows[e.RowIndex].FindControl("lblEditId")).Text);
            string nombre = ((TextBox)gvProveedores.Rows[e.RowIndex].FindControl("txtEditNombre")).Text.Trim();
            string telefono = ((TextBox)gvProveedores.Rows[e.RowIndex].FindControl("txtEditTelefono")).Text.Trim();
            string email = ((TextBox)gvProveedores.Rows[e.RowIndex].FindControl("txtEditEmail")).Text.Trim();
            string direccion = ((TextBox)gvProveedores.Rows[e.RowIndex].FindControl("txtEditDireccion")).Text.Trim();
            int codigoCiudad = int.Parse(((DropDownList)gvProveedores.Rows[e.RowIndex].FindControl("ddlEditCiudad")).SelectedValue);
            bool estado = ((CheckBox)gvProveedores.Rows[e.RowIndex].FindControl("chkEditEstado")).Checked;

            Ciudad ciudad = new Ciudad();
            ciudad.Codigo = codigoCiudad;

            Proveedor proveedor = new Proveedor(idProv, nombre, telefono, email, direccion, ciudad, estado);
            _negocio.ModificarProveedor(proveedor);

            gvProveedores.EditIndex = -1;
            CargarProveedoresEnGrilla();
        }

        protected void gvProveedores_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int idProv = int.Parse(((Label)gvProveedores.Rows[e.RowIndex].FindControl("lblItemId")).Text);
            _negocio.EliminarProveedor(idProv);

            CargarProveedoresEnGrilla();
        }
    }
}