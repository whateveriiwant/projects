<%@Language="VBScript" CODEPAGE="65001" %>

<% 

  Response.CharSet="utf-8"

  Session.codepage="65001"

  Response.codepage="65001"

  Response.ContentType="text/html;charset=utf-8"

%>


<html>
<head>
    <meta charset="UTF-8">
    <title>교과 우수상</title>

    <script language="javascript">
        function showPopup() { window.open("popup.html", "a", "width=400, height=300, left=100, top=50"); }
        </script>
</head>
<body>
    <table border="1">
        <tr>
            <td>분류id</td>
            <td>학년</td>
            <td>교과명</td>
            <td>학번</td>
            <td>이름</td>
            <td>원점수</td>
            <td>석차</td>
        </tr>

        <%
            set db=server.createobject("ADODB.Connection")
            db.open("DSN=sukji;UID=;PW=;")
            
            sql = "select * from subject"

            set rs = db.execute(sql)

            DO UNTIL rs.eof

                    response.Write "<tr>"
                    response.Write "<td>" & rs("분류id") & "</td>"
                    response.Write "<td>" & rs("학년") & "</td>"
                    response.Write "<td>" & rs("교과명") & "</td>"
                    response.Write "<td>" & rs("학번") & "</td>"
                    response.Write "<td>" & rs("이름") & "</td>"
                    response.Write "<td>" & rs("원점수") & "</td>" 
                    response.Write "<td>" & rs("석차") & "</td>" 
                    response.Write "</tr>"

            rs.movenext
            
            LOOP
            
            db.close
        %>

    </table>
    <input type="button" value="입력" onclick="showPopup()">
</body>
</html>