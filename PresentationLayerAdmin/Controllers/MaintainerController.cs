﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PresentationLayerAdmin.Controllers
{
    public class MaintainerController : Controller
    {
        // GET: Maintainer
        public ActionResult Category()
        {
            return View();
        }
        
        public ActionResult Branch()
        {
            return View();
        }
        
        public ActionResult Product()
        {
            return View();
        }
    }
}