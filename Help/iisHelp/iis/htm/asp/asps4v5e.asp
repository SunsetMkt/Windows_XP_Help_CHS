<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" Content="text/html; charset=Windows-1252">
<TITLE>Ad Rotator</TITLE>
<SCRIPT LANGUAGE="JavaScript">
<!--
	TempString = navigator.appVersion
	if (navigator.appName == "Microsoft Internet Explorer"){	
// Check to see if browser is Microsoft
		if (TempString.indexOf ("4.") >= 0){
// Check to see if it is IE 4
			document.writeln('<link rel="stylesheet" type="text/css" href="/iishelp/common/coua.css">');
		}
		else {
			document.writeln('<link rel="stylesheet" type="text/css" href="/iishelp/common/cocss.css">');
		}
	}
	else if (navigator.appName == "Netscape") {						
// Check to see if browser is Netscape
		document.writeln('<link rel="stylesheet" type="text/css" href="/iishelp/common/coua.css">');
	}
	else
		document.writeln('<link rel="stylesheet" type="text/css" href="/iishelp/common/cocss.css">');
//-->
</script>
<SCRIPT LANGUAGE="VBScript">
<!--
Sub Window_OnLoad()
   Dim frmContents
   On Error Resume Next
   If Not Parent Is Nothing Then
      Set frmContents = Parent.Contents
      If Not frmContents Is Nothing Then
            frmContents.Window.TOCSynch_Click
      End If
   End If
End Sub
//--></SCRIPT><META NAME="DESCRIPTION" CONTENT="Internet Information Services reference information">
<META HTTP-EQUIV="PICS-Label" CONTENT='(PICS-1.1 "<http://www.rsac.org/ratingsv01.html>" l comment "RSACi North America Server" by "inet@microsoft.com <mailto:inet@microsoft.com>" r (n 0 s 0 v 0 l 0))'>
<META NAME="MS.LOCALE" CONTENT="EN-US">
<META NAME="MS-IT-LOC" Content="Internet Information Services"> 
</HEAD>

<BODY BGCOLOR="#FFFFFF" TEXT="#000000">

<H2><A NAME="_ad_rotator"></A><SUP> <% If Request("DontFrame")<>1 Then Response.Redirect "/iissamples/sdk/asp/docs/SampFram.asp?ovfile=/iishelp/iis/htm/asp/asps4v5e.asp&srcfile=Components/AdRotator" %></SUP>Ad Rotator</H2>

<H6>Overview</H6>

<P>The Ad Rotator component creates an <B>AdRotator</B> object, which automates the rotation of advertisement images on a Web page. The component is designed to display a new advertisement each time a client browser opens or reloads a Web page.</P>

<H6>Code Tour</H6>

<P>This sample demonstrates how to use the Ad Rotator component. The script itself is simple, creating an instance of the <B>AdRotator</B> object and calling the <B>GetAdvertisement</B> method each time the page is loaded. <B>GetAdvertisement</B> returns a single ad entry from the Ad Rotator schedule file, adrot.txt in this example, and the special script delimiter &lt;% = ... %&gt; displays the results to the client browser.</P>

<P>The schedule file for this sample, adrot.txt, is relatively straightforward. The four lines above the asterisk (*) are global file settings that affect all schedule entries in the file. The most interesting and useful global setting is the redirection specification. In this sample, if a user clicks on the advertisement, no matter which particular entry is currently displayed, the user will be transported to the .asp file indicated. These scripts, or DLLs, usually count how many hits a given ad has received, collect user information, and then extract the URL from the request and redirect the client browser once again to the URL that was originally requested.</P>

<P>Each of the entries that occurs below the asterisk consist of four lines, denoting the image to be displayed, hyperlink, alternate text, and the relative probability that that particular entry will be displayed on any given visit to that Web page. Thus, the Microsoft<sup>&reg;</sup> Internet Information Services image has an 80 percent chance of being displayed with each hit on that page, while the Microsoft Internet Explorer image will be displayed for only 20 percent of the hits.</P>

<P><span class=le><B>Note&nbsp;&nbsp;&nbsp;</B></span>If an advertisement entry in the schedule file does not have a corresponding URL, the hyperlink line of the entry must contain a hyphen (-) or the Ad Rotator component will return an error.</P>
<hr class="iis" size="1">
<p align="center"><em><a href="../../../common/colegal.htm">&copy; 1997-2001 Microsoft Corporation. All rights reserved.</a></em></p>
</BODY>
</HTML>
