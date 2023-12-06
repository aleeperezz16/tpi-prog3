using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Negocio;

namespace Vistas.Admin.Ventas
{
    public partial class ListarVentas : Admin
    {
        private NegocioVentas _negocio = new NegocioVentas();
        static private DataTable _tablaVentas;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlArticulos.DataSource = _negocio.ObtenerArticulos();
                ddlArticulos.DataTextField = "NombreArticulo";
                ddlArticulos.DataValueField = "IDArticulo";
                ddlArticulos.DataBind();

                CargarTablaInicial();
            }
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            string idVenta = txtIdVenta.Text.Trim();
            string dia = txtFechaDia.Text.Trim();
            string mes = txtFechaMes.Text.Trim();
            string anio = txtFechaAnio.Text.Trim();
            string dni = txtDniCliente.Text.Trim();
            string articulo = ddlArticulos.SelectedValue;

            if (articulo == "--Seleccionar--")
                articulo = "";

            DataView dv = new DataView(_tablaVentas)
            {
                RowFilter = $"IDVenta LIKE '%{idVenta}%' AND IDArticulo LIKE '%{articulo}%' AND FechaVenta LIKE '%{anio}{(mes.Length == 1 ? "0" : "")}{mes}{(dia.Length == 1 ? "0" : "")}{dia}%' AND DNICliente LIKE '%{dni}%'"
            };

            gvVentas.DataSource = dv.ToTable();
            gvVentas.DataBind();
        }

        protected void gvVentas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvVentas.PageIndex = e.NewPageIndex;
            gvVentas.DataBind();
        }

        private void CargarTablaInicial()
        {
            _tablaVentas = _negocio.ObtenerVentas();
            gvVentas.DataSource = _tablaVentas;
            gvVentas.DataBind();
        }
    }
}
