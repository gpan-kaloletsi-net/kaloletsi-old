<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Pythagoras
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

   
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
	
	<div id="pythInfo" >
	 <h2>A short proof of Pythagorean Theorem via Silverlight</h2>
	<div id="pythImg">
	    <a href="http://en.wikipedia.org/wiki/Pythagoras" target="_new"><img alt="Pythagoras" src='<%= Url.Content("~/Images/Pyth.jpg") %>'/></a>
	</div>
    <div id="pythParagraph" >
    <p>Press <b>Next</b> step to navigate thru the <b>Yellow-Green-Blue-Red</b> triangles. 
    Here follows a description of the first 4 steps. The next 4 ones are quite similar.</p>
    <p>
    <b>Step 1:</b> The Yellow triangle has half the area of the Left square .
    </p>
    </div>
    <p>
    <b>Step 2:</b> The Green triangle has the same area with the previous Yellow one. We just moved the bottom corner along a parallel to its top Base. 
    </p>
    <p>
    <b>Step 3:</b> The Blue triangle is equal to the previous Yellow one. We rotated by 90 degrees counterClockwise.
    </p>
    <p>
    <b>Step 4:</b> The Red triangle has the same area with the previous Blue one. We just moved the bottom corner along the blue  parallel to its top Base. 
    </p>
    <p></p>
    <br /><br />
    <p id="pythNote" ><i>The above small Silverlight application was created trying to understand and learn the new WPF-Silverlight framework of Microsoft.
    Another motivation was to demonstrate the theorem to my small son.
    Because, as the great American physicist 
    <a href="http://en.wikipedia.org/wiki/Richard_Feynman" ><b>Richard Feynman</b></a> 
    has said, <b>"we understand what ever we can make ..."</b>
    </i></p>
    </div>

	<div id="newtonInfo" >
	 <h2>A short proof of Pythagorean Theorem via Silverlight</h2>
	<div id="Div2">
	    <a href="http://en.wikipedia.org/wiki/Pythagoras" target="_new"><img alt="Pythagoras" src='<%= Url.Content("~/Images/Pyth.jpg") %>'/></a>
	</div>
    <div id="Div3" >
    <p>Press <b>Next</b> step to navigate thru the <b>Yellow-Green-Blue-Red</b> triangles. 
    Here follows a description of the first 4 steps. The next 4 ones are quite similar.</p>
    <p>
    <b>Step 1:</b> The Yellow triangle has half the area of the Left square .
    </p>
    </div>
    <p>
    <b>Step 2:</b> The Green triangle has the same area with the previous Yellow one. We just moved the bottom corner along a parallel to its top Base. 
    </p>
    <p>
    <b>Step 3:</b> The Blue triangle is equal to the previous Yellow one. We rotated by 90 degrees counterClockwise.
    </p>
    <p>
    <b>Step 4:</b> The Red triangle has the same area with the previous Blue one. We just moved the bottom corner along the blue  parallel to its top Base. 
    </p>
    <p></p>
    <br /><br />
    <p id="p1" ><i>The above small Silverlight application was created trying to understand and learn the new WPF-Silverlight framework of Microsoft.
    Another motivation was to demonstrate the theorem to my small son.
    Because, as the great American physicist 
    <a href="http://en.wikipedia.org/wiki/Richard_Feynman" ><b>Richard Feynman</b></a> 
    has said, <b>"we understand what ever we can make ..."</b>
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
