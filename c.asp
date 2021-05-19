<%@Language="VBScript" CODEPAGE="65001" %>

<% 

  Response.CharSet="utf-8"

  Session.codepage="65001"

  Response.codepage="65001"

  Response.ContentType="text/html;charset=utf-8"

%>
<html>

<head>
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>loading...</title>
</head>
<body>

    <%
        s_id=Request.Form("stdid")
        name1=Request.Form("name")
        gender1=Request.Form("gender")
        pnum1=Request.Form("pnum")
        birth1=Request.Form("birth")
    %>

    
    <%
        set db  = server.createobject("ADODB.Connection")
        db.open("DSN=sukji; UID=; PW=")


        sql = "insert into student values('" & s_id & "', '" & name1 & "', '" & gender1 & "', '" & pnum1 & "', '" & birth1 & "')"
        db.execute(sql)

        db.close
        response.redirect "b.asp"
    %>
    
</body>
</html>