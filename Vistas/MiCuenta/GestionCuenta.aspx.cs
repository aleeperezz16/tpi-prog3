using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;
using System.Data;

namespace Vistas.MiCuenta
{
    public partial class GestionCuenta : Index
    {       
        NegocioClientes n_Clientes = new NegocioClientes();
        NegocioCiudades _negocioCiud = new NegocioCiudades();
        NegocioProvincia _negocioProv = new NegocioProvincia();
        NegocioUsuario _negocioUsu = new NegocioUsuario();
        Usuario usuarioActual = new Usuario(); 
        Cliente datosCliente = new Cliente();

        ///
        Usuario usuarioPrueba = new Usuario();
        ///

        

        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (!IsPostBack)
            {
                ddlProvincias.DataSource = _negocioProv.ObtenerProvincias();
                ddlProvincias.DataTextField = "NombreProvincia";
                ddlProvincias.DataValueField = "CodigoProvincia";
                ddlProvincias.DataBind();

                /*
                usuarioPrueba.Alias = "DianaMiller";
                usuarioPrueba.Contrasenia = "DianaM123";
                Session["Datos"] = usuarioPrueba;
                */
                usuarioActual = (Session["Datos"]) as Usuario;

                
                datosCliente = n_Clientes.ObtenerCliente(usuarioActual);
                DataTable provinciaCliente = new DataTable();
                provinciaCliente = n_Clientes.ObtenerPROVINCIAClientes(datosCliente);
                string provincia = (provinciaCliente.Rows[0]["nombreProvincia"]).ToString();

                txtNombres.Text = datosCliente.Nombre;
                txtApellidos.Text = datosCliente.Apellido;

                //ddlProvincias.Items.FindByValue("Chaco").Selected = true;
                //ddlCiudades.Items.FindByValue((datosCliente.Ciudad).ToString()).Selected = true;
                //ddlProvincias.SelectedValue = "Chaco";
                

                txtDireccion.Text = datosCliente.Direccion;
                txtTelefono.Text = datosCliente.Telefono;
                txtEmail.Text = datosCliente.Email;

            }

        }

        private void CargarCiudades(int id = 0, int idProvincia = 0)
        {
            ddlCiudades.DataSource = _negocioCiud.ObtenerCiudades(id, idProvincia);
            ddlCiudades.DataValueField = "CodigoCiudad";
            ddlCiudades.DataTextField = "NombreCiudad";
            ddlCiudades.DataBind();
        }
 

        protected void ddlProvincias_SelectedIndexChanged1(object sender, EventArgs e)
        {
            if (ddlProvincias.SelectedValue != "-- Seleccionar --")
            {
                CargarCiudades(idProvincia: int.Parse(ddlProvincias.SelectedValue));
            }
            else
            {
                ddlCiudades.Items.Clear();
                ddlCiudades.Items.Add(new ListItem("--Seleccione una provincia--", "--Seleccione una provincia--"));
            }
        }

        protected void btnAceptarPass_Click(object sender, EventArgs e)
        {

            usuarioActual = (Session["Datos"]) as Usuario;
            string mensaje = "¿Confirma cambiar su contraseña?";
            string titulo = "Cambio de contraseña";
            System.Windows.Forms.MessageBoxButtons botones = System.Windows.Forms.MessageBoxButtons.YesNo;
            System.Windows.Forms.DialogResult resultado;
            resultado = System.Windows.Forms.MessageBox.Show(mensaje, titulo, botones);

            if ((int)resultado == 6)
            {
              
                if ((_negocioUsu.CambiarContrasenia(usuarioActual.Alias, txtNuevaPass.Text.Trim())) == 1)
                {

                    System.Windows.Forms.MessageBox.Show("Contraseña actualizada correctamente");
                }
                else
                {
                    System.Windows.Forms.MessageBox.Show("Se ha producido un error, intente nuevamente");
                }
            }
        }

        protected void btnAceptarDatos_Click(object sender, EventArgs e)
        {
          
            
            
            string mensaje = "¿Confirma cambiar sus datos personales?";
            string titulo = "Cambio de informacion personal";
            System.Windows.Forms.MessageBoxButtons botones = System.Windows.Forms.MessageBoxButtons.YesNo;
            System.Windows.Forms.DialogResult resultado;
            resultado = System.Windows.Forms.MessageBox.Show(mensaje, titulo, botones);

            if ((int)resultado == 6)
            {
                usuarioActual = (Session["Datos"]) as Usuario;
                datosCliente = n_Clientes.ObtenerCliente(usuarioActual);
                Cliente nuevosDatos = new Cliente();
                Ciudad ciudad = new Ciudad();
                ciudad.Codigo = Convert.ToInt32(ddlCiudades.SelectedValue);

                nuevosDatos.Dni = datosCliente.Dni;
                nuevosDatos.Apellido = txtApellidos.Text.Trim();
                nuevosDatos.Nombre = txtNombres.Text.Trim();
                nuevosDatos.Ciudad = ciudad;
                nuevosDatos.Usuario = usuarioActual;
                nuevosDatos.Direccion = txtDireccion.Text.Trim();
                nuevosDatos.Telefono = txtTelefono.Text.Trim();
                nuevosDatos.Email = txtEmail.Text.Trim();

                if (n_Clientes.ModificarCliente(nuevosDatos))
                {

                    System.Windows.Forms.MessageBox.Show("Datos actualizados correctamente");
                }
                else
                {
                    System.Windows.Forms.MessageBox.Show("Se ha producido un error, intente nuevamente");
                }
            }

        }
    }
}