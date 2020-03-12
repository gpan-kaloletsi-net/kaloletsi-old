<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
            <h2><%= Html.Encode(ViewData["Message"]) %> </h2>
        
		<div id="sidebar">
		<hr />
		<table cellspacing="0" cellpadding="0" border="0" style="border-width:0px;border-collapse:collapse;">
        <tr>
		    <td colspan="2">
					<h4>Photo of the Day</h4>
					<table border="0" cellpadding="0" cellspacing="0" class="photo-frame">
						<tr>

							<td class="topx--"></td>
							<td class="top-x-"></td>
							<td class="top--x"></td>
						</tr>
						<tr>
							<td class="midx--"></td>
							<td>
							    <a href= "<%=  Url.Action("Details", "Photo", new{id=string.Format("{0}-{1}",ViewData["AlbumID"], ViewData["PhotoID"])}) %>" >
								   <img src="<%=  Url.Action("GetImage", "Photo", new {PhotoID= ViewData["PhotoID"], Size="M" })%>" class="photo_198" style="border:4px solid white" alt='Photo Number 68' />
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
					<p class="saying">
					Ancient Greeks contributed the <b>PROOF</b> to the field of Mathematics.
					This was the result of their every day culture, that they have got due to <b>Democracy.</b>
					<br />Proof = persuasion = Evidence = reason. <br /> <br /> 

                    In contrast the main qualification of the monks is <b>OBEDIENCE</b>, that is submit without 
                    any terms to the Authorities = <b>DESPOTISM.</b>
                   	
					</p>
					<p>
					<a href='<%=  Url.Action("Download", "Photo", new{id=ViewData["PhotoID"]})%>'>
						<%= Html.Image("download", string.Format("~/App_Themes/{0}/Images/button-download.gif", ViewData["Theme"]), "download")%>						
					</a>
					</p>
					
					<p>See <%=Html.ActionLink("more photos", "Index", "Photo") %> </p>
					<hr />
				</td>
	    </tr>
	
	    <tr>
		    <td colspan="2">
		    </td>
	    </tr>
        </table>
    
        <h4 id="latestWork" >Latest interests</h4>
		<p>
            I steal some time every day to keep up to date with .NET technologies (C#, MVC, WPF, LINQ). 
		</p>
		<p>
		    I plan to start reading the novel "The Parrot's Theorem by Dennis Guedj". 
        </p>
        <p>		    
            Even though I am not a believer, I listen every day to the 
			<a target="_blank" href="http://www.ecclesia.gr/greek/ecclesiaradio/index.htm">"Church of Greece"</a> radio station.
            It is really an oasis within the mass media rubbish-desert.

		</p>
		</div>
		<div id="content">

			<h3>Welcome	to My Site</h3>
			<p>
			This is my personal site. Here you will find: <br />
			<ul>
			    <li>Photos</li>
			    <li>Sap articles and Links</li>
			    <li>Microsoft .NET technology related Info</li>

			    <li>Various subjects</li>
			    <li>My CV</li>
			</ul>
			
			</p>
			<hr	/>
			<div id="whatsnew">
				<h4>What's New</h4>

				<p>Go to the  <a href="http://www.asp.net" target="_new" > ASP.NET site </a> 
				to start learning Asp.NET, Find Videos and How to articles. 
				</p>
				<p>Jump to the <a href="http://www.linqpad.net/" target="_new"> LINQ pad site</a> 
				You will find everything you need to start learning LINQ.
				</p>
			</div>
			<div id="coollinks">

				<h4>Cool Links</h4>
				<ul	class="link">
					<li><a href="http://msdn.com/beginner" target="_new">MSDN Developer's site</a></li>
					<li><a href="http://msdn.microsoft.com/en-us/devlabs/cc950524.aspx" target="_new">C# Development Center</a></li>
					<li><a href="http://msdn.microsoft.com/en-us/devlabs/cc950524.aspx" target="_new">SmallBasic Spinoff project</a></li>
					<li><a href="http://silverlight.net" target="_new">SilverLight Applications</a></li>

					<li><a href="http://sdn.sap.com" target="_new">SAP developer's Center</a></li>
				</ul>
			</div>
			<div id="clearBoth"></div>
			<hr	/>
			<div id="whatsUp">
			<h4>What's Up Lately </h4>
			<p>
			It was a joy to explore the ASP.Net , <a href="http://www.asp.net/community/projects/" target="_new">Starter Kits.</a>	
			Based on those, I was able to create this personal site. Learning ASPX is really exciting!
			</p>
			<p>
			During my vacations, August 2009, I read fragments from the following books:
			<ul>
			<li>WPF in action</li> 
			<li>Pro WPF in C#</li> 
			<li>JQuery in action</li> 
			<li>Pro ASP.Net MVC</li> 
			<li>CSS Web design</li>
			</ul>
			
			I had also with me the "The Parrot's Theorem by Dennis Guedj" but my 11 years old son started reading this, so I will read it in another occasion. 
			</p>
            </div>

		</div>

</asp:Content>
