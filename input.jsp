<%@page pageEncoding="UTF-8"%>
<%@page import="javax.naming.Context" %>
<%@page import="javax.naming.InitialContext" %>
<%@page import="javax.sql.DataSource" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page import="org.sqlite.*" %>
<%@page import="org.json.*"%>
<%@include file="conn_f.jsp"%>
<%

response.setContentType("text/html;charset=utf-8");
request.setCharacterEncoding("utf-8");
//讓瀏覽器不要快取網頁
response.setHeader("Pragma","No-cache");           //HTTP/1.0
response.setHeader("Cache-Control","no-cache");    //HTTP/1.1
response.setDateHeader("Expires", 0);

%>

<html>
<head>
		<link rel=stylesheet type="text/css" href="css/input.css">
		<script src="js/jquery.js"></script>
		<script src="js/input.js"></script>

		<title>input</title>
</head>
<body>
	<h1>發表留言</h1>
	<hr>
		<div>
			<table id="form" width="40%" cellspacing="1" cellpadding="3">
					<tr>
							<td width="20%">使用者:</td>
							<td width="80%"><input type="text" id="user"></td>
					</tr>
					<tr>
							<td width="20%">主題ID:</td>
							<td><input type="text" id="subID" value="<%=application.getAttribute("subID")%>"></td>
					</tr>
					<tr>
							<td width="20%">留言內容：</td>
							<td width="80%"><textarea id="content" cols="45" rows="7"></textarea>
							</td>
					</tr>
					<tr>
							<td colspan="2">
									<div align="center">
											<input type="button" id="submit" value="發表">
											<input type="button" id="clear" value="重新填寫">
									</div>
							</td>
					</tr>
			</table>
		</div>
			<hr>

			<div>
				<input type="button" value="回首頁" onclick="window.open('index.jsp');">
			</div>


	</div>
</body>
</html>
