<HTML>
<HEAD>
    <TITLE>ASP ������</TITLE>

<META NAME="ROBOTS" CONTENT="NOINDEX">

<META HTTP-EQUIV="Content-Type" content="text/html; charset=gb2312">

<style>
<!--
a:link	 	{color: white; text-decoration:none;}
a:visited 	{color: white; text-decoration:none;}
a:active 	{color: white; text-decoration:none;}
a:hover 	{color: white; text-decoration:underline;}
a		{font-size: 14px; font-family: ����}
-->
</style>

<Script Language="JavaScript">
<!--
function ChangeList(y,z) {

window.location.href="search.asp?Searchset="+(y)+"&SearchString="+(z);

}

//-->
</Script>

<SCRIPT LANGUAGE="VBScript">
<!--
Sub contents_onfocus
	deactivateAll
	contents.childNodes(0).src = "NoCont-active.gif"
End Sub

Sub contents_onblur
	contents.childNodes(0).src = "NoCont.gif"
End Sub

Sub contents_onmouseover
	contents.childNodes(0).src = "NoCont-active.gif"
End Sub

Sub contents_onmouseout
	contents.childNodes(0).src = "Nocont.gif"	
End Sub

Sub index_onfocus
	deactivateAll
	index.childNodes(0).src = "NoIndex-Active.gif"
End Sub

Sub index_onblur
	index.childNodes(0).src = "NoIndex.gif"
End Sub

Sub index_onmouseover
	index.childNodes(0).src = "NoIndex-Active.gif"
End Sub

Sub index_onmouseout
	index.childNodes(0).src = "NoIndex.gif"	
End Sub

sub deactivateAll()
	index.childNodes(0).src = "noindex.gif"
	contents.childNodes(0).src = "Nocont.gif"
end sub

-->
</SCRIPT>

</HEAD>

<BODY bgcolor="#000000" onload="Activate()">
<font face="����">

<SPAN STYLE="position:  relative; left: 0; top: 4">
<A id="contents" HREF="contents.asp" hidefocus><IMG SRC="NoCont.gif" border="0" alt="Ŀ¼"></A><A id="index" HREF="index.asp" hidefocus><IMG SRC="NoIndex.gif" border="0" alt="����"></A><IMG SRC="Search.gif" border="0" alt="����">
</SPAN>

<Script Language="JavaScript">
<!--
function Activate() {
      document.iissrch.SearchString.focus();
}

//-->
</Script>
<TABLE bgcolor="#ffffff" width="262" height="82%" border="0">
<% SearchString=Server.HTMLEncode(Request.QueryString("SearchString"))%>
<% If SearchString="undefined" Then SearchString="" %>

<% SearchSet=Server.HTMLEncode(Request.QueryString("SearchSet"))%>
<% if SearchSet="" then SearchSet=0%>
<FORM ACTION="Query.asp?SearchType=<%=SearchSet%>" name="iissrch" id="iissrch" target="main" METHOD="POST">
<TR border="0" bgcolor="#ffffff" valign="top"><TD>
<IMG SRC="white.gif"> <font style="font-size:9pt">������<br>
<INPUT TYPE="TEXTarea" NAME="SearchString" SIZE="27" MAXLENGTH="100" Value="<% =SearchString%>">
<table>
<tr><td width=65%></td><td>
<INPUT NAME="Action" TYPE="SUBMIT" VALUE="�� ��"</td></tr><tr><td><font tyle="font-size:9pt">ѡ����������:</font></td></tr></table>


<%If SearchSet=0 Then%>
<SELECT NAME="SearchType" ONCHANGE=ChangeList(SearchType.selectedIndex,SearchString.value)>
<Option Selected=True Value="1">��׼����
<Option Value="2">��ȷ����
<Option Value="3">���д�
<Option Value="4">�����
<Option Value="5">��������
</Select>
<%End If%>

