<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"  import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>구매 내역 조회</title>
</head>
<body>
<% request.setCharacterEncoding("euc-kr");%>

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
         System.out.println("Success!_myorder");
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
        <b><font size="5" color="gray"><%=session.getAttribute("id") %>회원님의 구매내역 입니다. </font></b>
        <br><br>

	<%
		String query ="select b.bag_id, i.Iname,  p.Item_num, b.When_order "+ 
				"from BAG b,PUT_IN p,ITEM i,CUSTOMER CD "+ 
				"where CD.Customer_id = '"+session.getAttribute("id")+"' "+ 
				"and b.ordered='y' "+ 
				"and CD.Customer_id = b.Customer_id "+ 
				"and b.Bag_id=p.Bag_id "+ 
				"and b.Customer_id =p.Customer_id "+ 
				"and p.Item_id = i.Item_id"; 
		
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
	%>
		<table border = "1">
		<tr>
		<th>주문번호</th>
		<th>물품이름</th>
		<th>물품개수</th>
		<th>구매날짜</th>
		</tr>
	<% 
		int cnt = 0;
		String temp=null, pre=null;
		while (rs.next()) {
	%>
		<tr> 
		 <%
		 temp=rs.getString(1); ++cnt;
		 
		 if(cnt!=1 && temp.equals(pre)!=true){
			
				out.println("<tr>"+"</tr>");
				out.println("<tr>"+"</tr>");
				out.println("<tr>"+"</tr>");
				out.println("<tr>"+"</tr>");
				out.println("<tr>"+"</tr>");
			 }
		 
		 out.println("<td>"+temp+"</td>");
		 pre = temp;
		 %> 
		 <td> <%= rs.getString(2) %> </td>
		 <td> <%= rs.getString(3) %> </td>
		 <td> <%= rs.getString(4) %> </td>	
		</tr>
	<% 	}
		%>
		</table>
	
	<br>
	<input type="button" onclick="history.go(-1);" value="확인"> 

 
</body>
</html>