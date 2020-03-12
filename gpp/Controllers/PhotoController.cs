using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Z = gpp.Models;

namespace gpp.Controllers
{
    [OutputCache(CacheProfile = "PhotoCacheProfile", SqlDependency = "Personal:Photos;Personal:Albums")]
    //[OutputCache(CacheProfile = "PhotoCacheProfile", SqlDependency = "CommandNotification")]
    public class PhotoController : Controller
    {
        public PhotoController()
        {
            ViewData["Theme"] = "White";
        }

        /*
        private ActionResult View(string lang, string viewName, object model)
        {
            if (lang == "el") return View(String.Format("{0}_el", viewName), model);
            else return View(viewName, model); ;
        }
        */

        public ActionResult GetImage()
        {
            return new ImageResult();
        }

        public JsonImageResult GetJsonImage()
        {
            return new JsonImageResult();
        }

        public ActionResult Album(int id)
        {
            var photos = PhotoManager.ZGetPhotos(id);
            List<List<Z.Photo>> grpsOfPhotos = new List<List<Z.Photo>>();
            List<Z.Photo> fourPhotos = new List<Z.Photo>();
            int i = 0;

            foreach (var p in photos)
            {
                fourPhotos.Add(p);
                i++;
                if ((i % 4) == 0)
                {
                    grpsOfPhotos.Add(fourPhotos);
                    fourPhotos = new List<Z.Photo>();
                }
            }


            if ((i % 4) != 0) grpsOfPhotos.Add(fourPhotos);
            ViewData["AlbumID"] = id;
            return View(grpsOfPhotos);
        }

        public ActionResult Index()
        {
            var albums = PhotoManager.ZGetAlbums();
            List<List<Z.Album>> grpsOfAlbums = new List<List<Z.Album>>();
            List<Z.Album> twoAlbums = new List<Z.Album>();
            int i = 0;
            foreach (var a in albums)
            {
                twoAlbums.Add(a);
                i++;

                if ((i % 2) == 0)
                {
                    grpsOfAlbums.Add(twoAlbums);
                    twoAlbums = new List<Z.Album>();
                }

            }

            if ((i % 2) !=0) grpsOfAlbums.Add(twoAlbums);
            ViewResult v = View(grpsOfAlbums);
            return v;
        }

        //[OutputCache(Duration=30,VaryByParam="none")]
        public ActionResult Details(string id)
        {
            string[] tokens = id.Split(new char[1] { '-' });
            ViewData["AlbumID"] = tokens[0];
            ViewData["PhotoID"] = tokens[1];

            var photos = PhotoManager.GetPhotos(int.Parse(tokens[0]));
            int cur = photos.FindIndex(p => p.PhotoID == int.Parse(tokens[1]));
            if (cur < 0) return View("NotFound");

            int nxt = cur;
            int prv = cur;
            //
            if (cur < photos.Count - 1) nxt = cur + 1;
            if (cur > 0) prv = cur - 1;

            var NxtID = string.Format("{0}-{1}", tokens[0], photos[nxt].PhotoID);
            var PrvID = string.Format("{0}-{1}", tokens[0], photos[prv].PhotoID);
            ViewData["NxtID"] = NxtID;
            ViewData["PrvID"] = PrvID;
            ViewData["FirstID"] = string.Format("{0}-{1}", tokens[0], photos[0].PhotoID); ;
            ViewData["LastID"]  = string.Format("{0}-{1}", tokens[0], photos[photos.Count - 1].PhotoID); ; ;
            ViewData["Caption"] = photos[cur].Caption;

            return View();
        }

        public ActionResult Download(int id)
        {
            ViewData["PhotoID"] = id;
            return View();
        }
    }
}
