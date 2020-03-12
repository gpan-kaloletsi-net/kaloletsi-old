<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    if (Request.IsAuthenticated) {
%>
        (<b><%= Html.Encode(Page.User.Identity.Name) %></b>)
        [ <%= Html.ActionLink("Log Off", "LogOff", "Account") %> ]
<%
    }
    else {
%> 
        [ <%= Html.ActionLink("Log On", "LogOn", "Account") %> ]
<%
    }
%>
