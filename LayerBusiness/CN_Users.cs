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
    }
}
