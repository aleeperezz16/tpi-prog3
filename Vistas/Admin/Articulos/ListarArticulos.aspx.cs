using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using System.Data;
using Negocio;

namespace Vistas.Admin.Articulos
{
    public partial class ListarArticulos : Admin
    {
        private NegocioArticulos _negocioArt = new NegocioArticulos();
        private NegocioCategorias _negocioCat = new NegocioCategorias();
        private NegocioProveedores _negocioProv = new NegocioProveedores();
        static private DataTable _tablaInicial;
        static private DataTable _tabla;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarTablaInicial();
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string filtro = "";
            switch (ddlEstado.SelectedValue)
            {
                case "1":
                    filtro = "Estado = 1";
                    break;
                case "2":
                    filtro = "Estado = 0";
                    break;
            }

            string id = txtIdArticulo.Text.Trim();

            if (id.Length > 0)
            {
                if (filtro.Length > 0)
                {
                    filtro += " AND ";
                }

                filtro += "IDArticulo = " + id;
            }

            DataView dv = new DataView(_tablaInicial)
            {
                RowFilter = filtro
            };

            _tabla = filtro.Length > 0 ? dv.ToTable() : _tablaInicial.Copy();

            gvArticulos.DataSource = _tabla;
            gvArticulos.DataBind();
        }

        protected void gvArticulos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvArticulos.PageIndex = e.NewPageIndex;

            gvArticulos.DataSource = _tabla;
            gvArticulos.DataBind();
        }

        protected void gvArticulos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvArticulos.EditIndex = -1;

            gvArticulos.DataSource = _tabla;
            gvArticulos.DataBind();
        }

        protected void gvArticulos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label idArticulo = (Label)gvArticulos.Rows[e.RowIndex].FindControl("lbl_it_Id");
            _negocioArt.EliminarArticulo(int.Parse(idArticulo.Text));

            CargarTablaInicial();
        }

        protected void gvArticulos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvArticulos.EditIndex = e.NewEditIndex;

            gvArticulos.DataSource = _tabla;
            gvArticulos.DataBind();
        }

        protected void gvArticulos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var fila = gvArticulos.Rows[e.RowIndex];

            Articulo articuloEditado = new Articulo
            {
                Id = int.Parse(((Label)fila.FindControl("lbl_eit_Id")).Text),
                Nombre = ((TextBox)fila.FindControl("txt_eit_Nombre")).Text.Trim(),
                Categoria = new Categoria
                {
                    Id = int.Parse(((DropDownList)fila.FindControl("ddl_eit_Categoria")).SelectedValue)
                },
                Proveedor = new Proveedor
                {
                    Id = int.Parse(((DropDownList)fila.FindControl("ddl_eit_Proveedor")).SelectedValue)
                },
                PrecioVenta = decimal.Parse(((TextBox)fila.FindControl("txt_eit_Precio")).Text.Trim()),
                Stock = int.Parse(((Label)fila.FindControl("lbl_eit_Stock")).Text.Trim()),
                Estado = ((CheckBox)fila.FindControl("chk_eit_Estado")).Checked
            };

            _negocioArt.ModificarArticulo(articuloEditado);

            gvArticulos.EditIndex = -1;
            CargarTablaInicial(true);
        }

        protected void gvArticulos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    DropDownList ddlCat = (DropDownList)e.Row.FindControl("ddl_eit_Categoria");
                    DropDownList ddlProv = (DropDownList)e.Row.FindControl("ddl_eit_Proveedor");

                    ddlCat.DataSource = _negocioCat.ObtenerCategorias();
                    ddlCat.DataTextField = "NombreCategoria";
                    ddlCat.DataValueField = "IDCategoria";
                    ddlCat.DataBind();


                    ddlProv.DataSource = _negocioProv.ObtenerProveedores();
                    ddlProv.DataTextField = "NombreProveedor";
                    ddlProv.DataValueField = "IDProveedor";
                    ddlProv.DataBind();
                }
            }
        }

        private void CargarTablaInicial(bool actualizar = false)
        {
            _tablaInicial = _negocioArt.ObtenerArticulos(actualizar);
            _tabla = _tablaInicial.Copy();

            gvArticulos.DataSource = _tablaInicial;
            gvArticulos.DataBind();
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