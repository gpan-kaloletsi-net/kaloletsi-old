using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace gpp.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        
        public HomeController()
        {
            ViewData["Theme"] = "White";
        }

        protected override void Initialize(System.Web.Routing.RequestContext _requestContext)
        {
            base.Initialize(_requestContext);
            var t = TempDataProvider.LoadTempData(this.ControllerContext);
            
        }

        public ActionResult Blog()
        {
            return Redirect("~/Blog");
        }

        public ActionResult Index(string lang)
        {
            ViewData["lang"] = lang;
        
            if (lang == "el") ViewData["Message"] = "Καλώς ήλθατε στον ιστότοπο μου!";
            else ViewData["Message"] = "Welcome to GPan's personal site!";

            Random r = new Random();
            var albums = PhotoManager.ZGetAlbums();
            var aIdx = 0; 
            var pIdx = 0;

            if (albums.Count < 1) return View();

            aIdx = r.Next(albums.Count - 1);             
            ViewData["AlbumID"] = albums[aIdx].AlbumID;

            var photos = PhotoManager.ZGetPhotos(albums[aIdx].AlbumID);
            if (photos.Count < 1) return View();

            pIdx = r.Next(photos.Count - 1);             
            ViewData["PhotoID"] = photos[pIdx].PhotoID;
            return View();
        }
        
        public ActionResult About()
        {
            return View();
        }


        public ActionResult Kaloletsi()
        {
            return View();
        }

        public ActionResult Neraida()
        {
            return View("Kaloletsi");
        }

        public ActionResult Switch(string id)
        {
            return RedirectToAction("Index", "Home", new {id = id });
        }

        public ActionResult Lang(string lang)
        {
            if (Request.UrlReferrer != null)
                if (Request.UrlReferrer.LocalPath.Length > 3)
                {
                    string OldUrl = Request.UrlReferrer.LocalPath;
                    string OldUrlLang = OldUrl.Substring(0, 3);
                    string ReturnUrl;

                    if ((OldUrlLang == "/el") || (OldUrlLang == "/en"))
                        ReturnUrl = "/" + lang + OldUrl.Substring(3);
                    else
                        ReturnUrl = "/" + lang + OldUrl;

                    return Redirect(ReturnUrl);
                }
                else return Redirect(String.Format("/{0}", lang));

            return RedirectToAction("Index", "Home", new { lang = lang });
        }

        public FilePathResult SiteMap()
        {
            return File("../SiteMap.xml", "text/xml");
        }

        public ActionResult Pythagoras()
        {
            return View();
        }

        public ActionResult Map()
        {
            return View();
        }

        public JsonResult GetCar()
        {
            gpp.Models.Car theCar = new gpp.Models.Car {Model="KIA", Color="Silver" };
            return Json(theCar);

            //return View();
        }

        public ActionResult TestJSON()
        {
            return View();
        }
    }
}
