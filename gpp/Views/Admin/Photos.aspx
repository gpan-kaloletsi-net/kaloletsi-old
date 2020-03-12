<%@ Page Title="" Language="C#"  MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<List<Photo>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Photos
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="jscriptContent" runat="server">
    <script type="text/javascript" src="/scripts/scrollsaver.min.js"></script>
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
	<div class="page" id="admin-photos">
		<div id="sidebar">
			<h4>Bulk Upload	Photos</h4>
			<p>The following files were found in your <b>Upload</b>	folder. Click on <b>Import</b>	to import these	pictures to your photo album. This operation may take a	few moments.</p>
			
            <%using (Html.BeginForm("Upload", "Admin", new {id=ViewData["AlbumID"] }))
              { %>
			
			<fieldset>
			<p >Press to upload the following photos:</p>
			<p style="text-align:center;">
			    <button type="submit" name="import" id="import" value="Upload" style="border-width:0px;" >
				<%= Html.Image("import", string.Format("~/App_Themes/{0}/Images/button-import.gif", ViewData["Theme"]), "import") %>                
			    </button>
            </p>			    
			</fieldset>
			<%} %>

            <div id="UploadList" >
			<h4 id="UploadCaption" >Upload List</h4>
			<table id="UploadTable" cellspacing="0" border="0" style="border-collapse:collapse;">			
			<%foreach (var f in ViewData["Upload"] as ICollection)
            {%>
        	<tr><td><%=f %></td></tr>
	        <%} %>
            </table>
            </div>
            
		</div>

		<div id="content">
			<h4>Add	a Photo</h4>
			<p>To add single photos	over HTTP, select a file and caption, then click <b>Add</b>.</p>

        <fieldset>
        
		<table cellspacing="0" cellpadding="0" border="0" id="photo-add" style="border-width:0px;border-collapse:collapse;">
	    <tr>
		<td colspan="2">
					<span style="color:Red;display:none;">You must choose a caption.</span>
					<%using (Html.BeginForm("PhotoUpload", "Admin", new { id = ViewData["AlbumID"] }, FormMethod.Post, new { enctype = "multipart/form-data" }))
       { %>
					<p>
						Photo<br />
						<input type="file" name="image" id="image" class="textfield" style="width:416px;" /><br />
						Caption<br />

						<input name="theCaption" type="text" id="theCaption" class="textfield" style="width:326px;" />
					</p>
					<p style="text-align:left;">
						<button type="submit" name="add" id="add"  style="border-width:0px;" >
        				<%= Html.Image("add", string.Format("~/App_Themes/{0}/Images/button-add.gif", ViewData["Theme"]), "add") %>                
						</button>
					</p>
					<%} %>
		</td>
	    </tr>
        </table>
		</fieldset>
		<hr />

		<h4>Photos in This Album</h4>
		<p>The following are the photos	currently in this album.</p>
		<div>
	    <table cellspacing="0" cellpadding="6" rules="all" border="0" id="phoTable" style="background-color:#ECECEC;border-width:0px;border-style:None;width:420px;border-collapse:collapse;">
		<%foreach (var p in Model)
    { %>
		<tr>
			<td style="width:50px;">
							<table border="0" cellpadding="0" cellspacing="0" class="photo-frame">
								<tr>

									<td class="topx--"></td>
									<td class="top-x-"></td>
									<td class="top--x"></td>
								</tr>
								<tr>
									<td class="midx--"></td>
									<td><a href='<%=  Url.Action("Details", "Photo", new{id=string.Format("{0}-{1}",ViewData["AlbumID"], p.PhotoID)})%> '>
										<img src='<%=  Url.Action("GetImage", "Photo", new {PhotoID= p.PhotoID, Size="S" })%> ' class="photo_198" style="border:2px solid white;width:50px;" alt='Thumbnail of Photo' /></a></td>
									<td class="mid--x"></td>

								</tr>
								<tr>
									<td class="botx--"></td>
									<td class="bot-x-"></td>
									<td class="bot--x"></td>
								</tr>
							</table>
						    </td>
						    
						    <td>
						        <%=p.Caption %> 
						    </td>
						    
						    <td style="width:150px;">
							<div style="width:100%;text-align:right;">
							
								<a class="Del" href='<%=  Url.Action("PDelete", "Admin", new{id=p.PhotoID, albumID=ViewData["AlbumID"]})%>'>
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
