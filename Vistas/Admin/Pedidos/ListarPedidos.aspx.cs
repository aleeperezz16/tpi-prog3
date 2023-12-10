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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarTablaInicial();
            }
        }

        private void CargarTablaInicial()
        {
            gvListarPedidos.DataSource = _negocioPed.ObtenerPedidos();
            gvListarPedidos.DataBind();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            DataView dv = new DataView((DataTable)gvListarPedidos.DataSource)
            {
                RowFilter = $"Id = {txtBuscar.Text.Trim()}"
            };

            gvListarPedidos.DataSource = dv.ToTable();
            gvListarPedidos.DataBind();

            txtBuscar.Text = "";
         
            /*try
            {
                ///USO LA EXCEPCION DE FUERA DE RANGO del Row Con un Try Catch PARA CUANDO SÉ QUE NO ENCONTRÓ NADA
                String IDArticulo = ((Label)gvListarPedidos.Rows[0].FindControl("lbl_it_IDArticulo")).Text;//agarre cualquier dato
            }
            catch
            {
                System.Windows.Forms.MessageBox.Show("No hubo coincidencias, por favor intente con otro ID", "Informe");
            }*/
        }

        protected void btnVistaInicial_Click(object sender, EventArgs e)
        {
            txtBuscar.Text = "";
            CargarTablaInicial();
        }

        protected void gdvListarPedidos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvListarPedidos.PageIndex = e.NewPageIndex;
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

   

