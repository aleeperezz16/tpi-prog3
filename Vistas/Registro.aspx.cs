using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;
using System.Data;
using System.Windows.Forms;

namespace Vistas
{
    public partial class Registro : Index
    {
        NegocioClientes _negocioClientes = new NegocioClientes();
        NegocioCiudades _negocioCiudades = new NegocioCiudades();
        NegocioProvincia _negocioProvincia = new NegocioProvincia();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlProvincias.DataSource = _negocioProvincia.ObtenerProvincias();
                ddlProvincias.DataTextField = "NombreProvincia";
                ddlProvincias.DataValueField = "CodigoProvincia";
                ddlProvincias.DataBind();

                ddlCiudades.DataSource = _negocioCiudades.ObtenerCiudades();
                ddlCiudades.DataTextField = "NombreCiudad";
                ddlCiudades.DataValueField = "CodigoCiudad";
                ddlCiudades.DataBind();
            }
        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {
            Cliente nuevoCliente = PrepararCliente();
            if (_negocioClientes.ExisteCliente(nuevoCliente))
            {
                MessageBox.Show("El nombre de usuario o DNI ingresado(s) ya existe(n)", "Error al registrarse");
                txtContrasenia.Text = txtRepetirContrasenia.Text = "";
                return;
            }

            if (_negocioClientes.AgregarCliente(nuevoCliente))
            {
                MessageBox.Show("Tu cuenta fue creada exitosamente. Proceda a iniciar sesión.", "Bienvenido/a");
                Response.Redirect("Login.aspx");
            }
            else
            {
                MessageBox.Show("Hubo un error al crear tu cuenta. Intente nuevamente", "Error al registrarse");
            }
        }

        public Cliente PrepararCliente()
        {
            Cliente cliente = new Cliente
            {
                Dni = int.Parse(txtDni.Text.Trim()),
                Nombre = txtNombres.Text.Trim(),
                Apellido = txtApellido.Text.Trim(),
                Direccion = txtDireccion.Text.Trim(),
                Telefono = txtTelefono.Text.Trim(),
                Email = txtEmail.Text.Trim(),
                Usuario = new Usuario
                {
                    Alias = txtUsuario.Text.Trim(),
                    Contrasenia = txtContrasenia.Text.Trim(),
                    Tipo = 'C',
                    Estado = true
                },
                Ciudad = new Ciudad
                {
                    Codigo = int.Parse(ddlCiudades.SelectedValue)
                }
            };

            return cliente;
        }

    }
}