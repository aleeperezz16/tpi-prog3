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
    public partial class ListarProveedores : Admin
    {
        private NegocioProveedores _negocio = new NegocioProveedores();
        static private DataTable _tablaProveedores;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarTablaInicial();
            }
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            string nombre = txtNombreProveedor.Text.Trim();

            DataView dv = new DataView(_tablaProveedores)
            {
                RowFilter = $"NombreProveedor LIKE '%{nombre}%'"
            };

            gvProveedores.DataSource = dv.ToTable();
            gvProveedores.DataBind();
        }

        protected void gvProveedores_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvProveedores.EditIndex = e.NewEditIndex;
            gvProveedores.DataBind();

            DropDownList ciudades =(DropDownList)gvProveedores.Rows[e.NewEditIndex].FindControl("ddl_eit_Ciudad");

            ciudades.DataSource = _negocio.ObtenerCiudades();
            ciudades.DataTextField = "NombreCiudad";
            ciudades.DataValueField = "CodigoCiudad";
            ciudades.DataBind();
        }

        protected void gvProveedores_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvProveedores.PageIndex = e.NewPageIndex;
            gvProveedores.DataBind();
        }

        protected void gvProveedores_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvProveedores.EditIndex = -1;
            gvProveedores.DataBind();
        }

        private void CargarTablaInicial(int id = 0, string nombre = "")
        {
            _tablaProveedores = _negocio.ObtenerProveedores();
            gvProveedores.DataSource = _tablaProveedores;
            gvProveedores.DataBind();
        }

        protected void gvProveedores_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var fila = gvProveedores.Rows[e.RowIndex];
            Proveedor proveedor = new Proveedor
            {
                Id = int.Parse(((Label)fila.FindControl("lbl_eit_Id")).Text),
                Nombre = ((TextBox)fila.FindControl("txt_eit_Nombre")).Text.Trim(),
                Telefono = ((TextBox)fila.FindControl("txt_eit_Telefono")).Text.Trim(),
                Email = ((TextBox)fila.FindControl("txt_eit_Email")).Text.Trim(),
                Direccion = ((TextBox)fila.FindControl("txt_eit_Direccion")).Text.Trim(),
                Ciudad = new Ciudad
                {
                    Codigo = int.Parse(((DropDownList)fila.FindControl("ddl_eit_Ciudad")).SelectedValue)
                }
            };

            _negocio.ModificarProveedor(proveedor);

            gvProveedores.EditIndex = -1;
            CargarTablaInicial();
        }

        protected void gvProveedores_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int idProv = int.Parse(((Label)gvProveedores.Rows[e.RowIndex].FindControl("lbl_eit_Id")).Text);
            _negocio.EliminarProveedor(idProv);

            CargarTablaInicial();
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