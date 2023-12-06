using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace Vistas.MiCuenta
{
    public partial class HistorialCompra : Index
    {
        private NegocioHistorial _negocio = new NegocioHistorial();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var usuario = HttpContext.Current.Session["Datos"];
                try
                {
                    Cliente cliente = (Cliente)usuario;
                    gvHistorial.DataSource = _negocio.ObtenerHistorial(cliente);
                    gvHistorial.DataBind();
                }
                catch(Exception error) { }

            }
        }
    }
}