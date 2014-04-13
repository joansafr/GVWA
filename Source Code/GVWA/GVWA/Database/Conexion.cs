using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace GVWA.Database
{
    public class Conexion
    {
        public static bool IniciarSesion(string usuario, string contrasena)
        {
            try
            {
                using (var conexion = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ToString()))
                {
                    conexion.Open();
                    using (var comando = new SqlCommand("pa_IniciarSesion", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.AddWithValue("@p_IdUsuario", usuario);
                        comando.Parameters.AddWithValue("@p_Contrasena", contrasena);
                        var reader = comando.ExecuteReader();
                        return reader.HasRows;
                    }
                }
            }
            catch (Exception e)
            {
                throw;
            }
        }

        public static List<Curso> BuscarCurso(string Curso)
        {
            var lista = new List<Curso>();
            try
            {
                using (var conexion = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ToString()))
                {
                    conexion.Open();
                    using (var comando = new SqlCommand("pa_BuscarCurso", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.AddWithValue("@p_Curso", Curso);
                        var reader = comando.ExecuteReader();
                        while (reader.Read())
                        {
                            var curso = new Curso();
                            curso.Id = Convert.ToInt32(reader["IdCurso"].ToString());
                            curso.Descripcion = reader["Descripcion"].ToString();
                            curso.Profesor = reader["Profesor"].ToString();
                            curso.Resumen = reader["Resumen"].ToString();
                            lista.Add(curso);
                        }
                    }
                }
            }
            catch (Exception e)
            {
                throw;
            }
            return lista;
        }
    }
}