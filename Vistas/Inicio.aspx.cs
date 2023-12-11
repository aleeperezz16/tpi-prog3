using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;

namespace Vistas
{
    public partial class Inicio : Index
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var datos = Session["Datos"];

                if (datos.GetType() == typeof(Usuario))
                {
                    HabilitarAdmin();
                    lblCuentaIngresada.Text = ((Usuario)datos).Alias;
                }
                else
                {
                    HabilitarCliente();
                    lblCuentaIngresada.Text = ((Cliente)datos).Usuario.Alias;
                }
            }
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["Datos"] = null;
            Response.Redirect("Login.aspx");
        }

        public void HabilitarAdmin()
        {
            hlnkListarArticulos.Visible = true;
            hlnkListarProveedores.Visible = true;
            hlnkListarPedidos.Visible = true;
            hlnkListarVentas.Visible = true;
            hlnkListarClientes.Visible = true;
            hlnkListarCategorias.Visible = true;
            hlnkAgregarProveedores.Visible = true;
            hlnkAgregarPedido.Visible = true;
            hlnkAgregarCategorias.Visible = true;
            hlEstadisticas.Visible = true;

            lblSeccionCategoria.Visible = true;
            lblSeccionPedidos.Visible = true;
            lblSeccionProveedores.Visible = true;
            lblSeccionVentas.Visible = true;
        }

        public void HabilitarCliente()
        {
            hlnkComprarArticulos.Visible = true;
            hlnkGestionarMiCuenta.Visible = true;
            hlnkHistorialCompras.Visible = true;
            hlnkCarrito.Visible = true;
            lblCuenta.Visible = true;
        }
    }
}