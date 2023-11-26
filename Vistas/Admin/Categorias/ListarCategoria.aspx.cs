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
            if(!IsPostBack)
            {
                cargarCategoriasEnGrilla();
            }
        }
        
        //PARA ELIMINAR UNA CATEGORIA A TRAVES DEL ID SELECCIONADO
        protected void gdvCategorias_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int s_IdCategoria = Convert.ToInt32(((Label)gdvCategorias.Rows[e.RowIndex].FindControl("lbl_it_IDCategoria")).Text);
            NegocioCategorias negocio = new NegocioCategorias();
            bool Borro = negocio.eliminarCategoria(s_IdCategoria);

            if (Borro)
            {
                System.Windows.Forms.MessageBox.Show("Se Elimino correctamente la categoria", "Mensaje");
            }
            else
            {
                System.Windows.Forms.MessageBox.Show("No se pudo eliminar la categoria, Checkee que no posea articulos adheridos a la misma", "Mensaje");
            }
            cargarCategoriasEnGrilla();
        }

        protected void gdvCategorias_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gdvCategorias.PageIndex = e.NewEditIndex;
            cargarCategoriasEnGrilla();
        }

        protected void gdvCategorias_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gdvCategorias.EditIndex = -1;
            cargarCategoriasEnGrilla();
        }

        protected void gdvCategorias_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            NegocioCategorias _negocioCat = new NegocioCategorias();
            Categoria cat = new Categoria();
            int s_IdCategoria = Convert.ToInt32(((Label)gdvCategorias.Rows[e.RowIndex].FindControl("lbl_eit_IDCategoria")).Text);
            string s_Nombrecat = ((TextBox)gdvCategorias.Rows[e.RowIndex].FindControl("tbt_eit_NombreCategoria")).Text;
            string s_Descripcion = ((TextBox)gdvCategorias.Rows[e.RowIndex].FindControl("tbt_eit_DescripcionCategoria")).Text;

            cat.Id = s_IdCategoria;
            cat.Nombre = s_Nombrecat;
            cat.Descripcion = s_Descripcion;

            bool filasAfectadas = _negocioCat.ModificarCategorias(cat);
            if (!filasAfectadas)
            {
                System.Windows.Forms.MessageBox.Show("El registro se ha modificado correctamente!","Mensaje de edición");
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
        protected void btnBuscarCat_Click(object sender, EventArgs e)
        {
            NegocioCategorias negocio = new NegocioCategorias();
            gdvCategorias.DataSource = negocio.ObtenerCategorias(Convert.ToInt32(tbCategoriaporid.Text));
            gdvCategorias.DataBind();
            tbCategoriaporid.Text = "";

            try
            {
                ///USO LA EXCEPCION DE FUERA DE RANGO del Row Con un Try Catch PARA CUANDO SÉ QUE NO ENCONTRÓ NADA
                String IDCategoria = ((Label)gdvCategorias.Rows[0].FindControl("lbl_it_IDCategoria")).Text;//agarre cualquier dato
            }
            catch
            {
                System.Windows.Forms.MessageBox.Show("No hubo coincidencias, por favor intente con otro ID", "Informe");
            }
        }

        //CARGA TODAS LAS CATEGORIAS
        private void cargarCategoriasEnGrilla()
        {
            NegocioCategorias negocio = new NegocioCategorias();
            gdvCategorias.DataSource = negocio.ObtenerCategorias();
            gdvCategorias.DataBind();
        }

        protected void btnVistaInicial_Click(object sender, EventArgs e)
        {
            tbCategoriaporid.Text = "";
            gdvCategorias.PageIndex = 0;
            cargarCategoriasEnGrilla();
        }
    }
}