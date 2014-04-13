using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GVWA.Database;

namespace GVWA
{
    public partial class Cursos : System.Web.UI.Page
    {
        private List<Curso> listaCursos;
        public List<Curso> ListaCursos
        {
            get
            {
                if (this.listaCursos == null)
                {
                    this.listaCursos = new List<Curso>();
                }
                return this.listaCursos;
            }
            set
            {
                this.listaCursos = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USUARIO"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void BuscarButton_Click(object sender, EventArgs e)
        {
            this.ListaCursos = Conexion.BuscarCurso(CursoTextBox.Text);
        }
    }

    public class Curso
    {
        public int Id { get; set; }
        public string Descripcion { get; set; }
        public string Profesor { get; set; }
        public string Resumen { get; set; }
    }
}