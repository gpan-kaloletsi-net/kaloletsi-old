<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<List<List<gpp.Models.Album>>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Albums
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="albums">

        <h3>Welcome to My Photo Galleries</h3>
        <p>
        Here you can see photos that I have shot the last 8 years. Mainly from my area Kaloletsi or from areas around Enipeas river.
        Have a look at the Epikourios Apollon Album. This is a temple that it deserves a visit. Designed by Iktinos like Parthenon, 
        it is in excellent state, even today, after 2500 years.
        </p>
        <hr />
      
        <table class="view" cellspacing="0" cellpadding="0" border="0" style="border-width:0px;border-collapse:collapse;">
        <%foreach (var g in Model)
          { %> 
    	<tr>
        <%foreach (var a in g)
          { %>
		<td class="item">
                <table border="0" cellpadding="0" cellspacing="0" class="album-frame">
                    <tr>
                        <td class="topx----">
                        <%= Html.Image("album-l1", string.Format("~/App_Themes/{0}/Images/album-l1.gif", ViewData["Theme"]), " ")%>
                        </td>
                        
                        <td class="top-x---">
                        <%= Html.Image("album-mtl", string.Format("~/App_Themes/{0}/Images/album-mtl.gif", ViewData["Theme"]), " ")%>                        
                        </td>
                        
                        <td class="top--x--"></td>
                        
                        <td class="top---x-">
                        <%= Html.Image("album-mtr", string.Format("~/App_Themes/{0}/Images/album-mtr.gif", ViewData["Theme"]), " ")%>                        
                        </td>
                        
                        <td class="top----x">
                        <%= Html.Image("album-r1", string.Format("~/App_Themes/{0}/Images/album-r1.gif", ViewData["Theme"]), " ")%>
                        </td>

                    </tr>
                    
                    <tr>
                        <td class="mtpx----">
                        <%= Html.Image("album-l2", string.Format("~/App_Themes/{0}/Images/album-l2.gif", ViewData["Theme"]), " ")%>
                        </td>
                        
                        <td colspan="3" rowspan="3">
                        <a href=<%=  Url.Action("Album", "Photo", new{id=a.AlbumID})%>  >
                        <img src=<%=  Url.Action("GetImage", "Photo", new {AlbumID= a.AlbumID, Size="M" })%>  class="photo_198" style="border:4px solid white" alt='Sample Photo from Album Number 2' />
                        </a>
                        </td>
                        
                        <td class= "mtp----x">
                        <%= Html.Image("album-r2", string.Format("~/App_Themes/{0}/Images/album-r2.gif", ViewData["Theme"]), " ")%>
                        </td>
                    </tr>
                    <tr>
                        <td class="midx----"></td>
                        <td class="mid----x"></td>
                    </tr>
                    <tr>
                        <td class="mbtx----">
                        <%= Html.Image("album-l3", string.Format("~/App_Themes/{0}/Images/album-l3.gif", ViewData["Theme"]), " ")%>
                        </td>
                        
                        <td class="mbt----x">
                        <%= Html.Image("album-r3", string.Format("~/App_Themes/{0}/Images/album-r3.gif", ViewData["Theme"]), " ")%>
                        </td>
                    </tr>
                    <tr>
                        <td class="botx----">
                        <%= Html.Image("album-l4", string.Format("~/App_Themes/{0}/Images/album-l4.gif", ViewData["Theme"]), " ")%>
                        </td>
                        <td class="bot-x---">
                        <%= Html.Image("album-mbl", string.Format("~/App_Themes/{0}/Images/album-mbl.gif", ViewData["Theme"]), " ")%>
                        </td>
                        <td class="bot--x--"></td>

                        <td class="bot---x-">
                        <%= Html.Image("album-mbr", string.Format("~/App_Themes/{0}/Images/album-mbr.gif", ViewData["Theme"]), " ")%>
                        </td>
                        <td class="bot----x">
                        <%= Html.Image("album-r4", string.Format("~/App_Themes/{0}/Images/album-r4.gif", ViewData["Theme"]), " ")%>
                        </td>
                    </tr>
                </table>
               
				<h4><a href="<%=  Url.Action("Album", "Photo", new{id=a.AlbumID})%>"><%=a.Caption%></a></h4>
				<%=a.Count%> Photo(s)

				</td>  	
				<%} %>							
	</tr>
	<%} %>
</table>
    
				
    </div>


</asp:Content>
