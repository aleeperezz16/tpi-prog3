using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;
using MessageBox = System.Windows.Forms.MessageBox;

namespace Vistas.Articulos
{
    public partial class CompraArticulo : Index
    {
        private NegocioCategorias _negocioCat = new NegocioCategorias();
        private NegocioArticulos _negocioArt = new NegocioArticulos();
        static private DataTable _tablaInicial;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlCategorias.DataSource = _negocioCat.ObtenerCategorias();
                ddlCategorias.DataTextField = "Categoria";
                ddlCategorias.DataValueField = "Id";
                ddlCategorias.DataBind();

                _tablaInicial = _negocioArt.ObtenerArticulos();
                gvComprarArticulos.DataSource = _tablaInicial;
                gvComprarArticulos.DataBind();
            }
        }

        protected void gvComprarArticulos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvComprarArticulos.PageIndex = e.NewPageIndex;
            gvComprarArticulos.DataBind();
        }

        protected void ddlCategorias_SelectedIndexChanged(object sender, EventArgs e)
        {
            string categoria = ddlCategorias.SelectedItem.Text;
            DataView dv = new DataView(_tablaInicial)
            {
                RowFilter = $"Categoria = '{categoria}'"
            };

            gvComprarArticulos.DataSource = categoria != "-- Seleccione --" ? dv.ToTable() : _tablaInicial;            
            gvComprarArticulos.DataBind();
        }

        protected void gvComprarArticulos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EventoAgregar")
            {
                if (Session["Venta"] == null)
                {
                    Session["Venta"] = new List<DetalleVenta>();
                }

                var fila = gvComprarArticulos.Rows[Convert.ToInt32(e.CommandArgument)];
                DetalleVenta detalleVenta = new DetalleVenta
                {
                    Cantidad = int.Parse(((TextBox)fila.FindControl("txt_it_Cantidad")).Text),
                    PrecioUnitario = decimal.Parse(fila.Cells[2].Text),
                    Articulo = new Articulo
                    {
                        Id = int.Parse(((Label)fila.FindControl("lbl_it_IdArticulo")).Text),
                        Nombre = ((Label)fila.FindControl("lbl_it_Articulo")).Text
                    }
                };

                AgregarDetalleVenta(detalleVenta, fila);
            }
        }

        private void AgregarDetalleVenta(DetalleVenta nuevoDetalle, GridViewRow fila)
        {
            var lista = (List<DetalleVenta>)Session["Venta"];
            DetalleVenta detalle = lista.Find(x => x.Articulo.Id == nuevoDetalle.Articulo.Id);
            if (detalle != null)
            {
                int cantidad = nuevoDetalle.Cantidad + detalle.Cantidad;
                if (cantidad > int.Parse(fila.Cells[3].Text))
                {
                    MessageBox.Show("Alcanzaste el stock máximo disponible", "Aviso");
                    return;
                }
                else
                {
                    detalle.Cantidad = cantidad;
                }
            }
            else
            {
                lista.Add(nuevoDetalle);
            }

            ((TextBox)fila.FindControl("txt_it_Cantidad")).Text = "";
        }
    }
}