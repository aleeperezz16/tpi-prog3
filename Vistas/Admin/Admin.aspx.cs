using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;

namespace Vistas.Admin
{
    public partial class Admin : System.Web.UI.Page
    {
        protected override void OnPreInit(EventArgs e)
        {
            var datos = Session["Datos"];

            if (datos == null || datos.GetType() != typeof(Usuario))
            {
                Response.Redirect($"~/Admin/Error.aspx?uri={Request.Url.AbsolutePath}");
            }
        }
    }
}