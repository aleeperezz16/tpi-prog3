using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Entidades;
using Negocio;

namespace Vistas.Admin.Pedidos
{
    public partial class ListarPedidos : Admin
    {
        private NegocioPedidos _negocioPed = new NegocioPedidos();
        static private DataTable _tablaInicial;
        static private DataTable _tabla;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                _tablaInicial = _negocioPed.ObtenerPedidos();
                _tabla = _tablaInicial.Copy();

                gvListarPedidos.DataSource = _tablaInicial;
                gvListarPedidos.DataBind();
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string id = txtBuscar.Text.Trim();
            DataView dv = new DataView(_tablaInicial)
            {
                RowFilter = $"IDPedido = {id}"
            };

            _tabla = id.Length > 0 ? dv.ToTable() : _tablaInicial.Copy();

            gvListarPedidos.DataSource = _tabla;
            gvListarPedidos.DataBind();

            txtBuscar.Text = "";
        }

        protected void gdvListarPedidos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvListarPedidos.PageIndex = e.NewPageIndex;

            gvListarPedidos.DataSource = _tabla;
            gvListarPedidos.DataBind();
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

   

