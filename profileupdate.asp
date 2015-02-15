<!--#include file="Connections/GreyZDB.asp" -->
<%

Set conn = Server.CreateObject("ADODB.Connection")
conn.Open DayZDB
Set rs = Server.CreateObject("ADODB.Recordset")
UID = Request.Querystring("UID")

n = Request.querystring("n")
h = Request.Querystring("h")

	rs_sql = "select * from profile where name = '"& n &"'"
	rs.Open rs_sql, conn, 1, 2
	If not rs.eof then
		rs("humanity") = h
		rs.Update
	End If
	rs.close
Response.Write "ok"
%>