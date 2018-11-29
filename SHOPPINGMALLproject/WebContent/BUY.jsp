<%@ page language="java" 
    contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" 
    import="java.sql.*"%>
<%
    request.setCharacterEncoding("euc-kr");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
</br>구매 처리 페이지
<% 
String value=request.getParameter("bagnumber");
int bagnumber1=Integer.parseInt(value);
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
	      Statement st = conn.createStatement();


	try{
		int bagnumber=Integer.parseInt(value);
		System.out.println(value);
		System.out.println(bagnumber);
		String sql="SELECT Shipping_id from BAG where Bag_id="+bagnumber+" AND Customer_id ='"+session.getAttribute("id")+"'"; 
		ResultSet rs= st.executeQuery(sql);
		//select Shipping_id from BAG where Bag_id =1 and customer_id ='1234';

		System.out.println("1");
		int shippingid=0;
		while(rs.next())
		{
			shippingid=Integer.parseInt(rs.getString(1));
		}
		sql="START TRANSACTION";
		 rs=st.executeQuery(sql);
		sql = "SELECT Item_id, Item_num from PUT_IN where Bag_id IN(select Bag_id from BAG where Ordered='n' and Customer_id='"+session.getAttribute("id")+"')and Customer_id='"+session.getAttribute("id")+"'";
		rs= st.executeQuery(sql);
		System.out.println("2");
		//ResultSet ps;
		String []name= new String [100];
			int []buynum= new int [100];
			int how =1;
		while(rs.next())
		{
			
			name[how] = rs.getString(1);
			buynum[how]=rs.getInt(2);
		 	how++;
			
		}
		how--;
		//sql="LOCK TABLES ITEM READ";
		//st.executeUpdate(sql);
	
		while(how>0)
		{
		// 재고량 각각	찾기
		sql="SELECT Inum, Soldnum from ITEM where Item_id='"+name[how]+"'";
		 rs=st.executeQuery(sql);
		System.out.println("3");
		int Inum=0;
		int Soldnum=0;
		while(rs.next())
		{	
			
			
			
			Inum=rs.getInt(1);
			Soldnum=rs.getInt(2);
			
			
			
		}
		
		Inum=Inum-buynum[how];
		
		Soldnum=Soldnum + buynum[how];
		if(Inum<0)
		{
			
			sql="DELETE FROM PUT_IN WHERE Customer_id ='"+ session.getAttribute("id")+"' AND Bag_id = '"+bagnumber1+"'";
	  			st.executeUpdate(sql);
	  			sql="commit";
	  			 rs=st.executeQuery(sql);
	  			%>
	    	 <script> alert("재고가 부족합니다"); response.sendRedirect("main.jsp");  </script>
	            <br /> <button onClick="location.href='main.jsp'"> 상품 재고가 부족합니다 다시 구매해주세요 확인</button>
		<% 
		System.out.println("finish");
		return; 
		}
		//sql="UNLOCK TABLES";
		//st.executeUpdate(sql);
		//sql="LOCK TABLES ITEM WRITE";
		//st.executeUpdate(sql);
		sql="UPDATE ITEM SET Inum = "+Inum+" where Item_id = '"+name[how]+"'";
		//UPDATE ITEM SET Inum=20 where Item_id ='W836-0731';

		  st.executeUpdate(sql);
		System.out.println("4");
		sql="UPDATE ITEM SET Soldnum = "+Soldnum+" where Item_id = '"+name[how]+"'";
		  st.executeUpdate(sql);
		
	
		System.out.println("4");
		//sql="UNLOCK TABLES";
		//st.executeUpdate(sql);
		how--;
		}
		  sql="commit";
		  st.executeUpdate(sql);
		System.out.println("나가");
		sql="UPDATE BAG SET ordered = 'y'  where bag_id = "+bagnumber+" AND customer_id ='"+ session.getAttribute("id")+"'";
		//UPDATE BAG SET ordered = 'n'  WHERE customer_id ='1234' AND bag_id =1;
		st.executeUpdate(sql);
		System.out.println("5");
		sql="UPDATE BAG SET When_order = DATE_ADD(NOW(), INTERVAL -0 MONTH)  where Bag_id ="+bagnumber+" AND customer_id='"+ session.getAttribute("id")+"'";
		//UPDATEBAG SET when_order = DATE_ADD(NOW(), INTERVAL -0 MONTH)  WHERE customer_id ='1234' AND bag_id =1;

		st.executeUpdate(sql);
		System.out.println("5");
		int newbagnum = bagnumber+1;
		sql="INSERT INTO BAG VALUES("+newbagnum+",0,'n',NULL,'"+session.getAttribute("id")+"',"+shippingid+")";
		st.executeUpdate(sql);
		System.out.println("6");
 

	      } catch (Exception e) {
	    	  
	    	  	String sql="DELETE FROM PUT_IN WHERE Customer_id ='"+ session.getAttribute("id")+"' AND Bag_id = '"+bagnumber1+"'";
	  			st.executeUpdate(sql);
	    	    %> <script> alert("해당 상품의 재고가 부족합니다 다시 구매해주세요"); response.sendRedirect("main.jsp");</script> <%
	    	  return;
	      }  
%>
   <br /> <button onClick="location.href='main.jsp'"> 구매 완료 확인</button>
    
</body>
</html>