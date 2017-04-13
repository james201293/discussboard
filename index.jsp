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
		<link rel=stylesheet type="text/css" href="css/index.css">
		<script src="js/jquery.js"></script>
		<script src="js/angular.js"></script>
		<script src="js/index.js"></script>

		<title>discussboard</title>
</head>
<body>
	<h1>主題列表</h1>
	<hr>
	<div ng-app="myApp">
			<div ng-controller="subjectCtrl">
				<table>
					<tr>
						<th>主題ID</th>
						<th>討論主題</th>
						<th>建立者</th>
						<th>建立時間</th>
						<th>進入主題</th>
					</tr>
					<tr ng-repeat="x in subject">
						<td>{{x.SID}}</td>
						<td><b>{{x.subject}}</b></td>
						<td>{{x.founder}}</td>
						<td>{{x.time}}</td>
						<td><input type="button" value="GO" id="sendID" ng-click="sendID(x.SID)"></td>  <!--傳入主題ID-->
					</tr>
				</table>
			</div>



	</div>
</body>
</html>
