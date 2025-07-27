<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" Content="text/html; charset=Windows-1252">
<TITLE>Executing Stored Procedures</TITLE>
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

<H2><A NAME="_executing_stored_procedures"></A><SUP> <% If Request("DontFrame")<>1 Then Response.Redirect "/iissamples/sdk/asp/docs/SampFram.asp?ovfile=/iishelp/iis/htm/asp/asps05kj.asp&srcfile=Database/StoredProcedures" %></SUP>Executing Stored Procedures</H2>

<H6>Overview</H6>

<P>Stored procedures, such as those provided by Microsoft<sup>&reg;</sup> SQL Server, are the keys to making large, mission-critical database applications function smoothly and efficiently. This example demonstrates how you can access this functionality by using ADO from within an ASP script.</P>

<H6>Code Tour</H6>

<P>This script first creates an instance of the <B>Connection</B> object and uses it to open an OLE DB connection with the sample database, <I>pubs</I>. A special object, called a <B>Command</B> object, is created next. The <B>Command</B> object's <B>CommandText</B> property is set to the string of the command you want to issue, which for this sample is the name of a stored procedure, ByRoyalty. The <B>Command</B> object <B>Parameters </B>property provides a collection of <B>Parameter</B> objects, and this script uses the <B>Append</B> method to add a new parameter to the collection.</P>

<P>Once <B>CreateParameter</B> has been used to name and configure the parameter instance, the parameter name assigned can be used to access the value of that parameter directly, as if the <B>Command</B> object itself were a collection. Thus </P>

<PRE><CODE>oCmd("@Percentage") = 75 </CODE></PRE>

<P>assigns the value <CODE>75</CODE> to the parameter that the script has labeled as <CODE>@Percentage</CODE>. The <B>Command</B> object's <B>Execute</B> method is invoked, and the resulting recordset is assigned to the object variable <I>oRs </I>defined earlier in the script. The first record of the resultant recordset is displayed.</P>

<P><span class=le><B>Important&nbsp;&nbsp;&nbsp;</B></span>SQL Server must be installed, and configured properly, on the same machine on which IIS is running in order for this sample to work correctly.</P>
<hr class="iis" size="1">
<p align="center"><em><a href="../../../common/colegal.htm">&copy; 1997-2001 Microsoft Corporation. All rights reserved.</a></em></p>
</BODY>
</HTML>
