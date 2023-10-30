using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace Vistas.Admin.Proveedores
{
    public partial class ListarProveedores : System.Web.UI.Page
    {
        private NegocioProveedores _negocio = new NegocioProveedores();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gvProveedores.DataSource = _negocio.ObtenerProveedores();
                gvProveedores.DataBind();
            }
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            string idProv = txtIdProveedor.Text.Trim();
            string nombre = txtNombreProveedor.Text.Trim();

            gvProveedores.DataSource = _negocio.ObtenerProveedores(idProv != "" ? int.Parse(idProv) : 0, nombre);
            gvProveedores.DataBind();
        }
    }
}