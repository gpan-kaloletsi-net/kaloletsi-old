<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<System.Web.Mvc.HandleErrorInfo>" %>

<asp:Content ID="errorTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Σοβαρό λάθος
</asp:Content>

<asp:Content ID="errorContent" ContentPlaceHolderID="MainContent" runat="server">
<fieldset>
  <h3 id="Unhandled">Σοβαρό λάθος.</h2>
     
  <p> 
    Συγνώμη, αλλά ένα σοβαρό λάθος δεν επιτρέπει την εμφάνιση της σελίδας...
  </p>
    
 </fieldset>

</asp:Content>
