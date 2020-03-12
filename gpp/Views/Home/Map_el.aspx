<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site_el.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Καλολετσή, Χάρτης
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Χάρτης Φολόης-Καλολετσής  </h2>

    <div id="theMap">
    </div>
    <div id="goThere">
    <h4>Πως θα πάτε στη Καλολετσή; </h4>
    Για να πάτε στη Καλολετσή, ακολουθείστε την Εθνική οδό <b>Αθήνα-Τρίπολη</b> και μετά τα διόδια της Τριπόλεως
    στριφτε δεξιά για <b>Βιτίνα-Ολυμπία</b>.
    
    <br /><br />
    Πριν φθάσετε στη Βυτίνα στρίφτε δεξιά στον <b> 111</b> δρόμο προς <b>Ολυμπία-Λαμπία (Δίβρη).</b>   
    <br /><br />
    
    Οδηγείστε μέχρι τα <b>Τριπόταμα</b> (σημείο τομής των νομών Ηλίας-Αχαΐας-Αρκαδίας) και συνεχείστε προς <b>Λαμπία (Δίβρη).</b>
    <br /><br />
    Μετά την Λαμπία στρίφτε αριστερά για <b>Λάλα</b> και στη συνέχεια δεξιά για <b>Μηλιές.</b> 
    Αμέσως μετά τις Μηλιές θα κατεβείτε στις πηγές του <b>Ενιπέα</b> και θα συναντήσετε τη Καλολετσή.
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
        map.openInfoWindowHtml(map.getCenter(),
		"This is, <b>Kaloletsi</b><br/>Greece->Olympia->Foloi-><a href='http://kaloletsi.net/Home/Kaloletsi'>Neraida</a><br/><br/>[<b>Coordinates:</b> 37°44'N, 21°40'E]");
        map.setUIToDefault();							
		map.setMapType(G_HYBRID_MAP);
}

</script>

</asp:Content>
