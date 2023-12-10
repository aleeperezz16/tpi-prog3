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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarTablaInicial();
            }
        }

        protected void gvAgregarPedido_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EventoAgregar")
            {
                var fila = gvAgregarPedido.Rows[Convert.ToInt32(e.CommandArgument)];
                int cantidad = int.Parse(((TextBox)fila.FindControl("txt_it_Cantidad")).Text.Trim());
                Pedido nuevoPedido = new Pedido
                {
                    Articulo = new Articulo
                    {
                        Id = int.Parse(((Label)fila.FindControl("lbl_it_IdArticulo")).Text.Trim()),
                        Nombre = ((Label)fila.FindControl("lbl_it_NombreArticulo")).Text.Trim(),
                        PrecioCompra = decimal.Parse(((Label)fila.FindControl("lbl_it_PrecioCompra")).Text.Trim()),
                        Categoria = new Categoria
                        {
                            Id = int.Parse(((Label)fila.FindControl("lbl_it_IdCategoria")).Text.Trim()),
                        },
                        Estado = true
                    },
                    CostoTotal = decimal.Parse(((Label)fila.FindControl("lbl_it_PrecioCompra")).Text.Trim()) * cantidad,
                    Cantidad = cantidad,
                    Proveedor = new Proveedor
                    {
                        Id = int.Parse(((Label)fila.FindControl("lbl_it_IDProveedor")).Text.Trim()),
                    }
                };

                if (ConfirmarPedido(nuevoPedido) == DialogResult.Yes)
                {
                    if (_negocioPed.AgregarPedido(nuevoPedido))
                    {
                        MessageBox.Show("Pedido confirmado y realizado con éxito");
                    }
                }
                else
                {
                }
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

        private void CargarTablaInicial()
        {
            gvAgregarPedido.DataSource = _negocioArt.ObtenerArticulos();
            gvAgregarPedido.DataBind();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            DataView dv = new DataView(_negocioArt.ObtenerArticulos())
            {
                RowFilter = $"Id = {txtBuscarArt.Text.Trim()}"
            };

            gvAgregarPedido.DataSource = dv.ToTable();
            gvAgregarPedido.DataBind();
            
            /*try
            {
                ///USO LA EXCEPCION DE FUERA DE RANGO del Row Con un Try Catch PARA CUANDO SÉ QUE NO ENCONTRÓ NADA
                String PrecioCompra = ((Label)gvAgregarPedido.Rows[0].FindControl("lbl_it_PrecioCompra")).Text;
            }
            catch
            {
                    System.Windows.Forms.MessageBox.Show("No hubo coincidencias, por favor intente con otro ID", "Informe");
            }*/
        }

        protected void btnVistaInicial_Click(object sender, EventArgs e)
        {
            CargarTablaInicial();
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