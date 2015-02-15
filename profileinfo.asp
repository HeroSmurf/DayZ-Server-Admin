<!--#include file="Connections/GreyZDB.asp" -->
<%

Set conn = Server.CreateObject("ADODB.Connection")
conn.Open DayZDB
Set rs = Server.CreateObject("ADODB.Recordset")
UID = Request.Querystring("UID")

if request.form <> "" then

	rs_sql = "select * from survivor" &_
	" where unique_id = '"& UID &"' and is_dead = 0"
	'response.write rs_sql & "<BR>"
	rs.Open rs_sql, conn, 1, 2
	If not rs.eof then
		rs("worldspace") = Request.Form("worldspace")
		rs("inventory") = Request.Form("inventory")
		rs("backpack") = Request.Form("backpack")
		rs("medical") = Request.Form("medical")
		rs("is_dead") = Request.Form("is_dead")
		rs("model") = Request.Form("model")
		rs.update
	End If
	rs.close
Response.Write "File Updated<BR>"
	
end if

	
	
	rs_sql = "select * from profile" &_
	" where unique_id = '"& UID &"'"
	'response.write rs_sql & "<BR>"

	rs.Open rs_sql, conn, 1, 2
%>
<div align="center">
  <a href="default.asp">back to list</a><br />
  <br />
  <table border="0">
    <tr>
      <td width="100"><strong>Name</strong></td>
      <td><%=rs("Name")%></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><strong>Player ID</strong></td>
      <td><%=rs("Unique_ID")%></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><strong>ID</strong></td>
      <td><%=rs("ID")%></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><strong>Humanity</strong></td>
      <td><%=rs("humanity")%></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td></td>
      <td>&nbsp;</td>
    </tr>
  </table>
<%
rs.close

	rs_sql = "select * from survivor where unique_id = '"& UID &"' and is_dead = 0"
	rs.Open rs_sql, conn, 1, 2
i=1
	while not rs.eof
	response.flush

if rs("is_dead") = 0 Then
isdeadfalse = "checked=""checked"""
else
isdeadtrue =  "checked=""checked"""
end if
	
%>
<form id="form1" name="form1" method="post" action="profileinfo.asp?UID=<%=UID%>">
  <strong>Current Character/Player</strong> <br />
<table border="0">
  <tr>
    <td><strong>last_updated</strong></td>
    <td><input type="text" name="last_updated" id="last_updated" value="<%=rs("last_updated")%>" /></td>
  </tr>
  <tr>
    <td width="90"><strong>start_time</strong></td>
    <td>
      <input type="text" name="start_time" id="start_time" value="<%=rs("start_time")%>" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><strong>model</strong></td>
    <td><select name="model" id="model">
      <option <%If rs("model") = "Bandit1_DZ" then Response.Write " selected "%> value="Bandit1_DZ">Bandit</option>
      <option <%If rs("model") = "Camo1_DZ" then Response.Write " selected "%> value="Camo1_DZ">Camo</option>
      <option <%If rs("model") = "Camo1_DZ" then Response.Write " selected "%> value="Camo1_DZ">Camo</option>
      <option <%If rs("model") = "Rocket_DZ" then Response.Write " selected "%> value="Rocket_DZ">Soldier (Rocket)</option>
      <option <%If rs("model") = "Sniper1_DZ" then Response.Write " selected "%> value="Sniper1_DZ">Ghillie</option>
      <option <%If rs("model") = "Survivor2_DZ" then Response.Write " selected "%> value="Survivor2_DZ">Survivor</option>
      <option <%If rs("model") = "Survivor3_DZ" then Response.Write " selected "%> value="Survivor3_DZ">Survivor3?</option>
    </select></td>
  </tr>
  <tr>
    <td><strong>worldspace</strong></td>
    <td><input name="worldspace" type="text" id="worldspace" size="50" value="<%=rs("worldspace")%>"/></td>
  </tr>
  <tr>
    <td><strong>inventory</strong></td>
    <td>
      <textarea name="inventory" id="inventory" cols="45" rows="5" ><%=rs("inventory")%></textarea></td>
  </tr>
  <tr>
    <td><strong>backpack</strong></td>
    <td><textarea name="backpack" id="backpack" cols="45" rows="5" ><%=rs("backpack")%></textarea></td>
  </tr>
  <tr>
    <td><strong>medical</strong></td>
    <td><textarea name="medical" id="medical" cols="45" rows="5" ><%=rs("medical")%></textarea></td>
  </tr>
  <tr>
    <td><strong>is_dead</strong></td>
    <td><p>
          <label>
            <input type="radio" name="is_dead" value="0" id="is_dead_1" <%=isdeadfalse%> />
            Alive</label>
          <br />
            <label>
            <input type="radio" name="is_dead" value="1" id="is_dead_0" <%=isdeadtrue%> />
            Dead</label>
        </p></td>
  </tr>
  <tr>
    <td><strong>state</strong></td>
    <td><%=rs("state")%></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<input name="Update" type="submit" value="Save" />
</form>
  <%
i=i+1
	rs.movenext
	wend
	rs.close
%>
</div>