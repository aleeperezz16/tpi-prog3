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
    public partial class CompraArticulo : Index
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
            int fila = Convert.ToInt32(e.CommandArgument);
            ///Como no pude hacer funcionar requiredfieldvni regularexpresionv dentro del gridview lo hardcodié
            String Cantidad = ((TextBox)gdvComprarArticulos.Rows[fila].FindControl("tbCantidad")).Text.Trim();///

            if (Cantidad == "")
            {
                System.Windows.Forms.MessageBox.Show("Debe ingresar una cantidad a comprar", "Mensaje de Alerta");
                return;
            }

            bool valornumerico = int.TryParse(Cantidad, out int CantidadAComprar);
            int Stock = Convert.ToInt32(((Label)gdvComprarArticulos.Rows[fila].FindControl("lbl_it_Stock")).Text);

            if (!valornumerico || CantidadAComprar < 0)
            {
                System.Windows.Forms.MessageBox.Show("Ha ingresado caracteres inválidos, ingrese una cantidad válida", "Mensaje");
                return;
            }
            if (CantidadAComprar > Stock)
            {
                System.Windows.Forms.MessageBox.Show("No se pueden agregar más unidades, límite de stock", "Mensaje");
                return;
            }
            if (e.CommandName == "EventoComprar")
            {
                int resultado = ArmarDialogo(CantidadAComprar, fila);
                if (resultado == 6)
                {
                    Venta ventaarmada = ArmarVenta(CantidadAComprar, fila);
                    /// System.Windows.Forms.MessageBox.Show("art id: " + ventaarmada.Articulo.Id + " DNI:" + ventaarmada.Cliente.Dni + " Cant: " + ventaarmada.Cantidad, "mensaje");
                    // bool agrego = ventas.agregarVenta(ventaarmada);

                    // System.Windows.Forms.MessageBox.Show(agrego ? "Se agregó el pedido correctamente." : "No se pudo agregar el pedido.", agrego ? "Mensaje" : "Alerta");
                    cargarArticulosEnGrilla();

                }
                else
                {
                    System.Windows.Forms.MessageBox.Show("El pedido de compra, se ha cancelado.", "Mensaje de Cancelación");
                }
            }
            if (e.CommandName == "EventoAgregar")
            {
                if (Session["Venta"] == null)
                {
                    List<Venta> listaArticulo = new List<Venta>();
                    Session["Venta"] = listaArticulo;
                }

                Venta venta = ArmarVenta(CantidadAComprar, fila);
                cargarSession(venta, fila);
            }
        }

        private void cargarSession(Venta venta, int fila)
        {
            bool articuloExistente = false;
            var lista = (List<Venta>)Session["Venta"];
            /*foreach (Venta dato in lista)
            {
                if (venta.Articulo.Id == dato.Articulo.Id)
                {
                    int cantLimite = dato.Cantidad + venta.Cantidad;
                    if (cantLimite > venta.Articulo.Stock)
                    {
                        System.Windows.Forms.MessageBox.Show("No se pueden agregar más unidades al carrito, límite de stock", "Mensaje");
                        return;
                    }
                    else
                    {
                        dato.PrecioTotal += venta.PrecioTotal;//actualiza precio y cantidad en la lista
                        dato.Cantidad += venta.Cantidad;
                        Session["Venta"] = lista;
                        articuloExistente = true;
                        break;
                    }
                }
            }*/
            if (!articuloExistente)
            {
                lista.Add(venta);
                Session["Venta"] = lista;
            }
          ((TextBox)gdvComprarArticulos.Rows[fila].FindControl("tbCantidad")).Text = "";
        }


        private Venta ArmarVenta(int CantidadAComprar, int fila)
        {
            /*Categoria cat = new Categoria();
            cat.Id = Convert.ToInt32(((Label)gdvComprarArticulos.Rows[fila].FindControl("lbl_it_IDCategoria")).Text);

            Articulo articulo = new Articulo();
            articulo.Id = Convert.ToInt32(((Label)gdvComprarArticulos.Rows[fila].FindControl("lbl_it_IDArticulo")).Text);
            articulo.Categoria = cat;
            articulo.Nombre = ((Label)gdvComprarArticulos.Rows[fila].FindControl("lbl_it_NombreArticulo")).Text.Trim();
            articulo.Stock = Convert.ToInt32(((Label)gdvComprarArticulos.Rows[fila].FindControl("lbl_it_Stock")).Text); ;

            var usuario = HttpContext.Current.Session["Datos"];
            Cliente cliente = (Cliente)usuario;

            decimal precioVenta = Convert.ToDecimal(((Label)gdvComprarArticulos.Rows[fila].FindControl("lbl_it_PrecioVenta")).Text);
            decimal precioTotal = precioVenta * Convert.ToDecimal(CantidadAComprar);

            NegocioVentas ventas = new NegocioVentas();
            Venta ventaarmada = new Venta(articulo, cliente, CantidadAComprar, precioTotal);

            return ventaarmada;*/
            return null;
        }


        private int ArmarDialogo(int CantidadAComprar, int fila)
        {
            Venta venta = ArmarVenta(CantidadAComprar, fila);
            ((TextBox)gdvComprarArticulos.Rows[fila].FindControl("tbCantidad")).Text = "";
            tbBuscarxID.Text = "";

            string mensaje = ""/*"Usted está a punto de hacer una compra de:\n" + "Producto: " + venta.Articulo.Nombre + " \n Cantidad: " + CantidadAComprar + "\n TOTAL:  $" + venta.PrecioTotal.ToString() + "\n" +
            "¿Está seguro que quiere adquirir el producto y la cantidad especificada?" + "\n \n " +
            "  ALERTA!: ÉSTA ACCIÓN NO SE PUEDE DESHACER. "*/;
            string titulo = "Mensaje de Confirmacion";
            System.Windows.Forms.MessageBoxButtons botones = System.Windows.Forms.MessageBoxButtons.YesNo;
            System.Windows.Forms.DialogResult resultado;
            resultado = System.Windows.Forms.MessageBox.Show(mensaje, titulo, botones);

            return (int)resultado;
        }



    }


}