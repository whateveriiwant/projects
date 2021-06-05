<%@Language="VBScript" CODEPAGE="65001" %>

<% 

  Response.CharSet="utf-8"

  Session.codepage="65001"

  Response.codepage="65001"

  Response.ContentType="text/html;charset=utf-8"

%>

<html>
<head>
    <title>Loading...</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body>
    <%
        sort1=Request.Form("sort")
        syear1=Request.Form("syear")
        sub1=Request.Form("sub")
        number1=Request.Form("number")
        sname1=Request.Form("sname")
        score1=Request.Form("score")
        place1=Request.Form("place")
    %>

    <%
        set db  = server.createobject("ADODB.Connection")
        db.open("DSN=sukjimanghera; UID=; PW=")


        sql = "insert into 교과우수상 values('" & sort1 & "', '" & syear1 & "', '" & sub1 & "', '" & number1 & "', '" & sname1 & "', '" & score1 & "', '" & place1 & "')"
        db.execute(sql)

        db.close
        response.redirect "result.html"
    %>
</body>
</html>