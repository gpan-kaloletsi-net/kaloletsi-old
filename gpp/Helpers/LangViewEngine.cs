using System.Web.Mvc;
using System.Web;
using System.IO;

public class LangViewEngine : VirtualPathProviderViewEngine
{
    //private string _root = null;
    public LangViewEngine() :base()
    {
        
        MasterLocationFormats = new[]{
            "~/Views/Shared/{0}.master"
        };

        ViewLocationFormats = new[]{
            "~/Views/{1}/{0}.aspx",
            "~/Views/Shared/{0}.aspx",
        };

        PartialViewLocationFormats = new[]{
            "~/Views/{1}/{0}.ascx",
            "~/Views/Shared/{0}.ascx",
        };
    }

    protected override IView CreatePartialView(ControllerContext controllerContext, string partialPath)
    {
        return new WebFormView(partialPath, null);
    }

    //Language specific viewPath
    private string LangViewPath(ControllerContext controllerContext, string viewPath)
    {
        
        string lang =   (string)controllerContext.Controller.ViewData["lang"] 
                    ??  (string)controllerContext.RequestContext.RouteData.Values["lang"];

        /*
        if (HttpContext.Current != null)
            _root = HttpContext.Current.Request.PhysicalApplicationPath;
        */
        
        /*
        if (controllerContext.RequestContext.RouteData.Values.ContainsKey("lang"))
            lang = controllerContext.RequestContext.RouteData.GetRequiredString("lang");

        if ((string)controllerContext.Controller.ViewData["lang"] != null)
            lang = (string)controllerContext.Controller.ViewData["lang"];
        */

        /*
        string[] tokens = viewPath.Split(new char[] { '/' });
        string _viewName = _root;

        for (int i = 1; i < tokens.Length; i++)
        {
            _viewName = Path.Combine(_viewName, tokens[i]);
        }
        */

        string _physViewPath = HttpContext.Current.Server.MapPath(viewPath);
        if (lang != null)
        {
            _physViewPath = _physViewPath.Replace(".aspx", string.Format("_{0}.aspx", lang));
            if (File.Exists(_physViewPath)) viewPath = viewPath.Replace(".aspx", string.Format("_{0}.aspx", lang));
        }

        return viewPath;
    }

    protected override IView CreateView(ControllerContext controllerContext, string viewPath, string masterPath)
    {
        return new WebFormView(LangViewPath(controllerContext, viewPath), masterPath);
    }
}