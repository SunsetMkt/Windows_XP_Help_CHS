<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" Content="text/html; charset=Windows-1252">
<TITLE>Arrays</TITLE>
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

<H2><A NAME="_arrays"></A><SUP> <% If Request("DontFrame")<>1 Then Response.Redirect "/iissamples/sdk/asp/docs/SampFram.asp?ovfile=/iishelp/iis/htm/asp/asps5nlf.asp&srcfile=Simple/Arrays" %></SUP>Arrays</H2>

<H6>Overview</H6>

<P>Arrays are essentially variables that can hold more than one value. Both VBScript and JScript support arrays for most data types. This sample demonstrates how you can create and use arrays in ASP scripts.</P>

<P>Each element of an array is accessed by using an index. Thus, in the array <I>A,</I> <I>A(0)</I> refers to the first element<I>, A(1)</I> refers to the second element, and so on. Note that array elements in both VBScript and JScript are numbered starting at 0.</P>

<P>Arrays can be fixed-size, or dynamically sizable. In both VBScript and JScript, the variable name must be declared, and storage space must be allocated for a new array. This is accomplished by using the <B>Dim</B> statement in VBScript, and the <B>new</B> statement in JScript. If a specific size is explicitly stated, then the array is fixed-size; but if a specific size is omitted from the declaration, then the array is considered dynamically sizable. </P>

<H6>Code Tour</H6>

<P>This sample creates two arrays, <I>aFixed</I>, which is fixed-size, and <I>aColors</I>, which is dynamically sizable. The script then assigns specific string values to each element in the arrays, using the index notation <I>ArrayName</I>(<I>Index</I>) to access the appropriate element. The script then loops through each array by using a <B>For</B> loop, and displays the results in a table.</P>

<P>Note that dynamically sizable arrays are implicitly expanded in JScript, so as to include the highest element indexed in an assignment. VBScript, in contrast, requires that you explicitly resize the dynamic array with the <B>ReDim</B> statement. </P>
<hr class="iis" size="1">
<p align="center"><em><a href="../../../common/colegal.htm">&copy; 1997-2001 Microsoft Corporation. All rights reserved.</a></em></p>
</BODY>
</HTML>
