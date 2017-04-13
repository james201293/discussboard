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

	      <%
					//Query String Parameter方法
					//int index = Integer.parseInt(request.getParameter("msgindex"));

					//Payload方法
				  // 從 request 取出 JSON
					int index=2;
					String indexstr="";
					JsonObject data=null;
					//實作JsonReader把request丟進去
					JsonReader jsonReader = Json.createReader(request.getReader());
					try {
								data = jsonReader.readObject();  //讀取Object
								jsonReader.close();
								indexstr=data.getString("subjectid");  //取得subjectid字串
								index=Integer.parseInt(indexstr);
					}
					catch(Exception e){
								throw e;
					}

        /*取得資料庫連線(固定格式)*/
            Connection conn = null;
            PreparedStatement pstmt=null;
            ResultSet rs = null;
						String selectmsg = "select * from msglist where subjectID =?";

            try{
							JSONObject jsonResponse = new JSONObject();
							JSONArray Arr = new JSONArray();


              conn=getConnection();
              pstmt=conn.prepareStatement(selectmsg);


							pstmt.setInt(1, index);
							rs=pstmt.executeQuery();



						while (rs.next()){
							JSONObject row = new JSONObject();
							row.put("AID",rs.getString("articleID"));
              row.put("uname",rs.getString("username"));
              row.put("msg",rs.getString("message"));
              row.put("time",rs.getString("time"));
							row.put("SID",rs.getString("subjectID"));
              Arr.put(row);
            }

						jsonResponse.put("Responsemsg", Arr);

						out.clear();
						out.print(jsonResponse);
					  //System.out.print(jsonResponse);

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
