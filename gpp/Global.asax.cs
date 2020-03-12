using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Data.SqlClient;
using System.Configuration;

namespace gpp
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801



  
    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterViewEngines(ViewEngineCollection engines)
        {
            engines.Clear();
            engines.Add(new LangViewEngine());
        }

        public class LangConstraint : IRouteConstraint { 
            public bool Match(HttpContextBase httpContext, 
                              Route route, 
                              string parameterName, 
                              RouteValueDictionary values, 
                              RouteDirection routeDirection) 
            {
                if (((string)values[parameterName]=="el") || ((string)values["lang"]=="en"))
                {
                    return true;
                }
                return false;
            } 
        } 
        
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                "Culture",                                                          // Route name
                "{lang}/{controller}/{action}/{id}",                                // URL with parameters
                new { controller = "Home", action = "Index", lang = "en", id = "" },// Parameter defaults
                new { lang = "e(n|l)" }                                              // Parameter constraints
                //new { lang = new LangConstraint() }                               
            );
            
            routes.MapRoute(
                "Default",                                              // Route name
                "{controller}/{action}/{id}",                           // URL with parameters
                new { controller = "Home", action = "Index", id = "" }  // Parameter defaults
            );

        }

        protected void Application_Start()
        {
            //SqlDependency.Start(ConfigurationManager.ConnectionStrings["PersonalCacheString"].ConnectionString);
            RegisterRoutes(RouteTable.Routes);
            RegisterViewEngines(ViewEngines.Engines);
        }
    }
}