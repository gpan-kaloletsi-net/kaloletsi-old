<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<System.Web.Mvc.HandleErrorInfo>" %>

<asp:Content ID="errorTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Unhandled Error
</asp:Content>

<asp:Content ID="errorContent" ContentPlaceHolderID="MainContent" runat="server">
<fieldset>
  <h3 id="Unhandled">Unhandled Error.</h2>
  
  <p> 
    Sorry, an error occurred while processing your request.     
  </p>
    
 </fieldset>

</asp:Content>
