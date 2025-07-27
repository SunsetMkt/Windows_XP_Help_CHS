<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 3.0//EN" "html.dtd">
<HTML>
<HEAD>

<META HTTP-EQUIV="Content-Type" content="text/html; charset=gb2312">

<META NAME="ROBOTS" CONTENT="NOINDEX">

<%
' ********** INSTRUCTIONS FOR QUICK CUSTOMIZATION **********
'
' This form is set up for easy customization. It allows you to modify the
' page logo, the page background, the page title and simple query
' parameters by modifying a few files and form variables. The procedures
' to do this are explained below.
'
'
' *** Modifying the Form Logo:

' The logo for the form is named is2logo.gif. To change the page logo, simply
' name your logo is2logo.gif and place in the same directory as this form. If
' your logo is not a GIF file, or you don't want to copy it, change the following
' line so that the logo variable contains the URL to your logo.

        FormLogo = "is2logo.gif"

'
' *** Modifying the Form's background pattern.

' You can use either a background pattern or a background color for your
' form. If you want to use a background pattern, store the file with the name
' is2bkgnd.gif in the same directory as this file and remove the remark character
' the single quote character) from the line below. Then put the remark character on
' the second line below.
'
' If you want to use a different background color than white, simply edit the
' bgcolor line below, replacing white with your color choice.

'       FormBG = "background = " & chr(34) & "is2bkgnd.gif" & chr(34)
        FormBG = "bgcolor = " & chr(34) & "#FFFFFF" & chr(34)


' *** Modifying the Form's Title Text.

' The Form's title text is set on the following line.
%>

    <TITLE>搜索结果</TITLE>

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

<%
'
' *** Modifying the Form's Search Scope.
'
' The form will search from the root of your web server's namespace and below
' (deep from "/" ). To search a subset of your server, for example, maybe just
' a PressReleases directory, modify the scope variable below to list the virtual path to
' search. The search will start at the directory you specify and include all sub-
' directories.

        FormScope = "/iishelp/iis"

'
' *** Modifying the Number of Returned Query Results.
'
' You can set the number of query results returned on a single page
' using the variable below.
				
				'was 10
        PageSize = 10

'
' *** Setting the Locale.
'
' The following line sets the locale used for queries. In most cases, this
' should match the locale of the server. You can set the locale below.

        SiteLocale = "EN-US"

' ********** END QUICK CUSTOMIZATION SECTIONS ***********
noise=",about,after,all,also,an,another,any,and,are,as,at,be,because,been,before,being,between,both,but,by,came,can,come,could,did,do,each,for,from,get,got,has,had,he,have,her,here,him,himself,his,how,if,in,into,is,it,like,make,many,me,might,more,most,much,must,my,never,near,now,of,on,only,or,other,our,out,over,said,same,see,should,since,some,still,such,take,than,that,the,their,them,then,there,these,they,this,those,through,to,too,under,up,very,was,way,we,well,were,what,where,which,while,who,with,would,you,your,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,$,1,2,3,4,5,6,7,8,9,0,_,!,&,~,|,?,I,"

punc2="$,1234567890_!&~|? #+()"
punc="$,1234567890_!&~|?#@%^+"
%>

<%
' Set Initial Conditions
    NewQuery = FALSE
    UseSavedQuery = FALSE
    rSearchString = ""

