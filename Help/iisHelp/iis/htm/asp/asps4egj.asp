<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" Content="text/html; charset=Windows-1252">
<TITLE>Server-Side Includes</TITLE>
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

<H2><A NAME="_server_side_includes"></A><SUP> <% If Request("DontFrame")<>1 Then Response.Redirect "/iissamples/sdk/asp/docs/SampFram.asp?ovfile=/iishelp/iis/htm/asp/asps4egj.asp&srcfile=Simple/Includes" %></SUP>Server-Side Includes</H2>

<H6>Overview</H6>

<P>Modularity and reusability of code can be very useful in your development of ASP scripts. For example, if you want to display copyright information on the bottom of each of your HTML pages and ASP pages, ASP provides a solution to this problem: server-side includes, which are directives to the server to include a certain file, which can be a text file, graphical image, or an ASP function. The copyright notice can exist as one file, and be included into the rest of your Web site's files. And if the copyright notice changes, you only have to change one file instead of 50 or 500.</P>

<P>The syntax for including a file is:</P>

<PRE><CODE>&lt;!-- #include PathType=Name --&gt;
</CODE></PRE>

<P>The <I>PathType</I> parameter consists of a keyword, either FILE or VIRTUAL, which indicates whether the <I>Name</I> string specified is a physical or virtual path. </P>

<H6>Code Tour</H6>

<P>This example uses the <B>#include</B> directive to include the file HeaderInfo.asp. When this script is executed, ASP loads the script line by line, character by character, until it gets to the <B>#include</B> directive, at which point it loads the contents of the designated file, line by line. Then the remainder of the sample script is loaded; once this is finished the script is executed, included file and all. </P>

<P><span class=le><B>Note&nbsp;&nbsp;&nbsp;</B></span>If the file that your ASP script includes contains a large number of functions and variables that are not used by the including script, the extra resources occupied by these unused structures can adversely affect performance, and ultimately decrease the scalability of your Web application. Therefore, it is generally advisable to break your include files into multiple smaller files, and include only those files required by your ASP script, rather than include one or two larger include files that may contain unneeded information.</P>
<hr class="iis" size="1">
<p align="center"><em><a href="../../../common/colegal.htm">&copy; 1997-2001 Microsoft Corporation. All rights reserved.</a></em></p>
</BODY>
</HTML>
