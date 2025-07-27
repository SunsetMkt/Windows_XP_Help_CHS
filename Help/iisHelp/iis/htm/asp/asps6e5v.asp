<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" Content="text/html; charset=Windows-1252">
<TITLE>Variables</TITLE>
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

<H2><A NAME="_variables"></A><SUP> <% If Request("DontFrame")<>1 Then Response.Redirect "/iissamples/sdk/asp/docs/SampFram.asp?ovfile=/iishelp/iis/htm/asp/asps6e5v.asp&srcfile=Simple/Variables" %></SUP>Variables</H2>

<H6>Overview</H6>

<P>Every application ever written, regardless of the programming language, has used variables of some sort, and ASP scripts are no exception. Both VBScript and JScript allow you to create and manage variables simply and easily. </P>

<P>Each language deals with variable declaration differently. Both JScript and VBScript are quite flexible about variables and their declaration. In VBScript, any variable is automatically considered to be of the <B>Variant</B> type when it is initially declared with the <B>Dim</B> statement. Each variable eventually is assigned a subtype, such as <B>Numeric</B> and <B>Array</B>. JScript is similar; the variable is initially declared with the <B>var</B> statement. Both languages, in general, try to perform much of the data type management, including type conversion, automatically. In fact, you don't even have to use the <B>Dim</B> or <B>var</B> statements at all to use a new variable; they are optional in their respective languages.</P>

<H6>Code Tour</H6>

<P>This sample declares several different kinds of variables, performs simple operations on them, and then displays them to the client browser using the special &lt;% = ...%&gt; script delimiters. An integer is assigned to the variable <I>intVariable</I>, added to itself, and the sum sent to the client browser. <I>StrVariable</I> is set to equal to the first name, is added to Smith, and sent to the client browser. Booleans and dates are likewise declared or created, initialized, manipulated, and displayed. </P>

<H6>Remarks</H6>

<P>Of particular interest is the final step in the date variable demonstration. In VBScript, the variable is first assigned a literal date string, and displayed. It is then reset, and assigned the value that is returned by the VBScript <B>Now</B> function, which returns the current system time. The JScript example uses the JScript <B>Date</B> function to set both the initial literal by passing parameters to the function, and then to set the variable equal to the current system time by passing no parameters to the function. </P>
<hr class="iis" size="1">
<p align="center"><em><a href="../../../common/colegal.htm">&copy; 1997-2001 Microsoft Corporation. All rights reserved.</a></em></p>
</BODY>
</HTML>
