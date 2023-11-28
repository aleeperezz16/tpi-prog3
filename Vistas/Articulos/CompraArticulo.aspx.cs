using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace Vistas.Articulos
{
    public partial class CompraArticulo : System.Web.UI.Page
    {
        NegocioCategorias _negocioCat = new NegocioCategorias();
        NegocioArticulos negocio = new NegocioArticulos();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlCategorias.DataSource = _negocioCat.ObtenerCategorias();
                ddlCategorias.DataTextField = "NombreCategoria";
                ddlCategorias.DataValueField = "IDCategoria";
                ddlCategorias.DataBind();
                cargarArticulosEnGrilla();
            }
        }


        protected void btnVistaPrincipal_Click(object sender, EventArgs e)
        {
            tbBuscarxID.Text = "";
            gdvComprarArticulos.PageIndex = 0;
            cargarArticulosEnGrilla();
        }


        protected void gdvComprarArticulos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gdvComprarArticulos.PageIndex = e.NewPageIndex;
            cargarArticulosEnGrilla();
        }

        private void cargarArticulosEnGrilla()
        {
            NegocioArticulos negocio = new NegocioArticulos();
            gdvComprarArticulos.DataSource = negocio.ObtenerArticulosActivos(0);
            gdvComprarArticulos.DataBind();
        }



        protected void btnBuscarxID_Click(object sender, EventArgs e)
        {
            ddlCategorias.SelectedIndex = 0;
            int num = Convert.ToInt32(tbBuscarxID.Text.Trim());
            tbBuscarxID.Text = "";
            NegocioArticulos negocio = new NegocioArticulos();
            System.Windows.Forms.MessageBox.Show("articulo ID: "+num, "Informe");
            gdvComprarArticulos.DataSource = negocio.ObtenerArticulosActivos(num);
            gdvComprarArticulos.DataBind();

            try
            {
                String IDArticulo = ((Label)gdvComprarArticulos.Rows[0].FindControl("lbl_it_IDArticulo")).Text;//agarre cualquier dato
            }
            catch
            {
                System.Windows.Forms.MessageBox.Show("No hubo coincidencias, por favor intente con otro ID", "Informe");
            }
        }


        protected void ddlCategorias_SelectedIndexChanged(object sender, EventArgs e)
        {

                int Catelegida = Convert.ToInt32(ddlCategorias.SelectedValue);
                NegocioArticulos negocio = new NegocioArticulos();
                gdvComprarArticulos.DataSource = negocio.ObtenerArticulosxCategoriaActivos(Catelegida);
                gdvComprarArticulos.DataBind();

        }





    }
}