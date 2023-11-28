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
    public partial class CompraArticulo : System.Web.UI.Page
    {
        NegocioCategorias _negocioCat = new NegocioCategorias();
        NegocioArticulos negocio = new NegocioArticulos();
        NegocioVentas ventas = new NegocioVentas();

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

        protected void gdvComprarArticulos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EventoComprar")
            {
                int fila = Convert.ToInt32(e.CommandArgument);
                ///Como no pude hacer funcionar requiredfieldvni regularexpresionv dentro del gridview lo hardcodié
                String Cantidad = ((TextBox)gdvComprarArticulos.Rows[fila].FindControl("tbCantidad")).Text.Trim();///
                if (Cantidad == "")
                {
                    System.Windows.Forms.MessageBox.Show("Debe ingresar una cantidad a comprar", "Mensaje de Alerta");
                }
                else
                {
                    int CantidadAComprar = 0;
                    bool valornumerico = int.TryParse(Cantidad, out CantidadAComprar);
                    if (valornumerico)
                    {
                        String NombreArt = ((Label)gdvComprarArticulos.Rows[fila].FindControl("lbl_it_NombreArticulo")).Text.Trim();///
                        String PrecioCompra = ((Label)gdvComprarArticulos.Rows[fila].FindControl("lbl_it_PrecioVenta")).Text;
                        ((TextBox)gdvComprarArticulos.Rows[fila].FindControl("tbCantidad")).Text = "";
                        tbBuscarxID.Text = "";
                        decimal precio = Convert.ToDecimal(PrecioCompra);
                        decimal CostoTotal = Convert.ToDecimal(PrecioCompra) * Convert.ToDecimal(CantidadAComprar);

                        string mensaje = "Usted está a punto de hacer una compra de:\n"+"Producto: "+NombreArt+" \n Cantidad: "+CantidadAComprar+"\n TOTAL:  $" + CostoTotal.ToString() + "\n" +
                        "¿Está seguro que quiere adquirir el producto y la cantidad especificada?" + "\n \n " +
                        "  ALERTA!: ÉSTA ACCIÓN NO SE PUEDE DESHACER. ";
                        string titulo = "Mensaje de Confirmacion";
                        System.Windows.Forms.MessageBoxButtons botones = System.Windows.Forms.MessageBoxButtons.YesNo;
                        System.Windows.Forms.DialogResult resultado;
                        resultado = System.Windows.Forms.MessageBox.Show(mensaje, titulo, botones);
                        if (resultado == System.Windows.Forms.DialogResult.Yes)
                        {

                            String IDArticulo = ((Label)gdvComprarArticulos.Rows[fila].FindControl("lbl_it_IDArticulo")).Text;///
                            int Idart = Convert.ToInt32(IDArticulo);
                            int cant = Convert.ToInt32(CantidadAComprar);

                            Cliente cliente = new Cliente();
                            Articulo articulo = new Articulo();
                            articulo.Id = Idart;
                            int DNI = 0;
                            /// ME FALTA EL DNI DE LA PERSONA QUE LOGEA.
                            cliente.Dni = DNI;
                            NegocioVentas ventas = new NegocioVentas();
                            Venta ventaarmada = new Venta(articulo,cliente, cant);

                          /// System.Windows.Forms.MessageBox.Show("art id: " + ventaarmada.Articulo.Id + " DNI:" + ventaarmada.Cliente.Dni + " Cant: " + ventaarmada.Cantidad, "mensaje");
                            bool agrego = ventas.agregarVenta(ventaarmada);

                                if (agrego)
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
                            System.Windows.Forms.MessageBox.Show("El pedido de compra, se ha cancelado.", "Mensaje de Cancelación");
                        }

                    }
                    else
                    { System.Windows.Forms.MessageBox.Show("Ha ingresado un caracteres inválidos, ingrese una cantidad válida", "Mensaje"); }
                }
            }
        }
    }
}