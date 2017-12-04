<%@page pageEncoding="UTF-8"%>
<%@page import="javax.naming.Context" %>
<%@page import="javax.naming.InitialContext" %>
<%@page import="javax.sql.DataSource" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.util.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.io.*"%>
<%@ page import="java.text.*" %>
<%@page import="java.sql.*" %>
<%@page import="org.sqlite.*" %>
<%@include file="conn_f.jsp"%>
<%@page import="org.json.*"%>
<%@page import="java.io.*,java.text.*"%>
<%
out.clear();//清除空白
response.setContentType("text/html;charset=utf-8");
request.setCharacterEncoding("utf-8");
//讓瀏覽器不要快取網頁
response.setHeader("Pragma","No-cache");           //HTTP/1.0
response.setHeader("Cache-Control","no-cache");    //HTTP/1.1
response.setDateHeader("Expires", 0);

%>

<head>
  <link rel=stylesheet type="text/css" href="css/d_newsub.css">
    <script src="js/display_newmsg.js"></script>
  <title>List</title>
</head>
<body>
  <h1>恭喜~成功留言</h1>
  <hr>
  <table>
        <thead>
            <tr>
                <th>留言ID</th>
                <th>使用者</th>
                <th>留言</th>
                <th>留言時間</th>
                <th>主題ID</th>
            </tr>
        </thead>
        <tbody>
<%

/*取得資料庫連線(固定格式)*/
    Connection conn = null;
    PreparedStatement pstmt=null;
    ResultSet rs = null;
    int subID = 0;

    //取得最後一個主題ID
    try{

        conn=getConnection();
        pstmt=conn.prepareStatement("SELECT * FROM msglist ORDER BY articleID DESC LIMIT 1"); //倒序排法限制長度1
        rs=pstmt.executeQuery();

        while(rs.next()) {
            out.println("<tr>");
            out.println("<td>" + rs.getString("articleID") + "</td>");
            out.println("<td>" + rs.getString("username") + "</td>");
            out.println("<td>" + rs.getString("message") + " </td>");
            out.println("<td>" + rs.getString("time") + "</td>");
            out.println("<td>" + rs.getString("subjectID") + "</td>");
            out.println("</tr>");
            subID = Integer.parseInt( rs.getString("subjectID") );
        }

        rs.close();
        pstmt.close();
      }
    catch( Exception e){
        throw e;

    }
    finally{
        if(conn!=null)conn.close();
    }
    /*---------------------------------*/
%>
    </tbody>
</table>
<br>
  <div class="btn">
    <input type="button" value="回留言列表" onclick="go_msglist(<%=subID%>)">
  </div>
</body>
