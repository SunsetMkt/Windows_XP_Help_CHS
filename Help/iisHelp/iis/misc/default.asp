<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">

<% @Language = "VBScript" %>

<html dir=ltr><head><title>Microsoft Internet 信息服务&nbsp;5.1 文档</title>

<META NAME="ROBOTS" CONTENT="NOINDEX">
<META HTTP-EQUIV="Content-Type" content="text/html; charset=gb2312">

</head>

<% Set OBJbrowser = Server.CreateObject("MSWC.BrowserType")
	BrsType = Request.ServerVariables("HTTP_User-Agent")
	MachType=Request.ServerVariables("HTTP_UA-CPU")
	If InStr(BrsType, "MSIE") Then
		If InStr(BrsType, "Windows") Then
			File="contents.asp" 
			Size="30"
			Scroll="Auto"
		Else
			File="coflat.htm"
			Size="34"
			Scroll="Yes"
		End If
		If MachType="Alpha" Then
			File="contalph.asp"
			Size="30"
			Scroll="Auto" 
		End If
	Else

		File="coflat.htm"
		Size="34"
		Scroll="Yes"
	End If
%>

 
<%
        If Request.QueryString("jumpurl") <> "" Then
                strMainUrl = Server.HTMLEncode(Request.QueryString("jumpurl"))
		quote = chr(34)
		strMainUrl = replace(str, quote, quote & quote)

        Else
                strMainUrl = "../htm/core/iiwltop.htm" 
        End If
 %>


<!--frameset cols="275,*"-->


<frameset rows="<% =Size%>,*" FRAMEBORDER="0" FRAMESPACING="0">
	<frame src="navbar.asp" name="NavBar" scrolling="No" noresize marginheight="0" marginwidth="0" framespacing="0" frameborder="No">
	<frameset cols="284,*">
        	<frame src=<% =File%> name="contents"  scrolling=<% =Scroll%> FRAMEBORDER="0" FRAMESPACING="0">
        	<frame src="<% =strMainUrl%>" name="main" FRAMEBORDER="0" FRAMESPACING="0">
	</frameset>
</frameset>


<noframes>

<body bgcolor="#FFFFFF" text="#000000"><font face="宋体,Verdana,Arial,Helvetica">

<h1>Microsoft Internet 信息服务&nbsp;5.1 文档</h1>

<p>Microsoft Internet 信息服务&nbsp;5.1 文档必须用支持帧的浏览器查看。要查看此文档，请单击下面的图标下载最新版本的 Microsoft&reg; Internet Explorer。</p>

<p><A HREF="http://www.microsoft.com/isapi/redir.dll?prd=ie&ar=inews" target="_top"><IMG SRC="../../common/bestwith.gif" ALT="单击此处开始" ALIGN="BOTTOM" BORDER="0" VSPACE="7" WIDTH="88" HEIGHT="31" HSPACE="5"></A></p>

<hr class="iis" size="1">
<p align="center"><em><a href="../../common/colegal.htm">&copy; 1997-1998 Microsoft Corporation. 保留所有权利。</a></em></p>
</font>
</noframes>

</body>
</html>