<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">

<html dir=ltr><HEAD><TITLE>目录</TITLE>
<META NAME="ROBOTS" CONTENT="NOINDEX">
<META HTTP-EQUIV="Content-Type" content="text/html; charset=gb2312">
</HEAD>

<BODY bgcolor="#000000">
<SCRIPT LANGUAGE="VBScript">
<!--
Function Dec(strHex)
    Dec = InStr("123456789ABCDEF", UCase(Left(strHex,1))) * 16
    Dec = Dec + InStr("123456789ABCDEF", UCase(Mid(strHex,2,1)))
End Function

Function FixHex(ByVal strURL)
    Dim x
    FixHex = ""    
    x = InStr(1,strURL,"%")
    Do While (x > 0)
        FixHex = FixHex & Left(strURL,x-1)
        FixHex = FixHex & Chr(Dec(Mid(strURL,x+1)))
        strURL = Mid(strURL,x+3)
        x = InStr(1,strURL,"%")
    Loop
    FixHex = FixHex & strURL
End Function

Sub TOCSynch_Click()
MyUrl=parent.frames(2).location
x=InStr(MyUrl,"/iishelp")
y=Len(MyUrl)
NewUrl=FixHex(Right(MyUrl,y-(x-1)))
call hhctrl.syncURL(NewUrl)
call hhctrl.syncURL(NewUrl)
end sub

Sub TOCPrint_Click()
MyUrl=parent.frames(2).location
x=InStr(MyUrl,"/iishelp")
y=Len(MyUrl)
NewUrl=FixHex(Right(MyUrl,y-(x-1)))
hhctrl.syncURL(NewUrl)
hhctrl.syncURL(NewUrl)
hhctrl.Print()
End Sub
-->
</SCRIPT>

<SPAN STYLE="position:  relative; left: 0; top: 4">
<IMG SRC="Cont.gif" border="0" alt="目录">
</Span>

<SPAN STYLE="position:  relative; left: -4; top: 4">
<A HREF="Index.asp"><IMG SRC="NoIndex.gif" border="0" alt="索引"></A>
</Span>


<SPAN STYLE="position:  relative; left: -8; top: 4">
<A HREF="Search.asp"><IMG SRC="NoSearch.gif" border="0" ALT="搜索"></A>
</Span>


<table width=262 height="31" border="0" cellspacing=2 bgcolor="white" bordercolor="white">
<TR><TD width="208">

</TD>
<TD align="right">
<SPAN STYLE="position:  relative; left: 1; top: 0">
<a href="#Ptoc" onclick="TOCPrint_Click()"><img src="print.gif" border="0" alt="打印某个主题或节点"></a><a name="Ptoc"></a>
</SPAN>
</td>
<td align="left">
<a href="#Stoc" onclick="TOCSynch_Click()"><img src="synch.gif" border="0" alt="使目录与目录窗格同步"></a><a name="Stoc"></a>
</td></tr></table>


<OBJECT id=hhctrl type="application/x-oleobject"
        classid="clsid:adb880a6-d8ff-11cf-9377-00aa003b7a11"
        codebase="../../common/alpha.cab#version=4,73,8412,0"
        width="262"
        height="74%">
    <PARAM name="Command" value="Contents">
    <PARAM name="flags" value="0x0,0x35,0xFFFFFFFF">
    <PARAM name="Item1" value="cohhc.hhc">
</OBJECT>
</BODY>
</HTML>