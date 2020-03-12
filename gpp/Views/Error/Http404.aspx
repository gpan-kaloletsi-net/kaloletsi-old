<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Error 404
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div >
<fieldset>
  <h3 id="Error404">404 - The URL does not exist.</h2>
     
  <p> 
     
  <%if ((string)ViewData["lang"] == "el")
    {%>   
        <%= GetLocalResourceObject("Desc404_el")%>
    <%} %>
  <%else
      {%>
        <%= GetLocalResourceObject("Desc404_en")%>
       <%} %>
  </p>
  
  <p>  
   <b>Requested URL:</b> 
   <span id="ErrorUrl"><%=Html.Encode(ViewData["url"])%></span> 
</p>

 </fieldset>
</div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="jscriptContent" runat="server">

</asp:Content>

