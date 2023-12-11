using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;
using MessageBox = System.Windows.Forms.MessageBox;
using DialogResult = System.Windows.Forms.DialogResult;
using MessageBoxButtons = System.Windows.Forms.MessageBoxButtons;
using System.Data;

namespace Vistas.Admin.Pedidos
{
    public partial class AgregarPedido : Admin
    {
        private NegocioPedidos _negocioPed = new NegocioPedidos();
        private NegocioArticulos _negocioArt = new NegocioArticulos();
        static private DataTable _tablaInicial;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                _tablaInicial = _negocioArt.ObtenerArticulos();
                gvAgregarPedido.DataSource = _tablaInicial;
                gvAgregarPedido.DataBind();
            }
        }

        protected void gvAgregarPedido_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EventoAgregar")
            {

                    var fila = gvAgregarPedido.Rows[Convert.ToInt32(e.CommandArgument)];
                    int cantidad = int.Parse(((TextBox)fila.FindControl("txt_it_Cantidad")).Text.Trim());
                    decimal cantidadM = Convert.ToDecimal(cantidad);

                    string Preciaso = fila.Cells[4].Text.Trim();
                    string[] Precioreal = Preciaso.Split(' ');
                    decimal precio = Convert.ToDecimal(Precioreal[0]);


                    Pedido nuevoPedido = new Pedido
                    {
                        Articulo = new Articulo
                        {

                            Id = int.Parse(fila.Cells[0].Text),
                            Nombre = fila.Cells[1].Text,
                            PrecioCompra = precio,
                            Categoria = new Categoria
                            {
                                ///  Id = int.Parse(fila.Cells[2].Text), ///Aca esta tomando "Arduino"
                            },
                            Estado = true
                        },
                        CostoTotal = precio * cantidadM,
                        Cantidad = cantidad,
                        Proveedor = new Proveedor
                        {
                            ///  Id = int.Parse(int.Parse(fila.Cells[3].Text), //esta tomando sica
                            Nombre = fila.Cells[3].Text,
                        }
                    };

                    if (ConfirmarPedido(nuevoPedido) == DialogResult.Yes)
                    {
                        if (_negocioPed.AgregarPedido(nuevoPedido))
                        {
                            MessageBox.Show("Pedido confirmado y realizado con éxito");
                        }
                    }
                
                ((TextBox)fila.FindControl("txt_it_Cantidad")).Text = "";
            }
        }

        private DialogResult ConfirmarPedido(Pedido pedido)
        {
            string mensaje = "Usted está a punto de hacer un pedido de:\n" +
                $"Producto: {pedido.Articulo.Nombre}\n" +
                $"Proveedor: {pedido.Proveedor.Nombre}\n" +
                $"Cantidad: {pedido.Cantidad} unidad(es)\n" +
                $"Total: ${pedido.CostoTotal}\n\n" +
                "¿Desea realizar el pedido?";

            return MessageBox.Show(mensaje, "Resumen del pedido", MessageBoxButtons.YesNo);
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string idArticulo = txtIdArticulo.Text.Trim();

            DataView dv = new DataView(_tablaInicial)
            {
                RowFilter = $"IDArticulo = {idArticulo}"
            };

            gvAgregarPedido.DataSource = idArticulo.Length > 0 ? dv.ToTable() : _tablaInicial;
            gvAgregarPedido.DataBind();            
        }
        protected void gvAgregarPedido_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAgregarPedido.PageIndex = e.NewPageIndex;
            gvAgregarPedido.DataBind();
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