<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Πυθαγόρας
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Πυθαγόρειο Θεώρημα μέ Silverlight</h2>
    <div id="silverlightControlHost" >
        <object data="data:application/x-silverlight-2," type="application/x-silverlight-2" width="100%" height="100%">
		  <param name="source" value= '<%= Url.Content("~/ClientBin/PythSlv.xap") %>'/>
		  <param name="onError" value="onSilverlightError" />
		  <param name="background" value="white" />
		  <param name="minRuntimeVersion" value="3.0.40624.0" />
		  <param name="autoUpgrade" value="true" />
		  <a href="http://go.microsoft.com/fwlink/?LinkID=149156&v=3.0.40624.0" style="text-decoration:none">
 			  <img src="http://go.microsoft.com/fwlink/?LinkId=108181" alt="Get Microsoft Silverlight" style="border-style:none"/>
		  </a>
	    </object><iframe id="_sl_historyFrame" style="visibility:hidden;height:0px;width:0px;border:0px"></iframe>
	</div>
	<div id="pythImg">
	    <a href="http://en.wikipedia.org/wiki/Pythagoras" target="_new"><img alt="Pythagoras" src='<%= Url.Content("~/Images/Pyth.jpg") %>'/></a>
	</div>
    <div id="pythParagraph" >
    <p>Γραφική απόδειξη σε 8 βήματα. 
	Σκοπός μας είναι να αποδείξουμε ότι το τετράγωνο της υποτείνουσας έχει εμβαδόν  ίσον με το άθροισμα των τετραγώνων των καθέτων πλευρών.
	Πατήστε <b>Next</b> step για πλοήγηση στα <b>Κίτρινα-Πράσινα-Μπλέ-Κόκκινα</b> τρίγωνα. 
    Ακολουθεί σύντομη περιγραφή των 4 πρώτων βημάτων της απόδειξης. Τα επόμενα 4 είναι παρόμοια.</p>
    <p>
    <b>Βήμα 1:</b> Το κίτρινο τρίγωνο έχει το μισό εμβαδόν του αριστερού τετραγώνου.
    </p>
    </div>
    <p>
    <b>Βήμα 2:</b> Το πράσινο τρίγωνο έχει το ίδιο εμβαδόν με το κίτρινο. Μετακινήσαμε την κάτω κορυφή του κίτρινου τριγώνου κατα μήκος 
	της παραλλήλου προς την άνω βάση του. 
    </p>
    <p>
    <b>Βήμα 3:</b> Το μπλέ τρίγωνο είναι ίσο με το πράσινο. Περιστρέψαμε το πράσινο κατά 90 μοίρες, αντίστροφα προς τους ωρολογιακούς δείκτες.
    </p>
    <p>
    <b>Βήμα 4:</b> Το κόκκινο έχει το ιδιο εμβαδόν με το πράσινο τρίγωνο. Η ίδια εξήγηση όπως και στο πρώτο βήμα. Μετακίνηση της κάτω  κορυφής
	παράλληλα προς τη βάση.
    </p>
    <p></p>
    <br /><br />
    <p id="pythNote" ><i> Η παραπάνω μικρή εφαρμογή Silverlight γράφτηκε στη προσπάθειά μου να αντιληφθώ την νέα WPF-Silverlight τεχνολογία 
	της Microsoft. Ενα άλλο κίνητρο ήταν η παρουσίαση του Πυθαγορείου θεωρήματος στο μικρό γιό μου με τρόπο εύληπτο και κατανοητό.
	Διότι, όπως έλεγε ο μέγας Αμερικανός φυσικός <a href="http://en.wikipedia.org/wiki/Richard_Feynman" ><b>Richard Feynman</b></a> 
    <b>"καταλαβαίνουμε μόνον ότι μπορούμε να κάνουμε ..."</b>
    </i></p>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="jscriptContent" runat="server">
    <script type="text/javascript">
        function onSilverlightError(sender, args) {
            var appSource = "";
            if (sender != null && sender != 0) {
              appSource = sender.getHost().Source;
            }
            
            var errorType = args.ErrorType;
            var iErrorCode = args.ErrorCode;

            if (errorType == "ImageError" || errorType == "MediaError") {
              return;
            }

            var errMsg = "Unhandled Error in Silverlight Application " +  appSource + "\n" ;

            errMsg += "Code: "+ iErrorCode + "    \n";
            errMsg += "Category: " + errorType + "       \n";
            errMsg += "Message: " + args.ErrorMessage + "     \n";

            if (errorType == "ParserError") {
                errMsg += "File: " + args.xamlFile + "     \n";
                errMsg += "Line: " + args.lineNumber + "     \n";
                errMsg += "Position: " + args.charPosition + "     \n";
            }
            else if (errorType == "RuntimeError") {           
                if (args.lineNumber != 0) {
                    errMsg += "Line: " + args.lineNumber + "     \n";
                    errMsg += "Position: " +  args.charPosition + "     \n";
                }
                errMsg += "MethodName: " + args.methodName + "     \n";
            }

            throw new Error(errMsg);
        }
    </script>
</asp:Content>
