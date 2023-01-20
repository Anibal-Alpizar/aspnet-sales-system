using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LayerEntity;
using System.Data.SqlClient;
using System.Data;

namespace LayerData
{
    public class CD_Users
    {
        public List<Usuario> List()
        {
            List<Usuario> list = new List<Usuario>();

            try
            {
                using (SqlConnection oconnection = new SqlConnection(Connection.cn))
                {
                    string query = "SELECT IdUsuario, Nombres, Apellidos, Correo, Clave, Reestablecer, Activo FROM USUARIO";
                    SqlCommand cmd = new SqlCommand(query, oconnection);
                    cmd.CommandType = CommandType.Text;
                    oconnection.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            list.Add(
                                new Usuario()
                                {
                                    IdUsuario = Convert.ToInt32(dr["IdUsuario"]),
                                    Nombres = dr["Nombres"].ToString(),
                                    Apellidos = dr["Apellidos"].ToString(),
                                    Correo = dr["Correo"].ToString(),
                                    Clave = dr["Clave"].ToString(),
                                    Reestablecer = Convert.ToBoolean(dr["Reestablecer"]),
                                    Activo = Convert.ToBoolean(dr["Activo"])
                                }
                            );

                        }
                    }
                }
            }
            catch
            {
                list = new List<Usuario>();

            }

            return list;
        }
    }
}