' Did the user press a SUBMIT button to execute the form? If so get the form variables.
    if Request.ServerVariables("REQUEST_METHOD") = "POST" then
        rSearchString = Request.Form("SearchString")
	SearchType=Request.QueryString("SearchType")
	if SearchString<>"" then
        Session("SearchStringDisplay")=Server.HTMLEncode(rSearchString)
	end if
        rFreeText = Request.Form("FreeText")
	QueryForm = "Query.Asp"
	rCiResultsSize = Request.Form("CiResultsSize")
 	CiLimits = Request.Form("CiLimits")
        ' NOTE: this will be true only if the button is actually pushed.
        ' if Request.Form("Action") = "Search" then
            NewQuery = TRUE
	    if CiLimits = "on" then
			RankBase=50
	    else
			RankBase=1000
	    end if
        ' end if
    end if
    if Request.ServerVariables("REQUEST_METHOD") = "GET" then
        rSearchString = Request.QueryString("SearchString")
	SearchType=Request.QueryString("SearchType")
	QueryForm = "Query.Asp"
	rCiResultsSize = Request.QueryString("CiResultsSize")
                rFreeText = Request.QueryString("FreeText")
                FormScope = Server.HTMLEncode(Request.QueryString("sc"))
				RankBase = CInt(Request.QueryString("RankBase"))
        if Request.QueryString("pg") <> "" then
            NextPageNumber = CInt(Request.QueryString("pg"))
            NewQuery = FALSE
            UseSavedQuery = TRUE
        else
            NewQuery = SearchString <> ""
        end if
    end if

    ' remove HTML special characters, they are ignored in search
    SearchString = replace(replace(replace(rSearchString, "<", ""), ">", ""), """", "")

    ' encode these texts to avoid cross site scripting
    CiResultsSize = Server.HTMLEncode(rCiResultsSize)
    FreeText = Server.HTMLEncode(rFreeText)

%>

</HEAD>

<BODY <%=FormBG%>>

<%
  if NewQuery then
    set Session("Query") = nothing
    set Session("Recordset") = nothing
    NextRecordNumber = 1

	'Strip punctuation from search term
	for x = 1 to len(SearchString)
	   testpunc= mid(SearchString,x,1)
	   if instr(punc,testpunc) then
		SearchStringErr= SearchStringErr
	   else
		SearchStringErr = SearchStringErr + testpunc
	   end if
	next
	SearchString = SearchStringErr


  if SearchType=0 Then
	'Strip noise words from search term
	SearchStringComp=SearchString+" "
	for x = 1 to len(SearchStringComp)
	if mid(SearchStringComp,x,1)=" " Then
		ncompare2 = ","+ncompare+","
		if instr(noise,ncompare2) = 0 then
			NewCompare=NewCompare+" "+ncompare
		End If
		ncompare=""
	else
		ncompare=ncompare+mid(SearchString,x,1)
	end if
	next    	
	x = len(NewCompare)
	if left(NewCompare,1) = " " Then
	   NewCompare = right(NewCompare,(x-1))
	end if
	SearchString=NewCompare
        CompSearch = "$CONTENTS " + SearchString
  end if
 
  if SearchType=1 Then
    CompSearch = chr(34) + SearchString + chr(34)
  end if

  if SearchType=2 Then
	'Strip noise words from search term
	SearchStringComp=SearchString+" "
	for x = 1 to len(SearchStringComp)
	if mid(SearchStringComp,x,1)=" " Then
		ncompare2 = ","+ncompare+","
		if instr(noise,ncompare2) = 0 then
			NewCompare=NewCompare+" "+ncompare
		End If
		ncompare=""
	else
		ncompare=ncompare+mid(SearchString,x,1)
	end if
	next    	
	x = len(NewCompare)
	if left(NewCompare,1) = " " Then
	   NewCompare = right(NewCompare,(x-1))
	end if
	SearchString=NewCompare
	slen=len(SearchString)
	for k = 1 to slen
	slet = Mid(SearchString,k,1)
	  if slet <> " " then
            ss1=ss1+slet
	  else
	    ss1=ss1+ " AND "
	  end if
	Next
        CompSearch=ss1
	If Right(CompSearch,5) = " AND " Then CompSearch = Left(CompSearch,Len(CompSearch)-5)
  end if

 if SearchType=3 Then
	'Strip noise words from search term
	SearchStringComp=SearchString+" "
	for x = 1 to len(SearchStringComp)
	if mid(SearchStringComp,x,1)=" " Then
		ncompare2 = ","+ncompare+","
		if instr(noise,ncompare2) = 0 then
			NewCompare=NewCompare+" "+ncompare
		End If
		ncompare=""
	else
		ncompare=ncompare+mid(SearchString,x,1)
	end if
	next    	
	x = len(NewCompare)
	if left(NewCompare,1) = " " Then
	   NewCompare = right(NewCompare,(x-1))
	end if
	SearchString=NewCompare
	slen=len(SearchString)
	for k = 1 to slen
	slet = Mid(SearchString,k,1)
	  if slet <> " " then
            ss1=ss1+slet
	  else
	    ss1=ss1+ " OR "
	  end if
	Next
        CompSearch=ss1
	If Right(CompSearch,4) = " OR " Then CompSearch = Left(CompSearch,Len(CompSearch)-4)
  end if

  if SearchType=4 Then
	'Strip noise words from search term
	NCompare=""
	NewCompare=""
	SearchStringComp=SearchString+" "
	for x = 1 to len(SearchStringComp)
	if mid(SearchStringComp,x,1)=" " Then
		ncompare2 = ","+ncompare+","
		if instr(noise,ncompare2) = 0 then
			NewCompare=NewCompare+" "+ncompare
		End If
		ncompare=""
	else
		ncompare=ncompare+mid(SearchString,x,1)
	end if
	next    	
	x = len(NewCompare)
	if left(NewCompare,1) = " " Then
	   NewCompare = right(NewCompare,(x-1))
	end if
	SearchString=NewCompare
    CompSearch = SearchString
  end if


    set Q = Server.CreateObject("ixsso.Query")
        set util = Server.CreateObject("ixsso.Util")

    Q.Query = CompSearch
    Q.Catalog = "Web" 
    Q.SortBy = "rank[d]"
    Q.Columns = "DocTitle, vpath, filename, size, write, characterization, rank"
	Q.MaxRecords = RankBase 

        if FormScope <> "/" then
                util.AddScopeToQuery Q, FormScope, "deep"
        end if

        if SiteLocale<>"" then
                Q.LocaleID = util.ISOToLocaleID(SiteLocale)
        end if
    On Error Resume Next
    set RS = Q.CreateRecordSet("nonsequential")

    RS.PageSize = PageSize
    Test = RS.PageSize
    ActiveQuery = TRUE



  elseif UseSavedQuery then
    if IsObject( Session("Query") ) And IsObject( Session("RecordSet") ) then
      set Q = Session("Query")
      set RS = Session("RecordSet")


      if RS.RecordCount <> -1 and NextPageNumber <> -1 then
        RS.AbsolutePage = NextPageNumber
        NextRecordNumber = RS.AbsolutePosition
      end if

      ActiveQuery = TRUE
    else
      Response.Write "ERROR - No saved query"
    end if
  end if


If Err<>424 Then

  if ActiveQuery then
    if not RS.EOF then
 %>

<p>
<HR WIDTH=80% ALIGN=center SIZE=3>
<%LastRecordOnPage = NextRecordNumber + RS.PageSize - 1
KLastRecordOnPage=LastRecordOnPage
If KLastRecordOnPage>RS.RecordCount Then KLastRecordOnPage=RS.RecordCount%>


您输入的关键字：<%=Session("SearchStringDisplay")%><br><br>
<font size="3">本页显示第 <%=NextRecordNumber%> - <%=KLastRecordOnPage%> 个结果，共有 <%=RS.RecordCount%> 个查询结果。</font><br>
<p>

<%
        LastRecordOnPage = NextRecordNumber + RS.PageSize - 1
        CurrentPage = RS.AbsolutePage
        if RS.RecordCount <> -1 AND RS.RecordCount < LastRecordOnPage then
            LastRecordOnPage = RS.RecordCount
        end if

 %>

<%

%>

<%'if Not RS.EOF and NextRecordNumber <= LastRecordOnPage then
	 
	if Not RS.EOF and NextRecordNumber <= LastRecordOnPage then%>
		<table border=0>
<% end if %>

<%

Do While Not RS.EOF and NextRecordNumber <= LastRecordOnPage

        ' This is the detail portion for Title, Description, URL, Size, and
    ' Modification Date.



TmpExt = Server.HTMLEncode( RS("filename") )
FullExt = Right(TmpExt, 3)

If FullExt <> "cnt" and FullExt <> "hhc" and FullExt <> "hpj" and FullExt <> "hlp" and FullExt <> "rtf" and FullExt <> "asf" and FullExt <> "gid" and FullExt <> "fts" and FullExt <> "wmp" and FullExt <> "hhk" and FullExt <> "txt" and FullExt <> "ass" and FullExt <> "idq" and FullExt <> "ncr" and FullExt <> "ncl" and FullExt <> "url" and FullExt <> "css" and FullExt <> "prp" and FullExt <> "htx" and FullExt <> "htw" and FullExt <> "tmp" and FullExt <> "mdb" and FullExt <> "xls" and FullExt <> "chm" Then


    ' If there is a title, display it, otherwise display the filename.
%>
    <p>
	<tr class="RecordTitle">
		
    	        <td><b><%=NextRecordNumber%>.</b></td>
		<b class="RecordTitle"> <td><b>
			<%if VarType(RS("DocTitle")) = 1 or RS("DocTitle") = "" then%>
				<a href="<%=RS("vpath")%>" class="RecordTitle"><%= Server.HTMLEncode( RS("filename") )%></a>
			<%else%>
				<a href="<%=RS("vpath")%>" class="RecordTitle"><%= Server.HTMLEncode(RS("DocTitle"))%></a>
			<%end if%>
		</b></b><br>
		
			<%if VarType(RS("characterization")) = 8 and RS("characterization") <> "" then%>
				<%= RS("characterization")%>
		
		<%end if%>
		<%if CiResultsSize = "on" then%>
                <%end if%>
		</td>
	</tr>
	<tr>
	</tr>

<%
else
   NextRecordNumber = NextRecordNumber-1
end if%>

<%
          RS.MoveNext
          NextRecordNumber = NextRecordNumber+1
      Loop
 %>

</table>

<P><BR>

<%
  else   ' NOT RS.EOF
      if NextRecordNumber <> 1 then
          Response.Write "No more documents in the query.<P>"
      end if

  end if ' NOT RS.EOF%>

<%
  if Q.QueryIncomplete then
'    If the query was not executed because it needed to enumerate to
'    resolve the query instead of using the index, but AllowEnumeration
'    was FALSE, let the user know %>

    <P>
    <B>查询无法完成。请重新提交查询。<BR>详细技术信息：AllowEnumeration 必须设置为 TRUE 才能完成此查询。</B><BR>
<%end if


  if Q.QueryTimedOut then
'    If the query took too long to execute (for example, if too much work
'    was required to resolve the query), let the user know %>
    <P>
    <B>查询时间太长，无法完成。</B><BR>
<%end if%>


<TABLE>

<%
'    This is the "previous" button.
'    This retrieves the previous page of documents for the query.
%>

<%SaveQuery = FALSE%>
<%if CurrentPage > 1 and RS.RecordCount <> -1 then %>
    <td align=left>
        <form action="<%=QueryForm%>" method="get">
            <INPUT TYPE="HIDDEN" NAME="SearchString" VALUE="<%=SearchString%>">
                        <INPUT TYPE="HIDDEN" NAME="FreeText" VALUE="<%=FreeText%>">
	    <INPUT TYPE="HIDDEN" NAME="CiResultsSize" VALUE="<%=CiResultsSize%>">
            <INPUT TYPE="HIDDEN" NAME="sc" VALUE="<%=FormScope%>">
            <INPUT TYPE="HIDDEN" name="pg" VALUE="<%=CurrentPage-1%>" >
			<INPUT TYPE="HIDDEN" NAME = "RankBase" VALUE="<%=RankBase%>">
            <input type="submit" value="<< 上一页">
        </form>
    </td>
        <%SaveQuery = TRUE%>
<%end if%>

<%
'    This is the "next" button for unsorted queries.
'    This retrieves the next page of documents for the query.

  if Not RS.EOF or NextRecordNumber = 9 then%>
    <td align=right>
        <form action="<%=QueryForm%>" method="get">
            <INPUT TYPE="HIDDEN" NAME="SearchString" VALUE="<%=SearchString%>">
                        <INPUT TYPE="HIDDEN" NAME="FreeText" VALUE="<%=FreeText%>">
	    <INPUT TYPE="HIDDEN" NAME="CiResultsSize" VALUE="<%=CiResultsSize%>">
            <INPUT TYPE="HIDDEN" NAME="sc" VALUE="<%=FormScope%>">
            <INPUT TYPE="HIDDEN" name="pg" VALUE="<%=CurrentPage+1%>" >
			<INPUT TYPE="HIDDEN" NAME = "RankBase" VALUE="<%=RankBase%>">

                <% NextString = "More >>"%>
            <input type="submit" value="<%=NextString%>">
        </form>
    </td>
    <%SaveQuery = TRUE%>
<%end if%>

</TABLE>

<% ' Display the page number %>
 <%if RS.RecordCount = 0 then%>
        没有与查询“<%=SearchString%>”匹配的文档。<br><br>您可能需要：<UL><LI>将情况通知我们 <a href="mailto:iisdocs@microsoft.com?subject=<%=SearchString%>-search%20term%20not%20matched&body=The%20term%20'<%=SearchString%>'%20produced%20no%20matches.">(mailto:iisdocs@microsoft.com)</a>，以便我们在以后的版本中改进“搜索”功能。
	<LI>检查相关词条的索引。<LI>重新检查拼写和语法。<LI>尝试其他“搜索”选项（可使用标准搜索、精确词组、任意词、所有词以及布尔搜索）。<LI>请稍后重试查询。注意：如果刚刚启动索引服务，可能需要几分钟来编制 IIS 文档目录。</UL>
    <%else%>

第 <%=CurrentPage%> 页，
<%if RS.PageCount <> -1 then
     Response.Write "共 " & RS.PageCount
Response.Write " 页"
  end if %>
<%end if%>

<%
    ' If either of the previous or back buttons were displayed, save the query
    ' and the recordset in session variables.
    if SaveQuery then
        set Session("Query") = Q
        set Session("RecordSet") = RS
    else
        RS.close
        Set RS = Nothing
        Set Q = Nothing
        set Session("Query") = Nothing
        set Session("RecordSet") = Nothing
    end if
 %>
<% end if %>


</BODY>
</HTML>
<%else%>
<%


	'Strip noise words from search term
	NCompare=""
	NewCompare=""
	SearchStringComp=SearchString+" "
	for x = 1 to len(SearchStringComp)
	if mid(SearchStringComp,x,1)=" " Then
		ncompare2 = ","+ncompare+","
		if instr(noise,ncompare2) = 0 then
			NewCompare=NewCompare+" "+ncompare
		End If
		ncompare=""
	else
		ncompare=ncompare+mid(SearchString,x,1)
	end if
	next    	
	x = len(NewCompare)
	if left(NewCompare,1) = " " Then
	   NewCompare = right(NewCompare,(x-1))
	end if
	SearchString=NewCompare

	'Strip punctuation from search term
	SearchStringErr = ""
	for x = 1 to len(SearchString)
	   testpunc= mid(SearchString,x,1)
	   if instr(punc2,testpunc) then
		SearchStringErr= SearchStringErr
	   else
		SearchStringErr = SearchStringErr + testpunc
	   end if
	next
	SearchString = SearchStringErr
	CompSearch=SearchString

%>


<%if SearchString = "" or instr(SearchString,"*") or instr(CompSearch,")") or instr(CompSearch,"(") or right(CompSearch,3)="OR " or right(CompSearch,4)="AND " then%>
<b>索引服务无法处理您的查询。<p></b><br>请重新确定查询内容，然后重试。一些常用词（如“获取”和“许多”等）没有编入索引。而且，不要在查询中使用标点符号（逗号、句号等）。

<%else%>

没有启动索引服务<p>
*<%=CompSearch%>*<br>要对 IIS 文档执行搜索查询，必须首先启动索引服务。<br>&nbsp;<p>
启动索引服务
<ol>
<li>在运行 IIS 的计算机上，用鼠标右键单击“我的电脑”图标，然后单击“管理”。<p>
<li>在 MMC 中展开“服务和应用程序”节点。<p>
<li>选择“索引服务”。</p>
<li>单击“操作”菜单，然后单击“启动”。<p>
</ol>&nbsp;<p>
注意：索引服务可能需要几分钟来编制 IIS 文档目录。<p>
要在远程查看文档时使用“搜索”，则提供文档的计算机上必须运行索引服务。如果不能启动索引服务，请与网站管理员联系。
<%end if%>
<% end if %>

