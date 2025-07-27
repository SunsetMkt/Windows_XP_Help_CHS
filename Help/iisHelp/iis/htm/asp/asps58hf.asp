<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" Content="text/html; charset=Windows-1252">
<TITLE>Functions and Procedures</TITLE>
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

<H2><A NAME="_functions_and_procedures"></A><SUP> <% If Request("DontFrame")<>1 Then Response.Redirect "/iissamples/sdk/asp/docs/SampFram.asp?ovfile=/iishelp/iis/htm/asp/asps58hf.asp&srcfile=Simple/Functions" %></SUP>Functions and Procedures</H2>

<H6>Overview</H6>

<P>Functions and procedures provide a way to avoid rewriting the same block of code every time you want to perform a particular task. Both VBScript and JScript allow you to call a function or procedure from any point in a script. This sample demonstrates how you can create and use these tools with ASP. </P>

<P>If you don't have any functions in your ASP page, the ASP engine simply processes your entire file, start to finish, each time it is requested by a client browser. Functions and procedures, however, are executed only when called, not inline with the rest of the code. </P>

<P>You can denote functions and procedures in VBScript or JScript by using the <B>Function</B> statement. In addition, VBScript makes a distinction between a function that returns a value and a function that does not; a function that returns a value is denoted with the <B>Sub</B> statement, indicating that it is a subroutine. </P>

<H6>Code Tour</H6>

<P>This sample defines one function, <B>PrintOutMsg</B>, which takes as parameters a message, and a number that specifies how many times the message is to be written to the client browser with the <B>Response.Write</B> method. The function, for the purposes of this sample, simply returns to the client browser the number of times the message was printed. </P>

<H6>Remarks</H6>

<P>It is important to note the RUNAT attribute of the &lt;SCRIPT&gt; tag. If the RUNAT attribute is not included, ASP will assume that the script is client-side scripting, and will pass the code back to the browser for processing. ASP would then not recognize the <B>PrintOutMsg</B> function call, return an error, and abort. </P>
<hr class="iis" size="1">
<p align="center"><em><a href="../../../common/colegal.htm">&copy; 1997-2001 Microsoft Corporation. All rights reserved.</a></em></p>
</BODY>
</HTML>
