<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">    
	<div class="page" id="details">
		<div class="photoCap" ><%=ViewData["Caption"] %></div>

		<table class="view" cellspacing="0" cellpadding="0" border="0" style="border-width:0px;border-style:None;border-collapse:collapse;">

	<tr>
		<td colspan="2">
			
				<div class="buttonbar buttonbar-top">
					<a href="<%=  Url.Action("Index", "Photo")%>">
					<%= Html.Image("gallery", string.Format("~/App_Themes/{0}/Images/button-gallery.gif", ViewData["Theme"]), "gallery")%>						
					</a> &nbsp;&nbsp;&nbsp;&nbsp;

					<a href=<%=  Url.Action("Details", "Photo", new{id=ViewData["FirstID"]})%> > 
					<%= Html.Image("first", string.Format("~/App_Themes/{0}/Images/button-first.gif", ViewData["Theme"]), "first")%>						
					</a>

					<a href=<%=  Url.Action("Details", "Photo", new{id=ViewData["PrvID"]})%> > 
					<%= Html.Image("prev", string.Format("~/App_Themes/{0}/Images/button-prev.gif", ViewData["Theme"]), "prev")%>						
					</a>

					<a href=<%=  Url.Action("Details", "Photo", new{id=ViewData["NxtID"]})%> > 
					<%= Html.Image("next", string.Format("~/App_Themes/{0}/Images/button-next.gif", ViewData["Theme"]), "next")%>						
					</a>
					
					<a href=<%=  Url.Action("Details", "Photo", new{id=ViewData["LastID"]})%> > 
					<%= Html.Image("last", string.Format("~/App_Themes/{0}/Images/button-last.gif", ViewData["Theme"]), "last")%>						
					</a>

				</div>
				<table border="0" cellpadding="0" cellspacing="0" class="photo-frame">
					<tr>
						<td class="topx--"></td>
						<td class="top-x-"></td>
						<td class="top--x"></td>
					</tr>

					<tr>
						<td class="midx--"></td>
						<td><img src=<%=  Url.Action("GetImage", "Photo", new {PhotoID= ViewData["PhotoID"], Size="L" })%>  class="photo_198" style="border:4px solid white" alt='Photo Number 5' /></a></td>
						<td class="mid--x"></td>
					</tr>
					<tr>
						<td class="botx--"></td>
						<td class="bot-x-"></td>
						<td class="bot--x"></td>

					</tr>
				</table>
				<p>
				    <a href='<%=  Url.Action("Download", "Photo", new{id=ViewData["PhotoID"]})%>'>
					<%= Html.Image("download", string.Format("~/App_Themes/{0}/Images/button-download.gif", ViewData["Theme"]), "download")%>						
					</a>
				</p>				

				<div class="buttonbar">
					<a href="<%=  Url.Action("Index", "Photo")%>">
					<%= Html.Image("gallery", string.Format("~/App_Themes/{0}/Images/button-gallery.gif", ViewData["Theme"]), "gallery")%>						
					</a> &nbsp;&nbsp;&nbsp;&nbsp;

					<a href=<%=  Url.Action("Details", "Photo", new{id=ViewData["FirstID"]})%> > 
					<%= Html.Image("first", string.Format("~/App_Themes/{0}/Images/button-first.gif", ViewData["Theme"]), "first")%>						
					</a>

					<a href=<%=  Url.Action("Details", "Photo", new{id=ViewData["PrvID"]})%> > 
					<%= Html.Image("prev", string.Format("~/App_Themes/{0}/Images/button-prev.gif", ViewData["Theme"]), "prev")%>						
					</a>

					<a href=<%=  Url.Action("Details", "Photo", new{id=ViewData["NxtID"]})%> > 
					<%= Html.Image("next", string.Format("~/App_Themes/{0}/Images/button-next.gif", ViewData["Theme"]), "next")%>						
					</a>
					
					<a href=<%=  Url.Action("Details", "Photo", new{id=ViewData["LastID"]})%> > 
					<%= Html.Image("last", string.Format("~/App_Themes/{0}/Images/button-last.gif", ViewData["Theme"]), "last")%>						
					</a>
				</div>

			</td>
	</tr>
</table>
	</div>
	

</asp:Content>
