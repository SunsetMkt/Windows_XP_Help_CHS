<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" Content="text/html; charset=Windows-1252">
<TITLE>Basic Transaction</TITLE>
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

<H2><A NAME="_basic_transaction"></A><SUP> <% If Request("DontFrame")<>1 Then Response.Redirect "/iissamples/sdk/asp/docs/SampFram.asp?ovfile=/iishelp/iis/htm/asp/asps4pim.asp&srcfile=Transactional/SimpleTransaction" %></SUP>Basic Transaction</H2>

<H6>Overview</H6>

<P>Using ASP, you can easily take advantage of the reliability provided by Component Services. To do so you only need to include the @TRANSACTION directive in your script. This directive tells Component Services that any changes occurring in the page, such as database manipulation or Message Queuing message transmission, should be considered transactions. A change that is being managed by transaction services can either be committed which would make the change permanent, or aborted the latter would result in the database or queue being rolled back to its previous state, before the changes were made.</P>

<H6>Code Tour</H6>

<P>In this sample, the entire page has been declared a transaction, by use of the @TRANSACTION directive. The sample provides some scripting commands for two other procedures that are called to perform additional completion or clean-up tasks. <B>OnTransactionCommit </B>is called either when the script has successfully completed, or the <B>ObjectContext.SetComplete</B> method has been called. Likewise, <B>OnTransactionAbort</B> is called either when the script encounters some kind of processing error, or the <B>ObjectContext.SetAbort</B> method has been called.</P>

<P>This sample commits by default, since it simply prints a small message and then exits. Since the directive declared the script to be a transaction, exiting successfully automatically commits changes made in the script (although in this case there are none), and triggers the <B>OnTransactionCommit</B> procedure, which prints a message.</P>

<P><span class=le><B>Important&nbsp;&nbsp;&nbsp;</B></span>The @TRANSACTION directive must be on the first line of the .asp file, or an error will be generated.</P>
<hr class="iis" size="1">
<p align="center"><em><a href="../../../common/colegal.htm">&copy; 1997-2001 Microsoft Corporation. All rights reserved.</a></em></p>
</BODY>
</HTML>
