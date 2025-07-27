<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" Content="text/html; charset=Windows-1252">
<TITLE>Client-Side Scripting</TITLE>
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

<H2><A NAME="_client_side_scripting"></A><SUP> <% If Request("DontFrame")<>1 Then Response.Redirect "/iissamples/sdk/asp/docs/SampFram.asp?ovfile=/iishelp/iis/htm/asp/asps4m7b.asp&srcfile=Interaction/ClientScript" %></SUP>Client-Side Scripting</H2>

<H6>Overview</H6>

<P>ASP is a server-side scripting environment. Client-side scripting complements ASP nicely, allowing for a number of enhancements, such as ActiveX<sup>&reg;</sup> controls, that can make your application more powerful and user-friendly.</P>

<H6>Code Tour</H6>

<P>This example demonstrates how you can include a client-side script in your preferred scripting language. This script defines a subroutine called <B>DoIt</B> within the &lt;SCRIPT&gt; tags. Note that there is no RUNAT=SERVER attribute present, which indicates that the script is an ASP subroutine. The page provides one button for the user that, when clicked, executes the <B>DoIt</B> subroutine on the client browser.</P>

<P>This sample demonstrates a very useful advantage to combining ASP scripts with client-side scripting. When ASP encounters the &lt;SCRIPT&gt; tags, it does not simply ignore everything within that block. It continues to search for, parse, and execute script elements, specified with delimiters (&lt;% ... %&gt;), that are meant for the server. This example, therefore, returns within a client-side script the session information returned from the <B>Session.SessionID</B> method.</P>
<hr class="iis" size="1">
<p align="center"><em><a href="../../../common/colegal.htm">&copy; 1997-2001 Microsoft Corporation. All rights reserved.</a></em></p>
</BODY>
</HTML>
