<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
    About Us
</asp:Content>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>About</h2>
    <p>
    This is my first attempt for a web site using the ASP.NET Model View Controller (MVC) technology. This is the state of the art platform issued by Microsoft at 2009, April.
    Visit the site to learn more <a href="http://www.asp.net/mvc">Asp.Net MVC, Microsoft</a>. 
    For a tutorial using MVC follow the link <a target="_blank" href="http://www.tinyurl.com/mvchtml">Nerd Dinner.</a>
    
    If you are interested in .NET technologies the 
    <a target="_blank" href="http://weblogs.asp.net/scottgu/" > Scott Guthrie's blog </a> (ScottGu) is a must!<br /><br />
    
    
    I implemented this site during my vacations at my village <%=Html.ActionLink("Neraida-Foloi-Olympia.", "Kaloletsi") %>    
    </p>
    <br />
     
    <div id = "WhyKaloletsi">
    <h4 >Why Kaloletsi.net ?</h4><p></p>
    <p>
    Kaloletsi (Καλολετσή) is the old name of my birth place. Now the village is called <%=Html.ActionLink("Neraida-Νεραιδα.", "Neraida") %>
    Follow the link to see a <%=Html.ActionLink("Google map", "Map")%> of the Kaloletsi area.
    </p>
    </div>
 
</asp:Content>
