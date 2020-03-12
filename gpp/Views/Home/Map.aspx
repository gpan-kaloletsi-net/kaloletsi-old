<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Kaloletsi Map
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Foloi-Kaloletsi Map </h2>

    <div id="theMap">
    </div>
    <div id="goThere">
    <h4>How to go there </h4>
    In order to go to Kaloletsi, follow the National road from <b>Athens to Tripolis</b> and after the Tripolis Toll station 
    turn to the right (Vitina/<b>Olympia</b>). 
    <br /><br />
    Then before reaching Vitina follow the <b>111 road</b> to <b>Olymia - Lampia</b>. 
    <br /><br />
    Drive upto <b>Tripotama</b> (intersection point of Ilia-Arkadia-Achaia) and then continue for <b>Lampia (Divri)</b>.
    <br /><br />
    After Lampia turn to the left for <b>Lala</b> and then right for <b>Milies</b> and finally you reach the <b>Enipeas river and Kaloletsi (Neraida)</b>. 
    <p /> <br /><br />
    <p>
    [<b>Coordinates:</b> 37°44'N, 21°40'E]
    </p>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="jscriptContent" runat="server">
<script type="text/javascript">
$(document).ready(function(){
	createMap();
});
function createMap(){
	    var map = new GMap2(document.getElementById("theMap"));
        map.setCenter(new GLatLng(37.733, 21.66), 13);
        map.setUIToDefault();
        map.setMapType(G_HYBRID_MAP);
        map.openInfoWindowHtml(map.getCenter(),"<p>TestXXXXX</p>");

}

</script>

</asp:Content>
