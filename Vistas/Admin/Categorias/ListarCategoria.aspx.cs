using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;
using MessageBox = System.Windows.Forms.MessageBox;

namespace Vistas.Admin.Categorias
{
    public partial class ListarCategoria : Admin
    {
        private NegocioCategorias _negocio = new NegocioCategorias();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarTablaInicial();
            }
        }
        
        protected void gvCategorias_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label idCategoria = (Label)gvCategorias.Rows[e.RowIndex].FindControl("lbl_it_IDCategoria");

            if (_negocio.EliminarCategoria(int.Parse(idCategoria.Text)))
            {
                MessageBox.Show("Se elimino correctamente la categoria", "Mensaje");
            }
            else
            {
                MessageBox.Show("No se pudo eliminar la categoria, Checkee que no posea articulos adheridos a la misma", "Mensaje");
            }

            CargarTablaInicial();
        }

        protected void gvCategorias_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCategorias.PageIndex = e.NewEditIndex;
            gvCategorias.DataBind();
        }

        protected void gvCategorias_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCategorias.EditIndex = -1;
            gvCategorias.DataBind();
        }

        protected void gvCategorias_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var fila = gvCategorias.Rows[e.RowIndex];
            Categoria cat = new Categoria
            {
                Id = int.Parse(((Label)fila.FindControl("lbl_eit_IDCategoria")).Text),
                Nombre = ((TextBox)fila.FindControl("txt_eit_NombreCategoria")).Text.Trim(),
                Descripcion = ((TextBox)fila.FindControl("txt_eit_DescripcionCategoria")).Text.Trim()
            };

            if (_negocio.ModificarCategorias(cat))
            {
                MessageBox.Show("El registro se ha modificado correctamente!", "Mensaje de edición");
            }

            gvCategorias.EditIndex = -1;
            CargarTablaInicial();
        }

        protected void gvCategorias_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCategorias.PageIndex = e.NewPageIndex;
            gvCategorias.DataBind();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            DataView dv = new DataView((DataTable)gvCategorias.DataSource)
            {
                RowFilter = $"IdCategoria = {txtIdCategoria.Text.Trim()}"
            };  

            gvCategorias.DataSource = dv.ToTable();
            gvCategorias.DataBind();

            txtIdCategoria.Text = "";

            /*try
            {
                ///USO LA EXCEPCION DE FUERA DE RANGO del Row Con un Try Catch PARA CUANDO SÉ QUE NO ENCONTRÓ NADA
                String IDCategoria = ((Label)gvCategorias.Rows[0].FindControl("lbl_it_IDCategoria")).Text;//agarre cualquier dato
            }
            else
            {
                System.Windows.Forms.MessageBox.Show("No hubo coincidencias, por favor intente con otro ID", "Informe");
            }*/
        }

        protected void btnVistaInicial_Click(object sender, EventArgs e)
        {
            txtIdCategoria.Text = "";
            gvCategorias.PageIndex = 0;
            CargarTablaInicial();
        }

        private void CargarTablaInicial()
        {
            gvCategorias.DataSource = _negocio.ObtenerCategorias();
            gvCategorias.DataBind();
        }
        
        //Habilita la busqueda x nombre (Cliente)  o x ID  (Admin)
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

        ///Y los CustomValidatos Los hardcodié para que NOTIFIQUEN con un messageBox En cada caso.
        protected void cvPorID_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if(args.Value.Length == 0)
            {
               System.Windows.Forms.MessageBox.Show("Ingrese algun valor ", "Informe");
            }
        }

        protected void cvSoloNumeros_ServerValidate(object source, ServerValidateEventArgs args)
        {
            int numerodevuelto;
            bool ValorNumerico = int.TryParse(args.Value.ToString(), out numerodevuelto);
            if (!ValorNumerico)
            {
             System.Windows.Forms.MessageBox.Show("Solo se aceptan caracteres numericos ", "Informe");
            }
        }

        protected void cvPorNombre_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value.Length == 0)
            {
                 System.Windows.Forms.MessageBox.Show("Ingrese algun valor ", "Informe");
            }
        }
    }
}