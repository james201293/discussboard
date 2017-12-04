<%@page pageEncoding="UTF-8"%>
<%@page import="javax.naming.Context" %>
<%@page import="javax.naming.InitialContext" %>
<%@page import="javax.sql.DataSource" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page import="org.sqlite.*" %>
<%@page import="org.json.*"%>
<%@page import="javax.json.JsonString"%>
<%@page import="javax.json.JsonObject"%>
<%@page import="javax.json.JsonReader"%>
<%@page import="javax.json.Json"%>
<%@include file="conn_f.jsp"%>
<%
out.clear();
response.setContentType("text/html;charset=utf-8");
request.setCharacterEncoding("utf-8");
//讓瀏覽器不要快取網頁
response.setHeader("Pragma","No-cache");           //HTTP/1.0
response.setHeader("Cache-Control","no-cache");    //HTTP/1.1
response.setDateHeader("Expires", 0);

%>


					<head>
						<link rel=stylesheet type="text/css" href="css/index.css">
							<title>MemberList</title>
					</head>
					<body>
						<h1>會員列表</h1>
						<hr>
						<table>
										<thead>
												<tr>
														<th>會員ID</th>
														<th>使用者名稱</th>
														<th>密碼</th>
														<th>會員等級</th>
												</tr>
										</thead>
									 <tbody>
								<%
								/*取得資料庫連線(固定格式)*/
										Connection conn = null;
										PreparedStatement pstmt=null;
										ResultSet rs = null;
										String selectmsg = "select * from member";

										try{
												conn=getConnection();
												pstmt=conn.prepareStatement(selectmsg);

												rs=pstmt.executeQuery();

												while (rs.next()) {
														out.println("<tr>");
														out.println("<td>" + rs.getString("memberID") + "</td>");
														out.println("<td>" + rs.getString("username") + "</td>");
														out.println("<td>" + rs.getString("password") + " </td>");
														out.println("<td>" + rs.getString("memberLV") + "</td>");
														out.println("</tr>");
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
							<input type="button" value="回首頁" onclick="window.open('index.jsp')">
						</div>
					</body>
