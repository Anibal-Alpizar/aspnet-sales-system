﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace LayerData
{
    public class Connection
    {
        public static string cn = ConfigurationManager.ConnectionStrings["string"].ToString();
    }
}
