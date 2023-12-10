using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;


namespace Vistas.Admin.Pedidos
{
    public partial class AgregarPedido : Admin
    {
        NegocioPedidos n_pedido = new NegocioPedidos();
        Articulo articulo = new Articulo();
        Proveedor proveedor = new Proveedor();
        NegocioArticulos negocioArt = new NegocioArticulos();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarProductosEnGrilla();
                VerUsuarioConectado();
            }

        }

        protected void gdvAgregarpedido_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "EventoAgregar")
            {
                int fila = Convert.ToInt32(e.CommandArgument);
                ///Como no pude hacer funcionar requiredfieldvni regularexpresionv dentro del gridview lo hardcodié
                String Cantidad = ((TextBox)gdvAgregarpedido.Rows[fila].FindControl("tbCantidadaComprar")).Text.Trim();///
                if (Cantidad == "")
                {
                    System.Windows.Forms.MessageBox.Show("Debe ingresar una cantidad a comprar", "Mensaje Alerta");
                }
                else
                {
                    int CantidadAComprar = 0;
                    bool valornumerico = int.TryParse(Cantidad, out CantidadAComprar);
                    if (valornumerico)
                    {
                        int resultado = ArmarDialogo(CantidadAComprar, fila);

                        if (resultado == 6)
                            {
                                String Estado = ((Label)gdvAgregarpedido.Rows[fila].FindControl("lbl_it_Estado")).Text;
                                Pedido pedidoarmado = ArmarPedido(CantidadAComprar, fila);

                                if (Estado == "True")
                                {
                                    bool agrego = n_pedido.agregarPedido(pedidoarmado);

                                    if (!agrego)
                                    {
                                        System.Windows.Forms.MessageBox.Show("Se agregó el pedido correctamente.", "Mensaje");
                                    }
                                    else
                                    {
                                        System.Windows.Forms.MessageBox.Show("No se pudo agregar el pedido.", "Alerta");
                                    }
                                }
                                else
                                {
                                    System.Windows.Forms.MessageBox.Show("No se pueden comprar articulos dados de baja.", "Alerta");
                                }
                            }
                            else
                            {
                                System.Windows.Forms.MessageBox.Show("El pedido de compra, se ha cancelado.", "Mensaje de Cancelación");
                            }
                    }
                    else
                    { System.Windows.Forms.MessageBox.Show("Ha ingresado un caracteres inválidos, ingrese una cantidad válida", "Mensaje"); }
                }
            }

        }

        private Pedido ArmarPedido(int CantidadAComprar, int fila)
        {
            String IDArticulo = ((Label)gdvAgregarpedido.Rows[fila].FindControl("lbl_it_IDArticulo")).Text;///
            String Estado = ((Label)gdvAgregarpedido.Rows[fila].FindControl("lbl_it_Estado")).Text;
            int Idart = Convert.ToInt32(IDArticulo);
            articulo.Id = Idart;
            Pedido pedidoarmado = new Pedido(articulo, CantidadAComprar);

            return pedidoarmado;
        }


        private int ArmarDialogo(int CantidadAComprar,int fila)
        {
         String NombreArt = ((Label)gdvAgregarpedido.Rows[fila].FindControl("lbl_it_NombreArticulo")).Text.Trim();///
         String PrecioCompra = ((Label)gdvAgregarpedido.Rows[fila].FindControl("lbl_it_PrecioCompra")).Text;
         ((TextBox) gdvAgregarpedido.Rows[fila].FindControl("tbCantidadaComprar")).Text = "";
         tbBuscarArticuloxID.Text = "";
         decimal precio = Convert.ToDecimal(PrecioCompra);
         decimal CostoTotal = Convert.ToDecimal(PrecioCompra) * Convert.ToDecimal(CantidadAComprar);
         string mensaje = "Usted está a punto de hacer un pedido de:\n" + "Producto: " + NombreArt + " \n Cantidad: " + CantidadAComprar + "\n TOTAL:  $" + CostoTotal.ToString() + "\n" +
                           "¿Está seguro que quiere adquirir el producto y la cantidad especificada?" + "\n \n " +
                           "  ALERTA!: ÉSTA ACCIÓN NO SE PUEDE DESHACER. ";

            string titulo = "Mensaje de Confirmacion";
        System.Windows.Forms.MessageBoxButtons botones = System.Windows.Forms.MessageBoxButtons.YesNo;
        System.Windows.Forms.DialogResult resultado;
        resultado = System.Windows.Forms.MessageBox.Show(mensaje, titulo, botones);

            return (int)resultado;
        }

        private void cargarProductosEnGrilla()
        {
            NegocioArticulos negocio = new NegocioArticulos();
            gdvAgregarpedido.DataSource = negocio.ObtenerTodosLosArticulos();
            gdvAgregarpedido.DataBind();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
           int id = Convert.ToInt32(tbBuscarArticuloxID.Text.Trim()); 
           gdvAgregarpedido.DataSource = negocioArt.ObtenerArticulosActivos(id);
            gdvAgregarpedido.DataBind();
            try
            {
                ///USO LA EXCEPCION DE FUERA DE RANGO del Row Con un Try Catch PARA CUANDO SÉ QUE NO ENCONTRÓ NADA
                String PrecioCompra = ((Label)gdvAgregarpedido.Rows[0].FindControl("lbl_it_PrecioCompra")).Text;
            }
            catch
            {
                    System.Windows.Forms.MessageBox.Show("No hubo coincidencias, por favor intente con otro ID", "Informe");
            }
        }

        protected void btnVistaInicial_Click(object sender, EventArgs e)
        {
            int id = 0;
            gdvAgregarpedido.DataSource = negocioArt.ObtenerArticulosActivos(id);
            gdvAgregarpedido.DataBind();
        }

        protected void gdvAgregarpedido_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gdvAgregarpedido.PageIndex = e.NewPageIndex;
            cargarProductosEnGrilla();
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