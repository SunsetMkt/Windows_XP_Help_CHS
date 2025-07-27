<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" Content="text/html; charset=Windows-1252">
<TITLE>Setting Expiration Information</TITLE>
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

<H2><A NAME="_setting_expiration_information"></A><SUP> <% If Request("DontFrame")<>1 Then Response.Redirect "/iissamples/sdk/asp/docs/SampFram.asp?ovfile=/iishelp/iis/htm/asp/asps4j72.asp&srcfile=Interaction/Expire" %></SUP>Setting Expiration Information</H2>

<H6>Overview</H6>

<P>You can give every page or script on the server an expiration date. The expiration date can either be in the form of an absolute date, such as January 1, 2000, or a relative date, such as 600 minutes from the time the page was first downloaded by the client browser. If a client browser requests that same page again before the expiration date and time, then the client browser uses its own cached copy.</P>

<H6>Code Tour</H6>

<P>This example illustrates how your script can set the expiration date for a file. The <B>Response.Expires</B> property is used to set the relative expiration date. The unit of measurement is minutes, so if this property is set to 10, as in the example, then the page will expire after 10 minutes.</P>

<P>The <B>Response.ExpiresAbsolute</B> property is used to specify an absolute expiration date. In this example, the page is specified to expire on January 1, 1999, at 1:30:15 P.M. Either the time or the date can be left out when assigning an expiration date.</P>

<P><span class=le><B>Note&nbsp;&nbsp;&nbsp;</B></span>IIS sends all HTTP headers required for a given Web page or script before any HTML is sent to the client browser. Therefore, all statements and methods that modify the HTTP headers of the response, including setting the <B>Response.Expires</B> and <B>Response.ExpiresAbsolute</B> properties, must be located before the &lt;HTML&gt; tag in your script. If your script attempts to modify the HTTP headers after the server has begun sending HTML content back to the client browser, the script will generate an error.</P>
<hr class="iis" size="1">
<p align="center"><em><a href="../../../common/colegal.htm">&copy; 1997-2001 Microsoft Corporation. All rights reserved.</a></em></p>
</BODY>
</HTML>
