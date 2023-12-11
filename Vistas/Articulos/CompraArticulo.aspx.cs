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
        static private DataTable _tabla;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlCategorias.DataSource = _negocioCat.ObtenerCategorias();
                ddlCategorias.DataTextField = "NombreCategoria";
                ddlCategorias.DataValueField = "IDCategoria";
                ddlCategorias.DataBind();

                _tablaInicial = _negocioArt.ObtenerArticulos();
                _tabla = _tablaInicial.Copy();

                gvComprarArticulos.DataSource = _tablaInicial;
                gvComprarArticulos.DataBind();
            }
        }

        protected void gvComprarArticulos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvComprarArticulos.PageIndex = e.NewPageIndex;

            gvComprarArticulos.DataSource = _tabla;
            gvComprarArticulos.DataBind();
        }

        protected void ddlCategorias_SelectedIndexChanged(object sender, EventArgs e)
        {
            string categoria = ddlCategorias.SelectedValue;
            DataView dv = new DataView(_tablaInicial)
            {
                RowFilter = $"IDCategoria = {categoria}"
            };

            _tabla = categoria != "-- Seleccione --" ? dv.ToTable() : _tablaInicial.Copy();

            gvComprarArticulos.DataSource = _tabla;
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
                    PrecioUnitario = decimal.Parse(fila.Cells[3].Text.Substring(1)),
                    Articulo = new Articulo
                    {
                        Id = int.Parse(((Label)fila.FindControl("lblIDArticulo")).Text),
                        Nombre = fila.Cells[1].Text
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
                if (cantidad > int.Parse(fila.Cells[4].Text))
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

            Session["Venta"] = lista;

            ((TextBox)fila.FindControl("txt_it_Cantidad")).Text = "";
        }

        protected void btnBuscarxID_Click(object sender, EventArgs e)
        {

        }

        protected void btnVistaPrincipal_Click(object sender, EventArgs e)
        {

        }
    }
}