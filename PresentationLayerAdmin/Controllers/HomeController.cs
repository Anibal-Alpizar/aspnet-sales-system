using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LayerBusiness;
using LayerEntity;

namespace PresentationLayerAdmin.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Users()
        {
            return View();
        }

        [HttpGet]
        public JsonResult ListUsers()
        {
            List<Usuario> oList = new List<Usuario>();
            oList = new CN_Users().List();
            // structure for use a Jquery Datatable
            return Json(new
            {
                data = oList
            }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SaveUser(Usuario obj)
        {
            object result;
            string mensaje = string.Empty;

            if (obj.IdUsuario == 0)
            {
                result = new CN_Users().Register(obj, out mensaje);
            }
            else
            {
                result = new CN_Users().Update(obj, out mensaje);
            }
            return Json(new
            {
                result = result,
                mensaje = mensaje
            }, JsonRequestBehavior.AllowGet);
        }

    }
}