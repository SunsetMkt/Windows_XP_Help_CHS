<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" Content="text/html; charset=Windows-1252">
<TITLE>Using Cookies</TITLE>
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

<H2><A NAME="_using_cookies"></A><SUP> <% If Request("DontFrame")<>1 Then Response.Redirect "/iissamples/sdk/asp/docs/SampFram.asp?ovfile=/iishelp/iis/htm/asp/asps2kdv.asp&srcfile=Interaction/Cookie" %></SUP>Using Cookies</H2>

<H6>Overview</H6>

<P>You can use cookies to store information about a particular client, session, or application. You can then use this information to customize and streamline a client browser's session.</P>

<H6>Code Tour</H6>

<P>This sample illustrates how your application can query the value of a particular cookie. IIS makes cookies available to ASP scripts through the <B>Request.Cookies</B> collection. This example first queries the cookie CookieVBScript or CookieJScript by using the standard collection-access format, <I>object.collection</I>(<I>keyname</I>). It then resets that cookie to the current date and time.</P>

<P>If the initial query yields a null string, that indicates the client browser has never visited the page in question before, and a first-time welcome message is displayed. If a value is returned by the initial query of CookieVBScript or CookieJScript, however, it indicates not only that the client browser has visited before, but when that last visit took place.</P>

<P><span class=le><B>Note&nbsp;&nbsp;&nbsp;</B></span>IIS sends all HTTP headers required for a given Web page or script before any HTML is sent to the client browser. Therefore, all statements and methods that modify the HTTP headers of the response, including setting of the <B>Response.Cookies</B> collection members, must be located before the &lt;HTML&gt; tag in your script. If your script attempts to modify the HTTP headers after the server has begun sending HTML content back to the client browser, the script will generate an error.</P>
<hr class="iis" size="1">
<p align="center"><em><a href="../../../common/colegal.htm">&copy; 1997-2001 Microsoft Corporation. All rights reserved.</a></em></p>
</BODY>
</HTML>
