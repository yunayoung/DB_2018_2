<%@ page language="java" 
    contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="java.sql.*"%>
<%
    request.setCharacterEncoding("euc-kr");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> Login_Check </title>
</head>
<body>
<% 
String value=request.getParameter("name");
//out.println(value);
//out.println(session.getAttribute("id") + " 님 개인정보");        
String strUserName = "dkelab";
String strPassword = "dkelab522";
String strConnectString = "jdbc:mysql://155.230.36.58:3306/test";
String DBMS_DRIVER_CLASS_NAME = "com.mysql.cj.jdbc.Driver";
Connection conn = null;

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

// sql 구사
try{

Statement st = conn.createStatement();



	
String sql = "SELECT Item_id, Iname, Regulated_price, Inum FROM ITEM WHERE Item_id ='"+value+"'";
ResultSet rs = st.executeQuery(sql);
String a=null;
while(rs.next()) {
	a=rs.getString(1);%>
	 <tr>
     <th>
         아이템넘버
     </th>
     <td>
         <%= rs.getString(1) %>
    
     </td>
     
 </tr>
  <tr>
     <th>
         아이템이름
     </th>
     <td>
         <%= rs.getString(2) %>
    
     </td>
     
 </tr>
  <tr>
     <th>
         가격
     </th>
     <td>
         <%= rs.getString(3) %>
    
     </td>
     
 </tr>
 
  <tr>
     <th>
         재고
     </th>
     <td>
         <%= rs.getString(4) %>
    
     </td>
     
 </tr>
 <form action ="Shoppingbag.jsp" method="post">
            	<br />
                <br />   <input type="hidden" value="<%=rs.getString(1) %>"  name="itemname" ><br>
                 <br />아이템 개수  <input type="text"   name="num" ><br>
             <input type="submit" value="장바구니에 넣기">
             </form>
 </br> <br /> <button onClick="location.href='ITEM.jsp'"> 뒤로가기 </button>
 
  </br>
   </br>
 <%
}


    

} catch (Exception e) {       
out.println("DB 연동 실패");
}  


%>
</body>
</html>