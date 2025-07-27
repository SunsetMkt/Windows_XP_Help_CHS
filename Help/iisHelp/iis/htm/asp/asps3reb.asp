<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" Content="text/html; charset=Windows-1252">
<TITLE>Limit Query Results</TITLE>
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

<H2><A NAME="_limit_query_results"></A><SUP> <% If Request("DontFrame")<>1 Then Response.Redirect "/iissamples/sdk/asp/docs/SampFram.asp?ovfile=/iishelp/iis/htm/asp/asps3reb.asp&srcfile=Database/LimitRows" %></SUP>Limit Query Results</H2>

<H6>Overview</H6>

<P>In an Internet environment, it is often desirable to limit the amount of information that a database query returns to a client browser. This example demonstrates how a script, using ASP and ADO, can limit the number of rows returned.</P>

<H6>Code Tour</H6>

<P>The sample first creates an instance of the <B>Connection</B> object, and opens the OLE DB connection with this object's <B>Open</B> method. <B>CreateObject</B> is used again to instantiate an empty <B>Recordset</B> object. The <B>ActiveConnection</B> property of the new <B>Recordset</B> object is set to point at the open OLE DB connection, an SQL source string is assigned, and cursor type specified. The key to limiting the results lies with the <B>Recordset</B> object's <B>PageSize</B> property. For this example, the value is set to 10, which indicates that ADO is to return at most 10 records. Finally, the <B>Open</B> method is called, and ADO searches for the first 10 records that fulfill the SQL search string.</P>

<P>When ADO has returned and placed the results of the search into the <B>Recordset</B> object, the script loops through the page, displaying all fields of each record in a table. The script then performs the typical housecleaning operations, closing both the recordset and the connection.</P>

<P>It is important to realize that if the SQL query had returned more than 10 records, this script would not display them. Instead, the extra records would be deposited on one or more additional, logical pages. The property <B>PageCount</B> indicates how many logical pages of data were returned.</P>

<P><span class=le><B>Important&nbsp;&nbsp;&nbsp;</B></span>OLE DB must be properly configured on the server for this sample to run properly.</P>
<hr class="iis" size="1">
<p align="center"><em><a href="../../../common/colegal.htm">&copy; 1997-2001 Microsoft Corporation. All rights reserved.</a></em></p>
</BODY>
</HTML>
