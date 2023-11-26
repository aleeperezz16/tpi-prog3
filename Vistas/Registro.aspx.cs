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
    public partial class FormularioRegistro : System.Web.UI.Page
    {
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
            /// contraseña con mas de 6 caracteres tambien estaria bueno 
            NegocioClientes n_Clientes = new NegocioClientes();
            Clientes cliente = new Clientes();
            Usuario usuario = new Usuario();
            Ciudad ciudad = new Ciudad();
            Provincia provincia = new Provincia();

            cliente.Dni = Convert.ToInt32(tbDni.Text.Trim());
            cliente.Nombre = tbNombres.Text.Trim();
            cliente.Apellido = tbApellido.Text.Trim();
            string Ciudad = ddlCiudades.SelectedItem.Text.Trim();
            ///string Provincia = ddlProvincias.SelectedItem.Text.Trim();
            ///ciudad.Nombre = Ciudad;
            ciudad.Codigo = Convert.ToInt32(ddlCiudades.SelectedValue);
           /// string codigociudad = ddlCiudades.SelectedValue;
            /// provincia.Nombre = Provincia;
            //ciudad.Provincia = provincia;
            cliente.Ciudad = ciudad;
            cliente.Direccion = tbDireccion.Text.Trim();
            cliente.Telefono = tbTelefono.Text.Trim();
            cliente.Email = tbEmail.Text.Trim();

            usuario.Alias = tbNombreusuario.Text.Trim();
            usuario.Contrasenia = tbContraseña.Text.Trim();
            usuario.Tipo = 'C';
            usuario.Estado = true;

            cliente.Usuario = usuario;
            ///System.Windows.Forms.MessageBox.Show(codigociudad, "AVISO");
            /*
            cmd.Parameters.AddWithValue("@DNI", );
            cmd.Parameters.AddWithValue("@APELLIDO", c);
            cmd.Parameters.AddWithValue("@NOMBRE", );
            cmd.Parameters.AddWithValue("@ALIAS", cli.Usuario.Alias);
            cmd.Parameters.AddWithValue("@CONTRASENIA", cli.Usuario.Contrasenia);
            cmd.Parameters.AddWithValue("@TELEFONO", cli.Telefono);
            cmd.Parameters.AddWithValue("@EMAIL", cli.Email);
            cmd.Parameters.AddWithValue("@DIRECCION", cli.Direccion);
            cmd.Parameters.AddWithValue("@CODCIUDAD", cli.Ciudad.Codigo);
            cmd.Parameters.AddWithValue("@ESTADO", cli.Estado);
            */
            /// pregunto si existe el nombre de usuario y si existe el DNI, Pero primero el DNI 
            /// para poder agregarlo
            /// 
            if (n_Clientes.ExisteCliente(cliente))
            {
               System.Windows.Forms.MessageBox.Show("No pudo registrarse debido a que el Alias ingresado " +
                    "Ya está en uso", "AVISO");
            }
            else
            {

                bool Agrego = n_Clientes.AgregarCliente(cliente);
                if (Agrego)
                {
                    System.Windows.Forms.MessageBox.Show("La cuenta se agregò correctamente", "AVISO");
                }
            }
     


        }
    }
}