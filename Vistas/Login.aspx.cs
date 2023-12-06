using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;

namespace Vistas
{
    public partial class Login : Index
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario
            {
                Alias = txtUsuario.Text.Trim(),
                Contrasenia = txtContrasenia.Text.Trim()
            };

            LogearUsuario negocioLogIn = new LogearUsuario();
            var usuarioLogueado = negocioLogIn.IniciarSesion(usuario); ///Devuelve un su

            if (usuarioLogueado == null)
            {
                lblErrorLogeo.Text = "Error al ingresar, intente nuevamente";
                return;
            }
          
            Session["Datos"] = usuarioLogueado;

            if (usuario.Tipo == 'C') { Response.Redirect("InicioClientes.aspx"); } else { Response.Redirect("Inicio.aspx"); }

        }
    }
}