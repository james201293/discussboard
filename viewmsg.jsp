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
		<link rel=stylesheet type="text/css" href="css/viewmsg.css">
		<script src="js/jquery.js"></script>
		<script src="js/angular.js"></script>
		<script src="js/index.js"></script>
		<script src="js/viewmsg.js"></script>


		<title>discussboard</title>
</head>
<body>
	<h1>討論列表</h1>
	<hr>
	<div ng-app="myApp2" ng-controller="articleCtrl">

				<table>
					<tr>
						<th>留言ID</th>
						<th>使用者</th>
						<th>留言</th>
						<th>留言時間</th>
						<th>主題ID</th>
					</tr>
					<tr ng-repeat="x in msg">
						<td>{{x.AID}}</td>
						<td>{{x.uname}}</td>
						<td>{{x.msg}}</td>
						<td>{{x.time}}</td>
						<td>{{x.SID}}</td>
					</tr>
				</table>

	</div>
</body>
</html>
