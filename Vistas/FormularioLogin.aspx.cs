using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace Vistas
{
    public partial class FormularioLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected System.Void btnIngresar_Click(System.Object sender, System.EventArgs e)
        {
            LogearUsuario logearUsuario = new LogearUsuario();
            char Tipo = logearUsuario.TipoDeIngreso(tbUserName.Text, tbUserPssw.Text);

            switch (Tipo)
            {
                case 'C':
                    Session["Permisos"] = "Cliente";
                    //Obtener datos del cliente
                    break;
                case 'V':
                    Session["Permisos"] = "Vendedor";
                    break;
                case 'E':
                    lblErrorLogeo.Text = "Error al ingresar, intente nuevamente";
                    break;
                default:
                    break;
            }


        }
    }
}