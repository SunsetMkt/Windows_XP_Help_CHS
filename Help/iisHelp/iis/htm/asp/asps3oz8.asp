<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" Content="text/html; charset=Windows-1252">
<TITLE>User Form Input with POST</TITLE>
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

<H2><A NAME="_user_form_input_with_post"></A><SUP> <% If Request("DontFrame")<>1 Then Response.Redirect "/iissamples/sdk/asp/docs/SampFram.asp?ovfile=/iishelp/iis/htm/asp/asps3oz8.asp&srcfile=Interaction/Form" %></SUP>User Form Input with POST</H2>

<H6>Overview</H6>

<P>The most basic form of interactivity on the Web is probably the HTML form. It is important to note that ASP does not replace forms, but rather enhances them, and makes them easier for you to implement and manage.</P>

<P>The HTML &lt;FORM&gt; tag specifies what method the form will use to convey information to the processing script. The <B>POST</B> method attribute indicates that information from the form will be passed to the processing script or program through a separate HTTP connection. The processing script or program can parse the information and do whatever task is required, and return output to the client browser.</P>

<H6>Code Tour</H6>

<P>This example demonstrates how to implement a simple form by using the HTML <B>POST</B> method attribute, as well as one key benefit of creating forms with ASP: the ability to combine the form and the actual processing code into the same file. This sample creates a small form with two text input boxes, one for the user's first name (<I>fname</I>) and one for his or her last name (<I>lname</I>). The <B>Request.Forms</B> collection is accessed to get the value of the <I>fname</I> and <I>lname</I> variables from the request, and the results are displayed at the bottom of the page.</P>

<P>The first time you run this script, no text will be displayed below the horizontal line. This is because no form information was available to pass to this script when it started, and ASP ignores searches of <B>Request.Forms</B> for information that does not exist. However, if you press the Submit button, the page is reloaded and the information you entered into the text boxes is available to the script.</P>
<hr class="iis" size="1">
<p align="center"><em><a href="../../../common/colegal.htm">&copy; 1997-2001 Microsoft Corporation. All rights reserved.</a></em></p>
</BODY>
</HTML>
