using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GVWA.Database;

namespace GVWA
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void IngresarButton_Click(object sender, EventArgs e)
        {
            if (Conexion.IniciarSesion(UsuarioTextBox.Text, ContrasenaTextBox.Text))
            {
                Session["USUARIO"] = UsuarioTextBox.Text;
                Response.Redirect("Cursos.aspx");
            }
        }

    }
}