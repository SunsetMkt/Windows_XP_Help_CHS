<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" Content="text/html; charset=Windows-1252">
<TITLE>Scrollable Query</TITLE>
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

<H2><A NAME="_scrollable_query"></A><SUP> <% If Request("DontFrame")<>1 Then Response.Redirect "/iissamples/sdk/asp/docs/SampFram.asp?ovfile=/iishelp/iis/htm/asp/asps6fax.asp&srcfile=Database/MultiScrolling" %></SUP>Scrollable Query</H2>

<H6>Overview</H6>

<P>When you design application for an Internet environment, you will often want to limit the amount of information that a database query returns to a client browser. This example demonstrates how a script, using ASP and ADO, can limit the number of rows passed to the client browser in any one chunk, but still allow the user to browse through all the results of the query.</P>

<H6>Code Tour</H6>

<P>The script consists of several code sections that all work together to accomplish this task. First, the database is accessed as usual, creating a <B>Connection </B>object and <B>Recordset</B> object. The <B>Recordset</B> object's <B>PageSize</B> property is set to 4, and the recordset is opened and populated with the query results from the database table Authors. The first logical page of four result records are displayed in a table. Two buttons, PgUp and PgDn, are provided so that the user can view other pages of the recordset.</P>

<P>If a user clicks on a button, the page is accessed again, this time using the <B>POST</B> method to pass some variables to the next copy of itself. The variable <I>PageNo</I> is used to store what page the user is currently viewing, while the <I>Mv</I> variable is used to pass the scrolling direction to the next form. If a user clicks on PgDn, for instance, the page is accessed again, with <I>Mv</I> set to PgDn and <I>PageNo</I> set to 1. The script would use that information to add 1 to the current page number, and <B>AbsolutePage</B> could then be used to display the next page of results.</P>

<P><span class=le><B>Important&nbsp;&nbsp;&nbsp;</B></span>OLE DB must be properly configured on the server for this sample to run properly.</P>
<hr class="iis" size="1">
<p align="center"><em><a href="../../../common/colegal.htm">&copy; 1997-2001 Microsoft Corporation. All rights reserved.</a></em></p>
</BODY>
</HTML>
