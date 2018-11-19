<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Admin_page</title>
</head>
<body>
    <h1>관리자 페이지입니다</h1>
    <%
    String strUserName = "dkelab";
	  String strPassword = "dkelab522";
	 String strConnectString = "jdbc:mysql://155.230.36.58:3306/test";
	 String DBMS_DRIVER_CLASS_NAME = "com.mysql.cj.jdbc.Driver";
	 Connection conn = null;
	 ResultSet rs;
	 PreparedStatement pstmt;
	
		
		try {
			// Load a JDBC driver for Oracle DBMS
			Class.forName(DBMS_DRIVER_CLASS_NAME);
			// Get a Connection object 
			System.out.println("Success!");
		}catch(ClassNotFoundException e) {
			System.err.println("error = " + e.getMessage());
			System.exit(1);
		}
		
		      try{

		       conn = DriverManager.getConnection(strConnectString,strUserName, strPassword);
		      }catch (SQLException ex) {
		    	  System.err.println("Cannot get a connection: " + ex.getMessage());
					System.exit(1);
		      }
    %>
   <h4>-------------매출--------------</h4>
    <%
    String query="select I.Soldnum*Regulated_price from ITEM I";
    pstmt=conn.prepareStatement(query);
    rs= pstmt.executeQuery();
    
    out.println("<table border = \"1\">");
    ResultSetMetaData rsmd =rs.getMetaData();
  
	int sum=0;
    while(rs.next()){
    	sum+=Integer.parseInt(rs.getString(1));
    	}
    out.println("<tr>");
	out.println("<td>"+String.valueOf(sum)+"</td>");  
	out.println("</tr>");
    out.println("</table>");
    %>
     
    
</body>
</html>