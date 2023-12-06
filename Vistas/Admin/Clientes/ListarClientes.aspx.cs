using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Entidades;
using Negocio;

namespace Vistas.Admin.Clientes
{
    public partial class ListarClientes : Admin
    {
        private NegocioClientes _negocio = new NegocioClientes();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarTablaInicial();
            }
        }

        private void CargarTablaInicial()
        {
            gdvClientes.DataSource = _negocio.ObtenerClientes();
            gdvClientes.DataBind();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
                CargarClientesEnGrilla(int.Parse(txtBuscar.Text.Trim()));

        }
        protected void gdvClientes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            _negocio.EliminarCliente(int.Parse(((Label)gdvClientes.Rows[e.RowIndex].FindControl("lbl_it_DNI")).Text.Trim()));
            CargarClientesEnGrilla();
        }

        protected void gdvClientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gdvClientes.PageIndex = e.NewPageIndex;
            CargarClientesEnGrilla();
        }

        protected void gdvClientes_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gdvClientes.EditIndex = e.NewEditIndex;
            CargarClientesEnGrilla();
        }
        
        protected void gdvClientes_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Cliente clienteAEditar = new Cliente();
            Ciudad ciudad = new Ciudad();
            Usuario usuario = new Usuario();
            ciudad.Codigo = Convert.ToInt32(((DropDownList)gdvClientes.Rows[e.RowIndex].FindControl("ddl_eit_Ciudad")).SelectedValue);
            usuario.Alias = ((TextBox)gdvClientes.Rows[e.RowIndex].FindControl("txt_eit_Alias")).Text;
            usuario.Contrasenia = ((TextBox)gdvClientes.Rows[e.RowIndex].FindControl("txt_eit_Contrasenia")).Text;

            clienteAEditar.Dni = Convert.ToInt32(((TextBox)gdvClientes.Rows[e.RowIndex].FindControl("txt_eit_DNI")).Text);
            clienteAEditar.Apellido = ((TextBox)gdvClientes.Rows[e.RowIndex].FindControl("txt_eit_Apellido")).Text;
            clienteAEditar.Nombre = ((TextBox)gdvClientes.Rows[e.RowIndex].FindControl("txt_eit_Nombre")).Text;
            clienteAEditar.Telefono = ((TextBox)gdvClientes.Rows[e.RowIndex].FindControl("txt_eit_Telefono")).Text;
            clienteAEditar.Direccion = ((TextBox)gdvClientes.Rows[e.RowIndex].FindControl("txt_eit_Direccion")).Text;
            clienteAEditar.Email = ((TextBox)gdvClientes.Rows[e.RowIndex].FindControl("txt_eit_EMail")).Text;
            clienteAEditar.Usuario = usuario;
            clienteAEditar.Ciudad = ciudad; 
            clienteAEditar.Estado = ((CheckBox)gdvClientes.Rows[e.RowIndex].FindControl("chkBoxEditEstado")).Checked;

            _negocio.ModificarCliente(clienteAEditar);
            gdvClientes.EditIndex = -1;
            CargarClientesEnGrilla();
        }

        protected void gdvClientes_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    NegocioCiudades _negocioCiudades = new NegocioCiudades();
                    DataTable dt = _negocioCiudades.ObtenerCiudades();

                    DropDownList ddlCiudades = (DropDownList)e.Row.FindControl("ddl_eit_Ciudad");
                    ddlCiudades.DataSource = dt;
                    ddlCiudades.DataTextField = "NombreCiudad";
                    ddlCiudades.DataValueField = "CodigoCiudad";
                    ddlCiudades.DataBind();
                }
            }
        }
        
        protected void gdvClientes_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gdvClientes.EditIndex = -1;
            CargarClientesEnGrilla();

        }

    }
}