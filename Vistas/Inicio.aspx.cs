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
                    Usuario  usuarito = (Usuario)Session["Datos"];
                    lblCuentaIngresada.Text = usuarito.Alias;
                }
                else
                {
                    HabilitarCliente();
                    Cliente Clientesito = (Cliente)Session["Datos"];
                    lblCuentaIngresada.Text = Clientesito.Nombre + " "+ Clientesito.Apellido;
                }

            }

        }

        protected void btnCerrarsesion_Click(object sender, EventArgs e)
        {
            Session["Datos"] = null;
            Response.Redirect("Login.aspx");
        }

        public void HabilitarAdmin()
        {
            hlListarArticulos.Visible = true;
            hlListarproveedores.Visible = true;
            hlListarpedidos.Visible = true;
            hlListarventas.Visible = true;
            hlListarclientes.Visible = true;
            hlListarCategorias.Visible = true;
            hlAgregarproveedores.Visible = true;
            hlAgregarPedido.Visible = true;
            hlAgregarCategorias.Visible = true;

            lblSeccioncategoria.Visible = true;
            lblSeccionpedidos.Visible = true;
            lblSeccionproveedores.Visible = true;
            lblSeccionVentas.Visible = true;

        }
        public void HabilitarCliente()
        {
            hlComprarArticulos.Visible = true;
            hlGestionarMiCuenta.Visible = true;
            hlHistorialCompras.Visible = true;
            lnkCarrito.Visible = true;
            lblCuenta.Visible = true;

        }
    }
}