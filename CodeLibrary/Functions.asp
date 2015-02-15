<%

 ' ########################   Remote Execute file   ##########################

Function ExecuteRemoteFile(remotefile)
Set oFSO = Server.CreateObject("Scripting.FileSystemObject")
if oFSO.FileExists(remotefile) = true then
	  sContents = oFSO.OpenTextFile(remotefile).ReadAll
	  Set oFSO = Nothing
	  sContents = Replace (sContents, "<" & "%", "")
	  sContents = Replace (sContents, "%" & ">", "")
	  Execute sContents
End if
End Function


' ########################## GET DAYS /Months / Years   ##################################
Function StringFromDays(thedays)
thecount = 0
		While Int(thedays) >= 365
		thedays = Int(thedays-365)
		'Response.Write("<BR> THEN " & thedays)
		thecount = Int(thecount+1)
		thescriptY = thecount & " year"
		If thecount > 1 Then
		thescriptY = thescriptY & "s "
		Else
		thescriptY = thescriptY & " " 
		End If
		'thedays = thedays mod 365
		Wend
		thecount = 0
		While Int(thedays) >= 30
		thedays = Int(thedays-30)
		'Response.Write("<BR> THEN " & thedays)
		thecount = thecount+1
		thescriptM = thecount & " month" 
		If thecount > 1 Then
		thescriptM = thescriptM & "s "
		Else
		thescriptM = thescriptM & " " 
		End If
		Wend
		thecount = 0
		While Int(thedays) >= 1
		thedays = Int(thedays-1)
		'Response.Write("<BR> THEN " & thedays)
		thecount = thecount+1
		thescriptD = thecount & " day" 
		If thecount > 1 Then
		thescriptD = thescriptD & "s "
		Else
		thescriptD = thescriptD & " " 
		End If
		Wend
	StringFromDays = (thescriptY & " " & thescriptM & " " & thescriptD)
End Function

' ########################## CALL WEB WITH QUERYSTRING / GET ############################
Function WebGET(SendString)
	If CreateXMLHTTP(objXMLHTTP, objErr) Then
On Error Resume Next
		objXMLHTTP.Open "GET",  SendString, False
		objXMLHTTP.Send 
		strResponse = objXMLHTTP.responseText
		WebGet = strResponse
	Else
		Response.Write("This function requires an internet connection . Please Call Tech Support")
		'Response.End
	End If
End Function
' ########################## CALL WEB WITH FORM / POST ############################
Function WebPOST(StrURL,IncomingData)
On Error Resume Next
'Server.ScriptTimeout = 2

	strData = IncomingData
	  if CreateXMLHTTP(objXmlHttp, objErr) then
		objXMLHTTP.Open "POST", strURL & "", False
	  else
	  end if
		objXMLHTTP.setRequestHeader "Content-Type", "application/x-www-form-urlencoded"
		objXMLHTTP.Send(strData)
		strResponse = objXMLHTTP.responseText
	
WebPOST = strResponse
End Function
' ########################## CREATE XML HTTP  ############################
function CreateXMLHTTP(byref obj, byref ErrObj)
  
  On Error Resume Next
  Set obj = Server.CreateObject("MSXML2.ServerXMLHTTP.4.0")
  If (Err) Then
  	Err.Clear
  	Set obj = Server.CreateObject("MSXML2.ServerXMLHTTP.3.0")
  End If 
  If (Err) Then 
  	Err.Clear
  	Set obj = Server.CreateObject("MSXML2.ServerXMLHTTP")
  End If 
  If (Err) Then
  	Err.Clear
  	Set obj = Server.CreateObject("Microsoft.XMLHttp") 
  End If 
  If (Err) Then
    Set ErrObj = err
    Err.Clear 
    CreateXMLHTTP = false
    Exit function 
  End if 
  on error resume next
  obj.setTimeouts 0,5*60*1000,5*60*1000,5*60*1000	'set timeouts to 5 minutes
  if (Err) Then
    Set ErrObj = err
    CreateXMLHTTP = False
  else
    CreateXMLHTTP = True 
  end if
End function



' ########################## Get RandomNumber ############################
Function RandomNumber()
Randomize
dim NumberInclude1, NumberInclude2, NumberInclude3, varDate
if Request.ServerVariables("HTTP_X_FORWARDED_FOR") <> "" then
 ip = Request.ServerVariables("HTTP_X_FORWARDED_FOR")
else
 ip = Request.ServerVariables("REMOTE_ADDR")
end if
ip = Replace(ip, ".", "")
varDate = Replace(Now(), "/", "")
varDate = Replace(varDate, " ", "")
varDate = Replace(varDate, ":", "")
varDate = Replace(varDate, "AM", "")
varDate = Replace(varDate, "PM", "")
RandomMath1 = (Rnd() * 1000000)
RandomMath2 = Sqr(RandomMath1)
RandomMath3 = Round(1000000 * (RandomMath1 * RandomMath2))
RandomNumber = (RandomMath3)
End Function 


%>