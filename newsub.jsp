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
<%
	//抓現在日期時間
	Date da = new Date();
	//簡化日期格式
	SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
	String temp = ft.format(da);
%>

<%
				String user1=request.getParameter("user");
        String subname1=request.getParameter("subname");
        /*取得資料庫連線(固定格式)*/
            Connection conn = null;
            PreparedStatement pstmt=null;
            String sql="insert into subjectlist (subject,founder,time) values (?,?,?)";  //傳入使用者輸入的變數

            try{
                conn=getConnection();

                pstmt=conn.prepareStatement(sql);
								pstmt.setString(1, subname1);
								pstmt.setString(2, user1);
								pstmt.setString(3, temp);

                pstmt.executeUpdate(); //執行

                pstmt.close();

								JSONObject json = new JSONObject();
				  				json.put("exe_status", "新增主題成功");
									out.print(json);

            }
            catch( Exception e){
                throw e;

            }
            finally{
                if(conn!=null)conn.close();
            }
            /*---------------------------------*/
            %>
