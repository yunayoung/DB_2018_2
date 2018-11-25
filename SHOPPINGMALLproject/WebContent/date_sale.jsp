<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> 일별 결과 </title>
</head>
<body>
<%
request.setCharacterEncoding("euc-kr"); 

String search_date = request.getParameter("date");
System.out.println(search_date);

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

        <font color="blue"><%=search_date %></font> 매출
        <br><br>
<%
   int total=0;
   String query=
               "select i.Item_id as ITEM_ID,count(*)*i.Regulated_price as Total_PRICE "+
              "from BAG b,PUT_IN p,ITEM i "+
             "where b.ordered = 'y' "+
             "and b.When_order= '"+ search_date+"' "+
             "and b.Bag_id=p.Bag_id "+
             "and b.Customer_id = p.Customer_id "+
             "and p.Item_id = i.Item_id "+
             "group by i.Item_id ";

   pstmt = conn.prepareStatement(query);
   rs = pstmt.executeQuery();

   while (rs.next()) {
      rs.getString(1);
      total += Integer.parseInt(rs.getString(2));
   }

%>   
    <table border='1'>
    <tr><th> <%=search_date%> 매출 </th> </tr>
    <tr><td> <%=total %> 원 </td> </tr>
     </table>     
       <br>
        <input type="button" onclick = "history.go(-1);" value="확인">
       
    </div>
</body>
</html>