<!--#include file="Connections/GreyZDB.asp" -->
<%

Set conn = Server.CreateObject("ADODB.Connection")
conn.Open DayZDB

'sql= "Update survivor set worldspace = ('[91,[11499.8,3752.54,0.001]]') where unique_id = 86283526 and is_dead = 0"
'conn.Execute(sql)

'sql = "select count(id) as thecount from dayz.survivor"
'conn.Execute(sql)
'Response.End

'delete extra tents
'select * from instance_deployable where inventory = '[[[],[]],[[],[]],[[],[]]]' or inventory = '[]' 

	Set rs = Server.CreateObject("ADODB.Recordset")
	
	rs_sql = "select name, profile.unique_id, humanity from profile" &_
	" inner join survivor on survivor.unique_id = profile.unique_id" & _
	" where last_updated >= (NOW() - INTERVAL 580.5 HOUR) and is_dead = 0" & _
	" order by name"
	'response.write rs_sql & "<BR><BR><BR><BR>"

	rs.Open rs_sql, conn, 1, 2
%>
<table border="0">
  <tr>
    <td>
<table border="0">
  <tr>
    <td>&nbsp;</td>
    <td><strong>Name</strong></td>
    <td><strong>ID</strong></td>
    <td><strong>Humanity</strong></td>
    <td></td>
    <td>&nbsp;</td>
  </tr>
<%
i=1
	while not rs.eof
	response.flush
%>
  <tr>
    <td width="50">#<%=i%>.</td>
    <td><a href="profileinfo.asp?UID=<%=rs("unique_id")%>"><%=rs("name")%></a></td>
    <td><a href="profileinfo.asp?UID=<%=rs("unique_id")%>"><%=rs("unique_id")%></a></td>
    <td width="125"><%=rs("humanity")%></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
<%
i=i+1
	rs.movenext
	wend
	rs.close
%>
  
</table>
</td>
    <td width="500" align="center" valign="top" >
    <iframe frameborder="0" src="" id="iframe" name="iframe" width="400" height="500"></iframe>
    </td>
  </tr>
</table>
