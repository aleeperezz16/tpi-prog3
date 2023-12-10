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
    public partial class ListarCategoria : Admin
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                cargarCategoriasEnGrilla();

                VerUsuarioConectado();
            }
        }

        //PARA ELIMINAR UNA CATEGORIA A TRAVES DEL ID SELECCIONADO
        protected void gdvCategorias_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int s_IdCategoria = Convert.ToInt32(((Label)gdvCategorias.Rows[e.RowIndex].FindControl("lbl_it_IDCategoria")).Text);
            NegocioCategorias negocio = new NegocioCategorias();


            string mensaje = "Está seguro que quiere eliminar la Categoria? " +
            "  ALERTA!: ÉSTA ACCIÓN NO SE PUEDE DESHACER. ";
            string titulo = "Mensaje de Confirmacion";
            System.Windows.Forms.MessageBoxButtons botones = System.Windows.Forms.MessageBoxButtons.YesNo;
            System.Windows.Forms.DialogResult resultado;
            resultado = System.Windows.Forms.MessageBox.Show(mensaje, titulo, botones);

            if ( resultado == System.Windows.Forms.DialogResult.Yes)
            {
                bool Borro = negocio.eliminarCategoria(s_IdCategoria);

                if (Borro)
                {
                    System.Windows.Forms.MessageBox.Show("Se Elimino correctamente la categoria", "Mensaje");
                }
                else
                {
                    System.Windows.Forms.MessageBox.Show("No se pudo eliminar la categoria, verifique que no posea articulos adheridos a la misma categoria que desea eliminar", "Mensaje");
                }
                cargarCategoriasEnGrilla();
            }
            else { System.Windows.Forms.MessageBox.Show("La eliminación fue cancelada ", "Mensaje"); }
        }

        protected void gdvCategorias_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gdvCategorias.PageIndex = e.NewEditIndex;
            cargarCategoriasEnGrilla();
        }

        protected void gdvCategorias_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            System.Windows.Forms.MessageBox.Show("La edición fué cancelada ", "Mensaje");
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
            else
            {
                System.Windows.Forms.MessageBox.Show("La Modificación se canceló ", "Mensaje");
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
            int aux = 0;
            if (tbCategoriaporNombre.Text.Trim() == "" && tbCategoriaporID.Text.Trim()== "")
            {

                System.Windows.Forms.MessageBox.Show("Debe Ingresar algun valor, en alguna busqueda", "Mensaje");

            }
            else if(tbCategoriaporID.Text.Trim() != "")
            {
                int NumeroDevuelto;
                bool ValorNumerico = int.TryParse(tbCategoriaporID.Text.Trim(), out NumeroDevuelto);
                if (ValorNumerico)
                {
                    ///Busco X ID
                    gdvCategorias.DataSource = negocio.ObtenerCategorias(Convert.ToInt32(tbCategoriaporID.Text));
                    
                }
                else
                {
                    System.Windows.Forms.MessageBox.Show("Debe Ingresar un valor numerico.", "Mensaje");
                    aux++;
                }
            }
            else if (tbCategoriaporNombre.Text.Trim() != "")
            {
                gdvCategorias.DataSource = negocio.ObtenerCategoriasXnombre(tbCategoriaporNombre.Text);
            }
            
            gdvCategorias.DataBind();

            if (aux == 0)
            {
                if (tbCategoriaporID.Text.Trim() != "" || tbCategoriaporNombre.Text.Trim() != "")
                {
                    try
                    {
                        ///USO LA EXCEPCION DE FUERA DE RANGO del Row Con un Try Catch PARA CUANDO SÉ QUE NO ENCONTRÓ NADA
                        String IDCategoria = ((Label)gdvCategorias.Rows[0].FindControl("lbl_it_IDCategoria")).Text;//agarre cualquier dato
                    }
                    catch
                    {
                        System.Windows.Forms.MessageBox.Show("No hubo coincidencias, por favor intente con otro Nombre o ID", "Informe");
                    }
                }
            }
            tbCategoriaporNombre.Text = "";
            tbCategoriaporID.Text = "";

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
            tbCategoriaporNombre.Text = "";
            gdvCategorias.PageIndex = 0;
            cargarCategoriasEnGrilla();
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

 
        
    }
}