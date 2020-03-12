<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site_el.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Θέμα ιστότοπου
</asp:Content>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Σχετικά</h2>
    <p>
    Αυτή είναι η πρώτη προσπάθειά μου για την δημιουργία ενός ιστότοπου με χρήση του ASP.NET Model View Controller (MVC) παραδείγματος.
    Πρόκειται για σχεδιαστικό πρότυπο που κυκλοφόρησε από την Microsoft τον Απρίλη του 2009.
    Για περισσότερες πληροφορίες επισκεφθείτε το σχετικό ιστότοπο <a href="http://www.asp.net/mvc">Asp.Net MVC, Microsoft</a>.
    Ξεκινήστε με το διδακτικό υλικό <a target="_blank" href="http://www.tinyurl.com/mvchtml">Nerd Dinner.</a>
    
    Αν πράγματι ενδιαφέρεσθε για τις .NET technologies το blog του 
    <a target="_blank" href="http://weblogs.asp.net/scottgu/" > Scott Guthrie  </a> (ScottGu) είναι ότι καλλίτερο!<br /><br />
 
    Ο σχεδιασμός και η υλοποίηση έγινε κατά την διάρκεια των διακοπών μου (Αύγουστος 2009) στο τόπο της γέννησης  μου
    <%=Html.ActionLink("Νεράιδα (Καλολετσή)", "Kaloletsi") %>-Φολόη-Ολυμπία.
    </p>
    <br />
    <div id = "WhyKaloletsi">
    <h4 >Γιατί Kaloletsi.net ?</h4><p></p>
    <p>
    Καλολετσή είναι το όνομα του χωριού στο οποίο γεννήθηκα. Τώρα το χωριό ονομάζεται 
    <%=Html.ActionLink("Neraida-Νεράιδα.", "Neraida") %>
    
    Ακολουθείστε τον παρακάτω σύνδεσμο για να πάτε στον  <%=Html.ActionLink("Google χάρτη", "Map")%> της περιοχής της Καλολετσής.

    </p>
    </div>
</asp:Content>
