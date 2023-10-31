using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Entidades;
using Negocio;

namespace Vistas
{
    public partial class FormularioClientes : System.Web.UI.Page
    {
        private NegocioClientes _negocio = new NegocioClientes();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarClientesEnGrilla();
            }
        }

        private void CargarClientesEnGrilla(int id = 0)
        {
            gdvClientes.DataSource = _negocio.ObtenerClientes(id);
            gdvClientes.DataBind();
        }

        protected void btnBuscarClientePorId_Click(object sender, EventArgs e)
        {
            CargarClientesEnGrilla(int.Parse(lblBuscarClientePorId.Text.Trim()));
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
    }
}