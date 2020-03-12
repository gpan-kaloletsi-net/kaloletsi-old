using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;

namespace gpp.Controllers
{
    public class SapController : Controller
    {
        //
        // GET: /Sap/

        public SapController()
        {
            
        }

        /*
        private ActionResult View(string lang, string viewName)
        {
            if (lang == "el") return View(String.Format("{0}_el", viewName));
            else return View();
        }
        */

        public ActionResult Index(string lang)
        {
            ViewData["lang"] = lang;
            return View();
        }

    }
}
