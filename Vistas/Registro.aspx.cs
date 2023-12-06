using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;
using System.Data;

namespace Vistas
{
    public partial class Registro : Index
    {
        NegocioClientes n_Clientes = new NegocioClientes();
        NegocioCiudades _negocioCiud = new NegocioCiudades();
        NegocioProvincia _negocioProv = new NegocioProvincia();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlProvincias.DataSource = _negocioProv.ObtenerProvincias();
                ddlProvincias.DataTextField = "NombreProvincia";
                ddlProvincias.DataValueField = "CodigoProvincia";
                ddlProvincias.DataBind();

                ddlCiudades.DataSource = _negocioCiud.ObtenerCiudades();
                ddlCiudades.DataTextField = "NombreCiudad";
                ddlCiudades.DataValueField = "CodigoCiudad";
                ddlCiudades.DataBind();
            }

        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {
            Cliente client = new Cliente();
            client = PrepararCliente();
            int alias = ALIASRepetido(client);
            int DNI = DNIRepetido(client);
            bool aux = false;
            int res = alias + DNI;

            if (res == 2)
            {
                System.Windows.Forms.MessageBox.Show("Usted está intentando registrarse con un DNI y Nombre de Usuario en USO.\n\n" +
                    "Cambielos e intente Nuevamente.", "AVISO");
                aux = true;

            }
            else if (alias == 1)
            {
                System.Windows.Forms.MessageBox.Show("El Nombre de Usuario ingresado, ya se encuentra en uso", "Alerta");
                aux = true;
            }
            else if (DNI == 1)
            {
                System.Windows.Forms.MessageBox.Show("Ya hay una cuenta registrada con el DNI ingresado", "Alerta");
                aux = true;
            }
            if (!aux)
            {
                bool Agrego = n_Clientes.AgregarCliente(client);
                if (Agrego)
                {
                    System.Windows.Forms.MessageBox.Show("La cuenta se agregò correctamente", "Aviso");
                }
                else
                {
                    System.Windows.Forms.MessageBox.Show("Hubo un error al intentar registrar la cuenta ", "Alerta");
                }

                LimpiarTextBox();
            }

        }

        public void LimpiarTextBox()
        {
            tbApellido.Text = "";
            tbContraseña.Text = "";
            tbDireccion.Text = "";
            tbDni.Text = "";
            tbEmail.Text = "";
            tbNombres.Text = "";
            tbNombreusuario.Text = "";
            tbRepetirContraseña.Text = "";
            tbTelefono.Text = "";
        }

        public int DNIRepetido(Cliente cliente)
        {
            Cliente cli = new Cliente();
            cli = PrepararCliente();
            DataTable data = n_Clientes.ObtenerDNIClientes(cli);


            if (data.Rows.Count != 0)
            {
                return 1;
            }
            else
            {
                return 0;
            }

        }

        public int ALIASRepetido(Cliente cliente)

        {
            Cliente cli = new Cliente();
            cli = PrepararCliente();
            DataTable data = n_Clientes.ObtenerALIASClientes(cli);
            if (data.Rows.Count != 0)
            {
                return 1;
            }
            else
            {
                return 0;
            }
        }

        public Cliente PrepararCliente()
        {
            Cliente cliente = new Cliente();
            Usuario usuario = new Usuario();
            Ciudad ciudad = new Ciudad();
            cliente.Dni = Convert.ToInt32(tbDni.Text.Trim());
            cliente.Nombre = tbNombres.Text.Trim();
            cliente.Apellido = tbApellido.Text.Trim();
            string Ciudad = ddlCiudades.SelectedItem.Text.Trim();
            ciudad.Codigo = Convert.ToInt32(ddlCiudades.SelectedValue);
            cliente.Ciudad = ciudad;
            cliente.Direccion = tbDireccion.Text.Trim();
            cliente.Telefono = tbTelefono.Text.Trim();
            cliente.Email = tbEmail.Text.Trim();
            usuario.Alias = tbNombreusuario.Text.Trim();
            usuario.Contrasenia = tbContraseña.Text.Trim();
            usuario.Tipo = 'C';
            usuario.Estado = true;
            cliente.Usuario = usuario;

            return cliente;
        }

    }
}