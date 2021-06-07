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
    <title>popup</title>
    <style>
        #center{
        text-align: center;
        margin: 0 auto;
        margin-top: 30px
    }

        input[type="submit"] {
            width: 330px;
            height: 30px;
    }
    </style>
    
</head>

<body>
    <%
        year1 = Request.Form("year")
        term1 = Request.Form("term")
    %>

    <%
        set db  = server.createobject("ADODB.Connection")
        db.open("DSN=dbs; UID=; PW=")

        
        sql = "select 교과명 from 교과정보 where 학년='" & year1 & "'" 
        
        set rs = db.execute(sql)  
    %>

    <form name="form1" action="bd.asp" method="POST">
        <table id="center">
            <tr>
                <td>학년도/학기</td> <td><input type="text" name="term2" value="<% Response.Write term1 %>"></td>
            </tr>
            <tr>
                <td>학년</td> <td><input type="text" name="year2" value="<% Response.Write year1 %>"></td>
            </tr>
            <tr>
                <td>교과명</td> <td>
                    <select name="subjectn">
                        <% DO UNTIL rs.eof
                            response.Write "<option value=" & rs("교과명") & ">" & rs("교과명") & "</option>" 
                            rs.movenext
                            LOOP
                        %>
                    </select>
                </td>
            </tr>
            <tr>
                <td>학번</td> <td><input type="text" name="number"></td>
            </tr>
            <tr>
                <td>이름</td> <td><input type="text" name="sname"></td>
            </tr>
            <tr>
                <td>원점수</td> <td><input type="text" name="score"></td>
            </tr>
            <tr>
                <td>석차</td> <td><input type="text" name="place"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="저장" width="100"></td>
            </tr>
        </table>
    </form>
    
</body>
</html>