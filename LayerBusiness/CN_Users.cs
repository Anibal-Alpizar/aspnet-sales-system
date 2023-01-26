using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LayerData;
using LayerEntity;


namespace LayerBusiness
{
    public class CN_Users
    {
        private CD_Users objLayerData = new CD_Users();

        public List<Usuario> List()
        {
            return objLayerData.List();
        }
        public int Register(Usuario obj, out string Mensaje)
        {
            Mensaje = string.Empty;

            if (string.IsNullOrEmpty(obj.Nombres) || string.IsNullOrWhiteSpace(obj.Nombres))
            {
                Mensaje = "El campo Nombres es obligatorio";
            }

            else if (string.IsNullOrEmpty(obj.Apellidos) || string.IsNullOrWhiteSpace(obj.Apellidos))
            {
                Mensaje = "El campo Apellidos es obligatorio";
            }
            else if (string.IsNullOrEmpty(obj.Correo) || string.IsNullOrWhiteSpace(obj.Correo))
            {

                Mensaje = "El campo Correo es obligatorio";
            }
            if (!string.IsNullOrEmpty(Mensaje))
            {
                string clave = "test123";
                obj.Clave = CN_Resources.Sha256Convert(clave);
                return objLayerData.Register(obj, out Mensaje);
            }
            else
            {
                return 0;
            }
        }
        public bool Update(Usuario obj, out string Mensaje)
        {
            Mensaje = string.Empty;

            if (string.IsNullOrEmpty(obj.Nombres) || string.IsNullOrWhiteSpace(obj.Nombres))
                Mensaje = "El campo Nombres es obligatorio";
            else if (string.IsNullOrEmpty(obj.Apellidos) || string.IsNullOrWhiteSpace(obj.Apellidos))
                Mensaje = "El campo Apellidos es obligatorio";
            else if (string.IsNullOrEmpty(obj.Correo) || string.IsNullOrWhiteSpace(obj.Correo))
                Mensaje = "El campo Correo es obligatorio";

            if (!string.IsNullOrEmpty(Mensaje))
            {
                return objLayerData.Update(obj, out Mensaje);
            }
            else
            {
                return false;
            }
        }
        public bool Delete(int id, out string Mensaje)
        {
            return objLayerData.Delete(id, out Mensaje);
        }
    }
}
