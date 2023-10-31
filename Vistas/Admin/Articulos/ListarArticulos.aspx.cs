using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using System.Data;
using Negocio;

namespace Vistas
{
    public partial class FormularioArticulos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarProductosEnGrilla();
            }
        }

        protected void btnBuscararticulosid_Click(object sender, EventArgs e)
        {
            NegocioArticulos negocioArt = new NegocioArticulos();
            int id = 0;
            if (txtIdBuscarArticulo.Text.Trim().Length > 0) {id = Convert.ToInt32(txtIdBuscarArticulo.Text.Trim());}
            gvArticulos.DataSource = negocioArt.ObtenerArticulosActivos(id);
            gvArticulos.DataBind();
        }

        protected void gvArticulos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvArticulos.PageIndex = e.NewPageIndex;
            cargarProductosEnGrilla();
        }

        protected void gvArticulos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvArticulos.EditIndex = -1;
            cargarProductosEnGrilla();
        }

        protected void gvArticulos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int s_IdArticulo = Convert.ToInt32(((Label)gvArticulos.Rows[e.RowIndex].FindControl("lbl_it_idArticulo")).Text);
            NegocioArticulos negocio = new NegocioArticulos();
            bool Borro = negocio.eliminarArticulo(s_IdArticulo);

            if (Borro)
            {
                ///SE ELIMINO CORRECTAMENTE

            }
            {
                ///NO SE ELIMINO
            }

            cargarProductosEnGrilla();
        }

        protected void gvArticulos_RowEditing(object sender, GridViewEditEventArgs e)
        {
             gvArticulos.EditIndex = e.NewEditIndex;
            cargarProductosEnGrilla();
        }

        protected void gvArticulos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            NegocioArticulos _negocioArt = new NegocioArticulos();
            NegocioCategorias _negocioCat = new NegocioCategorias();
            NegocioProveedores _negocioProv = new NegocioProveedores();
            Articulo articuloEditado = new Articulo();
            Proveedor prov = new Proveedor();
            prov.Id = Convert.ToInt32(((DropDownList)gvArticulos.Rows[e.RowIndex].FindControl("ddl_eit_IdProveedor")).SelectedValue);

            articuloEditado.Id = Convert.ToInt32(((Label)gvArticulos.Rows[e.RowIndex].FindControl("lbl_eit_idArticulo")).Text);
            articuloEditado.Nombre = ((TextBox)gvArticulos.Rows[e.RowIndex].FindControl("txt_eit_NombreArticulo")).Text;
            articuloEditado.Categoria = _negocioCat.ObtenerCategoriaObjeto(Convert.ToInt32(((DropDownList)gvArticulos.Rows[e.RowIndex].FindControl("ddl_eit_IdCategoria")).SelectedValue));
            articuloEditado.Proveedor = prov;
            articuloEditado.PrecioVenta = Convert.ToDecimal(((TextBox)gvArticulos.Rows[e.RowIndex].FindControl("txt_eit_PrecioDeVenta")).Text);
            articuloEditado.PrecioCompra = Convert.ToDecimal(((TextBox)gvArticulos.Rows[e.RowIndex].FindControl("txt_eit_PrecioDeCompra")).Text);
            articuloEditado.Stock = Convert.ToInt32(((TextBox)gvArticulos.Rows[e.RowIndex].FindControl("txt_eit_Stock")).Text);
            articuloEditado.Estado = Convert.ToBoolean(((DropDownList)gvArticulos.Rows[e.RowIndex].FindControl("ddl_eit_Estado")).SelectedValue);

            bool filasAfectadas = _negocioArt.ModificarArticulo(articuloEditado);
            if (filasAfectadas)
            {
                //se actualizó
            }

            gvArticulos.EditIndex = -1;
            cargarProductosEnGrilla();
        }

        //FUNCIONES
        private void cargarProductosEnGrilla()
        {
            NegocioArticulos negocio = new NegocioArticulos();
            gvArticulos.DataSource = negocio.ObtenerTodosLosArticulos();
            gvArticulos.DataBind();

        }

        protected void gvArticulos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //ddl_eit_IdCategoria
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    NegocioCategorias _negocioCat = new NegocioCategorias();
                    NegocioProveedores _negocioProv = new NegocioProveedores(); 
                    DropDownList ddlCat = (DropDownList)e.Row.FindControl("ddl_eit_IdCategoria");
                    DropDownList ddlProv = (DropDownList)e.Row.FindControl("ddl_eit_IdProveedor");
                    //bind dropdown-list
                    DataTable dt = _negocioCat.ObtenerCategorias(-1);
                    ddlCat.DataSource = dt;
                    ddlCat.DataTextField = "NombreCategoria";
                    ddlCat.DataValueField = "IDCategoria";
                    ddlCat.DataBind();


                    ddlProv.DataSource = _negocioProv.ObtenerProveedores(-1);
                    ddlProv.DataTextField = "NombreProveedor";
                    ddlProv.DataValueField = "IDProveedor";
                    ddlProv.DataBind();

                }
            }
        }
    }
}