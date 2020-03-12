<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<List<Album>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Manage the site Albums
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="jscriptContent" runat="server">
   <script type="text/javascript">
       $(function() {
           $("a.Del").click(function() {
               var _confirmation = confirm("Are you sure, you want to Delete?");
               if (!_confirmation) return false;
           });
       });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div class="page" id="admin-albums">

		<div id="sidebar">
			<h3>Add New Album</h3>
			<p>Before uploading your pictures, create an album to organize your pictures.</p>
			<table cellspacing="0" cellpadding="0" border="0" style="border-width:0px;border-collapse:collapse;">

	        <tr>
		    <td colspan="2">
		            <%=Html.ValidationSummary("Correct the errors:") %>
					<%using (Html.BeginForm())
                   { %>
                   <fieldset>
					<p>
						Title
						<%=Html.ValidationMessage("Title", "(*)") %>
						<br />
						<input name="Title" type="text" id="Title" class="textfield" style="width:200px;" />
						
						<input id="IsPublic" type="checkbox" name="IsPublic" />
						<label for="IsPublic">Make this album public</label>

					</p>
					<p style="text-align:right;">
						<button type="submit" name="add" id="add"  value="Add" style="border-width:0px;" >
						<%= Html.Image("add", string.Format("~/App_Themes/{0}/Images/button-add.gif", ViewData["Theme"]), "add") %>
						</button>
					</p>
					</fieldset>
					<%} %>
			</td>
	        </tr>
        </table>
        <br /><br />Cfg Con:
         [<%= Html.ActionLink("Encrypt", "Protect", new{id=1}) %>]   
         [<%= Html.ActionLink("Decrypt", "Protect", new{id=0}) %>]                
		</div>
		
		<div id="content">
			<h3>The Albums</h3>
			
			<p>The following are the albums	currently on the site. Click <b>Edit</b> to modify the pictures in each 
			album. Click <b>Delete</b> to permanently remove the album and all of its pictures</p>
			
		<div>
	    <table cellspacing="0" cellpadding="6" rules="all" border="0" id="albTable" style="background-color:#ECECEC;border-width:0px;border-style:None;width:420px;border-collapse:collapse;">
	    <%foreach (var a in Model)
       { %>
		<tr>
			<td style="width:116px;">
							<table border="0" cellpadding="0" cellspacing="0" class="photo-frame">
								<tr>
									<td class="topx--"></td>
									<td class="top-x-"></td>
									<td class="top--x"></td>
								</tr>
								<tr>
									<td class="midx--"></td>

									<td><a href='<%=  Url.Action("Photos", "Admin", new{id=a.AlbumID})%>'>
										<img src="<%=  Url.Action("GetImage", "Photo", new {AlbumID= a.AlbumID, Size="S" })%>" class="photo_198" style="border:4px solid white" alt="Sample Photo from Album Number 2" /></a></td>
									<td class="mid--x"></td>
								</tr>
								<tr>
									<td class="botx--"></td>
									<td class="bot-x-"></td>
									<td class="bot--x"></td>
								</tr>

							</table>
						</td><td style="width:280px;">
							<div style="padding:8px 0;">
								<b><%= a.Caption %></b><br />
								<%=a.Count %> Photo(s)<span> Public</span>
							</div>
							<div style="width:100%;text-align:right;">
								<a href='<%=  Url.Action("Photos", "Admin", new{id=a.AlbumID})%>'>
								<%= Html.Image("edit", string.Format("~/App_Themes/{0}/Images/button-edit.gif", ViewData["Theme"]), "Edit") %>
								</a>
                               
								<a class="Del" href='<%=  Url.Action("ADelete", "Admin", new{id=a.AlbumID})%>'>
								<%= Html.Image("delete", string.Format("~/App_Themes/{0}/Images/button-delete.gif", ViewData["Theme"]), "Dele") %>
								</a>
							</div>
						</td>
		    </tr>		
		    <%} %>
			</table>

</div>
</div>
</div>
	
	
</asp:Content>
