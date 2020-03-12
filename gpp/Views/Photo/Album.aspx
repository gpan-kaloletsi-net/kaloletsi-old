<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<List<List<gpp.Models.Photo>>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Album
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <div id="photos">
        
		<div class="buttonbar">
			<a href=<%=  Url.Action("Index", "Photo")%> >			
			<%= Html.Image("gallery", string.Format("~/App_Themes/{0}/Images/button-gallery.gif", ViewData["Theme"]), "gallery") %>
			</a>
		</div>
		<table class="view" cellspacing="0" border="0" style="border-collapse:collapse;">
		<% foreach (var g in Model)
        { %>
	    <tr>
		<% foreach (var p in g)
     { %>
		<td>
				<table border="0" cellpadding="0" cellspacing="0" class="photo-frame">
					<tr>
						<td class="topx--"></td>
						<td class="top-x-"></td>
						<td class="top--x"></td>
					</tr>
					<tr>
						<td class="midx--"></td>
						<td>
						    <a href=<%=  Url.Action("Details", "Photo", new{id=string.Format("{0}-{1}",ViewData["AlbumID"], p.PhotoID)})%> >
                            <img src=<%=  Url.Action("GetImage", "Photo", new {PhotoID= p.PhotoID, Size="S" })%>  class="photo_198" style="border:4px solid white" alt='Thumbnail of Photo Number 5' />
                            </a>
                        </td>
							
						<td class="mid--x"></td>
					</tr>
					<tr>
						<td class="botx--"></td>
						<td class="bot-x-"></td>
						<td class="bot--x"></td>
					</tr>
				</table>

				<p><%= p.Caption %></p>
			</td>
			<%} %>
			</tr>
			<%} %>
			</table>

		<div class="buttonbar">
			<a href=<%=  Url.Action("Index", "Photo")%> >
			<%= Html.Image("gallery", string.Format("~/App_Themes/{0}/Images/button-gallery.gif", ViewData["Theme"]), "gallery") %>
			</a>
		</div>
</div>
</asp:Content>
