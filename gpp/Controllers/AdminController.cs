using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using System.IO;
using Z = gpp.Models;
using System.Web.Configuration;
using System.Configuration;

namespace gpp.Controllers
{
    [Authorize(Roles = "Administrators")]
    public class AdminController : Controller
    {
        //
        // GET: /Admin/

        public AdminController()
        {
            ViewData["Theme"] = "White";

        }

        public ActionResult Protect(int id)
        {
            Configuration conf = WebConfigurationManager.OpenWebConfiguration("/");
            ConfigurationSection appSettings = conf.GetSection("connectionStrings");
            if (id == 1) appSettings.SectionInformation.ProtectSection("DataProtectionConfigurationProvider");
            else appSettings.SectionInformation.UnprotectSection();

            conf.Save();
            return RedirectToAction("Index");
        }

        public ActionResult Index()
        {
            var albums = PhotoManager.GetAlbums();
            return View(albums);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Index(FormCollection form)
        {
            string caption = Request.Form["Title"];
            bool isPublic = false;
            if (Request.Form["IsPublic"] == "on") isPublic = true;

            try
            {
                PhotoManager.ZAddAlbum(caption, isPublic);
                return RedirectToAction("Index");
            }
            catch
            {
                var a = new Z.Album() { Caption = caption, IsPublic = isPublic };
                foreach (var e in a.GetRuleViolations())
                {
                    ModelState.AddModelError(e.TagName, e.ErrorMessage);
                    //e.PropertyName, is the name of the relevant Html input tag
                }
                if (!a.IsValid)
                {
                    //ModelState.AddModelError("_FORM", "Generic Form Error");
                }

                var albums = PhotoManager.GetAlbums();
                return View(albums);
            }
            
        }

        public ActionResult Photos(int id)
        {
            var _photos = PhotoManager.GetPhotos(id);
            ViewData["AlbumID"] = id;

            var files = PhotoManager.ListUploadDirectory();
            ViewData["Upload"] = files;

            return View(_photos);
        }

        public ActionResult Upload(int id)
        {
            DirectoryInfo d = new DirectoryInfo(Server.MapPath("~/Upload"));
            foreach (FileInfo f in d.GetFiles("*.jpg"))
            {
                byte[] buffer = new byte[f.OpenRead().Length];
                f.OpenRead().Read(buffer, 0, (int)f.OpenRead().Length);
                PhotoManager.AddPhoto(id, f.Name, buffer);
            }
            return RedirectToAction("Index");
        }

        public ActionResult ADelete(int id)
        {
            PhotoManager.ZRemoveAlbum(id);
            return RedirectToAction("Index");
        }

        public ActionResult PDelete(int id)
        {
            int albumID = int.Parse(Request.QueryString["AlbumID"]);

            PhotoManager.ZRemovePhoto(id);


            return RedirectToAction("Photos", "Admin", new {id=albumID });
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult PhotoUpload(int id, HttpPostedFileBase image)
        {
            if (image != null)
            {
                string _caption = (string)Request.Form["theCaption"];
                byte[] imgData = new byte[image.ContentLength];
                image.InputStream.Read(imgData, 0, image.ContentLength);
                PhotoManager.ZAddPhoto(id, _caption, imgData);
            }
            return RedirectToAction("Photos", "Admin", new { id = id });
            
        }
    }
}
