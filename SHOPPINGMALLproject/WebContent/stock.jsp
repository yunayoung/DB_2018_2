<%@ page language="java" contentType="text/html; charset=EUC-KR"
   	import="java.sql.*"  pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> 재고 처리  </title>
</head>
<body>
<%
request.setCharacterEncoding("euc-kr"); 

String id = request.getParameter("item_id");
String num = request.getParameter("item_num");

System.out.println(id);
System.out.println(num);

%>

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

        <br><br>
        <b><font size="5" color="gray">재고확보하였습니다.</font></b>
        <br><br>
        <font color="blue"><%=id %></font> 재고 상황
        <br><br>
<%        
        String query="select Inum, Iname "+
					 "from ITEM "+
				 	 "where Item_id = '" +id+"'";
		pstmt=conn.prepareStatement(query);
		rs= pstmt.executeQuery();
 
		out.println("<table border = \"1\">");
 
		out.println("<th>"+"현재 물품 재고"+"</th>");
		out.println("<th>"+"물품 정보"+"</th>");
	 
		int temp=0;
		while(rs.next()){
		
		out.println("<tr>");
		temp=Integer.parseInt(rs.getString(1));
		out.println("<td>"+temp+"</td>");
		out.println("<td>"+rs.getString(2)+"</td>");
		out.println("</tr>");
		}
		
		temp+=Integer.parseInt(num);
		 	
	    query="UPDATE ITEM "+
  	    "SET Inum = "+String.valueOf(temp)+" WHERE Item_id = '"+id+"'";
     	
	    pstmt.executeUpdate(query);   
	   
	 		query="select Inum, Iname "+
				 "from ITEM "+
			 	 "where Item_id = '" +id+"'";
			pstmt=conn.prepareStatement(query);
			rs= pstmt.executeQuery();
		
			out.println("<th>"+"물품 확보 재고"+"</th>");
			out.println("<th>"+"물품 정보"+"</th>");
			
			while(rs.next()){
	        out.println("<tr>");
			out.println("<td>"+rs.getString(1)+"</td>");
			out.println("<td>"+rs.getString(2)+"</td>");
			out.println("</tr>");
			}
			
		out.println("</table>");		
	    
		%>        
       <br>
        <input type="button" onClick="location.href='admin.jsp'" value="확인">
  
    </div>

    
</body>
</html>