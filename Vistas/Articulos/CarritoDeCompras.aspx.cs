using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;
namespace Vistas.Articulos
{
    public partial class Carrito : System.Web.UI.Page
    
    {
        private NegocioVentas _daoVenta = new NegocioVentas();

        protected void Page_Load(object sender, EventArgs e)
        {
            VerUsuarioConectado();
            if (Session["Venta"] != null)
            {
                var Articulos = (List<DetalleVenta>)Session["Venta"];
                gdvCarritoDeCompras.DataSource = Articulos;
                gdvCarritoDeCompras.DataBind();
                ActualizarInfo(Articulos);
            }
            else
            {
                ocultarCarrito();
            }
        }
         protected void btnComprar_Click(object sender, EventArgs e)
        {
            int resultado = ArmarDialogo();
            if (resultado == 6)
            {
                Venta venta = new Venta
                {
                    Cliente = (Cliente)Session["Datos"],
                    PrecioTotal = decimal.Parse(lblTotal.Text),
                };

                int idVenta = _daoVenta.agregarVenta(venta);

                if (idVenta == 0)
                {
                    System.Windows.Forms.MessageBox.Show("No se pudo agregar la venta.", "Alerta");
                    return;
                }

                var lista = (List<DetalleVenta>)Session["Venta"];
                if (!_daoVenta.AgregarDetalleVenta(idVenta, lista))
                {
                    System.Windows.Forms.MessageBox.Show("No se pudo realizar correctamente la compra de los productos", "Alerta");
                }
                else
                {

                    System.Windows.Forms.MessageBox.Show("Se agregó el pedido correctamente.", "Mensaje");
                    gdvCarritoDeCompras.Visible = false;
                    lblMensaje.Visible = true;
                }

            }
            else
            {
                System.Windows.Forms.MessageBox.Show("El pedido de compra, se ha cancelado.", "Mensaje de Cancelación");
            }
        }
        public int ArmarDialogo()
        {
            string mensaje = "Usted está a punto de hacer una compra de:\n" + "Productos: " + lblCantArticulos.Text + " \n TOTAL: " + lblTotal.Text + "\n" +
            "¿Está seguro que quiere adquirir los productos y la cantidad especificada?" + "\n \n " +
            "  ALERTA!: ÉSTA ACCIÓN NO SE PUEDE DESHACER. ";
            string titulo = "Mensaje de Confirmacion";
            System.Windows.Forms.MessageBoxButtons botones = System.Windows.Forms.MessageBoxButtons.YesNo;
            System.Windows.Forms.DialogResult resultado;
            resultado = System.Windows.Forms.MessageBox.Show(mensaje, titulo, botones);

            return (int)resultado;
        }

        protected void gdvCarritoDeCompras_RowDeleting(object sender, GridViewDeleteEventArgs e)
        { 
            int rowIndex = e.RowIndex;
            int id = Convert.ToInt32(((Label)gdvCarritoDeCompras.Rows[rowIndex].FindControl("lbl_it_IDArticulo")).Text);
            var lista = (List<DetalleVenta>)Session["Venta"];
            foreach (DetalleVenta venta in lista)
            {
                if (id == venta.Articulo.Id)
                {
                    if (decimal.TryParse(lblTotal.Text, out decimal total) && int.TryParse( lblCantArticulos.Text, out int cantArt))
                    {
                        total -= venta.PrecioUnitario * venta.Cantidad;
                        lblTotal.Text = total.ToString();
                        cantArt -= venta.Cantidad;
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
            var Articulos = (List<DetalleVenta>)Session["Venta"];
            gdvCarritoDeCompras.DataSource = Articulos;
            gdvCarritoDeCompras.DataBind();
        }

        protected void btnEliminarTodo_Click(object sender, EventArgs e)
        {
            Session["Venta"] = null;
        }
        private void ActualizarInfo(List<DetalleVenta> articulos)
        {
            int cantArt = 0;
            decimal Total = 0;
            foreach (DetalleVenta articulo in articulos)
            {
                cantArt += articulo.Cantidad;
                Total += articulo.PrecioUnitario;
            }
             lblCantArticulos.Text = cantArt.ToString();
             lblTotal.Text = Total.ToString();
        }
        private void ocultarCarrito()
        {
            lblMensaje.Visible = true;
            gdvCarritoDeCompras.Visible = false;
            btnComprar.Enabled = false;
            btnEliminarTodo.Enabled = false;
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