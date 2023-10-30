using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;



namespace Vistas.Admin.Categorias
{
    public partial class ListarCategoria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack == false)
            {
                cargarCategoriasEnGrilla();
            }

        }

        //PARA ELIMINAR UNA CATEGORIA A TRAVES DEL ID SELECCIONADO
        protected void gdvCategorias_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int s_IdCategoria = Convert.ToInt32(((Label)gdvCategorias.Rows[e.RowIndex].FindControl("lb_eit_IDcategoria")).Text);
            NegocioCategorias negocio = new NegocioCategorias();
            bool Borro = negocio.eliminarCategoria(s_IdCategoria)

            if (Borro)
            {
                ///SE ELIMINO CORRECTAMENTE

            }
            {
                ///NO SE ELIMINO
            }

            cargarCategoriasEnGrilla();
        }

        // PARA EDITAR DENTRO DEL GRIDVIEW
        protected void gdvCategorias_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gdvCategorias.PageIndex = e.NewEditIndex;
            cargarCategoriasEnGrilla();
        }

        //CANCELAR LA EDICION DE LA GRILLA
        protected void gdvCategorias_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gdvCategorias.EditIndex = -1;
            cargarCategoriasEnGrilla();
        }

        //CUANDO SE APRETA EL BOTON ACTUALIZAR
        protected void gdvCategorias_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            NegocioCategorias _negocioCat = new NegocioCategorias();
            Categoria cat = new Categoria();
            int s_IdCategoria = Convert.ToInt32((Label)gdvCategorias.Rows[e.RowIndex].FindControl("lb_eit_IDcategoria")).Text;
            string s_Nombrecat = ((TextBox)gdvCategorias.Rows[e.RowIndex].FindControl("lb_eit_NombreCategoria")).Text;
            string s_Descripcion = ((TextBox)gdvCategorias.Rows[e.RowIndex].FindControl("lb_eit_Descripcion")).Text;

            cat.Id = s_IdCategoria;
            cat.Nombre = s_Nombrecat;
            cat.Descripcion = s_Descripcion;

            bool filasAfectadas = _negocioCat.ModificarCategorias(cat);
            if (filasAfectadas)
            {
                //se actualizó
            }

            gdvCategorias.EditIndex = -1;
            cargarCategoriasEnGrilla();
        }

        // CUANDO CAMBIAS LA PAGINA, Se actualiza el paginador en la pagina elegida y vuelvo a cargar la grilla
        protected void gdvCategorias_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gdvCategorias.PageIndex = e.NewPageIndex;
            cargarCategoriasEnGrilla();
        }

        //PARA BUSCAR POR EL ID INGRESADO
        protected void Button1_Click(object sender, EventArgs e)
        {
            NegocioCategorias negocio = new NegocioCategorias();
            gdvCategorias.DataSource =negocio.ObtenerCategorias(Convert.ToInt32(tbCategoriaporid.Text));
            gdvCategorias.DataBind();
        }


        //CARGA TODAS LAS CATEGORIAS
        private void cargarCategoriasEnGrilla()
        {
            NegocioCategorias negocio = new NegocioCategorias();
            gdvCategorias.DataSource = negocio.ObtenerTodaslasCategorias();
            gdvCategorias.DataBind();
        }

    }
}