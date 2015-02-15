<%
VarIP = Request.ServerVariables("REMOTE_ADDR")
If VarIP = "192.168.1.1" or _
    VarIP = "127.0.0.1" or _
    VarIP = "::1" _
Then
    Session("user") = "Allow"
Else
Response.Redirect("http://www.google.com")
End If

If Session("user") = "" Then
Response.Write "status:ok"
Response.End
End If

DayZDB = "DRIVER={MySQL ODBC 5.1 Driver}; SERVER=localhost;  PORT=3306; DATABASE=dayz; UID=groot;PASSWORD=c@ndayz@pple; OPTION=3"

%>
<!--#include file="../CodeLibrary/Functions.asp" -->