<%If SearchSet=1 Then%>
<SELECT NAME="SearchType" ONCHANGE=ChangeList(SearchType.selectedIndex,SearchString.value)>
<Option Value="1">��׼����
<Option Selected=True Value="2">��ȷ����
<Option Value="3">���д�
<Option Value="4">�����
<Option Value="5">��������
</Select>
<%End If%>

<%If SearchSet=2 Then%>
<SELECT NAME="SearchType" ONCHANGE=ChangeList(SearchType.selectedIndex,SearchString.value)>
<Option Value="1">��׼����
<Option Value="2">��ȷ����
<Option Selected=True Value="3">���д�
<Option Value="4">�����
<Option Value="5">��������
</Select>
<%End If%>

<%If SearchSet=3 Then%>
<SELECT NAME="SearchType" ONCHANGE=ChangeList(SearchType.selectedIndex,SearchString.value)>
<Option Value="1">��׼����
<Option Value="2">��ȷ����
<Option Value="3">���д�
<Option Selected=True Value="4">�����
<Option Value="5">��������
</Select>
<%End If%>

<%If SearchSet=4 Then%>
<SELECT NAME="SearchType" ONCHANGE=ChangeList(SearchType.selectedIndex,SearchString.value)>
<Option Value="1">��׼����
<Option Value="2">��ȷ����
<Option Value="3">���д�
<Option Value="4">�����
<Option Selected=True Value="5">��������
</Select>
<%End If%>




<%If SearchSet=0 Then%>
<div style="margin-left: -.25in">
<font size="-1">
<ul>
<li>
����һ����������⡣
<li>
�����ʵ�������ʽ��
<li>������ͨ���ϸߡ�
</div>

<br><b>ʾ����</b>
<div style="margin-left: .17in">
���ֶ��վ��<br> ����Ŀ¼Ȩ��<br> iis �汾�еĸ���
</div>
</font>
<%End If%>

<%If SearchSet=1 Then%>
<div style="margin-left: -.25in">
<font size="-1">
<ul>
<li>
������������
<li>
�����ִ�Сд�����Դ�д��
</div>
<br><b>ʾ����</b>
<div style="margin-left: .17in">
�����֤<br> ssl<br> ���ݿ����<br> ���ӳ�
</div>
</font>
<%End If%>

<%If SearchSet=2 Then%>
<div style="margin-left: -.25in">
<font size="-1">
<ul>
<li>
�ʿ���Ϊ����˳��
<li>
ͨ�������ʲ��ߡ�
</div>
<br><b>ʾ����</b>
<div style="margin-left: .17in">
���� ���� �ʻ�<br> Զ�� ���� Internet<br> ע��� metabase ����<br>
</div>
</font>
<%End If%>

<%If SearchSet=3 Then%>
<div style="margin-left: -.25in">
<font size="-1">
<ul>
<li>
����Ƶ�ʽϸߵ����⽫�����г���
<li>
������ͨ���ϸߡ�
</div>
<br><b>ʾ����</b>
<div style="margin-left: .17in">
��ȫ �ڿ� ����ǽ<br> web Ӧ�ó��� �ű� asp<br> �û� Ȩ�� Ȩ�� �ܾ�<br>
</div>
</font>

<%End If%>

<%If SearchSet=4 Then%>
<div style="margin-left: -.25in">
<font size="-1">
<ul>
<li>
֧�� AND��OR��NEAR �Լ� NOT �������
<li>
�Դ������ַ���ʹ�����š�
<li>
�Ը�������ʹ�����š�
</div>
<br><b>ʾ����</b>
<div style="margin-left: .17in">
֤�� near ��װ<br> "iis ����Ԫ" and ����<br> (v-root or ����) and (���� or Ӧ�ó���)<br>
</div>
</font>

<%End If%>


<p>


<INPUT TYPE="hidden" NAME="CiResultsSize" value= "on"><br>
<BR>

</TD></TR>
</FORM>
</TABLE>

<div align="right" ><A target="main" href="/iishelp/iis/htm/core/NavigationHelp.htm">��������</A></div>
</BODY>
</HTML>

