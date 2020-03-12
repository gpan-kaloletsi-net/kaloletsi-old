<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Download
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Download</h2>
    <div>

		<p>Right-click and select "Save Picture As.." to download the picture.</p>
		<table cellspacing="0" cellpadding="0" border="0" id="FormView1" style="border-width:0px;border-style:None;border-collapse:collapse;">
    	<tr>
		<td colspan="2">
			<img src="<%=  Url.Action("GetImage", "Photo", new {PhotoID= ViewData["PhotoID"]})%> " alt='Photo Number 6' />
		</td>
	    </tr>
        </table>

		

    </div>

</asp:Content>
