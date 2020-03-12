using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;

namespace gpp.Controllers
{
    public class ErrorController : Controller
    {
        //
        // GET: /Error/

      
        public ActionResult Http404(string lang, string aspxerrorpath)
        {
            //Response.StatusCode = 404;

            if (aspxerrorpath != null)
            if (aspxerrorpath.Length > 2)
            {
                string[] _tokens = aspxerrorpath.Split(new char[]{'/'});                
                if (_tokens[1]== "el") ViewData["lang"] = _tokens[1];
            }

            if (lang != null) ViewData["lang"] = lang;
            ViewData["url"]  = aspxerrorpath;
            return View();
        }

     

    }
}
