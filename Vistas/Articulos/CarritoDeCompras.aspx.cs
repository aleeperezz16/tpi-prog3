using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using Entidades;
using Negocio;
namespace Vistas.Articulos
{
    public partial class CarritoDeCompras : Index
    {
        private NegocioVentas _negocioVentas = new NegocioVentas();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Venta"] != null)
            {
                var articulos = (List<Venta>)Session["Venta"];

                gdvCarritoDeCompras.DataSource = articulos;
                gdvCarritoDeCompras.DataBind();

                ActualizarInfo(articulos);
            }
            else
            {
                OcultarCarrito();
            }
        }

        protected void btnComprar_Click(object sender, EventArgs e)
        {
            bool error = false;
            if (ConfirmarCompra() == DialogResult.Yes)
            {
                var lista = (List<Venta>)Session["Venta"];
                foreach (Venta articulo in lista)
                {
                    bool agrego = _negocioVentas.AgregarVenta(articulo);

                    if (!agrego)
                    {
                        error = true;
                        MessageBox.Show("No se pudo agregar el pedido del artículo: " + articulo.Articulo.Nombre, "Alerta");
                    }
                }

                if (!error)
                {
                    MessageBox.Show("Se agregó el pedido correctamente.", "Mensaje");
                    gdvCarritoDeCompras.Visible = false;
                    lblMensaje.Visible = true;
                }
            }
            else
            {
                MessageBox.Show("El pedido de compra, se ha cancelado.", "Mensaje de Cancelación");
            }
        }

        private DialogResult ConfirmarCompra()
        {
            string mensaje = "Usted está a punto de hacer una compra de:\n" +
                $"Productos: {lblCantArticulos.Text}\n" +
                $"Total: {lblTotal.Text}\n" +
                "¿Está seguro que quiere adquirir los productos y la cantidad especificada?\n\n";

            return MessageBox.Show(mensaje, "Confirmación", MessageBoxButtons.YesNo);
        }

        protected void gdvCarritoDeCompras_RowDeleting(object sender, GridViewDeleteEventArgs e)
        { 
        int rowIndex = e.RowIndex;
        int id= Convert.ToInt32(((Label)gdvCarritoDeCompras.Rows[rowIndex].FindControl("lbl_it_IDArticulo")).Text);
            var lista = (List<Venta>)Session["Venta"];
            foreach (Venta dato in lista)
            {
                if (id == dato.Articulo.Id)
                {
                    if (decimal.TryParse(lblTotal.Text, out decimal total) && int.TryParse( lblCantArticulos.Text, out int cantArt))
                        {
                        total -= dato.PrecioTotal;
                        lblTotal.Text = total.ToString();
                        cantArt -= dato.Cantidad;
                        lblCantArticulos.Text = cantArt.ToString();
                    }
                    break;
                }
            }
            lista.RemoveAt(rowIndex);
            Session["Venta"] = lista;
            gdvCarritoDeCompras.DataSource = lista;
            gdvCarritoDeCompras.DataBind();
        }

        protected void gdvCarritoDeCompras_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gdvCarritoDeCompras.PageIndex = e.NewPageIndex;
            var Articulos = (List<Venta>)Session["Venta"];
            gdvCarritoDeCompras.DataSource = Articulos;
            gdvCarritoDeCompras.DataBind();
        }

        protected void btnEliminarTodo_Click(object sender, EventArgs e)
        {
            Session["Venta"] = new List<Venta>();
        }

        private void ActualizarInfo(List<Venta> articulos)
        {
            int cantArt = 0;
            decimal Total = 0;
            foreach (Venta articulo in articulos)
            {
                cantArt += articulo.Cantidad;
                Total += articulo.PrecioTotal;
            }
             lblCantArticulos.Text = cantArt.ToString();
             lblTotal.Text = Total.ToString();
        }
        private void OcultarCarrito()
        {
            lblMensaje.Visible = true;
            gdvCarritoDeCompras.Visible = false;
            btnComprar.Enabled = false;
            btnEliminarTodo.Enabled = false;
        }
    }
}