<%@page pageEncoding="UTF-8"%>
<%@page import="javax.naming.Context" %>
<%@page import="javax.naming.InitialContext" %>
<%@page import="javax.sql.DataSource" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.util.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.io.*"%>
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

	      <%
					//Query String Parameter方法
					int index = Integer.parseInt(request.getParameter("subindex"));
					application.setAttribute("subID",index);
					//Payload方法
				  // 從 request 取出 JSON
					// int index=0;
					// String indexstr="";
					// JsonObject data=null;
					// //實作JsonReader把request丟進去
					// JsonReader jsonReader = Json.createReader(request.getReader());
					// try {
					// 			data = jsonReader.readObject();  //讀取Object
					// 			jsonReader.close();
					// 			indexstr=data.getString("subjectid");  //取得subjectid字串
					// 			index=Integer.parseInt(indexstr);
					// }
					// catch(Exception e){
					// 			throw e;
					// }


					%>
					<head>
							<script src="js/material.min.js"></script>
							<link rel="stylesheet" href="css/material.min.css">
							<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
						<link rel=stylesheet type="text/css" href="css/getmsg_print.css">
						<script src="js/jquery.js"></script>
						<script src="js/getmsg_print.js"></script>
						<title>List</title>
					</head>
					<body>
						<hr>
						<table>
									 <tbody>
								<%
								/*取得資料庫連線(固定格式)*/
										Connection conn = null;
										PreparedStatement pstmt = null;
										ResultSet rs = null;
										String selectmsg = "select * from msglist where subjectID =?";

										try{
												conn=getConnection();
												pstmt=conn.prepareStatement(selectmsg);
												pstmt.setInt(1, index);
												rs=pstmt.executeQuery();
												int count = 1 ;

												while (rs.next()) {

														out.println("<tr>");
															//out.println("<td class='msg_title'>樓數count");
															out.println("<td class='msg_title'>" + count + "</td>");
															//out.println("<td class='msg_title'>使用者</td>");
															out.println("<td id='user'>" + rs.getString("username") + " </td>");
															//out.println("<td class='msg_title'>主題名稱</td>");
															//out.println("<td class='msg_title'>" + rs.getString("subjectID") + "</td>");
															//out.println("<td class='time'>發表時間</td>");
															out.println("<td colspan='7'>" + rs.getString("message") + "</td>");
															out.println("<td class='time'>" + rs.getString("time") + "</td>");
														//out.println("</tr>");
														//out.println("<tr>");
															//out.println("<th class='msg_title'>留言內容</th>");

															//out.println("<td>"+"<input type='button' class='msg_delbtn' value='刪除' msgid='"+rs.getString("articleID")+"'></td>");

														out.println("</tr>");
														count++;
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
							<input type="button" value="我要留言" onclick="window.open('input.jsp')">
						</div>
					</body>
